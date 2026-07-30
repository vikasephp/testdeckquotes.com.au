<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<div align="center" style="min-height:650px;">
    <h3 class="page-title">{{$title}}</h3>    
    {{if $opr}}
	<div align="center" style="min-height:350px; padding-top:200"><h3>Success...!</h3></div>
    {{else}}
     <form name="detail" method="post" action="{{$XFA.detail}}" enctype="multipart/form-data">
        <table id="new-table" width="90%">
            <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
            <tr>
                <th>Brand Name:</th>
                <td><input type= "text" name="{{$TABLE}}[br_name]" value="{{$detail.br_name}}" class="xlrg" /></td>
            </tr>
			<tr>
                <th>Brand Website:</th>
                <td><input type= "text" name="{{$TABLE}}[br_website]" value="{{$detail.br_website}}" class="xlrg" /></td>
            </tr>
           <tr>
                <th>Brand Logo:</th>
                <td><input type= "file" name="logo" /> &nbsp;&nbsp;{{if $detail.br_logo}}<img src="{{$BASE_URL}}files/suppliers/brandslogo/{{$detail.br_logo}}" />{{/if}}</td>
            </tr>
            <tr>
                <th width="200">Status:</th>
                <td>
                    <select name="{{$TABLE}}[br_status]" class="input" />
                    <option value="Inactive" {{if $detail.br_status == "Inactive"}} selected {{/if}}>Inactive</option> 
                    <option value="Active" {{if $detail.br_status == "Active"}} selected {{/if}}>Active</option> 
                    </select>    
                </td>
            </tr>  
            <tr>
                <td colspan="2" style="text-align:center;">
                    <input type="submit" name="subAddDetail" value="Save" class="vsml" />
                    <input type="button" name="btnCancelDetail" value="Cancel" onclick="javascript:parent.$.fancybox.close();" class="vsml" />
                </td>
            </tr>
        </table>
    </form>
   <script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("detail");
    frmvalidator.EnableMsgsTogether();
    frmvalidator.addValidation("{{$TABLE}}[br_name]","req", "Please specify title.");
	frmvalidator.addValidation("{{$TABLE}}[br_website]","req", "Please specify website.");
    </script> 
   {{/if}} 
</div>
