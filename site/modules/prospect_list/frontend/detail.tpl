<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
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

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<div align="center" style="min-height:350px;">
    <h3 class="page-title">{{$title}}</h3> 
    <br />   
   
   
<form name="detail" method="post" action="{{$XFA.detail}}"  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   <tr>
     <th style="width:30%">Address</th>
     <td><input  type="text" name="{{$TABLE}}[pl_address]"  value="{{$detail.pl_address}}" style="width:700px;" /> </td>
    </tr>
    
    <tr>
     <th>Block</th>
     <td><input  type="text" name="{{$TABLE}}[pl_block]"  value="{{$detail.pl_block}}" style="width:700px;" /> </td>
    </tr>  
     
    <tr>
     <th>Section</th>
     <td><input  type="text" name="{{$TABLE}}[pl_section]"  value="{{$detail.pl_section}}" style="width:700px;" /> </td>
    </tr> 
    
    <tr>
     <th>Subrub</th>
     <td><input  type="text" name="{{$TABLE}}[pl_subrub]"  value="{{$detail.pl_subrub}}" style="width:700px;" /> </td>
    </tr>  
        
    <tr>
     <th>Owner Name</th>
     <td><input  type="text" name="{{$TABLE}}[pl_owner_name]"  value="{{$detail.pl_owner_name}}" style="width:700px;" /> </td>
    </tr>  
   
    <tr>
     <th>Contact Number</th>
     <td><input  type="text" name="{{$TABLE}}[pl_contact_number]"  value="{{$detail.pl_contact_number}}" style="width:700px;" /> </td>
    </tr> 
    
   
     <tr>
     <th> Email Address </th>
     <td> <input type="text" name="{{$TABLE}}[pl_email_address]" value="{{$detail.pl_email_address}}" style="width:700px;"  /> </td>
    </tr>
   
   <tr>
	<th>MSTeams Link</th>
	<td> <input type="text" name="{{$TABLE}}[pl_msteams_link]" value="{{$detail.pl_msteams_link}}" style="width:700px;"  /> </td>
   </tr>
   
   <!--<tr>
  <th> Upload Sales Introduction</th> 
  <td> <input type="file" name="si" /></td>      
  </tr>-->
   
    <!--<tr>
  <th> Upload Inspection Report /*Sales proposal*/</th> 
  <td> <input type="file" name="sp" /></td>      
  </tr>
  
  <tr>
  <th> Upload Management Agreement</th> 
  <td> <input type="file" name="ma" /></td>      
  </tr>
   
    <tr>
     <th>Air BNB Link</th>
     <td> <input type="text" name="{{$TABLE}}[pl_air_bnb_link]" value="{{$detail.pl_air_bnb_link}}" style="width:700px;"  /> </td>
    </tr>
   <tr>
  <th> Upload Extra Doc</th> 
          <td> 
          <input type="file" name="extra1" />
          <input type="file" name="extra2" />
          <input type="file" name="extra3" />
          <input type="file" name="extra4" />
          <input type="file" name="extra5" />
          <input type="file" name="extra6" />
          <input type="file" name="extra7" />
          </td>      
  </tr>-->
    
<!--    <tr>
        <th>Notes:</th>
        <td>
        <textarea rows="8" name="{{$TABLE}}[cl_notes]" class="mceEditor" >{{$detail.cl_notes|stripslashes}}</textarea>    
        </td>
    </tr>-->
    
  
    <tr>
        <td colspan="2" style="text-align:center;">
            <!--<input type="submit" name="print" value="Print" class="vsml" />-->
            <input type="submit" name="subAddDetail" value="Save" class="vsml" />
           <!-- <input type="button" name="btnCancelDetail" value="Cancel" onclick="javascript:parent.$.fancybox.close();" class="vsml" />-->
            <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
        </td>
    </tr>
</table>
</form>
    
    <script type="text/javascript">
		function closepop()
		{
		setTimeout('parent.close_win();', 500);
		}
	</script>
    
	<script type="text/javascript" language="javascript" >
        var frmvalidator  = new Validator("detail");
			frmvalidator.EnableMsgsTogether();
			frmvalidator.addValidation("{{$TABLE}}[pl_address]","req", "Please specify address.");
			frmvalidator.addValidation("{{$TABLE}}[pl_contact_number]","req", "Please specify contact number.");
			frmvalidator.addValidation("{{$TABLE}}[pl_email_address]","req", "Please specify email address.");
    </script>
</div>