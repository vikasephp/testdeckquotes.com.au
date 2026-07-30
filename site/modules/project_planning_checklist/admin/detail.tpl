<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
<div align="center">
<h3 class="page-title">{{$title}}</h3>
  <form name="detail" method="post" action="{{$XFA.detail}}" enctype="multipart/form-data">

      <table id="list-table" width="90%" >

        <input type="hidden" name="data[ppc_id]" value="{{$detail.ppc_id}}" />

        <tr><td colspan="2" height="20px">&nbsp;</td></tr>

		<tr>
  	    <th>Order:</th>
        <td><input type="text" name="data[ppc_order]" value="{{$detail.ppc_order}}" /></td>
        </tr>

          <tr>
               <th width="20%">Document/Plan:</th>
                <td width="80%">
               	<input type="text" name="data[ppc_document]" value="{{$detail.ppc_document}}" class="xxlrg"/>
              </td>
          </tr>

         <tr>
          <th>Project Type:</th>
          <td>

            <select name="data[ppc_type]">
              <option value=""> Please Select </option>
             {{foreach from=$typedetail item=item key=key}}
              <option value="{{$item.pt_option}}" {{if $detail.ppc_type == $item.pt_option}} selected="selected" {{/if}} >{{$item.pt_option}}</option>
             {{/foreach}}
           </select>

            </td>
            
         <tr>
               <th width="20%">Link DC UID:</th>
                <td width="80%">
               	<input type="text" name="data[ppc_dc_uid]" value="{{$detail.ppc_dc_uid}}" class="xxlrg"/>
              </td>
          </tr>    

         <tr>
               <th width="20%">Main Document Checklist Link:</th>
                <td width="80%">
               	<input type="text" name="data[ppc_md_checklist_link]" value="{{$detail.ppc_md_checklist_link}}" class="xxlrg"/>
              </td>
          </tr>  
          
          
           <tr>
               <th width="20%">Procedure Link:</th>
                <td width="80%">
               	<input type="text" name="data[ppc_procedure]" value="{{$detail.ppc_procedure}}" class="xxlrg"/>
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