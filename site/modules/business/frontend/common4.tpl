{{if !empty($taskmsg)}}{{$taskmsg}}{{/if}}


{{if !empty($allTasksrenovation) AND count($allTasksrenovation)}}
<style>
ol {list-style-type: decimal; }
ul {list-style-type:disc; }
</style>
<div id="myContent{{$n}}">
<table cellpadding="0" cellspacing="0" border="1"  width="100%" id="divtruelog" style="border-collapse:collapse;">
<tr>
<th width="7%">Action</th>
<th width="2%">Seq</th>
<th width="2%">UID</th>
<th width="32%">Task Name</th>
<th width="5%">Complete</th>
<th width="8%">Complete Date</th>
<th width="8%">Completed By</th>
<th width="27%" align="left">Relevant Procedures</th>
<th width="5%" align="left">Task Emails</th>
<th width="2%" align="left">Help</th>
 <th width="5%" align="left">Video Link</th>
</tr>
{{assign var="bg" value="D4D7FE"}}   
{{foreach from=$allTasksrenovation item=item key=key}}
{{if $bg == 'D4D7FE'}} {{assign var="bg" value="FFF"}} {{elseif $bg == 'FFF'}} {{assign var="bg" value="D4D7FE"}} {{/if}}
<tr style="background-color:#{{$bg}};">

<td>
<a href="javascript:modelwindow('{{$BASE_URL}}business.subtaskrenovation/bus_id/{{$item.bt_bsn_id}}/tn/{{$item.bt_task_list_number}}/tid/{{$item.bt_task_id}}','90%','90%', 'yes');">
<img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/sub.png" title="Sub Task Edit"/></a> 


<a href="javascript:modelwindow('{{$BASE_URL}}business.taskeditrenovation/bus_id/{{$item.bt_bsn_id}}/taskId/{{$item.bt_id}}/tn/{{$item.bt_task_list_number}}','90%','90%', 'yes');">
<img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png" title="Task Edit"/></a>  

 <a href="javascript:modelwindow('{{$BASE_URL}}business.renovation_qa/bus_id/{{$item.bt_bsn_id}}/tsid/{{$item.bt_task_status_id}}/tid/{{$item.bt_task_id}}','90%','90%', 'yes');">
<img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/qa.png" title="Sub Task Edit"/></a> 


</td>
  
<td align="center">{{counter}}</td>
<td align="center">{{if $item.bst_task_id == 0}}{{$item.bst_id}}{{else}}{{$item.bst_task_id}}{{/if}}</td>
<td style="color:{{if $item.bt_complete=='0'}}RED{{/if}};">{{$item.st_name}} - {{$item.bst_task_name}}</td>
<td style="text-align:center;"><input type="checkbox" {{if $item.bt_complete=='1'}}checked="checked"{{/if}} disabled="disabled"/></td>
<td style="text-align:center;">{{if $item.bt_completed_date != 0}}{{$item.bt_completed_date|date_format:"%d/%m/%Y"}} {{/if}}</td>
<td style="text-align:center;">{{$item.user_name}}</td>
<td align="left">

{{foreach from=$allTasksProcProposal item=item_p key=key_p}}

{{if $item.bt_task_id eq $item_p.btp_bst_id}}
<div> <a href="{{$BASE_URL}}{{$FILE_PATH}}files/template_documents_hub/{{$item_p.btp_doc}}?dummy={{$ran}}">{{$item_p.btp_doc_longtext}}</a> </div><br />
{{/if}}

{{/foreach}}


</td>

<td>

{{foreach from=$proposalEmailLink item=item_e key=key_e}}

{{if $item.bt_task_id eq $item_e.pel_task_id}}
<div> <a href="{{$BASE_URL}}emaillibrary.compose/eml_id/{{$item_e.pel_email_id}}" target="_blank">{{$item_e.pel_email_linked}}</a> </div><br />
{{/if}}

{{/foreach}} 


 </td>


<td align="left">{{if $item.bst_instruction}}
  <a href="javascript:parent.showFancybox('{{$item.bst_instruction}}');"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}images/help.png" title="Help"/></a>
  {{/if}}
</td>

<td> {{if $item.bst_video_link}} <a href="{{$item.bst_video_link}}" target="_blank">Link</a> {{/if}} </td>


</tr>
{{/foreach}}
</table>
<!-- Begin Pagination -->
{{if $last > 1}}
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center" style="border:none;">
<tr> {{if $last}}
<td align="center"><div class='pagination'> {{if $pagenum == 1}} <span class='disabled'>&laquo; previous</span> {{else}} <a class="pagination" href="javascript:requestAllTasksProposal({{math equation="x - y" x=$pagenum y=1}},{{$n}})" title="Previous">&laquo; previous</a> {{/if}}
    
    {{if $pagenum != 1}} <span class="paginate"><a class="pagination"  href="javascript:requestAllTasksProposal(1,{{$n}})" title="{{$page_num}} Page">1</a></span> {{else}}<span class='current'>1</span> {{/if}}{{if $pagenum != 2}} <span class="paginate"><a class="pagination"  href="javascript:requestAllTasksProposal(2,{{$n}})" title="{{$page_num}} Page">2</a></span> {{else}}<span class='current'>2</span> {{/if}}
    {{if $paginateprev.0 > 3}}
    ...
    {{/if}}
    {{foreach from=$paginateprev key="page_key" item="page_num"}}
    {{if $page_num == $pagenum OR $page_num <= 2}}
    {{elseif $page_num == $lastone}}
    
    {{else}} <span class="paginate"><a class="pagination"  href="javascript:requestAllTasksProposal({{$page_num}},{{$n}})" title="{{$page_num}} Page">{{$page_num}}</a></span> {{/if}}
    {{/foreach}}
    
    {{foreach from=$paginatenext key="page_key" item="page_num2"}}
    {{if $page_num2 < $last AND $page_num2 != $lastone}}
    {{if $page_num2 == 1}}
    {{elseif $page_num2 == 2}}
    {{else}}
    {{if $page_num2 == $pagenum OR $page_num2 <= 0}} <span class='current'> {{$page_num2}}</span> {{else}} <a class="pagination"  href="javascript:requestAllTasksProposal({{$page_num2}},{{$n}})" title="{{$page_num2}} Page">{{$page_num2}}</a> {{/if}}
    {{/if}}     
    {{/if}}
    {{/foreach}}
    {{if $page_num2 < $lasttow}}
    ...
    {{/if}}
    {{if $lastone == 1}}
    {{elseif $lastone == 2}}
    {{else}}
    {{if $pagenum == $lastone }} <span class='current'>{{$lastone}}</span> {{else}} <a class="pagination"  href="javascript:requestAllTasksProposal({{$lastone}},{{$n}})" title="{{$lastone}} Page">{{$lastone}}</a> {{/if}}
    {{/if}}
    {{if $last == 1}}
    {{elseif $last == 2}}
    {{else}}
    {{if $pagenum == $last}} <span class='current'>{{$last}}</span> {{else}} <a class="pagination"  href="javascript:requestAllTasksProposal({{$last}},{{$n}})" title="{{$last}} Page">{{$last}}</a> {{/if}}
    {{/if}}
    {{if $pagenum == $last}} <span class='disabled'>next &raquo;</span> {{else}} <a class="pagination" href="javascript:requestAllTasksProposal({{math equation="x + y" x=$pagenum y=1}},{{$n}})" title="Next">next &raquo;</a></div>
  {{/if}} </td>
{{else}}
<td align="center" height="300">Record Not found... </td>
{{/if}} </tr>
</table>
{{/if}}
</div>
<!-- End Pagination -->
{{/if}}
{{if !empty($taskId)}}
<table cellpadding="0" cellspacing="0" style="border:1px solid #339999; width:100%">
<tr>
<td><table cellpadding="0" cellspacing="0">
    <tr>
      <td> {{if $taskData.st_name}}<strong>Status:</strong> {{$taskData.st_name}} {{/if}}
      	   {{if $taskData.pt_name}}<strong>Types:</strong> {{$taskData.pt_name}} {{/if}}	
      </td>
      <td>&nbsp;</td>
      <td><strong>Task Name:</strong> {{$taskData.bst_task_name}}</td>
    </tr>
  </table></td>
</tr>
<tr>
<td><table cellpadding="0" cellspacing="0" >
    <tr>
      <td><strong>Complete:</strong>
        <input type="checkbox" {{if $taskData.bt_complete == 1}} checked="checked" {{/if}} id="bt_complete" />
      </td>
      <td style="width:90px;">&nbsp;</td>
      <td><strong>Complete Date:</strong>
        <input type="text" name="{{$TABLE}}[bsn_status_date]" value="{{$taskData.date}}" class="w16em dateformat-d-ds-m-ds-Y" id="editTaskDate" maxlength="25" />
        &nbsp;
        <input type="text" name="{{$TABLE}}[bsn_status_time]" value="{{$taskData.time}}" class="vvsml" id="editTaskTime" readonly="readonly"/>
        &nbsp;<a href="javascript:setcur_date('curdate','editTaskDate','editTaskTime');" title="System Date/Time">
        <img src="{{$BASE_URL}}images/clock.png" alt="System Date" /></a> </td>
      
      <td style="width:50px;">&nbsp;</td>
      <td><strong>Completed By:</strong>{{$taskData.customer_name|default:"Administrator"}}</td>
    </tr>
  </table></td>
</tr>
<tr>
<td><table cellpadding="0" cellspacing="0" >
    <tr>
      <td><strong>Comments:</strong></td>
      <td><textarea name="" cols="55" rows="5" id="bt_comment">{{$taskData.bt_comment}}</textarea></td>
    </tr>
  </table></td>
</tr>
<tr>
<td><strong>Instruction:</strong>{{$taskData.bt_instruction}} </td>
</tr>
<tr>
<td><input type="button" value="Update" onclick="requestTaskEdit({{$taskData.bt_id}},'SaveEdit');" />
  <input type="button" value="Cancel" onclick="requestTaskEdit({{$taskData.bt_id}},'CloseEdit');" /></td>
</tr>
</table>
{{/if}}

{{if !empty($taskUpdateMsg)}}
{{$taskUpdateMsg}}
{{/if}}

{{if $checkListErrorMsg}}
<!-- Begin Create Document Checklist section -->
<div style="color:#FF6600; font-weight:bold;">{{$checkListErrorMsg}}</div>
<br />
{{/if}}
{{if !empty($allptTasks) AND count($allptTasks)}}
<table cellpadding="0" cellspacing="0" id="taskstypes"  width="100%">
<tr>
<th width="12%">Action</th>
<th width="3%">Seq</th>
<th width="33%">Task Name</th>
<th width="5%">Complete</th>
<th width="10%">Complete Date</th>
<th width="10%">Completed By</th>
<th width="12%" align="left">Comment</th>
<th width="7%" align="left">Email Task</th>
<th width="10%" align="left">Merge Docs</th>
</tr>
{{assign var="bg" value="D4D7FE"}}   
{{foreach from=$allptTasks item=item key=key}}
{{if $bg == 'D4D7FE'}} {{assign var="bg" value="FFF"}} {{elseif $bg == 'FFF'}} {{assign var="bg" value="D4D7FE"}} {{/if}}
<tr style="background-color:#{{$bg}};">
<td><a href="javascript:requestptypeTaskEdit({{$item.bt_id}},'OpenEdit');"> <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png" title="Edit"/></a>&nbsp;&nbsp; <a href="javascript:requestptypeTaskDone({{$item.bt_id}});"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/complete.png" title="Complete"/></a>&nbsp;&nbsp;
  {{if $item.bst_document}}<a href="{{$BASE_URL}}{{$FILE_PATH}}files/task_files/{{$item.bst_document}}?dummy={{$ran}}" target="_blank"><img src="{{$BASE_URL}}css/default/images/document-task.gif" title="View"/></a>{{/if}}&nbsp;&nbsp; </td>
<td align="center">{{counter}}</td>
<td style="color:{{if $item.bt_complete=='0'}}RED{{/if}};">{{$item.pt_name}} - {{$item.bst_task_name}}</td>
<td style="text-align:center;"><input type="checkbox" {{if $item.bt_complete=='1'}}checked="checked"{{/if}} disabled="disabled"/></td>
<td style="text-align:center;">{{if $item.bt_completed_date != 0}}{{$item.bt_completed_date|date_format:"%d/%m/%Y"}} {{/if}}</td>
<td style="text-align:center;">{{$item.user_name}}</td>
<td align="left">{{$item.bt_comment}}</td>
<td align="center">{{if $item.et_id}}
  <div align="center"><a href="javascript:parent.seller_tasks_email({{$item.bt_bsn_id}},{{$item.et_id}});"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}images/emailnew.png" title="Email"/></a></div>
  {{/if}}</td>
<td align="left"></td>
</tr>
{{/foreach}}
</table>
<!-- Begin Pagination -->
{{if $last > 1}}
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center" style="border:none;">
<tr> {{if $last}}
<td align="center"><div class='pagination'> {{if $pagenum == 1}} <span class='disabled'>&laquo; previous</span> {{else}} <a class="pagination" href="javascript:requestAllTasks({{math equation="x - y" x=$pagenum y=1}})" title="Previous">&laquo; previous</a> {{/if}}
    
    {{if $pagenum != 1}} <span class="paginate"><a class="pagination"  href="javascript:requestAllTasks(1)" title="{{$page_num}} Page">1</a></span> {{else}}<span class='current'>1</span> {{/if}}{{if $pagenum != 2}} <span class="paginate"><a class="pagination"  href="javascript:requestAllTasks(2)" title="{{$page_num}} Page">2</a></span> {{else}}<span class='current'>2</span> {{/if}}
    {{if $paginateprev.0 > 3}}
    ...
    {{/if}}
    {{foreach from=$paginateprev key="page_key" item="page_num"}}
    {{if $page_num == $pagenum OR $page_num <= 2}}
    {{elseif $page_num == $lastone}}
    
    {{else}} <span class="paginate"><a class="pagination"  href="javascript:requestAllTasks({{$page_num}})" title="{{$page_num}} Page">{{$page_num}}</a></span> {{/if}}
    {{/foreach}}
    
    {{foreach from=$paginatenext key="page_key" item="page_num2"}}
    {{if $page_num2 < $last AND $page_num2 != $lastone}}
    {{if $page_num2 == 1}}
    {{elseif $page_num2 == 2}}
    {{else}}
    {{if $page_num2 == $pagenum OR $page_num2 <= 0}} <span class='current'> {{$page_num2}}</span> {{else}} <a class="pagination"  href="javascript:requestAllTasks({{$page_num2}})" title="{{$page_num2}} Page">{{$page_num2}}</a> {{/if}}
    {{/if}}     
    {{/if}}
    {{/foreach}}
    {{if $page_num2 < $lasttow}}
    ...
    {{/if}}
    {{if $lastone == 1}}
    {{elseif $lastone == 2}}
    {{else}}
    {{if $pagenum == $lastone }} <span class='current'>{{$lastone}}</span> {{else}} <a class="pagination"  href="javascript:requestAllTasks({{$lastone}})" title="{{$lastone}} Page">{{$lastone}}</a> {{/if}}
    {{/if}}
    {{if $last == 1}}
    {{elseif $last == 2}}
    {{else}}
    {{if $pagenum == $last}} <span class='current'>{{$last}}</span> {{else}} <a class="pagination"  href="javascript:requestAllTasks({{$last}})" title="{{$last}} Page">{{$last}}</a> {{/if}}
    {{/if}}
    {{if $pagenum == $last}} <span class='disabled'>next &raquo;</span> {{else}} <a class="pagination" href="javascript:requestAllTasks({{math equation="x + y" x=$pagenum y=1}})" title="Next">next &raquo;</a></div>
  {{/if}} </td>
{{else}}
<td align="center" height="300">Record Not found... </td>
{{/if}} </tr>
</table>
{{/if}}
<!-- End Pagination -->
{{/if}}


{{if !empty($taskUpdateMsg)}}
{{$taskUpdateMsg}}
{{/if}}




