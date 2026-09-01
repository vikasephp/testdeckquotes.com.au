<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<base href="{{$BASE_URL}}" />
<title>{{$title}} - {{$pdr_project_address}}</title>
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
	#fancybox-wrap {
		z-index: 9999999;
	}
	.pdh-stack {
		display: block;
		width: 100%;
	}
	.pdh-stack-item {
		display: block;
		padding: 4px 2px;
		border-bottom: 1px solid #cfcfcf;
		min-height: 18px;
	}
	.pdh-stack-item:last-child {
		border-bottom: none;
	}
	.history-actions {
		margin: 12px 0 0 0;
		text-align: center;
	}
	.top-actions {
		float: right;
		margin-bottom: 8px;
	}
	.top-actions input {
		margin-left: 6px;
	}
	.history-total {
		margin-top: 14px;
		font-size: 14px;
		font-weight: bold;
		text-align: left;
	}
</style>
</head>
<body>

<script type="text/javascript">
var categoryLetterMap = {{$category_map_json}};
var pdrId = {{$pdr_id_js}};
var rowIndex = 0;

function close_win()
{
	jQuery.fancybox.close();
	window.location.href = window.location.href;
}

function open_add_delay_category()
{
	var viewurl = "{{$BASE_URL}}project_delay_register.delay_category_list/random/" + Math.random();
	jQuery.fancybox(viewurl, {
		'width': '80%',
		'height': '80%',
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
		'scrolling': 'yes',
		'onClosed': function() {
			// Reload so category -> letter code map picks up edits.
			window.location.href = window.location.href;
		}
	});
}

function buildStackHtml(items, field)
{
	var html = '<div class="pdh-stack">';
	if (!items || !items.length) {
		html += '<div class="pdh-stack-item">&nbsp;</div>';
	} else {
		for (var i = 0; i < items.length; i++) {
			var val = '';
			if (field === 'days') {
				val = items[i].days || '';
			} else {
				val = items[i].date || '';
			}
			html += '<div class="pdh-stack-item">' + jQuery('<div/>').text(val).html() + '</div>';
		}
	}
	html += '</div>';
	return html;
}

function fillTimelineStacks(row, items)
{
	row.find('.pdh-days-cell').html(buildStackHtml(items, 'days'));
	row.find('.pdh-dates-cell').html(buildStackHtml(items, 'dates'));
	updateCategoryDaysTotal(items);
}

function updateCategoryDaysTotal(items)
{
	var total = 0;
	if (items && items.length) {
		for (var i = 0; i < items.length; i++) {
			var n = parseFloat(items[i].days);
			if (!isNaN(n)) {
				total += n;
			}
		}
	}
	if (Math.floor(total) === total) {
		total = parseInt(total, 10);
	}
	jQuery('#total_delays_added_value').text(total);
}

function loadTimelineForRow(row)
{
	var letterCode = jQuery.trim(row.find('.pdh-letter-code').val() || '');
	if (!pdrId || !letterCode) {
		fillTimelineStacks(row, []);
		return;
	}
	jQuery.ajax({
		type: 'POST',
		url: "{{$BASE_URL}}project_delay_register.get_timeline_delays/random/" + Math.random(),
		data: {
			pdr_id: pdrId,
			letter_code: letterCode
		},
		dataType: 'json',
		success: function(resp) {
			var items = (resp && resp.items) ? resp.items : [];
			fillTimelineStacks(row, items);
		},
		error: function() {
			fillTimelineStacks(row, []);
		}
	});
}

function on_category_change(selectEl)
{
	var row = jQuery(selectEl).closest('tr.history-row');
	var catId = jQuery(selectEl).val();
	var letterCode = '';
	if (catId && categoryLetterMap[catId]) {
		letterCode = categoryLetterMap[catId];
	}
	row.find('.pdh-letter-code').val(letterCode);
	loadTimelineForRow(row);
}

function add_history_row()
{
	var tpl = jQuery('#history-row-template').html();
	var html = tpl.replace(/__INDEX__/g, String(rowIndex));
	jQuery('#history-tbody').append(html);
	rowIndex++;
}

function remove_history_row(btn)
{
	var rows = jQuery('#history-tbody tr.history-row');
	if (rows.length <= 1) {
		var row = jQuery(btn).closest('tr.history-row');
		row.find('.pdh-category').val('');
		row.find('.pdh-letter-code').val('');
		fillTimelineStacks(row, []);
		return;
	}
	jQuery(btn).closest('tr.history-row').remove();
}
</script>

<h3 class="page-title">{{$title}} - {{$pdr_project_address}}</h3>

{{if $save_msg}}
<div style="color:green; margin-bottom:8px;">{{$save_msg}}</div>
{{/if}}

