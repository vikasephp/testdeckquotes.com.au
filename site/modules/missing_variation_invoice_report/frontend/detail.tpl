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
     <th>Project</th>
     <td>
   	<datalist id='project'>
           {{foreach from=$projdetail key="key3" item="item3"}}
            <option value="{{$item3.bsn_name}}" {{if $bsnid eq $item3.bsn_id}} selected="selected" {{/if}}>
            {{$item3.bsn_name}}
            </option>
            {{/foreach}}
  	 </datalist>
         <input type="text" list = 'project' name="{{$TABLE}}[mv_project]" style ="width:700px" value="{{$detail.mv_project}}" />
      </td>
    </tr>
  
  
   
     <tr>
     <th>Variation Name</th>
     <td><input  type="text" name="{{$TABLE}}[mv_variation_name]"  value="{{$detail.mv_variation_name}}" style="width:700px;" /> </td>
     </tr>  
     
      <tr>
     <th>Variation Value</th>
     <td><input  type="text" name="{{$TABLE}}[mv_variation_value]"  value="{{$detail.mv_variation_value}}" style="width:700px;" /> </td>
     </tr> 
     
     <tr>
     <th>Variation ID</th>
     <td><input  type="text" name="{{$TABLE}}[mv_variation_id]"  value="{{$detail.mv_variation_id}}" style="width:700px;" /> </td>
     </tr> 
     
      <tr>
     <th>Invoice Number</th>
     <td><input  type="text" name="{{$TABLE}}[mv_invoice_num]"  value="{{$detail.mv_invoice_num}}" style="width:700px;" /> </td>
     </tr> 
     
     <tr>
     <th>Upload Invoice</th>
     <td><input type="file" name="invoice" /></td>
     </tr>  
     
     <tr>
     <th>Invoice Creation Date</th>
     <td><input type="text" name="{{$TABLE}}[mv_inv_create_date]" value="{{$detail.mv_inv_create_date}}" class="w16em dateformat-d-ds-m-ds-Y dtpic" /></td>
     </tr> 
     
      <tr>
     <th>Invoice Sent Date</th>
     <td><input type="text" name="{{$TABLE}}[mv_inv_sent_date]" value="{{$detail.mv_inv_sent_date}}" class="w16em dateformat-d-ds-m-ds-Y dtpic" /></td>
     </tr> 
    
     <th>Notes</th>
     <td><textarea rows="3" cols="100" name="{{$TABLE}}[mv_notes]">{{$detail.mv_notes}}</textarea></td>
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