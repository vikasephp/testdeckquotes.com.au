<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}js/ckeditor2/ckeditor.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/ckeditor2/samples/js/sample.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<link rel="stylesheet" href="{{$BASE_URL}}js/datalist/styledatalist.css"/>

{{include file=$jdata}}
{{include file=$tiny_basic}}

<script>
		!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>

<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />

	<script type="text/javascript">
		$(document).ready(function() {
					
			$(".various1").fancybox({
				'width'				: '99%',
				'height'			   : '99%',
				'transitionIn'		 : 'elastic',
				'transitionOut'		: 'elastic',
				'scrolling'		    : 'yes',
				'hideOnOverlayClick'   : 'no',
				'type'				: 'iframe'
			});	
			
		});
		
		function open_popup(type, status, value) {
			let viewurl = '';
			if (type == 'email_response_popup') {
				viewurl = "{{$BASE_URL}}emaillibrary.email_response_popup" + "/status/" + status + "/value/" + value + "/random/" + Math.random();
			}
			$(document).ready(function () {
				$.fancybox({
					'width': '60%',
					'height': '50%',
					'autoScale': false,
					'transitionIn': 'elastic',
					'transitionOut': 'elastic',
					'speedIn': 300,
					'speedOut': 300,
					'overlayShow': true,
					'overlayColor': '#000',
					'hideOnOverlayClick': false,
					'hideOnContentClick': false,
					'type': 'iframe',
					'href': viewurl,
					'scrolling': 'yes'
				});
			});
		}
	</script>


<style>
#emllib {width:98%; padding:10px;  border-collapse:collapse;}
#emllib th { border:1px solid #CCC !important; border-collapse:collapse; font-size:14px;}
#emllib td { border:1px solid #CCC !important; border-collapse:collapse;}
</style>

{{if isset($email_sent_ok)}}
<script>
document.addEventListener("DOMContentLoaded", function () {
    open_popup('email_response_popup', "success", '{{$email_sent_ok}}');
});
</script>
{{/if}}
{{if isset($email_sent_error)}}
<script>
document.addEventListener("DOMContentLoaded", function () {
    open_popup('email_response_popup', "fail", '{{$email_sent_error}}');
});
</script>
{{/if}}

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<div align="center" style="min-height:350px;">
<h3 class="page-title">Compose Email</h3>    
<div style="float:right; margin-right:5%;">
 <input type="button" name="emllibrary" value="Back To Email Library" onclick="document.location.href='{{$BASE_URL}}emaillibrary.home'" />
 </div>
<form name="detail" method="post" action="" enctype="multipart/form-data">
         
          
 <table id="emllib" cellpadding="0" cellspacing="0" style="width:98% !important;">
 
  <tr>
                  <th width="20%">Select Template: </th>
                  <td>
                  
                  <select name="eml_template" id="eml_id">
                  <option value="0">Email Select Template </option>
                  {{foreach from = $emlibDetail key="ekay" item="eitem" }}
                  <option value="{{$eitem.eml_id}}" {{if $tid eq $eitem.eml_id}} selected="selected" {{/if}}>{{$eitem.eml_code}}</option>
                  {{/foreach}}
                  </select>
                  </td>
         </tr>
 
<!-- <tr> 
 <th> Select Project </th> 
 <td colspan="7">
  			<select name="projname" onchange="submit();">
                  <option value="0">Select Project </option>
                   {{foreach from=$projdetail key="key3" item="item3"}}
                    <option value="{{$item3.bsn_id}}" {{if $bsnid eq $item3.bsn_id}} selected="selected" {{/if}}>{{$item3.bsn_id}} - {{$item3.bsn_name}}</option>
                    {{/foreach}}
             </select>
  
 </td>
 </tr>-->
  
   <tr> 
 <th> Search Project or Customer Name<br /> and click on submit button </th> 
 <td colspan="7">

<datalist id='project'>
   {{foreach from=$projdetail2 key="key3" item="item3"}}
    <option value="{{$item3.bsn_id}} | {{$item3.bsn_name}} | {{$item3.bcust_fname}} {{$item3.bcust_lname}}" {{if $bsnid eq $item3.bsn_id}} selected="selected" {{/if}}>
    {{$item3.bsn_id}} - {{$item3.bsn_name}} | {{$item3.bcust_fname}} {{$item3.bcust_lname}}
    </option>
    {{/foreach}}
</datalist>
         <input type="text" list = 'project' name="projname1" style ="width:700px" value="{{$p_c_name}}" />
         <input type ="submit" name="psub" value="Submit"   />
 </td>
 </tr>
        
 	</table>


{{if $msg }}
    	
	<style>
    #emllib {width:98%; padding:10px;  border-collapse:collapse; margin-bottom:1%;}
    #emllib th { border:1px solid #CCC !important; border-collapse:collapse; font-size:12px; text-align:left;}
    #emllib td { border:1px solid #CCC !important; border-collapse:collapse; font-size:12px;}
    </style>

	<input type = "hidden" name = "emailData[eml_code]" value="{{$emldata.eml_code}}" />
    <input type = "hidden" name = "emailData[eml_ie_email]" value="{{$emldata.eml_ie_email}}" />

