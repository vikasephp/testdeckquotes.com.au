<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<style>
.hitl-badge { display:inline-block; padding:2px 8px; border-radius:4px; font-size:11px; font-weight:bold; }
.hitl-flagged { background:#fff3cd; color:#856404; }
.hitl-approved { background:#e8f5e9; color:#1b5e20; }
.hitl-review-pending { background:#e3f2fd; color:#0d47a1; }
.hitl-confidence { color:#666; font-size:12px; }
.hitl-action-btn { cursor:pointer; }
</style>

<h3 class="page-title">{{$title}}</h3>
<p>
	<a href="{{$BASE_URL}}{{$XFA.home}}">&laquo; Back to AI Repository</a>
</p>

{{if $apiError}}
<p style="color:#c00;">{{$apiError}}</p>
{{/if}}

<p>Total DIDs in review queue: <strong>{{$queueTotal}}</strong></p>

<table id="doclist-table" class="nav-back" width="100%">
	<thead>
		<tr>
			<th class="topmenu">DID</th>
			<th class="topmenu">HITL Status</th>
			<th class="topmenu">Open Flags</th>
			<th class="topmenu">Total Flags</th>
			<th class="topmenu">Confidence</th>
			<th class="topmenu">Queued At</th>
			<th class="topmenu">Action</th>
		</tr>
	</thead>
	<tbody>
	{{if $queueItems|@count > 0}}
	{{foreach from=$queueItems item="item"}}
		<tr bgcolor="{{cycle values="#D3E8D6,#FFFFFF"}}">
			<td>{{$item.pp_did}}</td>
			<td>
				<span class="hitl-badge {{if $item.hitl_status == 'approved'}}hitl-approved{{elseif $item.hitl_status == 'review_pending'}}hitl-review-pending{{else}}hitl-flagged{{/if}}">
					{{$item.hitl_status}}
				</span>
			</td>
			<td>{{$item.open_flags}}</td>
			<td>{{$item.flags_count}}</td>
			<td class="hitl-confidence">{{$item.confidence}}</td>
			<td>{{$item.queued_at}}</td>
			<td align="center">
				<input type="button" value="Review Flags" class="vsml hitl-action-btn"
					onclick="window.location.href='{{$BASE_URL}}{{$XFA.hitl_review}}/did/{{$item.pp_did}}';" />
			</td>
		</tr>
	{{/foreach}}
	{{else}}
		<tr><td colspan="7" align="center">No DIDs currently in the review queue.</td></tr>
	{{/if}}
	</tbody>
</table>

{{if $queueTotal > $queueLimit}}
<div style="margin-top:12px;">
	{{assign var=prevOffset value=$queueOffset-$queueLimit}}
	{{assign var=nextOffset value=$queueOffset+$queueLimit}}
	{{if $queueOffset > 0}}
		<a href="{{$BASE_URL}}{{$XFA.review_queue}}/limit/{{$queueLimit}}/offset/{{$prevOffset}}">&laquo; Previous</a>
	{{/if}}
	{{if $nextOffset < $queueTotal}}
		&nbsp; <a href="{{$BASE_URL}}{{$XFA.review_queue}}/limit/{{$queueLimit}}/offset/{{$nextOffset}}">Next &raquo;</a>
	{{/if}}
</div>
{{/if}}
