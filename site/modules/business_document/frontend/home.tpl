<script type="text/javascript" src="{{$BASE_URL}}js/ckeditor2/ckeditor.js"></script>
<script type="text/javascript">window.GCONS_PAGE_TEMPLATES = {{$page_templates_json}};</script>
<script type="text/javascript">window.GCONS_CKEDITOR5_UPLOAD_URL = '{{$BASE_URL}}gcons_ckeditor_upload.php';</script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/business_documents.css" />
<style type="text/css">
.bd-wrap {
	max-width: none;
	width: 100%;
	padding-left: 12px;
	padding-right: 12px;
	box-sizing: border-box;
}
.bd-table-shell {
	max-width: 100%;
}
.bd-table-wrap {
	max-width: 100%;
	overflow-x: auto;
}
.bd-table {
	min-width: 0 !important;
	width: 100%;
	max-width: 100%;
	table-layout: fixed;
}
.bd-table th,
.bd-table td {
	padding: 8px 10px;
	vertical-align: middle;
	min-width: 0;
	overflow: hidden;
	text-overflow: ellipsis;
}
.bd-table .bd-url-cell {
	display: flex;
	align-items: center;
	gap: 6px;
	min-width: 0;
	max-width: 100%;
	width: 100%;
}
.bd-table .bd-path {
	display: block;
	flex: 1;
	min-width: 0;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	word-break: normal;
}
.bd-copy-url {
	flex-shrink: 0;
	width: 28px;
	height: 28px;
	padding: 0;
	border: 1px solid #bfdbfe;
	background: #fff;
	color: #2563eb;
	border-radius: 8px;
	cursor: pointer;
	display: inline-flex;
	align-items: center;
	justify-content: center;
}
.bd-copy-url svg {
	width: 14px;
	height: 14px;
	display: block;
}
.bd-copy-url:hover,
.bd-copy-url.is-copied {
	background: #eff6ff;
}
.bd-table .bd-name {
	max-width: none;
}
.bd-table .bd-name a {
	display: block;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}
.bd-table th.bd-col-actions,
.bd-table td.bd-actions {
	width: 200px;
	overflow: visible;
	white-space: nowrap;
}
.bd-table td.bd-actions {
	display: flex;
	align-items: center;
	gap: 4px;
}
.bd-table td.bd-actions .bd-btn-sm {
	padding: 6px 8px;
	flex-shrink: 0;
}
.bd-table th.bd-col-ai,
.bd-table td.bd-col-ai {
	width: 72px;
	text-align: center;
}
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

