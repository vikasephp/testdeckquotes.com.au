<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>

<script src="{{$BASE_URL}}ckeditor2/ckeditor.js"></script>
<script src="{{$BASE_URL}}ckeditor2/samples/js/sample.js"></script>

<script type="text/javascript">
   CKEDITOR.replace( 'editor1' );
</script>

{{if $opr}}
<script type="text/javascript">
	// Stay on delay_list after Approve / Pending / Save.
	setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<div align="center" style="min-height:350px;"><br />
	<h3 class="page-title">{{$title}}</h3><br />

<form name="detail" method="post" action="" enctype="multipart/form-data">
<table id="list-table" width="100%">
	<input type="hidden" name="pdtc[pdtc_id]" value="{{$pdtc_id}}" />

	<tr>
	 <th>Project</th>
	 <td>
		<input type="text" id="tc_project" name="pdtc[pdtc_project]" style="width:700px" value="{{$pdr_project_address}}" readonly="readonly" />
	 </td>
	</tr>

	<tr>
	 <th>Who is requesting</th>
	 <td>
		<datalist id='req_user'>
		{{foreach from=$userdetail key="key2" item="item2"}}
			<option value="{{$item2.user_name}}">{{$item2.user_name}}</option>
		{{/foreach}}
		</datalist>
		<input type="text" list="req_user" name="pdtc[pdtc_who_req]" style="width:700px" value="{{$detail.pdtc_who_req}}" placeholder="Type in and select the user" />
	 </td>
	</tr>

	<tr>
	 <th width="180">Letter Code:</th>
	 <td>
		<select name="pdtc[pdtc_letter_code]" class="input">
		{{foreach from=$codedata key="key" item="item"}}
			<option value="{{$item.lc_letter_code}}" {{if $detail.pdtc_letter_code eq $item.lc_letter_code}}selected="selected"{{/if}}>{{$item.lc_letter_code}}</option>
		{{/foreach}}
		</select>
	 </td>
	</tr>

	<tr>
	 <th>Current Total Days</th>
	 <td><input type="text" name="pdtc[pdtc_current_days]" id="cd" value="{{$detail.pdtc_current_days}}" oninput="this.value = this.value.replace(/[^0-9+]/g, '').replace(/(\..*?)\..*/g, '$1');" /></td>
	</tr>

	<tr>
	 <th>Days to be added</th>
	 <td><input type="text" name="pdtc[pdtc_days_delay]" id="da" value="{{$detail.pdtc_days_delay}}" oninput="this.value = this.value.replace(/[^0-9+]/g, '').replace(/(\..*?)\..*/g, '$1');" /></td>
	</tr>

	<tr>
	 <th>Revised Commencement Date</th>
	 <td><input type="text" name="pdtc[pdtc_rev_comm_date]" value="{{$detail.pdtc_rev_comm_date}}" class="w16em dateformat-d-ds-m-ds-Y dtpic" /></td>
	</tr>

	<tr>
	 <th>Revised Completion Date</th>
	 <td><input type="text" name="pdtc[pdtc_rev_comp_date]" id="tana" value="{{$detail.pdtc_rev_comp_date}}" class="w16em dateformat-d-ds-m-ds-Y dtpic" /></td>
	</tr>

	<tr>
	 <th>Send Pathway</th>
	 <td>
		<select name="pdtc[pdtc_send_pathway]" style="width:300px;">
			<option value="" {{if !$detail.pdtc_send_pathway}}selected="selected"{{/if}}>Please Select</option>
			<option value="Email only" {{if $detail.pdtc_send_pathway eq 'Email only'}}selected="selected"{{/if}}>Email only</option>
			<option value="Email and Click and Send" {{if $detail.pdtc_send_pathway eq 'Email and Click and Send'}}selected="selected"{{/if}}>Email and Click and Send</option>
		</select>
	 </td>
	</tr>

	<tr>
	 <th>Upload letter</th>
	 <td>
		<input type="file" name="letter" />
		{{if $detail.pdtc_letter_upload}}<br /><small>Current: {{$detail.pdtc_letter_upload}}</small>{{/if}}
	 </td>
	</tr>

	<tr>
	 <th>When letter emailed</th>
	 <td><input type="text" name="pdtc[pdtc_letter_email]" value="{{$detail.pdtc_letter_email}}" class="w16em dateformat-d-ds-m-ds-Y dtpic" /></td>
	</tr>

	<tr>
	 <th>Who Letter Emailed</th>
	 <td>
		<datalist id='email_user'>
		{{foreach from=$userdetail key="key3" item="item3"}}
			<option value="{{$item3.user_name}}">{{$item3.user_name}}</option>
		{{/foreach}}
		</datalist>
		<input type="text" list="email_user" name="pdtc[pdtc_email_user]" style="width:700px" value="{{$detail.pdtc_email_user}}" placeholder="Type in and select the user" />
	 </td>
	</tr>

	<tr>
	 <th>Status</th>
	 <td>
		<select name="pdtc[pdtc_status]" style="width:300px;">
			<option value="Open" {{if !$detail.pdtc_status || $detail.pdtc_status eq 'Open'}}selected="selected"{{/if}}>Open</option>
			<option value="Closed" {{if $detail.pdtc_status eq 'Closed'}}selected="selected"{{/if}}>Closed</option>
		</select>
	 </td>
	</tr>

	<tr>
		<th>Notes:</th>
		<td width="900">
		<textarea cols="1000" rows="25" name="pdtc[pdtc_notes]" id="editor1" class="ckeditor" style="height:270px;">{{$detail.pdtc_notes}}</textarea>
		</td>
	</tr>

	<tr>
	 <th>Evidence</th>
	 <td>
		<input type="file" name="evidence" />
		{{if $detail.pdtc_evidence}}<br /><small>Current: {{$detail.pdtc_evidence}}</small>{{/if}}
	 </td>
	</tr>

	<tr>
		<td colspan="2" style="text-align:center;">
		{{if $detail.pdtc_workflow_status eq 'Approved'}}
		  <input type="submit" name="subAddDetail" value="Save" class="vsml" />
		  <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
		{{elseif $pdtc_id}}
		  <input type="submit" name="subApprove" value="Approve" class="vsml" />
		  <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
		{{else}}
		  <input type="submit" name="subApprove" value="Approve" class="vsml" />
		  <input type="submit" name="subPending" value="Pending Confirmation" class="vsml" />
		  <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
		{{/if}}
		</td>
	</tr>
</table>
</form>

<script type="text/javascript">
	function closepop()
	{
		setTimeout('parent.close_win();', 500);
	}
</script>
</div>
<script>
	initSample();
</script>
