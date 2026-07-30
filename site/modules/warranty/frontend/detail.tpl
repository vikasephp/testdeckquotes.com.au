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
<form name="detail_1" method="post" action=""  enctype="multipart/form-data">
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

   
    <tr>
     <th>Contact Info</th>
     <td><input  type="text" name="{{$TABLE}}[wa_contact_info]"  value="{{$detail.wa_contact_info}}" style="width:300px;" readonly="readonly" placeholder="Wiil be shown in warranty detail page" /> </td>
     <th>Date Lodged</th>
     <td><input  type="text" name="{{$TABLE}}[wa_date_lodged]"  value="{{$detail.wa_date_lodged}}" id="demo22" class="w16em dateformat-d-ds-m-ds-Y dtpic" /></tr>
      
    <tr>
     <th>Date Inspected On site</th>
     <td><input  type="text" name="{{$TABLE}}[wa_date_inspected]"  value="{{$detail.wa_date_inspected}}" id="demo2" class="w16em dateformat-d-ds-m-ds-Y dtpic" /></td>
     <th> Complete and Close Letter</th>
     <th> <input type="file" name="cc_letter" /></th>
    </tr>
    </tr>
 
   <tr>
     <th></th>
     <td></td>
       
     <th>  </th>
     <td> {{if $detail.wa_cc_letter}} <a href="https://deckquote.s3.amazonaws.com/files/warranty/{{$detail.wa_cc_letter}}" target="_blank">Download</a>{{/if}}
     </td>
    </tr>
 </table>

 
 <br />
 <h2 style="font-size:22px;"> Add Issue </h2>
 
<!--{{section name=foo loop = $number }}-->
  <!-- {{/section}}-->

