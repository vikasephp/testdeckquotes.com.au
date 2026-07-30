<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<div align="center" style="min-height:650px;">
    <h3 class="page-title">{{$title}}</h3>
    <form name="detail" method="post" action="{{$XFA.detail}}" enctype="multipart/form-data">
        <table id="list-table" width="90%">
            <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
               <tr>
                <th width="200">Select Type:</th>
                <td>
                    <select name="{{$TABLE}}[jbo_parent]" class="lrg" onchange="submit();" />
                    <option value="0" {{if $detail.jbo_parent == 0}} selected {{/if}}>-- Select --</option> 
                    {{foreach from=$parents key="key" item="item"}}
                    <option value="{{$item.jbo_id}}" {{if $item.jbo_id == $detail.jbo_parent}} selected {{/if}}>{{$item.jbo_title}}</option>
                    {{/foreach}}
                    </select>    
                </td>
            </tr>
             <tr>
                <th width="20">Select Sub Type:</th>
                <td>
                    <select name="{{$TABLE}}[jbo_subparent]" class="lrg" />
                    <option value="0" {{if $detail.jbo_subparent == 0}} selected {{/if}}>-- Select --</option> 
 					{{foreach from=$subparents key="key" item="item"}}
                    <option value="{{$item.jbo_id}}" {{if $item.jbo_id == $detail.jbo_subparent}} selected {{/if}}>{{$item.jbo_title}}</option>
                    {{/foreach}}
                    </select>    
                </td>
            </tr>
            
            <tr>
                <th>Title/Type:</th>
                <td><input type= "text" name="{{$TABLE}}[jbo_title]" value="{{$detail.jbo_title}}" class="lrg" /></td>
            </tr>


             <tr>
                <th width="20">Status:</th>
                <td>
                    <select name="{{$TABLE}}[jbo_status]" class="sml" />
                    <option value="Inactive" {{if $detail.jbo_status == "Inactive"}} selected {{/if}}>Inactive</option> 
                    <option value="Active" {{if $detail.jbo_status == "Active"}} selected {{/if}}>Active</option> 
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
    frmvalidator.addValidation("{{$TABLE}}[jbo_title]","req", "Please specify title.");
</script>