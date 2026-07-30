<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
{{if $opr}}
<script type="text/javascript">
	//setTimeout('parent.close_win();', 500);
	//window.location.href = "{{$BASE_URL}}{{ $BASEFOLDER }}.{{ $ATTRIBUTES.post_settlement_task_list_specific.view_fle_name }}";
	window.location.href = "{{ $BASE_URL }}{{ $BASEFOLDER }}.{{ $ATTRIBUTES.post_settlement_task_list_specific.view_fle_name }}/bsn_id/{{$bsn_id}}";
</script>
{{/if}}
<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
	<h3 class="page-title">{{$task_title}} {{ $ATTRIBUTES.post_settlement_task_list_specific.name }}</h3>
	<form name="detail" method="post" action="" enctype="multipart/form-data">
		<table id="list-table" width="100%">
			<input type="hidden" name="task[{{ $primary_id }}]" value="{{$detail.$primary_id}}" />
			<input type="hidden" name="task[psrpstl_key]" value="UT" /> <!-- Key for Specific Tasks -->
			<input type="hidden" name="task[psrpstl_bsn_id]" value="{{$bsn_id}}" />
			{{if $error}}
			<tr>
				<th colspan="2" style="color:#FF0000;">{{$error}}</th>
			</tr>{{/if}}
			<tr>
				<th>Sequence </th>
				<td>
					{{ assign var=psrlctl_seq value=$ATTRIBUTES.post_settlement_task_list_specific.seq }}
					<input type="number" name="task[{{$psrlctl_seq}}]" style="width:95%" value="{{ $detail.$psrlctl_seq }}" min="0" step="1" />
				</td>
			</tr>
			<tr>
				<th>Procedure Link </th>
				<td>
					{{ assign var=psrlctl_procedure_link value=$ATTRIBUTES.post_settlement_task_list_specific.procedure_link }}
					<input type="text" name="task[{{ $ATTRIBUTES.post_settlement_task_list_specific.procedure_link }}]" style="width:95%" value="{{ $detail.$psrlctl_procedure_link }}" />
				</td>
			</tr>
			<tr>
				<th>Task Description </th>
				<td>
					{{ assign var=psrlctl_task_description value=$ATTRIBUTES.post_settlement_task_list_specific.task_description }}
					<textarea name="task[{{ $ATTRIBUTES.post_settlement_task_list_specific.task_description }}]" style="width:95%;" rows="5">{{$detail.$psrlctl_task_description }}</textarea>
					
				</td>
			</tr>
			<tr>
				<th>Person Responsible </th>
				<td>
					{{ assign var=psrlctl_person_responsible value=$ATTRIBUTES.post_settlement_task_list_specific.person_responsible }}
					<input type="text" name="task[{{ $ATTRIBUTES.post_settlement_task_list_specific.person_responsible }}]" style="width:700px" value="{{$detail.$psrlctl_person_responsible }}" />
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
			//window.location.href = "{{ $BASE_URL }}{{ $BASEFOLDER }}.{{ $ATTRIBUTES.post_settlement_task_list_specific.view_fle_name }}";
			window.location.href = "{{ $BASE_URL }}{{ $BASEFOLDER }}.{{ $ATTRIBUTES.post_settlement_task_list_specific.view_fle_name }}/bsn_id/{{$bsn_id}}";
		}
	</script>
	<script type="text/javascript" language="javascript">
		var frmvalidator = new Validator("detail");
		frmvalidator.EnableMsgsTogether();
		frmvalidator.addValidation("task[{{ $ATTRIBUTES.post_settlement_task_list_specific.psrlctl_procedure_link }}]", "req", "Please specify Link");
	</script>
</div>