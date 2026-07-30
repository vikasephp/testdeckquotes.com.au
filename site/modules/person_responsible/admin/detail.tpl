<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
<div align="center">
  <h3 class="page-title">{{$title}}</h3>
  <form name="detail" method="post" action="{{$XFA.detail}}" enctype="multipart/form-data">
    <table id="list-table" width="90%">
      <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />

        <th>Stream:</th>
        <td><select name="{{$TABLE}}[prm_stream]" >
            <option value="0" selected="selected" >--Select--</option>
            <option value="Convert" {{if $detail.prm_stream == 'Convert'}} selected="selected" {{/if}}>Convert</option>
            <option value="Operations" {{if $detail.prm_stream == 'Operations'}} selected="selected" {{/if}}>Operations</option>
          </select>
        </td>
      </tr>
      <tr>
        <th>Position:</th>
        <td><input type="text" name="{{$TABLE}}[prm_position]" value="{{$detail.prm_position}}" class="xlrg"/></td>
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