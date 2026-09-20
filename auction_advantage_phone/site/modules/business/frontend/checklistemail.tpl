<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />

<script type="text/javascript" src="{{$BASE_URL}}js/default.js"></script>
<script type="text/javascript">
function attach2()
	{
	var name = "NULL";
	var inp = document.getElementById('fileElementId');
	for (var i = 0; i < inp.files.length; ++i) {
  var name = inp.files.item(i).name; 
}
	if(name == 'NULL')
		{
		alert("Please select files.");
		}else{	
	document.send_tasks_email.submit();
		}
	}
</script>

<div>
 <h3 class="page-title">{{$title}}</h3>
 <table cellpadding="0" cellspacing="0" width="100%" border="0" id="product-table">
  <form name="send_tasks_email" action="" method="post" enctype="multipart/form-data">
 <tr><td width="80%" colspan="2">{{if $sendcount > 0}}<div align="center" style="color:#006600; font-size:15px;">Email has been sent successfully to {{$sendcount}} recipient(s).</div>{{/if}}
 {{if $error}}<div align="center" style="color: #FF0000; font-size:15px;">{{$error}}</div>{{/if}}
 </td></tr>  
    <tr>
    <td width="20%" valign="top">
    	<table width="100%" cellpadding="0" cellspacing="0" id="tasklisttable">
        	<tr><th valign="top">Customers</th></tr>
            {{foreach from=$custdata key="key" item="item"}}
            <tr><td><input type="checkbox" name="{{$TABLE}}[buyers][]" value="{{$item.bcust_fname}}|{{$item.bcust_lname}}|{{$item.bcust_misc_email1}}" />&nbsp;&nbsp;{{$item.bcust_fname}} {{$item.bcust_lname}}</th></tr>
            {{/foreach}}
        </table>
    </td>
    <td width="80%" style="padding-left:20px;">
      <table width="80%" cellpadding="0" cellspacing="0" id="tasklisttable">
        <tr><th>Variables: </th><td>{{foreach from=$email_temp_vars_buyers key="key" item="item" }}&nbsp;<input type="text" readonly="readonly" value="{{$item}}" />&nbsp;{{/foreach}}</td></tr>
         <tr><th>Subject: </th><td><input type="text" name="{{$TABLE}}[subject]" style="width:620px;" value="{{$subject}}" /></td></tr>
          <tr><th>Message: </th><td>
          <table id="none-table22"><tr><td>{{tinymce InstanceName="$TABLE[email_body]" class="email_body" Value=$body Cols="140"}}</td></tr></table>
          </td></tr> 
        <tr><th>Attachment: </th><td>
          <div id="emailattachment">
          		{{foreach from=$checklistbusdocs item="item" key="key"}}
                <div><input type="checkbox" name="{{$TABLE}}[attachments][]" value="{{$BASE_URL}}{{$FILE_PATH}}files/document_check_list_files/{{$item.doc_file_name}}" checked="checked" />&nbsp;<a href="javascript:parent.window.open('{{$BASE_URL}}{{$FILE_PATH}}files/document_check_list_files/{{$item.doc_file_name}}','mywindow');">{{$item.admin_doc_name}}</a></div>
                {{/foreach}} 
                {{foreach from=$busdocs item="item" key="key"}}
                <div><input type="checkbox" name="{{$TABLE}}[attachments][]" value="{{$BASE_URL}}{{$FILE_PATH}}files/business_documents/{{$item.bd_doc_name}}" checked="checked" />
               &nbsp;<a href="javascript:parent.window.open('{{$BASE_URL}}{{$FILE_PATH}}files/business_documents/{{$item.bd_doc_name}}','mywindow');" target="_top">{{$item.bd_type|default:$item.bd_doc_name}}</a></div>
                {{/foreach}}		
          </div>
         </td>
      </tr>
      
      <tr> <th> <input type="submit" value="Load Aproval Document" name="load_apr_doc" id ="load_apr_doc"  /> </th> <td> 
      
      {{foreach from=$docdata item="item" key="key"}}
      <div> 
      <input type = "checkbox" name="{{$TABLE}}[attachments][]" value="{{$BASE_URL}}{{$FILE_PATH}}files/business_documents/{{$item.bpd_doc_name}}"  /> {{$item.bpd_type}}
      </div>
      {{/foreach}}
      </div>
      </td> </tr>     
       <tr><th>Select File:</th><td><input type="file" name="eattach[]" id="fileElementId" multiple />&nbsp;<input type="button" onclick="javascript:attach2();" value="Attach" name="attach" /></td></tr>       
         <tr><td colspan="2"><input type="submit" value="Send" name="send_email" />&nbsp;<input type="button" value="Cancel" onclick="javascript:parent.$.fancybox.close();" /></td></tr>
        </table>
        </form>
	</td>
  </tr>
</table>
</table>
</div>
<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("send_tasks_email");
    frmvalidator.EnableMsgsTogether();
	
	//frmvalidator.setAddnlValidationFunction("checkCheckBoxes");
	
	//frmvalidator.addValidation("{{$TABLE}}[subject]","req", "Please specify subject");
    //frmvalidator.addValidation("$TABLE[email_body]","req", "Please specify body contents");
	//frmvalidator.addValidation("{{$TABLE}}[buyers]","selone_radio ", "Please select atlest one buyer.");
</script>