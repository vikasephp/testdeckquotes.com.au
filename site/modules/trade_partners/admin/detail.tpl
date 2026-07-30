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
        <th>Partner's Name:</th>
        <td><input type= "text" name="{{$TABLE}}[tp_name]" value="{{$detail.tp_name}}" class="xlrg" /></td>
      </tr>
      
      <tr>
        <th>Partner's Mobile:</th>
        <td><input type= "text" name="{{$TABLE}}[tp_mobile]" value="{{$detail.tp_mobile}}" class="xlrg" /></td>
      </tr>
      
       <tr>
        <th>Partner's Email:</th>
        <td><input type= "text" name="{{$TABLE}}[tp_email]" value="{{$detail.tp_email}}" class="xlrg" /></td>
      </tr>
      
      <tr>
        <th>Calendar Link:</th>
        <td><input type= "text" name="{{$TABLE}}[tp_calendar]" value="{{$detail.tp_calendar}}"  style="width:700px;" /></td>
      </tr>
      
       <tr>
        <th>Calendar Reference:</th>
        <td><input type= "text" name="{{$TABLE}}[tp_cal_reference]" value="{{$detail.tp_cal_reference}}"  style="width:700px;" /></td>
      </tr>
      
<!--      <tr>
        <th>Status:</th>
        <td><select name="{{$TABLE}}[ec_status]"  class="sml">
            <option value="0" {{if $detail.ec_status == 0}} selected="selected" {{/if}}>Inactive</option>
            <option value="1" {{if $detail.ec_status == 1}} selected="selected" {{/if}}>Active</option>
          </select>
        </td>
      </tr>-->
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
    frmvalidator.addValidation("{{$TABLE}}[tp_mobile]","req", "Please specify Mobile");
</script>
