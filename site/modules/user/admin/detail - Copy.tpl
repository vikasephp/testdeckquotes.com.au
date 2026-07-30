<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
<div align="center">
  <h3 class="page-title">{{$title}}</h3>
  <form name="createadmin" method="post" action="{{$BASE_URL}}{{$XFA.detail}}">
    <input name="user_id" type="hidden" value="{{$detail.user_id}}"/>
    <table id="list-table" align="center" width="100%">
      {{if $msg}}
      <tr>
        <td colspan="2" style="text-align:center;" class="message">{{$msg}}</td>
      </tr>
      {{/if}}
      <tr>
        <th class="labelhead">Name:</th>
        <td><input class="input lrg" name="user_name" type="text" maxlength="132" value="{{$detail.user_name}}" /></td>
      </tr>
      <tr>
        <th class="labelhead">Email:</th>
        <td><input class="input lrg" name="user_email" type="text" maxlength="132" value="{{$detail.user_email}}"/></td>
      </tr>
      <tr>
        <th class="labelhead">User Name:</th>
        <td><input class="input lrg" name="user_username" type="text" maxlength="132" value="{{$detail.user_username}}"/></td>
      </tr>
      <tr>
        <th class="labelhead">Password:</th>
        <td><input class="input lrg" name="user_password" type="password" maxlength="32" value=""/></td>
      </tr>
      <tr>
        <th class="labelhead">Select Group:</th>
        <td><select name="user_group" class="lrg">
            <option value="0">[Choose Group]</option>
            {{foreach from=$list key="key" item="item"}}                                      
            <option value="{{$item.group_id}}" {{if $detail.group_id == $item.group_id}} selected="selected" {{/if}}>{{$item.group_name}}</option>
            {{/foreach}}                                                                  
          </select></td>
      </tr>
      <tr>
        <th class="labelhead">Company:</th>
        <td><input class="input lrg" name="{{$TABLE}}[customer_company]" type="text" maxlength="132" value="{{$detail.customer_company}}"/></td>
      </tr>
      <tr>
        <th class="labelhead">Mobile Phone</th>
        <td><input class="input lrg" name="{{$TABLE}}[customer_phone]" type="text" maxlength="132" value="{{$detail.customer_phone}}"/></td>
      </tr>
      <tr>
        <th class="labelhead">Business Phone</th>
        <td><input class="input lrg" name="{{$TABLE}}[customer_phone_business]" type="text" maxlength="132" value="{{$detail.customer_phone_business}}"/></td>
      </tr>
      <tr>
        <th class="labelhead">Positions:</th>
        <td>
        <select name="{{$TABLE}}[user_positions][]" multiple="multiple" size="10" class="vlrg" >
            <option value="0">[Choose Positions]</option>
              {{foreach from=$positions key="key" item="item"}}                           
            <option value="{{$item.p_id}}" {{foreach from=$detail.customer_positions item="item1" key="key1"}} {{if $item1 == $item.p_id}} selected="selected" {{/if}} {{/foreach}}>{{$item.p_name}}</option>
              {{/foreach}}                                     
        </select>
       </td>
      </tr>
      <tr>
        <th>Status:</th>
        <td><select name="{{$TABLE}}[customer_status]" class="lrg" >
            <option value="0" {{if $detail.customer_status == 0}} selected="selected" {{/if}}>Current</option>
            <option value="1" {{if $detail.customer_status == 1}} selected="selected" {{/if}}>Previous</option>
          </select>
      </tr>
      <tr>
        <td colspan="2" style="text-align:center"><input class="addButtons" name="subAddDetail" type="submit" value="Save">
          <input class="addButtons" type="button" value="Cancel" onclick="document.location.href='{{$BASE_URL}}{{$XFA.list}}';">
        </td>
      </tr>
      <tr>
        <td align="right"></td>
        <td><div id='createadmin_errorloc' class='error_strings'> </div></td>
      </tr>
    </table>
  </form>
</div>
<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("createadmin");
	frmvalidator.EnableOnPageErrorDisplaySingleBox();
    frmvalidator.EnableMsgsTogether();
    frmvalidator.addValidation("user_name","req", "Please specify Name");
	frmvalidator.addValidation("user_email","req", "Please specify Email");    
    frmvalidator.addValidation("user_email","email", "Please specify correct email format");
    frmvalidator.addValidation("user_username","req", "Please specify username");
	frmvalidator.addValidation("user_group","dontselect=0");
	frmvalidator.addValidation("user_group","req", "Please specify User Group");
	
</script>
