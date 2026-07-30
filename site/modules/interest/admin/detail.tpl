<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>

<div align="center">
  <h3 class="page-title">{{$title}}</h3>
  <form name="detail" method="post" action="{{$XFA.detail}}">
    <table id="list-table" width="90%">
      <input type="hidden" name="data[bi_id]" value="{{$detail.bi_id}}" />
      <tr>
        <td colspan="2" height="20px">&nbsp;</td>
      </tr>
      <tr>
        <th width="26%">Business Interest Parent:</th>
        <td width="74%"><select name="data[bi_parent]">
            <option value="0">--Main--</option>
            
            
            
              {{foreach from=$main_interest item=item key=key}}   	
                	
            
            
            <option value="{{$item.bi_id}}" {{if $detail.bi_parent == $item.bi_id}} selected="selected" {{/if}}>{{$item.bi_title}}</option>
            
            
            
              {{/foreach}}  
          
          
          
          </select>
        </td>
      </tr>
      <tr>
        <th>Business Interest Title:</th>
        <td><input type= "text" name="data[bi_title]" value="{{$detail.bi_title}}" class="xlrg" /></td>
      </tr>
      <tr>
        <th>Status:</th>
        <td>
          <input type="checkbox"  name="data[bi_status]" value="1" {{if $detail.bi_status != '0'}} checked="checked" {{/if}}/>
        </td>
      </tr>
      <tr>
        <td colspan="2" height="20px">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="2" style="text-align:center;"><input type="submit" name="subAddDetail" value="Save" class="vsml" />
          <input type="button" name="btnCancelDetail" value="Cancel" onclick="document.location.href='{{$BASE_URL}}interestAdmin.list'" class="vsml" />
        </td>
      </tr>
    </table>
  </form>
</div>
<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("detail");
    frmvalidator.EnableMsgsTogether();
    frmvalidator.addValidation("data[bi_title]","req", "Please specify Title");
</script>
