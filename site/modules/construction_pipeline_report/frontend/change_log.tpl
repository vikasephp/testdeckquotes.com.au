<script type="text/javascript" src="{{ $BASE_URL }}css/default/load.js"></script>

<link rel="stylesheet" type="text/css" href="{{ $BASE_URL }}js/tabview/tabcontent.css" />
<link rel="stylesheet" type="text/css" href="{{ $BASE_URL }}css/default/cis-styles.css" />
<script type="text/javascript" src="{{ $BASE_URL }}js/tabview/tabcontent.js"></script>

<link rel="stylesheet" type="text/css" href="{{ $BASE_URL }}css/default/style_manoj.css" />
<style>
	/* table {
		display: table;
		border-collapse: separate;
		border-spacing: 2px;
		border-color: gray;
	} */

	table, th, td {
		border: 1px solid black;
		border-collapse: collapse;
	}

	th, td {
		padding: 10px;
	}
	
	
</style>
<script type="text/javascript" src="{{ $BASE_URL }}js/jquery.min.js"></script>

{{if $opr}}
<script type="text/javascript">
	setTimeout("parent.close_win();", 500);
</script>
{{/if}}

<div align="center" style="padding-top: 30px">
	<h3 class="page-title">{{ $title }}</h3>
	<table>
		<thead>
			<tr>
				<th>Date Changed</th>
				<th>Onsite Day</th>
				<th>Day</th>
			</tr>
		</thead>
		<tbody>
			{{ assign var=last_index value=$total_change_log-1 }}
			{{ foreach from=$change_log key="index" item="row" }}
			<tr>
				<td>
					{{ if $row.cprol_log_date }}
					{{ $row.cprol_log_date|date_format:"%d-%m-%Y" }}
					{{ /if }}
				</td>
				<td>
					{{ if $row.cprol_onsite_date }}
					{{ $row.cprol_onsite_date|date_format:"%d-%m-%Y" }}
					{{ /if }}
				</td>
				<td>
					{{ assign var=current_value value=$row.cprol_onsite_date|@strtotime }}
					{{ assign var=post_index value=$index+1 }}
					{{ if $index >= $last_index }}
					{{ assign var=next_value value=$bs_original_starting_date|@strtotime }}
					{{ else }}
					{{ assign var=next_value value=$change_log[$post_index].cprol_onsite_date|@strtotime }}
					{{ /if }}
					{{ if $next_value > 0 }}
					{{ assign var=diff value=$current_value-$next_value }}
					{{ assign var=final value=$diff/86400 }}
					{{ $final|string_format:"%d" }}
					{{ else }}
					NA
					{{ /if }}
					<span style="display: none;">
						{{ $index }} - {{ $post_index }} - {{ $last_index }}
						<br>
						{{ $row.cprol_onsite_date }} - {{ $current_value }}
						<br>
						{{ $item.bs_original_starting_date }} - {{ $change_log[$post_index].cprol_onsite_date }} -
						{{ $next_value }}
						<br>
					</span>
				</td>
			</tr>
			{{ /foreach }}
		</tbody>

	</table>
</div>