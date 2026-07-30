	<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
	<script type="text/javascript" src="{{$BASE_URL}}js/ckeditor/ckeditor.js"></script>
	<script src="{{$BASE_URL}}js/ckeditor/_samples/sample.js" type="text/javascript"></script>
	<link href="{{$BASE_URL}}js/ckeditor/_samples/sample.css" rel="stylesheet" type="text/css" />

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
    
<div class="newdiv">
<h3 class="page-title">{{$title}}</h3>
<br />
<form name="template" method="post" action="{{$BASE_URL}}{{$XFA.detail}}">
	<input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
	<table id="product-table" align="center" width="98%">
 

 
     <tr>   <th class="labelhead" width="10%">Name:</th>
			<td><input type="text" name="{{$TABLE}}[et_name]" value="{{$detail.et_name}}" style="width:300px;" /></td>
     </tr>
          
    <tr>    
			<th class="labelhead" width="10%">Subject:</th>
			<td><input type="text" name="{{$TABLE}}[et_subject]" value="{{$detail.et_subject}}" style="width:300px;" /></td>
	</tr>
    <tr> <th class="labelhead" width="10%">Body:</th>
    <td> <textarea id="editor1" name="{{$TABLE}}[et_body]" rows="15" cols="80" style="width: 80%">
                         {{$detail.et_body}}
                </textarea>        <script type="text/javascript">
			//<![CDATA[

				CKEDITOR.replace( 'editor1',
					{
						fullPage : true,
						toolbar:
		[
			['Bold', 'Italic', 'Underline', 'Font', 'FontSize', '-', 'Image', 'TextColor',  'Source', '-', 'NumberedList', 'BulletedList', '-', 'Link', 'Unlink'],
			['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock']
		]
	,
						filebrowserUploadUrl: '{{$BASE_URL}}js/ckeditor/basicuploader.php'

					});

			//]]>
			</script> </td>
    </tr>
    
		<tr>
			<td colspan="2" style="text-align:center">
            <input class="addButtons" type="submit" value="{{$button}}" name="subAddDetail">
				&nbsp;
				<input class="addButtons" type="button" value="Cancel" onclick="document.location.href='{{$BASE_URL}}{{$XFA.list}}';">
			</td>
		</tr>


    </table>
</form>
</div>
<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("template");
    frmvalidator.EnableMsgsTogether();
    frmvalidator.addValidation("{{$TABLE}}[et_name]",   "req", "Please specify Template Name.");
	frmvalidator.addValidation("{{$TABLE}}[et_subject]","req", "Please specify Template Subject.");
	frmvalidator.addValidation("{{$TABLE}}[et_body]",   "req", "Please specify Template Body.");
	
</script>