{{if !empty($print_data_renovation)}}
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<div style="font-style:bold; text-align:left; padding:5px;">   
<form name="tablename" method="post" action="" >
<input type="hidden" name="renovation[dpn_bsn_id]" value="{{$bsn_id_renovation}}" />
<input type="hidden" name="renovation[dpn_proposal_number]" value="1" />
<div style="width:75%; float:left;">
Document Proposal : <input type="text" name="renovation[dpn_name]" value="{{$dpn_name}}"}} style="width:400px;"  /> &nbsp;
Primary Design : <input type="radio" name="renovation[dpn_primary_design]" value="1"  {{if $dpn_primary_design  == 1}} checked="checked" {{/if}}/>  Yes  &nbsp; 
<input type="radio" name="renovation[dpn_primary_design]" value="0"  {{if $dpn_primary_design == 0}} checked="checked" {{/if}} /> NO <br />
Design Type : <select name="renovation[dpn_design_type]">
<option value="1" {{if $dpn_design_type eq 1}} selected="selected" {{/if}}>Concept Design</option>
<option value="2" {{if $dpn_design_type eq 2}} selected="selected" {{/if}}>Modification Design</option>
<option value="3" {{if $dpn_design_type eq 3}} selected="selected" {{/if}}>Existing Design</option>
<option value="4" {{if $dpn_design_type eq 4}} selected="selected" {{/if}}>External Design </option>
<option value="5" {{if $dpn_design_type eq 5}} selected="selected" {{/if}}>Renovation Design </option>
</select>
&nbsp &nbsp; &nbsp; Customer Designer: <input type="text" name="renovation[dpn_customer_designer]" value="{{$dpn_customer_designer}}" style="width:200px;"  /> &nbsp; 
Arch : <input type="text" name="renovation[dpn_architect]" value="{{$dpn_architect}}" style="width:200px;"  />

<br />

Checklist Number : <input type="text" name="renovation[dpn_unique_id]" value="{{$dpn_unique_id}}" style="width:200px;" readonly="readonly"  /> &nbsp;
<!--Project Type : <select name="renovation[dpn_project_type]">
<option value="1" {{if $dpn_project_type eq 1}} selected="selected" {{/if}}>SR</option>
<option value="2" {{if $dpn_project_type eq 2}} selected="selected" {{/if}}>FPE</option>
<option value="3" {{if $dpn_project_type eq 3}} selected="selected" {{/if}}>Other</option>
</select> -->&nbsp; &nbsp;
Include in report : <input type="radio" name="renovation[dpn_include_in_report]" value="1"  {{if $dpn_include_in_report  == 1}} checked="checked" {{/if}}/>  Yes  &nbsp; 
<input type="radio" name="renovation[dpn_include_in_report]" value="0"  {{if $dpn_include_in_report == 0}} checked="checked" {{/if}} /> NO 
&nbsp; &nbsp; HIA Signed : <input type="radio" name="renovation[dpn_hia_signed]" value="1" {{if $dpn_hia_signed ==1}} checked="checked" {{/if}}> Yes &nbsp;
<input type="radio" name="renovation[dpn_hia_signed]" value="0" {{if $dpn_hia_signed==0}} checked="checked" {{/if}}> No <br/>
&nbsp;
</div>
<div style="width:25%; float:right;">
Notes: <br />
<textarea rows="3" cols="40" name="renovation[dpn_notes]">{{$dpn_notes}}</textarea>
</div><br />
File Path - 1  <input type="text" name="renovation[dpn_link1]" value="{{$dpn_link1}}" style="width:700px;"  />
&nbsp; &nbsp;Created By : <input type="text" name="renovation[dpn_created_by]" value="{{$dpn_created_by}}" style="width:200px;"  />
<br />
File Path - 2  <input type="text" name="renovation[dpn_link2]" value="{{$dpn_link2}}" style="width:700px;"  /> 
&nbsp; &nbsp;Created Date : <input type="text" name="renovation[dpn_created_date]" value="{{$dpn_created_date}}" style="width:100px;" readonly="readonly" placeholder="Date will appear after save"/>
<br />

<!--Youtube Winter <input type="text" name="renovation[dpn_you_winter]" value="{{$dpn_you_winter}}" style="width:700px;"  /> <br />
Youtube Summer <input type="text" name="renovation[dpn_you_summer]" value="{{$dpn_you_summer}}" style="width:700px;"  />--> 

<!--If existing design what the design no <input type="text" name="renovation[dpn_ex_designno]" value="{{$dpn_ex_designno}}"}} style="width:40px;"  />            <br />
-->
<div style="width:25%; float:right;">
Budget :<input type="text" name="renovation[dpn_budget]" value="{{$dpn_budget}}"}} style="width:180px;"  />
</div>

<input type="submit" name="table_name_renovation" value="Save" />
&nbsp; &nbsp; 

<input type="button" name="addfile" value="Compose Email" onclick="javascript:modelwindow('{{$BASE_URL}}business.proposalchecklistemail/bus_id/{{$bsn_id_renovation}}/dpn_proposal_number/1','90%','90%', 'yes');" id="addfile" class="vsml" />

</form>
</div>
<table cellpadding="0" cellspacing="0" width="100%" id="divtruelog" style="border-collapse:collapse;">
<tr>
<th width="18%">Action</th>
<th width="25%">Document Name</th>
<th width="18%">File Name</th>
<th width="6%">Date Uploaded</th>
<th width="7%">User Name</th>

<th width="10%">Customer WWW</th>
</tr>
<form name="nr" method="post" action="">
{{foreach from=$print_data_renovation item=item key=key}}
{{if $item.doc_not_required eq 1}}
  <tr id="gr{{$item.doc_id}}" style="background:#CCC;" >
{{else}}
<tr id="gr{{$item.doc_id}}" >
{{/if}}
<td><a href="javascript:RequestcheckListIframe('checklistrenovation','{{$item.doc_id}}','{{$item.doc_checklist_number}}','');" >
<img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>
&nbsp;&nbsp;


<br />
 Make Not Required:
 <input type hidden name = "not_required[{{$item.doc_id}}][doc_id]" value = "{{$item.doc_id}}"  />
 <input type="checkbox" name = "not_required[{{$item.doc_id}}][doc_not_required]" id="notreq{{$item.doc_id}}" onclick="process({{$item.doc_bsn_id}},{{$item.doc_id}});" {{if $item.doc_not_required eq 1 }} checked="checked" {{/if}} /> 
 <p id="myElem{{$item.doc_id}}" style="display:none;"></p>


</td>
<td style="padding-left:5px;">{{$item.admin_doc_manual}}{{if $item.doc_file_name !== '' && $item.admin_doc_id == 12}} CONTRACT SIGNED {{else}}{{$item.admin_doc_name}}{{/if}}</td>

{{if !empty($ipad)}} 
<td style="text-align:left;">
<!--   <a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name}}?dummy={{$ran}}" class="action_checklist" title="{{$item.doc_file_name}}" target="_blank">{{$item.doc_file_name|truncate:"40"}}</a>-->

<a href="/business.download_content?file_name={{$item.doc_file_name}}&module_name=business.home" class="action_checklist" title="{{$item.doc_file_name}}" target="_blank">{{$item.doc_file_name|truncate:"40"}}</a> 

</td>

{{else}}
<td style="text-align:left;">
<!--   <a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name}}?dummy={{$ran}}')" class="action_checklist" title="{{$item.doc_file_name}}">{{$item.doc_file_name|truncate:"40"}}</a>-->

<a href="javascript:parent.modelviewimages('/business.download_content?file_name={{$item.doc_file_name}}&module_name=business.home')" class="action_checklist" title="{{$item.doc_file_name}}">{{$item.doc_file_name|truncate:"40"}}</a> 

</td>
 {{/if}}

<td style="text-align:center;">{{if !empty($item.doc_file_name)}}{{$item.doc_date_uploaded|date_format:"%d/%m/%Y"}}{{/if}}</td>
<td style="text-align:center;">{{$item.user_name}}</td>

<td style="text-align:left;">
<input type="radio" name="not_required[{{$item.doc_id}}][cwww]" value="1"  {{if $item.doc_cust_www  == 1}} checked="checked" {{/if}}/> <span style="padding-top:5px;"> Yes </span> <br />
<input type="radio" name="not_required[{{$item.doc_id}}][cwww]" value="0"  {{if $item.doc_cust_www == 0}} checked="checked" {{/if}} /> NO 
</td>
</tr>
{{/foreach}}


{{if !empty($cus_renovationdata)}}


{{foreach from=$cus_renovationdata item=itemc key=keyc}}

{{if !empty($itemc.cdc_doc_name)}}
{{if $itemc.cdc_not_required eq 1}}
  <tr id="grc{{$itemc.cdc_id}}" style="background:#CCC;" >
{{else}}
<tr id="grc{{$itemc.cdc_id}}" >
{{/if}}

<td><a href="javascript:RequestcheckListIframe('adddoc_checklistrenovation','{{$itemc.cdc_id}}','1','');" >
<img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a><br />
 Make Not Required:
 <input type hidden name = "not_required_custom[{{$itemc.cdc_id}}][cdc_id]" value = "{{$itemc.cdc_id}}"  />
 <input type="checkbox" name = "not_required_custom[{{$itemc.cdc_id}}][cdc_not_required]" id="notreq2{{$itemc.cdc_id}}" onclick="process2({{$itemc.cdc_bsn_id}},{{$itemc.cdc_id}});" {{if $itemc.cdc_not_required eq 1 }} checked="checked" {{/if}} /> 
 <p id="myElem2{{$itemc.cdc_id}}" style="display:none;"></p>
 </td>
<td>{{$itemc.cdc_doc_name}}</td>

{{if !empty($ipad)}} 
<td style="text-align:left;">
<!--    <a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$itemc.cdc_file_name}}?dummy={{$ran}}" class="action_checklist" title="{{$itemc.cdc_file_name}}" target="_blank">{{$itemc.cdc_file_name|truncate:"40"}}</a>-->

   <a href="/business.download_content?file_name={{$item.cdc_file_name}}&module_name=business.home" class="action_checklist" title="{{$itemc.cdc_file_name}}" target="_blank">{{$itemc.cdc_file_name|truncate:"40"}}</a> 

</td>

{{else}}
<td style="text-align:left;">
<!--   <a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$itemc.cdc_file_name}}?dummy={{$ran}}')" class="action_checklist" title="{{$item.doc_file_name}}">{{$itemc.cdc_file_name|truncate:"40"}}</a>-->

 <a href="javascript:parent.modelviewimages('/business.download_content?file_name={{$itemc.cdc_file_name}}&module_name=business.home')" class="action_checklist" title="{{$itemc.cdc_file_name}}">{{$itemc.cdc_file_name|truncate:"40"}}</a> 

</td>
 {{/if}}



<td> {{if !empty($itemc.cdc_file_name)}} {{$itemc.cdc_date_uploaded|date_format:"%d/%m/%Y"}} {{/if}} </td>
<td> {{$itemc.cdc_user_name}} </td>
<td> 
<input type="radio" name="not_required_custom[{{$itemc.cdc_id}}][cwww]" value="1"  {{if $itemc.cdc_cust_www  == 1}} checked="checked" {{/if}}/> <span style="padding-top:5px;"> Yes </span> <br />
<input type="radio" name="not_required_custom[{{$itemc.cdc_id}}][cwww]" value="0"  {{if $itemc.cdc_cust_www == 0}} checked="checked" {{/if}} /> NO 

</td>
</tr>
{{/if}}

{{/foreach}}
{{/if}}


<tr> <td colspan="6"><input type="submit" name="not_required_save_reno" value="Update Renovation List" />
<!--<a href="javascript:RequestcheckListIframe('adddoc_checklistrenovation','','{{$bsn_id_renovation}}','1');" class="btn" >-->
<a href="javascript:RequestcheckListIframe('adddoc_checklistrenovation','','1','');" >Add New Document</a> &nbsp; &nbsp;

  <strong> <span style="border:1px solid #AAA; padding:4px;"> Task List {{$done}}/{{$tot}} </span> </strong> &nbsp; &nbsp;
  <input type="button" value="Add Tasks / Sync Task" onclick="requestAddTaskRenovation(1);" />
 <!-- <input type="hidden" id="bt_task_list_number" value="1" />-->
  <input type="button" value="Load Renovation Task List" onclick="requestAllTasksRenovation(0,1);" />
  <input type="button" value="Show Hide Renovation Task List" onclick="javascript:parent.toggleDiv('myContent1');" />

</td>
</tr>
</form>

</table>
<table width="100%" >  
<tr> <td>  <div id="taskmsgrenovation" style="color:#FF6600;" align="left"></div> </td> </tr>
<tr> <td> <div id="AllTaskDivProposal1"></div> </td> </tr>
<tr> <td> <div id="editTaskDivProposal" align="left"></div> </td> </tr>
</table>

{{/if}}


{{if !empty($print_data_renovation2)}}
<br />
<div style="font-style:bold; text-align:left; padding:5px;"> 
<form name="tablename" method="post" action="" >
<input type="hidden" name="renovation[dpn_bsn_id]" value="{{$bsn_id_renovation}}" />
<input type="hidden" name="renovation[dpn_proposal_number]" value="2" />
<div style="width:75%; float:left;">
Document Proposal : <input type="text" name="renovation[dpn_name]" value="{{$dpn_name_2}}"}} style="width:400px;"  />
Primary Design : <input type="radio" name="renovation[dpn_primary_design]" value="1"  {{if $dpn_primary_design_2  == 1}} checked="checked" {{/if}}/>  Yes  &nbsp; 
<input type="radio" name="renovation[dpn_primary_design]" value="0"  {{if $dpn_primary_design_2 == 0}} checked="checked" {{/if}} /> NO <br />
Design Type : <select name="renovation[dpn_design_type]">
<option value="1" {{if $dpn_design_type_2 eq 1}} selected="selected" {{/if}}>Concept Design</option>
<option value="2" {{if $dpn_design_type_2 eq 2}} selected="selected" {{/if}}>Modification Design</option>
<option value="3" {{if $dpn_design_type_2 eq 3}} selected="selected" {{/if}}>Existing Design</option>
<option value="4" {{if $dpn_design_type_2 eq 4}} selected="selected" {{/if}}>External Design </option>
<option value="5" {{if $dpn_design_type_2 eq 5}} selected="selected" {{/if}}>Renovation Design </option>

</select> &nbsp &nbsp; &nbsp;
Customer Designer: <input type="text" name="renovation[dpn_customer_designer]" value="{{$dpn_customer_designer_2}}"}} style="width:200px;"/> &nbsp; 
Arch : <input type="text" name="renovation[dpn_architect]" value="{{$dpn_architect_2}}" style="width:200px;"  />

<br />


Checklist Number : <input type="text" name="renovation[dpn_unique_id]" value="{{$dpn_unique_id_2}}" style="width:200px;" readonly="readonly" /> &nbsp;
<!--Project Type : <select name="renovation[dpn_project_type]">
<option value="1" {{if $dpn_project_type_2 eq 1}} selected="selected" {{/if}}>SR</option>
<option value="2" {{if $dpn_project_type_2 eq 2}} selected="selected" {{/if}}>FPE</option>
<option value="3" {{if $dpn_project_type_2 eq 3}} selected="selected" {{/if}}>Other</option>
</select>-->
&nbsp; &nbsp;
Include in report : <input type="radio" name="renovation[dpn_include_in_report]" value="1"  {{if $dpn_include_in_report_2  == 1}} checked="checked" {{/if}}/>  Yes  &nbsp; 
<input type="radio" name="renovation[dpn_include_in_report]" value="0"  {{if $dpn_include_in_report_2 == 0}} checked="checked" {{/if}} /> NO 
&nbsp; &nbsp; HIA Signed : <input type="radio" name="renovation[dpn_hia_signed]" value="1" {{if $dpn_hia_signed_2 == 1}} checked="checked" {{/if}}> Yes &nbsp;
<input type="radio" name="renovation[dpn_hia_signed]" value="0" {{if $dpn_hia_signed_2 == 0}} checked="checked" {{/if}}> No <br/>
&nbsp;
</div>
<div style="width:25%; float:right;">
Notes: <br />
<textarea rows="3" cols="40" name="renovation[dpn_notes]">{{$dpn_notes_2}}</textarea>
</div>
<br />
File Path - 1  <input type="text" name="renovation[dpn_link1]" value="{{$dpn_link1_2}}"}} style="width:700px;"  /> 
&nbsp; &nbsp;Created By : <input type="text" name="renovation[dpn_created_by]" value="{{$dpn_created_by_2}}" style="width:200px;"  />
<br />