<div class="top-actions">
	<input type="button" name="Manage Categories" value="Manage Categories"
		onclick="javascript:open_add_delay_category();" />
	<!-- <input type="button" name="Add Row" value="Add Row"
		onclick="javascript:add_history_row();" />  -->
</div>

<div style="clear:both;"></div>

<form name="delay_history_form" method="post" action="">
	<table id="list-table" class="nav-back" width="100%">
		<thead>
			<tr>
				<th class="topmenu" align="center" valign="middle" width="28%">Delay Category</th>
				<th class="topmenu" align="center" valign="middle" width="28%">Letter Code</th>
				<th class="topmenu" align="center" valign="middle" width="18%">Days Delayed</th>
				<th class="topmenu" align="center" valign="middle" width="20%">Letter Sent Date</th>
				<!-- <th class="topmenu" align="center" valign="middle" width="6%">Act</th> -->
			</tr>
		</thead>
		<tbody id="history-tbody">
		{{if $history_groups}}
			{{foreach from=$history_groups key="gkey" item="group"}}
			<tr class="history-row" data-row-index="{{$gkey}}" bgcolor='{{cycle values="#D3E8D6,WHITE" advance=true}}'>
				<td align="center">
					<select name="rows[{{$gkey}}][pdc_id]" class="input pdh-category" onchange="on_category_change(this);">
						{{foreach from=$categories key="ckey" item="cat"}}
						<option value="{{$cat.pdc_id}}"{{if $cat.pdc_id == $group.pdh_pdc_id}} selected="selected"{{/if}}>{{$cat.pdc_category_name}}</option>
						{{/foreach}}
					</select>
				</td>
				<td align="center">
					<input type="text" name="rows[{{$gkey}}][letter_code]" class="input pdh-letter-code" value="{{$group.pdh_letter_code}}" readonly="readonly" style="width:95%;" />
				</td>
				<td align="center" class="pdh-days-cell" valign="top">
					<div class="pdh-stack">
					{{if $group.items}}
						{{foreach from=$group.items key="ikey" item="it"}}
						<div class="pdh-stack-item">{{$it.days}}</div>
						{{/foreach}}
					{{else}}
						<div class="pdh-stack-item">&nbsp;</div>
					{{/if}}
					</div>
				</td>
				<td align="center" class="pdh-dates-cell" valign="top">
					<div class="pdh-stack">
					{{if $group.items}}
						{{foreach from=$group.items key="ikey" item="it"}}
						<div class="pdh-stack-item">{{$it.date}}</div>
						{{/foreach}}
					{{else}}
						<div class="pdh-stack-item">&nbsp;</div>
					{{/if}}
					</div>
				</td>
				<!-- <td align="center">
					<input type="button" value="X" title="Remove row" onclick="remove_history_row(this);" />
				</td> -->
			</tr>
			<script type="text/javascript">rowIndex = Math.max(rowIndex, {{$gkey}} + 1);</script>
			{{/foreach}}
		{{else}}
			<tr bgcolor="#D3E8D6">
				<td colspan="4" align="center">No categories found. Use Manage Categories to add one.</td>
			</tr>
		{{/if}}
		</tbody>
	</table>

	<div class="history-total">
		Total Time Delays Added: <span id="total_delays_added_value">{{$total_delays_added}}</span> 
	</div>

	<!-- <div class="history-actions">
		<input type="submit" name="subSaveHistory" value="Save" />
	</div> -->
</form>

<script type="text/html" id="history-row-template">
	<tr class="history-row" data-row-index="__INDEX__" bgcolor="#FFFFFF">
		<td align="center">
			<select name="rows[__INDEX__][pdc_id]" class="input pdh-category" onchange="on_category_change(this);">
				{{foreach from=$categories key="ckey" item="cat"}}
				<option value="{{$cat.pdc_id}}">{{$cat.pdc_category_name}}</option>
				{{/foreach}}
			</select>
		</td>
		<td align="center">
			<input type="text" name="rows[__INDEX__][letter_code]" class="input pdh-letter-code" value="" readonly="readonly" style="width:95%;" />
		</td>
		<td align="center" class="pdh-days-cell" valign="top">
			<div class="pdh-stack">
				<div class="pdh-stack-item">&nbsp;</div>
			</div>
		</td>
		<td align="center" class="pdh-dates-cell" valign="top">
			<div class="pdh-stack">
				<div class="pdh-stack-item">&nbsp;</div>
			</div>
		</td>
		<!-- <td align="center">
			<input type="button" value="X" title="Remove row" onclick="remove_history_row(this);" />
		</td> -->
	</tr>
</script>

</body>
</html>
