<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

{{if $opr}}
<script type="text/javascript">
//setTimeout('parent.close_win();', 500);

window.location.href = "{{$BASE_URL}}design_report.viewletter";
</script>
{{/if}}

<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
    <h3 class="page-title">Add/Edit New Letter</h3>    
   
   
<form name="detail" method="post" action="{{$XFA.add_task}}"  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="letter[lt_id]" value="{{$detail.lt_id}}" />
   
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
    <tr>
     <th width="10%">Letter Code </th>
     <td>
          <input type="text"  name="letter[lt_code]" style ="width:100px" value="{{$detail.lt_code}}" />
      </td>
    </tr>
    
    <tr>
     <th>Letter Text </th>
     <td>
       
          <textarea name="letter[lt_text]" cols="180" rows="6">{{$detail.lt_text}}</textarea>
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
		//setTimeout('parent.close_win();', 500);
		window.location.href = "{{$BASE_URL}}design_report.viewletter";
		}
	</script>
    
	<script type="text/javascript" language="javascript" >
        var frmvalidator  = new Validator("detail");
			frmvalidator.EnableMsgsTogether();
			frmvalidator.addValidation("letter[lt_code]","req", "Please specify letter code.");
			
    </script>
</div>