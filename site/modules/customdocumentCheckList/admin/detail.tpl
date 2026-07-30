<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
<div align="center">
<h3 class="page-title">{{$title}}</h3>
  <form name="detail" method="post" action="{{$XFA.detail}}" enctype="multipart/form-data">

      <table id="list-table" width="90%" >

        <input type="hidden" name="data[admin_cdoc_id]" value="{{$detail.admin_cdoc_id}}" />

        <tr><td colspan="2" height="20px">&nbsp;</td></tr>

		<tr>
  	    <th>Document Check List Type:</th>
        <td>
            <select name="data[admin_cdoc_type][]" multiple="multiple">
                <option value="0"> Please Select </option>
                {{foreach from=$custom_dcl item=item key=key}}
                <option value="{{$key}}" {{foreach from=$type item=item1 key=key1}}{{if $item1 == $key}} selected="selected" {{/if}} {{/foreach}}>{{$item}} </option>
                {{/foreach}}
            </select>
         </td>
         </tr>

          <tr>
               <th width="20%">Document Name:</th>
                <td width="80%">
               	<input type="text" name="data[admin_cdoc_name]" value="{{$detail.admin_cdoc_name}}" class="xxlrg"/>
              </td>
          </tr>

            <tr>
                <th>Document Order:</th>
                <td>
                	<input type="text" name="data[admin_cdoc_order]" value="{{$detail.admin_cdoc_order}}" />
                </td>
            </tr>

            <tr>
                <th>Document Manual:</th>
               <td> <input type="file" name="image"  /><br />

               		{{if !empty($detail.admin_doc_manual)}}<a href="{{$BASE_URL}}{{$FILE_PATH}}files/document_check_list_files/{{$detail.admin_cdoc_manual}}" target="_blank">View Document</a>

                    |

                    <a href="{{$BASE_URL}}{{$XFA.docDelete}}/admin_cdoc_id/{{$detail.admin_cdoc_id}}" title="Delete Image" onclick="javascript:if(!confirm('Are you sure want to delete the document??')){ return false; }" ><img src="{{$BASE_URL}}images/DeleteRed_new.gif" border="0" /></a>{{/if}}

                </td>

            </tr> 
            <tr>

             <th>Document Upload To Dossier:</th>

              <td><input type="checkbox" value="1" name="data[admin_cdoc_upload_to_dossier]"  {{if $detail.admin_cdoc_upload_to_dossier == '1'}} checked="checked" {{/if}} /></td>

            </tr>
			<!--  <tr>
			  <th>Project Type:</th>
              <td>

               	<select name="data[admin_doc_proj_type]">
                   	<option value="0"> Please Select </option>
			     	{{foreach from=$projdetail item=item key=key}}
                    <option value="{{$item.pt_id}}" {{if $detail.admin_doc_proj_type == $item.pt_id}} selected="selected" {{/if}} >{{$item.pt_name}} </option>
                    {{/foreach}}
                </select>

                </td>

            </tr>-->
			 <tr>
                <th>Status:</th>

                <td>
	               	<select name="data[admin_cdoc_status]">
                    	<option value="1" {{if $detail.admin_cdoc_status == '1'}} selected="selected" {{/if}}>Activate</option>
                        <option value="0" {{if $detail.admin_cdoc_status == '0'}} selected="selected" {{/if}}>Deactivate</option>
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
    frmvalidator.addValidation("data[admin_cdoc_name]","req", "Please Select Business Status");
	frmvalidator.addValidation("data[bst_task_name]","req", "Please specify Task Name");
</script>