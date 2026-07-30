<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 200);
</script>
{{/if}}

<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
    <h3 class="page-title">Edit Critical Numbers Data</h3>    
   
	<form name="detail" method="post" action="" enctype="multipart/form-data">
		<table id="list-table" width="100%">
			<input type="hidden" name="measurment[{{ $primary_id }}]" value="{{$detail.$primary_id}}" />
		   
			{{if $error}}
			<tr>
				<th colspan="2" style="color:#FF0000;">{{$error}}</th>
			</tr>
			{{/if}}
		   
			<tr>
				<th>Weekly Goal </th>
				<td>
				  <input type="text"  name="measurment[cn_weekly_goal]" style ="width:700px" value='{{if $detail.cn_weekly_goal gte 0}}{{$detail.cn_weekly_goal|regex_replace:"/\.0+$/":""}}{{/if}}' />
				</td>
			</tr>
			{{if $detail.cn_id neq 24 and $detail.cn_id neq 25 and $detail.cn_id neq 26 and $detail.cn_id neq 27 }}
			<tr>
				<th>YTD Goal </th>
				<td>
				  <input type="text"  name="measurment[cn_ytd_goal]" style ="width:700px" value='{{if $detail.cn_ytd_goal gte 0}}{{$detail.cn_ytd_goal|regex_replace:"/\.0+$/":""}}{{/if}}' />
				</td>
			</tr>
			{{/if}}
			<tr>
				<th>Where data comes from </th>
				<td>
				  <input type="text"  name="measurment[cn_datacome]" style ="width:700px" value="{{$detail.cn_datacome}}" />
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
	function closepop() {
		setTimeout('parent.close_win();', 200);
	}
	</script>
    
	<script type="text/javascript" language="javascript" >
      	var frmvalidator  = new Validator("detail");
		frmvalidator.EnableMsgsTogether();
	</script>
</div>