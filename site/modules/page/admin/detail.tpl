<!--	<script type="text/javascript" src="{{$BASE_URL}}js/ckeditor/ckeditor.js"></script>
	<script src="{{$BASE_URL}}js/ckeditor/_samples/sample.js" type="text/javascript"></script>
	<link href="{{$BASE_URL}}js/ckeditor/_samples/sample.css" rel="stylesheet" type="text/css" />-->
    <script src="//tinymce.cachefly.net/4.1/tinymce.min.js"></script>
    
<script src="{{$BASE_URL}}js/tinymce_lineheight/plugin.js" type="text/javascript"></script>
<script src="{{$BASE_URL}}js/tinymce_lineheight/plugin.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="http://www.google.com/jsapi"></script>
<script type="text/javascript">
	google.load("jquery", "1");
</script>


<script type="text/javascript">
  
	tinymce.init({
      
		mode : "textareas",
		editor_selector : "mceEditor",
        plugins: [
                "advlist autolink autosave link image lists charmap print preview hr anchor pagebreak spellchecker",
                "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking lineheight",
                "table contextmenu directionality emoticons template textcolor paste fullpage textcolor colorpicker textpattern"
				
        ],

        toolbar1: "newdocument fullpage | bold italic underline strikethrough | alignleft aligncenter alignright alignjustify | styleselect formatselect fontselect fontsizeselect",
        toolbar2: "cut copy paste | searchreplace | bullist numlist | outdent indent blockquote | undo redo | link unlink anchor image media code | insertdatetime preview | forecolor backcolor",
        toolbar3: "table | hr removeformat | subscript superscript | charmap emoticons | print fullscreen | ltr rtl | spellchecker | visualchars visualblocks nonbreaking template pagebreak restoredraft | lineheightselect",

        menubar: false,
        toolbar_items_size: 'small',

        style_formats: [
                {title: 'Bold text', inline: 'b'},
                {title: 'Red text', inline: 'span', styles: {color: '#ff0000'}},
                {title: 'Red header', block: 'h1', styles: {color: '#ff0000'}},
                {title: 'Example 1', inline: 'span', classes: 'example1'},
                {title: 'Example 2', inline: 'span', classes: 'example2'},
                {title: 'Table styles'},
                {title: 'Table row 1', selector: 'tr', classes: 'tablerow1'}
        ],
		
		lineheight_formats: "8pt 9pt 10pt 11pt 12pt 14pt 16pt 18pt 20pt 22pt 24pt 26pt 36pt",

        templates: [
                {title: 'Test template 1', content: 'Test 1'},
                {title: 'Test template 2', content: 'Test 2'}
        ]
});

editor.addButton('lineheightselect', function() {
  
    return {
        type: 'listbox',
        text: 'line-height',
        tooltip: 'line-height',
        values: items,
        fixedWidth: true,
        onclick: function(e) {
            if (e.control.settings.value) {
                editor.execCommand('lineHeight', false, e.control.settings.value);
            }
        }
    };
});

editor.addCommand('lineHeight', function(com, value) {
    var node = tinyMCE.activeEditor.selection.getNode();
    $(node).css('line-height', value);
});

$(editor.getBody()).find('ul').css('list-style-type','circle');

</script>
  

<div align="center" class="newdiv">
    <h3 class="page-title">{{$title}}</h3>
    
    <form name="detail" method="post" action="{{$XFA.detail}}" enctype="multipart/form-data">
        <table id="product-table" width="99%">
            <input type="hidden" name="pages[page_id]" value="{{$detail.page_id}}" />
            <tr>
                <th width="100">Parent</th>
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
                <th>SEO Title</th>
                <td><input type= "text" name="pages[page_short_title]" value="{{$detail.page_short_title}}" class="vlrg" /></td>
            </tr>
            <tr>
                <th>SEO Description</th>
                <td><input type= "text" name="pages[page_metadesc]" value="{{$detail.page_metadesc}}" class="vlrg" /></td>
            </tr>
            <tr>
                <th>SEO Keywords</th>
                <td><textarea name="pages[page_metakeyword]" style="height:60px;" class="vlrg" id="xyz" >{{$detail.page_metakeyword}}</textarea></td>
            </tr>
           
            <tr>
                <th>Page Heading</th>
                <td width="500px"><input type= "text" name="pages[page_heading]" value="{{$detail.page_heading}}" class="vlrg" /> </td>
            </tr>
           
           
            <tr>
                <th>Page Description</th>
                <td width="500px">
                <!-- This <div> holds alert messages to be display in the sample page. -->

    <!-- This <div> holds alert messages to be display in the sample page. -->
            <!--<textarea id="editor1" name="pages[page_body]" rows="15" cols="80" style="width: 80%">{{$detail.page_body}}</textarea>-->
            <textarea name="pages[page_body]" class="mceEditor" rows="15">{{$detail.page_body}}</textarea>
                           
                              
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
                <th>Add to Sitemap</th>
            <td>
           	<input type="checkbox" value="1" name="pages[sitemap]" {{if $detail.sitemap!=0 OR empty($detail.page_id)}}checked="checked"{{/if}} />
           </td>
            </tr>
            <tr>
                <th>Page Order:</th>
                <td><input type= "text" name="pages[page_order]" value="{{$detail.page_order}}" class="sml" /></td>
            </tr>
            
             <tr>
                <th> Image </th>
             <td><input type="file" name="upload" class="lrg"/></td>
           
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