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
    <h3 class="page-title">Project Detail Page</h3>    
   
   
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="task[pd_id]" value="{{$detail.pd_id}}" />
    <input type="hidden" name="pd_id" value="{{$detail.pd_id}}" />
   
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
    <tr>
     <th>Leasee Names: </th>
     <td>	
         <input type="text"  name="task[pd_leases_name]" style ="width:700px" value="{{$detail.pd_leases_name}}" />
      </td>
      </td>
    </tr>
   
   <tr>
     <th>Project Type:</th>
     <td>
          <input type="text"  name="task[pd_project_type]" style ="width:700px" value="{{$detail.pd_project_type}}" />
      </td>
    </tr>
   
   <tr>
     <th>Address:</th>
     <td> <input type="text" name="task[pd_address]" style ="width:700px" value="{{$detail.pd_address}}" />  </td>
    </tr>
   
   <tr>
     <th>Block:</th>
     <td>
          <input type="text"  name="task[pd_block]" style ="width:700px" value="{{$detail.pd_block}}" />
      </td>
    </tr>
   
   
    <tr>
     <th>Section:</th>
     <td>
          <input type="text"  name="task[pd_section]" style ="width:700px" value="{{$detail.pd_section}}" />
      </td>
    </tr>
     
     <tr>
     <th>Crown Lease Qualified:</th>
     <td>
          <input type="text"  name="task[pd_crown_lease_qual]" style ="width:700px" value="{{$detail.pd_crown_lease_qual}}" />
      </td>
    </tr> 
     
     <tr>
     <th>District Policy: </th>
     <td>
          <input type="text"  name="task[pd_district_policy]" style ="width:700px" value="{{$detail.pd_district_policy}}" />
      </td>
    </tr>  
     
      <tr>
     <th>Zone Policy: </th>
     <td>
          <input type="text"  name="task[pd_zone_policy]" style ="width:700px" value="{{$detail.pd_zone_policy}}" />
      </td>
    </tr>    
    
     <tr>
     <th>Lease Variation Policy:</th>
     <td>
          <input type="text"  name="task[pd_le_var_policy]" style ="width:700px" value="{{$detail.pd_le_var_policy}}" />
      </td>
    </tr>  
    
     <tr>
     <th>Subdivision Policy: </th>
     <td>
          <input type="text"  name="task[pd_sub_div_policy]" style ="width:700px" value="{{$detail.pd_sub_div_policy}}" />
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
		frmvalidator.addValidation("task[wt_task_name]","req", "Please specify task.");
	</script>
</div>