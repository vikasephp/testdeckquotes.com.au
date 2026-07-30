<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
{{if $opr}}
<script type="text/javascript">
	//setTimeout('parent.close_win();', 500);
	window.location.href = "{{$BASE_URL}}{{ $BASEFOLDER }}.{{ $ATTRIBUTES.mistake_log_status.view_fle_name }}";
</script>
{{/if}}
<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
	<h3 class="page-title">{{$task_title}} {{ $ATTRIBUTES.mistake_log_status.name }}</h3>
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
					{{ assign var=mistake_log_status value=$ATTRIBUTES.mistake_log_status.option_col }}
					<input type="text" name="task[{{ $ATTRIBUTES.mistake_log_status.option_col }}]" style="width:95%" value="{{ $detail.$mistake_log_status }}" />
				</td>
			</tr>
			<tr>
				<th>Color </th>
				<td>
					{{ assign var=mistake_log_color value=$ATTRIBUTES.mistake_log_status.color_col }}
					<input type="text" name="task[{{ $ATTRIBUTES.mistake_log_status.color_col }}]" style="width:95%" value="{{ $detail.$mistake_log_color }}" />
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
			window.location.href = "{{ $BASE_URL }}{{ $BASEFOLDER }}.{{ $ATTRIBUTES.mistake_log_status.view_fle_name }}";
		}
	</script>
	<script type="text/javascript" language="javascript">
		var frmvalidator = new Validator("detail");
		frmvalidator.EnableMsgsTogether();
		frmvalidator.addValidation("task[{{ $ATTRIBUTES.mistake_log_status.option_col }}]", "req", "Please specify Link");
	</script>
</div>