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
     <th>24 Call Date</th>
 <td><input type="text" name="{{$TABLE}}[pc_24_call_date]" style ="width:400px" value="{{$detail.pc_24_call_date}}" class="w16em dateformat-d-ds-m-ds-Y dtpic" />
      </td>
    </tr>
   
    <tr>
     <th>Office HQ</th>
     <td><input type="text" name="{{$TABLE}}[pc_office_hq]" style ="width:700px" value="{{$detail.pc_office_hq}}" />
      </td>
    </tr>
   
   <tr>
     <th>Phone Log</th>
     <td><input  type="text" name="{{$TABLE}}[pc_phone_log]"  value="{{$detail.pc_phone_log}}" style="width:700px;" /> </td>
    </tr>
   
   
   <tr>
     <th>Difference</th>
     <td><input  type="text" name="{{$TABLE}}[pc_difference]"  value="{{$detail.pc_difference}}" style="width:700px;" /> </td>
    </tr>
    
     
    <tr>
     <th>Notes</th>
     <td>
      <textarea rows="5" name="{{$TABLE}}[pc_notes]" id="editor1" class="ckeditor">{{$detail.pc_notes|stripslashes}}</textarea>
   
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