<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />
{{if $opr}}
<script type="text/javascript">
	setTimeout('parent.close_win();', 500);
</script>
{{/if}}
<div align="center" style="min-height:350px;"><br />
	<h3 class="page-title">{{$title}}</h3>
	<form name="detail" method="post" action="{{$XFA.detail}}" enctype="multipart/form-data">
		<table id="list-table" width="100%">
			<input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
			{{if $error}}
			<tr>
				<th colspan="2" style="color:#FF0000;">{{$error}}</th>
			</tr>{{/if}}
			<tr>
				<th>Project Name</th>
				<td>
					<datalist id='project'>
						{{foreach from=$projdetail key="key3" item="item3"}}
						<option value="{{$item3.bsn_name}}" {{if $bsnid eq $item3.bsn_id}} selected="selected" {{/if}}>
							{{$item3.bsn_name}}
						</option>
						{{/foreach}}
					</datalist>
					<input type="text" name="{{$TABLE}}[dm_bsn_name]" list='project' value="{{$detail.dm_bsn_name}}"
						style="width:700px;">
				</td>
			</tr>
			<tr>
				<th>Total Value</th>
				<td><input type="text" name="{{$TABLE}}[dm_total_value]" value="{{$detail.dm_total_value}}"
						style="width:700px;" /> </td>
			</tr>
			<tr>
				<th>Invoice</th>
				<td><input type="file" name="invoice" /> </td>
			</tr>
			<tr>
				<th>Invoice value</th>
				<td><input type="text" name="{{$TABLE}}[dm_invoice_value]" value="{{$detail.dm_invoice_value}}"
						style="width:700px;" /> </td>
			</tr>
			<tr>
				<th>Status</th>
				<td>
					<select name="{{$TABLE}}[dm_status]">
						<option value="">Please Select </option>
						<option value="Contacted" {{if $detail.dm_status eq 'Contacted' }} selected="selected" {{/if}}>
							Contacted</option>
						<option value="ACAT Form Lodged" {{if $detail.dm_status eq 'ACAT Form Lodged' }}
							selected="selected" {{/if}}>ACAT Form Lodged</option>
						<option value="ACAT In Progress" {{if $detail.dm_status eq 'ACAT In Progress' }}
							selected="selected" {{/if}}>ACAT In Progress</option>
						<option value="Resolved" {{if $detail.dm_status eq 'Resolved' }} selected="selected" {{/if}}>
							Resolved</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>Correspondance</th>
				<td>
					<input type="text" name="{{$TABLE}}[dm_corresspondace]" value="{{$detail.dm_corresspondace}}" style="width:700px;" />
					<!-- <input type="file" name="corresp" /> -->
				</td>
			</tr>
			<tr>
				<th>Supporting Document</th>
				<td><input type="file" name="support_doc" /> </td>
			</tr>
			<tr>
				<th>ACAT Document Link</th>
				<td><input type="text" name="{{$TABLE}}[dm_acat_doc_link]" value="{{$detail.dm_acat_doc_link}}"
						style="width:700px;" /> </td>
			</tr>
			<tr>
				<td colspan="2" style="text-align:center;">
					<input type="submit" name="subAddDetail" value="Save" class="vsml" />
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
		frmvalidator.addValidation("{{$TABLE}}[wa_project]", "req", "Please specify project.");
		//frmvalidator.addValidation("{{$TABLE}}[cl_company_name]","req", "Please specify company name.");
		//frmvalidator.addValidation("{{$TABLE}}[cl_contact_name]","req", "Please specify contact name.");
	</script>
</div>
<script>
	initSample();
</script>