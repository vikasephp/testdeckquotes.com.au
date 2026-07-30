<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}js/ckeditor2/ckeditor.js"></script>
 <script type="text/javascript" src="{{$BASE_URL}}js/ckeditor2/samples/js/sample.js"></script>
 <script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<link rel="stylesheet" href="{{$BASE_URL}}js/datalist/styledatalist.css"/>

{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

	<!-- Load jQuery -->
<!--<script type="text/javascript" src="http://www.google.com/jsapi"></script>
<script type="text/javascript">
	google.load("jquery", "1");
</script>-->

<style>
#emllib {width:98%; padding:10px;  border-collapse:collapse;}
#emllib th { border:1px solid #CCC !important; border-collapse:collapse; font-size:14px; text-align:left;}
#emllib td { border:1px solid #CCC !important; border-collapse:collapse;}
</style>

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<div align="center" style="min-height:350px;">
    <h3 class="page-title">{{$title}}</h3>    
    {{if $opr}}
	<div align="center" style="min-height:350px; padding-top:200"><h3>Success...!</h3></div>
    {{else}}

<form name="detail" method="post" action="{{$XFA.detail}}" enctype="multipart/form-data">
<input type="hidden" name="emaillibrary[eml_id]" value="{{$detail.$ID}}" id="eml_id"/>
<input type="hidden" name="emaillibrary[eml_code]" value="{{$detail.eml_code}}" >

    <table id="emllib" cellpadding="0" cellspacing="0" style="width:98% !important; border:1px solid #CCC;">

        <tr>
            <th>Old Id:</th>
            <td><input type="text" name="emaillibrary[eml_old_id]" value="{{$detail.eml_old_id}}"/></td>
            <th>Email Type:</th>
            <td><select name="emaillibrary[eml_email_type]" class="lrg" style="width:220px;">
            	<option value="General" {{if $detail.eml_email_type == 'General'}} selected="selected" {{/if}}>General</option>
				<option value="Project" {{if $detail.eml_email_type == 'Project'}} selected="selected" {{/if}}>Project</option>    	    
  			    </select></td>
            
        </tr>  
        
      <tr>
            <th>Business Stream:</th>
            <td><select name="emaillibrary[eml_business_stream]" class="lrg" style="width:220px;">
            	<option value="MS" {{if $detail.eml_business_stream == "MS"}} selected="selected" {{/if}}>MS</option>
				<option value="OP" {{if $detail.eml_business_stream == "OP"}} selected="selected" {{/if}}>OP</option> 
                <option value="RE" {{if $detail.eml_business_stream == "RE"}} selected="selected" {{/if}}>RE</option>    	    
  			    </select></td>
            <th>Email Category:</th>
            <td><select name="emaillibrary[eml_ie_email]" class="lrg" style="width:220px;">
            	<option value="Internal" {{if $detail.eml_ie_email == 'Internal'}} selected="selected" {{/if}}>Internal</option>
				<option value="External" {{if $detail.eml_ie_email == 'External'}} selected="selected" {{/if}}>External</option>    	    
  			    </select></td>
            
        </tr>  
      
          
         <tr>
         <th>Email Variables:</th> 
         <td> First Name =>[first name], Last name =>[last name],&nbsp Mobile =>[mobile],  <br /> 
         Block =>[block],&nbsp Section =>[section],&nbsp Suburb =>[suburb], Address=>[address] <br /> Designer=>[designer]</td>
         <th> Status </th> 
         <td>
         
         {{if $group eq 'QA' || $group eq 'Administrators'}}
         <select name="emaillibrary[eml_status]" class="lrg" style="width:220px;">
            	<option value="InActive" {{if $detail.eml_status == 'InActive'}} selected="selected" {{/if}}><span style="color:#F00;">InActive</span></option>
				<option value="Active" {{if $detail.eml_status == 'Active'}} selected="selected" {{/if}}>Active</option>    	    
  		 </select>
         {{else}}
         		{{if $detail.eml_status == 'Active'}}
         			<span style="color: #0C0; font-size:16px;"> {{$detail.eml_status}}</span>
                {{else}}
                	<span style="color:#F00; font-size:16px;"> {{$detail.eml_status}}</span>
                    <input type="hidden" name="emaillibrary[eml_status]" value="InActive" >
                {{/if}}    
                
                {{if empty($detail.eml_status)}} <span style="color:#F00; font-size:16px;">Inactive</span> {{/if}}
                
         {{/if}}
         </td>
         </tr>
         <tr> <td> Subject </td>
         <td colspan="3"><input type="text" name="emaillibrary[eml_subject]" value="{{$detail.eml_subject}}"  style="width:550px;" /> </td>
         </tr>
           
		<tr>
                <th>Email content:</th>
                <td width="870px" colspan="3" >
                <table  width="870"  border="0" ><tr><td style="border:0px solid #CCC !important;">
                <textarea cols="100" id="editor"  name="emaillibrary[eml_email_content]" rows="20"  >{{$detail.eml_email_content}}</textarea>    
                </td></tr></table>
                </td>
         </tr>
            
            
<!--	  <tr>
            <th>Email Name:</th>
            <td colspan="3"><input type="text" name="emaillibrary[eml_name]" value="{{$detail.eml_name}}" style="width:750px;"/></td>
      </tr>-->
            
      <tr>
         <th>Owner: </th>
            <td>
            <select name="emaillibrary[eml_owner]" class="lrg" style="width:220px;">
            {{foreach from = $users key="key" item="item" }}
            
            	 <option value="{{$item.user_name}}" {{if  $item.user_name eq $detail.eml_owner}} selected="selected" {{/if}}>{{$item.user_name}}</option>
            	<!--<option value="Administrators" {{if $detail.eml_owner == "Administrators"}} selected="selected" {{/if}}>Administrators</option>
				<option value="Users"     {{if $detail.eml_owner == "Users"}} selected="selected" {{/if}}>Users</option> 
                <option value="Employees" {{if $detail.eml_owner == "Employees"}} selected="selected" {{/if}}>Employees</option> 
                <option value="Customers" {{if $detail.eml_owner == "Customers"}} selected="selected" {{/if}}>Customers</option>-->
            {{/foreach}}    
      		    </select>
            </td>
            <th> Link Uid </th>
            <td>
              <input type="text" name="emaillibrary[eml_link_uid]" value="{{$detail.eml_link_uid}}"/>   
            </td>
        </tr>

        <tr>
            <!--<th>Project Docs</th>
            <td>
    <div class="bsearch_scroll_div" style="width:360px;">
       <ul style="margin: 0; padding: 0;">
       {{foreach from = $docdata key="key" item="item" }}
       
        <li><input type="checkbox" name="emaillibrary[bsn_document][]" value="{{$item.doc_file_name}}|{{$item.admin_doc_name}}" >{{$item.admin_doc_name}}</li> 
        {{/foreach}} 
       </ul>
    </div>
            </td>
            -->
   <!--         <th>Template Docs</th>
            <td colspan="3">
           <div class="bsearch_scroll_div" style="width:700px;">
           <ul style="margin: 0; padding: 0;">
           {{foreach from = $templatedocs key="key" item="item" }}
           
<li><input type="checkbox" name="emaillibrary[template_docs][]" value="{{$item.dhd_name2}}" {{foreach from = $templ key='k' item='m'}} {{if $item.dhd_name2 eq $m}} checked="checked" {{/if}} {{/foreach}}             >
          {{$item.dh_title}}</li> 
          
           {{/foreach}} 
           </ul>
           </div>

            
            </td>-->
           
        </tr> 
        
        <tr>
     <th> <a href="javascript:appendRowTempDoc()"  value="Add New">Add New Template Document </a> </th>
        <td> 
        <div id="lptask">
       </div>
        <datalist id='templatedocs'>
 
        {{foreach from=$templatedocs key="key3" item="item3"}}
        <option value="{{$item3.dhd_name2}}">{{$item3.dh_title}} </option>
        {{/foreach}}
        </datalist>
       
<script src="{{$BASE_URL}}js/datalist/datalist.polyfill.min.js"></script>
        </td>
        <td colspan="2"> </td>
        </tr>
        
        
        
<!--       	<tr>
         <th>QA?: </th>
            <td>
            <select name="emaillibrary[eml_qa]" class="lrg" style="width:220px;">
            	<option value="No" {{if $detail.eml_qa == "No"}} selected="selected" {{/if}}>No</option>
				<option value="Yes" {{if $detail.eml_qa == "Yes"}} selected="selected" {{/if}}>Yes</option> 
  			 </select>
            </td>
            <th> Singnature:</th>
            <td>
              <select name="emaillibrary[eml_signarure_block]" class="lrg" style="width:220px;">
            {{foreach from=$signature key="key" item="item"}}
            <option value="{{$item.es_name}}" {{if $item.es_name == $detail.eml_signarure_block}} selected="selected" {{/if}}>{{$item.es_name}}</option>
            {{/foreach}} 
            </td>
        </tr>-->
        
 
        
<!--		<tr>
         <th>Project Phase </th>
            <td>
            <select name="emaillibrary[eml_phase]" class="lrg" style="width:220px;">
            	<option value="Enquiry" {{if $detail.eml_phase == "Enquiry"}} selected="selected" {{/if}}>Enquiry</option>
				<option value="Planning Assesment" {{if $detail.eml_phase == "Planning Assesment"}} selected="selected" {{/if}}>Planning Assesment</option> 
                
                <option value="Design" {{if $detail.eml_phase == "Design"}} selected="selected" {{/if}}>Design</option>
               	<option value="Proposal Agreement" {{if $detail.eml_phase == "Proposal Agreement"}} selected="selected" {{/if}}>Proposal Agreement</option>
                <option value="Submission" {{if $detail.eml_phase == "Submission"}} selected="selected" {{/if}}>Submission</option>     
  			 </select>
            </td>
            <th> </th>
            <td>
             
            </td>
        </tr>-->

        <tr> 
        <td colspan="2" style="text-align:center;">
         <input type="submit" name="subAddDetail" value="Save" class="vsml" />
     <input type="button" name="btnCancelDetail" value="Cancel" onclick="javascript:parent.$.fancybox.close();" class="vsml" />

        </td>
        </tr>
 		</table>

      </form>
       <script type="text/javascript">
 				var x=1;
				function appendRowTempDoc()
				{
					
					var nm = "emaillibrary[template_docs]["+ x++ +"]";
				    var input =  $("<input type = 'text' list='templatedocs' name="+ nm+"><br>");
					input.css({'width':'550px','margin-left':'5px'});
					$('#lptask').append(input);
				}
				
								
 </script>
      
      
	<script type="text/javascript" language="javascript" >
        var frmvalidator  = new Validator("detail");
			frmvalidator.EnableMsgsTogether();
			frmvalidator.addValidation("{{$TABLE}}[sftype_id]","dontselect=0", "Please select type.");
			frmvalidator.addValidation("{{$TABLE}}[sf_title]","req", "Please specify title.");
			frmvalidator.addValidation("{{$TABLE}}[sf_body]","req", "Please specify formula.");
    </script>
   {{/if}} 
</div>
<script>
	initSample();
</script>