<script>
	!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>
{{include file=$jdata}}
{{include file=$tiny_basic}}
<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

<style>
.dtpic {
	width: 100px !important;
	height: 22px;
	padding-top: 1px !important;
	padding-bottom: 1px !important;
	margin-bottom: 0px !important;
}
#list-table th {
    width: 180px;
}
</style>

{{if $opr}}
<script type="text/javascript">
//window.location.href = "{{$BASE_URL}}properties_sale_reports.view_project/bsn_id/$bsn_id";
setTimeout(function() {
	if (window.parent && window.parent !== window) {
		window.parent.location.reload();
		if (window.parent.jQuery && window.parent.jQuery.fancybox) {
			window.parent.jQuery.fancybox.close();
		}
	} else {
		window.location.reload();
	}
}, 500);
</script>
{{/if}}

<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
    <h3 class="page-title">{{$title}}</h3> 
	{{if $opr}}
	<h3 class="page-title">Record Saved</h3> 
	{{/if}}
    
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="type[psri_id]" value="{{$detail.psri_id}}" />
	<input type="hidden" name="type[psri_bsn_id]" value="{{$bsn_id}}" />
   
   {{if $error}}<tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
	<tr>
		<th>Invoice Number </th>
		<td><input type="text" name="type[psri_numb]" style="width:150px" value="{{$detail.psri_numb}}" /></td>
    </tr>
	
	<tr>
		<th>Invoice MSTeam Link </th>
		<td>
			<textarea name="type[psri_link]" style="width:95%;" rows="5">{{$detail.psri_link}}</textarea>
		</td>
    </tr>
	
	<tr>
		<th>Invoice Amount </th>
		<td><input type="text" name="type[psri_invoice_amount]" style="width:150px" value="{{$detail.psri_invoice_amount}}" /></td>
    </tr>
	
	<tr>
		<th>Invoice Created Date </th>
		<td>
			<div>
				<input type="text" name="type[psri_createddate]" value="{{$detail.psri_createddate}}" class="w16em dateformat-d-ds-m-ds-Y dtpic" value="{{$item.psri_createddate}}" />
			</div>
		</td>
    </tr>
	
	<tr>
		<th>Invoice Due Date</th>
		<td>
			<div>
				<input type="text" name="type[psri_duedate]" value="{{$detail.psri_duedate}}" class="w16em dateformat-d-ds-m-ds-Y dtpic" value="{{$item.psri_duedate}}" />
			</div>
		</td>
    </tr>
	
	<tr>
		<th>Notes </th>
		<td>
			<textarea name="type[psri_notes]" style="width:95%;" rows="5">{{$detail.psri_notes}}</textarea>
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
			setTimeout(function() {
				parent.$.fancybox.close();
			}, 500);
			//window.location.href = "{{$BASE_URL}}properties_sale_reports.view_project/bsn_id/{{$bsn_id}}";
		}
	</script>
    
	<script type="text/javascript" language="javascript" >
      	 	var frmvalidator  = new Validator("detail");
			frmvalidator.EnableMsgsTogether();
			//frmvalidator.addValidation("type[splat_option]","req", "Please specify type.");
	</script>
</div>