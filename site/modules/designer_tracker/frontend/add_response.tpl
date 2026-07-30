<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />


{{if $opr}}
<script type="text/javascript">
//setTimeout('parent.close_win();', 500);

window.location.href = "{{$BASE_URL}}designer_tracker.view_comment/tc_task_id/{{$tc_task_id}}/dt_id/{{$dt_id}}";

</script>

{{/if}}

<div align="center" style="min-height:350px;"><br />
    <h3 class="page-title">Add/Edit Response</h3> <br />   
    
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="response[tc_id]" value="{{$detail.tc_id}}" />
    <input type="hidden" name="response[tc_task_id]" value="{{$tc_task_id}}" />
    <input type="hidden" name="response[dt_id]" value="{{$dt_id}}" />
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
    
   
   <tr>
     <th>Response : </th>
     <td><input  type="text" name="response[tc_response]"  value="{{$detail.tc_response}}" style="width:700px;" /> </td>
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
		//setTimeout('parent.close_win();', 500);
		window.location.href = "{{$BASE_URL}}designer_tracker.view_comment/tc_task_id/{{$tc_task_id}}/dt_id/{{$dt_id}}";
		}
	</script>
    
	<script type="text/javascript" language="javascript" >
        //var frmvalidator  = new Validator("detail");
	//		frmvalidator.EnableMsgsTogether();
	//		frmvalidator.addValidation("comment[dt_name]","req", "Please specify project.");
	//		
			
        </script>
</div>