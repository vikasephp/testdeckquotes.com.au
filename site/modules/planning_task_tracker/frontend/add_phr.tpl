<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />

<!--{{if $opr}}
<script type="text/javascript">
window.location.href = "{{$BASE_URL}}planning_task_tracker.add_phr/bsn_id/{{$bsn_id}}";
</script>
{{/if}}-->

<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
    <h3 class="page-title">Add To Post HIA Design Report</h3>    
   
   
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<table id="list-table" width="100%">
      
<!-- {{if $opr}}<tr><th colspan="2">{{$opr}}</th></tr> {{/if}}-->
   
    <tr>
     <th>Request Option</th>
     <td>  <input type="hidden" name="bsn_id" value="{{$bsn_id}}" />
          <select name="request">
          <option value="Operations">Operations</option>
          <option value="Department">Department</option>
          <option value="Entities">Entities</option>
          <option value="Certifier">Certifier</option>
          </select>
      </td>
     </tr>
      
        
    <tr>
        <td colspan="2" style="text-align:center;">
          <input type="submit" name="subAddDetail" value="Save" class="vsml" />
          <input type="button" name="btnCancelDetail" value="Close" onclick="parent.$.fancybox.close();" class="vsml" />
        </td>
    </tr>
</table>

{{if $opr}} <div style="text-align:center; font-size:18px;">{{$opr}}</div> {{/if}}
</form>
    
   <!-- <script type="text/javascript">
		function closepop()
		{
		window.location.href = "{{$BASE_URL}}planning_task_tracker.home";
		}
	</script>-->
    
	<script type="text/javascript" language="javascript" >
        var frmvalidator  = new Validator("detail");
			frmvalidator.EnableMsgsTogether();
			frmvalidator.addValidation("task[wt_task_name]","req", "Please specify task.");
			
    </script>
</div>