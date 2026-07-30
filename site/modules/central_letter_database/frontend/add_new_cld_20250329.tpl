<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
{{if $opr }}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}
<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
	<h3 class="page-title">{{ $title }}</h3>
	<form name="detail" method="post" action="" enctype="multipart/form-data">
		<table id="list-table" width="100%">
			<input type="hidden" name="task[{{ $primary_id }}]" value="{{$detail.$primary_id}}" />
			<!--<input type="hidden" name="task[cld_date_uploaded]" value="{{$smarty.now}}" />-->
			<input type="hidden" name="task[cld_file_uploaded_by]" value="{{ $user_id }}" />
			{{if $error}}
			<tr>
				<th colspan="2" style="color:#FF0000;">{{$error}}</th>
			</tr>{{/if}}
			<tr>
				<th>Project Name*</th>
				<td>
				    <datalist id='project'>
						{{foreach from=$projectdetail key="key" item="item_project"}}
						<option data-bsn="{{$item_project.bsn_id}}" value="{{$item_project.bsn_name}}">
							{{$item_project.bsn_name}}
						</option>
						{{/foreach}}
					</datalist>
				    <input type="text" list="project" name="task[cld_project_name]" value="{{$search_project}}" style="width: 500px;" />
				</td>
			</tr>
			<tr>
				<th>Letter Type*</th>
				<td>
				    {{ if $typedata }}
					<select name="task[cld_letter_type_id]" style="width: 500px;">
        				<option value="">Select Letter Type</option>
						{{ assign var=option_col value=$ATTRIBUTES.type.option_col }}
                        {{ assign var=option_id value=$ATTRIBUTES.type.id }}
                        {{ foreach from=$typedata key="index" item="row" }}
                        <option value="{{ $row.$option_id }}" {{ if $row.$option_id eq $detail.cld_letter_type_id }}selected{{ /if }}>{{ $row.$option_col }}</option>
                        {{ /foreach }}
                        <!-- {{ foreach from=$letterdetail key="key" item="item_letter" }}
                        <option value="{{$item_letter.cld_type}}">{{$item_letter.cld_type}}</option>
                        {{ /foreach }} -->
        			</select>
        			{{ else }}
        			<input type="text" readonly value="No Letter Type Available" />
        			{{/if}}
				</td>
			</tr>
			<tr>
				<th>Status*</th>
				<td>
				    {{ if $statusdata }}
					<select name="task[cld_status_id]" style="width: 500px;">
        				<option value="">Select Status</option>
						{{ assign var=option_col value=$ATTRIBUTES.status.option_col }}
                        {{ assign var=option_id value=$ATTRIBUTES.status.id }}
                        {{ foreach from=$statusdata key="index" item="row" }}
                        <option value="{{ $row.$option_id }}" {{ if $row.$option_id eq $detail.cld_status_id }}selected{{ /if }}>{{ $row.$option_col }}</option>
                        {{ /foreach }}
        				<!-- {{ foreach from=$statusdetail key="key" item="item_status" }}
        				<option value="{{$item_status.cld_status}}">{{$item_status.cld_status}}</option>
                        {{ /foreach }} -->
        			</select>
        			{{ else }}
        			<input type="text" readonly value="No Status Available" />
        			{{/if}}
				</td>
			</tr>
			<tr>
				<th>Upload Date</th>
				<td>
				    <input type="date" name="task[cld_date_uploaded]" value="{{ $detail.cld_date_uploaded }}" />
				</td>
			</tr>
			<tr>
				<th>Upload Letter File</th>
				<td>
				    <input type="file" name="cld_file_name" accept="application/pdf" style="width: 500px;" />
					<br>
					{{ if $detail.cld_file_name }}<span>{{$detail.cld_file_name}}</span>{{ /if }}
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
			setTimeout('parent.close_win();', 500);
		}
	</script>
	<script type="text/javascript" language="javascript">
		var frmvalidator = new Validator("detail");
		frmvalidator.EnableMsgsTogether();
		frmvalidator.addValidation("task[cld_project_name]","req", "Please Select Project Name");
		frmvalidator.addValidation("task[cld_letter_type]","req", "Please Select Letter Type");
		frmvalidator.addValidation("task[cld_status]","req", "Please Select Status");
	</script>
</div>