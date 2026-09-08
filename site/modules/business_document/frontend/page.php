<?php
/*
 * Business Documents - live page output
 * Supports:
 *   /business_document/{type}/{name}              (clean — preferred)
 *   /business_document.page/{type}/{name}
 *   /business_document.page/type_slug/.../name_slug/...
 *   /business_document.page/utp_id/123
 *
 * Access / Status rules:
 *   Draft  → not published for public visitors (staff can preview when logged in)
 *   Live + Public    → open without login
 *   Live + Internal  → login required
 */

$type_slug = trim($fwRequest->getParam('type_slug', ''));
$name_slug = trim($fwRequest->getParam('name_slug', ''));
$utp_id = (int)$fwRequest->getParam('utp_id', 0);

/* Clean SEF URLs are not key/value pairs, so read type + name from the path */
if (($type_slug === '' || $name_slug === '') && $utp_id <= 0) {
	$uri = '';
	if (!empty($_SERVER['REDIRECT_URL'])) {
		$uri = $_SERVER['REDIRECT_URL'];
	} elseif (!empty($_SERVER['REQUEST_URI'])) {
		$uri = $_SERVER['REQUEST_URI'];
	}
	$uri = preg_replace('/\?.*$/', '', $uri);
	$uri = trim($uri, '/');

	if (preg_match('#(?:^|/)(?:url_table|business_document)(?:\.page)?(?:/(.*))?$#i', $uri, $m)) {
		$rest = isset($m[1]) ? trim($m[1], '/') : '';
		$segs = ($rest === '') ? array() : explode('/', $rest);

		if (count($segs) >= 4 && $segs[0] === 'type_slug' && $segs[2] === 'name_slug') {
			$type_slug = rawurldecode($segs[1]);
			$name_slug = rawurldecode($segs[3]);
		} elseif (count($segs) >= 2 && $segs[0] === 'utp_id') {
			$utp_id = (int)$segs[1];
		} elseif (count($segs) >= 2) {
			$type_slug = rawurldecode($segs[0]);
			$name_slug = rawurldecode($segs[1]);
		}
	}
}

$row = null;

/* Find the page - first try by id, then by the slug pair */
if ($utp_id > 0) {
	$row = $fwDb->queryOne(
		"SELECT p.*, t.utt_name, t.utt_slug, u.user_name AS created_by_name
		 FROM url_table_pages p
		 LEFT JOIN url_table_types t ON t.utt_id = p.utp_type_id
		 LEFT JOIN users u ON u.user_id = p.utp_created_by
		 WHERE p.utp_id = " . (int)$utp_id
	);
} elseif ($type_slug !== '' && $name_slug !== '') {
	$row = $fwDb->queryOne(
		"SELECT p.*, t.utt_name, t.utt_slug, u.user_name AS created_by_name
		 FROM url_table_pages p
		 LEFT JOIN url_table_types t ON t.utt_id = p.utp_type_id
		 LEFT JOIN users u ON u.user_id = p.utp_created_by
		 WHERE t.utt_slug = '" . addslashes($type_slug) . "'
		   AND p.utp_slug = '" . addslashes($name_slug) . "'"
	);
}

header('Content-Type: text/html; charset=utf-8');

/* Nothing found */
if (empty($row['utp_id'])) {
	echo '<!DOCTYPE html><html><head><meta charset="utf-8"><title>Not Found</title></head><body>';
	echo '<p style="font-family:Arial,sans-serif;padding:40px;">This URL was not found.</p>';
	echo '</body></html>';
	exit;
}

$access = (!empty($row['utp_access']) && $row['utp_access'] === 'public') ? 'public' : 'internal';
$status = (!empty($row['utp_status']) && $row['utp_status'] === 'live') ? 'live' : 'draft';
$loggedIn = !empty($_SESSION['user']['user_id']);

/* Draft: only logged-in staff may preview; visitors see "not published" */
if ($status !== 'live') {
	if (!$loggedIn) {
		echo '<!DOCTYPE html><html><head><meta charset="utf-8"><title>Not Published</title></head><body>';
		echo '<p style="font-family:Arial,sans-serif;padding:40px;">This page is not published yet.</p>';
		echo '</body></html>';
		exit;
	}
}

/* Live + Internal: login required */
if ($status === 'live' && $access === 'internal' && !$loggedIn) {
	$fwAuthGroup->forceLogin();
}

