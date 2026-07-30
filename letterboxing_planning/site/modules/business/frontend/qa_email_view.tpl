<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<!--	<script src="{{$BASE_URL}}ckeditor/ckeditor.js"></script>
	<script src="{{$BASE_URL}}ckeditor/samples/js/sample.js"></script>
	<link rel="stylesheet" href="{{$BASE_URL}}ckeditor/samples/css/samples.css">
	<link rel="stylesheet" href="{{$BASE_URL}}ckeditor/samples/toolbarconfigurator/lib/codemirror/neo.css">-->
 
 
 
<script src="//tinymce.cachefly.net/4.1/tinymce.min.js"></script>

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

	<!-- Load jQuery -->
<script type="text/javascript" src="http://www.google.com/jsapi"></script>
<script type="text/javascript">
	google.load("jquery", "1");
</script>

<!--<style>
 #cke_editor { height:700px !important; }
 #editor { height: 700! important; }
 
</style>-->

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />


<div align="center">
    <h3 class="page-title">{{$title}} </h3>    
	<form>
    <!--<textarea rows="150" cols="90" id="editor" style="height:1200px !important; border:1px solid #909;">-->
    <textarea rows="40" cols="90" class="mceEditor">
   {{$emailData.qal_content}}
    </textarea>
    
   <!--  <table  width="1100" id="none-table22"><tr><td>
        <td><textarea cols="120" rows="16"  class="mceEditor" >{{$emailData.qal_content}} </textarea>
        </td></tr></table>-->
    
    </form>
</div>

<script>
	initSample();
</script>

<!--<h2 class="subtitle">Subject : {{$emailData.et_subject}} </h2>
<h2 class="subtitle">Date    : {{$emailData.et_date|date_format:"%d/%m/%Y"}} </h2>
<br />-->

<!--{{if $attachment }}

<h2 class="subtitle"> Attachment : </h2>
 {{foreach from=$attachment key="key" item="item"}}
 	{{$item}} <br /> 
  {{/foreach}}
{{/if}}

<br />-->



