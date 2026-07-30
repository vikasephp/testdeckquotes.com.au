<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />

{{if $opr eq true}}

<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<div align="center" style="min-height:350px;">
    <h3 class="page-title">{{$title}}</h3>    
   
<form name="detail" method="post" action="{{$XFA.detail}}"  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.er_id}}" />
   
   
      
     <tr>
     <th>Email Source</th>
     <td><select name="{{$TABLE}}[er_email_source]" required >
     <option value="">Please Select</option>
    <option value="accounts@cgfb.com.au" {{if $detail.er_email_source eq 'accounts@cgfb.com.au'}} selected="selected" {{/if}}>accounts@cgfb.com.au</option>
     <option value="resourcemanager@cgfb.com.au" {{if $detail.er_email_source eq 'resourcemanager@cgfb.com.au'}} selected="selected" {{/if}}>resourcemanager@cgfb.com.au</option>
	  </select>
      </td>
     </tr>
   
     <tr>
     <th>Sender Name</th>
     <td><input  type="text" name="{{$TABLE}}[er_customer_name]"  value="{{$detail.er_customer_name}}" style="width:700px;" /> </td>
     </tr>  
     
     <tr>
     <th>Sender Email</th>
     <td><input  type="text" name="{{$TABLE}}[er_customer_email]"  value="{{$detail.er_customer_email}}" style="width:700px;" /></td>
     </tr>  
     
     <tr>
     <th>Email Subject</th>
     <td><input  type="text" name="{{$TABLE}}[er_email_subject]"  value="{{$detail.er_email_subject}}" style="width:700px;" /></td>
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
         <input type="text" list = 'project' name="{{$TABLE}}[er_project]" style ="width:700px" value="{{$detail.er_project}}" />
      </td>
    </tr>
     
     
     <tr>
     <th>Email Type</th>
     <td>
     <select name="{{$TABLE}}[er_response_type]">
     <option value="0">Please Select</option>
     {{foreach from=$typedetail key="key2" item="item2"}}
     <option value="{{$item2.et_id}}" {{if $item2.et_id eq $detail.er_response_type}} selected="selected" {{/if}}>{{$item2.et_option}}</option>
     {{/foreach}}
     </select>
     </td>
     
     
     <tr>
     <th>Date of Last Sender Email</th>
     <td><input type="text" name="{{$TABLE}}[er_last_email_date]" value="{{$detail.er_last_email_date}}" class="w16em dateformat-d-ds-m-ds-Y dtpic" /></td>
     </tr> 
     
     <tr>
     <th>Response Status</th>
     <td>
     <select name="{{$TABLE}}[er_response_status]">
     <option value="0">Please Select</option>
     {{foreach from=$statusdetail key="key" item="item"}}
     <option value="{{$item.st_id}}" {{if $item.st_id eq $detail.er_response_status}} selected="selected" {{/if}}>{{$item.st_option}}</option>
     {{/foreach}}
     
     </select>
     </td>
     </tr>
     
     
     <tr>
     <th>Response Date</th>
     <td><input  type="text" name="{{$TABLE}}[er_response_date]"  value="{{$detail.er_response_date}}"  class="w16em dateformat-d-ds-m-ds-Y dtpic" /></td>
     </tr> 
     
     <tr>
     <th>Priority Level</th>
     <td>
     <select name="{{$TABLE}}[er_priority]">
     <option value="0">Please Select</option>
     
     <option value="High" {{if $detail.er_priority eq 'High'}} selected="selected" {{/if}}>High</option>
	 <option value="Medium" {{if $detail.er_priority eq 'Medium'}} selected="selected" {{/if}}>Medium</option>
     <option value="Low" {{if $detail.er_priority eq 'Low'}} selected="selected" {{/if}}>Low</option>  
     
     </select>
     </td>
     </tr>
      
     <tr>
     <th>Responsible Person</th>
     <td><input  type="text" name="{{$TABLE}}[er_responsible_person]"  value="{{$detail.er_responsible_person}}" style="width:700px;" /></td>
     </tr>
      
     <tr>
     <th>Upload Email Snapshot</th>
     <td><input type="file" name="snapshot" /></td>
     </tr>
      
      <tr>
     <th>Upload Response Snapshot</th>
     <td><input type="file" name="response_snapshot" />
     {{$detail.er_response_snapshot}}
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
		frmvalidator.addValidation("{{$TABLE}}[wa_project]","req", "Please specify project.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_company_name]","req", "Please specify company name.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_contact_name]","req", "Please specify contact name.");
        </script>
</div>

<script>
	initSample();
</script>