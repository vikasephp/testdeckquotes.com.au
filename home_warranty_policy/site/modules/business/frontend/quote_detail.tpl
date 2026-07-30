<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tabview/tabcontent.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/tabview/tabcontent.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />


<div><br />
 <h3 class="page-title">Accepted Quote Details</h3>
 <br />
 <br />

 
  <form name="sta"  method="post" action="">
  
  <table cellpadding="5" cellspacing="0" width="98%" border="1" id="list-table">
  <tr>
  <th>Quote </th> <td> <a href = "{{$BASE_URL}}{{$FILE_PATH}}files/purchase_order_quote/{{$detail.po_quote1}}">PDF</a></td>
  </tr>
  <tr>
  <th>Value</th> <td>{{$detail.po_value1}} </td>
  </tr>
  <tr>
  <th>Supplier Name </th> <td>{{$detail.po_supplier1}}  </td>
  </tr>
  <tr>
  <th>Acceptance Date</th> <td>{{$detail.po_acceptance_date}}  </td>
  </tr>
  <tr>
  <td colspan="2" style="text-align:center;"><input type="button" value="Close" onclick='javascript:refresh_close();' /> </td>
  </tr> 
 
  
 </table>
  
  </form>
  

  
</div>

<script type="text/javascript">
function refresh_close()
{
	parent.requestPurchseOrder();
	parent.$.fancybox.close();
}

</script>

<script type="text/javascript" language="javascript">
    var frmvalidator  = new Validator("sta");
    frmvalidator.EnableMsgsTogether();
    frmvalidator.addValidation("ps_qa[ps_question]","req", "Please enter question.");
</script>