<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

{{if $opr}}
<script type="text/javascript">

//alert({{$car_id}});

//setTimeout('parent.close_win();', 500);
window.location.href = "{{$BASE_URL}}construction_alert_report.viewstep/car_id/{{$car_id}}";
</script>
{{/if}}

<div align="center" style="min-height:350px;"><br /><br />
    <h3 class="page-title">Add/Edit Action Steps</h3>    
   <br />
   
<form name="detail" method="post" action="{{$XFA.add_steps}}"  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="desc[apd_car_id]" value="{{$car_id}}" />
    <input type="hidden" name="desc[apd_id]" value="{{$detail.apd_id}}" />
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
    <tr>
     <th>Description</th>
     <td><input type="text"  name="desc[apd_step_desc]" style ="width:700px" value="{{$detail.apd_step_desc}}" /></td>
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
		//setTimeout('parent.close_win();', 500);
		window.location.href = "{{$BASE_URL}}construction_alert_report.viewstep/car_id/{{$car_id}}";
		}
	</script>
    
	<script type="text/javascript" language="javascript" >
        var frmvalidator  = new Validator("detail");
			frmvalidator.EnableMsgsTogether();
			frmvalidator.addValidation("desc[dt_name]","req", "Please specify project.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_company_name]","req", "Please specify company name.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_contact_name]","req", "Please specify contact name.");
    </script>
</div>