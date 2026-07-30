<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
//window.location.href = "{{$BASE_URL}}design_estimates_report.home_active";
</script>
{{/if}}

<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
<h3 class="page-title">{{$title}} Design Estimates Report Links</h3>    

<form name="detail" method="post" action=""  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="type[dpn_unique_id]" value="{{$detail.dpn_unique_id}}" />
   
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
    <tr>
		<th>Estimate Build Current Link</th>
		<td>
			<textarea name="type[dpn_est_build_link_current]" cols="180" rows="3">{{$detail.dpn_est_build_link_current}}</textarea>
		</td>
    </tr>
	
	<tr>
		<th>Estimate Build Historical Link</th>
		<td>
			<textarea name="type[dpn_est_build_link_historical]" cols="180" rows="3">{{$detail.dpn_est_build_link_historical}}</textarea>
		</td>
    </tr>
	
	<tr>
		<th>Likely Scope Current Link</th>
		<td>
			<textarea name="type[dpn_likely_scope_link_current]" cols="180" rows="3">{{$detail.dpn_likely_scope_link_current}}</textarea>
		</td>
    </tr>
	
	<tr>
		<th>Likely Scope Historical Link</th>
		<td>
			<textarea name="type[dpn_likely_scope_link_historical]" cols="180" rows="3">{{$detail.dpn_likely_scope_link_historical}}</textarea>
		</td>
    </tr>
	
	<tr>
		<th>Renovation Current Link</th>
		<td>
			<textarea name="type[dpn_reno_link_current]" cols="180" rows="3">{{$detail.dpn_reno_link_current}}</textarea>
		</td>
    </tr>
	
	<tr>
		<th>Renovation Historical Link</th>
		<td>
			<textarea name="type[dpn_reno_link_historical]" cols="180" rows="3">{{$detail.dpn_reno_link_historical}}</textarea>
		</td>
    </tr>
	
	<tr>
		<th>Unit Title Current Link</th>
		<td>
			<textarea name="type[dpn_ut_link_current]" cols="180" rows="3">{{$detail.dpn_ut_link_current}}</textarea>
		</td>
    </tr>
	
	<tr>
		<th>Unit Title Historical Link</th>
		<td>
			<textarea name="type[dpn_ut_link_historical]" cols="180" rows="3">{{$detail.dpn_ut_link_historical}}</textarea>
		</td>
    </tr>
   
   <tr>
		<th>Build Cal Rev No Current Link</th>
		<td>
			<textarea name="type[dpn_build_cal_current]" cols="180" rows="3">{{$detail.dpn_build_cal_current}}</textarea>
		</td>
    </tr>
   
    <tr>
		<th>Build Cal Rev No Historical Link</th>
		<td>
			<textarea name="type[dpn_build_cal_historical]" cols="180" rows="3">{{$detail.dpn_build_cal_historical}}</textarea>
		</td>
    </tr>
   
   
   <tr>
		<th>Reno Cal Rev No Current Link</th>
		<td>
			<textarea name="type[dpn_reno_cal_current]" cols="180" rows="3">{{$detail.dpn_reno_cal_current}}</textarea>
		</td>
    </tr>
   
    <tr>
		<th>Reno Cal Rev No Historical Link</th>
		<td>
			<textarea name="type[dpn_reno_cal_historical]" cols="180" rows="3">{{$detail.dpn_reno_cal_historical}}</textarea>
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
		//window.location.href = "{{$BASE_URL}}design_estimates_report.home_active";
		}
	</script>
    
	<script type="text/javascript" language="javascript" >
        var frmvalidator  = new Validator("detail");
			frmvalidator.EnableMsgsTogether();
			//frmvalidator.addValidation("task[dpn_est_build_link_current]","req", "Please specify Link.");
    </script>
</div>