<div>
    <div style="float:right; margin-right:3%;font-size:18px; background: #FFC; border:1px solid #06C;  padding:4px; margin-bottom:3px;">Email Status: &nbsp;
    	{{if $emldata.eml_status eq 'InActive'}}
        	<span style="color:#F00;">Inactive</span>
        {{else}}
        	<span style="color:#090;">Active</span>
        {{/if}}
    </div> 
 <table id="emllib" cellpadding="0" cellspacing="0" style="width:98% !important; border:1px solid #CCC;">

 <tr><th>Email Code</th><td width="12%">{{$emldata.eml_code}}</td><th width="12%">Email Type</th><td width="12%">{{$emldata.eml_ie_email}}</td>
 <th>Business Stream</th><td>{{$emldata.eml_business_stream}}</td><th>Owner</th><td>{{$emldata.eml_owner}}</td></tr>
 <!--<tr>
 <th> To (Internal Email) </th>
 <td colspan="6"> 
     <div class="bsearch_scroll_div" style="width:660px;">
           <ul style="margin: 0; padding: 0;">
           {{assign var="counter" value=1}}
           {{foreach from = $emailcontacts key="key" item="item" }}
            
<li><input  type="checkbox" name="emailData[to][]" value="{{$item.ec_email_id}}|{{$item.ec_email_salutation}}" {{foreach from = $templ key='k' item='m'}} {{if $item.ec_email_id eq $m}} checked="checked" {{/if}} 
{{/foreach}} id="{{$counter}}"   />        
            {{$item.ec_contact_name}} - {{$item.ec_email_id}} </li> 
            {{assign var="counter" value= $counter+1}}
           {{/foreach}} 
          </ul>
    </div>
 
 </td>
 </tr>-->
 
  <tr>
  <th> To (Contact List) </th>
  <td colspan="7"> 
  <datalist id='contact'>
   {{foreach from=$contactdetail key="keyc" item="itemc"}}
    <option value="{{$itemc.cs_primary_email}}">{{$itemc.cs_first_name}} {{$itemc.cs_surname}} {{$itemc.cs_primary_email}}</option>
    {{/foreach}}
</datalist>
         <input type="text" list = 'contact' name="contact_list" style ="width:700px"  id="conlist" />  
             <input type ="button" name="psub" value="Add" onclick="add_contact()"   />
         <input type="text"  name="emailData[to_contact_list]" style ="width:700px" id="conto" />
   
	 <script language="javascript">
       function add_contact()
	{
	var e = document.getElementById("conlist").value;
	var t = document.getElementById("conto").value;
	document.getElementById("conto").value = e+" , "+t;	
	document.getElementById("conlist").value ='';
	}
	 </script>


 </td>
  
   </tr>
 
 
 <tr>
  <th> To (Other) </th>
  <td colspan="7"> <input type="text" name="emailData[to2]" id ="to" value="{{$emldata.toemail}}" placeholder="Enter email id(s) seperated by comma" style="width:700px;"   />
 </td>
  
   </tr>
 
 
 <tr>
 <th> Subject : </th>
 <td colspan="7"> 
 <input type="text" name="emailData[subject]" value="{{$subject}}" style="width:750px;"   />
 </td>
 </tr>
 
<!--  <tr>
 <th> Email Salutation : </th>
 <td colspan="6"> [Email Salutation] 
 <input type="text" name="emailData[emailsalutation]" value="{{$emldata.emailsalutation}}" style="width:750px;"   /> 
 </td>
 </tr>-->
 
<tr>
<th> Email Content </th>
<td colspan="7"> <textarea name="emailData[bsn_emcontent]" id="editor"  cols="100" rows="15"> {{$emldata.eml_email_content}}</textarea></td>
</tr>

<tr>
<th>Upload Image</th>
<td colspan="4"> <input type="file" name="image1" /> 

</td>

<!--<tr>
<th>Select Project Document </th>
<td colspan="7">
{{if !empty($docdata)}}
    <div class="bsearch_scroll_div" style="width:660px;">
       <ul style="margin: 0; padding: 0;">
       {{foreach from = $docdata key="key" item="item" }}
       
        <li><input type="checkbox" name="emailData[bsn_document][]" value="{{$item.doc_file_name}}|{{$item.admin_doc_name}}" >{{$item.admin_doc_name}}</li> 
        {{/foreach}} 
       </ul>
    </div>
 
 {{else}}
 	<span style="color:#F00;">There are no project documents uploaded for this Project</span>
 {{/if}} 
     
</td>
</tr>-->

<tr>
<th> {{if !empty($docdata)}} 
        <a href="javascript:appendRowProjDoc()"  value="Add New">Add New Project Document </a>
     {{else}}
     	Select Project Document
     {{/if}}   
         </th>
<td colspan="7">
		
        {{if !empty($docdata)}} 
       <div id="pdoc">
      
        <datalist id='projectdocs' >
  
        {{foreach from=$docdata key="key2" item="item2"}}
        <option value="{{$item2.doc_file_name}}|{{$item2.admin_doc_name}}">{{$item2.admin_doc_name}} </option>
        {{/foreach}}
   
        </datalist>
        
        </div>
        {{else}}
        	<span style="color:#F00;">There are no project documents uploaded for this Project</span>
        {{/if}}

