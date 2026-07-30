<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>

<SCRIPT LANGUAGE="JavaScript">
	parent.requestattach_list();
</SCRIPT> 

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />

<div>
	<table>
           <form name="attachment_email" action="{{$BASE_URL}}design_interface.email_attachment" method="post" enctype="multipart/form-data">       

           <tr><td>&nbsp;</td><td>

           <input type="file" name="attachment"/>
           <input type="submit" value="Attach" name="attachmentbutton" onclick="javascript:parent.showTop();" />

           </td></tr>

       </form>
     </table>   
</div>

<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("attachment_email");
    frmvalidator.EnableMsgsTogether();
    frmvalidator.addValidation("attachment","req", "Please select file.");
</script>