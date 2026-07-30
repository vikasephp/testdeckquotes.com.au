 <script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<div class="newdiv">
<h3 class="page-title">{{$title}}</h3>
<br />

{{if $msg }} <span style="color:#F00;"><strong>{{$msg }}</strong></span>{{/if}}
<form name="template" method="post" action="{{$BASE_URL}}{{$XFA.detail}}" enctype="multipart/form-data">
	<input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
	<table id="product-table" align="center" width="98%">
  
        <tr>    
			<th class="labelhead" width="30%">Type:</th>
			<td><input type="text" name="{{$TABLE}}[tm_type]" value="{{$detail.tm_type}}" style="width:300px;" /></td>
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
    frmvalidator.addValidation("{{$TABLE}}[tm_type]",   "req", "Please specify type.");
</script>
