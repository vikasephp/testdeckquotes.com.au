<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<div align="center">
  <h3 class="page-title">{{$title}}</h3>
  <form name="detail" method="post" action="{{$XFA.detail}}">
    <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" id="slid"/>
    <table id="list-table" width="100%" cellpadding="0" cellspacing="0">
      <tr>
        <th>Select Type:</th>
        <td width="50%">
          <select name="{{$TABLE}}[cd_type_id]" class="lrg" style="width:150px;">
			{{foreach from=$Decking_types key="key" item="item"}}
				 <option value="{{$key}}" {{if $detail.cd_type_id  == $key}} selected="selected" {{/if}}> {{$item}} </option>	            
            {{/foreach}}
          </select></td>
      </tr>
      <tr>
        <th>Cost Per SQM/Lineal Meter - Material:</th>
        <td><input type="text" name="{{$TABLE}}[cd_cost_per_sqm_lm_material]" value="{{$detail.cd_cost_per_sqm_lm_material}}" size="15" />
        </td>
      </tr>
     <tr>
        <th>Cost Per SQM/Lineal Meter - Labour - Team:</th>
        <td><input type="text" name="{{$TABLE}}[cd_cost_per_sqm_lm_labour_team]" value="{{$detail.cd_cost_per_sqm_lm_labour_team}}" size="15" />
        </td>
      </tr>
     <tr>
        <th>Cost Per SQM/Lineal Meter - Labour - Indvidual:</th>
        <td><input type="text" name="{{$TABLE}}[cd_cost_per_sqm_lm_labour_indvidual]" value="{{$detail.cd_cost_per_sqm_lm_labour_indvidual}}" size="15" />
        </td>
      </tr>
      
      <tr>
        <th> Status:</th>
        <td><select name="{{$TABLE}}[cd_status]" class="lrg" style="width:150px;">
            <option value="Active" {{if $detail.cd_status == "Active"}} selected="selected" {{/if}}> Active </option>
            <option value="InActive" {{if $detail.cd_status == "InActive"}} selected="selected" {{/if}}> InActive </option>
          </select>
        </td>
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
    frmvalidator.addValidation("seller_listing[sl_business_id]","req", "Please specify Valid Business Name.");
    frmvalidator.addValidation("seller_listing[sl_adv_name]","req", "Please specify Business Advertised Name.");
	frmvalidator.addValidation("seller_listing[sl_current_price]","req", "Please specify Current Price.");
	frmvalidator.addValidation("seller_listing[sl_current_price]","numeric", "Current Price must be Numeric.");
    frmvalidator.addValidation("seller_listing[sl_update_date]","req", "Please specify Update Date.");
	frmvalidator.addValidation("seller_listing[sl_link]","req", "Please specify Advertised Link.");
</script>