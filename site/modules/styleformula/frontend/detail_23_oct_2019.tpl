<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
{{include file=$tiny_editor}}
{{if $opr}}

<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<div align="center" style="min-height:350px;">
    <h3 class="page-title">{{$title}}</h3>    
    {{if $opr}}
	<div align="center" style="min-height:350px; padding-top:200"><h3>Success...!</h3></div>
    {{else}}
      <form name="detail" method="post" action="{{$XFA.detail}}" enctype="multipart/form-data">
        <table id="list-table" width="100%">
            <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
           {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
            <tr>
                <th width="100">Type:</th>
                <td>
                    <select name="{{$TABLE}}[sftype_id]" class="xlrg" />
                    <option value="0">-- Select --</option>
                    {{foreach from=$formulatypes key="key" item="item"}}
                    <option value="{{$item.sft_id}}" {{if $item.sft_id == $detail.sftype_id}}selected{{/if}}>{{$item.sft_title}}</option>
                    {{/foreach}}
                    </select>    
                </td>
            </tr>
            <tr>
                <th width="100">Title:</th>
                <td><input type= "text" name="{{$TABLE}}[sf_title]" value="{{$detail.sf_title}}" class="xlrg" style="width:480px;" /></td>
            </tr>
 
             <tr>
                <th width="100">Component:</th>
                <td><input type= "text" name="{{$TABLE}}[sf_component]" value="{{$detail.sf_component}}" class="xlrg" style="width:480px;" /></td>
            </tr>       
            <tr>
                <th>Text Body:</th>
                <td width="500px">
                <table  width="500" id="none-table22"><tr><td>
                <textarea cols="50" id="editor1" name="{{$TABLE}}[sf_body]" rows="10" class="tinymce">{{$detail.sf_body|stripslashes}}</textarea>    
                </td></tr></table>
                </td>
            </tr>
            
              <tr>
                <th>Formula:</th>
                <td width="500px">
                <table  width="500" id="none-table22"><tr><td>
                <textarea cols="50" name="{{$TABLE}}[sf_formula_body]" rows="10" class="tinymce">{{$detail.sf_formula_body|stripslashes}}</textarea>    
                </td></tr></table>
                </td>
            </tr>
            
            
            <tr>
                <th width="20">Status:</th>
                <td>
                    <select name="{{$TABLE}}[sf_status]" class="input" style="width:180px;" />
                    <option value="Inactive" {{if $detail.sf_status == "Inactive"}} selected {{/if}}>Inactive</option> 
                    <option value="Active" {{if $detail.sf_status == "Active"}} selected {{/if}}>Active</option> 
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
			frmvalidator.addValidation("{{$TABLE}}[sftype_id]","dontselect=0", "Please select type.");
			frmvalidator.addValidation("{{$TABLE}}[sf_title]","req", "Please specify title.");
			frmvalidator.addValidation("{{$TABLE}}[sf_body]","req", "Please specify formula.");
    </script>
   {{/if}} 
</div>