<div class="bd-wrap">
	<div class="bd-hero">
		<div class="bd-header">
			<div class="bd-title-block">
				<div class="bd-title-icon" aria-hidden="true">
					<svg viewBox="0 0 24 24" fill="none" stroke="#ffffff" stroke-width="1.8">
						<path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/>
						<polyline points="14 2 14 8 20 8"/>
						<line x1="8" y1="13" x2="16" y2="13"/>
						<line x1="8" y1="17" x2="13" y2="17"/>
					</svg>
				</div>
				<div class="bd-title-text">
					{{if $filter_trash}}
					<h1>Recycle bin</h1>
					<p>Soft-deleted documents. Restore them, or permanently delete after review.</p>
					{{else}}
					<h1>Business Documents</h1>
					<p>One list for HTML pages, AI Repository, Email Library and GCONS menu. Open a row to view it in its own system.</p>
					{{/if}}
				</div>
			</div>
			<div class="bd-header-actions">
				<a class="bd-btn bd-btn-ghost" href="{{$BASE_URL}}">← Back to Home</a>
				{{if $filter_trash}}
				<a class="bd-btn bd-btn-primary" href="{{$BASE_URL}}business_document.home">← Active documents</a>
				{{else}}
				<a class="bd-btn bd-btn-ghost" href="{{$BASE_URL}}business_document.home?filter_trash=1">Recycle bin{{if $summary.trash > 0}} ({{$summary.trash_fmt}}){{/if}}</a>
				{{/if}}
				<a class="bd-btn bd-btn-ghost" href="{{$BASE_URL}}business_document.import">Import Existing URLs</a>
				<a class="bd-btn bd-btn-ghost" href="{{$BASE_URL}}business_document.extract_images">Clean up pictures</a>
				<a class="bd-btn bd-btn-ghost" href="{{$BASE_URL}}business_document.view_type">Manage Document Types</a>
				<a class="bd-btn bd-btn-ghost" href="{{$BASE_URL}}ai_repository.home">+ AI procedure</a>
				<button type="button" class="bd-btn bd-btn-primary" onclick="toggleCreateForm(true);">+ HTML page</button>
			</div>
		</div>
	</div>

	{{if $error}}<div class="bd-error">{{$error}}</div>{{/if}}
	{{if $msg}}
	<div class="bd-msg">
		{{$msg}}
		{{if $created_live_url}}
		<div style="margin-top:8px;">
			<input type="text" id="createdUrlField" value="{{$created_live_url}}" readonly style="width:70%; max-width:520px; padding:8px; border:1px solid #d1d5db; border-radius:8px;" />
			<button type="button" class="bd-btn bd-btn-secondary bd-btn-sm" onclick="copyText(document.getElementById('createdUrlField').value)">Copy Link</button>
		</div>
		{{/if}}
	</div>
	{{/if}}

	<div class="bd-cards">
		<div class="bd-card">
			<div class="bd-card-ico blue" aria-hidden="true">
				<svg viewBox="0 0 24 24" fill="none" stroke="#2563eb" stroke-width="2">
					<path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/>
					<polyline points="14 2 14 8 20 8"/>
					<line x1="16" y1="13" x2="8" y2="13"/>
					<line x1="16" y1="17" x2="8" y2="17"/>
					<line x1="10" y1="9" x2="8" y2="9"/>
				</svg>
			</div>
			<div class="bd-card-body">
				<div class="label">Total Documents</div>
				<div class="bd-card-value-row">
					<span class="value">{{$summary.total_fmt}}</span>
					<span class="bd-card-live">Live</span>
				</div>
			</div>
		</div>

		<div class="bd-card">
			<div class="bd-card-ico green" aria-hidden="true">
				<svg viewBox="0 0 24 24" fill="none" stroke="#16a34a" stroke-width="2">
					<path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/>
					<polyline points="14 2 14 8 20 8"/>
					<path d="m9 15 2 2 4-4"/>
				</svg>
			</div>
			<div class="bd-card-body">
				<div class="label">Published</div>
				<div class="bd-card-value-row">
					<span class="value">{{$summary.live_fmt}}</span>
					<span class="bd-card-dot green"></span>
				</div>
			</div>
		</div>

		<div class="bd-card">
			<div class="bd-card-ico orange" aria-hidden="true">
				<svg viewBox="0 0 24 24" fill="none" stroke="#ea580c" stroke-width="2">
					<path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/>
					<polyline points="14 2 14 8 20 8"/>
					<line x1="16" y1="13" x2="8" y2="13"/>
					<line x1="16" y1="17" x2="8" y2="17"/>
				</svg>
			</div>
			<div class="bd-card-body">
				<div class="label">Drafts</div>
				<div class="bd-card-value-row">
					<span class="value">{{$summary.draft_fmt}}</span>
					<span class="bd-card-dot orange"></span>
				</div>
			</div>
		</div>

		<div class="bd-card">
			<div class="bd-card-ico violet" aria-hidden="true">
				<svg viewBox="0 0 24 24" fill="none" stroke="#7c3aed" stroke-width="2">
					<path d="M12 2H2v10l9.29 9.29c.94.94 2.48.94 3.42 0l6.58-6.58c.94-.94.94-2.48 0-3.42L12 2Z"/>
					<path d="M7 7h.01"/>
				</svg>
			</div>
			<div class="bd-card-body">
				<div class="label">Document Types</div>
				<div class="bd-card-value-row">
					<span class="value">{{$summary.types_fmt}}</span>
				</div>
			</div>
		</div>

		<div class="bd-card">
			<div class="bd-card-ico sky" aria-hidden="true">
				<svg viewBox="0 0 24 24" fill="none" stroke="#0284c7" stroke-width="2">
					<polyline points="22 7 13.5 15.5 8.5 10.5 2 17"/>
					<polyline points="16 7 22 7 22 13"/>
				</svg>
			</div>
			<div class="bd-card-body">
				<div class="label">Created (Last 30 Days)</div>
				<div class="bd-card-value-row">
					<span class="value">{{$summary.last30_fmt}}</span>
				</div>
			</div>
		</div>
	</div>

	{{if $coverage}}
	<div class="bd-panel" style="margin-bottom:16px;">
		<h2>Coverage</h2>
		<p style="color:#64748b;font-size:13px;margin:0 0 10px;">This table mixes HTML documents (edited here) and AI procedures (from AI Repository).</p>
		<ul style="margin:0;padding-left:18px;font-size:13px;line-height:1.6;">
			<li>HTML documents: {{$coverage.html_total}} ({{$coverage.html_with_body}} with content, {{$coverage.html_empty}} still blank)</li>
			<li>AI procedures in the table below: {{$coverage.ai_registered}}</li>
			{{if $coverage.stale_count > 0}}
			<li>In the table below, but turned off in AI Repository: {{$coverage.stale_count}}</li>
			{{/if}}
		</ul>
		{{if $coverage.orphan_count > 0}}
		<p style="margin:12px 0 6px;font-size:13px;"><strong>{{$coverage.orphan_count}} AI procedures are not in the table below</strong></p>
		<p style="color:#64748b;font-size:13px;margin:0 0 8px;">They still exist in AI Repository. They are just not listed on this screen yet.</p>
		<ul style="margin:0;padding-left:18px;font-size:13px;line-height:1.6;">
			{{foreach from=$coverage.orphans item=orphan}}
			<li>{{$orphan.title|escape:'html'}}</li>
			{{/foreach}}
			{{if $coverage.orphan_more > 0}}
			<li>and {{$coverage.orphan_more}} more</li>
			{{/if}}
		</ul>
		{{else}}
		<p style="margin:12px 0 0;font-size:13px;color:#166534;">Every AI procedure is already in the table below. Nothing is missing.</p>
		{{/if}}
	</div>
	{{/if}}

	<div id="createPanel" class="bd-panel {{if !$show_create && !$error}}create-hidden{{/if}}">
		<h2>Create HTML page</h2>
		<p style="color:#64748b;font-size:13px;margin:0 0 12px;">This form saves an HTML Business Document. To add an AI procedure, use <strong>+ AI procedure</strong> (opens AI Repository). Procedures are not edited in this HTML form.</p>
		<form name="createUrl" method="post" action="{{$BASE_URL}}business_document.home" onsubmit="return validateCreateUrl();">
			<input type="hidden" name="show_create" value="1" />
			<input type="hidden" name="autosave_utp_id" id="autosave_utp_id" value="" />
			<div class="bd-grid-2">
				<div class="bd-row">
					<label for="url_type_id">Document Type <span class="bd-req">*</span></label>
					<select name="url_type_id" id="url_type_id" onchange="clearCreateFieldError('url_type_id'); updatePathPreview();">
						<option value="">Select type...</option>
						{{foreach from=$types item=type}}
						<option value="{{$type.utt_id}}" data-slug="{{$type.utt_slug}}" {{if $form_type_id == $type.utt_id}}selected{{/if}}>{{$type.utt_name}}</option>
						{{/foreach}}
					</select>
					<div id="err_url_type_id" class="bd-field-error" style="display:none;color:#dc2626;font-weight:700;">Please select a Document Type.</div>
				</div>
				<div class="bd-row">
					<label for="url_name">Document Name <span class="bd-req">*</span></label>
					<input type="text" name="url_name" id="url_name" value="{{$form_name|escape:'html'}}" placeholder="e.g. Building Contract Procedure" oninput="clearCreateFieldError('url_name'); updatePathPreview();" onkeyup="clearCreateFieldError('url_name'); updatePathPreview();" />
					<div id="err_url_name" class="bd-field-error" style="display:none;color:#dc2626;font-weight:700;">Please enter a Document Name.</div>
				</div>
			</div>

			<div class="bd-row">
				<label for="url_template">Page template</label>
				<select name="url_template" id="url_template">
					<option value="" {{if $form_template == ''}}selected{{/if}}>Match document type</option>
					<option value="blank" {{if $form_template == 'blank'}}selected{{/if}}>Blank (no sections)</option>
					{{foreach from=$page_templates item=tpl}}
					<option value="{{$tpl.key|escape:'html'}}" {{if $form_template == $tpl.key}}selected{{/if}}>{{$tpl.title|escape:'html'}} — {{$tpl.description|escape:'html'}}</option>
					{{/foreach}}
				</select>
				<div style="color:#64748b;font-size:12px;margin-top:6px;">If HTML is empty, the chosen template fills in the standard headings. Existing documents are not changed.</div>
			</div>

			<div class="bd-grid-2">
				<div class="bd-row">
					<label for="url_access">Access</label>
					<select name="url_access" id="url_access">
						<option value="internal" {{if $form_access != 'public'}}selected{{/if}}>Internal / Private</option>
						<option value="public" {{if $form_access == 'public'}}selected{{/if}}>Public</option>
					</select>
				</div>
				<div class="bd-row">
					<label for="url_status">Status</label>
					<select name="url_status" id="url_status">
						<option value="draft" {{if $form_status != 'live'}}selected{{/if}}>Draft</option>
						<option value="live" {{if $form_status == 'live'}}selected{{/if}}>Live</option>
					</select>
				</div>
			</div>

			<div class="bd-grid-2">
				<div class="bd-row">
					<label for="url_department">Owner / Department</label>
					<select name="url_department" id="url_department">
						<option value="">Select department...</option>
						{{foreach from=$departments item=dept}}
						<option value="{{$dept|escape:'html'}}" {{if $form_department == $dept}}selected{{/if}}>{{$dept|escape:'html'}}</option>
						{{/foreach}}
					</select>
				</div>
				<div class="bd-row">
					<label for="url_ai_ready">AI Ready</label>
					<select name="url_ai_ready" id="url_ai_ready">
						<option value="0" {{if !$form_ai_ready}}selected{{/if}}>No</option>
						<option value="1" {{if $form_ai_ready}}selected{{/if}}>Yes</option>
					</select>
				</div>
			</div>

			<div class="bd-row">
				<label for="url_html">HTML Content <span style="font-weight:500;color:#64748b;">(optional — can add later)</span></label>
				<textarea name="url_html" id="url_html">{{$form_html|escape:'html'}}</textarea>
			</div>

			<div class="bd-row">
				<label>Generated Path Preview</label>
				<div class="bd-preview" id="pathPreview">/type/name</div>
			</div>

			<div style="text-align:right;">
				<button type="button" class="bd-btn bd-btn-ghost" onclick="toggleCreateForm(false);">Cancel</button>
				<input type="submit" name="subCreateUrl" value="Create HTML page" class="bd-btn bd-btn-primary" />
				<span id="gcons-autosave-status" style="margin-left:10px;color:#64748b;font-size:13px;"></span>
			</div>
		</form>
	</div>

	<form method="get" action="{{$BASE_URL}}business_document.home" class="bd-filters">
		<input type="hidden" name="sort_by" value="{{$sort_by|default:'updated'}}" />
		<input type="hidden" name="sort_dir" value="{{$sort_dir|default:'desc'}}" />
		<select name="filter_source">
			<option value="">All sources</option>
			<option value="html" {{if $filter_source == 'html'}}selected{{/if}}>HTML pages</option>
			<option value="ai" {{if $filter_source == 'ai'}}selected{{/if}}>AI Repository</option>
			<option value="email" {{if $filter_source == 'email'}}selected{{/if}}>Email Library</option>
			<option value="menu" {{if $filter_source == 'menu'}}selected{{/if}}>GCONS Menu</option>
		</select>
		<select name="filter_type">
			<option value="0">All Types</option>
			{{foreach from=$types item=type}}
			<option value="{{$type.utt_id}}" {{if $filter_type == $type.utt_id}}selected{{/if}}>{{$type.utt_name}}</option>
			{{/foreach}}
		</select>
		<select name="filter_department">
			<option value="">All Departments</option>
			{{foreach from=$departments item=dept}}
			<option value="{{$dept|escape:'html'}}" {{if $filter_department == $dept}}selected{{/if}}>{{$dept|escape:'html'}}</option>
			{{/foreach}}
		</select>
		<select name="filter_status">
			<option value="">All Statuses</option>
			<option value="live" {{if $filter_status == 'live'}}selected{{/if}}>Live</option>
			<option value="draft" {{if $filter_status == 'draft'}}selected{{/if}}>Draft</option>
		</select>
		<select name="filter_access">
			<option value="">All Access</option>
			<option value="internal" {{if $filter_access == 'internal'}}selected{{/if}}>Internal</option>
			<option value="public" {{if $filter_access == 'public'}}selected{{/if}}>Public</option>
		</select>
		<input type="text" name="search_urls" value="{{$search_urls|escape:'html'}}" placeholder="Search names, path, department and HTML body..." />
		<button type="submit" class="bd-btn bd-btn-secondary bd-btn-sm">Search</button>
		<a href="{{$BASE_URL}}business_document.home" class="bd-btn bd-btn-ghost bd-btn-sm">Clear Filters</a>
	</form>

	<div class="bd-table-shell">
		<div class="bd-table-toolbar">
			<div>
				<h2>Documents</h2>
				<p>Filter by source. HTML pages can be edited here. AI, email and menu rows open in their own system (view).</p>
			</div>
		</div>
		<div class="bd-table-wrap">
		<table class="bd-table">
			<thead>
				<tr>
					<th>Type</th>
					<th>Document Name</th>
					<th>Live URL</th>
					<th>Access</th>
					<th>Status</th>
					<th>Owner / Department</th>
					<th>Source / System</th>
					<th>Created By</th>
					<th>
						<a class="bd-sort" href="{{$sort_updated_url}}" title="Sort by Last Updated">
							Last updated
							{{if $sort_dir == 'asc'}}
							<span class="bd-sort-icon active">▲</span>
							{{else}}
							<span class="bd-sort-icon active">▼</span>
							{{/if}}
						</a>
					</th>
					<th class="bd-col-ai">AI Ready</th>
					<th class="bd-col-actions">Actions</th>
				</tr>
			</thead>
			<tbody>
				{{if $pages|@count == 0}}
				<tr>
					<td colspan="11" style="text-align:center; color:#94a3b8; padding:36px;">No documents found.</td>
				</tr>
				{{else}}
				{{foreach from=$pages item=item}}
				<tr>
					<td>
						<span class="bd-type {{$item.type_tone|default:'slate'}}">
							{{if $item.type_icon == 'action'}}
							<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" aria-hidden="true">
								<path d="M16 4h2a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2"/>
								<rect x="8" y="2" width="8" height="4" rx="1" ry="1"/>
								<path d="m9 14 2 2 4-4"/>
							</svg>
							{{elseif $item.type_icon == 'template'}}
							<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" aria-hidden="true">
								<rect x="3" y="3" width="7" height="7" rx="1"/>
								<rect x="14" y="3" width="7" height="7" rx="1"/>
								<rect x="14" y="14" width="7" height="7" rx="1"/>
								<rect x="3" y="14" width="7" height="7" rx="1"/>
							</svg>
							{{else}}
							<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" aria-hidden="true">
								<path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/>
								<polyline points="14 2 14 8 20 8"/>
								<line x1="16" y1="13" x2="8" y2="13"/>
								<line x1="16" y1="17" x2="8" y2="17"/>
							</svg>
							{{/if}}
							{{$item.utt_name|default:'—'}}
						</span>
					</td>
					<td class="bd-name">
						<a href="{{$item.live_url}}" target="_blank">{{$item.utp_name|escape:'html'}}</a>
					</td>
					<td>
						<div class="bd-url-cell">
							<a class="bd-path" href="{{$item.live_url}}" target="_blank" title="{{$item.live_url|escape:'html'}}">{{$item.live_url}}</a>
							<button type="button" class="bd-copy-url" title="Copy URL" aria-label="Copy URL" onclick="copyLiveUrl(this, '{{$item.live_url|escape:'javascript'}}');">
								<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" aria-hidden="true">
									<rect x="9" y="9" width="13" height="13" rx="2" ry="2"/>
									<path d="M5 15H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v1"/>
								</svg>
							</button>
						</div>
					</td>
					<td>
						{{if $item.access_label == 'Public'}}
						<span class="bd-badge bd-badge-public">
							<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" aria-hidden="true">
								<circle cx="12" cy="12" r="10"/>
								<path d="M2 12h20"/>
								<path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"/>
							</svg>
							Public
						</span>
						{{else}}
						<span class="bd-badge bd-badge-internal">
							<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" aria-hidden="true">
								<rect x="3" y="11" width="18" height="11" rx="2" ry="2"/>
								<path d="M7 11V7a5 5 0 0 1 10 0v4"/>
							</svg>
							Internal
						</span>
						{{/if}}
					</td>
					<td>
						{{if $item.status_label == 'Live'}}
						<span class="bd-badge bd-badge-live"><span class="bd-dot bd-dot-live"></span> Live</span>
						{{else}}
						<span class="bd-badge bd-badge-draft"><span class="bd-dot bd-dot-draft"></span> Draft</span>
						{{/if}}
					</td>
					<td>{{if $item.utp_department}}{{$item.utp_department|escape:'html'}}{{else}}—{{/if}}</td>
					<td>{{if $item.source_label}}{{$item.source_label|escape:'html'}}{{else}}—{{/if}}</td>
					<td>{{if $item.created_by_label}}{{$item.created_by_label|escape:'html'}}{{else}}—{{/if}}</td>
					<td>
						{{if $item.updated_display}}{{$item.updated_display}}{{else}}—{{/if}}
						{{if $item.updated_by_label}}
						<div style="color:#64748b;font-size:12px;margin-top:2px;">by {{$item.updated_by_label|escape:'html'}}</div>
						{{/if}}
					</td>
					<td class="bd-col-ai">
						{{if $item.ai_ready}}
						<span class="bd-ai-yes" title="AI Ready">
							<svg viewBox="0 0 24 24" width="12" height="12" fill="none" stroke="#fff" stroke-width="3" aria-hidden="true"><polyline points="20 6 9 17 4 12"/></svg>
						</span>
						{{else}}
						<span class="bd-ai-no">—</span>
						{{/if}}
					</td>
					<td class="bd-actions">
						{{if $filter_trash}}
						<a class="bd-btn bd-btn-secondary bd-btn-sm" href="{{$BASE_URL}}business_document.delete?utp_id={{$item.utp_id}}&restore=1" onclick="return confirm('Restore this document from the recycle bin?');">Restore</a>
						{{if !$item.is_registry}}
						<a class="bd-btn bd-btn-sm danger" style="color:#b91c1c;" href="{{$BASE_URL}}business_document.delete?utp_id={{$item.utp_id}}&purge=1" onclick="return confirm('Permanently delete this document? A content snapshot will be kept in history, but the page will be removed from the recycle bin.');">Delete forever</a>
						{{/if}}
						{{else}}
						<a class="bd-btn bd-btn-secondary bd-btn-sm" href="{{$item.live_url}}" target="_blank">Open</a>
						{{if !$item.is_registry}}
						<a class="bd-btn bd-btn-secondary bd-btn-sm" href="{{$BASE_URL}}business_document.edit/utp_id/{{$item.utp_id}}">Edit HTML</a>
						{{/if}}
						<div class="bd-menu">
							<button type="button" class="bd-btn bd-btn-icon" onclick="toggleRowMenu(this);" title="More">⋯</button>
							<div class="bd-menu-panel">
								<a href="javascript:;" onclick="copyText('{{$item.live_url|escape:'javascript'}}');">Copy Link</a>
								{{if !$item.is_registry}}
								<a href="javascript:;" onclick="openDocumentHistory({{$item.utp_id}}, '{{$item.utp_name|escape:'javascript'}}');">History</a>
								{{/if}}
								{{if $item.is_registry}}
								<a href="{{$item.live_url}}" target="_blank">Open in {{$item.source_label|escape:'html'}}</a>
								{{/if}}
								<a class="danger" href="{{$BASE_URL}}business_document.delete/utp_id/{{$item.utp_id}}" onclick="return confirm('Move this document to the recycle bin?\n\nYou can restore it later. This is not a permanent delete.');">Delete</a>
							</div>
						</div>
						{{/if}}
					</td>
				</tr>
				{{/foreach}}
				{{/if}}
			</tbody>
		</table>
		</div>
	</div>

	<div class="bd-footer">
		<div class="bd-footer-top">
			<div>Showing {{$showing_from}} to {{$showing_to}} of {{$total_count_fmt}} documents</div>
			<div class="bd-pager">
				{{if $page_num > 1}}
				<a href="{{$BASE_URL}}business_document.home?pagenum=1&{{$pager_qs}}" title="First">|&lt;</a>
				<a href="{{$BASE_URL}}business_document.home?pagenum={{$page_num-1}}&{{$pager_qs}}" title="Previous">&lt;</a>
				{{else}}
				<span class="disabled">|&lt;</span>
				<span class="disabled">&lt;</span>
				{{/if}}

				{{foreach from=$pager_nums item=pn}}
					{{if $pn == '...'}}
					<span class="ellipsis">...</span>
					{{elseif $pn == $page_num}}
					<span class="current">{{$pn}}</span>
					{{else}}
					<a href="{{$BASE_URL}}business_document.home?pagenum={{$pn}}&{{$pager_qs}}">{{$pn}}</a>
					{{/if}}
				{{/foreach}}

				{{if $page_num < $total_pages}}
				<a href="{{$BASE_URL}}business_document.home?pagenum={{$page_num+1}}&{{$pager_qs}}" title="Next">&gt;</a>
				<a href="{{$BASE_URL}}business_document.home?pagenum={{$total_pages}}&{{$pager_qs}}" title="Last">&gt;|</a>
				{{else}}
				<span class="disabled">&gt;</span>
				<span class="disabled">&gt;|</span>
				{{/if}}
			</div>
		</div>

		<div class="bd-legend-bar">
			<span class="bd-legend-label">Access Legend:</span>
			<span class="bd-legend-item">
				<svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="#93c5fd" stroke-width="2" aria-hidden="true">
					<rect x="3" y="11" width="18" height="11" rx="2" ry="2"/>
					<path d="M7 11V7a5 5 0 0 1 10 0v4"/>
				</svg>
				Internal / Private – Authorised users only
			</span>
			<span class="bd-legend-item">
				<svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="#93c5fd" stroke-width="2" aria-hidden="true">
					<circle cx="12" cy="12" r="10"/>
					<path d="M2 12h20"/>
					<path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"/>
				</svg>
				Public – Accessible externally
			</span>
			<span class="bd-legend-note">
				<svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="#fde68a" stroke-width="2" aria-hidden="true">
					<path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/>
					<path d="m9 12 2 2 4-4"/>
				</svg>
				All new documents are created as Internal / Private by default.
			</span>
		</div>
	</div>
