<style>
td {
	color: #000;
}
</style>

<div style="float:left; text-align:left;">
	<form name="filter_enquiry" method="post" action="">
	<input type="submit" value="Filter by Active Status" name="search_enquiry_active_status">
	<input type="submit" value="Clear Filter" name="clear_enquiry_filter">
	</form>
</div>
<div class="" style="float:right;">
	<input type="button" name="SMS Template Admin" value="SMS Template Admin" title="Set SMS Template" onclick="javascript:open_url('enquiry_sms_template');" />
	<input type="button" name="Enquiries" value="Add New" title="Add New Enquiry Details" onclick="javascript:open_url('enquiries_detail');" />
	<input type="button" name="Detailed Report" value="Detailed Report" title="Send Enquiries Email" onclick="javascript:open_url('enquiry_email');" />
</div>
<table id="list-table">
	<thead>
		<tr>
			<th class="topmenu" align="center" valign="middle">Sr. No.</th>
			<th class="topmenu" align="center" valign="middle">Enquiry Name</th>
			<th class="topmenu" align="center" valign="middle">Date of Enquiry</th>
			<th class="topmenu" align="center" valign="middle">Email Address</th>
			<th class="topmenu" align="center" valign="middle">Phone Number</th>
			<th class="topmenu" align="center" valign="middle">Documents Sent </th>
			<th class="topmenu" align="center" valign="middle">Notes</th>
			<th class="topmenu" align="center" valign="middle">Email Documents</th>
			<th class="topmenu" align="center" valign="middle">SMS</th>
			<th class="topmenu" align="center" valign="middle">Status</th>
			<th class="topmenu" align="center" valign="middle">Interest</th>
			<th class="topmenu" align="center" valign="middle">Download</th>
			<th class="topmenu" align="center" valign="middle">Action</th>
		</tr>
	</thead>
	<tbody>
		{{if $data_enquiries_table}}
		{{assign var="en" value=1}}
		{{foreach from=$data_enquiries_table key="key" item="item"}}
		
		{{if $item.psre_status eq 'Inactive'}}
			{{assign var="bgcolor" value="red"}}
		{{else}}
			{{assign var="bgcolor" value=""}}
		{{/if}}
		<tr bgcolor='{{ cycle values=" #D3E8D6,WHITE" advance=true }}' id="status_{{$item.psre_id}}" style="background-color: {{$bgcolor}}">
			<td>{{$en}}</td>
			<td>{{$item.psre_enquiry_name}}&nbsp;{{$item.psre_enquiry_name_last}}</td>
			<td>{{$item.psre_date_of_enqury}}</td>
			<td>{{$item.psre_email_address}}</td>
			<td>{{$item.psre_phone_number}}</td>
			<td {{if $item.psre_document_sent eq 1}}style="pointer-events: none;"{{/if}}>
				<form name="recmet3" method="post" action="">
					<input type="hidden" name="psre_document_sent[psre_id]" value="{{$item.psre_id}}">
					<label class="switch">
						<input class="switch-input" type="checkbox" name="psre_document_sent[psre_document_sent]" value="1" onclick="this.form.submit();" {{if $item.psre_document_sent eq 1}} checked="checked" disabled="disabled"{{/if}} />
						<span class="switch-label" data-on="Yes" data-off="No"></span>
						<span class="switch-handle"></span> <br />
					</label>
				</form>
				{{if $item.psre_document_sent eq 1 and empty($item.psre_enquiry_user) }}
					{{$item.psre_document_sent_user}} <br/> {{$item.psre_document_sent_date|date_format:"%d-%m-%Y"}}
				{{elseif !empty($item.psre_enquiry_user)}}
					{{$item.psre_enquiry_user}} <br/>{{$item.psre_enquiry_date}}
				{{/if}}
			</td>
			<td>
				<a href="{{$BASE_URL}}{{$BASEFOLDER}}.view_en_notes/psre_id/{{$item.psre_id}}/psren_bsn_id/{{$bsn_id}}" class="various">Notes</a>
				{{if $item.latest_note_date}}
					<br>
					{{$item.latest_note_date|date_format:"%d/%m/%Y"}}
				{{/if}}
			</td>
			<td>
				{{if $item.psre_email_address}}
				<input type="button" name="Hot Button" value="Hot Button" title="View Document Email" onclick="javascript:open_url('document_email', {{$item.psre_id}});" />
				{{else}}
				No Email Mentioned
				{{/if}}
				
				{{if $item.psre_enquiry_user}}
				<div>{{$item.psre_enquiry_user}} <br/>{{$item.psre_enquiry_date}}</div>
				{{/if}}
			</td>
			<td>
				{{if $item.psre_phone_number}}
					<input type="button" name="Send SMS" value="Send SMS" title="View & Send SMS Template" onclick="javascript:open_url('send_sms', {{$item.psre_id}});" />
					{{if $item.psre_sms_send}}
						<div>{{$item.psre_sms_send_by}} <br/>{{$item.psre_sms_send_at}}</div>
					{{/if}}
				{{else}}
					No SMS Mentioned
				{{/if}}
			</td>
			<td>
				<select name="psre_status[{{$item.psre_id}}]" onchange="update_enquiry_status({{$item.psre_id}}, this.value)">
					<option value="Active" {{if $item.psre_status eq 'Active'}}selected="selected"{{/if}}>Active</option>
					<!--<option value="Cold" {{if $item.psre_status eq 'Cold'}}selected="selected"{{/if}}>Cold</option>
					<option value="Warm" {{if $item.psre_status eq 'Warm'}}selected="selected"{{/if}}>Warm</option>-->
					<option value="Inactive" {{if $item.psre_status eq 'Inactive'}}selected="selected"{{/if}}>Inactive</option>
				</select>
				<div id="ps_status_{{$item.psre_id}}">{{if $item.psre_status_user and $item.psre_status_user neq '0' and $item.psre_status_date and $item.psre_status_date neq '0'}}{{$item.psre_status_user}}<br/>{{$item.psre_status_date}}{{elseif $item.psre_status_user and $item.psre_status_user neq '0'}}{{$item.psre_status_user}}{{elseif $item.psre_status_date and $item.psre_status_date neq '0'}}{{$item.psre_status_date}}{{/if}}</div>
				<script>
					function update_enquiry_status(id, value) {
						var status = '#status_' + id;
						var ps = '#ps_status_' + id;
						$.ajax({
							type: "GET",
							url: "{{$BASE_URL}}{{$BASEFOLDER}}.update_enquiry_status/psre_id/" + id + "/value/" + value,
							success: function (result) {								
								var data = JSON.parse(result);
								
								var statusResult = data.psre_status;
								var statusUser = data.psre_status_user;
								var statusDate = data.psre_status_date;
								
								if (statusResult == 'Inactive') {
									$(status).css('background', 'red');
								} else {
									$(status).css('background', '');
								}
								
								if (statusUser && statusUser != '0' && statusDate && statusDate != '0') {
									$(ps).html(statusUser + '<br/>' + statusDate);
								} else if (statusUser && statusUser != '0') {
									$(ps).html(statusUser);
								} else if (statusDate && statusDate != '0') {
									$(ps).html(statusDate);
								} else {
									$(ps).html('');
								}
							}
						});
					}
				</script>
			</td>
			<td>
				<select name="psre_interest[{{$item.psre_id}}]" onchange="update_enquiry_interest({{$item.psre_id}}, this.value)">
					<option value="Strong" {{if $item.psre_interest eq 'Strong'}}selected="selected"{{/if}}>Strong</option>
					<option value="Possible" {{if $item.psre_interest eq 'Possible'}}selected="selected"{{/if}}>Possible</option>
					<option value="Can't Determine" {{if $item.psre_interest eq "Can't Determine"}}selected="selected"{{/if}}>Can't Determine</option>
				</select>
				<div id="ps_interest_{{$item.psre_id}}">{{if $item.psre_interest_user}}{{$item.psre_interest_user}}<br/>{{$item.psre_interest_date}}{{/if}}</div>
				<script>
					function update_enquiry_interest(id, value) {
						var pi = '#ps_interest_' + id;
						$.ajax({
							type: "GET",
							url: "{{$BASE_URL}}{{$BASEFOLDER}}.update_enquiry_interest/psre_id/" + id + "/value/" + encodeURIComponent(value),
							success: function (result) {
								$(pi).html(result);
							}
						});
					}
				</script>
			</td>
			<td style="text-align:center;">
				<a href="{{$BASE_URL}}js/vcard/index.php?fname={{$item.psre_enquiry_name}}&lname={{$item.psre_enquiry_name_last}}&email={{$item.psre_email_address}}&mobile={{$item.psre_phone_number}}" class="action_new" title="Download Vcard">Vcard</a>
			</td>
			<td> 
				<a href="{{$BASE_URL}}properties_sale_reports.enquiries_detail/bsn_id/{{$bsn_id}}/psre_id/{{$item.psre_id}}" class="various" title="Edit"> 
				<img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
				<a href="{{$BASE_URL}}properties_sale_reports.delete_enquiries_detail/bsn_id/{{$bsn_id}}/psre_id/{{$item.psre_id}}" onclick="javascript:if(!confirm('Are you sure want to delete this Enquiry?')) return false;" title="Delete"><img style="height: 16px;; width:16px" src="{{$BASE_URL}}css/admin/images/deletecross.png"/></a>
			</td>
		</tr>
		{{assign var="en" value=$en+1}}
		{{/foreach}}
		{{else}}
		<tr>
			<td colspan="13" style="text-align: center">No Data Available</td>
		</tr>
		{{/if}}
	</tbody>									
