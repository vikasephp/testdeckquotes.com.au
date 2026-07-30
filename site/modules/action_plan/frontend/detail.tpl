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
     <th>Action Plan</th>
     <td>
         <input type="text"  name="{{$TABLE}}[ap_action_plan]" style ="width:700px" value="{{$detail.ap_action_plan}}" />
      </td>
    </tr>
   
     <tr>
        <th>Sharepoint Link</th>
        <td>
         <input type="text"  name="{{$TABLE}}[ap_link]" style ="width:700px" value="{{$detail.ap_link}}" />
        </td>
     </tr>
   
   <tr>
        <th>Asana Link</th>
        <td>
         <input type="text"  name="{{$TABLE}}[ap_asana_link]" style ="width:700px" value="{{$detail.ap_asana_link}}" />
        </td>
     </tr>
   
   <tr>
     <th>Who Responsible</th>
     <td>
         <input type="text"  name="{{$TABLE}}[ap_who_responsible]" style ="width:700px" value="{{$detail.ap_who_responsible}}" />
      </td>
    </tr>
   
   
    <tr>
     <th>Last reviewed and Updated</th>
     <td>
     <input type="text" name="{{$TABLE}}[ap_last_rev_updated]"  value="{{$detail.ap_last_rev_updated}}" class="w16em dateformat-d-ds-m-ds-Y dtpic" /> 
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