<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
{{if $opr}}
<script type="text/javascript">
	setTimeout(function() {
		parent.$.fancybox.close();
		parent.location.reload();
	}, 500);
</script>
{{/if}}
<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
	<h3 class="page-title">{{$task_title}} Finacial Reports</h3>
	<form name="detail" method="post" action="" enctype="multipart/form-data">
		<table id="list-table" width="100%">
			<input type="hidden" name="task[plfr_id]" value="{{$detail.plfr_id}}" />
			<input type="hidden" name="task[plfr_bsn_id]" value="{{$bsn_id}}" />
			{{if $error}}
			<tr>
				<th colspan="2" style="color:#FF0000;">{{$error}}</th>
			</tr>{{/if}}
			<tr>
				<th>Date Period </th>
				<td>
					<textarea name="task[plfr_date_period]" style="width:95%;" rows="5">{{$detail.plfr_date_period}}</textarea>
				</td>
			</tr>
			<tr>
				<th>Rerpot Link </th>
				<td>
					<textarea name="task[plfr_report_link]" style="width:95%;" rows="5">{{$detail.plfr_report_link}}</textarea>
				</td>
			</tr>
			<tr>
				<th>Email Date </th>
				<td>
					<input type="text" name="task[plfr_email_date]" value="{{$detail.plfr_email_date}}" class="w16em dateformat-d-ds-m-ds-Y dtpic" value="{{$item.plfr_email_date}}" />
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
		function closepop()
		{
			setTimeout(function() {
				parent.$.fancybox.close();
			}, 50);
		}
	</script>
	<script type="text/javascript" language="javascript">
		var frmvalidator = new Validator("detail");
		frmvalidator.EnableMsgsTogether();
		frmvalidator.addValidation("task[plfr_date_period]", "req", "Please specify Date Period");
	</script>
</div>