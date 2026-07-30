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
        <th>Project Type:</th>
        <td><input type= "text" name="{{$TABLE}}[pt_name]" value="{{$detail.pt_name}}" class="xlrg" /></td>
      </tr>
      <tr>
        <th>Status:</th>
        <td><select name="{{$TABLE}}[pt_status]"  class="sml">
            <option value="0" {{if $detail.pt_status == 0}} selected="selected" {{/if}}>Inactive</option>
            <option value="1" {{if $detail.pt_status == 1}} selected="selected" {{/if}}>Active</option>
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
