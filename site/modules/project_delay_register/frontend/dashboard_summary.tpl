<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<base href="{{$BASE_URL}}" />
<title>{{$title}}</title>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/loader.css" />
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
	.summary-note {
		color: #666;
		font-size: 12px;
		margin-top: 8px;
	}
</style>
</head>
<body>

<h3 class="page-title">{{$title}}</h3>

<table id="list-table" class="nav-back" width="100%">
	<thead>
		<tr>
			<th class="topmenu" align="center" valign="middle" width="60%">Field</th>
			<th class="topmenu" align="center" valign="middle" width="40%">Count</th>
		</tr>
	</thead>
	<tbody>
		<tr bgcolor="#D3E8D6">
			<td align="left" style="padding-left:12px;">Total Active Projects</td>
			<td align="center">{{$total_active_projects}}</td>
		</tr>
		<!-- <tr bgcolor="WHITE">
			<td align="left" style="padding-left:12px;">Projects with Time Delays</td>
			<td align="center">{{$projects_with_time_delays}}</td>
		</tr> -->
		<tr bgcolor="#D3E8D6">
			<td align="left" style="padding-left:12px;">Pending Confirmation</td>
			<td align="center">
				{{if $pending_confirmation gt 0}}
				<span style="color:#cc0000; font-weight:bold;">{{$pending_confirmation}}</span>
				{{else}}
				{{$pending_confirmation}}
				{{/if}}
			</td>
		</tr>
		<tr bgcolor="WHITE">
			<td align="left" style="padding-left:12px;">Total Time Delay Letters Sent</td>
			<td align="center">{{$total_letters_sent}}</td>
		</tr>
	</tbody>
</table>

<!-- <div class="summary-note">All counts exclude hidden projects.</div> -->

</body>
</html>