File Path - 2  <input type="text" name="renovation[dpn_link2]" value="{{$dpn_link2_2}}"}} style="width:700px;"  />
&nbsp; &nbsp;Created Date : <input type="text" name="renovation[dpn_created_date]" value="{{$dpn_created_date_2}}" style="width:100px;" readonly="readonly" placeholder="Date will appear after save"/>
<br />

<!--Youtube Winter <input type="text" name="renovation[dpn_you_winter]" value="{{$dpn_you_winter_2}}" style="width:700px;"  /> <br />
Youtube Summer <input type="text" name="renovation[dpn_you_summer]" value="{{$dpn_you_summer_2}}" style="width:700px;"  /> -->

<!--If existing design what the design no <input type="text" name="renovation[dpn_ex_designno]" value="{{$dpn_ex_designno_2}}"}} style="width:40px;"  /> <br />
-->
<div style="width:25%; float:right;">
Budget :<input type="text" name="renovation[dpn_budget]" value="{{$dpn_budget_2}}"}} style="width:180px;"  />
</div>
<input type="submit" name="table_name_renovation" value="Save" />
&nbsp; &nbsp; 

<input type="button" name="addfile" value="Compose Email" onclick="javascript:modelwindow('{{$BASE_URL}}business.proposalchecklistemail/bus_id/{{$bsn_id_renovation}}/dpn_proposal_number/2','90%','90%', 'yes');" id="addfile" class="vsml" />
</form>

</div>
<table cellpadding="0" cellspacing="0" width="100%" id="divtruelog" style="border-collapse:collapse;">
<tr>
<th width="18%">Action</th>
<th width="25%">Document Name</th>
<th width="18%">File Name</th>
<th width="6%">Date Uploaded</th>
<th width="7%">User Name</th>
<th width="10%">Customer WWW</th>
</tr>
<form name="nr" method="post" action="">
{{foreach from=$print_data_renovation2 item=item key=key}}
{{if $item.doc_not_required eq 1}}
  <tr id="gr{{$item.doc_id}}" style="background:#CCC;" >
{{else}}
<tr id="gr{{$item.doc_id}}" >
{{/if}}
<td><a href="javascript:RequestcheckListIframe('checklistrenovation','{{$item.doc_id}}','{{$item.doc_checklist_number}}','');" >
<img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a><br />
 Make Not Required:
 <input type hidden name = "not_required[{{$item.doc_id}}][doc_id]" value = "{{$item.doc_id}}"  />
 <input type="checkbox" name = "not_required[{{$item.doc_id}}][doc_not_required]" id="notreq{{$item.doc_id}}" onclick="process({{$item.doc_bsn_id}},{{$item.doc_id}});" {{if $item.doc_not_required eq 1 }} checked="checked" {{/if}} /> 
 <p id="myElem{{$item.doc_id}}" style="display:none;"></p>


</td>
<td style="padding-left:5px;">{{$item.admin_doc_manual}}{{if $item.doc_file_name !== '' && $item.admin_doc_id == 12}} CONTRACT SIGNED {{else}}{{$item.admin_doc_name}}{{/if}}</td>

{{if !empty($ipad)}} 
<td style="text-align:left;">
<!--    <a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name}}?dummy={{$ran}}" class="action_checklist" title="{{$item.doc_file_name}}" target="_blank">{{$item.doc_file_name|truncate:"40"}}</a>-->

   <a href="/business.download_content?file_name={{$item.doc_file_name}}&module_name=business.home" class="action_checklist" title="{{$item.doc_file_name}}" target="_blank">{{$item.doc_file_name|truncate:"40"}}</a>

</td>

{{else}}
<td style="text-align:left;">
<!--   <a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name}}?dummy={{$ran}}')" class="action_checklist" title="{{$item.doc_file_name}}">{{$item.doc_file_name|truncate:"40"}}</a>-->

 <a href="javascript:parent.modelviewimages('/business.download_content?file_name={{$item.doc_file_name}}&module_name=business.home')" class="action_checklist" title="{{$item.doc_file_name}}">{{$item.doc_file_name|truncate:"40"}}</a> 

</td>
 {{/if}}

<td style="text-align:center;">{{$item.doc_date_uploaded|date_format:"%d/%m/%Y"}}</td>
<td style="text-align:center;">{{$item.user_name}}</td>
<td style="text-align:left;">
<input type="radio" name="not_required[{{$item.doc_id}}][cwww]" value="1"  {{if $item.doc_cust_www  == 1}} checked="checked" {{/if}}/> <span style="padding-top:5px;"> Yes </span> <br />
<input type="radio" name="not_required[{{$item.doc_id}}][cwww]" value="0"  {{if $item.doc_cust_www == 0}} checked="checked" {{/if}} /> NO 
</td>
</tr>
{{/foreach}}


{{if !empty($cus_renovationdata2)}}

{{foreach from=$cus_renovationdata2 item=itemc key=keyc}}
{{if $itemc.cdc_not_required eq 1}}
  <tr id="grc{{$itemc.cdc_id}}" style="background:#CCC;" >
{{else}}
<tr id="grc{{$itemc.cdc_id}}" >
{{/if}}

<td><a href="javascript:RequestcheckListIframe('adddoc_checklistrenovation','{{$itemc.cdc_id}}','2','');" >
<img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a><br />
 Make Not Required:
 <input type hidden name = "not_required_custom[{{$itemc.cdc_id}}][cdc_id]" value = "{{$itemc.cdc_id}}"  />
 <input type="checkbox" name = "not_required_custom[{{$itemc.cdc_id}}][cdc_not_required]" id="notreq2{{$itemc.cdc_id}}" onclick="process2({{$itemc.cdc_bsn_id}},{{$itemc.cdc_id}});" {{if $itemc.cdc_not_required eq 1 }} checked="checked" {{/if}} /> 
 <p id="myElem2{{$itemc.cdc_id}}" style="display:none;"></p>
 </td>
<td> {{$itemc.cdc_doc_name}} </td>
{{if !empty($ipad)}} 
<td style="text-align:left;">
<a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$itemc.cdc_file_name}}?dummy={{$ran}}" class="action_checklist" title="{{$itemc.cdc_file_name}}" target="_blank">{{$itemc.cdc_file_name|truncate:"40"}}</a>

    <a href="/business.download_content?file_name={{$itemc.cdc_file_name}}&module_name=business.home" class="action_checklist" title="{{$itemc.cdc_file_name}}" target="_blank">{{$itemc.cdc_file_name|truncate:"40"}}</a>

</td>

{{else}}
<td style="text-align:left;">
<!--   <a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$itemc.cdc_file_name}}?dummy={{$ran}}')" class="action_checklist" title="{{$item.doc_file_name}}">{{$itemc.cdc_file_name|truncate:"40"}}</a>-->

  <a href="javascript:parent.modelviewimages('/business.download_content?file_name={{$itemc.cdc_file_name}}&module_name=business.home}')" class="action_checklist" title="{{$itemc.cdc_file_name}}">{{$itemc.cdc_file_name|truncate:"40"}}</a>

</td>
 {{/if}}
<td> {{$itemc.cdc_date_uploaded|date_format:"%d/%m/%Y"}}</td>
<td> {{$itemc.cdc_user_name}} </td>
<td> 
<input type="radio" name="not_required_custom[{{$itemc.cdc_id}}][cwww]" value="1"  {{if $itemc.cdc_cust_www  == 1}} checked="checked" {{/if}}/> <span style="padding-top:5px;"> Yes </span> <br />
<input type="radio" name="not_required_custom[{{$itemc.cdc_id}}][cwww]" value="0"  {{if $itemc.cdc_cust_www == 0}} checked="checked" {{/if}} /> NO 

</td>
</tr>
{{/foreach}}
{{/if}}


<tr> <td colspan="6"><input type="submit" name="not_required_save" value="Update Proposal List" />
<a href="javascript:RequestcheckListIframe('adddoc_checklistrenovation','','2','');" class="btn" >
Add New Document</a> &nbsp;
  <strong> <span style="border:1px solid #AAA; padding:4px;"> Task List {{$done2}}/{{$tot2}} </span> </strong> &nbsp; &nbsp;
  <input type="button" value="Add Tasks / Sync Task" onclick="requestAddTaskRenovation(2);" />
  <input type="button" value="Load Renovation Task List" onclick="requestAllTasksRenovation(0,2);" />
  <input type="button" value="Show Hide Renovation Task List" onclick="javascript:parent.toggleDiv('myContent2');" />

</td>

</tr>
</form>
</table>
<table width="100%" >  
<tr> <td>  <div id="taskmsgrenovation" style="color:#FF6600;" align="left"></div> </td> </tr>
<tr> <td> <div id="AllTaskDivProposal2"></div> </td> </tr>
<tr> <td> <div id="editTaskDivProposal" align="left"></div> </td> </tr>
</table>
{{/if}}


{{if !empty($print_data_renovation3)}}
<br />
<div style="font-style:bold; text-align:left; padding:5px;">
<form name="tablename" method="post" action="" >
<input type="hidden" name="renovation[dpn_bsn_id]" value="{{$bsn_id_renovation}}" />
<input type="hidden" name="renovation[dpn_proposal_number]" value="3" />
<div style="width:75%; float:left;">
Document Proposal : <input type="text" name="renovation[dpn_name]" value="{{$dpn_name_3}}"}} style="width:400px;"  />
Primary Design : <input type="radio" name="renovation[dpn_primary_design]" value="1"  {{if $dpn_primary_design_3  == 1}} checked="checked" {{/if}}/>  Yes  &nbsp; 
<input type="radio" name="renovation[dpn_primary_design]" value="0"  {{if $dpn_primary_design_3 == 0}} checked="checked" {{/if}} /> NO <br />
Design Type : <select name="renovation[dpn_design_type]">
<option value="1" {{if $dpn_design_type_3 eq 1}} selected="selected" {{/if}}>Concept Design</option>
<option value="2" {{if $dpn_design_type_3 eq 2}} selected="selected" {{/if}}>Modification Design</option>
<option value="3" {{if $dpn_design_type_3 eq 3}} selected="selected" {{/if}}>Existing Design</option>
<option value="4" {{if $dpn_design_type_3 eq 4}} selected="selected" {{/if}}>External Design </option>
<option value="5" {{if $dpn_design_type_3 eq 5}} selected="selected" {{/if}}>Renovation Design </option>


</select> &nbsp &nbsp; &nbsp;
Customer Designer: <input type="text" name="renovation[dpn_customer_designer]" value="{{$dpn_customer_designer_3}}"}} style="width:200px;"/> &nbsp; 
Arch : <input type="text" name="renovation[dpn_architect]" value="{{$dpn_architect_3}}" style="width:200px;"  />
<br />

Checklist Number : <input type="text" name="renovation[dpn_unique_id]" value="{{$dpn_unique_id_3}}" style="width:200px;"  /> &nbsp;
<!--Project Type : <select name="renovation[dpn_project_type]">
<option value="1" {{if $dpn_project_type_3 eq 1}} selected="selected" {{/if}}>SR</option>
<option value="2" {{if $dpn_project_type_3 eq 2}} selected="selected" {{/if}}>FPE</option>
<option value="3" {{if $dpn_project_type_3 eq 3}} selected="selected" {{/if}}>Other</option>
</select>-->&nbsp; &nbsp;
Include in report : <input type="radio" name="renovation[dpn_include_in_report]" value="1"  {{if $dpn_include_in_report_3  == 1}} checked="checked" {{/if}}/>  Yes  &nbsp; 
<input type="radio" name="renovation[dpn_include_in_report]" value="0"  {{if $dpn_include_in_report_3 == 0}} checked="checked" {{/if}} /> NO 
&nbsp; &nbsp; HIA Signed : <input type="radio" name="renovation[dpn_hia_signed]" value="1" {{if $dpn_hia_signed_3 == 1}} checked="checked" {{/if}}> Yes &nbsp;
<input type="radio" name="renovation[dpn_hia_signed]" value="0" {{if $dpn_hia_signed_3 == 0}} checked="checked" {{/if}}> No <br/>
&nbsp;
</div>
<div style="width:25%; float:right;">
Notes: <br />
<textarea rows="3" cols="40" name="renovation[dpn_notes]">{{$dpn_notes_3}}</textarea>
</div>
<br />
File Path - 1  <input type="text" name="renovation[dpn_link1]" value="{{$dpn_link1_3}}"}} style="width:700px;"  /> 
&nbsp; &nbsp;Created By : <input type="text" name="renovation[dpn_created_by]" value="{{$dpn_created_by_3}}" style="width:200px;"  />
<br />
File Path - 2  <input type="text" name="renovation[dpn_link2]" value="{{$dpn_link2_3}}"}} style="width:700px;"  /> 
&nbsp; &nbsp;Created Date : <input type="text" name="renovation[dpn_created_date]" value="{{$dpn_created_date_3}}" style="width:100px;" readonly="readonly" placeholder="Date will appear after save"/>
<br />


<!--Youtube Winter <input type="text" name="renovation[dpn_you_winter]" value="{{$dpn_you_winter_3}}" style="width:700px;"  /> <br />
Youtube Summer <input type="text" name="renovation[dpn_you_summer]" value="{{$dpn_you_summer_3}}" style="width:700px;"  /> -->

<!--If existing design what the design no <input type="text" name="renovation[dpn_ex_designno]" value="{{$dpn_ex_designno_3}}"}} style="width:40px;"  /> <br />
-->

<div style="width:25%; float:right;">
Budget :<input type="text" name="renovation[dpn_budget]" value="{{$dpn_budget_3}}"}} style="width:180px;"  />
</div>
<input type="submit" name="table_name_renovation" value="Save" />

&nbsp; &nbsp;

<input type="button" name="addfile" value="Compose Email" onclick="javascript:modelwindow('{{$BASE_URL}}business.proposalchecklistemail/bus_id/{{$bsn_id_renovation}}/dpn_proposal_number/3','90%','90%', 'yes');" id="addfile" class="vsml" /> 
<!--<input type="button" name="CreateDocumentCheckList" value="Create New" onclick="javascript:if(!confirm('Are you sure you want to create new Document Proposal?')) return false;requestDocumentCheckListrenovation('add_new');" />
--></form>

</div>
<table cellpadding="0" cellspacing="0" width="100%" id="divtruelog" style="border-collapse:collapse;">
<tr>
<th width="18%">Action</th>
<th width="25%">Document Name</th>
<th width="18%">File Name</th>
<th width="6%">Date Uploaded</th>
<th width="7%">User Name</th>
<th width="10%">Customer WWW</th>
</tr>
<form name="nr" method="post" action="">
{{foreach from=$print_data_renovation3 item=item key=key}}
{{if $item.doc_not_required eq 1}}
  <tr id="gr{{$item.doc_id}}" style="background:#CCC;" >
{{else}}
<tr id="gr{{$item.doc_id}}" >
{{/if}}
<td><a href="javascript:RequestcheckListIframe('checklistrenovation','{{$item.doc_id}}','{{$item.doc_checklist_number}}','');" >
<img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a><br />
 Make Not Required:
 <input type hidden name = "not_required[{{$item.doc_id}}][doc_id]" value = "{{$item.doc_id}}"  />
 <input type="checkbox" name = "not_required[{{$item.doc_id}}][doc_not_required]" id="notreq{{$item.doc_id}}" onclick="process({{$item.doc_bsn_id}},{{$item.doc_id}});" {{if $item.doc_not_required eq 1 }} checked="checked" {{/if}} /> 
 <p id="myElem{{$item.doc_id}}" style="display:none;"></p>


