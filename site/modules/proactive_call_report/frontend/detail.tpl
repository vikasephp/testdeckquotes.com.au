<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />


{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<div align="center" style="min-height:350px;">
    <h3 class="page-title">{{$title}}</h3>    
   
   
<form name="detail" method="post" action="{{$XFA.detail}}"  enctype="multipart/form-data">
<table id="list-table" width="90%">
    <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
   
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
  
     
   <tr>
   <th>Date</th>
   <td><input type="text"  name="{{$TABLE}}[pr_date]"  value="{{$detail.pr_date}}" class="w16em dateformat-d-ds-m-ds-Y" id="demo4" /></td>
   </tr> 
   
   <tr>
   <th>Time</th>
   <td><input type="text"  name="{{$TABLE}}[pr_time]"  value="{{$detail.pr_time}}"  /></td>
   </tr>
   
   <tr>
   <th>Project</th>
   <td>
   	<datalist id='project'>
           {{foreach from=$projdetail key="key3" item="item3"}}
            <option value="{{$item3.bsn_name}}" {{if $detail.pr_project_address eq $item3.bsn_name}} selected="selected" {{/if}}>
            {{$item3.bsn_name}}
            </option>
            {{/foreach}}
  	 </datalist>
         <input type="text" list = 'project' name="{{$TABLE}}[pr_project_address]" style ="width:700px" value="{{$detail.pr_project_address}}" />
      </td>
    </tr>
   
     
    <tr>
     <th>Call Result</th>
     <td>
   	    <select name="{{$TABLE}}[pr_call_result]" >
            {{foreach from=$crdetail  key="key2" item="item2"}}
            <option value="{{$item2.cr_id}}" {{if $detail.pr_call_result  eq $item2.cr_id}} selected="selected" {{/if}}>
            {{$item2.cr_name}}
            </option>
            {{/foreach}}
   	    </select>	
     </td>
    </tr>

    
    <tr>
     <th>Project Status</th>
     <td>
   	    <select name="{{$TABLE}}[pr_status]" >
            {{foreach from=$stdetail  key="key1" item="item1"}}
            <option value="{{$item1.pcr_id}}" {{if $detail.pr_status  eq $item1.pcr_id}} selected="selected" {{/if}}>
            {{$item1.pcr_status}}
            </option>
            {{/foreach}}
   	    </select>	
     </td>
    </tr>

     
   
   <tr>
   <th>File</th>
   <td><input type="file" name="file_wav" /></td>
   </tr>
   
    <tr>
   <th>Survey Result</th>
   <td><input type="file" name="survey_result" /></td>
   </tr>
   
    <tr>
     <th>User</th>
     <td>
   	    <select name="{{$TABLE}}[pr_user]" >
            {{foreach from=$userdetail  key="key4" item="item4"}}
            <option value="{{$item4.ec_contact_name}}" {{if $detail.pr_user eq $item4.ec_contact_name}} selected="selected" {{/if}}>
            {{$item4.ec_contact_name}}
            </option>
            {{/foreach}}
   	    </select>	
     </td>
    </tr>
  
    <tr>
   <th>Email Details</th>
   <td><input type="text"  name="{{$TABLE}}[pr_email_details]"  value="{{$detail.pr_email_details}}" style="width:700px;" /></td>
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
			frmvalidator.addValidation("{{$TABLE}}[wa_project]","req", "Please specify project.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_company_name]","req", "Please specify company name.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_contact_name]","req", "Please specify contact name.");
    </script>
</div>

