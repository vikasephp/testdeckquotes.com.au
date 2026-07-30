<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

{{if $opr}}
<script type="text/javascript">
//setTimeout('parent.close_win();', 500);

window.location.href = "{{$BASE_URL}}purchase_order.view_item/po_id/{{$po_id}}";
</script>
{{/if}}

<div align="center" style="min-height:350px; padding-top:10px;">
    <h3 class="page-title">Add/Edit New Item</h3>    
   
   
<form name="detail" method="post" action="{{$XFA.add_task}}"  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="item[pi_id]" value="{{$detail.pi_id}}" />
    <input type="hidden" name="item[pi_po_id]" value="{{$po_id}}" />
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
    <tr>
     <th>Item Name </th>
     <td>
          <input type="text"  name="item[pi_name]" style ="width:700px" value="{{$detail.pi_name}}" />
      </td>
    </tr>
   
   
    <tr>
     <th>Item Code </th>
     <td>
          <input type="text"  name="item[pi_code]" style ="width:700px" value="{{$detail.pi_code}}" />
      </td>
    </tr>
    
     <tr>
     <th>Item quantity</th>
     <td>
          <input type="text"  name="item[pi_qty]" style ="width:700px" value="{{$detail.pi_qty}}" />
      </td>
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
		//setTimeout('parent.close_win();', 500);
		window.location.href = "{{$BASE_URL}}purchase_order.view_item/po_id/{{$po_id}}";
		}
	</script>
    
	<script type="text/javascript" language="javascript" >
        var frmvalidator  = new Validator("detail");
			frmvalidator.EnableMsgsTogether();
			frmvalidator.addValidation("task[dt_name]","req", "Please specify project.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_company_name]","req", "Please specify company name.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_contact_name]","req", "Please specify contact name.");
    </script>
</div>