</td>
<td style="padding-left:5px;">{{$item.admin_doc_manual}}{{if $item.doc_file_name !== '' && $item.admin_doc_id == 12}} CONTRACT SIGNED {{else}}{{$item.admin_doc_name}}{{/if}}</td>

{{if !empty($ipad)}} 
<td style="text-align:left;">
<!--    <a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name}}?dummy={{$ran}}" class="action_checklist" title="{{$item.doc_file_name}}" target="_blank">{{$item.doc_file_name|truncate:"40"}}</a>-->

  <a href="/business.download_content?file_name={{$item.doc_file_name}}&module_name=business.home" class="action_checklist" title="{{$item.doc_file_name}}" target="_blank">{{$item.doc_file_name|truncate:"40"}}</a>  

</td>

{{else}}
<td style="text-align:left;">
<!--   <a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name}}?dummy={{$ran}}')" class="action_checklist" title="{{$item.doc_file_name}}">{{$item.doc_file_name|truncate:"40"}}</a>-->

  <a href="javascript:parent.modelviewimages('/business.download_content?file_name={{$item.doc_file_name}}&module_name=business.home')" class="action_checklist" title="{{$item.doc_file_name}}">{{$item.doc_file_name|truncate:"40"}}</a>

</td>
 {{/if}}

<td style="text-align:center;">{{$item.doc_date_uploaded|date_format:"%d/%m/%Y"}}</td>
<td style="text-align:center;">{{$item.user_name}}</td>
<td style="text-align:left;">
<input type="radio" name="not_required[{{$item.doc_id}}][cwww]" value="1"  {{if $item.doc_cust_www == 1}} checked="checked" {{/if}}/> <span style="padding-top:5px;"> Yes </span> <br />
<input type="radio" name="not_required[{{$item.doc_id}}][cwww]" value="0"  {{if $item.doc_cust_www == 0}} checked="checked" {{/if}} /> NO 
</td>
</tr>
{{/foreach}}


{{if !empty($cus_renovationdata3)}}

{{foreach from=$cus_renovationdata3 item=itemc key=keyc}}
{{if $itemc.cdc_not_required eq 1}}
  <tr id="grc{{$itemc.cdc_id}}" style="background:#CCC;" >
{{else}}
<tr id="grc{{$itemc.cdc_id}}" >
{{/if}}

<td><a href="javascript:RequestcheckListIframe('adddoc_checklistrenovation','{{$itemc.cdc_id}}','3','');" >
<img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a><br />
 Make Not Required:
 <input type hidden name = "not_required_custom[{{$itemc.cdc_id}}][cdc_id]" value = "{{$itemc.cdc_id}}"  />
 <input type="checkbox" name = "not_required_custom[{{$itemc.cdc_id}}][cdc_not_required]" id="notreq2{{$itemc.cdc_id}}" onclick="process2({{$itemc.cdc_bsn_id}},{{$itemc.cdc_id}});" {{if $itemc.cdc_not_required eq 1 }} checked="checked" {{/if}} /> 
 <p id="myElem2{{$itemc.cdc_id}}" style="display:none;"></p>
 </td>
<td> {{$itemc.cdc_doc_name}} </td>
{{if !empty($ipad)}} 
<td style="text-align:left;">

<!--    <a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$itemc.cdc_file_name}}?dummy={{$ran}}" class="action_checklist" title="{{$itemc.cdc_file_name}}" target="_blank">{{$itemc.cdc_file_name|truncate:"40"}}</a>-->

   <a href="/business.download_content?file_name={{$itemc.cdc_file_name}}&module_name=business.home" class="action_checklist" title="{{$itemc.cdc_file_name}}" target="_blank">{{$itemc.cdc_file_name|truncate:"40"}}</a> 

</td>

{{else}}
<td style="text-align:left;">
<!--   <a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$itemc.cdc_file_name}}?dummy={{$ran}}')" class="action_checklist" title="{{$item.doc_file_name}}">{{$itemc.cdc_file_name|truncate:"40"}}</a>-->

  <a href="javascript:parent.modelviewimages('/business.download_content?file_name={{$itemc.cdc_file_name}}&module_name=business.home')" class="action_checklist" title="{{$item.doc_file_name}}">{{$itemc.cdc_file_name|truncate:"40"}}</a>

</td>
 {{/if}}
<td> {{$itemc.cdc_date_uploaded|date_format:"%d/%m/%Y"}} </td>
<td> {{$itemc.cdc_user_name}} </td>
<td> 
<input type="radio" name="not_required_custom[{{$itemc.doc_id}}][cwww]" value="1"  {{if $itemc.cdc_cust_www == 1}} checked="checked" {{/if}}/> <span style="padding-top:5px;"> Yes </span> <br />
<input type="radio" name="not_required_custom[{{$itemc.doc_id}}][cwww]" value="0"  {{if $itemc.cdc_cust_www == 0}} checked="checked" {{/if}} /> NO 

</td>
</tr>
{{/foreach}}
{{/if}}

<tr> <td colspan="6"><input type="submit" name="not_required_save" value="Update Proposal List" />
<a href="javascript:RequestcheckListIframe('adddoc_checklistrenovation','','3','');" class="btn" >
Add New Document</a> &nbsp;
  <strong> <span style="border:1px solid #AAA; padding:4px;"> Task List {{$done3}}/{{$tot3}} </span> </strong> &nbsp; &nbsp;
  <input type="button" value="Add Tasks / Sync Task" onclick="requestAddTaskRenovation(3);" />
  <input type="button" value="Load Renovation Task List" onclick="requestAllTasksRenovation(0,3);" />
  <input type="button" value="Show Hide Renovation Task List" onclick="javascript:parent.toggleDiv('myContent3');" />
</td>

</tr>
</form>
</table>
<table width="100%" >  
<tr> <td>  <div id="taskmsgrenovation" style="color:#FF6600;" align="left"></div> </td> </tr>
<tr> <td> <div id="AllTaskDivProposal3"></div> </td> </tr>
<tr> <td> <div id="editTaskDivProposal" align="left"></div> </td> </tr>
</table>

{{/if}}

{{if !empty($print_data_renovation4)}}
<br />
<div style="font-style:bold; text-align:left; padding:5px;">
<form name="tablename" method="post" action="" >
<input type="hidden" name="renovation[dpn_bsn_id]" value="{{$bsn_id_renovation}}" />
<input type="hidden" name="renovation[dpn_proposal_number]" value="4" />
<div style="width:75%; float:left;">
Document Proposal : <input type="text" name="renovation[dpn_name]" value="{{$dpn_name_4}}"}} style="width:400px;"  />
Primary Design : <input type="radio" name="renovation[dpn_primary_design]" value="1"  {{if $dpn_primary_design_4  == 1}} checked="checked" {{/if}}/>  Yes  &nbsp; 
<input type="radio" name="renovation[dpn_primary_design]" value="0"  {{if $dpn_primary_design_4 == 0}} checked="checked" {{/if}} /> NO <br />
Design Type : <select name="renovation[dpn_design_type]">
<option value="1" {{if $dpn_design_type_4 eq 1}} selected="selected" {{/if}}>Concept Design</option>
<option value="2" {{if $dpn_design_type_4 eq 2}} selected="selected" {{/if}}>Modification Design</option>
<option value="3" {{if $dpn_design_type_4 eq 3}} selected="selected" {{/if}}>Existing Design</option>
<option value="4" {{if $dpn_design_type_4 eq 4}} selected="selected" {{/if}}>External Design </option>
<option value="5" {{if $dpn_design_type_4 eq 5}} selected="selected" {{/if}}>Renovation Design </option>
</select> &nbsp &nbsp; &nbsp;
Customer Designer: <input type="text" name="renovation[dpn_customer_designer]" value="{{$dpn_customer_designer_4}}"}} style="width:200px;"/> &nbsp; 
Arch : <input type="text" name="renovation[dpn_architect]" value="{{$dpn_architect_4}}" style="width:200px;"  />
<br />

Checklist Number : <input type="text" name="renovation[dpn_unique_id]" value="{{$dpn_unique_id_4}}" style="width:200px;"  /> &nbsp;
<!--Project Type : <select name="renovation[dpn_project_type]">
<option value="1" {{if $dpn_project_type_4 eq 1}} selected="selected" {{/if}}>SR</option>
<option value="2" {{if $dpn_project_type_4 eq 2}} selected="selected" {{/if}}>FPE</option>
<option value="3" {{if $dpn_project_type_4 eq 3}} selected="selected" {{/if}}>Other</option>
</select>-->&nbsp; &nbsp;
Include in report : <input type="radio" name="renovation[dpn_include_in_report]" value="1"  {{if $dpn_include_in_report_4  == 1}} checked="checked" {{/if}}/>  Yes  &nbsp; 
<input type="radio" name="renovation[dpn_include_in_report]" value="0"  {{if $dpn_include_in_report_4 == 0}} checked="checked" {{/if}} /> NO 
&nbsp; &nbsp; HIA Signed : <input type="radio" name="renovation[dpn_hia_signed]" value="1" {{if $dpn_hia_signed_4 == 1}} checked="checked" {{/if}}> Yes &nbsp;
<input type="radio" name="renovation[dpn_hia_signed]" value="0" {{if $dpn_hia_signed_4 == 0}} checked="checked" {{/if}}> No <br/>
&nbsp;
</div>
<div style="width:25%; float:right;">
Notes: <br>
<textarea rows="3" cols="40" name="renovation[dpn_notes]">{{$dpn_notes_4}}</textarea>
</div>
<br />
File Path - 1  <input type="text" name="renovation[dpn_link1]" value="{{$dpn_link1_4}}"}} style="width:700px;"  /> 
&nbsp; &nbsp;Created By : <input type="text" name="renovation[dpn_created_by]" value="{{$dpn_created_by_4}}" style="width:200px;"  />
<br />
File Path - 2  <input type="text" name="renovation[dpn_link2]" value="{{$dpn_link2_4}}"}} style="width:700px;"  />
&nbsp; &nbsp;Created Date : <input type="text" name="renovation[dpn_created_date]" value="{{$dpn_created_date_4}}" style="width:100px;" readonly="readonly" placeholder="Date will appear after save"/>
<br />


<!--Youtube Winter <input type="text" name="renovation[dpn_you_winter]" value="{{$dpn_you_winter_4}}" style="width:700px;"  /> <br />
Youtube Summer <input type="text" name="renovation[dpn_you_summer]" value="{{$dpn_you_summer_4}}" style="width:700px;"  /> -->

<!--If existing design what the design no <input type="text" name="renovation[dpn_ex_designno]" value="{{$dpn_ex_designno_4}}"}} style="width:40px;"  /> <br />
-->

<div style="width:25%; float:right;">
Budget :<input type="text" name="renovation[dpn_budget]" value="{{$dpn_budget_4}}"}} style="width:180px;"  />
</div>
<input type="submit" name="table_name_renovation" value="Save" />

&nbsp; &nbsp; 

<input type="button" name="addfile" value="Compose Email" onclick="javascript:modelwindow('{{$BASE_URL}}business.proposalchecklistemail/bus_id/{{$bsn_id_renovation}}/dpn_proposal_number/4','90%','90%', 'yes');" id="addfile" class="vsml" />

</form>
</div>

<table cellpadding="0" cellspacing="0" width="100%" id="divtruelog" style="border-collapse:collapse;">
<tr>
<th width="18%">Action</th>
<th width="25%">Document Name</th>
<th width="18%">File Name</th>
<th width="6%">Date Uploaded</th>
<th width="7%">User Name</th>
<th width="10%">Customer WWW</th>
</tr>
<form name="nr" method="post" action="">
{{foreach from=$print_data_renovation4 item=item key=key}}
{{if $item.doc_not_required eq 1}}
  <tr id="gr{{$item.doc_id}}" style="background:#CCC;" >
{{else}}
<tr id="gr{{$item.doc_id}}" >
{{/if}}
<td><a href="javascript:RequestcheckListIframe('checklistrenovation','{{$item.doc_id}}','{{$item.doc_checklist_number}}','');" >
<img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a><br />
 Make Not Required:
 <input type hidden name = "not_required[{{$item.doc_id}}][doc_id]" value = "{{$item.doc_id}}"  />
 <input type="checkbox" name = "not_required[{{$item.doc_id}}][doc_not_required]" id="notreq{{$item.doc_id}}" onclick="process({{$item.doc_bsn_id}},{{$item.doc_id}});" {{if $item.doc_not_required eq 1 }} checked="checked" {{/if}} /> 
 <p id="myElem{{$item.doc_id}}" style="display:none;"></p>


</td>
<td style="padding-left:5px;">{{$item.admin_doc_manual}}{{if $item.doc_file_name !== '' && $item.admin_doc_id == 12}} CONTRACT SIGNED {{else}}{{$item.admin_doc_name}}{{/if}}</td>

{{if !empty($ipad)}} 
<td style="text-align:left;">

<!--    <a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name}}?dummy={{$ran}}" class="action_checklist" title="{{$item.doc_file_name}}" target="_blank">{{$item.doc_file_name|truncate:"40"}}</a>-->


 <a href="/business.download_content?file_name={{$item.doc_file_name}}&module_name=business.home" class="action_checklist" title="{{$item.doc_file_name}}" target="_blank">{{$item.doc_file_name|truncate:"40"}}</a>
 
 </td>  
 
{{else}}
<td style="text-align:left;">

<!--   <a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name}}?dummy={{$ran}}')" class="action_checklist" title="{{$item.doc_file_name}}">{{$item.doc_file_name|truncate:"40"}}</a>-->

<a href="javascript:parent.modelviewimages('/business.download_content?file_name={{$item.doc_file_name}}&module_name=business.home')" class="action_checklist" title="{{$item.doc_file_name}}">{{$item.doc_file_name|truncate:"40"}}</a>  

</td>
 
 
 {{/if}}

<td style="text-align:center;">{{$item.doc_date_uploaded|date_format:"%d/%m/%Y"}}</td>
<td style="text-align:center;">{{$item.user_name}}</td>
<td style="text-align:left;">
<input type="radio" name="not_required[{{$item.doc_id}}][cwww]" value="1"  {{if $item.doc_cust_www == 1}} checked="checked" {{/if}}/> <span style="padding-top:5px;"> Yes </span> <br />
<input type="radio" name="not_required[{{$item.doc_id}}][cwww]" value="0"  {{if $item.doc_cust_www == 0}} checked="checked" {{/if}} /> NO 
</td>
</tr>
{{/foreach}}


{{if !empty($cus_renovationdata4)}}

{{foreach from=$cus_renovationdata4 item=itemc key=keyc}}
{{if $itemc.cdc_not_required eq 1}}
  <tr id="grc{{$itemc.cdc_id}}" style="background:#CCC;" >
{{else}}
<tr id="grc{{$itemc.cdc_id}}" >
{{/if}}

<td><a href="javascript:RequestcheckListIframe('adddoc_checklistrenovation','{{$itemc.cdc_id}}','4','');" >
<img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a><br />
 Make Not Required:
 <input type hidden name = "not_required_custom[{{$itemc.cdc_id}}][cdc_id]" value = "{{$itemc.cdc_id}}"  />
 <input type="checkbox" name = "not_required_custom[{{$itemc.cdc_id}}][cdc_not_required]" id="notreq2{{$itemc.cdc_id}}" onclick="process2({{$itemc.cdc_bsn_id}},{{$itemc.cdc_id}});" {{if $itemc.cdc_not_required eq 1 }} checked="checked" {{/if}} /> 
 <p id="myElem2{{$itemc.cdc_id}}" style="display:none;"></p>
 </td>
<td> {{$itemc.cdc_doc_name}} </td>
{{if !empty($ipad)}} 
<td style="text-align:left;">

<!--    <a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$itemc.cdc_file_name}}?dummy={{$ran}}" class="action_checklist" title="{{$itemc.cdc_file_name}}" target="_blank">{{$itemc.cdc_file_name|truncate:"40"}}</a>-->

   <a href="/business.download_content?file_name={{$itemc.cdc_file_name}}&module_name=business.home}" class="action_checklist" title="{{$itemc.cdc_file_name}}" target="_blank">{{$itemc.cdc_file_name|truncate:"40"}}</a> 

