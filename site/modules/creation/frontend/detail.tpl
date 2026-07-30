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
    <form name="detail" method="post" action="" enctype="multipart/form-data">
        <table id="new-table" width="90%">
            <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
            <tr>
                <th width="100">Supplier Name:</th>
                <td><input type= "text" name="{{$TABLE}}[sp_name]" value="{{$detail.sp_name}}" class="xlrg" /></td>
            </tr>
			<tr>
                <th>Supplier Website:</th>
                <td><input type= "text" name="{{$TABLE}}[sp_website]" value="{{$detail.sp_website}}" class="xlrg" /></td>
            </tr>
            <tr>
                <th>Email:</th>
                <td><input type= "text" name="{{$TABLE}}[sp_email]" value="{{$detail.sp_email}}" class="xlrg" /></td>
            </tr>
            <tr>
                <th>Phone:</th>
                <td><input type= "text" name="{{$TABLE}}[sp_phone]" value="{{$detail.sp_phone}}" class="xlrg" /></td>
            </tr>
             <tr>
                <th>Fax:</th>
                <td><input type= "text" name="{{$TABLE}}[sp_fax]" value="{{$detail.sp_fax}}" class="xlrg" /></td>
            </tr>
            <tr>
                <th>ABN:</th>
                <td><input type= "text" name="{{$TABLE}}[sp_abn]" value="{{$detail.sp_abn}}" class="xlrg" /></td>
            </tr>
            <tr>
                <th>Notes:</th>
                <td><textarea cols="84" id="editor1" name="{{$TABLE}}[sp_notes]" rows="10">{{$detail.sp_notes}}</textarea>    
                </td>
            </tr>
             <tr>
                <th>Supplier Logo:</th>
                <td><input type= "file" name="logo" /> &nbsp;&nbsp;{{if $detail.sp_logo}}<img src="{{$BASE_URL}}files/suppliers/logo/{{$detail.sp_logo}}" />{{/if}}</td>
            </tr>
             <tr>
                <th width="20">Status:</th>
                <td>
                    <select name="{{$TABLE}}[sp_status]" class="input" />
                    <option value="Inactive" {{if $detail.sp_status == "Inactive"}} selected {{/if}}>Inactive</option> 
                    <option value="Active" {{if $detail.sp_status == "Active"}} selected {{/if}}>Active</option> 
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
    frmvalidator.addValidation("{{$TABLE}}[sp_name]","req", "Please specify title.");
	frmvalidator.addValidation("{{$TABLE}}[sp_website]","req", "Please specify website.");
	frmvalidator.addValidation("{{$TABLE}}[sp_email]","req", "Please specify email.");
</script> 
   {{/if}} 
</div>
