<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<div align="center" style="min-height:650px;">
    <h3 class="page-title">{{$title}}</h3>
    
    <form name="detail" method="post" action="{{$XFA.detail}}" enctype="multipart/form-data">
        <table id="list-table" width="90%">
            <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
<!--            <tr>
                <th width="150">Parent Category:</th>
                <td width="80$">
                    <select name="categories[cat_parent_id]" class="xlrg" />
                    <option value="-1">Please select</option> 
                    {{foreach from=$categories key="key" item="item"}}
                    <option value="{{$item.cat_id}}" {{if $item.cat_id == $detail.cat_parent_id}}selected{{/if}} class="level-{{$item.cat_level}}">{{$item.cat_title}}</option>
                    {{/foreach}}
                    </select>    
                </td>
            </tr>-->
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
                    <input type="button" name="btnCancelDetail" value="Cancel" onclick="document.location.href='{{$BASE_URL}}{{$XFA.list}}'" class="vsml" />
                </td>
            </tr>
        </table>
    </form>
</div>
<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("detail");
    frmvalidator.EnableMsgsTogether();
    frmvalidator.addValidation("{{$TABLE}}[br_name]","req", "Please specify title.");
	frmvalidator.addValidation("{{$TABLE}}[br_website]","req", "Please specify website.");
</script>