</td>

{{else}}
<td style="text-align:left;">
<!--   <a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$itemc.cdc_file_name}}?dummy={{$ran}}')" class="action_checklist" title="{{$item.doc_file_name}}">{{$itemc.cdc_file_name|truncate:"40"}}</a>-->

<a href="javascript:parent.modelviewimages('/business.download_content?file_name={{$itemc.cdc_file_name}}&module_name=business.home')" class="action_checklist" title="{{$item.doc_file_name}}">{{$itemc.cdc_file_name|truncate:"40"}}</a>

</td>
 {{/if}}
<td> {{$itemc.cdc_date_uploaded|date_format:"%d/%m/%Y"}} </td>
<td> {{$itemc.cdc_user_name}} </td>
<td> 
<input type="radio" name="not_required_custom[{{$itemc.cdc_id}}][cwww]" value="1" {{if $itemc.cdc_cust_www == 1}} checked="checked" {{/if}}/> <span style="padding-top:5px;"> Yes </span> <br />
<input type="radio" name="not_required_custom[{{$itemc.cdc_id}}][cwww]" value="0" {{if $itemc.cdc_cust_www == 0}} checked="checked" {{/if}} /> NO 

</td>
</tr>
{{/foreach}}
{{/if}}

<tr> <td colspan="6"><input type="submit" name="not_required_save" value="Update Proposal List" />
<a href="javascript:RequestcheckListIframe('adddoc_checklistrenovation','','4','');" class="btn" >
Add New Document</a>&nbsp;
  <strong> <span style="border:1px solid #AAA; padding:4px;"> Task List {{$done4}}/{{$tot4}} </span> </strong> &nbsp; &nbsp;
  <input type="button" value="Add Tasks / Sync Task" onclick="requestAddTaskRenovation(4);" />
  <input type="button" value="Load Renovation Task List" onclick="requestAllTasksRenovation(0,4);" />
  <input type="button" value="Show Hide Renovation Task List" onclick="javascript:parent.toggleDiv('myContent4');" />
</td>

</tr>
</form>
</table>
<table width="100%" >  
<tr> <td>  <div id="taskmsgrenovation" style="color:#FF6600;" align="left"></div> </td> </tr>
<tr> <td> <div id="AllTaskDivProposal4"></div> </td> </tr>
<tr> <td> <div id="editTaskDivProposal" align="left"></div> </td> </tr>
</table>
{{/if}}

{{if !empty($print_data_renovation5)}}
<br />
<div style="font-style:bold; text-align:left; padding:5px;"> 
<form name="tablename" method="post" action="" >
<input type="hidden" name="renovation[dpn_bsn_id]" value="{{$bsn_id_renovation}}" />
<input type="hidden" name="renovation[dpn_proposal_number]" value="5" />
<div style="width:75%; float:left;">
Document Proposal : <input type="text" name="renovation[dpn_name]" value="{{$dpn_name_5}}"}} style="width:400px;"  />
Primary Design : <input type="radio" name="renovation[dpn_primary_design]" value="1"  {{if $dpn_primary_design_5  == 1}} checked="checked" {{/if}}/>  Yes  &nbsp; 
<input type="radio" name="renovation[dpn_primary_design]" value="0"  {{if $dpn_primary_design_5 == 0}} checked="checked" {{/if}} /> NO <br />
Design Type : <select name="renovation[dpn_design_type]">
<option value="1" {{if $dpn_design_type_5 eq 1}} selected="selected" {{/if}}>Concept Design</option>
<option value="2" {{if $dpn_design_type_5 eq 2}} selected="selected" {{/if}}>Modification Design</option>
<option value="3" {{if $dpn_design_type_5 eq 3}} selected="selected" {{/if}}>Existing Design</option>
<option value="4" {{if $dpn_design_type_5 eq 4}} selected="selected" {{/if}}>External Design </option>
<option value="5" {{if $dpn_design_type_5 eq 5}} selected="selected" {{/if}}>Renovation Design </option>
</select> &nbsp &nbsp; &nbsp;
Customer Designer: <input type="text" name="renovation[dpn_customer_designer]" value="{{$dpn_customer_designer_5}}"}} style="width:200px;"/> &nbsp; 
Arch : <input type="text" name="renovation[dpn_architect]" value="{{$dpn_architect_5}}" style="width:200px;"  />
<br />

Checklist Number : <input type="text" name="renovation[dpn_unique_id]" value="{{$dpn_unique_id_5}}" style="width:200px;"  /> &nbsp;
<!--Project Type : <select name="renovation[dpn_project_type]">
<option value="1" {{if $dpn_project_type_5 eq 1}} selected="selected" {{/if}}>SR</option>
<option value="2" {{if $dpn_project_type_5 eq 2}} selected="selected" {{/if}}>FPE</option>
<option value="3" {{if $dpn_project_type_5 eq 3}} selected="selected" {{/if}}>Other</option>
</select>-->&nbsp; &nbsp;
Include in report : <input type="radio" name="renovation[dpn_include_in_report]" value="1"  {{if $dpn_include_in_report_5  == 1}} checked="checked" {{/if}}/>  Yes  &nbsp; 
<input type="radio" name="renovation[dpn_include_in_report]" value="0"  {{if $dpn_include_in_report_5 == 0}} checked="checked" {{/if}} /> NO 
&nbsp; &nbsp; HIA Signed : <input type="radio" name="renovation[dpn_hia_signed]" value="1" {{if $dpn_hia_signed_5 == 1}} checked="checked" {{/if}}> Yes &nbsp;
<input type="radio" name="renovation[dpn_hia_signed]" value="0" {{if $dpn_hia_signed_5 == 0}} checked="checked" {{/if}}> No <br/>
&nbsp;
</div>
<div style="width:25%; float:right;">
Notes: <br>
<textarea rows="3" cols="40" name="renovation[dpn_notes]">{{$dpn_notes_5}}</textarea>
</div>
<br />
File Path - 1  <input type="text" name="renovation[dpn_link1]" value="{{$dpn_link1_5}}"}} style="width:700px;"  /> 
&nbsp; &nbsp;Created By : <input type="text" name="renovation[dpn_created_by]" value="{{$dpn_created_by_5}}" style="width:200px;"  />
<br />
File Path - 2  <input type="text" name="renovation[dpn_link2]" value="{{$dpn_link2_5}}"}} style="width:700px;"  /> 

&nbsp; &nbsp;Created Date : <input type="text" name="renovation[dpn_created_date]" value="{{$dpn_created_date_5}}" style="width:100px;" readonly="readonly" placeholder="Date will appear after save"/>
<br />

<!--Youtube Winter <input type="text" name="renovation[dpn_you_winter]" value="{{$dpn_you_winter_5}}" style="width:700px;"  /> <br />
Youtube Summer <input type="text" name="renovation[dpn_you_summer]" value="{{$dpn_you_summer_5}}" style="width:700px;"  /> -->

<!--If existing design what the design no <input type="text" name="renovation[dpn_ex_designno]" value="{{$dpn_ex_designno_5}}"}} style="width:40px;"  /> <br />
-->
<div style="width:25%; float:right;">
Budget :<input type="text" name="renovation[dpn_budget]" value="{{$dpn_budget_5}}"}} style="width:180px;"  />
</div>
<input type="submit" name="table_name_renovation" value="Save" />

&nbsp; &nbsp; 

<input type="button" name="addfile" value="Compose Email" onclick="javascript:modelwindow('{{$BASE_URL}}business.proposalchecklistemail/bus_id/{{$bsn_id_renovation}}/dpn_proposal_number/5','90%','90%', 'yes');" id="addfile" class="vsml" />
</form>

</div>

<table cellpadding="0" cellspacing="0" width="100%" id="divtruelog" style="border-collapse:collapse;">
<tr>
<th width="18%">Action</th>
<th width="25%">Document Name</th>
<th width="18%">File Name</th>
<th width="6%">Date Uploaded</th>
<th width="7%">User Name</th>
<th width="10%">Customer WWW</th>
</tr>
<form name="nr" method="post" action="">
{{foreach from=$print_data_renovation5 item=item key=key}}
{{if $item.doc_not_required eq 1}}
  <tr id="gr{{$item.doc_id}}" style="background:#CCC;" >
{{else}}
<tr id="gr{{$item.doc_id}}" >
{{/if}}
<td><a href="javascript:RequestcheckListIframe('checklistrenovation','{{$item.doc_id}}','{{$item.doc_checklist_number}}','');" >
<img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a><br />
 Make Not Required:
 <input type hidden name = "not_required[{{$item.doc_id}}][doc_id]" value = "{{$item.doc_id}}"  />
 <input type="checkbox" name = "not_required[{{$item.doc_id}}][doc_not_required]" id="notreq{{$item.doc_id}}" onclick="process({{$item.doc_bsn_id}},{{$item.doc_id}});" {{if $item.doc_not_required eq 1 }} checked="checked" {{/if}} /> 
 <p id="myElem{{$item.doc_id}}" style="display:none;"></p>


</td>
<td style="padding-left:5px;">{{$item.admin_doc_manual}}{{if $item.doc_file_name !== '' && $item.admin_doc_id == 12}} CONTRACT SIGNED {{else}}{{$item.admin_doc_name}}{{/if}}</td>

{{if !empty($ipad)}} 
<td style="text-align:left;">
<!--    <a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name}}?dummy={{$ran}}" class="action_checklist" title="{{$item.doc_file_name}}" target="_blank">{{$item.doc_file_name|truncate:"40"}}</a>-->

    <a href="/business.download_content?file_name={{$item.doc_file_name}}&module_name=business.home" title="{{$item.doc_file_name}}" target="_blank">{{$item.doc_file_name|truncate:"40"}}</a>

</td>

{{else}}
<td style="text-align:left;">
<!--   <a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name}}?dummy={{$ran}}')" class="action_checklist" title="{{$item.doc_file_name}}">{{$item.doc_file_name|truncate:"40"}}</a>-->

<a href="javascript:parent.modelviewimages('/business.download_content?file_name={{$item.doc_file_name}}&module_name=business.home')" class="action_checklist" title="{{$item.doc_file_name}}">{{$item.doc_file_name|truncate:"40"}}</a>

</td>
 {{/if}}

<td style="text-align:center;">{{$item.doc_date_uploaded|date_format:"%d/%m/%Y"}}</td>
<td style="text-align:center;">{{$item.user_name}}</td>
<td style="text-align:left;">
<input type="radio" name="not_required[{{$item.doc_id}}][cwww]" value="1" {{if $item.doc_cust_www  == 1}} checked="checked" {{/if}}/> <span style="padding-top:5px;"> Yes </span> <br />
<input type="radio" name="not_required[{{$item.doc_id}}][cwww]" value="0" {{if $item.doc_cust_www == 0}} checked="checked" {{/if}} /> NO 
</td>
</tr>
{{/foreach}}


{{if !empty($cus_renovationdata5)}}

{{foreach from=$cus_renovationdata5 item=itemc key=keyc}}
{{if $itemc.cdc_not_required eq 1}}
  <tr id="grc{{$itemc.cdc_id}}" style="background:#CCC;" >
{{else}}
<tr id="grc{{$itemc.cdc_id}}" >
{{/if}}

<td><a href="javascript:RequestcheckListIframe('adddoc_checklistrenovation','{{$itemc.cdc_id}}','5','');" >
<img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a><br />
 Make Not Required:
 <input type hidden name = "not_required_custom[{{$itemc.cdc_id}}][cdc_id]" value = "{{$itemc.cdc_id}}"  />
 <input type="checkbox" name = "not_required_custom[{{$itemc.cdc_id}}][cdc_not_required]" id="notreq2{{$itemc.cdc_id}}" onclick="process2({{$itemc.cdc_bsn_id}},{{$itemc.cdc_id}});" {{if $itemc.cdc_not_required eq 1 }} checked="checked" {{/if}} /> 
 <p id="myElem2{{$itemc.cdc_id}}" style="display:none;"></p>
 </td>
<td> {{$itemc.cdc_doc_name}} </td>
{{if !empty($ipad)}} 
<td style="text-align:left;">

<!--    <a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$itemc.cdc_file_name}}?dummy={{$ran}}" class="action_checklist" title="{{$itemc.cdc_file_name}}" target="_blank">{{$itemc.cdc_file_name|truncate:"40"}}</a>-->

   <a href="/business.download_content?file_name={{$itemc.cdc_file_name}}&module_name=business.home" class="action_checklist" title="{{$itemc.cdc_file_name}}" target="_blank">{{$itemc.cdc_file_name|truncate:"40"}}</a> 

</td>

{{else}}
<td style="text-align:left;">
<!--   <a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$itemc.cdc_file_name}}?dummy={{$ran}}')" class="action_checklist" title="{{$item.doc_file_name}}">{{$itemc.cdc_file_name|truncate:"40"}}</a>-->

  <a href="javascript:parent.modelviewimages('/business.download_content?file_name={{$itemc.cdc_file_name}}&module_name=business.home')" class="action_checklist" title="{{$item.doc_file_name}}">{{$itemc.cdc_file_name|truncate:"40"}}</a>

</td>
 {{/if}}
<td> {{$itemc.cdc_date_uploaded|date_format:"%d/%m/%Y"}} </td>
<td> {{$itemc.cdc_user_name}} </td>
<td> 
<input type="radio" name="not_required_custom[{{$itemc.cdc_id}}][cwww]" value="1" {{if $itemc.cdc_cust_www == 1}} checked="checked" {{/if}}/> <span style="padding-top:5px;"> Yes </span> <br />
<input type="radio" name="not_required_custom[{{$itemc.cdc_id}}][cwww]" value="0" {{if $itemc.cdc_cust_www == 0}} checked="checked" {{/if}} /> NO 

</td>
</tr>
{{/foreach}}
{{/if}}

<tr> <td colspan="6"><input type="submit" name="not_required_save" value="Update Proposal List" />
<a href="javascript:RequestcheckListIframe('adddoc_checklistrenovation','','5','');" class="btn" >
Add New Document</a>&nbsp;
  <strong> <span style="border:1px solid #AAA; padding:4px;"> Task List {{$done5}}/{{$tot5}} </span> </strong> &nbsp; &nbsp;
  <input type="button" value="Add Tasks / Sync Task" onclick="requestAddTaskRenovation(5);" />
  <input type="button" value="Load Renovation Task List" onclick="requestAllTasksRenovation(0,5);" />
  <input type="button" value="Show Hide Renovation Task List" onclick="javascript:parent.toggleDiv('myContent5');" />
</td>

</tr>
</form>
</table>
<table width="100%" >  
<tr> <td>  <div id="taskmsgrenovation" style="color:#FF6600;" align="left"></div> </td> </tr>
<tr> <td> <div id="AllTaskDivProposal5"></div> </td> </tr>
<tr> <td> <div id="editTaskDivProposal" align="left"></div> </td> </tr>
</table>
{{/if}}



{{if !empty($iframe_data) AND $iframe_data==1}}
<!--------------- Begin iframe_data ------->
<link rel="stylesheet" href="{{$BASE_URL}}css/default/cis-styles.css" />
<div style="border:1px #CCCCCC solid; padding:5px;" id="checkListIframe"  >
<script>
function remove_img()
{
	document.getElementById('doc_file_name_temp').value = '';
	document.getElementById('label_doc_file_name_temp').style.visibility = 'hidden';
	document.getElementById('crossimg').style.visibility = 'hidden';
}
</script>
<form action="" method="post" enctype="multipart/form-data" name="iframe-form">
<input type="hidden" name="doc[doc_id]" value="{{$doc_data.doc_id}}" />
<table cellpadding="0" cellspacing="0" class="table"  >
  <tr>
    <td><strong>Document Name:</strong></td>
    <td style="background-color:#E0E6FF;padding:5px; font-size:12px; font-weight:bold;">{{$doc_data.admin_doc_name}}</td>
  </tr>
  <tr>
    <td><strong>File Name:</strong></td>
    <td>{{$doc_data.doc_file_name}}</td>
  </tr>
  <tr>
    <td><strong>Load File:</strong></td>
    <td><input type="file" name="image" id="doc_file_name" />
      {{if !empty($doc_data.doc_file_name)}}
      <input type="hidden" name="doc[doc_file_name_temp]" value="{{$doc_data.doc_file_name}}" id="doc_file_name_temp" />
      
