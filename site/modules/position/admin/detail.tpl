<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
<div align="center">
  <h3 class="page-title">{{$title}}</h3>
  <form name="detail" method="post" action="{{$XFA.detail}}" enctype="multipart/form-data">
    <table id="list-table" width="90%">
      <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
      <tr>
        <th>Title:</th>
        <td><input type= "text" name="{{$TABLE}}[p_name]" value="{{$detail.p_name}}" class="xlrg" /></td>
      </tr>
      <tr>
        <th>Report To:</th>
        <td><select name="{{$TABLE}}[p_report]" >
            <option value="0" selected="selected" >--Select--</option>
            {{foreach from=$positions key="key" item="item"}}
            <option value="{{$item.p_id}}" {{if $detail.p_report == $item.p_id}} selected="selected" {{/if}}>{{$item.p_name}}</option>
            {{/foreach}}
          </select>
        </td>
      </tr>
      <tr>
        <th>Email:</th>
        <td><input type="text" name="{{$TABLE}}[p_email]" value="{{$detail.p_email}}" class="xlrg"/></td>
      </tr>
      <tr>
        <th>Description:</th>
        <td><textarea cols="100" rows="4" name="{{$TABLE}}[p_description]" class="xlrg">{{$detail.p_description}}</textarea></td>
      </tr>
      <tr>
     <tr>
        <th>Upload Document:</th>
        <td><input type="file" name="pdoc"/></td>
      </tr>
      <tr>
      
        <th>Status:</th>
        <td><select name="{{$TABLE}}[p_status]" >
            <option value="0" {{if $detail.p_status == 1}} selected="selected" {{/if}}>Inactive</option>
            <option value="1" {{if $detail.p_status == 1}} selected="selected" {{/if}}>Active</option>
          </select>
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
    frmvalidator.addValidation("{{$TABLE}}[p_name]","req", "Please specify title.");
	frmvalidator.addValidation("{{$TABLE}}[p_email]","req", "Please specify email.");
	frmvalidator.addValidation("{{$TABLE}}[p_email]","email", "Please specify valid email.");
</script>