<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />

{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
//window.location.href = "{{$BASE_URL}}da_builder.home";
</script>
{{/if}}

<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
    <h3 class="page-title">Report Builder Admin</h3>    
   
   
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="rbadmin[ra_id]" value="{{$detail.ra_id}}" />
   
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
     <tr>
     <th>Order</th>
     <td>
          <input type="text"  name="rbadmin[ra_order]" style ="width:700px" value="{{$detail.ra_order}}" />
      </td>
    </tr>
   
   <tr>
     <th>Specifications</th>
     <td><textarea cols="150" rows="5" name="rbadmin[ra_specification]">{{$detail.ra_specification}}</textarea>  </td>
    </tr>
   
   <tr>
     <th>Status</th>
     <td>
          <input type="text"  name="rbadmin[ra_status]" style ="width:700px" value="{{$detail.ra_status}}" />
      </td>
    </tr>
   
   
    <tr>
     <th>Critria</th>
     <td>
          <input type="text"  name="rbadmin[ra_criteria]" style ="width:700px" value="{{$detail.ra_criteria}}" />
      </td>
    </tr>
     
     <tr>
     <th>Statement</th>
     <td>
          <input type="text"  name="rbadmin[ra_statement]" style ="width:700px" value="{{$detail.ra_statement}}" />
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
			//window.location.href = "{{$BASE_URL}}da_builder.home";
		}
	</script>
    
	<script type="text/javascript" language="javascript" >
      	var frmvalidator  = new Validator("detail");
		frmvalidator.EnableMsgsTogether();
		frmvalidator.addValidation("rbadmin[wt_task_name]","req", "Please specify task.");
	</script>
</div>