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

<div align="center" style="min-height:350px;"><br /><br />
    <h3 class="page-title">{{$title}}</h3>    
   
   
<form name="detail" method="post" action="{{$XFA.detail}}"  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
     <tr>
        <th>Vehicle Make & Model</th>
        <td>
         <input type="text"  name="{{$TABLE}}[ve_make_model]" style ="width:700px" value="{{$detail.ve_make_model}}" />
        </td>
     </tr>
   
    <tr>
        <th>Vehicle Photo 1</th>
        <td><input type="file" name="veh_photo" /></td>
     </tr>
   
     <tr>
        <th>Vehicle Photo 2</th>
        <td><input type="file" name="veh_photo2" /></td>
     </tr>
     
       <tr>
        <th>Vehicle Photo 3</th>
        <td><input type="file" name="veh_photo3" /></td>
     </tr>
   
    <tr>
        <th>Registration Number</th>
        <td>
         <input type="text"  name="{{$TABLE}}[ve_reg_number]" style ="width:700px" value="{{$detail.ve_reg_number}}" />
        </td>
     </tr>
   
     <tr>
     <th>Registration Expire Date</th>
     <td>
     <input type="text" name="{{$TABLE}}[ve_reg_exp_date]"  value="{{$detail.ve_reg_exp_date}}" id="demo1" class="w16em dateformat-d-ds-m-ds-Y dtpic" /> 
     </td>
    </tr>
   
     <tr>
         <th>3rd Party Insurer</th>
        <td>
         <select name="{{$TABLE}}[ve_3rd_party_insurer]">
   
         
     <option value="">Please Select</option>
     {{foreach from = $tpdata key="key" item="item"}}
     <option value="{{$item.to_option}}" {{if $detail.ve_3rd_party_insurer eq $item.to_option }} selected="selected" {{/if}}>{{$item.to_option}}</option>
     {{/foreach}}
      </select>
         
        </td>
     </tr>
  

   
    <tr>
     <th>CTP Insurance</th>
     <td>
     <input type="text" name="{{$TABLE}}[ve_ctp_insurance]"  value="{{$detail.ve_ctp_insurance}}" /> 
     </td>
    </tr>
   
     <tr>
     <th>Insurance Policy Number</th>
     <td>
         <input type="text"  name="{{$TABLE}}[ve_insu_policy_number]" style ="width:700px" value="{{$detail.ve_insu_policy_number}}" />
      </td>
    </tr>
   
   <tr>
     <th>CTP Insurance Expire Date</th>
     <td>
     <input type="text" name="{{$TABLE}}[ve_ctp_insu_expire_date]"  value="{{$detail.ve_ctp_insu_expire_date}}" id="demo2" class="w16em dateformat-d-ds-m-ds-Y dtpic" /> 
     </td>
    </tr>
   
    <tr>
     <th>Maintenance Company</th>
     <td>
         <input type="text"  name="{{$TABLE}}[ve_maint_comp]" style ="width:700px" value="{{$detail.ve_maint_comp}}" />
      </td>
    </tr>
   
    <tr>
     <th>Last Maintenance Date</th>
     <td>
     <input type="text" name="{{$TABLE}}[ve_last_maint_date]"  value="{{$detail.ve_last_maint_date}}" id="demo4" class="w16em dateformat-d-ds-m-ds-Y dtpic" /> 
     </td>
    </tr>
  
   
   <tr>
     <th>Copy of Registration Document</th>
     <td><input type="file" name="co_reg_doc" /></td>
    </tr>
   
    
   <tr>
     <th>Copy of Insurance Document</th>
     <td><input type="file" name="co_insu_doc" /></td>
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
			frmvalidator.addValidation("{{$TABLE}}[ve_vehicle_name]","req", "Please specify vehicle name.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_company_name]","req", "Please specify company name.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_contact_name]","req", "Please specify contact name.");
    </script>
</div>