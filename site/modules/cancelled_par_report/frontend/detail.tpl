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
     <th>Project Name</th>
     <td>
   	<datalist id='project'>
           {{foreach from=$projdetail key="key3" item="item3"}}
            <option value="{{$item3.bsn_name}}" {{if $bsnid eq $item3.bsn_id}} selected="selected" {{/if}}>
            {{$item3.bsn_name}}
            </option>
            {{/foreach}}
  	 </datalist>
    <input type="text" list = 'project' name="{{$TABLE}}[cp_project_name]" style ="width:700px" value="{{$detail.cp_project_name}}"  required="required"/>
      </td>
    </tr>
   
     <tr>
     <th>Appointment Name</th>
     <td><input  type="text" name="{{$TABLE}}[cp_app_name]"  value="{{$detail.cp_app_name}}" style="width:700px;" /> </td>
     </tr>
   
     <tr>
     <th>Appointment Date</th>
     <td>
     <input  type="text" name="{{$TABLE}}[cp_app_date]"  value="{{$detail.cp_app_date}}" style="width:200px;" class="w16em dateformat-d-ds-m-ds-Y" id="demo1" /> </td>
     </tr> 
     
      <tr>
     <th>Appointment Time</th>
     <td><input  type="text" name="{{$TABLE}}[cp_app_time]"  value="{{$detail.cp_app_time}}" style="width:700px;" /> </td>
     </tr>   
     
     <tr>
     <th>Location</th>
     <td><input  type="text" name="{{$TABLE}}[cp_location]"  value="{{$detail.cp_location}}" style="width:700px;" /> </td>
     </tr>  
     
     <tr>
     <th>Reason For Cancellation</th>
     <td><input  type="text" name="{{$TABLE}}[cp_reason_cancel]"  value="{{$detail.cp_reason_cancel}}" style="width:700px;" /> </td>
     </tr> 
     
     <tr>
     <th>New Appointment Date</th>
     <td><input  type="text" name="{{$TABLE}}[cp_new_date]"  value="{{$detail.cp_new_date}}" style="width:200px;" class="w16em dateformat-d-ds-m-ds-Y" id="demo3" /> </td>
     </tr> 
     
     <tr>
     <th>New Appointment Time</th>
     <td><input  type="text" name="{{$TABLE}}[cp_new_time]"  value="{{$detail.cp_new_time}}" style="width:200px;" class="w16em dateformat-d-ds-m-ds-Y" id="demo3" /> </td>
     </tr> 
    
    
      
    <tr>
     <th>Updated Location</th>
     <td><input  type="text" name="{{$TABLE}}[cp_updated_location]"  value="{{$detail.cp_updated_location}}" style="width:700px;" /> </td>
     </tr> 
     
     
     <tr>
     <th>Notes</th>
     <td><input  type="text" name="{{$TABLE}}[cp_notes]"  value="{{$detail.cp_notes}}" style="width:700px;" /> </td>
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

<script>
	initSample();
</script>