<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<base href="{{$BASE_URL}}" />
<title>{{$title}} - {{$pdr_project_address}}</title>
<!-- Core site CSS so popup/iframe matches full-page list screens -->
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/loader.css" />
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
{{include file=$jdata}}
{{include file=$tiny_basic}}
<style type="text/css">
	html, body {
		background: #ffffff !important;
		margin: 0;
		padding: 10px;
	}
	.set2 {
		font-size: 10px !important;
		width: 60px !important;
		display: inline-block;
		padding-top: 1px !important;
		padding-bottom: 1px !important;
		padding-left: 1px !important;
		height: 25px !important;
		margin-top: 7px;
	}
	#fancybox-wrap {
		z-index: 9999999;
	}
	#list-table {
		width: 100%;
		border-collapse: collapse;
	}
	#list-table th.topmenu {
		white-space: nowrap;
	}
	.page-title {
		margin: 0 0 10px 0;
	}
</style>
</head>
<body>

<script type="text/javascript">
function open_add_delay(pdrId, pdtcId)
{
	var viewurl = "{{$BASE_URL}}project_delay_register.add_delay/pdr_id/" + pdrId;
	if (pdtcId) {
		viewurl += "/pdtc_id/" + pdtcId;
	}
	viewurl += "/random/" + Math.random();
	// Open inside delay_list iframe so Close only closes this popup (delay_list stays open).
	jQuery.fancybox(viewurl, {
		'width': '95%',
		'height': '95%',
		'autoScale': false,
		'transitionIn': 'elastic',
		'transitionOut': 'elastic',
		'speedIn': 300,
		'speedOut': 300,
		'overlayShow': true,
		'overlayColor': '#000',
		'hideOnOverlayClick': false,
		'hideOnContentClick': false,
		'type': 'iframe',
		'scrolling': 'yes'
	});
}

function open_view_notes(pdtcId)
{
	var viewurl = "{{$BASE_URL}}project_delay_register.delay_list_notes/pdtc_id/" + pdtcId + "/random/" + Math.random();
	jQuery.fancybox(viewurl, {
		'width': '90%',
		'height': '90%',
		'autoScale': false,
		'transitionIn': 'elastic',
		'transitionOut': 'elastic',
		'speedIn': 300,
		'speedOut': 300,
		'overlayShow': true,
		'overlayColor': '#000',
		'hideOnOverlayClick': false,
		'hideOnContentClick': false,
		'type': 'iframe',
		'scrolling': 'yes'
	});
}

function delete_delay(pdtcId)
{
	if (!confirm('Are you sure want to delete?')) {
		return false;
	}
	var url = "{{$BASE_URL}}project_delay_register.delay_list/pdr_id/{{$pdr_id}}/delpdtc/" + pdtcId;
	{{if $status_filter}}
	url += "/status/{{$status_filter}}";
	{{/if}}
	window.location.href = url;
}

function approve_delay(pdtcId)
{
	if (!confirm('Approve this pending letter?')) {
		return false;
	}
	var url = "{{$BASE_URL}}project_delay_register.delay_list/pdr_id/{{$pdr_id}}/approvepdtc/" + pdtcId;
	{{if $status_filter}}
	url += "/status/{{$status_filter}}";
	{{/if}}
	window.location.href = url;
}
</script>

<h3 class="page-title">{{$title}} - {{$pdr_project_address}}</h3>

{{if !$status_filter}}
<form name="mshort" action="" method="post">
	<div style="float:right;">
		<input type="button" name="Add New" value="Add New"
			onclick="javascript:open_add_delay('{{$pdr_id}}', '');" />
	</div>
</form>
{{/if}}

<div style="clear:both;"></div>

