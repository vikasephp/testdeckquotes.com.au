<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/business_documents.css" />
<style type="text/css">
.bd-wrap {
	max-width: none;
	width: 100%;
	padding-left: 12px;
	padding-right: 12px;
	box-sizing: border-box;
}
.bd-table-wrap {
	overflow-x: visible;
}
.bd-table,
.bd-table.bd-table-sm {
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
				<div class="bd-title-icon" aria-hidden="true">
					<svg viewBox="0 0 24 24" fill="none" stroke="#ffffff" stroke-width="1.8">
						<path d="M4 7h16"/><path d="M4 12h16"/><path d="M4 17h10"/>
					</svg>
				</div>
				<div class="bd-title-text">
					<h1>Manage Document Types</h1>
					<p>Document type categories used in live URLs (e.g. document, template).</p>
				</div>
			</div>
			<div class="bd-header-actions">
				<a class="bd-btn bd-btn-ghost" href="{{$BASE_URL}}business_document.home">Back to Documents</a>
				<a class="bd-btn bd-btn-primary" href="{{$BASE_URL}}business_document.add_type">Add New Document Type</a>
			</div>
		</div>
	</div>

	<div class="bd-table-shell">
		<div class="bd-table-toolbar">
			<div>
				<h2>Document Types</h2>
				<p>These become the first segment of each live document path.</p>
			</div>
		</div>
		<div class="bd-table-wrap">
			<table class="bd-table bd-table-sm">
				<thead>
					<tr>
						<th width="8%">ID</th>
						<th width="28%">Name</th>
						<th width="32%">Slug (used in URL)</th>
						<th width="16%">Status</th>
						<th width="16%">Actions</th>
					</tr>
				</thead>
				<tbody>
					{{foreach from=$typedata item=item}}
					<tr>
						<td><span class="bd-id">#{{$item.utt_id}}</span></td>
						<td><span class="bd-name">{{$item.utt_name|escape:'html'}}</span></td>
						<td><span class="bd-slug">{{$item.utt_slug|escape:'html'}}</span></td>
						<td>
							{{if $item.utt_status}}
							<span class="bd-badge bd-badge-active"><span class="bd-dot bd-dot-active"></span> Active</span>
							{{else}}
							<span class="bd-badge bd-badge-inactive"><span class="bd-dot bd-dot-inactive"></span> Inactive</span>
							{{/if}}
						</td>
						<td>
							<div class="bd-actions">
								<a class="bd-btn bd-btn-secondary bd-btn-sm" href="{{$BASE_URL}}business_document.add_type/utt_id/{{$item.utt_id}}">Edit</a>
								<a class="bd-btn bd-btn-danger bd-btn-sm" href="{{$BASE_URL}}business_document.delete_type/utt_id/{{$item.utt_id}}" onclick="return confirm('Delete this document type?');">Delete</a>
							</div>
						</td>
					</tr>
					{{foreachelse}}
					<tr>
						<td colspan="5" class="bd-empty">No types yet. Add Document / Template etc.</td>
					</tr>
					{{/foreach}}
				</tbody>
			</table>
		</div>
	</div>
</div>
