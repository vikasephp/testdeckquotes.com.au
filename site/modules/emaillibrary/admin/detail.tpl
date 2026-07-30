<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tabview/tabcontent.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/admin/screen.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/tabview/tabcontent.js">  </script>

  <script type="text/javascript" src="{{$BASE_URL}}js/ckeditor2/ckeditor.js"></script>
  <script type="text/javascript" src="{{$BASE_URL}}js/ckeditor2/samples/js/sample.js"></script>


<div align="center">

<h3 class="page-title">{{$title}}</h3>

<form name="detail" method="post" action="{{$XFA.detail}}" enctype="multipart/form-data">
<input type="hidden" name="emaillibrary[eml_id]" value="{{$detail.$ID}}" id="eml_id"/>
    <table id="product-table" cellpadding="0" cellspacing="0" style="width:98% !important; border:1px solid #CCC;">

        <tr>
            <th>Email Code:</th>
            <td><input type="text" name="emaillibrary[eml_code]" value="{{$detail.eml_code}}" style="width:200px;" readonly="readonly" placeholder="Auto Generated"/></td>
            <th>Internal or Ext. Email:</th>
            <td><select name="emaillibrary[eml_ie_email]" class="lrg" style="width:220px;">
            	<option value="Internal" {{if $detail.eml_ie_email == 'Internal'}} selected="selected" {{/if}}>Internal</option>
				<option value="External" {{if $detail.eml_ie_email == 'External'}} selected="selected" {{/if}}>External</option>    	    
  			    </select></td>
            
        </tr>    
         <tr>
         <th>Email Variables</th> 
         <td colspan="3"> First Name => [first name] , &nbsp Project Name => [Project Name], &nbsp Phase => [Phase], &nbsp Signature => [sender-email-signature] </td>
          
           
		<tr>
                <th>Email content:</th>
                <td width="870px" colspan="3">
                <table  width="870" id="none-table22"><tr><td>
                <textarea cols="120" id="editor"  name="emaillibrary[eml_email_content]" rows="20"  >{{$detail.eml_email_content}}</textarea>    
                </td></tr></table>
                </td>
            </tr>
		<tr>
            <th>Email Name:</th>
            <td colspan="3"><input type="text" name="emaillibrary[eml_name]" value="{{$detail.eml_name}}" style="width:750px;"/></td>
            

        </tr>
        	<tr>
            <th>Singnature:</th>
            <td>
            <select name="emaillibrary[eml_signarure_block]" class="lrg" style="width:220px;">
            {{foreach from=$signature key="key" item="item"}}
            <option value="{{$item.es_name}}" {{if $item.es_name == $detail.eml_signarure_block}} selected="selected" {{/if}}>{{$item.es_name}}</option>
            {{/foreach}}
            </td>
            
            <th>Business Stream:</th>
            <td><select name="emaillibrary[eml_business_stream]" class="lrg" style="width:220px;">
            	<option value="MS" {{if $detail.eml_business_stream == "MS"}} selected="selected" {{/if}}>MS</option>
				<option value="OP" {{if $detail.eml_business_stream == "OP"}} selected="selected" {{/if}}>OP</option> 
                <option value="RE" {{if $detail.eml_business_stream == "RE"}} selected="selected" {{/if}}>RE</option>    	    
  			    </select></td>
           
        </tr>
        
       	<tr>
         <th>QA?: </th>
            <td>
            <select name="emaillibrary[eml_qa]" class="lrg" style="width:220px;">
            	<option value="No" {{if $detail.eml_qa == "No"}} selected="selected" {{/if}}>No</option>
				<option value="Yes" {{if $detail.eml_qa == "Yes"}} selected="selected" {{/if}}>Yes</option> 
  			 </select>
            </td>
            <th>Owner: </th>
            <td>
                <select name="emaillibrary[eml_owner]" class="lrg" style="width:220px;">
            	<option value="Admin" {{if $detail.eml_owner == "Admin"}} selected="selected" {{/if}}>Admin</option>
				<option value="User" {{if $detail.eml_owner == "User"}} selected="selected" {{/if}}>User</option> 
      		    </select>
            </td>
        </tr>
        
		<tr>
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
        </tr>


        <tr> 
        <td colspan="2" style="text-align:center;">
         <input type="submit" name="subAddDetail" value="Save" class="vsml" />
    <input type="button" name="btnCancelDetail" value="Cancel" onclick="document.location.href='{{$BASE_URL}}{{$XFA.list}}'" class="vsml" />

        </td>
        </tr>
 		</table>

      </form>
	<script type="text/javascript" language="javascript" >
        var frmvalidator  = new Validator("detail");
			frmvalidator.EnableMsgsTogether();
			frmvalidator.addValidation("{{$TABLE}}[sftype_id]","dontselect=0", "Please select type.");
			frmvalidator.addValidation("{{$TABLE}}[sf_title]","req", "Please specify title.");
			frmvalidator.addValidation("{{$TABLE}}[sf_body]","req", "Please specify formula.");
    </script>
  
</div>
<script>
	initSample();
</script>