{{foreach from = $issueDetail key = 'key' item = 'item' }}
 <input type="hidden" name="warranty_issue[{{$item.wi_id}}][wi_id]" value="{{$item.wi_id}}" />
   <input type="hidden" name="waid" value="{{$wa_id}}" />
 <table id="product-table" width="100%" border="1">
     <tr>
      <th style="width:12%">Warranty Issue Number {{$flag}}</th>
     <td style="width:12%"><input  type="text" name="warranty_issue[{{$item.wi_id}}][wi_warrany_issue_num]"  value="{{$item.wi_warrany_issue_num}}" style="width:100px;" readonly="readonly"/> </td>
  
     <th style="width:12%">Type </th>
     <td style="width:12%">
         <select name="warranty_issue[{{$item.wi_id}}][wi_type]">
        <!-- <option value="Complete" {{if $item.wi_type eq 'Complete'}} selected="selected"{{/if}}>Complete</option>
         <option value="In Construction" {{if $item.wi_type eq 'In Construction'}} selected="selected"{{/if}}>In Construction</option>
      -->  
         <option value="">Please Select</option>
         {{foreach from=$types key="key4" item="item4"}}
         <option value="{{$item4.to_option}}" {{if $item.wi_type eq $item4.to_option}} selected="selected" {{/if}}>{{$item4.to_option}}</option>
	 {{/foreach}}
        
         </select>
      </td>
 
    </tr>
    <tr>
    <th style="width:12%"> CGFB Person </th>
     <td style="width:12%"> <input  type="text" name="warranty_issue[{{$item.wi_id}}][wi_cgfb_person]"  value="{{$item.wi_cgfb_person}}" style="width:300px;" />  </td>

     <th style="width:12%">Date</th>
     <td style="width:12%">
     <input  type="text" name="warranty_issue[{{$item.wi_id}}][wi_date]"  value="{{$item.wi_date}}" id="demo1_{{$item.wi_id}}" class="w16em dateformat-d-ds-m-ds-Y dtpic" style="width:100px;" /> </td>
     </td>
    </tr> 
    <tr>
     <th>Upload Image</th>
     <td colspan="3">
     <input type="file" name="img1[{{$item.wi_id}}]" /> 
     <input type="file" name="img2[{{$item.wi_id}}]" />
     <input type="file" name="img3[{{$item.wi_id}}]" />
     <input type="file" name="img4[{{$item.wi_id}}]" />
     <input type="file" name="img5[{{$item.wi_id}}]" />
      </td>
     </tr>
   
   <tr>
     <th>Preview Image</th>
     <td colspan="3">
    {{if $item.wi_img1}} 
       <a  href="https://deckquote.s3.amazonaws.com/files/warranty/{{$item.wi_img1}}" download target="_blank">
       <img src="https://deckquote.s3.amazonaws.com/files/warranty/{{$item.wi_img1}}" height="100" />
       </a>
    {{/if}}
    {{if $item.wi_img2}} 
       <a  href="https://deckquote.s3.amazonaws.com/files/warranty/{{$item.wi_img2}}" download target="_blank">
       <img src="https://deckquote.s3.amazonaws.com/files/warranty/{{$item.wi_img2}}" height="100" />
       </a>
    {{/if}}
     {{if $item.wi_img3}} 
       <a  href="https://deckquote.s3.amazonaws.com/files/warranty/{{$item.wi_img3}}" download target="_blank">
       <img src="https://deckquote.s3.amazonaws.com/files/warranty/{{$item.wi_img3}}" height="100" />
       </a>
    {{/if}}
     {{if $item.wi_img4}} 
       <a  href="https://deckquote.s3.amazonaws.com/files/warranty/{{$item.wi_img4}}" download target="_blank">
       <img src="https://deckquote.s3.amazonaws.com/files/warranty/{{$item.wi_img4}}" height="100" />
       </a>
    {{/if}}
    {{if $item.wi_img5}} 
       <a  href="https://deckquote.s3.amazonaws.com/files/warranty/{{$item.wi_img5}}" download target="_blank">
       <img src="https://deckquote.s3.amazonaws.com/files/warranty/{{$item.wi_img5}}" height="100" />
       </a>
    {{/if}}
   
     </td>
      </tr>
   
       <tr>
        <th>Problem Description</th>
        <td colspan="3"><textarea cols="150" rows="5" name="warranty_issue[{{$item.wi_id}}][wi_prob_desc]"  >{{$item.wi_prob_desc|stripslashes}}</textarea>    
        </td>
       </tr> 
    
       <tr>
        <th>Notes and Comments</th>
        <td colspan="3"><textarea cols="150" rows="5" name="warranty_issue[{{$item.wi_id}}][wi_notes]" >{{$item.wi_notes|stripslashes}}</textarea>    
        </td>
       </tr> 
    
     <!-- <tr>
        <td colspan="3" style="text-align:center;">
          <input type="submit" name="subAddDetail" value="Save" class="vsml" />
          <input type="button" name="btnCancelDetail" value="Return To Warrranty List" onclick="location.href='{{$BASE_URL}}{{$XFA.home}}';" class="vsml" />
          <input type="submit" name="update_issue" value="Update Issue" class="vsml" />
          <input type="submit" name="add_issue" value="Add Issue" class="vsml" />
        </td>
    </tr>-->