</td>
</tr>

<tr>
<th>Select Template Document </th>
<td colspan="7">
	
    <div class="bsearch_scroll_div" style="width:660px;">
           <ul style="margin: 0; padding: 0;">
           {{assign var="counter" value=1}}
           {{foreach from = $templatedocs key="key" item="item" }}
            
<li>

<!--<input type="checkbox" name="emailData[template_docs][]" value="{{$item.dhd_name2}}" {{foreach from = $templ key='k' item='m'}} {{if $item.dhd_name2 eq $m}} checked="checked" {{/if}} 
{{/foreach}} id="{{$counter}}"   />-->
 
 <input type="checkbox" name="emailData[template_docs][]" value="{{$item.dhd_name2}}" id="{{$counter}}"   />       
            {{$item.dh_title}} </li> 
            {{assign var="counter" value= $counter+1}}
           {{/foreach}} 
          </ul>
    </div>
         
</td>
</tr>

<tr>
<th> <a href="javascript:appendRowTempDoc()"  value="Add New">Add New Template Document </a> </th>
<td colspan="7">

       <div id="lptask">
       </div>
        <datalist id='templatedocs'>
 
        {{foreach from=$templatedocs key="key3" item="item3"}}
        <option value="{{$item3.dhd_name2}}">{{$item3.dh_title}} </option>
        {{/foreach}}
        </datalist>
       
<script src="{{$BASE_URL}}js/datalist/datalist.polyfill.min.js"></script>
</td>
</tr>

<tr>
<th>Attachments</th>
<td colspan="3"> <input type="file" name="docs1" /> <input type="file" name="docs2" /><input type="file" name="docs3" /></td>
<th>Signature</th>
<td>
            <select name="emailData[eml_signarure_block]" class="lrg" >
            <option value="" selected="selected"> -- select --</option>
            {{foreach from=$signature key="key" item="item"}}
             <option value="{{$item.es_id}}" {{if $item.es_id eq $sign}} selected="selected" {{/if}}>{{$item.es_name}}</option>
             {{/foreach}}
</td>
</tr>

<tr>
<td colspan="8" align="center"> 
{{if $emldata.eml_status eq 'InActive'}}
<input type ="submit" name="send"  value="Send Email" disabled="disabled" style="cursor:not-allowed;" title="Status Inactive"  />
<input type ="submit" name="draft"  value="Save" disabled="disabled" style="cursor:not-allowed;" title="Status Inactive"  />
{{else}}
<input type ="submit" name="send"  value="Send Email"  />
<input type ="submit"  name="draft" value="Save"   />
<!--<input type ="submit" name="prev" value="Prev"   />-->
{{/if}}
</td>
</tr>
</table>

 
{{if $email_sent_ok}}<h2 style="color:#090; font-size:16px; margin-bottom:5px;">{{$email_sent_ok}}</h2> {{/if}}
{{if $email_sent_error}}<h2 style="color:red;font-size:16px;margin-bottom:5px;font-weight:bold;">{{$email_sent_error}}</h2> {{/if}}

   </div>
</div>

 {{/if}}

 </form>

 <script type="text/javascript">
 				var x=1;
				function appendRowTempDoc()
				{
					var nm = "emailData[template_docs1]["+ x++ +"]";
				    var input =  $("<input type = 'text' list='templatedocs' name="+ nm+"><br>");
					input.css({'width':'550px','margin-left':'5px'});
					$('#lptask').append(input);
				}
				
				var y=1;
				function appendRowProjDoc()
				{
					var nm = "emailData[bsn_document1]["+ y++ +"]";
				    var input =  $("<input type = 'text' list='projectdocs' name="+ nm+"><br>");
					input.css({'width':'550px','margin-left':'5px'});
					$('#pdoc').append(input);
				}
				
 </script>


   {{if $emldata.eml_ie_email eq 'Internal'}}   
	<script type="text/javascript" language="javascript" >
        var frmvalidator  = new Validator("detail");
			frmvalidator.EnableMsgsTogether();
			//frmvalidator.addValidation("emailData[eml_signarure_block]","req", "Please specify signature.")
			//frmvalidator.addValidation("emailData[to]","req", "Since this is Internal Email so you must specify internal email.");
   </script>
    {{/if}}
    
    {{if $emldata.eml_email_type eq 'Project'}}   
	<script type="text/javascript" language="javascript" >
        var frmvalidator  = new Validator("detail");
			frmvalidator.EnableMsgsTogether();
			//frmvalidator.addValidation("emailData[eml_signarure_block]","req", "Please specify signature.")
			//frmvalidator.addValidation("projname","dontselect=0", "Since email type is Project you must select the project .");
   </script>
    {{/if}}
    
    
</div>
<script>
	initSample();
</script>

<script type="text/javascript" src="{{$BASE_URL}}js/datalist/datalist.polyfill.min.js"></script>