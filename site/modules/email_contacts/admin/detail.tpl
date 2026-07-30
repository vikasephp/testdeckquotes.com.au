<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
<div align="center">
  <h3 class="page-title">{{$title}}</h3>
  <form name="detail" method="post" action="{{$XFA.detail}}">
    <table id="list-table" width="90%">
      <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
      <tr>
        <td colspan="2" height="20px">&nbsp;</td>
      </tr>
      <tr>
        <th>Contact Name:</th>
        <td><input type= "text" name="{{$TABLE}}[ec_contact_name]" value="{{$detail.ec_contact_name}}" class="xlrg" /></td>
      </tr>
      
      <tr>
        <th>Category:</th>
        <td><input type= "text" name="{{$TABLE}}[ec_category]" value="{{$detail.ec_category}}" class="xlrg" /></td>
      </tr>
      
      <tr>
        <th>Email Id:</th>
        <td><input type= "text" name="{{$TABLE}}[ec_email_id]" value="{{$detail.ec_email_id}}" class="xlrg" /></td>
      </tr>
      
      <tr>
        <th>Email Saluatation:</th>
        <td><input type= "text" name="{{$TABLE}}[ec_email_salutation]" value="{{$detail.ec_email_salutation}}" class="xlrg" /></td>
      </tr>
      
      
      <tr>
        <th>Status:</th>
        <td><select name="{{$TABLE}}[ec_status]"  class="sml">
            <option value="0" {{if $detail.ec_status == 0}} selected="selected" {{/if}}>Inactive</option>
            <option value="1" {{if $detail.ec_status == 1}} selected="selected" {{/if}}>Active</option>
          </select>
        </td>
      </tr>
      <tr>
        <td colspan="2" height="20px">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="2" style="text-align:center;"><input type="submit" name="subAddDetail" value="Save" class="vsml" />
          <input type="button" name="btnCancelDetail" value="Cancel" onclick="document.location.href='{{$BASE_URL}}{{$XFA.list}}'" class="vsml" />
        </td>
      </tr>
    </table>
  </form>
</div>
<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("detail");
    frmvalidator.EnableMsgsTogether();
    frmvalidator.addValidation("{{$TABLE}}[pt_name]","req", "Please specify Title");
</script>
