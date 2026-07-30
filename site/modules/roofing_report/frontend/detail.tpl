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
<table id="list-table" width="100%">
    <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" /> 
    
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
    <tr>
     <th>Project</th>
     <td>
   	<datalist id='project'>
           {{foreach from=$projdetail key="key1" item="item1"}}
            <option value="{{$item1.bsn_name}}" {{if $bsnid eq $item1.bsn_id}} selected="selected" {{/if}}>
            {{$item1.bsn_name}}
            </option>
            {{/foreach}}
  	 </datalist>
         <input type="text" list = 'project' name="{{$TABLE}}[rr_project]" style ="width:700px" value="{{$detail.rr_project}}" />
      </td>
    </tr>
   
    <tr>
     <th>Occupancy </th>
     <td><select name="{{$TABLE}}[rr_occupancy]" style="width:300px;"/>
      		 {{foreach from = $occdetail key="key2" item="item2"}}
                <option value="{{$item2.ro_id}}" {{if $item2.ro_id eq $detail.rr_occupancy}} selected="selected" {{/if}}>{{$item2.ro_occupancy}}</option>
                {{/foreach}}        
         </select>  
    </td>
    </tr> 
    
     <tr>
     <th>Client Names</th>
     <td><input  type="text" name="{{$TABLE}}[rr_client_name]"  value="{{$detail.rr_client_name}}"  style ="width:700px" /> </td>
     </tr>
   
   
    <tr>
     <th>Email</th>
     <td><input  type="text" name="{{$TABLE}}[rr_email]"  value="{{$detail.rr_email}}"  style ="width:700px" /> </td>
     </tr>
  
     <tr>
     <th>Phone</th>
     <td><input  type="text" name="{{$TABLE}}[rr_phone]"  value="{{$detail.rr_phone}}"  style ="width:700px" /> </td>
     </tr>
    
     <tr>
     <th>Survey Result</th> 
     <td> <input type="file" name="survey_result" /> </td>      
    </tr>  
   
     <tr>
     <th>Budget</th>
     <td><input  type="text" name="{{$TABLE}}[rr_budget]"  value="{{$detail.rr_budget}}"  /> </td>
    </tr>
   
    <tr>
     <th>What They Want </th>
     <td><select name="{{$TABLE}}[rr_what_they_want]" style="width:300px;"/>
      		 {{foreach from = $rtwdetail key="key3" item="item3"}}
                <option value="{{$item3.rt_id}}" {{if $item3.rt_id eq $detail.rr_what_they_want}} selected="selected" {{/if}}>{{$item3.rt_they_want}}</option>
                {{/foreach}}        
         </select>  
    </td>
    </tr> 
    
     <tr>
     <th>Video Link</th>
     <td><input  type="text" name="{{$TABLE}}[rr_onsite_video]"  value="{{$detail.rr_onsite_video}}" style ="width:700px"  /> </td>
    </tr>
   
     <tr>
     <th>Onsite Booked Date </th>
     <td><input  type="text" name="{{$TABLE}}[rr_onsite_booked]"  value="{{$detail.rr_onsite_booked}}" class="w16em dateformat-d-ds-m-ds-Y dtpic" /> </td>
    </tr> 
    
     <tr>
     <th>Onsite Booked Tome</th>
     <td><input  type="time" name="{{$TABLE}}[rr_onsite_booked_time]"  value="{{$detail.rr_onsite_booked_time}}"  /> </td>
    </tr> 
     
    <tr>
     <th>Price</th>
     <td><input  type="text" name="{{$TABLE}}[rr_price]"  value="{{$detail.rr_price}}"  /> </td>
    </tr>
  
     <tr>
     <th>Introduction Letter</th>
     <td><input  type="text" name="{{$TABLE}}[rr_intro_letter_link]"  value="{{$detail.rr_intro_letter_link}}" style ="width:700px"  /> </td>
    </tr>
   
    <tr>
     <th>Inspection Report PDF</th>
     <td><input  type="text" name="{{$TABLE}}[rr_inspection_report_link]"  value="{{$detail.rr_inspection_report_link}}" style ="width:700px"  /> </td>
    </tr>
    
    <tr>
     <th>Works Proposal Word</th>
     <td><input  type="text" name="{{$TABLE}}[rr_work_prop_word_link]"  value="{{$detail.rr_work_prop_word_link}}" style ="width:700px"  /> </td>
    </tr>
    
    <tr>
     <th>Works Proposal PDF</th>
     <td><input  type="text" name="{{$TABLE}}[rr_work_prop_pdf_link]"  value="{{$detail.rr_work_prop_pdf_link}}" style ="width:700px"  /> </td>
    </tr>
    
   <tr>
     <th>DocuSign Agreement</th>
     <td><input  type="text" name="{{$TABLE}}[rr_docusign_agr_link]"  value="{{$detail.rr_docusign_agr_link}}" style ="width:700px"  /> </td>
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