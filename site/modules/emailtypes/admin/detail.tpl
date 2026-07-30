 <script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<div class="newdiv">
<h3 class="page-title">{{$title}}</h3>
<br />
<form name="template" method="post" action="{{$BASE_URL}}{{$XFA.detail}}" enctype="multipart/form-data">
	<input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
	<table id="product-table" align="center" width="98%">
  
    <tr>    
			<th class="labelhead" width="30%">Email Type:</th>
			<td><input type="text" name="{{$TABLE}}[emt_name]" value="{{$detail.emt_name}}" style="width:300px;" /></td>
	</tr>
	 <tr>    
			<th class="labelhead">Show in customer section:</th>
			<td><input type="checkbox" name="{{$TABLE}}[emt_csa_status]" {{if $detail.emt_csa_status == 1}} checked="checked" {{/if}} /></td>
	</tr>
		<tr>
			<td colspan="2" style="text-align:center">
            <input class="addButtons" type="submit" value="{{$button}}" name="subAddDetail">
				&nbsp;
				<input class="addButtons" type="button" value="Cancel" onclick="document.location.href='{{$BASE_URL}}{{$XFA.list}}';">
			</td>
		</tr>


    </table>
</form>
</div>
<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("template");
    frmvalidator.EnableMsgsTogether();
    frmvalidator.addValidation("{{$TABLE}}[emt_name]",   "req", "Please specify email type.");
</script>
