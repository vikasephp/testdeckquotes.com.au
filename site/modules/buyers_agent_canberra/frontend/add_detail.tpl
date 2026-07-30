<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />

{{if $opr}}
<script type="text/javascript">
//window.location.href = "{{$BASE_URL}}{{$BASEFOLDER}}.home";
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
<h3 class="page-title">{{$title}} Detail</h3>    
    
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="type[bac_id]" value="{{$detail.bac_id}}" />
	
	<tr>
		<th>Link</th>
		<td><input type="text" name="type[bac_link]" style="width:700px" value="{{$detail.bac_link}}" /></td>
    </tr>
	
	<tr>
		<th>Address</th>
		<td>
			<textarea rows="5" name="type[bac_address]" placeholder="Enter Address" style="width: 700px;">{{$detail.bac_address}}</textarea>
		</td>
    </tr>
	
	<tr>
		<th>Price</th>
		<td><input type="text" name="type[bac_price]" style="width:700px" value="{{$detail.bac_price}}" /></td>
    </tr>
	
	<tr>
		<th>Rent</th>
		<td><input type="text" name="type[bac_rent]" style="width:700px" value="{{$detail.bac_rent}}" /></td>
    </tr>
	
	<tr>
		<th>Design</th>
		<td><input type="text" name="type[bac_design]" placeholder="Enter Design Number" style="width:700px" value="{{$detail.bac_design}}" /></td>
    </tr>
	
	<tr>
		<th>Rent2</th>
		<td><input type="text" name="type[bac_rent2]" style="width:700px" value="{{$detail.bac_rent2}}" /></td>
    </tr>
	
	<tr>
		<th>Agent Link</th>
		<td><input type="text" name="type[bac_agent_link]" style="width:700px" value="{{$detail.bac_agent_link}}" /></td>
    </tr>
   
    <tr>
        <td colspan="2" style="text-align:center;">
          <input type="submit" name="subAddDetail" value="Save" class="vsml" />
          <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:parent.$.fancybox.close();" class="vsml" />
        </td>
    </tr>
</table>
</form>
    
<script type="text/javascript">
function closepop()
{
	window.location.href = "{{$BASE_URL}}{{$BASEFOLDER}}.home";
}
</script>

<script type="text/javascript" language="javascript" >
	var frmvalidator  = new Validator("detail");
	frmvalidator.EnableMsgsTogether();
	frmvalidator.addValidation("type[bac_address]","req", "Please specify Address.");
</script>
</div>