<!--          <a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$doc_data.doc_file_name}}')" id="label_doc_file_name_temp" target="_blank">{{$doc_data.doc_file_name}}</a> -->
      
        <a href="javascript:parent.modelviewimages('/business.download_content?file_name={{$doc_data.doc_file_name}}&module_name=business.home')" id="label_doc_file_name_temp" target="_blank">{{$doc_data.doc_file_name}}</a> 
      
      
      <a href="javascript:remove_img();" id="crossimg"><img src="{{$BASE_URL}}css/default/images/notdone-task.gif" id="crossimg" /></a> {{/if}} </td>
  </tr>
  <tr>
    <td colspan="2">
      <table width="991" cellpadding="0" cellspacing="0" style="border:none;">
        <tr>
          <td width="178"><strong>DocumentClick:</strong>
            <input type="checkbox" {{if $doc_data.doc_upload_to_dossier == 1}} checked="checked" {{/if}} name="doc[doc_upload_to_dossier]" value="1" /></td>
          <td width="246">&nbsp;</td>
          <td width="23" style="padding-left:15px;"></td>
          <td width="195"><strong>Document Not Available:</strong>
            <input type="checkbox" {{if $doc_data.doc_not_avail == 1}} checked="checked" {{/if}} name="doc[doc_not_avail]" value="1" /></td>
          <td width="347">&nbsp;</td>
        </tr>
        <tr>
          <td><strong>Date Uploaded:</strong></td>
          <td>{{$doc_data.doc_date_uploaded}}</td>
          <td style="padding-left:15px;"></td>
          <td><strong>Loaded By:</strong></td>
          <td>{{$doc_data.user_name}}</td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td><strong>Note:</strong></td>
    <td><textarea cols="50" rows="5" name="doc[doc_msg]">{{$doc_data.doc_msg}}</textarea></td>
  </tr>
  <tr>
    <td colspan="2" style="text-align:center;"><input type="submit"  value="Save" name="submit_iframe" style="cursor:pointer;" />
      <input type="button"  value="Cancel" onclick="parent.hideiFrame('checkListIframe');" style="cursor:pointer;" />
    </td>
  </tr>
</table>
</form>
</div>
<!--------------- End iframe_data ------->
<!-- End Create Document Checklist section -->
{{/if}}

{{if !empty($iframe_data_renovation) AND $iframe_data_renovation==1}}
<!--------------- Begin iframe_data_mini ------->
<link rel="stylesheet" href="{{$BASE_URL}}css/default/cis-styles.css" />
<div style="border:1px #CCCCCC solid; padding:5px;" id="checkListIframeRenovation"  >
<script>
function remove_img()
{
	document.getElementById('doc_file_name_temp').value = '';
	document.getElementById('label_doc_file_name_temp').style.visibility = 'hidden';
	document.getElementById('crossimg').style.visibility = 'hidden';
}
</script>
<form action="" method="post" enctype="multipart/form-data" name="iframe-form">
<input type="hidden" name="doc[doc_id]" value="{{$doc_data.doc_id}}" />
<table cellpadding="0" cellspacing="0" class="table" style="font-size:12px;"  >
  <tr>
    <td><strong>Document Name:</strong></td>
    <td style="background-color:#E0E6FF;padding:5px; font-size:12px; font-weight:bold;">{{$doc_data.admin_doc_name}}</td>
  </tr>
  <tr>
    <td><strong>File Name:</strong></td>
    <td>{{$doc_data.doc_file_name}}</td>
  </tr>
  <tr>
    <td><strong>Load File:</strong></td>
    <td><input type="file" name="image" id="doc_file_name" />
     <input type="hidden" name="doc[doc_checklist_number]" value="{{$doc_data.doc_checklist_number}}"  />
      {{if !empty($doc_data.doc_file_name)}}
      <input type="hidden" name="doc[doc_file_name_temp]" value="{{$doc_data.doc_file_name}}" id="doc_file_name_temp" />
     
<!--          <a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$doc_data.doc_file_name}}?dummy={{$ran}}')" id="label_doc_file_name_temp" target="_blank">{{$doc_data.doc_file_name}}</a> -->
    
              <a href="javascript:parent.modelviewimages('/business.download_content?file_name={{$doc_data.doc_file_name}}&module_name=business.home')" id="label_doc_file_name_temp" target="_blank">{{$doc_data.doc_file_name}}</a>   
      
      <a href="javascript:remove_img();" id="crossimg"><img src="{{$BASE_URL}}css/default/images/notdone-task.gif" id="crossimg" /></a> {{/if}} </td>
  </tr>
  <tr>
    <td colspan="2">
      <table width="991" cellpadding="0" cellspacing="0" style="border:none; font-size:12px;">
        <tr>
          <td width="178"><strong>Upload To Dossier1:</strong>
            <input type="checkbox" {{if $doc_data.doc_upload_to_dossier == 1}} checked="checked" {{/if}} name="doc[doc_upload_to_dossier]" value="1" /></td>
          <td width="246">&nbsp;</td>
          <td width="23" style="padding-left:15px;"></td>
          <td width="195"><strong>Document Not Available:</strong>
            <input type="checkbox" {{if $doc_data.doc_not_avail == 1}} checked="checked" {{/if}} name="doc[doc_not_avail]" value="1" /></td>
          <td width="347">&nbsp;</td>
        </tr>
        <tr>
          <td><strong>Date Uploaded:</strong></td>
          <td>{{$doc_data.doc_date_uploaded}}</td>
          <td style="padding-left:15px;"></td>
          <td><strong>Loaded By:</strong></td>
          <td>{{$doc_data.user_name}}</td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td><strong>Note:</strong></td>
    <td><textarea cols="50" rows="5" name="doc[doc_msg]">{{$doc_data.doc_msg}}</textarea></td>
  </tr>
  <tr>
    <td colspan="2" style="text-align:center;"><input type="submit"  value="Save" name="submit_iframe_renovation" style="cursor:pointer;" />
      <input type="button"  value="Cancel" onclick="parent.hideiFrame('checkListIframeRenovation');" style="cursor:pointer;" />
    </td>
  </tr>
</table>
</form>
</div>
<!--------------- End iframe_data_mini ------->
<!-- End Create Document Checklist section -->
{{/if}}


{{if !empty($iframe_data_renovation_adddoc) AND $iframe_data_renovation_adddoc==1}}
<!--------------- Begin iframe_data_mini_adddoc ------->
<link rel="stylesheet" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript" src="/js/jsfunctionlist.js"></script>
<div style="border:1px #CCCCCC solid; padding:5px;" id="adddoc_checkListIframeRenovation"  >
<script>
function remove_img()
{
	document.getElementById('cdc_file_name_temp').value = '';
	document.getElementById('label_cdc_file_name_temp').style.visibility = 'hidden';
	document.getElementById('crossimg').style.visibility = 'hidden';
}
</script>
<form action="" id="renovation_cdc_doc_form" method="post" enctype="multipart/form-data" name="iframe-form">
<input type="hidden" name="renovation_bus_id" value="{{$renovation_bus_id}}" />
<input type="hidden" name="renovation_chknm_id" value="{{$renovation_chknm}}" />
<input type="hidden" name="renovation_doc_id" value="{{$renovation_doc_id}}" />
<table cellpadding="0" cellspacing="0" class="table" style="font-size:12px;"  >
  <tr>
    <td><strong>Document Name New:</strong></td>
    <td><input type="text" name="renovation[cdc_doc_name]" value="{{$cdetail.cdc_doc_name}}" style="width:550px;" /></td>
  </tr>
  <tr>
    <td><strong>File Name:</strong></td>
    <td>{{$cdetail.cdc_file_name}}</td>
  </tr>
  <tr>
    <td><strong>Load File:</strong></td>
    <td><input type="file" name="custom_renovation" id="cdc_file_name_mini" />
      {{if !empty($cdetail.cdc_file_name)}}
      <input type="hidden" name="doc[cdc_file_name_temp]" value="{{$cdetail.cdc_file_name}}" id="cdc_file_name_temp" />
      
<!--          <a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$cdetail.cdc_file_name}}?dummy={{$ran}}')" id="label_cdc_file_name_temp" target="_blank">{{$cdetail.cdc_file_name}}</a>-->
      
              <a href="javascript:parent.modelviewimages('/business.download_content?file_name={{$cdetail.cdc_file_name}}&module_name=business.home')" id="label_cdc_file_name_temp" target="_blank">{{$cdetail.cdc_file_name}}</a>  
      
      <a href="javascript:remove_img();" id="crossimg"><img src="{{$BASE_URL}}css/default/images/notdone-task.gif" id="crossimg" /></a> {{/if}} </td>
  </tr>
  <tr>
    <td colspan="2">
      <table width="991" cellpadding="0" cellspacing="0" style="border:none; font-size:12px;">

        <tr>
          <td><strong>Date Uploaded:</strong></td>
          <td>{{$doc_data.doc_date_uploaded}}</td>
          <td style="padding-left:15px;"></td>
          <td><strong>Loaded By:</strong></td>
          <td>{{$doc_data.user_name}}</td>
        </tr>
      </table></td>
  </tr>

  <tr>
    <td colspan="2" style="text-align:center;">
        <input type="submit"  value="Save" id="newRecordUploadForm11" name="submit_iframe_renovation_doc" style="cursor:pointer;" />
      <input type="button"  value="Cancel" onclick="parent.hideiFrame('adddoc_checkListIframeRenovation');" style="cursor:pointer;" />
    </td>
  </tr>
  <tr>
      <td colspan="2" >
              <!-- Progress bar -->
            <div class="progress">
                <div class="progress-bar"></div>
            </div>
            
            <!-- Display upload status -->
            <div id="uploadStatus"></div>
      </td>
  </tr>
</table>
</form>
</div>
<!--------------- End iframe_data_mini_adddoc ------->
<!-- End Create Document Checklist section -->
{{/if}}





{{if !empty($showcDocumentsIframe) AND $showcDocumentsIframe == 1}}
<link rel="stylesheet" href="{{$BASE_URL}}css/default/cis-styles.css" />
<!-------- Show Document iframe ------>
<div id="checkListIframe" >
<form action="" method="post" enctype="multipart/form-data">
<input type="hidden" value="{{if $bus_id}}{{$bus_id}}{{else}}{{$detail.bpd_bsi_id}}{{/if}}" name="data[bpd_bsi_id]" />
<input type="hidden" value="{{$detail.bpd_id}}" name="data[bpd_id]" />
{{if !empty($inrenaldocuments)}}
<input type="hidden" value="1" name="data[bpd_doc_inner]" />
{{/if}}
<table cellpadding="0" cellspacing="0" class="table" style="border:1px solid #CCCCCC; padding:10px; width:100%; text-align:left;" >
  	<tr>
      <th width="150">Load Document Check List: </th>
    <td>
        <select name="cdata">
            <option value="0"> Show All </option>
            {{foreach from=$custom_dcl item=item key=key}}
            <option value="{{$key}}" {{if $key == $cdata }} selected="selected" {{/if}}>{{$item}} </option>
            {{/foreach}}
        </select>
        
     </td>
     <td>
     <input type="submit" value="Load" name="subDocument" />
     </td>
     </tr>

</table>
</form>
</div>
{{/if}} 

{{if !empty($cprint_data)}}
<form name="disena" method="post" action="">
<link rel="stylesheet" href="{{$BASE_URL}}css/default/cis-styles.css" />
<span> {{$type}} </span>
<table cellpadding="0" cellspacing="0" width="100%" id="customDocumenttable" >
<tr>
<th width="7%">Action</th>
<th width="32%">Document Name</th>

<th width="15%">File Name</th>
<th width="10%">Date Uploaded</th>
<th width="7%">User Name</th>
<th width="9%">Upload To Dossier</th>
<th width="10%">Doc Not Avail.</th>
<th width="6%">Manual</th>
</tr>
{{foreach from=$cprint_data item=item key=key}}
{{if $item.doc_disable eq 1 }}	
<tr style="background:red; color:#000;">
{{else}}
<tr>
{{/if}} 
<td><a href="javascript:parent.RequestcheckListIframe('cchecklist','{{$item.doc_id}}','','');" >
<img style="height: 20px; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>

<a href="javascript:parent.RequestcheckListIframe('dedocuments','{{$item.doc_id}}','{{$item.cdata}}','');" >{{if $item.doc_disable eq -1 }}Disable{{else}}Enable{{/if}} </a>
</td>
<td style="padding-left:5px;">{{$item.admin_doc_manual}}{{if $item.doc_file_name !== '' && $item.admin_doc_id == 12}} CONTRACT SIGNED {{else}}{{$item.admin_cdoc_name}}{{/if}}</td>
<!-- <td>{{$item.admin_cdoc_type}} </td>-->
<td style="text-align:left;">

<!--    <a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name}}?dummy={{$ran}}')" class="action_checklist" title="{{$item.doc_file_name}}">{{$item.doc_file_name|truncate:"40"}}</a>-->

 <a href="javascript:parent.modelviewimages('/business.download_content?file_name={{$item.doc_file_name}}&module_name=business.home')" class="action_checklist" title="{{$item.doc_file_name}}">{{$item.doc_file_name|truncate:"40"}}</a> 

</td>
<td style="text-align:center;">{{if $item.doc_date_uploaded}}{{$item.doc_date_uploaded|date_format:"%d/%m/%y"}}{{/if}}</td>
<td style="text-align:center;">{{$item.user_name}}</td>
<td style="text-align:center;"><input type="checkbox" {{if $item.doc_upload_to_dossier == 1}} checked="checked"{{/if}} disabled="disabled" /></td>
<td style="text-align:center;"><input type="checkbox" {{if $item.doc_not_avail == 1}} checked="checked"{{/if}} disabled="disabled" /></td>
<td style="text-align:center;">{{if !empty($item.admin_doc_manual)}}<a href="{{$BASE_URL}}{{$FILE_PATH}}files/document_check_list_files/{{$item.admin_doc_manual}}?dummy={{$ran}}" rel="nofollow">View</a>{{/if}}</td>
</tr>

<script type="text/javascript">
  $('tr').each(function(){
       $('tr').css("background","yellow");   
    });
</script>

{{/foreach}}
</table>
{{/if}}


{{if $iframe_close == 1}}
<script>
parent.hideiFrame('cdocumentsIframe1');
</script>
{{/if}}

{{if $iframe_cdata == 1}}

<!--------------- Begin iframe_data ------->
<link rel="stylesheet" href="{{$BASE_URL}}css/default/cis-styles.css" />
<div style="border:1px #CCCCCC solid; padding:5px;" id="checkListIframe">
<script>
 parent.RequestcheckListIframe('cdocuments','','divbusinesspadocInfoToReturn','');
	
function remove_img()
{
	document.getElementById('doc_file_name_temp').value = '';
	document.getElementById('label_doc_file_name_temp').style.visibility = 'hidden';
	document.getElementById('crossimg').style.visibility = 'hidden';
}
</script>
<form action="" method="post" enctype="multipart/form-data" name="iframe-form">
<input type="hidden" name="doc[doc_id]" value="{{$doc_data.doc_id}}" />
<table cellpadding="0" cellspacing="0" class="table"  >
  <tr>
    <td><strong>Document Name:</strong></td>
    <td style="background-color:#E0E6FF;padding:5px; font-size:12px; font-weight:bold;">{{$doc_data.admin_cdoc_name}}</td>
  </tr>
  <tr>
    <td><strong>File Name:</strong></td>
    <td>{{$doc_data.doc_file_name}}</td>
  </tr>
  <tr>
    <td><strong>Load File:</strong></td>
    <td><input type="file" name="image" id="doc_file_name_mini" />
      {{if !empty($doc_data.doc_file_name)}}
      <input type="hidden" name="doc[doc_file_name_temp]" value="{{$doc_data.doc_file_name}}" id="doc_file_name_temp" />
      
