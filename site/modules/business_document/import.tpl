<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/business_documents.css" />

<div class="bd-wrap">
	<div class="bd-hero">
		<div class="bd-header">
			<div class="bd-title-block">
				<div class="bd-title-icon" aria-hidden="true">
					<svg viewBox="0 0 24 24" fill="none" stroke="#ffffff" stroke-width="1.8">
						<path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/>
						<polyline points="7 10 12 15 17 10"/>
						<line x1="12" y1="15" x2="12" y2="3"/>
					</svg>
				</div>
				<div class="bd-title-text">
					<h1>Import Existing URLs</h1>
					<p>GCONS menu/section URLs, plus generated URLs from Email Library and AI Procedure.</p>
				</div>
			</div>
			<div class="bd-header-actions">
				<a class="bd-btn bd-btn-ghost" href="{{$BASE_URL}}business_document.home">Back to Documents</a>
			</div>
		</div>
	</div>

	{{if $error}}<div class="bd-error">{{$error}}</div>{{/if}}
	{{if $msg}}<div class="bd-msg">{{$msg}}</div>{{/if}}

	<div class="bd-cards" style="margin-bottom:18px;">
		<div class="bd-card">
			<div class="bd-card-label">New to import</div>
			<div class="bd-card-value">{{$new_count}}</div>
		</div>
		<div class="bd-card">
			<div class="bd-card-label">Already in table</div>
			<div class="bd-card-value">{{$exist_count}}</div>
		</div>
	</div>

	<div class="bd-table-shell">
		<div class="bd-table-toolbar">
			<div>
				<h2>Candidates</h2>
				<p>Sources: GCONS Menu (one URL per module), Email Library records, AI Procedure pages.</p>
			</div>
		</div>

		<form method="post" action="{{$BASE_URL}}business_document.import">
			<div style="margin:0 0 12px;">
				<button type="button" class="bd-btn bd-btn-secondary bd-btn-sm" onclick="toggleImportAll(true);">Select all new</button>
				<button type="button" class="bd-btn bd-btn-ghost bd-btn-sm" onclick="toggleImportAll(false);">Clear</button>
				<input type="submit" name="subImportUrls" value="Import selected" class="bd-btn bd-btn-primary bd-btn-sm" onclick="return confirm('Import selected URLs into the Central URL Table?');" />
			</div>

			<div class="bd-table-wrap">
				<table class="bd-table bd-table-sm">
					<thead>
						<tr>
							<th width="6%"></th>
							<th>Name</th>
							<th>Source / System</th>
							<th>Type</th>
							<th>Path / URL</th>
							<th>Status</th>
						</tr>
					</thead>
					<tbody>
						{{foreach from=$candidates item=item name=imp}}
						<tr>
							<td>
								{{if !$item.already}}
								<input type="checkbox" class="imp-check" name="import_sel[]" value="{{$smarty.foreach.imp.index}}" />
								{{else}}
								—
								{{/if}}
							</td>
							<td class="bd-name">{{$item.name|escape:'html'}}</td>
							<td>{{$item.source|escape:'html'}}</td>
							<td>{{$item.type_name|escape:'html'}}</td>
							<td>
								<a class="bd-path" href="{{$item.path|escape:'html'}}" target="_blank" rel="noopener noreferrer" onclick="window.open(this.href, '_blank'); return false;" style="color:#1d4ed8; text-decoration:underline; cursor:pointer; position:relative; z-index:10;">{{$item.path|escape:'html'}}</a>
								&nbsp;
								<button type="button" class="bd-btn bd-btn-secondary bd-btn-sm" onclick="window.open('{{$item.path|escape:'javascript'}}', '_blank');">Open</button>
							</td>
							<td>
								{{if $item.already}}
								<span class="bd-badge bd-badge-inactive">Already added</span>
								{{else}}
								<span class="bd-badge bd-badge-active">New</span>
								{{/if}}
							</td>
						</tr>
						{{foreachelse}}
						<tr>
							<td colspan="6" class="bd-empty">No candidate URLs found in the scanned GCONS tables.</td>
						</tr>
						{{/foreach}}
					</tbody>
				</table>
			</div>
		</form>
	</div>
</div>

<script type="text/javascript">
function toggleImportAll(on) {
	var boxes = document.querySelectorAll('.imp-check');
	for (var i = 0; i < boxes.length; i++) {
		boxes[i].checked = !!on;
	}
}
</script>