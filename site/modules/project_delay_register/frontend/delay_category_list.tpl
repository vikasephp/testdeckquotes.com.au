<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<base href="{{$BASE_URL}}" />
<title>{{$title}}</title>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/loader.css" />
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
	.top-actions {
		float: right;
		margin-bottom: 8px;
	}
</style>
</head>
<body>

<script type="text/javascript">
function close_win()
{
	jQuery.fancybox.close();
	window.location.href = window.location.href;
}

function open_add_category(pdcId)
{
	var viewurl = "{{$BASE_URL}}project_delay_register.add_delay_category/random/" + Math.random();
	if (pdcId) {
		viewurl = "{{$BASE_URL}}project_delay_register.add_delay_category/pdc_id/" + pdcId + "/random/" + Math.random();
	}
	jQuery.fancybox(viewurl, {
		'width': '60%',
		'height': '70%',
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

function delete_category(pdcId)
{
	if (!confirm('Are you sure want to delete this category?')) {
		return false;
	}
	window.location.href = "{{$BASE_URL}}project_delay_register.delay_category_list/delpdc/" + pdcId + "/random/" + Math.random();
}
</script>

<h3 class="page-title">{{$title}}</h3>

<div class="top-actions">
	<input type="button" name="Add New" value="Add New"
		onclick="javascript:open_add_category('');" />
</div>
<div style="clear:both;"></div>

<table id="list-table" class="nav-back" width="100%">
	<thead>
		<tr>
			<th class="topmenu" align="center" valign="middle" width="10%">Sr No.</th>
			<th class="topmenu" align="center" valign="middle" width="40%">Category Name</th>
			<th class="topmenu" align="center" valign="middle" width="40%">Letter Code</th>
			<th class="topmenu" align="center" valign="middle" width="10%">Action</th>
		</tr>
	</thead>
	<tbody>
	{{if $list}}
		{{foreach from=$list key="key" item="item"}}
		<tr bgcolor='{{cycle values="#D3E8D6,WHITE" advance=true}}'>
			<td align="center">{{$key+1}}</td>
			<td align="center">{{$item.pdc_category_name}}</td>
			<td align="center">{{$item.pdc_letter_code}}</td>
			<td align="center">
				<a href="javascript:void(0);" onclick="javascript:open_add_category('{{$item.pdc_id}}');" title="Edit" style="text-decoration:none;">
				<img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png" alt="Edit" /></a>&nbsp;&nbsp;
				<a href="javascript:void(0);" onclick="javascript:delete_category('{{$item.pdc_id}}');" title="Delete" style="text-decoration:none;">
				<img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png" alt="Delete" /></a>
			</td>
		</tr>
		{{/foreach}}
	{{else}}
		<tr bgcolor="#D3E8D6">
			<td colspan="4" align="center">No categories found. Click Add New to create one.</td>
		</tr>
	{{/if}}
	</tbody>
</table>

</body>
</html>
