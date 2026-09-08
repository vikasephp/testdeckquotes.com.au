<script type="text/javascript" src="{{$BASE_URL}}js/ckeditor2/ckeditor.js"></script>
<script type="text/javascript">window.GCONS_MERGE_FIELD_VALUES = {{$merge_field_values_json}};</script>
<script type="text/javascript">window.GCONS_PAGE_TEMPLATES = {{$page_templates_json}};</script>
<script type="text/javascript">window.GCONS_CKEDITOR5_UPLOAD_URL = '{{$BASE_URL}}gcons_ckeditor_upload.php';</script>
<script type="text/javascript">window.GCONS_CKEDITOR5_DOC_LINKS_URL = '{{$BASE_URL}}business_document.edit/utp_id/{{$detail.utp_id}}?ajax=doc_links';</script>
<script type="text/javascript">
(function () {
	var idleBusy = false;
	var idlePending = false;
	var lastSent = '';
	var autosaveSeq = 0;
	var utpId = '{{$detail.utp_id}}';

	function setStatus(text) {
		var status = document.getElementById('gcons-autosave-status');
		if (status) {
			status.textContent = text || '';
		}
	}

	function editorHtml() {
		if (window.GCONS_CKEditor5 && window.GCONS_CKEditor5.editors) {
			var map = window.GCONS_CKEditor5.editors;
			var keys = Object.keys(map);
			if (keys.length && map[keys[0]] && typeof map[keys[0]].getData === 'function') {
				return map[keys[0]].getData();
			}
		}
		if (typeof CKEDITOR !== 'undefined' && CKEDITOR.instances && CKEDITOR.instances.url_html && typeof CKEDITOR.instances.url_html.getData === 'function') {
			return CKEDITOR.instances.url_html.getData();
		}
		var ta = document.getElementById('url_html');
		return ta ? ta.value : '';
	}

	function fieldValue(name) {
		var el = document.querySelector('.url-edit-wrap form [name="' + name + '"]');
		return el ? String(el.value || '') : '';
	}

	function contentKey(html) {
		html = String(html || '');
		var h = 0;
		var i;
		for (i = 0; i < html.length; i++) {
			h = (h * 31 + html.charCodeAt(i)) | 0;
		}
		return [
			String(html.length),
			String(h),
			fieldValue('url_name').replace(/^\s+|\s+$/g, ''),
			fieldValue('url_access'),
			fieldValue('url_status'),
			fieldValue('url_department'),
			fieldValue('url_ai_ready')
		].join('\x1e');
	}

	function buildBody(html, seq) {
		var body = new FormData();
		body.append('ajax', 'autosave');
		body.append('utp_id', utpId);
		body.append('autosave_seq', String(seq));
		body.append('url_html', html || '');
		body.append('url_name', fieldValue('url_name').replace(/^\s+|\s+$/g, ''));
		body.append('url_access', fieldValue('url_access'));
		body.append('url_status', fieldValue('url_status'));
		body.append('url_department', fieldValue('url_department'));
		body.append('url_ai_ready', fieldValue('url_ai_ready'));
		return body;
	}

	function saveNow() {
		var name = fieldValue('url_name').replace(/^\s+|\s+$/g, '');
		if (!name) {
			return Promise.resolve(false);
		}
		if (idleBusy) {
			idlePending = true;
			return Promise.resolve(false);
		}
		var html = editorHtml();
		var key = contentKey(html);
		if (key === lastSent) {
			return Promise.resolve(true);
		}
		autosaveSeq += 1;
		var seq = Date.now();
		if (seq <= autosaveSeq) {
			seq = autosaveSeq + 1;
		}
		autosaveSeq = seq;
		var body = buildBody(html, seq);
		idleBusy = true;
		setStatus('Saving…');
		return fetch('{{$BASE_URL}}business_document.edit/utp_id/' + utpId + '?ajax=autosave', {
			method: 'POST',
			body: body,
			credentials: 'same-origin'
		}).then(function (res) { return res.text(); }).then(function (text) {
			var data = {};
			try {
				data = JSON.parse(text);
			} catch (e) {
				setStatus('');
				return false;
			}
			if (data && data.ok) {
				if (data.ignored) {
					idlePending = true;
					return false;
				}
				lastSent = key;
				setStatus('Saved');
				return true;
			}
			setStatus('');
			return false;
		}).catch(function () {
			setStatus('');
			return false;
		}).then(function (ok) {
			idleBusy = false;
			if (idlePending) {
				idlePending = false;
				return saveNow();
			}
			return ok;
		});
	}

	function scheduleSave() {
		saveNow();
	}

	window.GCONS_CKEDITOR5_IDLE_SAVE = function () {
		return saveNow();
	};

	document.addEventListener('DOMContentLoaded', function () {
		var form = document.querySelector('.url-edit-wrap form');
		if (!form) {
			return;
		}
		form.addEventListener('input', scheduleSave);
		form.addEventListener('change', scheduleSave);
	});
})();
</script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/business_documents.css" />
<style type="text/css">
#gcons-history-modal,
#gcons-history-modal input,
#gcons-history-modal button,
#gcons-history-modal table,
#gcons-history-modal th,
#gcons-history-modal td {
	font-family: Arial, Helvetica, sans-serif;
}
#gcons-history-modal .bd-history-dialog {
	font-size: 13px;
	color: #475569;
	font-weight: 500;
}
#gcons-history-title {
	font-size: 17px;
	font-weight: 700;
	color: #0f172a;
}
#gcons-history-summary,
#gcons-history-page-label {
	font-size: 13px;
	font-weight: 500;
	color: #64748b;
}
#gcons-history-q,
#gcons-doc-history-list {
	font-size: 13px;
	font-weight: 500;
	color: #475569;
}
#gcons-history-modal th {
	font-size: 13px;
	font-weight: 700;
	color: #334155;
}
#gcons-history-pager button {
	font-size: 13px;
	font-weight: 600;
}
</style>

