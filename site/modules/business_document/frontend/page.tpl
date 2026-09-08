<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<title>{{$page_title|escape:'html'}}</title>
	<style>
		body { margin: 0; padding: 0; background: #fff; color: #222; }
		.url-page-shell { max-width: 960px; margin: 0 auto; padding: 24px 20px 60px; }
		.url-page-meta { font-family: Arial, Helvetica, sans-serif; font-size: 12px; color: #888; margin-bottom: 18px; border-bottom: 1px solid #eee; padding-bottom: 8px; }
		.url-page-body { font-family: Arial, Helvetica, sans-serif; font-size: 15px; line-height: 1.5; }
		.url-page-body figure.table { display: block; margin: 1em 0; max-width: 100%; overflow-x: auto; }
		.url-page-body table { border-collapse: collapse; width: 100%; max-width: 100%; border: 1px solid #000; margin: 1em 0; }
		.url-page-body th,
		.url-page-body td { border: 1px solid #000; padding: 6px 8px; vertical-align: top; text-align: left; }
		.url-page-body img { max-width: 100%; height: auto; }
	</style>
</head>
<body>
	<div class="url-page-shell">
		{{if !$not_found}}
		<div class="url-page-meta">{{$page_path}}</div>
		{{/if}}
		<div class="url-page-body">
			{{$page_html}}
		</div>
	</div>
</body>
</html>
