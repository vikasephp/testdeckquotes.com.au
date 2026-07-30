<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
  <script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
	<script src="{{$BASE_URL}}ckeditor2/ckeditor.js"></script>
	<script src="{{$BASE_URL}}ckeditor2/samples/js/sample.js"></script>

	<script type="text/javascript">
           CKEDITOR.replace( 'editor1' );
           CKEDITOR.add  
        </script>

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

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
     <th>What</th>
     <td><input  type="text" name="{{$TABLE}}[cl_what]"  value="{{$detail.cl_what}}" style="width:700px;" /> </td>
    </tr>
    
    <tr>
     <th>Company Name</th>
     <td><input  type="text" name="{{$TABLE}}[cl_company_name]"  value="{{$detail.cl_company_name}}" style="width:700px;" /> </td>
    </tr>  
     
    <tr>
     <th>Contact Name</th>
     <td><input  type="text" name="{{$TABLE}}[cl_contact_name]"  value="{{$detail.cl_contact_name}}" style="width:700px;" /> </td>
    </tr> 
    
    <tr>
     <th>Position</th>
     <td><input  type="text" name="{{$TABLE}}[cl_position]"  value="{{$detail.cl_position}}" style="width:700px;" /> </td>
    </tr>  
        
    <tr>
     <th>Address</th>
     <td><input  type="text" name="{{$TABLE}}[cl_address]"  value="{{$detail.cl_address}}" style="width:700px;" /> </td>
    </tr>  
   
    <tr>
     <th>Phone Number</th>
     <td><input  type="text" name="{{$TABLE}}[cl_phone]"  value="{{$detail.cl_phone}}" style="width:700px;" /> </td>
    </tr> 
    
     <tr>
     <th>Mobile Number</th>
     <td><input  type="text" name="{{$TABLE}}[cl_mobile]"  value="{{$detail.cl_mobile}}" style="width:700px;" /> </td>
    </tr> 
   
     <tr>
     <th> Email Address </th>
     <td> <input type="email" name="{{$TABLE}}[cl_email]" value="{{$detail.cl_email}}" style="width:700px;"  /> </td>
    </tr>
   
    <tr>
     <th>Website</th>
     <td> <input type="text" name="{{$TABLE}}[cl_website]" value="{{$detail.cl_website}}" style="width:700px;"  /> </td>
    </tr>
   
    
    <tr>
        <th>Notes:</th>
        <td>
       
        <textarea rows="8" name="{{$TABLE}}[cl_notes]" id="editor1" class="ckeditor">{{$detail.cl_notes|stripslashes}}</textarea>    
       
        </td>
    </tr>
  

   <tr>
     <th>Calendar Reference:</th>
     <td> <input type="text" name="{{$TABLE}}[cl_calendar_ref]" value="{{$detail.cl_calendar_ref}}" style="width:700px;"  /> </td>
    </tr>
  
    <tr>
        <td colspan="2" style="text-align:center;">
            <!--<input type="submit" name="print" value="Print" class="vsml" />-->
            <input type="submit" name="subAddDetail" value="Save" class="vsml" />
           <!-- <input type="button" name="btnCancelDetail" value="Cancel" onclick="javascript:parent.$.fancybox.close();" class="vsml" />-->
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
			//frmvalidator.addValidation("{{$TABLE}}[cl_what]","req", "Please specify what.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_company_name]","req", "Please specify company name.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_contact_name]","req", "Please specify contact name.");
    </script>
</div>

<script>
	initSample();
</script>