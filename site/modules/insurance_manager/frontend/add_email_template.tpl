<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />

{{if $opr}}
<script type="text/javascript">
window.location.href = "{{$BASE_URL}}{{$BASEFOLDER}}.view_email_template";
</script>
{{/if}}

<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
<h3 class="page-title">{{$title}} Email Template</h3>    
    
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="type[ime_id]" value="{{$detail.ime_id}}" />
    
    
    <tr>
        <th>Email Template 123</th>
        <td>
            <select name="type[ime_email_template]" />
            <option value="0" {{if $detail.ime_email_template eq '' }} selected="selected" {{/if}}>Please Select </option>
            {{foreach from = $emailData key="key2" item="item2"}}
            <option value="{{$item2.eml_code}}" {{if $item2.eml_code eq $detail.ime_email_template }} selected="selected"
                {{/if}}>{{$item2.eml_code}}</option>
            {{/foreach}}
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
	window.location.href = "{{$BASE_URL}}{{$BASEFOLDER}}.view_email_template";
}
</script>

<script type="text/javascript" language="javascript" >
	var frmvalidator  = new Validator("detail");
	frmvalidator.EnableMsgsTogether();
	frmvalidator.addValidation("type[bacs_option]","req", "Please specify Option.");
</script>
</div>