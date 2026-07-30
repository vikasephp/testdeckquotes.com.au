 
 <link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />

 <script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<div class="newdiv">
<h3 class="page-title">Add Option</h3>
<br />


<form name="template" method="post" action="" enctype="multipart/form-data">
	<input type="hidden" name="option[to_id]" value="{{$detail.to_id}}" />
        <input type="hidden" name="option[to_type_id]" value="{{$tm_id}}" />
	<table id="list-table" align="center" width="98%">
       {{if $msg }}
       <tr><td colspan="2" style="text-align:center" >
        <span style="color:#F00;"><strong>{{$msg }}</strong></span>{{/if}}
       </td>
       </tr>
  
        <tr>    
        <th class="labelhead" width="30%">Option Name:</th>
        <td><input type="text" name="option[to_option]" value="{{$detail.to_option}}" style="width:300px;" /></td>
	</tr>
	
	<tr>
	<td colspan="2" style="text-align:center">
            <input class="addButtons" type="submit" value="Save" name="subAddDetail">
				&nbsp;
	    <input class="addButtons" type="button" value="Cancel" onclick="document.location.href='{{$BASE_URL}}typeAdmin.view_options/tm_id/{{$tm_id}}';">
	</td>
	</tr>
    </table>
</form>
</div>
<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("template");
    frmvalidator.EnableMsgsTogether();
    frmvalidator.addValidation("option[to_option]",   "req", "Please specify option.");
</script>