</table>
{{if $last > 1}}
    <table width="90%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            {{if $list}}
            <td align="center">
                <div class='pagination'>
                    {{if $pagenum == 1}}
                    <span class='disabled'>&#171; previous</span>
                    {{else}}
                        <a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{math equation=" x - y"
                            x=$pagenum y=1}}" title="Previous">&#171; previous</a>
                        {{/if}}
                        {{if $pagenum != 1}}
                        <span class="paginate"><a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/1"
                                title="{{$page_num}} Page">1</a></span>
                        {{else}}<span class='current'>1</span>
                            {{/if}}{{if $pagenum != 2}}
                            <span class="paginate"><a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/2"
                                    title="{{$page_num}} Page">2</a></span>
                            {{else}}<span class='current'>2</span>
                                {{/if}}
                                {{if $paginateprev.0 > 3}}
                                ...
                                {{/if}}
                                {{foreach from=$paginateprev key="page_key" item="page_num"}}
                                {{if $page_num == $pagenum OR $page_num <= 2}}
                                {{elseif $page_num == $lastone}}
                                {{else}} <span class="paginate"><a class="pagination"
                                            href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$page_num}}"
                                            title="{{$page_num}} Page">{{$page_num}}</a></span>
                                    {{/if}}
                                    {{/foreach}}
                                    {{foreach from=$paginatenext key="page_key" item="page_num2"}}
                                    {{if $page_num2 < $last AND $page_num2 != $lastone}}
                                    {{if $page_num2 == 1}}
                                    {{elseif $page_num2 == 2}}
                                    {{else}}
                                        {{if $page_num2 == $pagenum OR $page_num2 <= 0}}
                                        <span class='current'> {{$page_num2}}</span>
                                        {{else}}
                                            <a class="pagination"
                                                href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$page_num2}}"
                                                title="{{$page_num2}} Page">{{$page_num2}}</a>
                                            {{/if}}
                                            {{/if}}
                                            {{/if}}
                                            {{/foreach}}
                                            {{if $page_num2 < $lasttow}}
                                            ...
                                            {{/if}}
                                            {{if $lastone == 1}}
                                            {{elseif $lastone == 2}}
                                            {{else}}
                                                {{if $pagenum == $lastone }}
                                                <span class='current'>{{$lastone}}</span>
                                                {{else}}
                                                    <a class="pagination"
                                                        href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$lastone}}"
                                                        title="{{$lastone}} Page">{{$lastone}}</a>
                                                    {{/if}}
                                                    {{/if}}
                                                    {{if $last == 1}}
                                                    {{elseif $last == 2}}
                                                    {{else}}
                                                        {{if $pagenum == $last}}
                                                        <span class='current'>{{$last}}</span>
                                                        {{else}}
                                                            <a class="pagination"
                                                                href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$last}}"
                                                                title="{{$last}} Page">{{$last}}</a>
                                                            {{/if}}
                                                            {{/if}}
                                                            {{if $pagenum == $last}}
                                                            <span class='disabled'>next &#187;</span>
                                                            {{else}}
                                                                <a class="pagination"
                                                                    href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{math equation="
                                                                    x + y" x=$pagenum y=1}}" title="Next">next
                                                                    &#187;</a>
                </div>
                {{/if}}
            </td>
            {{else}}
                <td align="center" height="300">Record Not found... </td>
                {{/if}}
        </tr>
    </table>
    {{/if}}