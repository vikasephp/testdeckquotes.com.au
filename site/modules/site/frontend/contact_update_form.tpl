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
    <h3 class="page-title">Contact Update Form</h3>    
   
   
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="contact['cs_id']" value="{{$detail.cs_id}}" />
   {{if $opr}} <tr><th colspan="2" style="color:#0C6; font-size:14px;">Record has been added in contact form log</th></tr>{{/if}}
   
    <tr>
     <th>Contact Id</th>
     <td><input type="text"  name="contact[cu_cs_id]" style ="width:700px" value="{{$detail.cs_id}}" readonly="readonly" />
      </td>
    </tr>
   
   <tr>
     <th>Company</th>
     <td><input  type="text"  name="contact[cu_company]" value="{{$detail.co_company_name}}" style="width:700px;" readonly="readonly" /> </td>
    </tr>
   
   
   <tr>
     <th>First Name</th>
     <td><input  type="text" name="contact[cu_first_name]"  value="{{$detail.cs_first_name}}" style="width:700px;" /> </td>
    </tr>
    
     <tr>
     <th>Last Name</th>
     <td><input  type="text" name="contact[cu_last_name]"  value="{{$detail.cs_surname}}" style="width:700px;" /> </td>
    </tr> 
    
    <tr>
     <th>Landline</th>
     <td><input  type="text" name="contact[cu_landline]"  value="{{$detail.cs_landline}}" style="width:700px;" /> </td>
    </tr> 
    
    <tr>
     <th>Mobile</th>
     <td><input  type="text" name="contact[cu_mobile]"  value="{{$detail.cs_mobile}}" style="width:700px;" /> </td>
    </tr> 
    
    <tr>
     <th>Email Address</th>
     <td><input  type="text" name="contact[cu_email]"  value="{{$detail.cs_primary_email}}" style="width:700px;" /> </td>
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
			frmvalidator.addValidation("contact[ph_name]","req", "Please specify name.");
			//frmvalidator.addValidation("contact[cl_company_name]","req", "Please specify company name.");
			//frmvalidator.addValidation("contact[cl_contact_name]","req", "Please specify contact name.");
    </script>
</div>

<script>
	initSample();
</script>
