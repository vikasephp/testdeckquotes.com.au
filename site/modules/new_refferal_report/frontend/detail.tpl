<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />


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
     <th>Refers Name</th>
     <td><input  type="text" name="{{$TABLE}}[rr_refers_name]"  value="{{$detail.rr_refers_name}}" style="width:700px;" /> </td>
    </tr>
   
   <tr>
     <th>Refers Email</th>
     <td><input  type="text" name="{{$TABLE}}[rr_refers_email]"  value="{{$detail.rr_refers_email}}" style="width:700px;"  /> </td>
    </tr>
   
   <tr>
     <th>Refers Mobile</th>
     <td><input  type="text" name="{{$TABLE}}[rr_rr_refers_mobile]"  value="{{$detail.rr_rr_refers_mobile}}" style="width:700px;"  /> </td>
    </tr>
    
   <tr>
     <th>Who they Referred</th>
     <td><input  type="text" name="{{$TABLE}}[rr_who_they]"  value="{{$detail.rr_who_they}}" style="width:700px;"  /> </td>
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
		frmvalidator.addValidation("{{$TABLE}}[rl_reffering_address]","req", "Please specify referring address.");
		frmvalidator.addValidation("{{$TABLE}}[rl_reffered_address]","req", "Please specify referred address.");
			
    </script>
</div>

