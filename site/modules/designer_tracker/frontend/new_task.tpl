<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);

//window.location.href = "{{$BASE_URL}}designer_tracker.view_task/dt_id/{{$dt_id}}";
</script>
{{/if}}

<div align="center" style="min-height:350px; padding-top:10px;">
    <h3 class="page-title">Add/Edit New Task</h3>    
   
   
<form name="detail" method="post" action="{{$XFA.new_task}}"  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="task[tdt_id]" value="{{$detail.tdt_id}}" />
    <input type="hidden" name="tdt_id" value="{{$detail.tdt_id}}" />
    <input type="hidden" name="task[tdt_dt_id]" value="{{$dt_id}}" />
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
   <tr>
     <th>Checklist Id </th>
     <td><select name="task[tdt_cheklist_no]" style="width:300px;"/>
          
           {{foreach from=$cndata key="key" item="item"}}
           <option value="{{$item.dt_checklist_no}}"   {{if  $detail.tdt_checklist_no == $item.dt_checklist_no}}selected{{/if}}>{{$item.dt_checklist_no}}</option>
           
           {{/foreach}}
        </select>  
          
      </td>
    </tr>
   
    <tr>
     <th>Task Description </th>
     <td>
          <input type="text"  name="task[tdt_task_desc]" style ="width:700px" value="{{$detail.tdt_task_desc}}" />
      </td>
    </tr>
   
   <tr>
     <th>Assignee </th>
     <td>
      <select name="task[tdt_task_assignee]">
          <option value="">Please Select</option>
         {{foreach from=$teamData key="keyc" item="itemc"}}
        <option value="{{$itemc.de_name}}" {{if $itemc.de_name  eq $detail.tdt_task_assignee}} selected="selected" {{/if}}> 
             {{$itemc.de_name}}
            </option>
        {{/foreach}}
       </select>
       
     
     </td>
    </tr>
   
    <tr>
     <th>Assigner</th>
     <td><input  type="text" name="task[tdt_task_assigner]"  value="{{$user_name}}" style="width:700px;" /> </td>
    </tr>
   
   <tr>
     <th>Due Date</th>
     <td><input  type="text" name="task[tdt_due_date]"  value="{{$detail.tdt_due_date}}"  class="w16em dateformat-d-ds-m-ds-Y dtpic" /> </td>
    </tr>
   <tr>
     <th>Status </th>
     <td><select name="task[tdt_status]" style="width:300px;"/>
                 <option value="OPEN"   {{if  $detail.tdt_status == 'OPEN'}}selected{{/if}}>OPEN</option>
                 <option value="IN PROGRESS"   {{if  $detail.tdt_status == 'IN PROGRESS'}}selected{{/if}}>IN PROGRESS</option>
                 <option value="AWAITING" {{if  $detail.tdt_status == 'AWAITING'}}selected{{/if}}>AWAITING</option>
                 <option value="FEEDBACK" {{if  $detail.tdt_status == 'FEEDBACK'}}selected{{/if}}>FEEDBACK</option>
                 <option value="COMPLETE" {{if  $detail.tdt_status == 'COMPLETE'}}selected{{/if}}>COMPLETE</option>
        </select>  
    </td>
    </tr>  
    
       <tr>
     <th>Task Type</th>
     <td><select name="task[tdt_task_type]" style="width:300px;"/>
         <option value="Client Feedback"   {{if  $detail.tdt_status == 'Client Feedback'}}selected{{/if}}>Client Feedback</option>
         <option value="FDM"   {{if  $detail.tdt_status == 'FDM'}}selected{{/if}}>FDM</option>
         <option value="IDM" {{if  $detail.tdt_status == 'IDM'}}selected{{/if}}>IDM</option>
         <option value="Inclusions Redraw" {{if  $detail.tdt_status == 'Inclusions Redraw'}}selected{{/if}}>Inclusions Redraw</option>
         <option value="Internal Feedback" {{if  $detail.tdt_status == 'Internal Feedback'}}selected{{/if}}>Internal Feedback</option>
         <option value="Planning Redraw" {{if  $detail.tdt_status == 'Planning Redraw'}}selected{{/if}}>Planning Redraw</option>
         <option value="Proposal Redraw" {{if  $detail.tdt_status == 'Proposal Redraw'}}selected{{/if}}>Proposal Redraw</option>
         <option value="Redesign" {{if  $detail.tdt_status == 'Redesign'}}selected{{/if}}>Redesign</option>
        </select>  
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
		function closepop()
		{
		setTimeout('parent.close_win();', 500);
		//window.location.href = "{{$BASE_URL}}designer_tracker.view_task/dt_id/{{$dt_id}}";
		}
	</script>
    
	<script type="text/javascript" language="javascript" >
        var frmvalidator  = new Validator("detail");
			frmvalidator.EnableMsgsTogether();
			frmvalidator.addValidation("task[dt_name]","req", "Please specify project.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_company_name]","req", "Please specify company name.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_contact_name]","req", "Please specify contact name.");
    </script>
</div>