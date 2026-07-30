<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<!--<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />-->
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<!--<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />-->

<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tabview/tabcontent.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/tabview/tabcontent.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

<style>

#list-table2 {border: 1px solid #9CF; border-collapse:collapse; }
#list-table2 th {border: 1px solid #9CF; border-collapse:collapse; }
#list-table2 td {border: 1px solid #9CF; border-collapse:collapse; }
</style>


{{if $opr}}
	<script type="text/javascript">
        setTimeout('parent.close_win();', 500);
        </script>
{{/if}}

<div align="center" style="min-height:350px;">
    <h3 class="page-title">New Warranty</h3>    
   
   <div style="border:1px solid gray; margin-bottom: 1em; padding-top:20px; width:80%"> 
<form name="detail" method="post" action="{{$XFA.detail}}"  enctype="multipart/form-data">
<table id="product-table" width="100%">
    <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
    <tr>
     <th>Project Name</th>
     <td>
   	<datalist id='project'>
           {{foreach from=$projdetail key="key" item="item"}}
            <option value="{{$item.bsn_name}}" {{if $bsnid eq $item.bsn_id}} selected="selected" {{/if}}>
            {{$item.bsn_name}}
            </option>
            {{/foreach}}
  	 </datalist>
         <input type="text" list = 'project' name="{{$TABLE}}[wa_project]" style ="width:500px" value="{{$detail.wa_project}}"  />
       
 
      </td>

     
     <th>Tenanted</th>
     <td>
        
          Yes <input type="radio" value="1" name="{{$TABLE}}[wa_tenanted]" {{if $detail.wa_tenanted eq 1 }} checked="checked" {{/if}}  /> 
          No  <input type="radio" value="0" name="{{$TABLE}}[wa_tenanted]" {{if $detail.wa_tenanted eq 0 }} checked="checked" {{/if}}/> 
      </td>
    </tr>

    </tr>
   
    <tr>
     <th>Contact Info</th>
     <td><input  type="text" name="{{$TABLE}}[wa_contact_info]"  value="{{$detail.wa_contact_info}}" style="width:300px;" readonly="readonly" placeholder="Wiil be shown in warranty detail page" /> </td>
   
   <th> CGFB Person </th>
   <td> <input  type="text" name="{{$TABLE}}[wa_cgfb_person]"  value="{{$detail.wa_cgfb_person}}" style="width:200px;" />  </tr>
   
    <tr>
     <th>Type </th>
     <td>
         <select name="{{$TABLE}}[wa_type]">
         <option value="Complete" {{if $detail.wa_type eq 'Complete'}} selected="selected"{{/if}}>Complete</option>
         <option value="In Construction" {{if $detail.wa_type eq 'In Construction'}} selected="selected"{{/if}}>In Construction</option>
         </select>
      </td>
    </td>
  
     <th>Date</th>
     <td><input  type="text" name="{{$TABLE}}[wa_date]"  value="{{$detail.wa_date}}" id="demo1" class="w16em dateformat-d-ds-m-ds-Y dtpic" /> </td>
  
    </td>
    </tr> 
   
    <tr>
     <th>Date Inspected On site</th>
     <td><input  type="text" name="{{$TABLE}}[wa_date_inspected]"  value="{{$detail.wa_date_inspected}}" id="demo2" class="w16em dateformat-d-ds-m-ds-Y dtpic" /></td>
     
     <th> Complete and Close Letter</th>
    <th> <input type="file" name="cc_letter" />
            </th>
    </tr>
   
   <tr>
     <th></th>
     <td> </td>
       
     <th>  </th>
     <td> {{if $detail.wa_cc_letter}} <a href="https://deckquote.s3.amazonaws.com/files/warranty/{{$detail.wa_cc_letter}}" target="_blank">Download</a>{{/if}}
     </td>
    </tr>
   
    <tr>
     <th>Upload Image</th>
     <td colspan="3">
     <input type="file" name="img1" /> 
     <input type="file" name="img2" />
     <input type="file" name="img3" />
     <input type="file" name="img4" />
     <input type="file" name="img5" />
      </td>
      </tr>
   
   <tr>
     <th>Preview Image</th>
     <td colspan="3">
    {{if $detail.wa_img1}} 
       <a  href="https://deckquote.s3.amazonaws.com/files/warranty/{{$detail.wa_img1}}" download target="_blank">
       <img src="https://deckquote.s3.amazonaws.com/files/warranty/{{$detail.wa_img1}}" height="100" />
       </a>
    {{/if}}
    {{if $detail.wa_img2}} 
       <a  href="https://deckquote.s3.amazonaws.com/files/warranty/{{$detail.wa_img2}}" download target="_blank">
       <img src="https://deckquote.s3.amazonaws.com/files/warranty/{{$detail.wa_img2}}" height="100" />
       </a>
    {{/if}}
     {{if $detail.wa_img3}} 
       <a  href="https://deckquote.s3.amazonaws.com/files/warranty/{{$detail.wa_img3}}" download target="_blank">
       <img src="https://deckquote.s3.amazonaws.com/files/warranty/{{$detail.wa_img3}}" height="100" />
       </a>
    {{/if}}
     {{if $detail.wa_img4}} 
       <a  href="https://deckquote.s3.amazonaws.com/files/warranty/{{$detail.wa_img4}}" download target="_blank">
       <img src="https://deckquote.s3.amazonaws.com/files/warranty/{{$detail.wa_img4}}" height="100" />
       </a>
    {{/if}}
    {{if $detail.wa_img5}} 
       <a  href="https://deckquote.s3.amazonaws.com/files/warranty/{{$detail.wa_img5}}" download target="_blank">
       <img src="https://deckquote.s3.amazonaws.com/files/warranty/{{$detail.wa_img5}}" height="100" />
       </a>
    {{/if}}
   
   
   
   </td>
      </tr>
   
   
      
        <tr>
        <th>Problem Description</th>
        <td colspan="3"><textarea cols="150" rows="5" name="{{$TABLE}}[wa_prob_desc]"  >{{$detail.wa_prob_desc|stripslashes}}</textarea>    
        </td>
       </tr> 
    
     <tr>
        <th>Notes and Comments</th>
        <td colspan="3"><textarea cols="150" rows="5" name="{{$TABLE}}[wa_notes]" >{{$detail.wa_notes|stripslashes}}</textarea>    
        </td>
       </tr> 
    
       
    
     <tr>
        <td colspan="2" style="text-align:center;">
          <input type="submit" name="subAddDetail" value="Save" class="vsml" />
          <input type="button" name="btnCancelDetail" value="Return To Warrranty List" onclick="location.href='{{$BASE_URL}}{{$XFA.home}}';" class="vsml" />
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
