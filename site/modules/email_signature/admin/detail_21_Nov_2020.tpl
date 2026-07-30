<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
  <script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
  <script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tabview/tabcontent.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/admin/screen.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/tabview/tabcontent.js">  </script>

	<!-- Load jQuery -->
<!--<script type="text/javascript" src="http://www.google.com/jsapi"></script>
<script type="text/javascript">
	google.load("jquery", "1");
</script>-->

<!-- Load TinyMCE -->
    	<!-- Load jQuery -->
<script src="//tinymce.cachefly.net/4.1/tinymce.min.js"></script>
<!--<script type="text/javascript" src="{{$BASE_URL}}js/tinymce2020/tinymce.min.js">  </script>-->

<!--<script src="https://cdn.tiny.cloud/1/41zk2coajf0lklk13f8rt06y1g17nqsthb1576q1xp0d0yzw/tinymce/5/tinymce.min.js" referrerpolicy="origin"> </script>-->

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
  
<!-- /TinyMCE -->  

<div align="center">

<h3 class="page-title">{{$title}}</h3>

<form name="detail" method="post" action="{{$XFA.detail}}" enctype="multipart/form-data">
<input type="hidden" name="email_signature[es_id]" value="{{$detail.$ID}}" id="eml_id"/>
    <table id="product-table" cellpadding="0" cellspacing="0" style="width:98% !important; border:1px solid #CCC;">

{{if $message}} 
   <tr> <td colspan="4" style="text-align:center;"><span style="font-size:15px; color:#F00; text-align:center;">{{$message}}</span></td> </tr> 
 {{/if}}
   
        <tr>
            <th>Person Name:</th>
            <td colspan="3"><input type="text" name="email_signature[es_name]" value="{{$detail.es_name}}" style="width:750px;"/></td>
        </tr>
           
		<tr>
                <th>Signature:</th>
                <td width="750px" colspan="3">
                <table  width="750" id="none-table22"><tr><td>
                <textarea cols="110" id="editor1"  name="email_signature[es_signature]" rows="10" class="mceEditor">{{$detail.es_signature}}</textarea>    
                </td></tr></table>
                </td>
        </tr>
		  
        <tr>
                <th>Logo:</th>
                <td>
             <input type="file" name="logo" /> {{if $detail.es_logo}} <img src = "{{$BASE_URL}}files/email_library/{{$detail.es_logo}}"> {{/if}}
                </td>
        </tr>
          
          	
    	 <tr>
            <th>From and Reply To:</th>
            <td colspan="3"><input type="text" name="email_signature[es_reply_to]" value="{{$detail.es_reply_to}}" style="width:350px;"/></td>
        </tr>
        <tr> 
        <td colspan="2" style="text-align:center;">
         <input type="submit" name="subAddDetail" value="Save" class="vsml" />
    <input type="button" name="btnCancelDetail" value="Cancel" onclick="document.location.href='{{$BASE_URL}}{{$XFA.list}}'" class="vsml" />

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
  
</div>