<!--          <a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$doc_data.doc_file_name}}?dummy={{$ran}}')" id="label_doc_file_name_temp" target="_blank">{{$doc_data.doc_file_name}}</a> -->

        <a href="javascript:parent.modelviewimages('/business.download_content?file_name={{$doc_data.doc_file_name}}&module_name=business.home')" id="label_doc_file_name_temp" target="_blank">{{$doc_data.doc_file_name}}</a>         
      
      <a href="javascript:remove_img();" id="crossimg"><img src="{{$BASE_URL}}css/default/images/notdone-task.gif" id="crossimg" /></a> {{/if}} </td>
  </tr>
  <tr>
    <td colspan="2">
      <table width="991" cellpadding="0" cellspacing="0" style="border:none;">
        <tr>
          <td width="178"><strong>Upload To Dossier:</strong>
            <input type="checkbox" {{if $doc_data.doc_upload_to_dossier == 1}} checked="checked" {{/if}} name="doc[doc_upload_to_dossier]" value="1" /></td>
          <td width="246">&nbsp;</td>
          <td width="23" style="padding-left:15px;"></td>
          <td width="195"><strong>Document Not Available:</strong>
            <input type="checkbox" {{if $doc_data.doc_not_avail == 1}} checked="checked" {{/if}} name="doc[doc_not_avail]" value="1" /></td>
          <td width="347">&nbsp;</td>
        </tr>
        <tr>
          <td><strong>Date Uploaded:</strong></td>
          <td>{{$doc_data.doc_date_uploaded}}</td>
          <td style="padding-left:15px;"></td>
          <td><strong>Loaded By:</strong></td>
          <td>{{$doc_data.user_name}}</td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td><strong>Note:</strong></td>
    <td><textarea cols="50" rows="5" name="doc[doc_msg]">{{$doc_data.doc_msg}}</textarea></td>
  </tr>
  <tr>
    <td colspan="2" style="text-align:center;"><input type="submit"  value="Save" name="submit_iframe" style="cursor:pointer;" />
      <input type="button"  value="Cancel" onclick="parent.hideiFrame('cdocumentsIframe1');" style="cursor:pointer;" />
    </td>
  </tr>
</table>
</form>
</div>
<!--------------- End iframe_data ------->
<!-- End Create Document Checklist section -->
{{/if}}


{{if !empty($showpaNotesIframe) AND $showpaNotesIframe == 1}}
<link rel="stylesheet" href="{{$BASE_URL}}css/default/cis-styles.css" />
<!-------- Show Document iframe ------>
<div id="checkListIframe" >
<form action="" method="post" enctype="multipart/form-data">
<input type="hidden" value="{{if $bus_id}}{{$bus_id}}{{else}}{{$detail.bpn_bsi_id}}{{/if}}" name="data[bpn_bsi_id]" />
<input type="hidden" value="{{$detail.bpn_id}}" name="data[bpn_id]" />
<table cellpadding="0" cellspacing="0" class="table" style="border:1px solid #CCCCCC; padding:10px; width:100%; text-align:left;" >
 <tr><th>Type:</th>
	<td colspan="3">
        <select name="data[bpn_type]" style="width:200px;">
            {{foreach from=$type key="id" item="oprname"}}
            <option value="{{$id}}" {{if $id == $detail.bpn_type}} selected="selected" {{/if}}>{{$oprname}}</option>
            {{/foreach}}
        </select>
<br /></td></tr>
<tr><th>Notes:</th><td><textarea cols="100" rows="5" name="data[bpn_notes]">{{$detail.bpn_notes}}</textarea></td></tr>
  
  <tr>
    <th> <input type="submit" value="Save" name="subDocument" />
    </th>
    <td><input type="button" value="cancel" onclick="parent.hideiFrame('panotesIframe','');" />
    </td>
  </tr>
</table>
</form>
</div>
{{/if}} 
{{if !empty($notes_success_msg)}}
<script>
parent.hideiFrame('panotesIframe','{{$notes_success_msg}}');
parent.iframeRequest(5,'');
</script>
{{/if}}
{{if !empty($iframe_msg)}}
<script>
parent.hideiFrame('checkListIframe','');
parent.requestDocumentCheckList();
</script>
{{/if}}
{{if !empty($iframe_msg_renovation)}}
<script>
parent.hideiFrame('checkListIframeRenovation','');
parent.requestDocumentCheckListRenovation();
</script>
{{/if}}




{{if !empty($showpaDocumentsIframe) AND $showpaDocumentsIframe == 1}}
<link rel="stylesheet" href="{{$BASE_URL}}css/default/cis-styles.css" />
<!-------- Show Document iframe ------>
<div id="checkListIframe" >
<form action="" method="post" enctype="multipart/form-data">
<input type="hidden" value="{{if $bus_id}}{{$bus_id}}{{else}}{{$detail.bpd_bsi_id}}{{/if}}" name="data[bpd_bsi_id]" />
<input type="hidden" value="{{$detail.bpd_id}}" name="data[bpd_id]" />
{{if !empty($inrenaldocuments)}}
<input type="hidden" value="1" name="data[bpd_doc_inner]" />
{{/if}}
<table cellpadding="0" cellspacing="0" class="table" style="border:1px solid #CCCCCC; padding:10px; width:100%; text-align:left;" >
  <tr>
    <th width="100"> Document Name: </th>
    <td><input type="text" name="data[bpd_type]" value="{{$detail.bpd_type}}" style="width:550px;" />
    </td>
  </tr>
  <tr>
    <th>File Name: </th>
 <td>{{if !empty($detail.bpd_doc_name)}} 

<!--   <a href="https://deckquote.s3.amazonaws.com/files/business_documents/{{$detail.bpd_doc_name}}?dummy={{$ran}}" target="_blank">{{$detail.bpd_doc_name}}</a>
-->  
<a href="/business.download_content_bd?file_name={{$detail.bpd_doc_name}}&module_name=business.home" target="_blank">{{$detail.bpd_doc_name}}</a>


 <input type="hidden" value="{{$detail.bpd_doc_name}}" name="data[bpd_doc_name]" />
   {{else}}Document must be saved before being displayed.{{/if}}</td>
  </tr>
  <tr>
    <th> Load File: </th>
    <td><input type="file"  name="document" />
      <div style="color:#FF0000;">{{$file_exist}}</div></td>
  </tr>
  <tr>
    <th> Notes: </th>
    <td><textarea cols="102" rows="5" name="data[bpd_comment]">{{$detail.bpd_comment}}</textarea>
    </td>
  </tr>
  <tr>
    <th> <input type="submit" value="Save" name="subDocument" />
    </th>
    <td><input type="button" value="cancel" onclick="parent.hideiFrame('padocumentsIframe','');" />
    </td>
  </tr>
</table>
</form>
</div>
{{/if}} 
{{if !empty($padocs_success_msg)}}
<script>
        parent.hideiFrame('padocumentsIframe','{{$success_msg}}');
        parent.iframeRequest(4,'');
</script>
{{/if}}

{{if !empty($showDocumentsIframe) AND $showDocumentsIframe == 1}}
<link rel="stylesheet" href="{{$BASE_URL}}css/default/cis-styles.css" />
<!-------- Show Document iframe ------>
<div id="checkListIframe" >
<form action="" method="post" enctype="multipart/form-data">
<input type="hidden" value="{{if $bus_id}}{{$bus_id}}{{else}}{{$detail.bd_bsi_id}}{{/if}}" name="data[bd_bsi_id]" />
<input type="hidden" value="{{$detail.bd_id}}" name="data[bd_id]" />
{{if !empty($inrenaldocuments)}}
<input type="hidden" value="1" name="data[bd_doc_inner]" />
{{/if}}
<table cellpadding="0" cellspacing="0" class="table" style="border:1px solid #CCCCCC; padding:10px; width:100%; text-align:left;" >
  <tr>
    <th width="100"> Document Name: </th>
    <td><input type="text" name="data[bd_type]" value="{{$detail.bd_type}}" style="width:550px;" />
    </td>
  </tr>
  <tr>
    <th> Type Status: </th>
    <td><select name="data[bd_status]" >
    	{{foreach from=$docstatus key="stid" item="statuses"}}
    	  <option value="{{$stid}}" {{if $detail.bd_status == $stid }} selected="selected" {{/if}}>{{$statuses}}</option>
    	{{/foreach}}
      </select>
    </td>
  </tr>
  <tr>
    <th> File Name: </th>
    <td> {{if !empty($detail.bd_doc_name)}} 
    
<!--   <a href="https://deckquote.s3.amazonaws.com/files/business_documents/{{$detail.bd_doc_name}}?dummy={{$ran}}" target="_blank">{{$detail.bd_doc_name}}</a>
-->    
<a href="/business.download_content_bd?file_name={{$item.doc_file_name}}&module_name=business.home" target="_blank">{{$detail.bd_doc_name}}</a>


      <input type="hidden" value="{{$detail.bd_doc_name}}" name="data[bd_doc_name]" />
      {{else}}Document must be saved before being displayed.{{/if}}</td>
  </tr>
  <tr>
    <th> Load File: </th>
    <td><input type="file"  name="document" />
      <div style="color:#FF0000;">{{$file_exist}}</div></td>
  </tr>
  <tr>
    <th> Notes: </th>
    <td><textarea cols="102" rows="5" name="data[bd_comment]">{{$detail.bd_comment}}</textarea>
    </td>
  </tr>
  <tr>
    <th> <input type="submit" value="Save" name="subDocument" />
    </th>
    <td><input type="button" value="cancel" onclick="parent.hideiFrame('adddocumentsIframe','');" />
    </td>
  </tr>
</table>
</form>
</div>

{{/if}} 

{{if !empty($documents_data_show)}}
{{$divid}}||

<table cellpadding="0" cellspacing="0" width="100%">
{{if $documents_data}}
<tr>
<th width="10%">Action</th>
<th width="30%">Document Name</th>
<th width="20%">File Name1</th>
<th width="10%">Date Uploaded</th>
<th width="10%">User Name</th>
<th width="10%">Status</th>
<th width="10%">Comments</th>
</tr>

{{foreach from=$documents_data item=item key=key}}
<tr>
<td> {{if empty($inrenaldocuments)}}<a href="javascript:RequestcheckListIframe('adddocuments','{{$item.bd_id}}','{{$divid}}','');" >{{else}} <a href="javascript:RequestcheckListIframe('intdocuments','{{$item.bd_id}}','{{$divid}}','');" >{{/if}} <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a> &nbsp;
  {{if $USER_GROUP == 'Administrators'}}
  {{if empty($inrenaldocuments)}} <a href="javascript:requestDeleteDocument('{{$item.bd_id}}','1');" >{{else}} <a href="javascript:requestDeleteDocument('{{$item.bd_id}}','3');" >{{/if}} <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>{{/if}} </td>
<td style="text-align:left;">{{if $item.bd_type!='0' AND $item.bd_type!=''}}{{$item.bd_type}}{{/if}}</td>

<td style="text-align:center;">
<!--    <a href="https://deckquote.s3.amazonaws.com/files/business_documents/{{$item.bd_doc_name}}?dummy={{$ran}}" title="{{$item.bd_doc_name}}" class="action_small" target="_blank">{{$item.bd_doc_name|truncate:"30"}}</a>-->

<a href="/business.download_content_bd?file_name={{$item.bd_doc_name}}&module_name=business.home" title="{{$item.bd_doc_name}}" class="action_small" target="_blank">{{$item.bd_doc_name|truncate:"30"}}</a>  

</td>


<td style="text-align:center;">{{$item.bd_uploaded_date}}</td>
<td style="text-align:left;">{{$item.user_name}}</td>
 <td style="text-align:center;">{{foreach from=$docstatus key="key2" item="item2"}}{{if $item.bd_status == $key2}}{{$item2}}{{/if}}{{/foreach}}</td>
<td style="text-align:left;">{{$item.bd_comment}}</td>
</tr>
{{/foreach}}
</table>

{{if $last > 1}}
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center" style="border:none;">
<tr> {{if $last}}
<td align="center"><div class='pagination'> {{if $pagenum == 1}} <span class='disabled'>&laquo; previous</span> {{else}} <a class="pagination" href="javascript:javascript:iframeRequest(1,{{math equation="x - y" x=$pagenum y=1}})" title="Previous">&laquo; previous</a> {{/if}}
    
    {{if $pagenum != 1}} <span class="paginate"><a class="pagination"  href="javascript:iframeRequest(1,1)" title="{{$page_num}} Page">1</a></span> {{else}}<span class='current'>1</span> {{/if}}{{if $pagenum != 2}} <span class="paginate"><a class="pagination"  href="javascript:iframeRequest(1,2)" title="{{$page_num}} Page">2</a></span> {{else}}<span class='current'>2</span> {{/if}}
    {{if $paginateprev.0 > 3}}
    ...
    {{/if}}
    {{foreach from=$paginateprev key="page_key" item="page_num"}}
    {{if $page_num == $pagenum OR $page_num <= 2}}
    {{elseif $page_num == $lastone}}
    
    {{else}} <span class="paginate"><a class="pagination"  href="javascript:iframeRequest(1,{{$page_num}})" title="{{$page_num}} Page">{{$page_num}}</a></span> {{/if}}
    {{/foreach}}
    
    {{foreach from=$paginatenext key="page_key" item="page_num2"}}
    {{if $page_num2 < $last AND $page_num2 != $lastone}}
    {{if $page_num2 == 1}}
    {{elseif $page_num2 == 2}}
    {{else}}
    {{if $page_num2 == $pagenum OR $page_num2 <= 0}} <span class='current'> {{$page_num2}}</span> {{else}} <a class="pagination"  href="javascript:iframeRequest(1,{{$page_num2}})" title="{{$page_num2}} Page">{{$page_num2}}</a> {{/if}}
    {{/if}}     
    {{/if}}
    {{/foreach}}
    {{if $page_num2 < $lasttow}}
    ...
    {{/if}}
    {{if $lastone == 1}}
    {{elseif $lastone == 2}}
    {{else}}
    {{if $pagenum == $lastone }} <span class='current'>{{$lastone}}</span> {{else}} <a class="pagination"  href="javascript:iframeRequest(1,{{$lastone}})" title="{{$lastone}} Page">{{$lastone}}</a> {{/if}}
    {{/if}}
    {{if $last == 1}}
    {{elseif $last == 2}}
    {{else}}
    {{if $pagenum == $last}} <span class='current'>{{$last}}</span> {{else}} <a class="pagination"  href="javascript:iframeRequest(1,{{$last}})" title="{{$last}} Page">{{$last}}</a> {{/if}}
    {{/if}}
    {{if $pagenum == $last}} <span class='disabled'>next &raquo;</span> {{else}} <a class="pagination" href="javascript:iframeRequest(1,{{math equation="x + y" x=$pagenum y=1}})" title="Next">next &raquo;</a></div>
  {{/if}} </td>
{{else}}
<td align="center" height="300">Record Not found... </td>
{{/if}} </tr>
</table>
{{/if}}

{{/if}}
{{/if}}
{{if !empty($success_msg)}}
<script>
	parent.hideiFrame('adddocumentsIframe','{{$success_msg}}');
	parent.iframeRequest(1,'');
</script>
<script>
	parent.hideiFrame('intdocumentsIframe','{{$success_msg}}');
	parent.iframeRequest(3,'');
</script>

