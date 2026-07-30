<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/loader.css" />
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
{{if $opr}}
<script type="text/javascript">
	setTimeout('parent.close_win();', 500);
</script>
{{/if}}
<div align="center" style="min-height:300px; margin-top:20px;">
	<h3 class="page-title">{{$title}}</h3>
	<form name="detail" method="post" action="{{$XFA.detail}}" enctype="multipart/form-data">
		<div id="screenoverlay" style="visibility: hidden;"></div>
		<div id="topbox" style="visibility: hidden;" align="center"></div>
		<table id="list-table" width="100%">
			<input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
			{{if $error}}
			<tr>
				<th colspan="2" style="color:#FF0000;">{{$error}}</th>
			</tr>
			{{/if}}
			<tr>
				<th>Project Address</th>
				<td>
					<datalist id='project'>
						{{foreach from=$projdetail key="key" item="item"}}
						<option value="{{$item.bsn_name}}" {{if $bsnid eq $item.bsn_id}} selected="selected" {{/if}}>
							{{$item.bsn_name}}
						</option>
						{{/foreach}}
					</datalist>
					<input type="text" list='project' name="{{$TABLE}}[os2_project]" style="width:700px"
						value="{{$detail.os2_project}}" />
				</td>
			</tr>
			<tr>
				<th>DA Number</th>
				<td><input type="text" name="{{$TABLE}}[os2_da_number]" style="width:300px" value="{{$detail.os2_da_number}}" /> </td>
			</tr>
			<tr>
				<th>Breach Date</th>
				<td><input type="date" name="{{$TABLE}}[os2_breach_date]" style="width:300px" value="{{$detail.os2_breach_date}}" /> </td>
			</tr>
			<tr>
				<th>Stage</th>
				<td>
					<select name="{{$TABLE}}[os2_stage]" />
					<option value="0" {{if $item.os2_stage eq 0 }} selected="selected" {{/if}}>Please Select </option>
					{{foreach from = $stage key="key2" item="item2"}}
					<option value="{{$item2.st_id}}" {{if $item2.st_id eq $detail.os2_stage}} selected="selected"
						{{/if}}>{{$item2.st_option}}</option>
					{{/foreach}}
					</select>
				</td>
			</tr>
			<tr>
				<th>How Many</th>
				<td><input type="text" name="{{$TABLE}}[os2_how_many]" style="width:300px"
						value="{{$detail.os2_how_many}}" /> </td>
			</tr>
			<tr>
				<th>Supporting Document</th>
				<td><input type="text" name="{{$TABLE}}[os2_supporting_document]" style="width:300px"
						value="{{$detail.os2_supporting_document}}" /> </td>
			</tr>
			<tr>
				<th>Snapshot</th>
				<td><input type="file" name="os2_snapshot" style="width:300px" value="{{$detail.os2_snapshot}}" /> </td>
			</tr>
			<tr>
				<td colspan="2" style="text-align:center;">
					<input type="submit" name="subAddDetail" value="Save" class="vsml" onclick="checkValidation();" />
					<input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();"
						class="vsml" />
				</td>
			</tr>
		</table>
	</form>
	<script type="text/javascript">
		function closepop() {
			setTimeout('parent.close_win();', 500);
		}
	</script>
	<script type="text/javascript" language="javascript">
		var frmvalidator = new Validator("detail");
		frmvalidator.EnableMsgsTogether();
		frmvalidator.addValidation("{{$TABLE}}[os2_project]", "req", "Please specify project.");
		//frmvalidator.addValidation("{{$TABLE}}[cl_company_name]","req", "Please specify company name.");
		//frmvalidator.addValidation("{{$TABLE}}[cl_contact_name]","req", "Please specify contact name.");
		function checkValidation() {
			//console.log(frmvalidator);
			//console.log(document.error_disp_handler);
			//console.log(frmvalidator.ShowMsg);
			showTop();
		}
	</script>
</div>