<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
{{if $opr}}
<script type="text/javascript">
	//setTimeout('parent.close_win();', 500);
	window.location.href = "{{$BASE_URL}}{{ $BASEFOLDER }}.warranty_inspectors_list";
</script>
{{/if}}
<div align="center" style="min-height: 350px; margin-top: 50px; z-index: 999999 !important;">
	<h3 class="page-title">Add/Edit Warranty Inspectors</h3>
	<form name="detail" method="post" action="" enctype="multipart/form-data">
		<table id="list-table" style="width: auto; margin: auto; margin-top: 40px;">
			<input type="hidden" name="task[{{ $primary_id }}]" value="{{$detail.$primary_id}}" />
			{{if $error}}
			<tr>
				<th colspan="2" style="color:#FF0000;">{{$error}}</th>
			</tr>
            {{/if}}
			<tr>
				<th>Name</th>
				<td>
					<input type="text" name="task[wi_name]" style="width: 400px;" value="{{ $detail.wi_name }}" />
				</td>
			</tr>
            <tr>
				<th>Mobile</th>
				<td>
					<input type="text" name="task[wi_mobile]" style="width: 400px;" value="{{ $detail.wi_mobile }}" />
				</td>
			</tr>
            <tr>
				<th>Email</th>
				<td>
					<input type="text" name="task[wi_email]" style="width: 400px;" value="{{ $detail.wi_email }}" />
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
			//setTimeout('parent.close_win();', 500);
			window.location.href = "{{ $BASE_URL }}{{ $BASEFOLDER }}.warranty_inspectors_list";
		}
	</script>
	<script type="text/javascript" language="javascript">
		var frmvalidator = new Validator("detail");
		frmvalidator.EnableMsgsTogether();
		frmvalidator.addValidation("task[wi_name]", "req", "Please specify name.");
		frmvalidator.addValidation("task[wi_mobile]", "req", "Please specify mobile.");
		frmvalidator.addValidation("task[wi_email]", "req", "Please specify email.");
	</script>
</div>