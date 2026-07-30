<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>

<div align="center" class="newdiv">
  <h3 class="page-title">{{$title}}</h3>
  <form name="detail" method="post" action="">
    <table id="list-table" width="90%">
      <input type="hidden" name="data[s_id]" value="{{$detail.s_id}}" />
      <tr>
        <td colspan="2" height="20px">&nbsp;</td>
      </tr>
      <tr>
        <th>States:</th>
        <td>
        <select name="data[s_parent_state]">
            {{foreach from=$state item=item key=key}}
                    <option value="{{$item.s_shortcodes}}" 
                   	 {{if $detail.s_parent_state == $item.s_shortcodes}} selected="selected" 
                  	  {{elseif $s_parent == $item.s_shortcodes}} selected="selected"
                   	 {{/if}}>
                    {{$item.s_shortcodes}} - {{$item.s_name}}
                    </option>
            {{/foreach}}
        </select>
        </td>
      </tr>
      
       <tr>
        <th>Postal Code:</th>
        <td><input type= "text" name="data[s_postal_code]" value="{{$detail.s_postal_code}}" class="xlrg" /></td>
      </tr>
      
       <tr>
        <th>District:</th>
        <td><input type= "text" name="data[s_district]" value="{{$detail.s_district}}" class="xlrg" /></td>
      </tr>
      
      
      <tr>
        <th>Suburb:</th>
        <td><input type= "text" name="data[s_name]" value="{{$detail.s_name}}" class="xlrg" /></td>
      </tr>

      
      
      <tr>
        <td colspan="2" height="20px">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="2" style="text-align:center;"><input type="submit" name="subAddDetail" value="Save" class="vsml" />
          <input type="button" name="btnCancelDetail" value="Cancel" onclick="document.location.href='{{$BASE_URL}}stateAdmin.list'" class="vsml" />
        </td>
      </tr>
    </table>
  </form>
</div>
<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("detail");
    frmvalidator.EnableMsgsTogether();
    frmvalidator.addValidation("data[s_name]","req", "Please specify Suburb Name");
	frmvalidator.addValidation("data[s_postal_code]","req", "Please specify Postal Code");
		/*frmvalidator.addValidation("data[s_postal_code]","num", "Please specify Valid Postal Code");*/

</script>
