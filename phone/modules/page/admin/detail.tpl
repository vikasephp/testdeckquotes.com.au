<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
{{include file=$tiny_editor}}
<div align="center">

    <h3 class="page-title">{{$title}}</h3>
    
    <form name="detail" method="post" action="{{$XFA.detail}}">
        <table id="list-table">
            <input type="hidden" name="pages[page_id]" value="{{$detail.page_id}}" />
            <tr>
                <th>Parent</th>
                <td>
                    <select name="pages[page_parent_id]" class="vlrg" />
                    <option value="-1">Please select</option> 
                    {{foreach from=$pages key="key" item="item"}}
                    <option value="{{$item.page_id}}" {{if $item.page_id == $detail.page_parent_id}}selected{{/if}} class="level-{{$item.page_level}}">{{$item.page_title}}</option>
                    {{/foreach}}
                    </select>    
                </td>
            </tr>
            <tr>
                <th>Title</th>
                <td><input type= "text" name="pages[page_title]" value="{{$detail.page_title}}" class="vlrg" /></td>
            </tr>
              <tr>
                <th>Meta Title</th>
                <td><input type= "text" name="pages[page_short_title]" value="{{$detail.page_short_title}}" class="vlrg" /></td>
            </tr>
            <tr>
                <th>Meta Description</th>
                <td><input type= "text" name="pages[page_metadesc]" value="{{$detail.page_metadesc}}" class="vlrg" /></td>
            </tr>
            <tr>
                <th>Meta Keywords</th>
                <td><textarea name="pages[page_metakeyword]" style="height:60px;" class="vlrg">{{$detail.page_metakeyword}}</textarea></td>
            </tr>
            <tr>
                <th>Description</th>
                <td width="500px">
                <table  width="800" id="none-table22"><tr><td>
                <textarea cols="100" name="pages[page_body]" rows="30" class="tinymce">{{$detail.page_body}}</textarea>
                </td></tr></table>
                </td>
            </tr>
            <tr>
                <th>Action</th>
                <td><input type= "text" name="pages[page_action]" value="{{$detail.page_action}}" class="vlrg" /></td>
            </tr>
            <tr>
                <th>Action Parameters</th>
                <td><input type= "text" name="pages[page_action_params]" value="{{$detail.page_action_params}}" class="vlrg" /></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:center;">
                    <input type="submit" name="subAddDetail" value="Save" class="vsml" />
                    <input type="button" name="btnCancelDetail" value="Cancel" onclick="history.go(-1);" class="vsml" />
                </td>
            </tr>
        </table>
    </form>

</div>

<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("detail");
    frmvalidator.EnableMsgsTogether();
    frmvalidator.addValidation("pages[page_title]","req", "Please specify Title");
</script>