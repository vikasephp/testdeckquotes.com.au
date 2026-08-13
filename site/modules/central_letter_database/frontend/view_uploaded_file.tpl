<style>
.review-wrap { font-family: Arial, Helvetica, sans-serif; margin: 0; padding: 0; background: #f5f6f8; min-height: 100vh; }
.review-body { padding: 0; }
.review-frame {
	width: 100%; height: 100vh; border: 0; background: #fff; display: block;
}
.review-img { max-width: 100%; max-height: 100vh; display: block; margin: 0 auto; padding: 14px; box-sizing: border-box; }
.review-msg {
	background: #fff; border: 1px solid #d0d7de; border-radius: 6px; padding: 20px;
	color: #333; max-width: 720px; margin: 30px auto; text-align: center;
}
.review-error { background: #fdecea; border: 1px solid #f5c2c0; color: #b71c1c; padding: 14px; border-radius: 4px; margin: 14px; }
.review-btn-download {
	display: inline-block; padding: 10px 16px; border-radius: 4px;
	background: #1a5fb4; color: #fff !important; text-decoration: none; font-size: 13px;
}
#docxPreview, #sheetPreview { background: #fff; border: 1px solid #d0d7de; padding: 16px; min-height: 300px; margin: 14px; }
#sheetPreview table { border-collapse: collapse; width: 100%; font-size: 12px; }
#sheetPreview td, #sheetPreview th { border: 1px solid #ccc; padding: 4px 6px; }
</style>

<div class="review-wrap">
	{{if $error}}
	<div class="review-body"><div class="review-error">{{$error}}</div></div>
	{{else}}
	<div class="review-body">
		{{if $preview_type == 'image'}}
			<img class="review-img" src="{{$stream_url}}" alt="{{$file_name|escape:'html'}}" />

		{{elseif $preview_type == 'pdf' || $preview_type == 'html'}}
			<iframe class="review-frame" src="{{$stream_url}}" title="{{$file_name|escape:'html'}}"></iframe>

		{{elseif $preview_type == 'video'}}
			<video class="review-frame" controls src="{{$stream_url}}" style="height:auto; max-height:100vh;">
				Your browser does not support video preview.
			</video>

		{{elseif $preview_type == 'audio'}}
			<div class="review-msg">
				<p>Audio preview</p>
				<audio controls src="{{$stream_url}}" style="width:100%; max-width:480px;"></audio>
			</div>

		{{elseif $preview_type == 'text'}}
			<iframe class="review-frame" src="{{$stream_url}}" title="{{$file_name|escape:'html'}}"></iframe>

		{{elseif $preview_type == 'docx'}}
			<div id="docxPreview">Loading Word document preview...</div>

		{{elseif $preview_type == 'sheet'}}
			<div id="sheetPreview">Loading spreadsheet preview...</div>

		{{elseif $preview_type == 'office_limited'}}
			<div class="review-msg">
				<p>This older Word format (<strong>.doc</strong>) cannot be fully previewed in the browser.</p>
				<p>Please download it to open in Microsoft Word for review.</p>
				<p style="margin-top:16px;"><a class="review-btn-download" href="{{$download_url}}" target="_blank">Download file</a></p>
			</div>

		{{else}}
			<div class="review-msg">
				<p>No in-browser preview is available for <strong>.{{$file_ext}}</strong> files.</p>
				<p>Download the file to open it on your computer for review.</p>
				<p style="margin-top:16px;"><a class="review-btn-download" href="{{$download_url}}" target="_blank">Download file</a></p>
			</div>
		{{/if}}
	</div>
	{{/if}}
</div>

<script type="text/javascript">
var streamUrl = {{if $stream_url}}"{{$stream_url|escape:'javascript'}}"{{else}}""{{/if}};
var previewType = "{{$preview_type|escape:'javascript'}}";

if (previewType === 'docx' && streamUrl) {
	var s = document.createElement('script');
	s.src = 'https://cdnjs.cloudflare.com/ajax/libs/mammoth/1.6.0/mammoth.browser.min.js';
	s.onload = function () {
		fetch(streamUrl, { credentials: 'same-origin' })
			.then(function (r) { return r.arrayBuffer(); })
			.then(function (buf) { return mammoth.convertToHtml({ arrayBuffer: buf }); })
			.then(function (result) {
				document.getElementById('docxPreview').innerHTML = result.value || '<p>(Empty document)</p>';
			})
			.catch(function () {
				document.getElementById('docxPreview').innerHTML = '<p>Could not preview this Word file. Please download it.</p>';
			});
	};
	document.body.appendChild(s);
}

if (previewType === 'sheet' && streamUrl) {
	var s2 = document.createElement('script');
	s2.src = 'https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.5/xlsx.full.min.js';
	s2.onload = function () {
		fetch(streamUrl, { credentials: 'same-origin' })
			.then(function (r) { return r.arrayBuffer(); })
			.then(function (buf) {
				var wb = XLSX.read(buf, { type: 'array' });
				var first = wb.SheetNames[0];
				var html = XLSX.utils.sheet_to_html(wb.Sheets[first]);
				document.getElementById('sheetPreview').innerHTML = '<p><strong>Sheet:</strong> ' + first + '</p>' + html;
			})
			.catch(function () {
				document.getElementById('sheetPreview').innerHTML = '<p>Could not preview this spreadsheet. Please download it.</p>';
			});
	};
	document.body.appendChild(s2);
}
</script>