$title = htmlspecialchars($row['utp_name'], ENT_QUOTES, 'UTF-8');
$path = htmlspecialchars($row['utp_path'], ENT_QUOTES, 'UTF-8');
$html = $row['utp_html'];

/* URL created but HTML not added yet */
if (trim((string)$html) === '') {
	$edit_url = BASE_URL . 'business_document.edit/utp_id/' . (int)$row['utp_id'];
	$html = '<p style="font-family:Arial,sans-serif;padding:20px;color:#666;">This page has been created, but HTML content has not been added yet.<br><br><a href="' . htmlspecialchars($edit_url, ENT_QUOTES, 'UTF-8') . '">Add HTML now</a></p>';
} else {
	/* CKEditor 5 tables use <figure class="table"> + CSS classes; live page has no CK CSS */
	$html = business_document_make_tables_visible($html);
	$html = business_document_strip_word_abs_images($html);
	if (function_exists('gcons_replace_merge_fields') && function_exists('gcons_merge_field_values')) {
		$creator = !empty($row['created_by_name']) ? $row['created_by_name'] : '';
		$html = gcons_replace_merge_fields($html, gcons_merge_field_values(array(
			'documentName' => isset($row['utp_name']) ? $row['utp_name'] : '',
			'staffName' => $creator,
			'department' => isset($row['utp_department']) ? $row['utp_department'] : '',
		)));
	}
}

/* Render-time table of contents: h1/h2/h3 in page source (not the editor) */
$tocNav = '';
if (trim((string)$html) !== '') {
	$toc = business_document_apply_toc($html);
	$html = $toc['html'];
	$tocNav = business_document_toc_nav($toc['headings']);
}

$metaBits = array();
if (!empty($row['utt_name'])) {
	$metaBits[] = $row['utt_name'];
}
$metaBits[] = $path;
if (!empty($row['utp_department'])) {
	$metaBits[] = $row['utp_department'];
}
if (!empty($row['created_by_name']) && $row['created_by_name'] !== '—') {
	$metaBits[] = $row['created_by_name'];
}
if ($status !== 'live') {
	$metaBits[] = 'Draft preview';
} else {
	$metaBits[] = 'Live';
}
if ($access === 'internal') {
	$metaBits[] = 'Internal';
} else {
	$metaBits[] = 'Public';
}
if (!empty($row['utp_updated_at'])) {
	$ts = strtotime($row['utp_updated_at']);
	if ($ts) {
		$metaBits[] = 'Updated ' . date('d/m/Y', $ts);
	}
}

$hasToc = ($tocNav !== '');
$shellClass = $hasToc ? 'url-page-shell url-page-shell-toc' : 'url-page-shell';

