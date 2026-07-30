<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<style>
.hitl-panel { border:1px solid #ccc; border-radius:6px; padding:14px; margin-bottom:16px; background:#fff; }
.hitl-flag-card { border:1px solid #ddd; border-radius:6px; padding:12px; margin-bottom:12px; background:#fafafa; }
.hitl-flag-card.is-active-preview { border-color:#163c6d; box-shadow:0 0 0 2px rgba(22,60,109,0.15); }
.hitl-sev-critical { border-left:4px solid #dc3545; }
.hitl-sev-major { border-left:4px solid #fd7e14; }
.hitl-sev-minor { border-left:4px solid #ffc107; }
.hitl-meta { color:#555; font-size:12px; margin-bottom:8px; }
.hitl-actions { margin-top:10px; }
.hitl-actions textarea { width:100%; min-height:60px; margin:6px 0; box-sizing:border-box; }
.hitl-loader { display:none; position:fixed; inset:0; background:rgba(255,255,255,0.85); z-index:99999; align-items:center; justify-content:center; }
.hitl-loader.is-visible { display:flex; }
.hitl-loader-box { padding:20px 28px; border:1px solid #ccc; border-radius:8px; background:#fff; text-align:center; font-weight:bold; color:#163c6d; }
.hitl-status-box { background:#eef4ff; padding:10px; border-radius:4px; margin-bottom:12px; }
.hitl-processing { background:#fff8e1; color:#856404; padding:10px; border-radius:4px; margin-bottom:12px; }
.hitl-approved { background:#e8f5e9; color:#1b5e20; padding:10px; border-radius:4px; margin-bottom:12px; border:1px solid #a5d6a7; }
.hitl-terminal-note { background:#e3f2fd; color:#0d47a1; padding:10px; border-radius:4px; margin-bottom:12px; border:1px solid #90caf9; }
.hitl-issue-summary { background:#fff; border-left:3px solid #163c6d; padding:8px 10px; margin:8px 0; line-height:1.45; }
.hitl-location-box { background:#f0f6ff; border:1px solid #d9e6f5; border-radius:4px; padding:8px 10px; margin:8px 0; font-size:12px; color:#163c6d; }
.hitl-location-box code { font-size:12px; }
.hitl-layout { display:flex; gap:16px; align-items:flex-start; width:100%; }
.hitl-col-flags { flex:0 0 46%; max-width:46%; }
.hitl-col-preview { flex:1 1 54%; min-width:0; position:sticky; top:10px; }
.hitl-preview-frame-wrap { border:1px solid #ccc; border-radius:6px; overflow:hidden; background:#fff; }
.hitl-preview-toolbar { padding:8px 10px; background:#163c6d; color:#fff; font-size:12px; display:flex; justify-content:space-between; align-items:center; gap:8px; }
.hitl-preview-toolbar a { color:#fff; }
.hitl-preview-frame { width:100%; height:78vh; border:0; background:#fff; }
@media (max-width: 1100px) {
	.hitl-layout { display:block; }
	.hitl-col-flags, .hitl-col-preview { max-width:100%; flex:none; }
	.hitl-col-preview { position:static; margin-top:16px; }
	.hitl-preview-frame { height:60vh; }
}
</style>

<script type="text/javascript">
var HitlReviewConfig = {
	did: '{{$did}}',
	actionUrl: '{{$hitlActionUrl}}',
	reviewUrl: '{{$hitlReviewUrl}}',
	isProcessing: {{if $isProcessing}}true{{else}}false{{/if}},
	isApproved: {{if $isApproved}}true{{else}}false{{/if}},
	hasFixing: {{if $fixingCount > 0}}true{{else}}false{{/if}}
};

var HitlReview = {
	cfg: null,

	init: function() {
		this.cfg = HitlReviewConfig || {};
		var self = this;

		if (this.cfg.isProcessing || this.cfg.hasFixing) {
			setInterval(function() {
				self.postAction({ action: 'poll_status' }, function(resp) {
					if (!resp || !resp.data) { return; }
					var pipeline = resp.data.pipeline_status || '';
					var hitl = resp.data.hitl_status || '';
					if (pipeline === 'complete' || pipeline === 'failed' || hitl === 'approved') {
						window.location.reload();
					}
				}, true);
			}, 5000);
		}

		// After reject/fix, if all flags may be terminal, poll until approved.
		if (!this.cfg.isApproved && !this.cfg.isProcessing) {
			setInterval(function() {
				self.postAction({ action: 'poll_status' }, function(resp) {
					if (resp && resp.data && resp.data.hitl_status === 'approved') {
						window.location.reload();
					}
				}, true);
			}, 8000);
		}
	},

	showLoader: function(text) {
		var el = document.getElementById('hitl-loader-text');
		var box = document.getElementById('hitl-loader');
		if (el) { el.innerHTML = text || 'Processing...'; }
		if (box) { box.className = 'hitl-loader is-visible'; }
	},

	hideLoader: function() {
		var box = document.getElementById('hitl-loader');
		if (box) { box.className = 'hitl-loader'; }
	},

	getCard: function(btn) {
		var node = btn;
		while (node && ('' + node.className).indexOf('hitl-flag-card') === -1) {
			node = node.parentNode;
		}
		return node;
	},

	getFlagId: function(card) {
		if (!card) { return ''; }
		return card.getAttribute('data-flag-id') || '';
	},

	postAction: function(data, onDone, silent) {
		var self = this;
		data.did = this.cfg.did;
		var body = [];
		var key;
		for (key in data) {
			if (data.hasOwnProperty(key)) {
				body.push(encodeURIComponent(key) + '=' + encodeURIComponent(data[key]));
			}
		}

		var xhr = new XMLHttpRequest();
		xhr.open('POST', this.cfg.actionUrl, true);
		xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		xhr.onreadystatechange = function() {
			if (xhr.readyState !== 4) { return; }
			var resp = null;
			try {
				resp = JSON.parse(xhr.responseText);
			} catch (e) {
				if (!silent) {
					alert('Request failed - invalid response from server');
					self.hideLoader();
				}
				return;
			}
			if (resp && resp.success) {
				if (onDone) { onDone(resp); }
			} else if (!silent) {
				alert((resp && resp.message) ? resp.message : 'Action failed');
				self.hideLoader();
			}
		};
		xhr.send(body.join('&'));
	},

	applyFilters: function() {
		var statusEl = document.getElementById('hitl-filter-status');
		var severityEl = document.getElementById('hitl-filter-severity');
		var status = statusEl ? statusEl.value : '';
		var severity = severityEl ? severityEl.value : '';
		var url = this.cfg.reviewUrl + '/did/' + this.cfg.did;
		if (status !== '') { url += '/status/' + status; }
		if (severity !== '') { url += '/severity/' + severity; }
		window.location.href = url;
	},

	previewFlag: function(btnOrUrl, markCard) {
		var url = '';
		var card = null;
		if (typeof btnOrUrl === 'string') {
			url = btnOrUrl;
		} else {
			card = this.getCard(btnOrUrl);
			url = card ? (card.getAttribute('data-preview-url') || '') : '';
		}
		if (!url) { return false; }

		var frame = document.getElementById('hitl-procedure-frame');
		var label = document.getElementById('hitl-preview-label');
		var openLink = document.getElementById('hitl-preview-open');
		if (frame) { frame.src = url; }
		if (label) { label.innerHTML = 'Showing flagged section in procedure'; }
		if (openLink) { openLink.href = url; }

		var cards = document.getElementsByClassName('hitl-flag-card');
		var i;
		for (i = 0; i < cards.length; i++) {
			cards[i].className = ('' + cards[i].className).replace(/\s*is-active-preview/g, '');
		}
		if (markCard && card) {
			card.className = card.className + ' is-active-preview';
		}
		return false;
	},

	requestFix: function(btn) {
		var card = this.getCard(btn);
		var flagId = this.getFlagId(card);
		var commentEl = card ? card.getElementsByClassName('flag-comment-input')[0] : null;
		var comment = commentEl ? (commentEl.value || '').replace(/^\s+|\s+$/g, '') : '';
		if (!comment) {
			alert('Comment is required for AI fix');
			return;
		}
		var self = this;
		this.previewFlag(btn, true);
		this.showLoader('Requesting AI fix...');
		this.postAction({ action: 'comment', flag_id: flagId, comment: comment }, function() {
			self.showLoader('AI fix in progress. Refreshing...');
			setTimeout(function() { window.location.reload(); }, 1500);
		});
	},

	rejectFlag: function(btn) {
		if (!confirm('Reject this flag as irrelevant / false positive?')) { return; }
		var card = this.getCard(btn);
		var flagId = this.getFlagId(card);
		var commentEl = card ? card.getElementsByClassName('flag-comment-input')[0] : null;
		var comment = commentEl ? (commentEl.value || '').replace(/^\s+|\s+$/g, '') : '';
		var self = this;
		this.previewFlag(btn, true);
		this.showLoader('Rejecting flag...');
		this.postAction({ action: 'reject', flag_id: flagId, comment: comment }, function() {
			window.location.reload();
		});
	},

	saveContent: function(btn) {
		var card = this.getCard(btn);
		var flagId = this.getFlagId(card);
		var contentEl = card ? card.getElementsByClassName('flag-content-input')[0] : null;
		var contentText = contentEl ? (contentEl.value || '').replace(/^\s+|\s+$/g, '') : '';
		if (!contentText) {
			alert('Enter content JSON');
			return;
		}
		try {
			JSON.parse(contentText);
		} catch (e) {
			alert('Invalid JSON');
			return;
		}
		var self = this;
		this.previewFlag(btn, true);
		this.showLoader('Saving manual edit...');
		this.postAction({ action: 'edit_content', flag_id: flagId, content: contentText }, function() {
			window.location.reload();
		});
	}
};

if (window.addEventListener) {
	window.addEventListener('load', function() { HitlReview.init(); }, false);
} else {
	window.attachEvent('onload', function() { HitlReview.init(); });
}
</script>

<div id="hitl-loader" class="hitl-loader" aria-hidden="true">
	<div class="hitl-loader-box">
		<div id="hitl-loader-text">Processing...</div>
	</div>
</div>

<h3 class="page-title">{{$title}}</h3>
<p>
	<a href="{{$BASE_URL}}{{$XFA.review_queue}}">&laquo; Back to Review Queue</a>
	&nbsp;|&nbsp;
	<a href="{{$procedureBaseUrl}}" target="_blank">Open Full Procedure</a>
</p>

{{if $isApproved}}
<div class="hitl-approved">
	<strong>Auto-approved.</strong> All flags are resolved. Document is live (<code>hitl_status = approved</code>).
	There is no separate Approve button — approval happens automatically when every flag is fixed, rejected, or needs_manual_edit (then resolved).
</div>
{{elseif $allTerminal}}
<div class="hitl-terminal-note">
	<strong>All listed flags are in a terminal state.</strong>
	Open: {{$openCount}} &middot; Fixing: {{$fixingCount}} &middot; Terminal: {{$terminalCount}}.
	Polling status for auto-approval&hellip;
</div>
{{/if}}

<div class="hitl-panel">
	<h4>Pipeline Status</h4>
	<div class="hitl-status-box">
		<strong>DID:</strong> {{$did}}<br />
		{{if $pipelineStatus.pipeline_status}}
		<strong>Pipeline:</strong> {{$pipelineStatus.pipeline_status}}<br />
		{{/if}}
		{{if $hitlStatus}}
		<strong>HITL:</strong> {{$hitlStatus}}<br />
		{{/if}}
		{{if $pipelineStatus.started_at}}
		<strong>Started:</strong> {{$pipelineStatus.started_at}}<br />
		{{/if}}
		{{if $pipelineStatus.completed_at}}
		<strong>Completed:</strong> {{$pipelineStatus.completed_at}}<br />
		{{/if}}
		{{if $pipelineStatus.error}}
		<strong style="color:#c00;">Error:</strong> {{$pipelineStatus.error}}<br />
		{{/if}}
		<strong>Open flags:</strong> {{$openFlagsApi}} / {{$flagsCountApi}}
		&nbsp;|&nbsp; On this page: open {{$openCount}}, fixing {{$fixingCount}}, terminal {{$terminalCount}}
	</div>
</div>

{{if $isProcessing}}
<div class="hitl-processing" id="hitl-processing-banner">
	Pipeline is still processing. This page will refresh automatically...
</div>
{{/if}}

{{if $apiError}}
<p style="color:#c00;">{{$apiError}}</p>
{{/if}}

{{if !$isProcessing}}
<div class="hitl-panel">
	<h4>Filters</h4>
	<label>Status:</label>
	<select id="hitl-filter-status">
		<option value="" {{if $statusFilter == ''}}selected{{/if}}>All</option>
		<option value="open" {{if $statusFilter == 'open'}}selected{{/if}}>Open</option>
		<option value="fixing" {{if $statusFilter == 'fixing'}}selected{{/if}}>Fixing</option>
		<option value="fixed" {{if $statusFilter == 'fixed'}}selected{{/if}}>Fixed</option>
		<option value="rejected" {{if $statusFilter == 'rejected'}}selected{{/if}}>Rejected</option>
		<option value="needs_manual_edit" {{if $statusFilter == 'needs_manual_edit'}}selected{{/if}}>Needs Manual Edit</option>
	</select>
	&nbsp;
	<label>Severity:</label>
	<select id="hitl-filter-severity">
		<option value="" {{if $severityFilter == ''}}selected{{/if}}>All</option>
		<option value="critical" {{if $severityFilter == 'critical'}}selected{{/if}}>Critical</option>
		<option value="major" {{if $severityFilter == 'major'}}selected{{/if}}>Major</option>
		<option value="minor" {{if $severityFilter == 'minor'}}selected{{/if}}>Minor</option>
	</select>
	&nbsp;
	<input type="button" value="Apply" class="vsml" onclick="HitlReview.applyFilters(); return false;" />
</div>

<div class="hitl-layout">
	<div class="hitl-col-flags">
		<div class="hitl-panel">
			<h4>Flags ({{$flags|@count}})</h4>
			<p class="hitl-meta">Click <strong>Show in Procedure</strong> to jump the right-hand preview to that flagged section. Then reject, request AI fix, or edit.</p>
			{{if $flags}}
			{{foreach from=$flags item="flag"}}
			<div class="hitl-flag-card hitl-sev-{{$flag.severity}}"
				id="flag-card-{{$flag.flag_id}}"
				data-flag-id="{{$flag.flag_id}}"
				data-status="{{$flag.status}}"
				data-preview-url="{{$flag.procedure_view_url}}">
				<div class="hitl-meta">
					<strong>{{$flag.flag_id}}</strong> |
					Severity: <strong>{{$flag.severity}}</strong> |
					{{if $flag.category}}Category: {{$flag.category}} |{{/if}}
					Status: <strong class="flag-status-label">{{$flag.status}}</strong>
				</div>

				{{if $flag.issue_summary}}
				<p class="hitl-issue-summary"><strong>Review comment:</strong> {{$flag.issue_summary}}</p>
				{{elseif $flag.issue}}
				<p><strong>Issue:</strong> {{$flag.issue}}</p>
				{{/if}}

				{{if $flag.issue && $flag.issue_summary}}
				<p class="hitl-meta"><strong>Short issue:</strong> {{$flag.issue}}</p>
				{{/if}}

				{{if $flag.location}}
				<div class="hitl-location-box">
					<strong>Where in procedure:</strong>
					{{if $flag.location.section}} Section <code>{{$flag.location.section}}</code>{{/if}}
					{{if $flag.location.step_title}} &middot; Step: {{$flag.location.step_title}}{{/if}}
					{{if $flag.location.substep_number}} &middot; Substep {{$flag.location.substep_number}}{{/if}}
					{{if $flag.location.substep_title}} ({{$flag.location.substep_title}}){{/if}}
					{{if $flag.location.after_substep}} &middot; Missing after {{$flag.location.after_substep}}{{/if}}
				</div>
				{{/if}}

				{{if $flag.original_sentence}}<p><strong>Original:</strong> {{$flag.original_sentence}}</p>{{/if}}
				{{if $flag.solution}}<p><strong>Suggested fix:</strong> {{$flag.solution}}</p>{{/if}}
				{{if $flag.reviewer_comment}}<p><strong>Reviewer comment:</strong> {{$flag.reviewer_comment}}</p>{{/if}}
				{{if $flag.reviewed_by}}<p class="hitl-meta">Reviewed by {{$flag.reviewed_by}}{{if $flag.reviewed_at}} at {{$flag.reviewed_at}}{{/if}}</p>{{/if}}

				<p>
					<input type="button" value="Show in Procedure" class="vsml"
						onclick="return HitlReview.previewFlag(this, true);" />
					<input type="button" value="Open in New Tab" class="vsml"
						onclick="window.open('{{$flag.procedure_view_url}}', '_blank'); return false;" />
				</p>

				{{if $flag.status == 'open'}}
				<div class="hitl-actions">
					<textarea class="flag-comment-input" placeholder="Comment for AI fix (required for Request AI Fix)"></textarea>
					<input type="button" value="Request AI Fix" class="vsml" onclick="HitlReview.requestFix(this); return false;" />
					<input type="button" value="Reject Flag" class="vsml" onclick="HitlReview.rejectFlag(this); return false;" />
				</div>
				{{/if}}

				{{if $flag.status == 'needs_manual_edit' || $flag.status == 'open'}}
				<div class="hitl-actions manual-edit-block">
					<p><strong>Manual content edit</strong> — pre-filled for this flag&rsquo;s section. Edit values, then save.</p>
					<textarea class="flag-content-input" rows="8">{{$flag.content_template_json|escape:'html'}}</textarea>
					<input type="button" value="Save Manual Edit" class="vsml" onclick="HitlReview.saveContent(this); return false;" />
				</div>
				{{/if}}

				{{if $flag.status == 'fixing'}}
				<p class="hitl-processing" style="margin-top:8px;">AI fix running&hellip; page will refresh when status updates.</p>
				{{/if}}
			</div>
			{{/foreach}}
			{{else}}
			<p>No flags found for the selected filters.</p>
			{{/if}}
		</div>
	</div>

	<div class="hitl-col-preview">
		<div class="hitl-preview-frame-wrap">
			<div class="hitl-preview-toolbar">
				<span id="hitl-preview-label">Procedure preview (flagged section)</span>
				<a id="hitl-preview-open" href="{{$procedurePreviewUrl}}" target="_blank">Open tab</a>
			</div>
			<iframe id="hitl-procedure-frame" class="hitl-preview-frame" src="{{$procedurePreviewUrl}}" title="Procedure preview"></iframe>
		</div>
	</div>
</div>
{{/if}}
