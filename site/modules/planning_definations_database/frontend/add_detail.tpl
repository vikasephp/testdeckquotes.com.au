<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>


<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />

	<script src="{{$BASE_URL}}ckeditor2/ckeditor.js"></script>
	<script src="{{$BASE_URL}}ckeditor2/samples/js/sample.js"></script>

	<script type="text/javascript">
           CKEDITOR.replace( 'editor1' );
           CKEDITOR.add  
        </script>
        
        <script type="text/javascript">
           CKEDITOR.replace( 'editor2' );
           CKEDITOR.add  
        </script>

{{if $opr}}
<script type="text/javascript">
//window.location.href = "{{$BASE_URL}}{{$BASEFOLDER}}.home";
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
<h3 class="page-title">{{$title}} Detail</h3>    
    
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="{{$TABLE}}[pdd_id]" value="{{$detail.pdd_id}}" />
	
		<tr>
			<th>Defination</th>
			<td><input type="text" name="{{$TABLE}}[pdd_defination]" style="width:700px" value="{{$detail.pdd_defination}}" /></td>
		</tr>

		
		<tr>
			<th>Source</th>
			<td><input type="text" name="{{$TABLE}}[pdd_source]" style="width:700px" value="{{$detail.pdd_source}}" /></td>
		</tr>


		<tr>
			<th>Legal Meaning:</th>
			<td><textarea cols="120" rows="16" name="{{$TABLE}}[pdd_meaning]"  id="editor1" class="ckeditor" >{{$detail.pdd_meaning}}</textarea></td>
		</tr>  


		<tr>
			<th>Plain English:</th>
			<td><textarea cols="120" rows="16" name="{{$TABLE}}[pdd_plain_english]"  id="editor1" class="ckeditor" >{{$detail.pdd_plain_english}}</textarea></td>
		</tr>  
			
		<tr>
			<th>Upload Icon: </th>
			<td>
				<input type="file" name="{{$TABLE}}[pdd_icon]" accept=".jpg,.jpeg,.png,.webp,image/jpeg,image/png,image/webp,image/heic,image/heif" />
				{{if $detail.pdd_icon}}
				<a href="{{$BASE_URL}}{{$BASEFOLDER}}.download_content?file_name={{$detail.pdd_icon}}&module_name={{$BASEFOLDER}}.home" target="_blank" title="{{$detail.pdd_icon}}">{{ $detail.pdd_icon}}</a>
				<a href="{{$BASE_URL}}{{$BASEFOLDER}}.delete_uploaded_file/pdd_id/{{$detail.pdd_id}}/column/pdd_icon" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img src="{{$BASE_URL}}/images/delete_icon.png" width="20" /></a>
				{{/if}}
			</td>
		</tr>
			
		<tr>
			<th>Upload Image: </th>
			<td>
				<input type="file" name="{{$TABLE}}[pdd_image]" accept=".jpg,.jpeg,.png,.webp,image/jpeg,image/png,image/webp,image/heic,image/heif" />
				{{if $detail.pdd_image}}
				<a href="{{$BASE_URL}}{{$BASEFOLDER}}.download_content?file_name={{$detail.pdd_image}}&module_name={{$BASEFOLDER}}.home" target="_blank" title="{{$detail.pdd_image}}">{{ $detail.pdd_image}}</a>
				<a href="{{$BASE_URL}}{{$BASEFOLDER}}.delete_uploaded_file/pdd_id/{{$detail.pdd_id}}/column/pdd_image" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img src="{{$BASE_URL}}/images/delete_icon.png" width="20" /></a>
				{{/if}}
			</td>
		</tr>
		
		<tr>
			<th>Image Description:</th>
			<td>
				<textarea rows="5" name="{{$TABLE}}[pdd_image_description]" style="width:100%;">{{$detail.pdd_image_description}}</textarea>
			</td>
		</tr>
			
		<tr>
			<th>Image Note:</th>
			<td>
				<textarea rows="5" name="{{$TABLE}}[pdd_image_note]" style="width:100%;">{{$detail.pdd_image_note}}</textarea>
			</td>
		</tr>
   
		<tr>
			<td colspan="2" style="text-align:center;">
			  <input type="submit" name="subAddDetail" value="Save" class="vsml" />
			  <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:parent.$.fancybox.close();" class="vsml" />
			</td>
		</tr>
</table>
</form>
    
<script type="text/javascript">
function closepop()
{
	window.location.href = "{{$BASE_URL}}{{$BASEFOLDER}}.home";
}
</script>

<script type="text/javascript" language="javascript" >
	var frmvalidator  = new Validator("detail");
	frmvalidator.EnableMsgsTogether();
	frmvalidator.addValidation("type[bac_address]","req", "Please specify Address.");
</script>
</div>