<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
{{if $opr}}
<script type="text/javascript">
	setTimeout('parent.close_win();', 500);
</script>
{{/if}}
<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
	<h3 class="page-title">{{ $title }}</h3>
	<form name="detail" method="post" action="" enctype="multipart/form-data">
		<table id="list-table" width="100%">
			<input type="hidden" name="task[{{ $ID }}]" value="{{$detail.$ID}}" />
			<input type="hidden" name="{{$TABLE}}[{{ $ID }}]" value="{{$detail.$ID}}" />
			{{if $error}}
			<tr>
				<th colspan="2" style="color:#FF0000;">{{$error}}</th>
			</tr>
			{{/if}}
			<tr>
				<th>MSTeams Folder</th>
				<td>
					<input type="text" name="{{$TABLE}}[ps_msteam_folder_link]" value="{{$detail.ps_msteam_folder_link}}" style="width:700px;" />
				</td>
			</tr>
			<tr>
				<th>Brochure</th>
				<td>
					<input type="text" name="{{$TABLE}}[ps_brochure_link]" value="{{$detail.ps_brochure_link}}" style="width:700px;" />
				</td>
			</tr>
			<tr>
				<th>Action Plan</th>
				<td>
					<input type="text" name="{{$TABLE}}[ps_action_plan]" value="{{$detail.ps_action_plan}}" style="width:700px;" />
				</td>
			</tr>
			<tr>
				<th>Time Line</th>
				<td>
					<input type="text" name="{{$TABLE}}[ps_time_line]" value="{{$detail.ps_time_line}}" style="width:700px;" />
				</td>
			</tr>
			<tr>
				<th>Agency Agreement</th>
				<td>
					<input type="text" name="{{$TABLE}}[ps_agency_agreement]" value="{{$detail.ps_agency_agreement}}" style="width:700px;" />
				</td>
			</tr>
			<tr>
				<th>All homes Link</th>
				<td>
					<input type="text" name="{{$TABLE}}[ps_home_link]" value="{{$detail.ps_home_link}}" style="width:700px;" />
				</td>
			</tr>
			<tr>
				<th>REA Link</th>
				<td>
					<input type="text" name="{{$TABLE}}[ps_rea_link]" value="{{$detail.ps_rea_link}}" style="width:700px;" />
				</td>
			</tr>
			<tr>
				<th>Agent Box Link</th>
				<td>
					<input type="text" name="{{$TABLE}}[ps_agent_box_link]" value="{{$detail.ps_agent_box_link}}" style="width:700px;" />
				</td>
			</tr>
			<tr>
				<th>Domains Link</th>
				<td>
					<input type="text" name="{{$TABLE}}[ps_domains_link]" value="{{$detail.ps_domains_link}}" style="width:700px;" />
				</td>
			</tr>
            <tr>
				<td colspan="2" style="text-align:center;">
					<input type="submit" name="subAddDetail" value="Save" class="vsml" />
					<input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
				</td>
			</tr>
		</table>
	</form>
	<script type="text/javascript">
		function closepop() {
			setTimeout('parent.close_win();', 500);
		}
	</script>
</div>