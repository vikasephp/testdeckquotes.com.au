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

<div align="center" style="min-height:300px; margin-top:20px;">
    <h3 class="page-title">{{$title}}</h3>    
   
   
<form name="detail" method="post" action="{{$XFA.detail}}"  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
    <tr>
     <th>Project Address</th>
     <td>
   	<datalist id='project'>
           {{foreach from=$projdetail key="key" item="item"}}
            <option value="{{$item.bsn_name}}" {{if $bsnid eq $item.bsn_id}} selected="selected" {{/if}}>
            {{$item.bsn_name}}
            </option>
            {{/foreach}}
  	 </datalist>
         <input type="text" list = 'project' name="{{$TABLE}}[os_project]" style ="width:700px" value="{{$detail.os_project}}" />
      </td>
    </tr>
   
    <tr>
     <th>DA Number</th>
     <td><input type="text" name="{{$TABLE}}[os_da_number]" value="{{$detail.os_da_number}}" /> </td>
    </tr>
   
 <!--   <tr>
     <th>Date Logged</th>
     <td><input type="text" name="{{$TABLE}}[os_date_lodged]" value="{{$detail.os_date_lodged}}" id="demo1" class="w16em dateformat-d-ds-m-ds-Y dtpic"/> </td>
    </tr>-->
   
   <!-- <tr>
     <th>Completeness Check Pass?</th>
     <td><select name="{{$TABLE}}[os_comp_chk_pass]" />
         <option value="Yes" {{if $detail.os_comp_chk_pass eq 'Yes' }} selected="selected" {{/if}} >Yes</option>
         <option value="No" {{if $detail.os_comp_chk_pass eq 'No' }} selected="selected" {{/if}}>No</option>
         </select>
      </td>
    </tr>
   
  <tr>
  <th>Reason for Failed Completeness</th> 
  <td> <input  type="text" name="{{$TABLE}}[os_reason_fc]"  value="{{$detail.os_reason_fc}}" style="width:700px;" /></td>      
  </tr>-->
  
 <!-- <tr>
     <th>Referral Recorded?</th>
     <td>
   	<select name="{{$TABLE}}[os_referral_recorded]" />
         <option value="Yes" {{if $detail.os_referral_recorded eq 'Yes' }} selected="selected" {{/if}}>Yes</option>
         <option value="No" {{if $detail.os_referral_recorded eq 'No' }} selected="selected" {{/if}}>No</option>
        </select>
      </td>
    </tr>-->
  
   
   <!-- <tr>
     <th>Da Passed ? </th>
     <td>
         <select name="{{$TABLE}}[os_da_passed]" />
             <option value="Yes" {{if $detail.os_da_passed eq 'Yes' }} selected="selected" {{/if}}>Yes</option>
             <option value="No" {{if $detail.os_da_passed eq 'No' }} selected="selected" {{/if}}>No</option>
         </select>
      </td>
    </td>
    </tr>  
   
   
    <tr>
     <th>DA approved with conditions?</th>
     <td>
         <select name="{{$TABLE}}[os_da_approved]" />
             <option value="Yes" {{if $detail.os_da_approved eq 'Yes' }} selected="selected" {{/if}}>Yes</option>
             <option value="No" {{if $detail.os_da_approved eq 'No' }} selected="selected" {{/if}}>No</option>
             <option value="NA"  {{if $detail.os_da_approved eq 'NA' }} selected="selected" {{/if}}>N/A</option>
         </select>
      </td>
    </td>
    </tr>
    
    <tr>
     <th>Reason for Failed</th>
     <td><input  type="text" name="{{$TABLE}}[os_reason_failed]"  value="{{$detail.os_reason_failed}}" style="width:700px;" /> </td>
    </tr>-->
  
  <!-- <tr>
     <th>Document Link</th>
     <td><input  type="text" name="{{$TABLE}}[os_doc_link]"  value="{{$detail.os_doc_link}}" style="width:700px;" /> </td>
    </tr>
-->  
  
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
			frmvalidator.addValidation("{{$TABLE}}[os_project]","req", "Please specify project.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_company_name]","req", "Please specify company name.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_contact_name]","req", "Please specify contact name.");
    </script>
</div>
