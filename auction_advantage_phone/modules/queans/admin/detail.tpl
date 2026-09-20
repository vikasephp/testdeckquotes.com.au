<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
<div align="center">
  <h3 class="page-title">{{$title}}</h3>
  <form name="detail" method="post" action="{{$XFA.detail}}">
    <table id="list-table" width="90%" >
      <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
      <tr>
        <th>Title:</th>
        <td><input type= "text" name="{{$TABLE}}[sft_title]" value="{{$detail.sft_title}}" class="xlrg" /></td>
      </tr>
      <tr>
        <th>Status:</th>
        <td><select name="{{$TABLE}}[sft_statues]" style="width:150px;" >
            <option value="Inactive" {{if $detail.sft_statues == 'Inactive'}} selected="selected" {{/if}}>Inactive</option>
            <option value="Active" {{if $detail.sft_statues == 'Active'}} selected="selected" {{/if}}>Active</option>
          </select>
      </tr>
      <tr>
        <td colspan="2" height="100px">&nbsp;</td>
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
    frmvalidator.addValidation("{{$TABLE}}[sft_title]","req", "Please specify Title.");
</script>

