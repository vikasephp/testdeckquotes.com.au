<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
<div align="center">
<h3 class="page-title">{{$title}}</h3>
  <form name="detail" method="post" action="{{$XFA.detail}}" enctype="multipart/form-data">

      <table id="list-table" width="90%" >

        <input type="hidden" name="data[er_id]" value="{{$detail.er_id}}" />

        <tr><td colspan="2" height="20px">&nbsp;</td></tr>

		<tr>
  	    <th>Order:</th>
        <td><input type="text" name="data[er_order]" value="{{$detail.er_order}}" /></td>
        </tr>

          <tr>
               <th width="20%">Document/Plan:</th>
                <td width="80%">
               	<input type="text" name="data[er_document]" value="{{$detail.er_document}}" class="xxlrg"/>
              </td>
          </tr>
            
         <tr>
               <th width="20%">Link DC UID:</th>
                <td width="80%">
               	<input type="text" name="data[er_dc_uid]" value="{{$detail.er_dc_uid}}" class="xxlrg"/>
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