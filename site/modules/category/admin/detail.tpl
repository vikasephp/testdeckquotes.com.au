<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
	
     <script type="text/javascript" src="{{$BASE_URL}}js/ckeditor/jquery.js"></script>
	<script type="text/javascript" src="{{$BASE_URL}}js/ckeditor/ckeditor.js"></script>
	<script type="text/javascript" src="{{$BASE_URL}}js/ckeditor/adapters/jquery.js"></script>
	<script src="{{$BASE_URL}}js/ckeditor/sample.js" type="text/javascript"></script>
	<link href="{{$BASE_URL}}js/ckeditor/sample.css" rel="stylesheet" type="text/css" />
	
	<script type="text/javascript">
	//<![CDATA[
$(function()
{
	var config = {
		toolbar:
		[
			['Bold', 'Italic', 'Underline', 'Font', 'FontSize', '-', 'Image', 'TextColor',  'Source', '-', 'NumberedList', 'BulletedList', '-', 'Link', 'Unlink'],
			['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock']
		]
	};

	// Initialize the editor.
	// Callback function can be passed and executed after full instance creation.
	$('.jquery_ckeditor').ckeditor(config);
});

	//]]>
	</script>
    
<div align="center">

    <h3 class="page-title">{{$title}}</h3>
    
    <form name="detail" method="post" action="{{$XFA.detail}}">
        <table id="list-table" width="90%">
            <input type="hidden" name="categories[cat_id]" value="{{$detail.cat_id}}" />
            <tr>
                <th width="150">Parent Category:</th>
                <td width="80$">
                    <select name="categories[cat_parent_id]" class="xlrg" />
                    <option value="-1">Please select</option> 
                    {{foreach from=$categories key="key" item="item"}}
                    <option value="{{$item.cat_id}}" {{if $item.cat_id == $detail.cat_parent_id}}selected{{/if}} class="level-{{$item.cat_level}}">{{$item.cat_title}}</option>
                    {{/foreach}}
                    </select>    
                </td>
            </tr>
            <tr><td colspan="2" height="20px">&nbsp;</td></tr>
            <tr>
                <th>Category Title:</th>
                <td><input type= "text" name="categories[cat_title]" value="{{$detail.cat_title}}" class="xlrg" /></td>
            </tr>
               <tr><td colspan="2" height="20px">&nbsp;</td></tr>
               
                    <tr>
                <th>Category Filters:</th>
                <td><input type= "text" name="categories[cat_filters]" value="{{$detail.cat_filters}}" class="xlrg" /></td>
            </tr>
               <tr><td colspan="2" height="20px">&nbsp;</td></tr>
               
            <tr>
                <th>Category Description:&nbsp;<br />(Optional)</th>
                <td width="500px"><textarea class="jquery_ckeditor" cols="80" id="editor1" name="categories[cat_body]" rows="10">{{$detail.cat_body}}</textarea>
                
                </td>
            </tr>
                       <tr><td colspan="2" height="20px">&nbsp;</td></tr>
            <tr>
                <th width="20">Category Status:</th>
                <td>
                    <select name="categories[cat_published]" class="input" />
                    <option value="1" {{if $detail.cat_published == 1}} selected {{/if}}>Publish</option> 
                     <option value="0" {{if $detail.cat_published == 0}} selected {{/if}}>Unpublish</option> 
                    </select>    
                </td>
            </tr>
            
                       <tr><td colspan="2" height="20px">&nbsp;</td></tr>
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
    frmvalidator.addValidation("categories[cat_title]","req", "Please specify Title");
</script>