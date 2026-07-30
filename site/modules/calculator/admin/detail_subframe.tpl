<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<div align="center">
  <h3 class="page-title">Calculator Subframe</h3>
  <form name="detail" method="post" action="{{$XFA.detail_subframe}}">
    <input type="hidden" name="{{$TABLESF}}[{{$IDSF}}]" value="{{$detail.$IDSF}}" id="slid"/>
    <table id="list-table" width="100%" cellpadding="0" cellspacing="0">
		<tr><th align="center" colspan="6" class="back" class="back"> Sub Frame - Raw Materials-Treated Pine </th> </tr>
        <tr>
        <th width="25%">Treated pine cost per sqm:</th>
        <td><input type="text" name="{{$TABLESF}}[csf_tp_cost_per_sqm]" value="{{$detail.csf_tp_cost_per_sqm}}" size="5" /></td>
        <th width="25%">Height catergory:</th>
        <td><input type="text" name="{{$TABLESF}}[csf_height_category]" value="{{$detail.csf_height_category}}" size="5" /></td>
        <th width="25%">Kilos per bag:</th>
        <td><input type="text" name="{{$TABLESF}}[csf_kilos_per_bag]" value="{{$detail.csf_kilos_per_bag}}" size="5" /></td>
        </tr>
       <tr>
        <th width="25%">Bags per sqm:</th>
        <td><input type="text" name="{{$TABLESF}}[csf_bags_per_sqm1]" value="{{$detail.csf_bags_per_sqm1}}" size="5" /></td>
        <th width="25%">Cost Per Bag:</th>
        <td><input type="text" name="{{$TABLESF}}[csf_cost_per_bag]" value="{{$detail.csf_cost_per_bag}}" size="5" /></td>
        <th width="25%">Cost per unit:</th>
        <td><input type="text" name="{{$TABLESF}}[csf_cost_per_unit]" value="{{$detail.csf_cost_per_unit}}" size="5" /></td>
        </tr>
       <tr>
        <th width="25%">Units per SQM:</th>
        <td><input type="text" name="{{$TABLESF}}[csf_units_per_sqm]" value="{{$detail.csf_units_per_sqm}}" size="5" /></td>
        <th width="25%">Screw and Nails cost per SQM:</th>
        <td><input type="text" name="{{$TABLESF}}[csf_bags_per_sqm2]" value="{{$detail.csf_bags_per_sqm2}}" size="5" /></td>
        <th width="25%">Tie down allowance cost per SQM:</th>
        <td><input type="text" name="{{$TABLESF}}[csf_tda_cost_per_sqm]" value="{{$detail.csf_tda_cost_per_sqm}}" size="5" /></td>
        </tr>
       
        </table>
        
        <table id="list-table" width="100%" cellpadding="0" cellspacing="0">
        <tr><th align="center" colspan="6" class="back"> Sub Frame - Labour - Treated Pine  </th> </tr>
      
       <tr>
        <th width="25%">Team leader SQM output per hour:</th>
        <td><input type="text" name="{{$TABLESF}}[csf_tl_output_per_hr]" value="{{$detail.csf_tl_output_per_hr}}" size="5" /></td>
        <th width="25%">Team member SQM output per hour:</th>
        <td><input type="text" name="{{$TABLESF}}[csf_tm_output_per_hr]" value="{{$detail.csf_tm_output_per_hr}}" size="5" /></td>
        <th width="25%">Team hour rate allowance:</th>
        <td><input type="text" name="{{$TABLESF}}[csf_team_hr_rate_allowance]" value="{{$detail.csf_team_hr_rate_allowance}}" size="5" /></td>
      
       </tr>
       
       </table>
        
        <table id="list-table" width="100%" cellpadding="0" cellspacing="0">
       
        <tr><th align="center" colspan="6" class="back">Sub Frame - Raw Materials- Design/Cypress Pine</th> </tr>
        <th width="25%">Treated pine cost per sqm:</th>
        <td><input type="text" name="{{$TABLESF}}[csf_tp_cost_per_sqm_dc]" value="{{$detail.csf_tp_cost_per_sqm_dc}}" size="5" /></td>
        <th width="25%">Height catergory:</th>
        <td><input type="text" name="{{$TABLESF}}[csf_height_category_dc]" value="{{$detail.csf_height_category_dc}}" size="5" /></td>
        <th width="25%">Kilos per bag:</th>
        <td><input type="text" name="{{$TABLESF}}[csf_kilos_per_bag_dc]" value="{{$detail.csf_kilos_per_bag_dc}}" size="5" /></td>
        </tr>
        <tr>
        <th width="25%">Bags per sqm:</th>
        <td><input type="text" name="{{$TABLESF}}[csf_bags_per_sqm_dc1]" value="{{$detail.csf_bags_per_sqm_dc1}}" size="5" /></td>
        <th width="25%">Cost Per Bag:</th>
        <td><input type="text" name="{{$TABLESF}}[csf_cost_per_bag_dc]" value="{{$detail.csf_cost_per_bag_dc}}" size="5" /></td>
        <th width="25%">Cost per unit:</th>
        <td><input type="text" name="{{$TABLESF}}[csf_cost_per_unit_dc]" value="{{$detail.csf_cost_per_unit_dc}}" size="5" /></td>
         </tr>
        <tr>
        <th width="25%">Units per SQM:</th>
        <td><input type="text" name="{{$TABLESF}}[csf_units_per_sqm_dc]" value="{{$detail.csf_units_per_sqm_dc}}" size="5" /></td>
        <th width="25%">Screw and Nails cost per SQM:</th>
        <td><input type="text" name="{{$TABLESF}}[csf_bags_per_sqm_dc2]" value="{{$detail.csf_bags_per_sqm_dc2}}" size="5" /></td>
       
        <th width="25%">Tie down allowance cost per SQM:</th>
        <td><input type="text" name="{{$TABLESF}}[csf_tda_cost_per_sqm_dc]" value="{{$detail.csf_tda_cost_per_sqm_dc}}" size="5" /></td>
         </tr>
        
       </table>
        
      <table id="list-table" width="100%" cellpadding="0" cellspacing="0"> 
        
      <tr><th align="center" colspan="6" class="back">Sub Frame - Labour - Design/Cypress Pine</th> </tr>
      
      <tr>
        <th width="25%">Subframe less posts - Team leader SQM output per hour:</th>
        <td><input type="text" name="{{$TABLESF}}[csf_tl_output_per_hr_dc_lp]" value="{{$detail.csf_tl_output_per_hr_dc_lp}}" size="5" /></td>
        <th width="25%">Subframe less posts - Team member SQM output per hour:</th>
        <td><input type="text" name="{{$TABLESF}}[csf_tm_output_per_hr_dc_lp]" value="{{$detail.csf_tm_output_per_hr_dc_lp}}" size="5" /></td>
        <th width="25%">Subframe less posts - Team hour rate allowance:</th>
        <td><input type="text" name="{{$TABLESF}}[csf_team_hr_rate_allowance_dc_lp]" value="{{$detail.csf_team_hr_rate_allowance_dc_lp}}" size="5" /></td>
       
       </tr>
      
      <tr>
        <th width="25%">Posts treated pine - Team leader SQM output per hour:</th>
        <td><input type="text" name="{{$TABLESF}}[csf_tl_output_per_hr_dc_ptp]" value="{{$detail.csf_tl_output_per_hr_dc_ptp}}" size="5" /></td>
        <th width="25%">Posts treated pine - Team member SQM output per hour:</th>
        <td><input type="text" name="{{$TABLESF}}[csf_tm_output_per_hr_dc_ptp]" value="{{$detail.csf_tm_output_per_hr_dc_ptp}}" size="5" /></td>
        <th width="25%">Posts treated pine - Team hour rate allowance:</th>
        <td><input type="text" name="{{$TABLESF}}[csf_team_hr_rate_allowance_dc_ptp]" value="{{$detail.csf_team_hr_rate_allowance_dc_ptp}}" size="5" /></td>
      
       </tr>
      
      </table>
        
      <table id="list-table" width="100%" cellpadding="0" cellspacing="0"> 
      
      <tr><th align="center" colspan="8" class="back">Concrete Patio/Porch - Raw Materials</th> </tr>
      
        <tr>
        <th width="25%">Cost per lineal meter:</th>
        <td><input type="text" name="{{$TABLESF}}[csf_cost_per_lineal_meter]" value="{{$detail.csf_cost_per_lineal_meter}}" size="5" /></td>
        <th width="25%">Meters used per SQM:</th>
        <td><input type="text" name="{{$TABLESF}}[csf_meters_used_per_sqm]" value="{{$detail.csf_meters_used_per_sqm}}" size="5" /></td>
        <th width="25%">Galvanised concrete screw unit price:</th>
        <td><input type="text" name="{{$TABLESF}}[csf_unit_price_con_screw]" value="{{$detail.csf_unit_price_con_screw}}" size="5" /></td>
        <th width="25%">Galvanised concrete screw units per sqm:</th>
        <td><input type="text" name="{{$TABLESF}}[csf_units_per_sqm_con_screw]" value="{{$detail.csf_units_per_sqm_con_screw}}" size="5" /></td>
        </tr>
        
       <tr>
        <th width="25%">Bugle head batten screw unit price:</th>
        <td><input type="text" name="{{$TABLESF}}[csf_unit_price_batten_screw]" value="{{$detail.csf_unit_price_batten_screw}}" size="5" /></td>
        <th width="25%">Bugle head batten screw units per SQM:</th>
        <td><input type="text" name="{{$TABLESF}}[csf_units_per_sqm_batten_screw]" value="{{$detail.csf_units_per_sqm_batten_screw}}" size="5" /></td>
        <th width="25%">Plastic window packer unit price:</th>
        <td><input type="text" name="{{$TABLESF}}[csf_unit_price_window_packer]" value="{{$detail.csf_unit_price_window_packer}}" size="5" /></td>
        <th width="25%">Plastic window packer units per sqm:</th>
        <td><input type="text" name="{{$TABLESF}}[csf_units_per_sqm_window_packer]" value="{{$detail.csf_units_per_sqm_window_packer}}" size="5" /></td>
        </tr>
       
         <tr>
        <th width="25%">Treated pine re sealer price per Can:</th>
        <td><input type="text" name="{{$TABLESF}}[csf_price_per_can]" value="{{$detail.csf_price_per_can}}" size="5" /></td>
        <th width="25%">Treated pine re sealer sqm per Can:</th>
        <td><input type="text" name="{{$TABLESF}}[csf_units_per_can_resealer]" value="{{$detail.csf_units_per_can_resealer}}" size="5" /></td>
        <th width="25%"></th>
        <td></td>
        <th width="25%"></th>
        <td></td>
        </tr>
       
          </table>
        
      <table id="list-table" width="100%" cellpadding="0" cellspacing="0"> 
       <tr><th align="center" colspan="6" class="back">Concrete Patio/Porch - Labour</th> </tr>
          <tr>
        <th width="25%">Team Leader Output Per Hour:</th>
        <td><input type="text" name="{{$TABLESF}}[csf_tl_output_per_hour_con]" value="{{$detail.csf_tl_output_per_hour_con}}" size="5" /></td>
        <th width="25%">Team Member Outpur Per Hour:</th>
        <td><input type="text" name="{{$TABLESF}}[csf_tm_output_per_hour_con]" value="{{$detail.csf_tm_output_per_hour_con}}" size="5" /></td>
        <th width="25%">Cost Per Hour Labour:</th>
        <td><input type="text" name="{{$TABLESF}}[csf_cost_per_hour_con]" value="{{$detail.csf_cost_per_hour_con}}" size="5" /></td>
      
        </tr>
           </table>
        
      <table id="list-table" width="100%" cellpadding="0" cellspacing="0"> 
         <tr><th align="center" colspan="8" class="back">Sub-Frame - Hardwood Timber - Raw Materials</th> </tr>
       
         <tr>
        <th width="25%">Lineal Meters per SQM-Joist</th>
        <td><input type="text" name="{{$TABLESF}}[csf_lineral_meter_per_sqm_joist]" value="{{$detail.csf_lineral_meter_per_sqm_joist}}" size="5" /></td>
        <th width="25%">Price Per Lineal Meters-Joist:</th>
        <td><input type="text" name="{{$TABLESF}}[csf_price_per_lineal_meter_joist]" value="{{$detail.csf_price_per_lineal_meter_joist}}" size="5" /></td>
        <th width="25%">Lineal Meters per SQM-Perimeter Beam:</th>
        <td><input type="text" name="{{$TABLESF}}[csf_lineral_meter_per_sqm_pebeam]" value="{{$detail.csf_lineral_meter_per_sqm_pebeam}}" size="5" /></td>
        <th width="25%">Price Per Lineal Meters-Perimeter Beam:</th>
        <td><input type="text" name="{{$TABLESF}}[csf_price_per_lineal_meter_pebeam]" value="{{$detail.csf_price_per_lineal_meter_pebeam}}" size="5" /></td>
        </tr>
        
        <tr>
        <th width="25%">Lineal Meters per SQM-Ledger Beam</th>
        <td><input type="text" name="{{$TABLESF}}[csf_lineral_meter_per_sqm_lebeam]" value="{{$detail.csf_lineral_meter_per_sqm_lebeam}}" size="5" /></td>
        <th width="25%">Price Per Lineal Meters-Ledger Beam:</th>
        <td><input type="text" name="{{$TABLESF}}[csf_price_per_lineal_meter_lebeam]" value="{{$detail.csf_price_per_lineal_meter_lebeam}}" size="5" /></td>
        <th width="25%">Lineal Meters per SQM-posts treated pine:</th>
        <td><input type="text" name="{{$TABLESF}}[csf_lineral_meter_per_sqm_ptpine]" value="{{$detail.csf_lineral_meter_per_sqm_ptpine}}" size="5" /></td>
        <th width="25%">Cost Per SQM-posts treated pine:</th>
        <td><input type="text" name="{{$TABLESF}}[csf_price_per_lineal_meter_ptpine]" value="{{$detail.csf_price_per_lineal_meter_ptpine}}" size="5" /></td>
        </tr>
       
        <tr>
        <th width="25%">Units Per SQM-Post Stirrups</th>
        <td><input type="text" name="{{$TABLESF}}[csf_units_per_sqm_pstirrups]" value="{{$detail.csf_units_per_sqm_pstirrups}}" size="5" /></td>
        <th width="25%">Costs Per Stirup:</th>
        <td><input type="text" name="{{$TABLESF}}[csf_cost_per_stirup]" value="{{$detail.csf_cost_per_stirup}}" size="5" /></td>
        <th width="25%">Cost per sqm-Tie down allowance:</th>
        <td><input type="text" name="{{$TABLESF}}[csf_cost_per_sqm_tiedown]" value="{{$detail.csf_cost_per_sqm_tiedown}}" size="5" /></td>
        <th width="25%">Cost per sqm-Organ Oil:</th>
        <td><input type="text" name="{{$TABLESF}}[csf_cost_per_sqm_organoil]" value="{{$detail.csf_cost_per_sqm_organoil}}" size="5" /></td>
        </tr>
        
        <tr>
        <th width="25%">Mass Concrete-Bags per SQM</th>
        <td><input type="text" name="{{$TABLESF}}[csf_bags_per_sqm_mass_concrete]" value="{{$detail.csf_bags_per_sqm_mass_concrete}}" size="5" /></td>
        <th width="25%">Mass Concrete-cost per bag:</th>
        <td><input type="text" name="{{$TABLESF}}[csf_cost_per_bag_mass_concrete]" value="{{$detail.csf_cost_per_bag_mass_concrete}}" size="5" /></td>
        <th width="25%"></th>
        <td></td>
        <th width="25%"></th>
        <td></td>
        </tr>

   </table>
        
      <table id="list-table" width="100%" cellpadding="0" cellspacing="0"> 

		<tr><th align="center" colspan="6" class="back">Sub Frame-Hardwood Timber - Labour</th> </tr>
		  <tr>
        <th width="25%">Team leader SQM output per hour-Labour</th>
        <td><input type="text" name="{{$TABLESF}}[csf_tl_output_per_hour_sflabour]" value="{{$detail.csf_tl_output_per_hour_sflabour}}" size="5" /></td>
        <th width="25%">Team member SQM output per hour-Labour:</th>
        <td><input type="text" name="{{$TABLESF}}[csf_tm_output_per_hour_sflabour]" value="{{$detail.csf_tm_output_per_hour_sflabour}}" size="5" /></td>
        <th width="25%">Team hour rate allowance-Labour:</th>
        <td><input type="text" name="{{$TABLESF}}[csf_team_hour_rate_allow_sflabour]" value="{{$detail.csf_team_hour_rate_allow_sflabour}}" size="5" /></td>
           </tr>

	  <tr>
        <th width="25%">Team leader SQM output per hour-Post Labour</th>
        <td><input type="text" name="{{$TABLESF}}[csf_tl_output_per_hour_post_labour]" value="{{$detail.csf_tl_output_per_hour_post_labour}}" size="5" /></td>
        <th width="25%">Team member SQM output per hour-Post Labour:</th>
        <td><input type="text" name="{{$TABLESF}}[csf_tm_output_per_hour_post_labour]" value="{{$detail.csf_tm_output_per_hour_post_labour}}" size="5" /></td>
        <th width="25%">Team hour rate allowance-Post Labour:</th>
        <td><input type="text" name="{{$TABLESF}}[csf_team_hour_rate_allow_post_labour]" value="{{$detail.csf_team_hour_rate_allow_post_labour}}" size="5" /></td>
      </tr>

     
      <tr>
        <th> Status:</th>
        <td><select name="{{$TABLESF}}[csf_status]" class="lrg" style="width:150px;">
            <option value="1" {{if $detail.csf_status == 1}} selected="selected" {{/if}}> Active </option>
            <option value="0" {{if $detail.csf_status == 0}} selected="selected" {{/if}}> InActive </option>
          </select>
        </td>
      </tr>
      
      <tr>
        <td colspan="2" style="text-align:center;"><input type="submit" name="subAddDetail" value="Save" class="vsml" />
          <input type="button" name="btnCancelDetail" value="Cancel" onclick="document.location.href='{{$BASE_URL}}{{$XFA.list_subframe}}'" class="vsml" />
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