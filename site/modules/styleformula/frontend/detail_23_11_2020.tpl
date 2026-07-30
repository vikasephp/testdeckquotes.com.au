<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
  <script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>

<script src="//tinymce.cachefly.net/4.1/tinymce.min.js"></script>
<!--<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/tinymce.min.js"></script>  -->

<script type="text/javascript">
  
	tinymce.init({
      
		mode : "textareas",
		editor_selector : "mceEditor",
        plugins: [
                "advlist autolink autosave link image lists charmap print preview hr anchor pagebreak spellchecker",
                "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
                "table contextmenu directionality emoticons template textcolor paste fullpage textcolor colorpicker textpattern"
        ],

        toolbar1: "newdocument fullpage | bold italic underline strikethrough | alignleft aligncenter alignright alignjustify | styleselect formatselect fontselect fontsizeselect",
        toolbar2: "cut copy paste | searchreplace | bullist numlist | outdent indent blockquote | undo redo | link unlink anchor image media code | insertdatetime preview | forecolor backcolor",
        toolbar3: "table | hr removeformat | subscript superscript | charmap emoticons | print fullscreen | ltr rtl | spellchecker | visualchars visualblocks nonbreaking template pagebreak restoredraft",

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

        templates: [
                {title: 'Test template 1', content: 'Test 1'},
                {title: 'Test template 2', content: 'Test 2'}
        ]
});

</script>




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
                <table  width="1000" id="none-table22"><tr><td>
                <textarea cols="100"  name="{{$TABLE}}[sf_body]" rows="10" class="mceEditor">{{$detail.sf_body|stripslashes}}</textarea>    
                </td></tr></table>
                </td>
            </tr>
            
              <tr>
                <th>Formula:</th>
                <td width="500px">
                <table  width="1000" id="none-table22"><tr><td>
                <textarea cols="100" name="{{$TABLE}}[sf_formula_body]" rows="10" class="mceEditor">{{$detail.sf_formula_body|stripslashes}}</textarea>    
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
