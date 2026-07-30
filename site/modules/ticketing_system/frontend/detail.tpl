<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<div align="center" style="min-height:350px;">
    <h3 class="page-title">Add/Edit Task Detail</h3>    
   
   
<form name="detail" method="post" action="{{$XFA.detail}}"  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="task_detail[td_id]" value="{{$detail.td_id}}" />
    <input type="hidden" name="task_detail[td_checklist_no]" style ="width:700px" value="{{$chk_no}}" />
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
  
    <tr>
     <th>Task Description</th>
     <td>
         <input type="text"  name="task_detail[td_task_desc]" style ="width:700px" value="{{$detail.td_task_desc}}" />
      </td>
    </tr>
   
    <tr>
     <th>Assign To</th>
     <td>
      <input type="text"  name="task_detail[td_assign_to]" style ="width:700px" value="{{$detail.td_assign_to}}" />
      </td>
    </tr>
   
    <tr>
     <th>Assign By</th>
     <td>
         <input type="text"  name="task_detail[td_assign_by]" style ="width:700px" value="{{$detail.td_assign_by}}" />
      </td>
    </tr>
   
     <tr>
        <th>Submitted Date </th>
        <td>
        <input type="text" name="task_detail[td_submitted_date]"  value="{{$detail.td_submitted_date}}" class="w16em dateformat-d-ds-m-ds-Y dtpic" />
        </td>
     </tr>
 
 
 	 <tr>
        <th>Due Date </th>
        <td>
        <input type="text" name="task_detail[td_due_date]"  value="{{$detail.td_due_date}}" class="w16em dateformat-d-ds-m-ds-Y dtpic" />
        </td>
     </tr>
   <tr>
        <th>Status </th>
        <td>
         <input type="text"  name="task_detail[td_status]" style ="width:700px" value="{{$detail.td_status}}" />
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
		}
	</script>
    
	<script type="text/javascript" language="javascript" >
        var frmvalidator  = new Validator("detail");
	frmvalidator.EnableMsgsTogether();
	frmvalidator.addValidation("task_detail[al_item]","req", "Please specify item.");
			//frmvalidator.addValidation("task_detail[cl_company_name]","req", "Please specify company name.");
			//frmvalidator.addValidation("task_detail[cl_contact_name]","req", "Please specify contact name.");
    </script>
</div>