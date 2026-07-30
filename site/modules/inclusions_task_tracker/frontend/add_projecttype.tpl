<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

{{if $opr}}
<script type="text/javascript">
//setTimeout('parent.close_win();', 500);

window.location.href = "{{$BASE_URL}}inclusions_task_tracker.view_projecttype";
</script>
{{/if}}

<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
<h3 class="page-title">{{$title}}</h3>    
   
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="letter[itt_pt_id]" value="{{$detail.itt_pt_id}}" />
   
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
    
    <tr>
		<th>Letter Text </th>
		<td>
			<textarea name="letter[itt_pt_option]" cols="180" rows="6">{{$detail.itt_pt_option}}</textarea>
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
		window.location.href = "{{$BASE_URL}}inclusions_task_tracker.view_projecttype";
		}
	</script>
    
	<script type="text/javascript" language="javascript" >
        var frmvalidator  = new Validator("detail");
			frmvalidator.EnableMsgsTogether();
			frmvalidator.addValidation("letter[itt_pt_option]","req", "Please specify project type.");
			
    </script>
</div>