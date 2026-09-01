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
	.summary-note {
		color: #666;
		font-size: 12px;
		margin-top: 8px;
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

function open_manage_categories()
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
			window.location.href = window.location.href;
		}
	});
}
</script>

<h3 class="page-title">{{$title}}</h3>

<div class="top-actions">
	<input type="button" name="Manage Categories" value="Manage Categories"
		onclick="javascript:open_manage_categories();" />
</div>
<div style="clear:both;"></div>

<table id="list-table" class="nav-back" width="100%">
	<thead>
		<tr>
			<th class="topmenu" align="center" valign="middle" width="50%">Delay Category</th>
			<th class="topmenu" align="center" valign="middle" width="25%">Projects</th>
			<th class="topmenu" align="center" valign="middle" width="25%">Working Days</th>
		</tr>
	</thead>
	<tbody>
	{{if $summary_rows}}
		{{foreach from=$summary_rows key="key" item="item"}}
		<tr bgcolor='{{cycle values="#D3E8D6,WHITE" advance=true}}'>
			<td align="center">{{$item.pdc_category_name}}</td>
			<td align="center">{{$item.project_count}}</td>
			<td align="center">{{$item.working_days}}</td>
		</tr>
		{{/foreach}}
	{{else}}
		<tr bgcolor="#D3E8D6">
			<td colspan="3" align="center">No categories found. Use Manage Categories to add one.</td>
		</tr>
	{{/if}}
	</tbody>
</table>

<div class="summary-note">Counts exclude hidden projects. Based on timeline letters linked to each category letter code.</div>

</body>
</html>
