<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
<div align="center">

    <h3 class="page-title">{{$title}}</h3>

    <form name="detail" method="post" action="{{$XFA.detail}}" enctype="multipart/form-data">

        <table id="list-table" width="90%" >

            <input type="hidden" name="data[admin_doc_id]" value="{{$detail.admin_doc_id}}" />

            <tr><td colspan="2" height="20px">&nbsp;</td></tr>

            <tr>

                <th width="20%">Document Name:</th>

                <td width="80%">

               	<input type="text" name="data[admin_doc_name]" value="{{$detail.admin_doc_name}}" class="xxlrg"/>

              </td>

          </tr>

            <tr>

                <th>Document Order:</th>

                <td>

                	<input type="text" name="data[admin_doc_order]" value="{{$detail.admin_doc_order}}" />

                </td>

            </tr>

            <tr>

                <th>Document Manual:</th>

                <td> <input type="file" name="image"  /><br />

               		{{if !empty($detail.admin_doc_manual)}}<a href="{{$BASE_URL}}{{$FILE_PATH}}files/document_check_list_files/{{$detail.admin_doc_manual}}" target="_blank">View Document</a>

                    |

                    <a href="{{$BASE_URL}}{{$XFA.docDelete}}/admin_doc_id/{{$detail.admin_doc_id}}" title="Delete Image" onclick="javascript:if(!confirm('Are you sure want to delete the document??')){ return false; }" ><img src="{{$BASE_URL}}images/DeleteRed_new.gif" border="0" /></a>{{/if}}

                </td>

            </tr> 

            <tr>

             <th>Document Upload To Dossier:</th>

              <td><input type="checkbox" value="1" name="data[admin_doc_upload_to_dossier]"  {{if $detail.admin_doc_upload_to_dossier == '1'}} checked="checked" {{/if}} /></td>

            </tr>

			<!--  <tr>
			  <th>Project Type:</th>
                <td>

                	<select name="data[admin_doc_proj_type]">
                    	<option value="0"> Please Select </option>
				     	{{foreach from=$project_type item=item key=key}}
                        <option value="{{$item.pt_id}}" {{if $detail.admin_doc_proj_type == $item.pt_id}} selected="selected" {{/if}} >{{$item.pt_name}} </option>
                        {{/foreach}}
				    </select>
			     </td>

            </tr>-->
		 <tr>
			 <th>Project Type:</th>
               <td>
               	 <table cellpadding="0" cellspacing="0" width="90%">
                    
                 {{foreach from=$project_type item=item key=key}}
                 <tr>
                 <td width="60%">  {{$item.pt_name}} </td> 
                 <td> <input type="checkbox" name="data[admin_doc_proj_type][]" value="{{$item.pt_id}}" {{foreach from = $data1 item=item1 key=key1 }} {{if $item.pt_id == $data1[$key1]}} checked="checked" {{/if}} {{/foreach}} /></td>
                 </tr>
                 {{/foreach}}
				</table>	
                </td>
            </tr>

            <tr>

                <th>Status:</th>

                <td>

                	<select name="data[admin_doc_status]">

                    	<option value="1" {{if $detail.admin_doc_status == '1'}} selected="selected" {{/if}}>Activate</option>

                        <option value="0" {{if $detail.admin_doc_status == '0'}} selected="selected" {{/if}}>Deactivate</option>

                    </select>

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