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

<div align="center" style="min-height:350px;"><br />
    <h3 class="page-title">Export to Excel</h3>    <br />
   
   
<form name="detail" method="post" action="{{$BASE_URL}}designer_tracker.export_status" enctype="multipart/form-data">
<table id="list-table" width="40%">
    <tr>
		<th>Select Status</th>
		<td>
			<select name="{{$TABLE}}[item_status]">
				<option value="">Please Select</option>
				{{foreach from=$exportStatus key="key_status" item="item_status"}}
				<option value="{{$item_status.tdt_status}}"> 
					{{$item_status.tdt_status}}
				</option>
			{{/foreach}}
			</select> 
		</td>
    </tr>
	  
    <tr>
        <td colspan="2" style="text-align:center;">
          <input type="submit" name="subAddDetail" value="Export" class="vsml" />
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
			frmvalidator.addValidation("{{$TABLE}}[item_status]","req", "Please Select Status First Before Generating Excel.");
    </script>
</div>