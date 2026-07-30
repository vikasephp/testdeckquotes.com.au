<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<div align="center" style="min-height:650px;">
    <h3 class="page-title">{{$title}}</h3>
    <form name="detail" method="post" action="" enctype="multipart/form-data">
        <table id="list-table" width="90%">
            <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
            <tr>
                <th width="100">Que. Title:</th>
                <td><input type= "text" name="{{$TABLE}}[iqao_title]" value="{{$detail.iqao_title}}" class="xxlrg" /></td>
            </tr>
             <tr>
                <th width="20">Status:</th>
                <td>
                    <select name="{{$TABLE}}[iqao_status]" class="input sml" />
                    <option value="Inactive" {{if $detail.iqao_status == "Inactive"}} selected {{/if}}>Inactive</option> 
                    <option value="Active" {{if $detail.iqao_status == "Active"}} selected {{/if}}>Active</option> 
                    </select>    
                </td>
            </tr>
            <tr>
            <th>Options:</th>
            <td>{{if $detail.$ID}}
            	<table cellpadding="0" cellspacing="0" width="100%">
            	<tr><th width="70%">Title</th><th width="10%">Cost</th><th width="10%">Status</th><th width="10%">Action</th></tr>
                {{foreach from=$optiontems key="key" item="item"}}
            	<tr><td>{{$item.io_name}}</td><td>{{$item.io_cost}}</td><td>{{$item.io_status}}</td><td>
                <a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$detail.$ID}}/io_id/{{$item.io_id}}"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;<a href="{{$BASE_URL}}{{$XFA.optdelete}}/{{$ID}}/{{$detail.$ID}}/io_id/{{$item.io_id}}" onclick="javascript:if(!confirm('Are you sure you want to delete?')) return false;"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>
                </td></tr>
            	{{/foreach}}
                </table>
                <br />
            	<table cellpadding="0" cellspacing="0" width="100%">
                <tr>
                	<th>Option</th>
                    <th>Cost&nbsp;<span style="font-size:11px; font-weight:normal;">(Optional)</span></th>
                    <th>Status</th>
                    <th><input type="button" value="Add Option" onclick="document.location.href='{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$detail.$ID}}'"</th>
               </tr>
            		<tr>
                    <td><input type="hidden" name="{{$TABLE}}[io_id]" value="{{$optiondetail.io_id}}" />
                    	<input type="text" class="xlrg" name="{{$TABLE}}[io_name]" value="{{$optiondetail.io_name}}"/></td>
                    <td><input type="text" name="{{$TABLE}}[io_cost]" value="{{$optiondetail.io_cost}}"/></td>
                    <td>
                    <select name="{{$TABLE}}[io_status]" class="input vsml" />
                        <option value="Inactive" {{if $optiondetail.io_status == "Inactive"}} selected {{/if}}>Inactive</option> 
                        <option value="Active" {{if $optiondetail.io_status == "Active"}} selected {{/if}}>Active</option> 
                    </select>  
                    </td>
                    <td><input type="submit" name="subAddoptDetail" value="{{$button}}" class="vsml" /></td>
                    </tr>
				{{if $error}}
                	<tr><td colspan="4" style="color:#FF0000;">{{$error}}</td></tr>
                
                {{/if}}
            	</table>
               {{/if}} 
            </td>
            </tr>
             <tr>
                <th width="20">Display Type:</th>
                <td>
                    <select name="{{$TABLE}}[iqao_dtype]" class="input sml" />
                    <option value="None" {{if $detail.iqao_dtype == "None"}} selected {{/if}}>None</option> 
                     <option value="Text" {{if $detail.iqao_dtype == "Text"}} selected {{/if}}>Text</option> 
                    <option value="Radio" {{if $detail.iqao_dtype == "Radio"}} selected {{/if}}>Radio</option> 
                    <option value="Checkbox" {{if $detail.iqao_dtype == "Checkbox"}} selected {{/if}}>Checkbox</option> 
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
    frmvalidator.addValidation("{{$TABLE}}[iqao_title]","req", "Please specify title.");

</script>