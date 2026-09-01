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
			<th>Project Address</th>
			<td>
				<datalist id='address'>
				{{foreach from=$busdetail key="key2" item="item2"}}
				<option value="{{$item2.bsn_address}}">
				{{$item2.bsn_address}}
				</option>
				{{/foreach}}
				</datalist>
				
				<input type="text" name="project_delay_register[pdr_project_address]" list="address" value="{{$detail.pdr_project_address}}" style="width: 400px;"/>
			</td>
		</tr>
		
		<tr>
			<th width="100">Location:</th>
			<td>
				<select name="project_delay_register[pdr_location]">
					<option value="">Please select Location</option>
					<option value="North" {{if $detail.pdr_location eq 'North'}}selected="selected"{{/if}}>North</option>
					<option value="South" {{if $detail.pdr_location eq 'South'}}selected="selected"{{/if}}>South</option>
				</select>
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
		frmvalidator.addValidation("project_delay_register[pdr_project_address]","req", "Please specify Project Address.");
</script>
</div>
<script>
	initSample();
</script>