<div id="">
	<table id="list-table" class="nav-back" width="100%">
		<thead>
			<tr>
				<th class="topmenu" align="center" valign="middle" width="3%">Rec. No.</th>
				<th class="topmenu" align="center" valign="middle" width="15%">Project</th>
				<th class="topmenu" align="center" valign="middle" width="10%">Who is requesting</th>
				<th class="topmenu" align="center" valign="middle" width="5%">Letter</th>
				<th class="topmenu" align="center" valign="middle" width="5%">Days Delayed</th>
				<th class="topmenu" align="center" valign="middle" width="6%">Revised Commencement Date</th>
				<th class="topmenu" align="center" valign="middle" width="6%">Revised Completion Date</th>
				<th class="topmenu" align="center" valign="middle" width="9%">Send Pathway</th>
				<th class="topmenu" align="center" valign="middle" width="10%">Letter Uploaded</th>
				<th class="topmenu" align="center" valign="middle" width="8%">When letter emailed</th>
				<th class="topmenu" align="center" valign="middle" width="4%">Notes</th>
				<th class="topmenu" align="center" valign="middle" width="4%">Evidence</th>
				<th class="topmenu" align="center" valign="middle" width="4%">Status</th>
				<th class="topmenu" align="center" valign="middle" width="4%">Save And Sync Days</th>
				<th class="topmenu" align="center" valign="middle" width="5%">Action</th>
			</tr>
		</thead>
		<tbody>
		{{if $list}}
			{{foreach from=$list key="key" item="item"}}
			<tr bgcolor="#FFFFFF">
				<td>{{counter}}</td>
				<td>{{$item.pdtc_project}}</td>
				<td>{{$item.pdtc_who_req}}</td>
				<td>{{$item.pdtc_letter_code}}</td>
				<td>{{$item.pdtc_days_delay}}</td>
				<td>{{$item.pdtc_rev_comm_date}}</td>
				<td>{{$item.pdtc_rev_comp_date}}</td>
				<td>{{$item.pdtc_send_pathway}}</td>
				<td>
					{{if $item.pdtc_letter_upload}}
					<div style="text-align:center;">
						<a href="/project_delay_register.download_content?file_name={{$item.pdtc_letter_upload}}&module_name=project_delay_register.home" target="_blank">Download</a>
					</div>
					{{/if}}
				</td>
				<td>{{$item.pdtc_letter_email}} {{if $item.pdtc_letter_email}} <br /> By : {{$item.pdtc_email_user}}{{/if}}</td>
				<td>
					{{if $item.pdtc_notes}}
					<a href="javascript:void(0);" onclick="javascript:open_view_notes('{{$item.pdtc_id}}');">View Notes</a>
					{{/if}}
				</td>
				<td>
					{{if $item.pdtc_evidence}}
					<div style="text-align:center;">
						<a href="/project_delay_register.download_content?file_name={{$item.pdtc_evidence}}&module_name=project_delay_register.home" target="_blank">Download</a>
					</div>
					{{/if}}
				</td>
				<td>{{$item.pdtc_status}}{{if $item.pdtc_workflow_status}}<br /><small>({{$item.pdtc_workflow_status}})</small>{{/if}}</td>
				<td>
					<form name="recmet3" method="post" action="">
						<input type="hidden" name="sync" value="{{$item.pdtc_id}}" />
						<label class="switch">
							<input class="switch-input" type="checkbox" name="sync" value="{{$item.pdtc_id}}"
								onclick="this.form.submit();" {{if $item.pdtc_sync eq 1}} checked="checked" {{/if}}>
							<span class="switch-label" data-on="Yes" data-off="No"></span>
							<span class="switch-handle"></span> <br />
						</label>
					</form>
				</td>
				<td>
					<a href="javascript:void(0);" onclick="javascript:open_add_delay('{{$pdr_id}}', '{{$item.pdtc_id}}');" title="Edit">
						<img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png" /></a>&nbsp;&nbsp;
					<a href="javascript:void(0);" onclick="javascript:delete_delay('{{$item.pdtc_id}}');" title="Delete">
						<img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png" /></a>
					{{if $item.pdtc_workflow_status eq 'Pending'}}
					&nbsp;<input type="button" name="Approve" value="Approve" class="vsml set2" onclick="javascript:approve_delay('{{$item.pdtc_id}}');" />
					{{/if}}
				</td>
			</tr>
			{{/foreach}}
		{{else}}
			<tr bgcolor="#FFFFFF">
				<td colspan="15" style="text-align:center;">No Data Available</td>
			</tr>
		{{/if}}
		</tbody>
	</table>

	{{if $last > 1}}
	<table width="90%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			{{if $list}}
			<td align="center">
				<div class='pagination'>
					{{if $pagenum == 1}}
					<span class='disabled'>&#171; previous</span>
					{{else}}
					<a class="pagination" href="{{$BASE_URL}}project_delay_register.delay_list/pdr_id/{{$pdr_id}}/pagenum/{{math equation="x - y" x=$pagenum y=1}}" title="Previous">&#171; previous</a>
					{{/if}}

					{{if $pagenum != 1}}
					<span class="paginate"><a class="pagination" href="{{$BASE_URL}}project_delay_register.delay_list/pdr_id/{{$pdr_id}}/pagenum/1" title="1 Page">1</a></span>
					{{else}}<span class='current'>1</span>
					{{/if}}
					{{if $pagenum != 2}}
					<span class="paginate"><a class="pagination" href="{{$BASE_URL}}project_delay_register.delay_list/pdr_id/{{$pdr_id}}/pagenum/2" title="2 Page">2</a></span>
					{{else}}<span class='current'>2</span>
					{{/if}}

					{{if $paginateprev.0 > 3}}...{{/if}}
					{{foreach from=$paginateprev key="page_key" item="page_num"}}
						{{if $page_num == $pagenum OR $page_num <= 2}}
						{{elseif $page_num == $lastone}}
						{{else}}
						<span class="paginate"><a class="pagination" href="{{$BASE_URL}}project_delay_register.delay_list/pdr_id/{{$pdr_id}}/pagenum/{{$page_num}}" title="{{$page_num}} Page">{{$page_num}}</a></span>
						{{/if}}
					{{/foreach}}

					{{foreach from=$paginatenext key="page_key" item="page_num2"}}
						{{if $page_num2 < $last AND $page_num2 != $lastone}}
							{{if $page_num2 == 1}}
							{{elseif $page_num2 == 2}}
							{{else}}
								{{if $page_num2 == $pagenum OR $page_num2 <= 0}}
								<span class='current'> {{$page_num2}}</span>
								{{else}}
								<a class="pagination" href="{{$BASE_URL}}project_delay_register.delay_list/pdr_id/{{$pdr_id}}/pagenum/{{$page_num2}}" title="{{$page_num2}} Page">{{$page_num2}}</a>
								{{/if}}
							{{/if}}
						{{/if}}
					{{/foreach}}

					{{if $page_num2 < $lasttow}}...{{/if}}
					{{if $lastone == 1}}
					{{elseif $lastone == 2}}
					{{else}}
						{{if $pagenum == $lastone}}
						<span class='current'>{{$lastone}}</span>
						{{else}}
						<a class="pagination" href="{{$BASE_URL}}project_delay_register.delay_list/pdr_id/{{$pdr_id}}/pagenum/{{$lastone}}" title="{{$lastone}} Page">{{$lastone}}</a>
						{{/if}}
					{{/if}}

					{{if $last == 1}}
					{{elseif $last == 2}}
					{{else}}
						{{if $pagenum == $last}}
						<span class='current'>{{$last}}</span>
						{{else}}
						<a class="pagination" href="{{$BASE_URL}}project_delay_register.delay_list/pdr_id/{{$pdr_id}}/pagenum/{{$last}}" title="{{$last}} Page">{{$last}}</a>
						{{/if}}
					{{/if}}

					{{if $pagenum == $last}}
					<span class='disabled'>next &#187;</span>
					{{else}}
					<a class="pagination" href="{{$BASE_URL}}project_delay_register.delay_list/pdr_id/{{$pdr_id}}/pagenum/{{math equation="x + y" x=$pagenum y=1}}" title="Next">next &#187;</a>
					{{/if}}
				</div>
			</td>
			{{else}}
			<td align="center" height="300">Record Not found... </td>
			{{/if}}
		</tr>
	</table>
	{{/if}}
</div>
</body>
</html>
