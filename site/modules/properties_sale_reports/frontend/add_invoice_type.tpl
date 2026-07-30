<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
{{if $opr}}
<script type="text/javascript">
	//setTimeout('parent.close_win();', 500);
	window.location.href = "{{$BASE_URL}}{{ $BASEFOLDER }}.{{ $ATTRIBUTES.invoice_type.view_fle_name }}";
</script>
{{/if}}
<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
	<h3 class="page-title">Add/Edit New {{ $ATTRIBUTES.invoice_type.name }}</h3>
	<form name="detail" method="post" action="" enctype="multipart/form-data">
		<table id="list-table" width="100%">
			<input type="hidden" name="task[{{ $primary_id }}]" value="{{$detail.$primary_id}}" />
			{{if $error}}
			<tr>
				<th colspan="2" style="color:#FF0000;">{{$error}}</th>
			</tr>{{/if}}
			<tr>
				<th>Option </th>
				<td>
					{{ assign var=option_col value=$ATTRIBUTES.invoice_type.option_col }}
					<input type="text" name="task[{{ $ATTRIBUTES.invoice_type.option_col }}]"width:700px" value="{{ $detail.$option_col }}" />
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
			window.location.href = "{{ $BASE_URL }}{{ $BASEFOLDER }}.{{ $ATTRIBUTES.invoice_type.view_fle_name }}";
		}
	</script>
	<script type="text/javascript" language="javascript">
		var frmvalidator = new Validator("detail");
		frmvalidator.EnableMsgsTogether();
		frmvalidator.addValidation("task[wt_task_name]", "req", "Please specify task.");
	</script>
</div>