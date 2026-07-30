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
     <th>Business</th>
     <td>
         <input type="text"  name="{{$TABLE}}[sa_business]" style ="width:700px" value="{{$detail.sa_business}}" />
      </td>
    </tr>
   
    <tr>
     <th>What</th>
     <td>
     <input type="text" name="{{$TABLE}}[sa_what]"  value="{{$detail.sa_what}}" style ="width:700px" /> </td>
    </tr>
   
    <tr>
     <th>Who</th>
     <td>
         <input type="text"  name="{{$TABLE}}[sa_who]" style ="width:700px" value="{{$detail.sa_who}}" />
      </td>
    </tr>
   
     <tr>
        <th>Email</th>
        <td>
         <input type="text"  name="{{$TABLE}}[sa_email]" style ="width:700px" value="{{$detail.sa_email}}" />
        </td>
     </tr>
 
   <tr>
        <th>Phone </th>
        <td>
         <input type="text"  name="{{$TABLE}}[sa_phone]" style ="width:700px" value="{{$detail.sa_phone}}" />
        </td>
     </tr>
 
   <tr>
        <th>Document</th>
        <td>
        <input type="file" name="doc1" />
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