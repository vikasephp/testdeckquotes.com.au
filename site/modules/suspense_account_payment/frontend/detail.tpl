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
     <th>Payment Date</th>
     <td><input type="text" name="{{$TABLE}}[sa_payment_date]" value="{{$detail.sa_payment_date}}" class="w16em dateformat-d-ds-m-ds-Y dtpic" /></td>
     </tr> 
   
     <tr>
     <th>Amount</th>
     <td><input  type="text" name="{{$TABLE}}[sa_amount]"  value="{{$detail.sa_amount}}" style="width:700px;" /> </td>
     </tr>  
     
     <tr>
     <th>Description</th>
     <td><textarea rows="3" cols="100" name="{{$TABLE}}[sa_description]">{{$detail.sa_description}}</textarea></td>
     </tr>  
     
     <tr>
     <th>Method</th>
     <td>
     <select name="{{$TABLE}}[sa_method]">
     <option value="0">Please Select</option>
     {{foreach from=$methoddetail key="key2" item="item2"}}
     <option value="{{$item2.sm_id}}" {{if $item2.sm_id eq $detail.sa_method }} selected="selected" {{/if}}>{{$item2.sm_option}}</option>
     {{/foreach}}
     </select>
     </td>
       
     <tr>
     <th>Card Id</th>
     <td><input  type="text" name="{{$TABLE}}[sa_card_id]"  value="{{$detail.sa_card_id}}" style="width:700px;" /> </td>
     
      <tr>
     <th>What</th>
     <td><textarea rows="3" cols="100" name="{{$TABLE}}[sa_what]">{{$item.sa_what}}</textarea></td>
     </tr> 
     
     <tr>
     <th>COA</th>
     <td><input type="text" name="{{$TABLE}}[sa_coa]" value="{{$detail.sa_coa}}" /></td>
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