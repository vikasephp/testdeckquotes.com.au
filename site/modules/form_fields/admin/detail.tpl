<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
	<script type="text/javascript" src="{{$BASE_URL}}js/ckeditor/ckeditor.js"></script>
	<script src="{{$BASE_URL}}js/ckeditor/_samples/sample.js" type="text/javascript"></script>
	<link href="{{$BASE_URL}}js/ckeditor/_samples/sample.css" rel="stylesheet" type="text/css" />
    
<div align="center">
    <h3 class="page-title">{{$title}}</h3> 
    <form name="detail" method="post" action="{{$XFA.detail}}" enctype="multipart/form-data">
        <table id="list-table" width="95%">
            <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
            
              <tr>
                <th width="100">Project Type</th>
                <td>
                    <select name="{{$TABLE}}[pt_id]" class="vlrg" />
                    {{foreach from=$project_type key="key" item="item"}}
                    <option value="{{$item.pt_id}}" {{if $item.pt_id == $detail.pt_id}}selected{{/if}}>{{$item.pt_name}}</option>
                    {{/foreach}}
                    </select>    
                </td>
            </tr>
            <tr>
            
             <tr>
                <th>Question:</th>
                <td><textarea cols="140"  name="{{$TABLE}}[ff_question]">{{$detail.ff_question}}</textarea> </td>
            </tr>
 
            <tr>
            <th>Status:</th>
            <td>
            <select name="{{$TABLE}}[ff_que_status]" style="width:150px;">
                <option value="Active" {{if $detail.ff_que_status == "Active"}} selected="selected" {{/if}}>Active</option>
                <option value="Inactive" {{if $detail.ff_que_status == "Inactive"}} selected="selected" {{/if}}>Inactive</option>
            </select>
           </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:center;">
                    <input type="submit" name="subAddDetail" value="Save" class="vsml" />
                    <input type="button" name="btnCancelDetail" value="Cancel" onclick="document.location.href='{{$BASE_URL}}{{$XFA.list}}';" class="vsml" />
                </td>
            </tr>
        </table>
    </form>

</div>

<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("detail");
    frmvalidator.EnableMsgsTogether();
    frmvalidator.addValidation("{{$TABLE}}[ff_question]","req", "Please specify Question.");
</script>