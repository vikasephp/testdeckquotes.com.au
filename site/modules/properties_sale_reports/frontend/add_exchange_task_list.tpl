<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
{{if $opr}}
<script type="text/javascript">
	//setTimeout('parent.close_win();', 500);
	window.location.href = "{{$BASE_URL}}{{ $BASEFOLDER }}.{{ $ATTRIBUTES.exchange_task_list.view_fle_name }}";
</script>
{{/if}}
<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
	<h3 class="page-title">{{$task_title}} {{ $ATTRIBUTES.exchange_task_list.name }}</h3>
	<form name="detail" method="post" action="" enctype="multipart/form-data">
		<table id="list-table" width="100%">
			<input type="hidden" name="task[{{ $primary_id }}]" value="{{$detail.$primary_id}}" />
			<input type="hidden" name="task[psretl_key]" value="T" /> <!-- Key for Common Tasks -->
			{{if $error}}
			<tr>
				<th colspan="2" style="color:#FF0000;">{{$error}}</th>
			</tr>{{/if}}
			<tr>
				<th>Sequence </th>
				<td>
					{{ assign var=psrlctl_seq value=$ATTRIBUTES.exchange_task_list.seq }}
					<input type="number" name="task[{{$psrlctl_seq}}]" style="width:95%" value="{{ $detail.$psrlctl_seq }}" min="0" step="1" />
				</td>
			</tr>
			<tr>
				<th>Procedure Link </th>
				<td>
					{{ assign var=psrlctl_procedure_link value=$ATTRIBUTES.exchange_task_list.procedure_link }}
					<input type="text" name="task[{{ $ATTRIBUTES.exchange_task_list.procedure_link }}]" style="width:95%" value="{{ $detail.$psrlctl_procedure_link }}" />
				</td>
			</tr>
			<tr>
				<th>Task Description </th>
				<td>
					{{ assign var=psrlctl_task_description value=$ATTRIBUTES.exchange_task_list.task_description }}
					<textarea name="task[{{ $ATTRIBUTES.exchange_task_list.task_description }}]" style="width:95%;" rows="5">{{$detail.$psrlctl_task_description }}</textarea>
					
				</td>
			</tr>
			<tr>
				<th>Person Responsible </th>
				<td>
					{{ assign var=psrlctl_person_responsible value=$ATTRIBUTES.exchange_task_list.person_responsible }}
					<input type="text" name="task[{{ $ATTRIBUTES.exchange_task_list.person_responsible }}]" style="width:700px" value="{{$detail.$psrlctl_person_responsible }}" />
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
			window.location.href = "{{ $BASE_URL }}{{ $BASEFOLDER }}.{{ $ATTRIBUTES.exchange_task_list.view_fle_name }}";
		}
	</script>
	<script type="text/javascript" language="javascript">
		var frmvalidator = new Validator("detail");
		frmvalidator.EnableMsgsTogether();
		frmvalidator.addValidation("task[{{ $ATTRIBUTES.exchange_task_list.psrlctl_procedure_link }}]", "req", "Please specify Link");
	</script>
</div>