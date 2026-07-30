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
		<input type="hidden" name="type[psruo_id]" value="{{$detail.psruo_id}}" />
		<input type="hidden" name="type[psruo_bsn_id]" value="{{$bsn_id}}" />
	   
	   {{if $error}}<tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
	   
		<tr>
			<th>Buyer Name</th>
			<td><input type="text" name="type[psruo_buyer_name]" style="width:150px" value="{{$detail.psruo_buyer_name}}" /></td>
		</tr>
		
		<tr>
			<th>Offer Type</th>
			<td>
				<select name="type[psruo_offer_type]" style="width:150px">
					<option value="">Select</option>
					<option value="Initial Offer" {{if $detail.psruo_offer_type eq 'Initial Offer'}}selected{{/if}}>Initial Offer</option>
					<option value="Revised Offer" {{if $detail.psruo_offer_type eq 'Revised Offer'}}selected{{/if}}>Revised Offer</option>
				</select>
			</td>
		</tr>
		
		<tr>
			<th>Price</th>
			<td><input type="text" name="type[psruo_price]" style="width:150px" value="{{$detail.psruo_price}}" /></td>
		</tr>
		
		<tr>
			<th>Date</th>
			<td>
				<input type="text" name="type[psruo_date]" value="{{$detail.psruo_date}}" class="w16em dateformat-d-ds-m-ds-Y dtpic" />
			</td>
		</tr>
		
		<tr>
			<th>Notes</th>
			<td>
				<textarea name="type[psruo_notes]" style="width:95%;" rows="5">{{$detail.psruo_notes}}</textarea>
			</td>
		</tr>
		
		<tr>
			<th>Offer Date</th>
			<td>
				<input type="text" name="type[psruo_offer_date]" value="{{$detail.psruo_offer_date}}" class="w16em dateformat-d-ds-m-ds-Y dtpic" />
			</td>
		</tr>
		
		<tr>
			<th>Offer Letter Link</th>
			<td>
				<input type="text" name="type[psruo_offer_letter_link]" style="width:95%" value="{{$detail.psruo_offer_letter_link}}" />
			</td>
		</tr>
		
		<tr>
			<th>Sales Advice Link</th>
			<td>
				<input type="text" name="type[psruo_sales_advice_link]" style="width:95%" value="{{$detail.psruo_sales_advice_link}}" />
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
		}
	</script>
    
	<script type="text/javascript" language="javascript" >
      	 	var frmvalidator  = new Validator("detail");
			frmvalidator.EnableMsgsTogether();
			frmvalidator.addValidation("type[psruo_buyer_name]","req", "Please Specify Buyer Name.");
	</script>
</div>