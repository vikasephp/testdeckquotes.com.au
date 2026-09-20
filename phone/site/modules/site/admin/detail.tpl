<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>

<div align="center">

    <h3 class="page-title">{{$title}}</h3>
    
    <form name="detail" method="post" action="{{$XFA.detail}}" enctype="multipart/form-data">
        <table id="list-table">
            <input type="hidden" name="images[img_id]" value="{{$detail.img_id}}" />
            <tr>
                <th>Set Image Location:</th>
                <td>
                    <select name="images[img_set_id]" class="vlrg" />
                    <option value="">Please select</option> 
                    <option value="1" {{if $detail.img_set_id == 1 }}selected{{/if}}>Home Page</option>
                   <option value="2" {{if $detail.img_set_id == 2 }}selected{{/if}} >Staff Page</option>
                    </select>    
                </td>
            </tr>
            <tr>
                <th>Name:</th>
                <td><input type= "text" name="images[img_name]" value="{{$detail.img_name}}" class="vlrg" /></td>
            </tr>
             {{if $detail.img_path}}
		<tr>
			<th>Old Image</th><td><img src="{{$BASE_URL}}upload/{{$detail.img_path}}" height="500" width="500" /></td>
		</tr>
		{{/if}}
            <tr>
                <th>Select Image ::.<p> For home Page: H * W :: 317 * 400
                <p> For Staff Page: H * W :: 317 * 400</th>
                <td><input type= "file" name="image" value="{{$detail.img_path}}" class="vlrg" /></td>
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
    frmvalidator.addValidation("images[img_set_id]","req", "Please Select image location.");
	//frmvalidator.addValidation("image","req", "Please specify Image");
	
</script>