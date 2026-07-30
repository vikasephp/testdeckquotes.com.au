<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<div align="center">
  <h3 class="page-title">{{$title}}</h3>
  <form name="detail" method="post" action="{{$XFA.detail_wrapping}}">
    <input type="hidden" name="{{$TABLEWR}}[{{$IDWR}}]" value="{{$detail.$IDWR}}" id="slid"/>
    <table id="list-table" width="100%" cellpadding="0" cellspacing="0">
        <tr>
        <th width="45%">Total Lineal Meters:</th>
        <td><input type="text" name="{{$TABLEWR}}[cw_total_lineal_meters]" value="{{$detail.cw_total_lineal_meters}}" size="15" />
        </td>
      </tr>
     <tr>
        <th>Height MM (CALCULATED IN 90MM Minimums):</th>
        <td><input type="text" name="{{$TABLEWR}}[cw_height_mm]" value="{{$detail.cw_height_mm}}" size="15" />
        </td>
      </tr>
     <tr>
        <th>Divider:</th>
        <td><input type="text" name="{{$TABLEWR}}[cw_divider]" value="{{$detail.cw_divider}}" size="15" />
        </td>
      </tr>
     <tr>
        <th>Lineal Meters per sqm:</th>
        <td><input type="text" name="{{$TABLEWR}}[cw_lineal_meters_per_sqm]" value="{{$detail.cw_lineal_meters_per_sqm}}" size="15" />
        </td>
      </tr>
     <tr>
        <th>Lineal Meter Rates In GST:</th>
        <td><input type="text" name="{{$TABLEWR}}[cw_lineal_meter_rates_in_gst]" value="{{$detail.cw_lineal_meter_rates_in_gst}}" size="15" />
        </td>
      </tr>
      <tr>
        <th>Number of screws per SQM - inc gst:</th>
        <td><input type="text" name="{{$TABLEWR}}[cw_number_of_screws_per_sqm]" value="{{$detail.cw_number_of_screws_per_sqm}}" size="15" />
        </td>
      </tr><tr>
        <th>Cost per unit - inc gst:</th>
        <td><input type="text" name="{{$TABLEWR}}[cw_cost_per_unit_inc_gst]" value="{{$detail.cw_cost_per_unit_inc_gst}}" size="15" />
        </td>
      </tr>
      
      <tr>
        <th>Cost Per SQM:</th>
        <td><input type="text" name="{{$TABLEWR}}[cw_cost_per_sqm]" value="{{$detail.cw_cost_per_sqm}}" size="15" />
        </td>
      </tr>
   
    <tr>
        <th>Cost Per Litre:</th>
        <td><input type="text" name="{{$TABLEWR}}[cw_cost_per_litre]" value="{{$detail.cw_cost_per_litre}}" size="15" />
        </td>
      </tr>
     <tr>
        <th>Litre per SQM:</th>
        <td><input type="text" name="{{$TABLEWR}}[cw_litre_per_sqm]" value="{{$detail.cw_litre_per_sqm}}" size="15" />
        </td>
      </tr>
     
      <tr>
        <th>Units Per SQM:</th>
        <td><input type="text" name="{{$TABLEWR}}[cw_units_per_sqm]" value="{{$detail.cw_units_per_sqm}}" size="15" />
        </td>
      </tr> 
      <tr>
        <th>Smart Bit - Cost Per Unit - inc gst:</th>
        <td><input type="text" name="{{$TABLEWR}}[cw_cost_per_unit_smart_bit]" value="{{$detail.cw_cost_per_unit_smart_bit}}" size="15" />
        </td>
      </tr> 
      
      <tr>
        <th>Wrapping Labour - Team leader output :</th>
        <td><input type="text" name="{{$TABLEWR}}[cw_team_leader_output]" value="{{$detail.cw_team_leader_output}}" size="15" />
        </td>
      </tr> 
      
      <tr>
        <th>Wrapping Labour - Team member output per hour:</th>
        <td><input type="text" name="{{$TABLEWR}}[cw_team_member_output]" value="{{$detail.cw_team_member_output}}" size="15" />
        </td>
      </tr> 
      
      <tr>
        <th>Wrapping Labour - Team hour rate allowance:</th>
        <td><input type="text" name="{{$TABLEWR}}[cw_team_hour_rate_allowance]" value="{{$detail.cw_team_hour_rate_allowance}}" size="15" />
        </td>
      </tr> 
      
      <tr>
        <th> Status:</th>
        <td><select name="{{$TABLEWR}}[cw_status]" class="lrg" style="width:150px;">
            <option value="1" {{if $detail.cw_status == 1}} selected="selected" {{/if}}> Active </option>
            <option value="0" {{if $detail.cw_status == 0}} selected="selected" {{/if}}> InActive </option>
          </select>
        </td>
      </tr>
      
      <tr>
        <td colspan="2" style="text-align:center;"><input type="submit" name="subAddDetail" value="Save" class="vsml" />
          <input type="button" name="btnCancelDetail" value="Cancel" onclick="document.location.href='{{$BASE_URL}}{{$XFA.list_wrapping}}'" class="vsml" />
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