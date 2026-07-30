<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<div align="center" style="min-height:650px;">
    <h3 class="page-title">{{$title}}</h3>
    
    <form name="detail" method="post" action="{{$XFA.detail}}" enctype="multipart/form-data">
        <table id="list-table" width="100%">
            <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
           {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
            <tr>
                <th width="100">Material</th>
                <td>
                    <select name="{{$TABLE}}[mr_id]" class="xlrg" />
                    {{foreach from=$marerials key="key" item="item"}}
                    <option value="{{$item.mr_id}}" {{if $item.mr_id == $detail.mr_id}}selected{{/if}}>{{$item.mr_name}}</option>
                    {{/foreach}}
                    </select>    
                </td>
            </tr>
             <tr>
                <th>Supplier</th>
                <td >
                    <select name="{{$TABLE}}[sp_id]" class="xlrg" />
                    {{foreach from=$suppliers key="key" item="item"}}
                    <option value="{{$item.sp_id}}" {{if $item.sp_id == $detail.sp_id}}selected{{/if}}>{{$item.sp_name}}</option>
                    {{/foreach}}
                    </select>    
                </td>
            </tr>
             <tr>
                <th>Brand</th>
                <td width="80$">
                    <select name="{{$TABLE}}[br_id]" class="xlrg" />
                    <option value="0">Other</option>
                    {{foreach from=$brands key="key" item="item"}}
                    <option value="{{$item.br_id}}" {{if $item.br_id == $detail.br_id}}selected{{/if}}>{{$item.br_name}}</option>
                    {{/foreach}}
                    </select>    
                </td>
            </tr>
            <tr>
                <th width="100">Website:</th>
                <td><input type= "text" name="{{$TABLE}}[ms_link]" value="{{$detail.ms_link}}" class="xlrg" /></td>
            </tr>
            <tr>
                <th>Quantity:</th>
                <td>1.&nbsp;<input type= "text" name="{{$TABLE}}[ms_quantity1]" value="{{$detail.ms_quantity1}}" class="sml" />&nbsp;
                	2.&nbsp;<input type= "text" name="{{$TABLE}}[ms_quantity2]" value="{{$detail.ms_quantity2}}" class="sml" />&nbsp;
                    3.&nbsp;<input type= "text" name="{{$TABLE}}[ms_quantity3]" value="{{$detail.ms_quantity3}}" class="sml" />&nbsp;
                    4.&nbsp;<input type= "text" name="{{$TABLE}}[ms_quantity4]" value="{{$detail.ms_quantity4}}" class="sml" /></td>
            </tr>
			<tr>
                <th>Price:</th>
                <td>1.&nbsp;<input type= "text" name="{{$TABLE}}[ms_price1]" value="{{$detail.ms_price1}}" class="sml" />&nbsp;
                    2.&nbsp;<input type= "text" name="{{$TABLE}}[ms_price2]" value="{{$detail.ms_price2}}" class="sml" />&nbsp;
                    3.&nbsp;<input type= "text" name="{{$TABLE}}[ms_price3]" value="{{$detail.ms_price3}}" class="sml" />&nbsp;
                    4.&nbsp;<input type= "text" name="{{$TABLE}}[ms_price4]" value="{{$detail.ms_price4}}" class="sml" /></td>
            </tr>
            <tr>
                <th>UPC:</th>
                <td><input type= "text" name="{{$TABLE}}[ms_UPC]" value="{{$detail.ms_UPC}}" class="xlrg" /></td>
            </tr>
            <tr>
                <th>SKU:</th>
                <td><input type= "text" name="{{$TABLE}}[ms_SKU]" value="{{$detail.ms_SKU}}" class="xlrg" /></td>
            </tr>

            <tr>
                <th>Description:</th>
                <td width="500px"><textarea cols="80" id="editor1" name="{{$TABLE}}[ms_description]" rows="10">{{$detail.ms_description}}</textarea>    
                </td>
            </tr>
            <tr>
                <th>Delevery:</th>
                <td width="500px"><textarea cols="80" id="editor1" name="{{$TABLE}}[ms_delevery]" rows="5">{{$detail.ms_delevery}}</textarea>    
                </td>
            </tr>
            <tr>
                <th>Image:</th>
                <td><input type= "file" name="images" /> &nbsp;&nbsp;{{if $detail.ms_image}}<img src="{{$BASE_URL}}files/suppliers/materials/thumb/{{$detail.ms_image}}" />{{/if}}</td>
            </tr>
            <tr>
                <th width="20">Status:</th>
                <td>
                    <select name="{{$TABLE}}[ms_status]" class="input" />
                    <option value="Inactive" {{if $detail.ms_status == "Inactive"}} selected {{/if}}>Inactive</option> 
                    <option value="Active" {{if $detail.ms_status == "Active"}} selected {{/if}}>Active</option> 
                    </select>    
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:center;">
                    <input type="submit" name="subAddDetail" value="Save" class="vsml" />
                    <input type="button" name="btnCancelDetail" value="Cancel" onclick="document.location.href='{{$BASE_URL}}{{$XFA.list}}'" class="vsml" />
                </td>
            </tr>
        </table>
    </form>
</div>
<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("detail");
    frmvalidator.EnableMsgsTogether();
    frmvalidator.addValidation("{{$TABLE}}[ms_link]","req", "Please specify weblink.");
	frmvalidator.addValidation("{{$TABLE}}[sp_website]","req", "Please specify website.");
	frmvalidator.addValidation("{{$TABLE}}[sp_email]","req", "Please specify email.");
</script>