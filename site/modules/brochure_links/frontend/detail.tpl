<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<div align="center" style="min-height:350px;"><br /><br />
    <h3 class="page-title">{{$title}}</h3>    
   
   
<form name="detail" method="post" action="{{$XFA.detail}}"  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
    <tr>
     <th>Document</th>
     <td>
         <input type="text"  name="{{$TABLE}}[bl_document]" style ="width:700px" value="{{$detail.bl_document}}" />
      </td>
    </tr>
   
     <tr>
        <th>MS TEAMS Link</th>
        <td>
         <input type="text"  name="{{$TABLE}}[bl_msteams_link]" style ="width:700px" value="{{$detail.bl_msteams_link}}" />
        </td>
     </tr>
   
   <tr>
        <th>Update Last</th>
        <td>
          <input type="text" name="{{$TABLE}}[bl_ms_updated_last]"  value="{{$detail.bl_ms_updated_last}}" class="w16em dateformat-d-ds-m-ds-Y dtpic" /> 
        </td>
     </tr>
   
   <tr>
     <th>Magazine Link</th>
     <td>
         <input type="text"  name="{{$TABLE}}[bl_magazine_link]" style ="width:700px" value="{{$detail.bl_magazine_link}}" />
      </td>
    </tr>
   
   
    <tr>
     <th>Updated Last</th>
     <td>
     <input type="text" name="{{$TABLE}}[bl_ml_updated_last]"  value="{{$detail.bl_ml_updated_last}}" class="w16em dateformat-d-ds-m-ds-Y dtpic" /> 
     </td>
    </tr>
   
    <tr>
     <th>Website Link</th>
     <td>
         <input type="text"  name="{{$TABLE}}[bl_website_link]" style ="width:700px" value="{{$detail.bl_website_link}}" />
      </td>
    </tr>
   
   
    <tr>
     <th>Updated Last</th>
     <td>
     <input type="text" name="{{$TABLE}}[bl_wl_updated_last]"  value="{{$detail.bl_wl_updated_last}}" class="w16em dateformat-d-ds-m-ds-Y dtpic" /> 
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
			frmvalidator.addValidation("{{$TABLE}}[al_item]","req", "Please specify item.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_company_name]","req", "Please specify company name.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_contact_name]","req", "Please specify contact name.");
    </script>
</div>