
{{if !empty($print_data_mini19)}}
<br />
<div style="font-style:bold; text-align:left; padding:5px;"> 
<form name="tablename" method="post" action="" >
<input type="hidden" name="proposal[dpn_bsn_id]" value="{{$bsn_id_mini}}" />
<input type="hidden" name="proposal[dpn_proposal_number]" value="19" />
Document Proposal : <input type="text" name="proposal[dpn_name]" value="{{$dpn_name_19}}"}} style="width:400px;"  />
Primary Design : <input type="radio" name="proposal[dpn_primary_design]" value="1"  {{if $dpn_primary_design_19  == 1}} checked="checked" {{/if}}/>  Yes  &nbsp; 
<input type="radio" name="proposal[dpn_primary_design]" value="0"  {{if $dpn_primary_design_19 == 0}} checked="checked" {{/if}} /> NO <br />
Design Type : <select name="proposal[dpn_design_type]">
<option value="1" {{if $dpn_design_type_19 eq 1}} selected="selected" {{/if}}>Concept Design</option>
<option value="2" {{if $dpn_design_type_19 eq 2}} selected="selected" {{/if}}>Modification Design</option>
<option value="3" {{if $dpn_design_type_19 eq 3}} selected="selected" {{/if}}>Existing Design</option>
<option value="4" {{if $dpn_design_type_19 eq 4}} selected="selected" {{/if}}>External Design </option>
</select> &nbsp &nbsp; &nbsp;
Customer Designer: <input type="text" name="proposal[dpn_customer_designer]" value="{{$dpn_customer_designer_19}}"}} style="width:200px;"/> &nbsp;
<input type="submit" name="table_name" value="Save" />

&nbsp; &nbsp; 
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
  {{foreach from=$print_data_mini19 item=item key=key}}
  {{if $item.doc_not_required eq 1}}
  	<tr id="gr{{$item.doc_id}}" style="background:#CCC;" >
  {{else}}
    <tr id="gr{{$item.doc_id}}" >
  {{/if}}
    <td><a href="javascript:RequestcheckListIframe('checklistmini','{{$item.doc_id}}','{{$item.doc_checklist_number}}','');" >
    <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a><br />
     Not Required:
     <input type hidden name = "not_required[{{$item.doc_id}}][doc_id]" value = "{{$item.doc_id}}"  />
     <input type="checkbox" name = "not_required[{{$item.doc_id}}][doc_not_required]" id="notreq{{$item.doc_id}}" onclick="process({{$item.doc_bsn_id}},{{$item.doc_id}});" {{if $item.doc_not_required eq 1 }} checked="checked" {{/if}} /> 
     <p id="myElem{{$item.doc_id}}" style="display:none;"></p>

    
    </td>
    <td style="padding-left:5px;">{{$item.admin_doc_manual}}{{if $item.doc_file_name !== '' && $item.admin_doc_id == 12}} CONTRACT SIGNED {{else}}{{$item.admin_doc_name}}{{/if}}</td>
	
    {{if !empty($ipad)}} 
    <td style="text-align:left;"><a href="{{$BASE_URL}}{{$FILE_PATH}}files/document_check_list_files/{{$item.doc_file_name}}" class="action_checklist" title="{{$item.doc_file_name}}" target="_blank">{{$item.doc_file_name|truncate:"40"}}</a></td>
   
    {{else}}
   <td style="text-align:left;"><a href="javascript:parent.modelviewimages('{{$BASE_URL}}{{$FILE_PATH}}files/document_check_list_files/{{$item.doc_file_name}}')" class="action_checklist" title="{{$item.doc_file_name}}">{{$item.doc_file_name|truncate:"40"}}</a></td>
     {{/if}}

    <td style="text-align:center;">{{$item.doc_date_uploaded|date_format:"%d/%m/%Y"}}</td>
    <td style="text-align:center;">{{$item.user_name}}</td>
 <td style="text-align:left;">
<input type="radio" name="not_required[{{$item.doc_id}}][cwww]" value="1" {{if $item.doc_cust_www  == 1}} checked="checked" {{/if}}/> <span style="padding-top:5px;"> Yes </span> <br />
<input type="radio" name="not_required[{{$item.doc_id}}][cwww]" value="0" {{if $item.doc_cust_www == 0}} checked="checked" {{/if}} /> NO 
</td>
  </tr>
  {{/foreach}}
  

  {{if !empty($cus_minidata19)}}

   {{foreach from=$cus_minidata19 item=itemc key=keyc}}
   {{if $itemc.cdc_not_required eq 1}}
  	<tr id="grc{{$itemc.cdc_id}}" style="background:#CCC;" >
  {{else}}
    <tr id="grc{{$itemc.cdc_id}}" >
  {{/if}}

  <td><a href="javascript:RequestcheckListIframe('adddoc_checklistmini','{{$itemc.cdc_id}}','19','');" >
    <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a><br />
     Not Required:
     <input type hidden name = "not_required_custom[{{$itemc.cdc_id}}][cdc_id]" value = "{{$itemc.cdc_id}}"  />
     <input type="checkbox" name = "not_required_custom[{{$itemc.cdc_id}}][cdc_not_required]" id="notreq2{{$itemc.cdc_id}}" onclick="process2({{$itemc.cdc_bsn_id}},{{$itemc.cdc_id}});" {{if $itemc.cdc_not_required eq 1 }} checked="checked" {{/if}} /> 
     <p id="myElem2{{$itemc.cdc_id}}" style="display:none;"></p>
     </td>
  <td> {{$itemc.cdc_doc_name}} </td>
 {{if !empty($ipad)}} 
    <td style="text-align:left;"><a href="{{$BASE_URL}}{{$FILE_PATH}}files/document_check_list_files/{{$itemc.cdc_file_name}}" class="action_checklist" title="{{$itemc.cdc_file_name}}" target="_blank">{{$itemc.cdc_file_name|truncate:"40"}}</a></td>
   
    {{else}}
   <td style="text-align:left;"><a href="javascript:parent.modelviewimages('{{$BASE_URL}}{{$FILE_PATH}}files/document_check_list_files/{{$itemc.cdc_file_name}}')" class="action_checklist" title="{{$item.doc_file_name}}">{{$itemc.cdc_file_name|truncate:"40"}}</a></td>
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
   <a href="javascript:RequestcheckListIframe('adddoc_checklistmini','','19','');" class="btn" >
    Add New Document </a> &nbsp; &nbsp;
      <strong> <span style="border:1px solid #AAA; padding:4px;"> Task List {{$done19}}/{{$tot19}} </span> </strong> &nbsp; &nbsp;
      <input type="button" value="Add Tasks" onclick="requestAddTaskProposal(19);" />
      <input type="button" value="Load Proposal Task List" onclick="requestAllTasksProposal(0,19);" />
      <input type="button" value="Show Hide Proposal Task List" onclick="javascript:parent.toggleDiv('myContent19');" />
   </td>
   
  </tr>
  </form>
</table>
<table width="100%" >  
    <tr> <td>  <div id="taskmsgproposal" style="color:#FF6600;" align="left"></div> </td> </tr>
    <tr> <td> <div id="AllTaskDivProposal19"></div> </td> </tr>
    <tr> <td> <div id="editTaskDivProposal" align="left"></div> </td> </tr>
</table>
{{/if}}