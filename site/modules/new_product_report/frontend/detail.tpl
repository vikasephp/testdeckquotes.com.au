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

<div align="center" style="min-height:350px;">
    <h3 class="page-title">{{$title}}</h3>    
   
   
<form name="detail" method="post" action="{{$XFA.detail}}"  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
    <tr>
     <th>Ms Team Link</th>
     <td>
         <input type="text"  name="{{$TABLE}}[np_msteam_link]" style ="width:700px" value="{{$detail.np_msteam_link}}" />
      </td>
    </tr>
   
    <tr>
     <th>Description</th>
     <td>
     <input type="text" name="{{$TABLE}}[np_description]"  style ="width:700px" value="{{$detail.np_description}}"  /> </td>
    </tr>
   
    <tr>
     <th>Latest Concept Plan</th>
     <td>
           <input type="file" name="plan" />
      </td>
    </tr>
   
     <tr>
        <th>Local Designer</th>
        <td>
         <input type="text"  name="{{$TABLE}}[np_local_designer]" style ="width:700px" value="{{$detail.np_local_designer}}" />
        </td>
     </tr>
 
   <tr>
        <th>Overseas Designer</th>
        <td>
         <input type="text"  name="{{$TABLE}}[np_overseas_designer]" style ="width:700px" value="{{$detail.np_overseas_designer}}" />
        </td>
     </tr>
 
   <tr>
        <th>Priority</th>
        <td>
        <select name="{{$TABLE}}[np_priority]">
        <option value="Low">Low</option>
        <option value="Medium">Medium</option>
        <option value="High">High</option>
        </select>
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