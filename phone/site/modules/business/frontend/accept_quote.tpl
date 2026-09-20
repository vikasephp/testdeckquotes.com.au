<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tabview/tabcontent.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/tabview/tabcontent.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />


<div><br />
 <h3 class="page-title">View / Accept Quote </h3>
 
 {{if $msg }}
 	<h2 style="text-align:center; padding-top:30; padding-bottom:20px; font-size:20px; color:#939;">{{$msg }} </h2>
 {{/if}}
 
  <form name="sta"  method="post" action="" enctype="multipart/form-data">
  
  <table cellpadding="5" cellspacing="0" width="98%" border="1" id="list-table">
  <tr> <th width="45%"> Quote </th><th>Type</th> <th>Value</th><th>Supplier Name</th>  </tr>
  <tr>
  	<td><input type="file" name="quote1" id="doc_file_name" />
       {{if  $quote}} <a href = "{{$BASE_URL}}{{$FILE_PATH}}files/purchase_order_quote/{{$quote}}">PDF</a>{{/if}}
       
       </td>
        <td><select name = "accept[po_type]" >
           <option value="Original" {{if $detail.po_type == "Original"}} selected="selected" {{/if}}> Original </option>
           <option value="Revised"  {{if $detail.po_type == "Revised"}} selected="selected" {{/if}}> Revised </option>
       </select> </td>
        <td><input type="text" name = "accept[po_value]" value="{{$detail.value}}" /> </td>
        <td><input type="text" name = "accept[po_supplier]" value="{{$detail.supplier}}"  /> </td>
 </tr>
  
 </table>

 <div style="text-align:center; margin-top:40px;">
  <input type="submit" name="save" value="Save" /> &nbsp; &nbsp;
 <!-- <input type="submit" name="accept_save" value="Accept" /> &nbsp; &nbsp;-->
  <input type="button" value="Close" onclick='javascript:refresh_close();' />
  </div>
  </form>
  

  
</div>

<script type="text/javascript">
function refresh_close()
{
	parent.requestPurchseOrder();
	parent.$.fancybox.close();
}

</script>

<!--<script type="text/javascript" language="javascript">
    var frmvalidator  = new Validator("sta");
    frmvalidator.EnableMsgsTogether();
    frmvalidator.addValidation("ps_qa[ps_question]","req", "Please enter question.");
</script>-->