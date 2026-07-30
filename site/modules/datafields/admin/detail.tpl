 <script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<div class="newdiv">
<h3 class="page-title">{{$title}}</h3>
<br />
<form name="template" method="post" action="{{$BASE_URL}}{{$XFA.detail}}" enctype="multipart/form-data">
	<input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
	<table id="product-table" align="center" width="98%">
  
    <tr>    
			<th class="labelhead" width="10%">Data Type:</th>
			<td><input type="text" name="{{$TABLE}}[df_name]" value="{{$detail.df_name}}" style="width:300px;" /></td>
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
    frmvalidator.addValidation("{{$TABLE}}[df_name]",   "req", "Please specify name.");
</script>