echo '<!DOCTYPE html>' . "\n";
echo '<html lang="en"><head><meta charset="utf-8" />';
echo '<meta name="viewport" content="width=device-width, initial-scale=1" />';
echo '<title>' . $title . '</title>';
echo '<link rel="stylesheet" href="https://cdn.ckeditor.com/ckeditor5/48.4.0/ckeditor5.css" />';
echo '<style>
body{margin:0;padding:0;background:#fff;color:#222;}
body>img,body>figure,html>img,html>figure{display:none!important;}
.url-page-shell{max-width:none;width:100%;box-sizing:border-box;margin:0;padding:24px 28px 60px;}
.url-page-shell-toc{max-width:none;}
.url-page-shell>:not(.url-page-meta):not(.url-page-layout){display:none!important;}
.url-page-meta{font-family:Arial,Helvetica,sans-serif;font-size:12px;color:#888;margin:0 0 18px;padding:0 0 8px;border-bottom:1px solid #eee;display:block;width:100%;background:#fff;position:relative;z-index:5;}
.url-page-layout{display:block;clear:both;}
.url-page-layout>:not(.url-page-toc):not(.url-page-body){display:none!important;}
.url-page-shell-toc .url-page-layout{display:flex;gap:28px;align-items:flex-start;}
.url-page-toc{font-family:Arial,Helvetica,sans-serif;width:260px;flex-shrink:0;position:sticky;top:16px;max-height:calc(100vh - 32px);overflow:auto;border:1px solid #e5e7eb;background:#f8fafc;padding:12px 14px 16px;box-sizing:border-box;}
.url-page-toc-title{font-size:13px;font-weight:700;color:#163c6d;margin:0 0 10px;letter-spacing:.02em;}
.url-page-toc ol{margin:0;padding:0 0 0 18px;}
.url-page-toc li{margin:5px 0;font-size:13px;line-height:1.35;}
.url-page-toc a{color:#163c6d;text-decoration:none;}
.url-page-toc a:hover{text-decoration:underline;}
.url-page-body{min-width:0;flex:1;}
.url-page-body-inner{overflow-x:visible;overflow-y:visible;max-width:100%;}
.url-page-body .ck-content,.url-page-body .WordSection1{max-width:100%;}
.url-page-body figure.table,.url-page-body .ck-content .table{display:table;margin:.9em auto;max-width:100%;width:auto;}
.url-page-body figure.table>table,.url-page-body .ck-content .table>table{margin:0;}
.url-page-body table{border-collapse:collapse;width:auto;max-width:100%;min-width:0;box-sizing:border-box;border:1px solid #000;margin-left:auto;margin-right:auto;}
.url-page-body th,.url-page-body td{border:1px solid #000;box-sizing:border-box;width:auto!important;height:auto;white-space:normal;word-break:break-word;overflow-wrap:anywhere;}
.url-page-body img{max-width:100%;height:auto;}
.url-page-body img[src=""],.url-page-body img[src="undefined"],.url-page-body img:not([src]){display:none!important;}
.url-page-body span[style*="position:absolute"]:has(> img){display:none!important;}
.url-page-shell>img,.url-page-shell>figure,.url-page-layout>img,.url-page-layout>figure{display:none!important;}
.url-page-body .gcons-merge-field,.url-page-body .ck-merge-field,.url-page-body merge-field{display:inline;border:1px solid #7eb6ff;border-radius:3px;padding:1px 5px;background:#f3f8ff;color:#1e3a5f;line-height:1.4;white-space:nowrap;box-decoration-break:clone;-webkit-box-decoration-break:clone;}
.url-page-body h1,.url-page-body h2,.url-page-body h3{scroll-margin-top:12px;}
.url-page-body a{color:#1d4ed8;text-decoration:underline;}
.url-page-body a:hover{color:#1e3a8a;}
@media(max-width:900px){
.url-page-shell-toc .url-page-layout{display:block;}
.url-page-toc{position:static;width:auto;max-height:none;margin-bottom:20px;}
}
@media print{
.url-page-toc{position:static;max-height:none;page-break-after:always;}
}
</style>';
echo '</head><body><div class="' . $shellClass . '">';
echo '<div class="url-page-meta">' . htmlspecialchars(implode(' · ', $metaBits), ENT_QUOTES, 'UTF-8') . '</div>';
echo '<div class="url-page-layout">';
if ($hasToc) {
	echo $tocNav;
}
echo '<div class="url-page-body"><div class="url-page-body-inner ck-content">' . $html . '</div></div>';
echo '</div></div>';
echo '<script>
(function(){
	var nodes=document.querySelectorAll("img,figure.image");
	for(var i=0;i<nodes.length;i++){
		var el=nodes[i];
		if(el.closest&&el.closest(".url-page-body")){continue;}
		el.style.display="none";
	}
	var root=document.querySelector(".url-page-body-inner");
	if(!root){return;}
	var re=/\{\{[^{}]+\}\}/g;
	var texts=[];
	var walk=document.createTreeWalker(root,NodeFilter.SHOW_TEXT,null,false);
	while(walk.nextNode()){texts.push(walk.currentNode);}
	for(var t=0;t<texts.length;t++){
		var node=texts[t];
		var p=node.parentNode;
		if(!p||!node.nodeValue||!re.test(node.nodeValue)){continue;}
		re.lastIndex=0;
		if(p.classList&&(p.classList.contains("gcons-merge-field")||p.classList.contains("ck-merge-field"))){continue;}
		var parts=node.nodeValue.split(re);
		var matches=node.nodeValue.match(re)||[];
		var frag=document.createDocumentFragment();
		for(var j=0;j<parts.length;j++){
			if(parts[j]){frag.appendChild(document.createTextNode(parts[j]));}
			if(j<matches.length){
				var box=document.createElement("span");
				box.className="gcons-merge-field";
				box.appendChild(document.createTextNode(matches[j]));
				frag.appendChild(box);
			}
		}
		p.replaceChild(frag,node);
	}
})();
</script>';
echo '</body></html>';
exit;

/**
 * Keep tables visible outside the editor (borders).
 * Do not unwrap figure.table — that wrapper holds left/center/right alignment.
 */
function business_document_make_tables_visible($html)
{
	if ($html === null || $html === '') {
		return $html;
	}

	$html = preg_replace_callback(
		'/<table(\s[^>]*)?>/i',
		function ($m) {
			$attrs = isset($m[1]) ? $m[1] : '';
			if (stripos($attrs, 'border=') === false) {
				$attrs .= ' border="1"';
			}
			if (stripos($attrs, 'cellpadding=') === false) {
				$attrs .= ' cellpadding="4"';
			}
			if (stripos($attrs, 'cellspacing=') === false) {
				$attrs .= ' cellspacing="0"';
			}
			if (preg_match('/style\s*=\s*(["\'])(.*?)\1/i', $attrs)) {
				$attrs = preg_replace_callback(
					'/style\s*=\s*(["\'])(.*?)\1/i',
					function ($sm) {
						$style = $sm[2];
						/* Word turns the outer table line off; keep cell widths, restore the box */
						$style = preg_replace('/\bborder-style\s*:\s*none\s*;?/i', '', $style);
						$style = preg_replace('/\bborder-width\s*:\s*0(?:px)?\s*;?/i', '', $style);
						if (!preg_match('/\bborder\s*:/i', $style) && !preg_match('/\bborder-width\s*:/i', $style)) {
							$style = rtrim($style, " \t;") . ';border:1px solid #000';
						}
						if (stripos($style, 'border-collapse') === false) {
							$style = rtrim($style, " \t;") . ';border-collapse:collapse';
						}
						/* Word uses margin-left in pt; the editor still shows those tables centred */
						if (!preg_match('/\bfloat\s*:\s*(left|right)/i', $style)
							&& preg_match('/\bmargin-left\s*:\s*[\d.]+pt/i', $style)
							&& !preg_match('/\bmargin-left\s*:\s*auto/i', $style)
						) {
							$style = preg_replace('/\bmargin-left\s*:[^;]+;?/i', '', $style);
							$style = preg_replace('/\bmargin-right\s*:[^;]+;?/i', '', $style);
							$style = rtrim($style, " \t;") . ';margin-left:auto;margin-right:auto';
						}
						return 'style=' . $sm[1] . $style . $sm[1];
					},
					$attrs
				);
			} else {
				$attrs .= ' style="border-collapse:collapse;border:1px solid #000;"';
			}
			return '<table' . $attrs . '>';
		},
		$html
	);

	$html = preg_replace_callback(
		'/<(td|th)(\s[^>]*)?>/i',
		function ($m) {
			$tag = $m[1];
			$attrs = isset($m[2]) ? $m[2] : '';
			$cellStyle = 'border:1px solid #000;padding:4px;';
			if (stripos($attrs, 'style=') === false) {
				$attrs .= ' style="' . $cellStyle . '"';
			} elseif (stripos($attrs, 'border:') === false && stripos($attrs, 'border-width') === false) {
				$attrs = preg_replace_callback(
					'/style\s*=\s*(["\'])(.*?)\1/i',
					function ($sm) use ($cellStyle) {
						$style = rtrim($sm[2], ';') . ';' . $cellStyle;
						return 'style=' . $sm[1] . $style . $sm[1];
					},
					$attrs
				);
			}
			return '<' . $tag . $attrs . '>';
		},
		$html
	);

	return $html;
}

/**
 * Word paste wraps extra header/shape pictures in position:absolute spans.
 * Those copies sit on the path or on OFFICIAL. The real logo stays inline.
 * Display only — does not write back to the database.
 */
function business_document_strip_word_abs_images($html)
{
	if ($html === null || $html === '') {
		return $html;
	}

	return preg_replace(
		'/<span\b(?=[^>]*\bstyle\s*=\s*(["\'])[^"\']*position\s*:\s*absolute)[^>]*>\s*<img\b[^>]*>\s*<\/span>/is',
		'',
		$html
	);
}

/**
 * Assign stable heading IDs and collect h1/h2/h3 for a nested ToC.
 * Does not write back to the database.
 */
function business_document_heading_slug($text)
{
	$text = html_entity_decode((string)$text, ENT_QUOTES, 'UTF-8');
	$text = strtolower(trim($text));
	if (function_exists('iconv')) {
		$ascii = @iconv('UTF-8', 'ASCII//TRANSLIT//IGNORE', $text);
		if ($ascii !== false && $ascii !== '') {
			$text = $ascii;
		}
	}
	$text = preg_replace('/[^a-z0-9]+/i', '-', $text);
	$text = trim($text, '-');
	if ($text === '') {
		$text = 'section';
	}
	if (strlen($text) > 80) {
		$text = rtrim(substr($text, 0, 80), '-');
	}
	return $text;
}

function business_document_apply_toc($html)
{
	$headings = array();
	$usedIds = array();
	$offset = 0;
	$out = '';
	$html = (string)$html;

	while (preg_match('/<h([1-3])(\s[^>]*)?>/i', $html, $m, PREG_OFFSET_CAPTURE, $offset)) {
		$level = (int)$m[1][0];
		$attrs = isset($m[2][0]) ? $m[2][0] : '';
		$start = $m[0][1];
		$openEnd = $start + strlen($m[0][0]);
		$closeTag = '</h' . $level . '>';
		$closePos = stripos($html, $closeTag, $openEnd);

		if ($closePos === false) {
			$out .= substr($html, $offset);
			$offset = strlen($html);
			break;
		}

		$inner = substr($html, $openEnd, $closePos - $openEnd);
		$out .= substr($html, $offset, $start - $offset);

		/* Skip runaway matches (not real headings) */
		if (strlen($inner) > 4000) {
			$out .= substr($html, $start, ($closePos + strlen($closeTag)) - $start);
			$offset = $closePos + strlen($closeTag);
			continue;
		}

		$text = trim(html_entity_decode(strip_tags($inner), ENT_QUOTES, 'UTF-8'));
		$text = preg_replace('/\s+/', ' ', $text);
		$closeLen = strlen($closeTag);

		if ($text === '') {
			$out .= substr($html, $start, ($closePos + $closeLen) - $start);
			$offset = $closePos + $closeLen;
			continue;
		}

		$id = '';
		if (preg_match('/\bid\s*=\s*(["\'])([^"\']*)\1/i', $attrs, $idm)) {
			$id = trim($idm[2]);
		} elseif (preg_match('/\bid\s*=\s*([^\s>]+)/i', $attrs, $idm)) {
			$id = trim($idm[1], '"\'');
		}

		if ($id === '') {
			$id = business_document_heading_slug($text);
			$base = $id;
			$n = 2;
			while (isset($usedIds[strtolower($id)])) {
				$id = $base . '-' . $n;
				$n++;
			}
			$attrs = rtrim($attrs) . ' id="' . htmlspecialchars($id, ENT_QUOTES, 'UTF-8') . '"';
		}
		$usedIds[strtolower($id)] = true;

		$headings[] = array(
			'level' => $level,
			'id' => $id,
			'text' => $text,
		);

		$out .= '<h' . $level . $attrs . '>' . $inner . '</h' . $level . '>';
		$offset = $closePos + $closeLen;
	}

	if ($offset < strlen($html)) {
		$out .= substr($html, $offset);
	}

	return array(
		'html' => ($out !== '') ? $out : $html,
		'headings' => $headings,
	);
}

function business_document_toc_nav($headings)
{
	if (!is_array($headings) || count($headings) === 0) {
		return '';
	}

	$html = '<nav class="url-page-toc" aria-label="Table of contents">';
	$html .= '<p class="url-page-toc-title">Table of Contents</p>';

	$current = 0;
	$openLists = 0;

	foreach ($headings as $h) {
		$level = (int)$h['level'];
		$id = htmlspecialchars($h['id'], ENT_QUOTES, 'UTF-8');
		$text = htmlspecialchars($h['text'], ENT_QUOTES, 'UTF-8');

		if ($current === 0) {
			$html .= '<ol>';
			$openLists = 1;
			$current = $level;
		} elseif ($level > $current) {
			while ($current < $level) {
				$html .= '<ol>';
				$openLists++;
				$current++;
			}
		} elseif ($level < $current) {
			while ($current > $level) {
				$html .= '</li></ol>';
				$openLists--;
				$current--;
			}
			$html .= '</li>';
		} else {
			$html .= '</li>';
		}

		$html .= '<li><a href="#' . $id . '">' . $text . '</a>';
		$current = $level;
	}

	while ($openLists > 0) {
		$html .= '</li></ol>';
		$openLists--;
	}

	$html .= '</nav>';
	return $html;
}