</table>

  {{/foreach}}
  
  {{if $wa_id eq 0 OR $flag eq 'True' }}
  <table id="product-table" width="100%">
  <input type="hidden" name="new_issue[wi_wa_id]" value="{{$wa_id}}" />
     <tr>
      <th style="width:12%">Warranty Issue Number </th>
     <td style="width:12%"><input  type="text" name="new_issue[wi_warrany_issue_num]"  value="{{$win}}" style="width:100px;" readonly="readonly" /> </td>
  
     <th style="width:12%">Type </th>
     <td style="width:12%">
         <select name="new_issue[wi_type]">
         <option value="Complete" {{if $detail.wi_type eq 'Complete'}} selected="selected"{{/if}}>Complete</option>
         <option value="In Construction" {{if $detail.wi_type eq 'In Construction'}} selected="selected"{{/if}}>In Construction</option>
         </select>
      </td>
 
    </tr>
    <tr>
    <th style="width:12%"> CGFB Person </th>
     <td style="width:12%"> <input  type="text" name="new_issue[wi_cgfb_person]"  value="{{$detail.wi_cgfb_person}}" style="width:300px;" />  </td>

     <th style="width:12%">Date</th>
     <td style="width:12%">
     <input  type="text" name="new_issue[wi_date]"  value="{{$detail.wi_date}}" id="demo1" class="w16em dateformat-d-ds-m-ds-Y dtpic" style="width:100px;" /> </td>
     </td>
    </tr> 
    <tr>
     <th>Upload Image 1</th>
     <td colspan="3">
     <input type="file" name="img11" /> 
     <input type="file" name="img22" />
     <input type="file" name="img33" />
     <input type="file" name="img44" />
     <input type="file" name="img55" />
      </td>
     </tr>
   
   <tr>
     <th>Preview Image</th>
     <td colspan="3">
    {{if $detail.wi_img1}} 
       <a  href="https://deckquote.s3.amazonaws.com/files/warranty/{{$detail.wi_img1}}" download target="_blank">
       <img src="https://deckquote.s3.amazonaws.com/files/warranty/{{$detail.wi_img1}}" height="100" />
       </a>
    {{/if}}
    {{if $detail.wi_img2}} 
       <a  href="https://deckquote.s3.amazonaws.com/files/warranty/{{$detail.wi_img2}}" download target="_blank">
       <img src="https://deckquote.s3.amazonaws.com/files/warranty/{{$detail.wi_img2}}" height="100" />
       </a>
    {{/if}}
     {{if $detail.wi_img3}} 
       <a  href="https://deckquote.s3.amazonaws.com/files/warranty/{{$detail.wi_img3}}" download target="_blank">
       <img src="https://deckquote.s3.amazonaws.com/files/warranty/{{$detail.wi_img3}}" height="100" />
       </a>
    {{/if}}
     {{if $detail.wi_img4}} 
       <a  href="https://deckquote.s3.amazonaws.com/files/warranty/{{$detail.wi_img4}}" download target="_blank">
       <img src="https://deckquote.s3.amazonaws.com/files/warranty/{{$detail.wi_img4}}" height="100" />
       </a>
    {{/if}}
    {{if $detail.wi_img5}} 
       <a  href="https://deckquote.s3.amazonaws.com/files/warranty/{{$detail.wi_img5}}" download target="_blank">
       <img src="https://deckquote.s3.amazonaws.com/files/warranty/{{$detail.wi_img5}}" height="100" />
       </a>
    {{/if}}
   
     </td>
      </tr>
   
       <tr>
        <th>Problem Description</th>
        <td colspan="3"><textarea cols="150" rows="5" name="new_issue[wi_prob_desc]">{{$detail.wi_prob_desc|stripslashes}}</textarea>    
        </td>
       </tr> 
    
       <tr>
        <th>Notes and Comments</th>
        <td colspan="3"><textarea cols="150" rows="5" name="new_issue[wi_notes]">{{$detail.wi_notes|stripslashes}}</textarea>    
        </td>
       </tr> 
    

</table>
{{/if}}
  <table>

 <tr>
        <td colspan="3" style="text-align:center;">
          <input type="submit" name="subAddDetail" value="Save Project Details" class="vsml" />
          <input type="button" name="btnCancelDetail" value="Return To Warrranty List" onclick="location.href='{{$BASE_URL}}{{$XFA.home}}';" class="vsml" />
          
          {{if $wa_id gt 0 }}
          <!--<input type="submit" name="save_new" value="Save New Issue" class="vsml" />-->
          <input type="submit" name="update_issue" value="Save All Issue" class="vsml" />
          <input type="submit" name="add_issue" value="Add Issue" class="vsml" />
          {{/if}}
        </td>
    </tr> 
    {{if empty($wa_id) }}
    <tr><td><div style="font-size:14px; color:#F00"> In order to add new issue please first save this warranty (click on save button) </td> </tr>
    {{/if}}
    </table>
</form>

   
        <script type="text/javascript">
		function closepop()
		{
		setTimeout('parent.close_win();', 500);
		}
	</script>
    
	<script type="text/javascript" language="javascript" >
        var frmvalidator  = new Validator("detail_1");
			frmvalidator.EnableMsgsTogether();
			frmvalidator.addValidation("{{$TABLE}}[wa_project]","req", "Please specify project.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_company_name]","req", "Please specify company name.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_contact_name]","req", "Please specify contact name.");
    </script>
</div>
