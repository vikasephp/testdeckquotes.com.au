<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />

<style>
.chk input[type="checkbox"] {
  display: none;
}

 input[type="checkbox"] + label:before {
  background: #F00 ;	
  border: 1px solid #7f83a2;
  content: "\00a0";
  display: inline-block;
  font: 16px/1em sans-serif;
  height: 16px;
  margin: 0 .25em 0 0;
  padding: 0;
  vertical-align: top;
  width: 16px;
}
 input[type="checkbox"]:checked + label:before {
  background: #FFF ;
  color: #666;
  content: "\2713";
  text-align: center;
  cursor:pointer;
}
</style>

<script src="{{$BASE_URL}}ckeditor2/ckeditor.js"></script>
<script src="{{$BASE_URL}}ckeditor2/samples/js/sample.js"></script>

<script type="text/javascript">
   CKEDITOR.replace( 'editor1' );
   CKEDITOR.add  
</script>

<script type="text/javascript">
   CKEDITOR.replace( 'editor2' );
   CKEDITOR.add  
</script>

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
			<th width="100">Customer Email:</th>
			<td>
				<input type="text" name="dual_occupancy_lead_report[dolr_customer_email]" value="{{$detail.dolr_customer_email}}"style="width: 90%;" {{if $detail.dolr_customer_email}}readonly{{/if}}/>
			</td>
		</tr>
		
		<tr>
			<th width="100">Customer:</th>
			<td>
				<input type="text" name="dual_occupancy_lead_report[dolr_customer_name]" value="{{$detail.dolr_customer_name}}"style="width: 90%;" {{if $detail.dolr_customer_name}}readonly{{/if}}/>
			</td>
		</tr>
		
		<tr>
			<th>Project Address</th>
			<td>
				<input type="text" name="dual_occupancy_lead_report[dolr_project_address]" value="{{$detail.dolr_project_address}}" style="width: 90%;" {{if $detail.dolr_project_address}}readonly{{/if}}/>
			</td>
		</tr>
		
		<tr>
			<th>Phone Number</th>
			<td>
				<input type="text" name="dual_occupancy_lead_report[dolr_phone_number]" value="{{$detail.dolr_phone_number}}" style="width: 90%;" {{if $detail.dolr_phone_number}}readonly{{/if}}/>
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
		frmvalidator.addValidation("{{$TABLE}}[question]","req", "Please specify question.");
</script>
</div>
<script>
	initSample();
</script>