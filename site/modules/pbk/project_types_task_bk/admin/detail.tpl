<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<div align="center">

    <h3 class="page-title">{{$title}}</h3>
    
    <form name="detail" method="post" action="" enctype="multipart/form-data">
        <table id="list-table" width="90%" >
            <input type="hidden" name="data[bst_id]" value="{{$detail.bst_id}}" />
            <tr>
                <th width="20%">Project Type:</th>
                <td width="80%">
              <select name="data[bst_business_status_id]" >
                	<option value="">-- Select --</option>
                	{{foreach from=$busness_status item=item key=key}}
<option value="{{$item.pt_id}}" {{if $detail.bst_business_status_id == $item.pt_id OR $current_bst_business_status_id == $item.pt_id}} selected="selected" {{/if}}>{{$item.pt_name}}</option>
                    {{/foreach}} 
                </select>
              </td>
          </tr>
          <tr>
                <th>Task Name:</th>
                <td>
                <input type="text" name="data[bst_task_name]" value="{{$detail.bst_task_name}}" class="xxlrg" />
                </td>
          </tr>
          <tr>
                <th>Instructions:</th>
                <td><textarea name="data[bst_instruction]" cols="106" rows="5">{{$detail.bst_instruction}}</textarea></td>
            </tr>
           <tr>
                <th>Required Document Type:</th>
                <td>
                	<select name="data[bst_rdt]" class="lrg">
                    	<option value="1" {{if $detail.bst_rdt == '1'}} selected="selected" {{/if}}>--- select --</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>Required Image Type:</th>
                <td>
                	<select name="data[bst_rit]" class="lrg">
                    	<option value="" >--- select --</option>
                        <option value="1" {{if $detail.bst_rit == '1'}} selected="selected" {{/if}}>Main</option>
                        <option value="2" {{if $detail.bst_rit == '2'}} selected="selected" {{/if}}>Other Images</option>
                    </select>
                </td>
            </tr>  
            <tr>
                <th>Required Date Field:</th>
                <td>
                	<select name="data[bst_rdf]" class="lrg">
                    	<option selected="selected" >--- select --</option>
                        {{foreach from=$datafields key="key" item="item"}}
                        <option value="{{$item.df_id}}" {{if $item.df_id == $detail.bst_rdf}} selected="selected" {{/if}}>{{$item.df_name}}</option>	
                        {{/foreach}}
                    </select>
                	
                </td>
            </tr>
            <tr>
                <th>Authorization Area Name:</th>
                <td>
                	<select name="data[bst_aan]" class="lrg">
                    	<option selected="selected" >--- select --</option>
                         {{foreach from=$authorizearea key="key" item="item"}}
                        <option value="{{$item.autha_id}}" {{if $item.autha_id == $detail.bst_aan}} selected="selected" {{/if}}>{{$item.autha_name}}</option>	
                        {{/foreach}}
                    </select>
                </td>
            </tr>    
            
            <tr>
                <th>Project Task Document:</th>
                <td> <input type="file" name="image"  /><br />
               		{{if !empty($detail.bst_document)}}<a href="{{$BASE_URL}}{{$FILE_PATH}}files/task_files/{{$detail.bst_document}}" target="_blank" title="View Manual">View Document</a>
                    |
                    <a href="{{$BASE_URL}}{{$XFA.imgDelete}}/bst_id/{{$detail.bst_id}}" title="Delete Manual" onclick="javascript:if(!confirm('Are you sure want to delete the document??')){ return false; }"><img src="{{$BASE_URL}}images/DeleteRed_new.gif" border="0" /></a>{{/if}}
                </td>
            </tr>   
            <tr>
                <th>Assign Task to task list:</th>
                <td>
               <!-- 	<select name="data[bst_status]" class="lrg">
                    	<option value="1" {{if $detail.bst_status == '1'}} selected="selected" {{/if}}>Yes</option>
                        <option value="0" {{if $detail.bst_status == '0'}} selected="selected" {{/if}}>No</option>
                    </select>-->
 			<span style="color:#FF0000;">{{if $detail.bst_status == '1'}}Yes{{else}}No{{/if}}</span>
            	{{if $detail.bst_id}}	
                   <input type="submit" name="subAddDetail_assign" value="Yes" class="vsml" />
                   <input type="submit" name="subAddDetail_assign" value="No" class="vsml" /> 
                 {{else}}
                 <input type="button" name="subAddDetail_assign" value="Yes" class="vsml" onclick="javascript:alert('Please save task first and then try to assign.');" />
                 <input type="button" name="subAddDetail_assign" value="No" class="vsml" onclick="javascript:alert('Please save task first and then try to assign.');" />                 
                 {{/if}}   
                </td>
            </tr>
           <tr><td colspan="2" height="20px">&nbsp;</td></tr>
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
    frmvalidator.addValidation("data[bst_business_status_id]","req", "Please Select Business Status");
	frmvalidator.addValidation("data[bst_task_name]","req", "Please specify Task Name");	
</script>