<div class="url-edit-wrap">
	{{if $is_registry}}
	<h1>Registered URL - {{$detail.utp_name|escape:'html'}}</h1>
	{{else}}
	<h1>Edit Document - {{$detail.utp_name|escape:'html'}}</h1>
	{{/if}}

	{{if $msg}}<div class="url-edit-msg">{{$msg}}</div>{{/if}}
	{{if $error}}<div class="url-edit-error">{{$error}}</div>{{/if}}

	<p><strong>Path:</strong> {{$detail.utp_path}}<br />
	<strong>Live URL:</strong> <a href="{{$live_url}}" target="_blank">{{$live_url}}</a><br />
	<strong>Source / System:</strong> {{$detail.utp_source|escape:'html'}}<br />
	<strong>Created By:</strong> {{$detail.created_by_name|escape:'html'}}<br />
	<strong>Last updated:</strong>
	{{if $detail.updated_display}}{{$detail.updated_display}}{{else}}—{{/if}}
	{{if $detail.utp_updated_by && $detail.utp_updated_by != '—'}}
	by {{$detail.utp_updated_by|escape:'html'}}
	{{/if}}
	</p>
	{{if !$is_registry}}
	<p>
		<button type="button" id="gcons-history-open" class="url-edit-btn" style="background:#fff;color:#2563eb;border:1px solid #bfdbfe;box-shadow:none;">History</button>
	</p>
	{{/if}}

	<!-- EZ1-T282 registry UX -->
	{{if $is_registry}}
	<div class="url-edit-msg" style="background:#eff6ff;border-color:#bfdbfe;color:#1e3a8a;">
		This row is a <strong>registry entry</strong> from <strong>{{$detail.utp_source|escape:'html'}}</strong>.<br />
		Content is managed in that module - not in Business Documents. Use <strong>Open</strong> to view the live page.
	</div>
	<p>
		<a class="url-edit-btn" href="{{$live_url}}" target="_blank" style="display:inline-block;text-decoration:none;">Open live URL</a>
		<a class="url-edit-link" href="{{$BASE_URL}}business_document.home">Back to Business Documents</a>
	</p>
	{{else}}

	<form method="post" action="{{$BASE_URL}}business_document.edit/utp_id/{{$detail.utp_id}}" onsubmit="return syncUrlHtmlEditor();">
		<div class="url-edit-row">
			<label>Document Name</label>
			<input type="text" name="url_name" value="{{$detail.utp_name|escape:'html'}}" />
		</div>

		<div class="url-edit-grid">
			<div class="url-edit-row">
				<label>Access</label>
				<select name="url_access">
					<option value="internal" {{if $detail.utp_access != 'public'}}selected{{/if}}>Internal / Private</option>
					<option value="public" {{if $detail.utp_access == 'public'}}selected{{/if}}>Public</option>
				</select>
			</div>
			<div class="url-edit-row">
				<label>Status</label>
				<select name="url_status">
					<option value="draft" {{if $detail.utp_status != 'live'}}selected{{/if}}>Draft</option>
					<option value="live" {{if $detail.utp_status == 'live'}}selected{{/if}}>Live</option>
				</select>
			</div>
		</div>

		<div class="url-edit-grid">
			<div class="url-edit-row">
				<label>Owner / Department</label>
				<select name="url_department">
					<option value="">Select department...</option>
					{{foreach from=$departments item=dept}}
					<option value="{{$dept|escape:'html'}}" {{if $detail.utp_department == $dept}}selected{{/if}}>{{$dept|escape:'html'}}</option>
					{{/foreach}}
				</select>
			</div>
			<div class="url-edit-row">
				<label>AI Ready</label>
				<select name="url_ai_ready">
					<option value="0" {{if !$detail.utp_ai_ready}}selected{{/if}}>No</option>
					<option value="1" {{if $detail.utp_ai_ready}}selected{{/if}}>Yes</option>
				</select>
			</div>
		</div>

		<div class="url-edit-row">
			<label>HTML Content</label>
			<p style="color:#64748b;font-size:13px;margin:0 0 8px;">Use <strong>Insert template</strong> in the toolbar. Task Procedure matches AI Repository. The other five are starters — we can change or add templates if you want.</p>
			<p id="url_html_loading" style="color:#64748b;font-size:13px;margin:0 0 8px;">Loading editor (large documents can take a moment)…</p>
			<textarea name="url_html" id="url_html">{{$detail.utp_html|escape:'html'}}</textarea>
		</div>
		<div>
			<input type="submit" name="subSaveHtml" value="Save Document" class="url-edit-btn" />
			<span id="gcons-autosave-status" style="margin-left:10px;color:#64748b;font-size:13px;"></span>
			<a class="url-edit-link" href="{{$BASE_URL}}business_document.home">Back to Business Documents</a>
			<a class="url-edit-link" href="{{$live_url}}" target="_blank">Open live page</a>
		</div>
	</form>

	<div id="gcons-history-modal" style="display:none;position:fixed;inset:0;z-index:5000;background:rgba(15,23,42,0.45);">
		<div role="dialog" aria-labelledby="gcons-history-title" class="bd-history-dialog" style="background:#fff;max-width:860px;width:92%;max-height:82vh;margin:6vh auto 0;border-radius:10px;box-shadow:0 20px 50px rgba(15,23,42,0.25);display:flex;flex-direction:column;overflow:hidden;">
			<div style="display:flex;align-items:center;justify-content:space-between;padding:14px 18px;border-bottom:1px solid #e2e8f0;">
				<div>
					<strong id="gcons-history-title">History</strong>
					<div id="gcons-history-summary" style="color:#64748b;font-size:12px;margin-top:2px;">AI and staff are shown separately.</div>
				</div>
				<button type="button" id="gcons-history-close" style="border:0;background:transparent;font-size:22px;line-height:1;cursor:pointer;color:#64748b;">&times;</button>
			</div>
			<div style="padding:10px 18px 0;">
				<input type="search" id="gcons-history-q" placeholder="Search by person, AI, date, or how it was saved" style="width:100%;box-sizing:border-box;padding:8px 10px;border:1px solid #cbd5e1;border-radius:6px;font-size:13px;" />
			</div>
			<div id="gcons-doc-history-list" style="padding:12px 18px;overflow:auto;flex:1;font-size:13px;color:#334155;">Loading history…</div>
			<div id="gcons-history-pager" style="display:none;padding:10px 18px;border-top:1px solid #e2e8f0;color:#64748b;font-size:13px;">
				<button type="button" class="bd-btn bd-btn-ghost bd-btn-sm" id="gcons-history-prev" style="margin-right:8px;">Previous</button>
				<span id="gcons-history-page-label"></span>
				<button type="button" class="bd-btn bd-btn-ghost bd-btn-sm" id="gcons-history-next" style="margin-left:8px;">Next</button>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	(function () {
		var modal = document.getElementById('gcons-history-modal');
		var box = document.getElementById('gcons-doc-history-list');
		var summary = document.getElementById('gcons-history-summary');
		var pager = document.getElementById('gcons-history-pager');
		var pageLabel = document.getElementById('gcons-history-page-label');
		var page = 1;
		var pages = 1;
		var loaded = false;
		var searchTimer = null;
		var qInput = document.getElementById('gcons-history-q');

		function searchValue() {
			return qInput ? String(qInput.value || '').replace(/^\s+|\s+$/g, '') : '';
		}

		function formatWhen(value) {
			var s = String(value || '');
			var m = s.match(/^(\d{4})-(\d{2})-(\d{2})[ T](\d{2}):(\d{2})/);
			if (!m) {
				return s.replace(/</g, '');
			}
			var hour = parseInt(m[4], 10);
			var ampm = hour >= 12 ? 'pm' : 'am';
			hour = hour % 12;
			if (hour === 0) {
				hour = 12;
			}
			return m[3] + '/' + m[2] + '/' + m[1] + ' ' + hour + ':' + m[5] + ' ' + ampm;
		}

		function openHistory() {
			if (!modal) {
				return;
			}
			modal.style.display = 'block';
			document.body.style.overflow = 'hidden';
			loadPage(loaded ? page : 1);
			if (qInput) {
				setTimeout(function () { qInput.focus(); }, 50);
			}
		}

		function closeHistory() {
			if (!modal) {
				return;
			}
			modal.style.display = 'none';
			document.body.style.overflow = '';
		}

		function loadPage(nextPage) {
			if (!box) {
				return;
			}
			box.textContent = 'Loading history…';
			var q = searchValue();
			fetch('{{$BASE_URL}}business_document.edit/utp_id/{{$detail.utp_id}}?ajax=history&page=' + nextPage + '&q=' + encodeURIComponent(q), {
				credentials: 'same-origin'
			}).then(function (res) { return res.json(); }).then(function (data) {
				var items = (data && data.items) ? data.items : [];
				page = parseInt(data && data.page, 10) || 1;
				pages = parseInt(data && data.pages, 10) || 1;
				var total = parseInt(data && data.total, 10) || items.length;
				loaded = true;
				if (summary) {
					if (!total) {
						summary.textContent = q ? ('No matches for “' + q + '”.') : 'No changes recorded yet.';
					} else if (q) {
						summary.textContent = total + ' match' + (total === 1 ? '' : 'es') + ' for “' + q + '”.';
					} else {
						summary.textContent = total + ' change' + (total === 1 ? '' : 's') + ' · AI and staff are shown separately.';
					}
				}
				if (pager) {
					pager.style.display = pages > 1 ? 'block' : 'none';
				}
				if (pageLabel) {
					pageLabel.textContent = 'Page ' + page + ' of ' + pages;
				}
				if (!items.length) {
					box.textContent = q ? 'No matching history rows.' : 'No changes recorded yet.';
					return;
				}
				var html = '<table style="width:100%;border-collapse:collapse;">';
				html += '<thead><tr style="text-align:left;color:#64748b;">';
				html += '<th style="padding:6px 8px 6px 0;">When</th>';
				html += '<th style="padding:6px 8px;">Who</th>';
				html += '<th style="padding:6px 8px;">How</th>';
				html += '<th style="padding:6px 0 6px 8px;">Size</th>';
				html += '</tr></thead><tbody>';
				items.forEach(function (row) {
					var actor = String(row.uta_actor || 'human');
					var label = String(row.uta_actor_label || (actor === 'ai' ? 'AI (CGFB)' : 'Staff'));
					var source = String(row.uta_source || 'save');
					var when = String(row.uta_created_at || '');
					var whoStyle = actor === 'ai'
						? 'background:#f5f3ff;color:#5b21b6;border:1px solid #ddd6fe;'
						: 'background:#eff6ff;color:#1e40af;border:1px solid #bfdbfe;';
					var whoText = actor === 'ai' ? ('AI — ' + label) : ('Staff — ' + label);
					var how = source === 'api' ? 'AI endpoint' : (source === 'autosave' ? 'Autosave' : (source === 'create' ? 'Created' : 'Save Document'));
					var bytes = parseInt(row.uta_html_after_bytes, 10) || 0;
					var size = bytes > 1048576 ? ((bytes / 1048576).toFixed(1) + ' MB') : (Math.round(bytes / 1024) + ' KB');
					if (String(row.uta_truncated) === '1') {
						size += ' (previous body not kept)';
					}
					html += '<tr>';
					html += '<td style="padding:8px 8px 8px 0;border-top:1px solid #e2e8f0;white-space:nowrap;">' + formatWhen(when) + '</td>';
					html += '<td style="padding:8px;border-top:1px solid #e2e8f0;"><span style="display:inline-block;padding:2px 8px;border-radius:999px;font-weight:600;' + whoStyle + '">' + whoText.replace(/</g, '') + '</span></td>';
					html += '<td style="padding:8px;border-top:1px solid #e2e8f0;">' + how + '</td>';
					html += '<td style="padding:8px 0 8px 8px;border-top:1px solid #e2e8f0;color:#64748b;">' + size + '</td>';
					html += '</tr>';
				});
				html += '</tbody></table>';
				box.innerHTML = html;
			}).catch(function () {
				box.textContent = 'Could not load history.';
			});
		}

		var openBtn = document.getElementById('gcons-history-open');
		var closeBtn = document.getElementById('gcons-history-close');
		var prevBtn = document.getElementById('gcons-history-prev');
		var nextBtn = document.getElementById('gcons-history-next');
		if (openBtn) {
			openBtn.addEventListener('click', openHistory);
		}
		if (closeBtn) {
			closeBtn.addEventListener('click', closeHistory);
		}
		if (modal) {
			modal.addEventListener('click', function (e) {
				if (e.target === modal) {
					closeHistory();
				}
			});
		}
		if (prevBtn) {
			prevBtn.addEventListener('click', function () {
				if (page > 1) {
					loadPage(page - 1);
				}
			});
		}
		if (nextBtn) {
			nextBtn.addEventListener('click', function () {
				if (page < pages) {
					loadPage(page + 1);
				}
			});
		}
		if (qInput) {
			qInput.addEventListener('input', function () {
				if (searchTimer) {
					clearTimeout(searchTimer);
				}
				searchTimer = setTimeout(function () {
					loadPage(1);
				}, 250);
			});
			qInput.addEventListener('keydown', function (e) {
				if (e.key === 'Enter') {
					e.preventDefault();
					if (searchTimer) {
						clearTimeout(searchTimer);
					}
					loadPage(1);
				}
			});
		}
		document.addEventListener('keydown', function (e) {
			if (e.key === 'Escape' && modal && modal.style.display === 'block') {
				closeHistory();
			}
		});
	})();
	</script>

	<script type="text/javascript">
	(function () {
		var loading = document.getElementById('url_html_loading');

		function hideLoading() {
			if (loading) {
				loading.style.display = 'none';
			}
		}

		// Defer init so the page paints first — large HTML into CK5 is heavy
		function startEditor() {
			if (typeof CKEDITOR === 'undefined' || typeof CKEDITOR.replace !== 'function') {
				hideLoading();
				return;
			}
			var p = CKEDITOR.replace('url_html', {
				height: 420,
				allowedContent: true
			});
			if (p && typeof p.then === 'function') {
				p.then(hideLoading).catch(hideLoading);
			} else {
				setTimeout(hideLoading, 2000);
			}
		}

		if (document.readyState === 'loading') {
			document.addEventListener('DOMContentLoaded', function () {
				setTimeout(startEditor, 50);
			});
		} else {
			setTimeout(startEditor, 50);
		}
	})();

	function syncUrlHtmlEditor() {
		// CK5 drop-in: form submit hook also syncs; keep CK4-style instances if present
		if (typeof CKEDITOR !== 'undefined' && CKEDITOR.instances && CKEDITOR.instances.url_html) {
			var ed = CKEDITOR.instances.url_html;
			if (typeof ed.updateElement === 'function') {
				ed.updateElement();
			} else if (typeof ed.updateSourceElement === 'function') {
				ed.updateSourceElement();
			} else if (typeof ed.getData === 'function') {
				var ta = document.getElementById('url_html');
				if (ta) {
					ta.value = ed.getData();
				}
			}
		}
		if (window.GCONS_CKEditor5 && window.GCONS_CKEditor5.editors) {
			var map = window.GCONS_CKEditor5.editors;
			Object.keys(map).forEach(function (key) {
				var ed = map[key];
				if (ed && typeof ed.updateSourceElement === 'function') {
					ed.updateSourceElement();
				} else if (ed && ed.sourceElement && typeof ed.getData === 'function') {
					ed.sourceElement.value = ed.getData();
				}
			});
		}
		return true;
	}
	</script>
	{{/if}}
</div>