</div>

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
	var title = document.getElementById('gcons-history-title');
	var pager = document.getElementById('gcons-history-pager');
	var pageLabel = document.getElementById('gcons-history-page-label');
	var qInput = document.getElementById('gcons-history-q');
	var page = 1;
	var pages = 1;
	var histId = 0;
	var searchTimer = null;

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

	window.openDocumentHistory = function (id, name) {
		histId = parseInt(id, 10) || 0;
		page = 1;
		if (title) {
			title.textContent = name ? ('History — ' + name) : 'History';
		}
		if (qInput) {
			qInput.value = '';
		}
		if (!modal || histId <= 0) {
			return;
		}
		modal.style.display = 'block';
		document.body.style.overflow = 'hidden';
		loadPage(1);
		if (qInput) {
			setTimeout(function () { qInput.focus(); }, 50);
		}
	};

	function closeHistory() {
		if (!modal) {
			return;
		}
		modal.style.display = 'none';
		document.body.style.overflow = '';
	}

	function loadPage(nextPage) {
		if (!box || histId <= 0) {
			return;
		}
		box.textContent = 'Loading history…';
		var q = searchValue();
		fetch('{{$BASE_URL}}business_document.home?ajax=history&utp_id=' + histId + '&page=' + nextPage + '&q=' + encodeURIComponent(q), {
			credentials: 'same-origin'
		}).then(function (res) { return res.json(); }).then(function (data) {
			var items = (data && data.items) ? data.items : [];
			page = parseInt(data && data.page, 10) || 1;
			pages = parseInt(data && data.pages, 10) || 1;
			var total = parseInt(data && data.total, 10) || items.length;
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
			html += '<th style="padding:6px 8px;">Size</th>';
			html += '<th style="padding:6px 0 6px 8px;">Restore</th>';
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
				var howMap = {
					api: 'AI endpoint',
					autosave: 'Autosave',
					create: 'Created',
					delete: 'Moved to recycle bin',
					purge: 'Permanently deleted',
					restore: 'Restored'
				};
				var how = howMap[source] || 'Save Document';
				var bytes = parseInt(row.uta_html_after_bytes, 10) || 0;
				if (source === 'delete' || source === 'purge') {
					bytes = parseInt(row.uta_html_before_bytes, 10) || bytes;
				}
				var size = bytes > 1048576 ? ((bytes / 1048576).toFixed(1) + ' MB') : (Math.round(bytes / 1024) + ' KB');
				if (String(row.uta_truncated) === '1') {
					size += ' (previous body not kept)';
				}
				var canRestore = String(row.has_restore) === '1' || String(row.has_restore) === 'true';
				var restoreCell = canRestore
					? '<button type="button" class="bd-btn bd-btn-secondary bd-btn-sm gcons-restore-hist" data-uta-id="' + String(row.uta_id || '') + '">Restore content</button>'
					: '<span style="color:#94a3b8;">—</span>';
				html += '<tr>';
				html += '<td style="padding:8px 8px 8px 0;border-top:1px solid #e2e8f0;white-space:nowrap;">' + formatWhen(when) + '</td>';
				html += '<td style="padding:8px;border-top:1px solid #e2e8f0;"><span style="display:inline-block;padding:2px 8px;border-radius:999px;font-weight:600;' + whoStyle + '">' + whoText.replace(/</g, '') + '</span></td>';
				html += '<td style="padding:8px;border-top:1px solid #e2e8f0;">' + how + '</td>';
				html += '<td style="padding:8px;border-top:1px solid #e2e8f0;color:#64748b;">' + size + '</td>';
				html += '<td style="padding:8px 0 8px 8px;border-top:1px solid #e2e8f0;">' + restoreCell + '</td>';
				html += '</tr>';
			});
			html += '</tbody></table>';
			box.innerHTML = html;
			var restoreBtns = box.querySelectorAll('.gcons-restore-hist');
			for (var r = 0; r < restoreBtns.length; r++) {
				restoreBtns[r].addEventListener('click', function () {
					var utaId = this.getAttribute('data-uta-id');
					if (!utaId || histId <= 0) {
						return;
					}
					if (!window.confirm('Restore this document to the content from this history row?\n\nCurrent content will be replaced. A new history entry will be saved.')) {
						return;
					}
					var btn = this;
					btn.disabled = true;
					btn.textContent = 'Restoring…';
					var body = new URLSearchParams();
					body.append('ajax', 'restore_history');
					body.append('uta_id', utaId);
					body.append('utp_id', String(histId));
					fetch('{{$BASE_URL}}business_document.home', {
						method: 'POST',
						credentials: 'same-origin',
						headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
						body: body.toString()
					}).then(function (res) { return res.json(); }).then(function (data) {
						if (data && data.ok) {
							alert(data.message || 'Restored.');
							if (data.edit_url) {
								window.location.href = data.edit_url;
								return;
							}
							loadHistory(page);
							return;
						}
						alert((data && data.message) ? data.message : 'Restore failed.');
						btn.disabled = false;
						btn.textContent = 'Restore content';
					}).catch(function () {
						alert('Restore failed.');
						btn.disabled = false;
						btn.textContent = 'Restore content';
					});
				});
			}
		}).catch(function () {
			box.textContent = 'Could not load history.';
		});
	}

	var closeBtn = document.getElementById('gcons-history-close');
	var prevBtn = document.getElementById('gcons-history-prev');
	var nextBtn = document.getElementById('gcons-history-next');
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
	var idleBusy = false;
	var idlePending = false;
	var lastSent = '';
	var autosaveSeq = 0;

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

	function setEditorHtml(html) {
		if (window.GCONS_CKEditor5 && window.GCONS_CKEditor5.editors) {
			var map = window.GCONS_CKEditor5.editors;
			var keys = Object.keys(map);
			if (keys.length && map[keys[0]] && typeof map[keys[0]].setData === 'function') {
				map[keys[0]].setData(html || '');
				return;
			}
		}
		if (typeof CKEDITOR !== 'undefined' && CKEDITOR.instances && CKEDITOR.instances.url_html && typeof CKEDITOR.instances.url_html.setData === 'function') {
			CKEDITOR.instances.url_html.setData(html || '');
			return;
		}
		var ta = document.getElementById('url_html');
		if (ta) {
			ta.value = html || '';
		}
	}

	function fieldValue(id) {
		var el = document.getElementById(id);
		return el ? String(el.value || '') : '';
	}

	function htmlLooksBlank(html) {
		html = String(html || '');
		var text = html
			.replace(/<[^>]*>/g, ' ')
			.replace(/&nbsp;/gi, ' ')
			.replace(/\s+/g, ' ')
			.replace(/^\s+|\s+$/g, '');
		return text === '';
	}

	function canSave() {
		if (fieldValue('url_type_id') === '' || fieldValue('url_name').replace(/^\s+|\s+$/g, '') === '') {
			return false;
		}
		// Existing draft: always allow field/HTML updates
		if (fieldValue('autosave_utp_id') !== '') {
			return true;
		}
		// New doc: do not create from name/type autofill alone (LastPass + Back orphans)
		if (fieldValue('url_template') !== '') {
			return true;
		}
		return !htmlLooksBlank(editorHtml());
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
			fieldValue('url_type_id'),
			fieldValue('url_name').replace(/^\s+|\s+$/g, ''),
			fieldValue('url_access'),
			fieldValue('url_status'),
			fieldValue('url_department'),
			fieldValue('url_ai_ready'),
			fieldValue('url_template'),
			fieldValue('autosave_utp_id')
		].join('\x1e');
	}

	function buildBody(html, seq) {
		var body = new FormData();
		body.append('ajax', 'autosave');
		body.append('autosave_seq', String(seq));
		body.append('url_type_id', fieldValue('url_type_id'));
		body.append('url_name', fieldValue('url_name').replace(/^\s+|\s+$/g, ''));
		body.append('url_html', html || '');
		body.append('url_access', fieldValue('url_access'));
		body.append('url_status', fieldValue('url_status'));
		body.append('url_department', fieldValue('url_department'));
		body.append('url_ai_ready', fieldValue('url_ai_ready'));
		body.append('url_template', fieldValue('url_template'));
		body.append('autosave_utp_id', fieldValue('autosave_utp_id'));
		return body;
	}

	function saveNow() {
		if (!canSave()) {
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
		return fetch('{{$BASE_URL}}business_document.home?ajax=autosave', {
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
				if (data.utp_id) {
					var hid = document.getElementById('autosave_utp_id');
					if (hid) {
						hid.value = String(data.utp_id);
					}
				}
				if (data.ignored) {
					idlePending = true;
					return false;
				}
				lastSent = contentKey(editorHtml());
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

	function bindForm() {
		var form = document.querySelector('#createPanel form');
		if (!form || form.getAttribute('data-gcons-idle') === '1') {
			return;
		}
		form.setAttribute('data-gcons-idle', '1');
		form.addEventListener('input', scheduleSave);
		form.addEventListener('change', scheduleSave);
	}
	if (document.readyState === 'loading') {
		document.addEventListener('DOMContentLoaded', bindForm);
	} else {
		bindForm();
	}
})();

if (typeof CKEDITOR !== 'undefined') {
	CKEDITOR.replace('url_html', {
		height: 280,
		allowedContent: true
	});
}

function toggleCreateForm(show) {
	var panel = document.getElementById('createPanel');
	if (!panel) { return; }
	if (show) {
		panel.className = panel.className.replace('create-hidden', '').replace(/\s+/g, ' ').trim();
		panel.scrollIntoView({ behavior: 'smooth', block: 'start' });
	} else {
		if (panel.className.indexOf('create-hidden') === -1) {
			panel.className = (panel.className + ' create-hidden').replace(/\s+/g, ' ').trim();
		}
	}
}

function toggleRowMenu(btn) {
	var menu = btn.parentNode;
	var open = document.querySelectorAll('.bd-menu.open');
	for (var i = 0; i < open.length; i++) {
		if (open[i] !== menu) {
			open[i].className = open[i].className.replace(' open', '');
		}
	}
	if (menu.className.indexOf('open') === -1) {
		menu.className += ' open';
	} else {
		menu.className = menu.className.replace(' open', '');
	}
}

document.addEventListener('click', function (e) {
	if (!e.target.closest || !e.target.closest('.bd-menu')) {
		var open = document.querySelectorAll('.bd-menu.open');
		for (var i = 0; i < open.length; i++) {
			open[i].className = open[i].className.replace(' open', '');
		}
	}
});

function slugify(text) {
	return (text || '')
		.toLowerCase()
		.trim()
		.replace(/[^a-z0-9]+/g, '-')
		.replace(/^-+|-+$/g, '');
}

function updatePathPreview() {
	var sel = document.getElementById('url_type_id');
	var nameEl = document.getElementById('url_name');
	if (!nameEl) { return; }
	var name = nameEl.value;
	var typeSlug = 'type';
	if (sel && sel.selectedIndex > 0) {
		typeSlug = sel.options[sel.selectedIndex].getAttribute('data-slug') || 'type';
	}
	var nameSlug = slugify(name) || 'name';
	document.getElementById('pathPreview').innerHTML = '/' + typeSlug + '/' + nameSlug;
}

function setCreateFieldError(fieldId, show) {
	var field = document.getElementById(fieldId);
	var err = document.getElementById('err_' + fieldId);
	if (field) {
		if (show) {
			if ((' ' + field.className + ' ').indexOf(' bd-input-invalid ') === -1) {
				field.className = (field.className + ' bd-input-invalid').replace(/\s+/g, ' ').trim();
			}
			field.style.borderColor = '#dc2626';
			field.style.boxShadow = '0 0 0 3px rgba(220, 38, 38, 0.18)';
			field.style.outline = 'none';
		} else {
			field.className = field.className.replace(/\bbd-input-invalid\b/g, '').replace(/\s+/g, ' ').trim();
			field.style.borderColor = '';
			field.style.boxShadow = '';
			field.style.outline = '';
		}
	}
	if (err) {
		if (show) {
			if ((' ' + err.className + ' ').indexOf(' is-visible ') === -1) {
				err.className = (err.className + ' is-visible').replace(/\s+/g, ' ').trim();
			}
			err.style.display = 'block';
			err.style.color = '#dc2626';
			err.style.fontWeight = '700';
		} else {
			err.className = err.className.replace(/\bis-visible\b/g, '').replace(/\s+/g, ' ').trim();
			err.style.display = 'none';
			err.style.color = '';
		}
	}
}

function clearCreateFieldError(fieldId) {
	var field = document.getElementById(fieldId);
	if (!field) {
		return;
	}
	var value = (field.value || '').replace(/^\s+|\s+$/g, '');
	if (value !== '') {
		setCreateFieldError(fieldId, false);
	}
}

function validateCreateUrl() {
	if (typeof CKEDITOR !== 'undefined' && CKEDITOR.instances.url_html) {
		CKEDITOR.instances.url_html.updateElement();
	}
	var typeId = document.getElementById('url_type_id').value;
	var name = document.getElementById('url_name').value.replace(/^\s+|\s+$/g, '');
	var typeOk = !!typeId;
	var nameOk = !!name;

	/* Show all required-field errors together (normal website pattern) */
	setCreateFieldError('url_type_id', !typeOk);
	setCreateFieldError('url_name', !nameOk);

	if (!typeOk || !nameOk) {
		var firstBad = !typeOk ? document.getElementById('url_type_id') : document.getElementById('url_name');
		if (firstBad && firstBad.focus) {
			firstBad.focus();
		}
		return false;
	}
	return true;
}

function copyLiveUrl(btn, text) {
	function done() {
		if (!btn) {
			return;
		}
		btn.className = (btn.className || '').replace(/\bis-copied\b/g, '') + ' is-copied';
		btn.title = 'Copied';
		setTimeout(function () {
			btn.className = (btn.className || '').replace(/\bis-copied\b/g, '').replace(/^\s+|\s+$/g, '');
			btn.title = 'Copy URL';
		}, 1200);
	}
	if (navigator.clipboard && navigator.clipboard.writeText) {
		navigator.clipboard.writeText(text).then(done).catch(function () {
			fallbackCopy(text);
			done();
		});
	} else {
		fallbackCopy(text);
		done();
	}
}

function copyText(text) {
	if (navigator.clipboard && navigator.clipboard.writeText) {
		navigator.clipboard.writeText(text).then(function () {
			alert('Link copied.');
		}).catch(function () {
			fallbackCopy(text);
		});
	} else {
		fallbackCopy(text);
	}
}

function fallbackCopy(text) {
	var ta = document.createElement('textarea');
	ta.value = text;
	document.body.appendChild(ta);
	ta.select();
	try {
		document.execCommand('copy');
		alert('Link copied.');
	} catch (e) {
		prompt('Copy this link:', text);
	}
	document.body.removeChild(ta);
}

updatePathPreview();
</script>
