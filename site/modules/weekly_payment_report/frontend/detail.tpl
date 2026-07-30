<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>

<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<!--<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />-->
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />
	<script src="{{$BASE_URL}}ckeditor2/ckeditor.js"></script>
	<script src="{{$BASE_URL}}ckeditor2/samples/js/sample.js"></script>

	<script type="text/javascript">
           CKEDITOR.replace( 'editor1' );
           CKEDITOR.add  
        </script>


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
     <th>Period</th>
     <td><input type="text" name="{{$TABLE}}[wp_period]" style ="width:700px" value="{{$detail.wp_period}}" />
      </td>
    </tr>
   
   <tr>
     <th>Value</th>
     <td><input  type="text" name="{{$TABLE}}[wp_value]"  value="{{$detail.wp_value}}" style="width:700px;" /> </td>
    </tr>
   
    <tr>
     <th>Invoices</th>
     <td><input type="file" name="invoices" /></td>
    </tr>
    
   
   <tr>
     <th>Bank File</th>
     <td><input type="file" name="bankfile" /></td>
    </tr>
 
    <tr>
     <th>Payment Date</th>
     <td><input  type="text" name="{{$TABLE}}[wp_payment_date]"  value="{{$detail.wp_payment_date}}" class="w16em dateformat-d-ds-m-ds-Y dtpic" /> </td>
    </tr>
   
   <tr>
     <th>Q/A Sign Off</th>
     <td><input type="file" name="qa_signoff" /></td>
    </tr>
 

     <tr>
     <th>Manual Value</th>
     <td><input  type="text" name="{{$TABLE}}[wp_manual_value]"  value="{{$detail.wp_manual_value}}" style="width:700px;" /> </td>
    </tr>
    
    <tr>
     <th>Manual Auditor</th>
     <td><input  type="text" name="{{$TABLE}}[wp_manual_auditor]"  value="{{$user}}" style="width:700px;" /> </td>
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