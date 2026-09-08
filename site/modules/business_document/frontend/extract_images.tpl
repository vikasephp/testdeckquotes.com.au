<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/business_documents.css" />
<style type="text/css">
.bd-wrap {
	max-width: none;
	width: 100%;
	padding-left: 12px;
	padding-right: 12px;
	box-sizing: border-box;
}
.bd-table {
	min-width: 0;
	width: 100%;
}
.bd-table th,
.bd-table td {
	padding: 8px 10px;
	vertical-align: middle;
}
</style>

<div class="bd-wrap">
	<div class="bd-hero">
		<div class="bd-header">
			<div class="bd-title-block">
				<div class="bd-title-text">
					<h1>Clean up document pictures</h1>
					<p>Pictures stored inside the document are saved as files. The original HTML is backed up once and is never overwritten.</p>
				</div>
			</div>
			<div class="bd-header-actions">
				<a class="bd-btn bd-btn-ghost" href="{{$BASE_URL}}business_document.home">← Back to Business Documents</a>
			</div>
		</div>
	</div>

	{{if $error}}<div class="bd-error">{{$error}}</div>{{/if}}
	{{if $msg}}<div class="bd-msg">{{$msg}}</div>{{/if}}

	<div class="bd-card" style="margin-bottom:16px;">
		<div class="bd-card-body">
			<div class="label">Documents still containing embedded pictures</div>
			<div class="bd-card-value-row">
				<span class="value">{{$pending}}</span>
			</div>
			{{if $pending > 0}}
			<form method="post" action="{{$BASE_URL}}business_document.extract_images" style="margin-top:12px;">
				<input type="hidden" name="extract_next" value="1" />
				<button type="submit" class="bd-btn bd-btn-primary">Clean up next document</button>
			</form>
			<p style="margin:8px 0 0;color:#64748b;font-size:13px;">One document at a time. Start with smaller ones. Large documents can take a minute.</p>
			{{/if}}
		</div>
	</div>

	<table class="bd-table">
		<thead>
			<tr>
				<th>Document</th>
				<th>Type</th>
				<th>Size</th>
				<th>Embedded pictures</th>
				<th>Original backup</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			{{foreach from=$rows item=row}}
			<tr>
				<td>
					<strong>{{$row.utp_name|escape:'html'}}</strong><br />
					<span style="color:#64748b;font-size:12px;">#{{$row.utp_id}} · {{$row.utp_status|escape:'html'}}</span>
				</td>
				<td>{{$row.utt_name|escape:'html'}}</td>
				<td>{{$row.html_kb}} KB</td>
				<td>{{if $row.has_embed}}Yes{{else}}No{{/if}}</td>
				<td>{{if $row.backup_exists}}Kept{{else}}Not yet{{/if}}</td>
				<td>
					{{if $row.has_embed}}
					<form method="post" action="{{$BASE_URL}}business_document.extract_images">
						<input type="hidden" name="extract_id" value="{{$row.utp_id}}" />
						<button type="submit" class="bd-btn bd-btn-secondary bd-btn-sm">Clean up</button>
					</form>
					{{else}}
					—
					{{/if}}
				</td>
			</tr>
			{{foreachelse}}
			<tr>
				<td colspan="6">No documents found.</td>
			</tr>
			{{/foreach}}
		</tbody>
	</table>
</div>

{{if $continue_cleanup}}
<script type="text/javascript">
setTimeout(function () {
	var form = document.createElement('form');
	form.method = 'post';
	form.action = '{{$BASE_URL}}business_document.extract_images';
	var input = document.createElement('input');
	input.type = 'hidden';
	input.name = 'extract_next';
	input.value = '1';
	form.appendChild(input);
	document.body.appendChild(form);
	form.submit();
}, 1200);
</script>
{{/if}}