{{/if}}
{{if !empty($showImagesIframe) AND $showImagesIframe == 1}}
<link rel="stylesheet" href="{{$BASE_URL}}css/default/cis-styles.css" />
<!-------- Show Document iframe ------>
<div id="checkListIframe" >
<form action="" method="post" enctype="multipart/form-data">
<input type="hidden" value="{{if $bus_id}}{{$bus_id}}{{else}}{{$detail.bf_bsn_id}}{{/if}}" name="data[bf_bsn_id]" />
<input type="hidden" value="{{$detail.bf_id}}" name="data[bf_id]" />
<table cellpadding="0" cellspacing="0" class="table" style="border:1px solid #CCCCCC; padding:5px;" width="99%" >
  <tr>
    <th width="100"> Image Name: </th>
    <td> {{if !empty($detail.bf_name)}} <a href="{{$BASE_URL}}{{$FILE_PATH}}files/business_images/{{$detail.bf_name}}?dummy={{$ran}}" target="_blank">{{$detail.bf_name}}</a>
      <input type="hidden" value="{{$detail.bf_name}}" name="data[bf_name]" />
      {{else}}Image must be saved before being displayed.{{/if}}</td>
  </tr>
  <tr>
    <th> Image Load: </th>
    <td><input type="file" name="images" />
      <div style="color:#FF0000;">{{$file_exist}}</div></td>
  </tr>
  <tr>
    <th> Image Role: </th>
    <td><select name="data[bf_role]" >
        <option value="0" {{if $detail.bf_role == 0 }} selected="selected" {{/if}}>Other Images</option>
        <option value="1" {{if $detail.bf_role == 1 }} selected="selected" {{/if}}>Main Image</option>
      </select>
    </td>
  </tr>
  <tr>
    <th> Comment: </th>
    <td><textarea cols="100" rows="3" name="data[bf_comments]" style="border: 1px solid #CCCCCC;">{{$detail.bf_comments}}</textarea>
    </td>
  </tr>
  <tr>
    <th> <input type="submit" value="Save" name="subImage" />
    </th>
    <td><input type="button" value="cancel" onclick="parent.hideiFrame('imagesIframe','');" />
    </td>
  </tr>
</table>
</form>
</div>

{{/if}} 

{{if !empty($show_images_data)}}
{{$divid}}||
{{if !empty($images_data)}}
<table cellpadding="0" cellspacing="0" width="100%" >
<tr>
<th>Action</th>
<th>Image Name</th>
<th>Role</th>
<th>User</th>
<th>Uploaded Date</th>
<th>Width</th>
<th>Height</th>
<th>Comments</th>
</tr>
{{foreach from=$images_data item=item key=key}}
<tr>
<td><a href="javascript:RequestcheckListIframe('images','{{$item.bf_id}}','{{$divid}}','');" > <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a> &nbsp;&nbsp; 
  {{if $USER_GROUP == 'Administrators'}} <a href="javascript:requestDeleteDocument('{{$item.bf_id}}','2');" ><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a> {{/if}}</td>
<td style="text-align:left;"><a onclick="javascript:parent.modelviewimages('{{$BASE_URL}}{{$FILE_PATH}}files/business_images/{{$item.bf_name}}');" style="text-decoration:underline; cursor:pointer;" >
	<img src="{{$BASE_URL}}{{$FILE_PATH}}files/business_images/thumb_{{$item.bf_name}}" width="30"  /></a></td>
<td style="text-align:center;">{{if $item.bf_role==0}}Other Images{{elseif $item.bf_role==1}}<strong>Main Image</strong>{{/if}}</td>
<td style="text-align:left;">{{$item.customer_name|default:"Administrator"}}</td>
<td style="text-align:center;">{{$item.bf_uploaded_date}}</td>
<td style="text-align:center;">{{$item.bf_width}} px</td>
<td style="text-align:center;">{{$item.bf_height}} px</td>
<td style="text-align:left;">{{$item.bf_comments}}</td>
</tr>
{{/foreach}}
</table>
{{/if}}
<!-- Begin Pagination -->
{{if $last > 1}}
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center" style="border:none;">
<tr> {{if $last}}
<td align="center"><div class='pagination'> {{if $pagenum == 1}} <span class='disabled'>&laquo; previous</span> {{else}} <a class="pagination" href="javascript:javascript:iframeRequest(2,{{math equation="x - y" x=$pagenum y=1}})" title="Previous">&laquo; previous</a> {{/if}}
    
    {{if $pagenum != 1}} <span class="paginate"><a class="pagination"  href="javascript:iframeRequest(2,1)" title="{{$page_num}} Page">1</a></span> {{else}}<span class='current'>1</span> {{/if}}{{if $pagenum != 2}} <span class="paginate"><a class="pagination"  href="javascript:iframeRequest(2,2)" title="{{$page_num}} Page">2</a></span> {{else}}<span class='current'>2</span> {{/if}}
    {{if $paginateprev.0 > 3}}
    ...
    {{/if}}
    {{foreach from=$paginateprev key="page_key" item="page_num"}}
    {{if $page_num == $pagenum OR $page_num <= 2}}
    {{elseif $page_num == $lastone}}
    
    {{else}} <span class="paginate"><a class="pagination"  href="javascript:iframeRequest(2,{{$page_num}})" title="{{$page_num}} Page">{{$page_num}}</a></span> {{/if}}
    {{/foreach}}
    
    {{foreach from=$paginatenext key="page_key" item="page_num2"}}
    {{if $page_num2 < $last AND $page_num2 != $lastone}}
    {{if $page_num2 == 1}}
    {{elseif $page_num2 == 2}}
    {{else}}
    {{if $page_num2 == $pagenum OR $page_num2 <= 0}} <span class='current'> {{$page_num2}}</span> {{else}} <a class="pagination"  href="javascript:iframeRequest(2,{{$page_num2}})" title="{{$page_num2}} Page">{{$page_num2}}</a> {{/if}}
    {{/if}}     
    {{/if}}
    {{/foreach}}
    {{if $page_num2 < $lasttow}}
    ...
    {{/if}}
    {{if $lastone == 1}}
    {{elseif $lastone == 2}}
    {{else}}
    {{if $pagenum == $lastone }} <span class='current'>{{$lastone}}</span> {{else}} <a class="pagination"  href="javascript:iframeRequest(2,{{$lastone}})" title="{{$lastone}} Page">{{$lastone}}</a> {{/if}}
    {{/if}}
    {{if $last == 1}}
    {{elseif $last == 2}}
    {{else}}
    {{if $pagenum == $last}} <span class='current'>{{$last}}</span> {{else}} <a class="pagination"  href="javascript:iframeRequest(2,{{$last}})" title="{{$last}} Page">{{$last}}</a> {{/if}}
    {{/if}}
    {{if $pagenum == $last}} <span class='disabled'>next &raquo;</span> {{else}} <a class="pagination" href="javascript:iframeRequest(2,{{math equation="x + y" x=$pagenum y=1}})" title="Next">next &raquo;</a></div>
  {{/if}} </td>
{{else}}
<td align="center" height="300">Record Not found... </td>
{{/if}} </tr>
</table>
{{/if}}
<!-- End Pagination -->
{{/if}}


{{if !empty($show_pnnotes_data)}}
{{$divid}}||

<table cellpadding="0" cellspacing="0" width="100%">
{{if $pnnotes_data}}
<tr>
<th width="10%">Action</th>
<th width="20%">Type</th>
<th width="20%">Date</th>
<th width="20%" >User</th>
<th>Notes</th>
</tr>

{{foreach from=$pnnotes_data item=item key=key}}
<tr>
<td><a href="javascript:RequestcheckListIframe('panotes','{{$item.bpn_id}}','{{$divid}}','');" ><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a> &nbsp;
  {{if $USER_GROUP == 'Administrators'}}<a href="javascript:requestDeleteDocument('{{$item.bpn_id}}','5');" ><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>{{/if}} </td>
<td style="text-align:center;">{{foreach from=$type key="key2" item="item2"}}{{if $item.bpn_type == $key2}}{{$item2}}{{/if}}{{/foreach}}</td>
<td style="text-align:center;">{{$item.bpn_uploaded_date}}</td>
<td style="text-align:left;">{{$item.user_name}}</td>
<td style="text-align:left;">{{$item.bpn_notes}}</td>
</tr>
{{/foreach}}
</table>

{{if $last > 1}}
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center" style="border:none;">
<tr> {{if $last}}
<td align="center"><div class='pagination'> {{if $pagenum == 1}} <span class='disabled'>&laquo; previous</span> {{else}} <a class="pagination" href="javascript:javascript:iframeRequest(1,{{math equation="x - y" x=$pagenum y=1}})" title="Previous">&laquo; previous</a> {{/if}}
    
    {{if $pagenum != 1}} <span class="paginate"><a class="pagination"  href="javascript:iframeRequest(1,1)" title="{{$page_num}} Page">1</a></span> {{else}}<span class='current'>1</span> {{/if}}{{if $pagenum != 2}} <span class="paginate"><a class="pagination"  href="javascript:iframeRequest(1,2)" title="{{$page_num}} Page">2</a></span> {{else}}<span class='current'>2</span> {{/if}}
    {{if $paginateprev.0 > 3}}
    ...
    {{/if}}
    {{foreach from=$paginateprev key="page_key" item="page_num"}}
    {{if $page_num == $pagenum OR $page_num <= 2}}
    {{elseif $page_num == $lastone}}
    
    {{else}} <span class="paginate"><a class="pagination"  href="javascript:iframeRequest(1,{{$page_num}})" title="{{$page_num}} Page">{{$page_num}}</a></span> {{/if}}
    {{/foreach}}
    
    {{foreach from=$paginatenext key="page_key" item="page_num2"}}
    {{if $page_num2 < $last AND $page_num2 != $lastone}}
    {{if $page_num2 == 1}}
    {{elseif $page_num2 == 2}}
    {{else}}
    {{if $page_num2 == $pagenum OR $page_num2 <= 0}} <span class='current'> {{$page_num2}}</span> {{else}} <a class="pagination"  href="javascript:iframeRequest(1,{{$page_num2}})" title="{{$page_num2}} Page">{{$page_num2}}</a> {{/if}}
    {{/if}}     
    {{/if}}
    {{/foreach}}
    {{if $page_num2 < $lasttow}}
    ...
    {{/if}}
    {{if $lastone == 1}}
    {{elseif $lastone == 2}}
    {{else}}
    {{if $pagenum == $lastone }} <span class='current'>{{$lastone}}</span> {{else}} <a class="pagination"  href="javascript:iframeRequest(1,{{$lastone}})" title="{{$lastone}} Page">{{$lastone}}</a> {{/if}}
    {{/if}}
    {{if $last == 1}}
    {{elseif $last == 2}}
    {{else}}
    {{if $pagenum == $last}} <span class='current'>{{$last}}</span> {{else}} <a class="pagination"  href="javascript:iframeRequest(1,{{$last}})" title="{{$last}} Page">{{$last}}</a> {{/if}}
    {{/if}}
    {{if $pagenum == $last}} <span class='disabled'>next &raquo;</span> {{else}} <a class="pagination" href="javascript:iframeRequest(1,{{math equation="x + y" x=$pagenum y=1}})" title="Next">next &raquo;</a></div>
  {{/if}} </td>
{{else}}
<td align="center" height="300">Record Not found... </td>
{{/if}} </tr>
</table>
{{/if}}

{{/if}}
{{/if}}












{{if !empty($img_success_msg)}}
<!-- <div style="font-size:12px; font-weight:bold; color:#FF3300;">{{$success_msg}}</div> -->
<script>
	parent.hideiFrame('imagesIframe','{{$img_success_msg}}');
	parent.iframeRequest(2,'');
</script>
{{/if}}



{{if !empty($show_pddocs_data)}}
{{$divid}}||
<table cellpadding="0" cellspacing="0" width="100%">
{{if $pddocs_data}}
<tr>
<th width="10%">Action</th>
<th width="30%">Document Name</th>
<th width="20%">File Name</th>
<th width="10%">Date Uploaded</th>
<th width="10%">User Name</th>
<th width="10%">Comments</th>
</tr>

{{foreach from=$pddocs_data item=item key=key}}
<tr>
<td> <a href="javascript:RequestcheckListIframe('padocuments','{{$item.bpd_id}}','{{$divid}}','');" ><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a> &nbsp;
  {{if $USER_GROUP == 'Administrators'}}
  {{if empty($inrenaldocuments)}} <a href="javascript:requestDeleteDocument('{{$item.bpd_id}}','4');" >{{else}} <a href="javascript:requestDeleteDocument('{{$item.bpd_id}}','3');" >{{/if}} <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>{{/if}} </td>
<td style="text-align:left;">{{if $item.bpd_type!='0' AND $item.bpd_type!=''}}{{$item.bpd_type}}{{/if}}</td>

<td style="text-align:center;">
<!--    <a href="https://deckquote.s3.amazonaws.com/files/business_documents/{{$item.bpd_doc_name}}?dummy={{$ran}}" title="{{$item.bpd_doc_name}}" class="action_small" target="_blank">{{$item.bpd_doc_name|truncate:"30"}}</a>-->

   <a href="/business.download_content_bd?file_name={{$item.doc_file_name}}&module_name=business.home" title="{{$item.bpd_doc_name}}" class="action_small" target="_blank">{{$item.bpd_doc_name|truncate:"30"}}</a>

</td>
<td style="text-align:center;">{{$item.bpd_uploaded_date|date_format:'%m-%d-%Y'}}</td>
<td style="text-align:left;">{{$item.user_name}}</td>
<td style="text-align:left;">{{$item.bpd_comment}}</td>
</tr>
{{/foreach}}
</table>

{{if $last > 1}}
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center" style="border:none;">
<tr> {{if $last}}
<td align="center"><div class='pagination'> {{if $pagenum == 1}} <span class='disabled'>&laquo; previous</span> {{else}} <a class="pagination" href="javascript:javascript:iframeRequest(4,{{math equation="x - y" x=$pagenum y=1}})" title="Previous">&laquo; previous</a> {{/if}}
    
    {{if $pagenum != 1}} <span class="paginate"><a class="pagination"  href="javascript:iframeRequest(4,1)" title="{{$page_num}} Page">1</a></span> {{else}}<span class='current'>1</span> {{/if}}{{if $pagenum != 2}} <span class="paginate"><a class="pagination"  href="javascript:iframeRequest(4,2)" title="{{$page_num}} Page">2</a></span> {{else}}<span class='current'>2</span> {{/if}}
    {{if $paginateprev.0 > 3}}
    ...
    {{/if}}
    {{foreach from=$paginateprev key="page_key" item="page_num"}}
    {{if $page_num == $pagenum OR $page_num <= 2}}
    {{elseif $page_num == $lastone}}
    
    {{else}} <span class="paginate"><a class="pagination"  href="javascript:iframeRequest(4,{{$page_num}})" title="{{$page_num}} Page">{{$page_num}}</a></span> {{/if}}
    {{/foreach}}
    
    {{foreach from=$paginatenext key="page_key" item="page_num2"}}
    {{if $page_num2 < $last AND $page_num2 != $lastone}}
    {{if $page_num2 == 1}}
    {{elseif $page_num2 == 2}}
    {{else}}
    {{if $page_num2 == $pagenum OR $page_num2 <= 0}} <span class='current'> {{$page_num2}}</span> {{else}} <a class="pagination"  href="javascript:iframeRequest(1,{{$page_num2}})" title="{{$page_num2}} Page">{{$page_num2}}</a> {{/if}}
    {{/if}}     
    {{/if}}
    {{/foreach}}
    {{if $page_num2 < $lasttow}}
    ...
    {{/if}}
    {{if $lastone == 1}}
    {{elseif $lastone == 2}}
    {{else}}
    {{if $pagenum == $lastone }} <span class='current'>{{$lastone}}</span> {{else}} <a class="pagination"  href="javascript:iframeRequest(4,{{$lastone}})" title="{{$lastone}} Page">{{$lastone}}</a> {{/if}}
    {{/if}}
    {{if $last == 1}}
    {{elseif $last == 2}}
    {{else}}
    {{if $pagenum == $last}} <span class='current'>{{$last}}</span> {{else}} <a class="pagination"  href="javascript:iframeRequest(4,{{$last}})" title="{{$last}} Page">{{$last}}</a> {{/if}}
    {{/if}}
    {{if $pagenum == $last}} <span class='disabled'>next &raquo;</span> {{else}} <a class="pagination" href="javascript:iframeRequest(4,{{math equation="x + y" x=$pagenum y=1}})" title="Next">next &raquo;</a></div>
  {{/if}} </td>
{{else}}
<td align="center" height="300">Record Not found... </td>
{{/if}} </tr>
</table>
{{/if}}

{{/if}}
{{/if}}


