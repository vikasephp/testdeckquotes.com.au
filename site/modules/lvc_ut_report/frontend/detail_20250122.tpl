<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />

{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<div align="center" style="min-height:350px;">
    <h3 class="page-title">{{$title}}</h3>    
   
<form name="detail" method="post" action="{{$XFA.detail}}"  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
    <tr>
     <th>Type </th>
     <td><select name="{{$TABLE}}[lv_type]">
     <option value="0">Please Select</option>
     {{foreach from=$typedetail key="key2" item="item2"}}
     <option value="{{$item2.lt_id}}" {{if $item2.lt_id eq $detail.lv_type}} selected="selected" {{/if}}>{{$item2.lt_option}}</option>
     {{/foreach}}
     </select></td>
    </tr>
   
     <tr>
     <th>Payment Option</th>
     <td><input  type="text" name="{{$TABLE}}[lv_payment_option]"  value="{{$detail.lv_payment_option}}" style="width:700px;" /> </td>
     </tr>
   
     <tr>
     <th>Project</th>
     <td>
   	<datalist id='project'>
           {{foreach from=$projdetail key="key3" item="item3"}}
            <option value="{{$item3.bsn_name}}" {{if $bsnid eq $item3.bsn_id}} selected="selected" {{/if}}>
            {{$item3.bsn_name}}
            </option>
            {{/foreach}}
  	 </datalist>
         <input type="text" list = 'project' name="{{$TABLE}}[lv_project_address]" style ="width:700px" value="{{$detail.lv_project_address}}" />
      </td>
    </tr>
   
     <tr>
     <th>LVC Type</th>
     <td>
     <select name="{{$TABLE}}[lv_lvc_type]">
     <option value="0">Please Select</option>
     {{foreach from=$lvcdetail key="key4" item="item4"}}
     <option value="{{$item4.lv_id}}" {{if $item4.lv_id eq $detail.lv_lvc_type}} selected="selected" {{/if}}>{{$item4.lv_option}}</option>
     {{/foreach}}
     </select> 
     </td>
     </tr>  
     
     <tr>
     <th>Fee $</th>
     <td><input  type="text" name="{{$TABLE}}[lv_fee]"  value="{{$detail.lv_fee}}" style="width:700px;" /> </td>
     </tr>  
      
   <!--  <tr>
     <th>Report Link</th>
     <td><input  type="text" name="{{$TABLE}}[lv_report_link]"  value="{{$detail.lv_report_link}}" style="width:700px;" /> </td>
     </tr> 
-->      
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
		frmvalidator.addValidation("{{$TABLE}}[wa_project]","req", "Please specify project.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_company_name]","req", "Please specify company name.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_contact_name]","req", "Please specify contact name.");
        </script>
</div>

<script>
	initSample();
</script>