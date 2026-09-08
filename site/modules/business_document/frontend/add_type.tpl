<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/business_documents.css" />

{{if $opr}}
<script type="text/javascript">
window.location.href = "{{$BASE_URL}}business_document.view_type";
</script>
{{/if}}

<div class="bd-wrap bd-wrap-narrow">
	<div class="bd-hero">
		<div class="bd-header">
			<div class="bd-title-block">
				<div class="bd-title-icon" aria-hidden="true">
					<svg viewBox="0 0 24 24" fill="none" stroke="#ffffff" stroke-width="1.8">
						<path d="M12 5v14"/><path d="M5 12h14"/>
					</svg>
				</div>
				<div class="bd-title-text">
					<h1>{{$title}}</h1>
					<p>Types become the first segment of the live URL path.</p>
				</div>
			</div>
			<div class="bd-header-actions">
				<a class="bd-btn bd-btn-ghost" href="{{$BASE_URL}}business_document.view_type">Back to Document Types</a>
			</div>
		</div>
	</div>

	{{if $error}}<div class="bd-error">{{$error}}</div>{{/if}}

	<div class="bd-panel">
		<form name="detail" method="post" action="" enctype="multipart/form-data">
			<input type="hidden" name="type[utt_id]" value="{{$detail.utt_id}}" />

			<div class="bd-row">
				<label for="utt_name">Type Name</label>
				<input type="text" id="utt_name" name="type[utt_name]" value="{{$detail.utt_name|escape:'html'}}" placeholder="e.g. Document" />
			</div>

			<div class="bd-row">
				<label for="utt_slug">Slug</label>
				<input type="text" id="utt_slug" name="type[utt_slug]" value="{{$detail.utt_slug|escape:'html'}}" placeholder="e.g. document" />
				<div class="bd-hint">Leave blank to auto-generate from name. Example path: /document/building-contract-procedure</div>
			</div>

			<div class="bd-row">
				<label for="utt_status">Status</label>
				<select id="utt_status" name="type[utt_status]">
					<option value="1" {{if $detail.utt_status == 1}}selected{{/if}}>Active</option>
					<option value="0" {{if $detail.utt_status == 0}}selected{{/if}}>Inactive</option>
				</select>
			</div>

			<div class="bd-form-actions">
				<input type="submit" name="subAddDetail" value="Save Type" class="bd-btn bd-btn-primary" />
				<a class="bd-btn bd-btn-ghost" href="{{$BASE_URL}}business_document.view_type">Cancel</a>
			</div>
		</form>
	</div>
</div>
