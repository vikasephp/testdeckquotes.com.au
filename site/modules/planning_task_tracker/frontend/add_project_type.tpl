<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />

{{if $opr}}
<script type="text/javascript">
window.location.href = "{{$BASE_URL}}planning_task_tracker.view_project_type";
</script>
{{/if}}

<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
    <h3 class="page-title">Add/Edit New Project Type Option</h3>    
   
   
<form name="detail" method="post" action="{{$XFA.add_task}}"  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="type[pt_id]" value="{{$detail.pt_id}}" />
   
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
    <tr>
     <th>Project Type Option </th>
     <td>
          <input type="text"  name="type[pt_option]" style ="width:700px" value="{{$detail.pt_option}}" />
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
		window.location.href = "{{$BASE_URL}}planning_task_tracker.view_project_type";
		}
	</script>
    
	<script type="text/javascript" language="javascript" >
        var frmvalidator  = new Validator("detail");
			frmvalidator.EnableMsgsTogether();
			frmvalidator.addValidation("task[wt_task_name]","req", "Please specify task.");
			
    </script>
</div>