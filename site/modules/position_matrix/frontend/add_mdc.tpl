<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
{{if $opr}}
<script type="text/javascript">
	//setTimeout('parent.close_win();', 500);
	window.location.href = "{{$BASE_URL}}position_matrix.multiple_doc_col/pm_id/{{$pm_id}}";
</script>
{{/if}}
<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
	<h3 class="page-title">{{$title}}</h3>
	<form name="detail" method="post" action="" enctype="multipart/form-data">
		<table id="list-table" width="100%">
			<input type="hidden" name="task[pm_id]" value="{{$pm_id}}" />
			<input type="hidden" name="task[pmmd_pm_id]" value="{{$pm_id}}" />
			<input type="hidden" name="task[pmmd_id]" value="{{$pmmd_id}}" />
			{{if $error}}
			<tr>
				<th colspan="2" style="color:#FF0000;">{{$error}}</th>
			</tr>
			{{/if}}
			<tr>
				<th>Name</th>
				<td>
					<input type="text" name="task[pmmd_doc_name]" style="width:700px" value="{{$detail.pmmd_doc_name}}" />
				</td>
			</tr>
			<tr>
				<th>Document</th>
				<td>
					<input type="text" name="task[pmmd_master_document_link]" style="width:700px" value="{{$detail.pmmd_master_document_link}}" />
				</td>
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
			//setTimeout('parent.close_win();', 500);
			window.location.href = "{{$BASE_URL}}position_matrix.multiple_doc_col/pm_id/{{$pm_id}}";
		}
	</script>
	<script type="text/javascript" language="javascript">
		var frmvalidator = new Validator("detail");
		frmvalidator.EnableMsgsTogether();
	</script>
</div>