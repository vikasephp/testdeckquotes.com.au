<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<div align="center">
  <h3 class="page-title">Calculator Handrail</h3>
  <form name="detail" method="post" action="{{$XFA.detail_handrail}}">
    <input type="hidden" name="{{$TABLEHR}}[{{$IDHR}}]" value="{{$detail.$IDHR}}" id="slid"/>
    
    <table id="list-table" width="100%" cellpadding="0" cellspacing="0">
		<tr> <th class="back">&nbsp;  </th> <th align="center" class="back" width="1%"> Lineal Meters: </th><th align="center" class="back" width="5%"> Lineal Meter Rate: </th> <th width="10%" class="back">Lineal Meter Time Allowance:</th><th width="5%" class="back">Team Hourly Rate:</th></tr>
        <tr>
        <th width="25%">Horizontal stainless steel wire with Australian hardwood timber post and handrail:</th>
        <td><input type="text" name="{{$TABLEHR}}[chr_lineal_meters_htph]" value="{{$detail.chr_lineal_meters_htph}}" size="5" /></td>
        <td><input type="text" name="{{$TABLEHR}}[chr_lineal_meter_rate_htph]" value="{{$detail.chr_lineal_meter_rate_htph}}" size="5" /></td>
        <td><input type="text" name="{{$TABLEHR}}[chr_lineal_meter_time_allowance_htph]" value="{{$detail.chr_lineal_meter_time_allowance_htph}}" size="5" /></td>
        <td><input type="text" name="{{$TABLEHR}}[chr_team_hourly_rate_htph]" value="{{$detail.chr_team_hourly_rate_htph}}" size="5" /></td>
        </tr>
        <tr>
        <th>Horizontal stainless steel wire with design pine post and handrail:</th>
        <td><input type="text" name="{{$TABLEHR}}[chr_lineal_meters_dpph]" value="{{$detail.chr_lineal_meters_dpph}}" size="5" /></td>
        <td><input type="text" name="{{$TABLEHR}}[chr_lineal_meter_rate_dpph]" value="{{$detail.chr_lineal_meter_rate_dpph}}" size="5" /></td>
        <td><input type="text" name="{{$TABLEHR}}[chr_lineal_meter_time_allowance_dpph]" value="{{$detail.chr_lineal_meter_time_allowance_dpph}}" size="5" /></td>
        <td><input type="text" name="{{$TABLEHR}}[chr_team_hourly_rate_dpph]" value="{{$detail.chr_team_hourly_rate_dpph}}" size="5" /></td>
        </tr>
       
        <tr>
        <th>Horizontal stainless steel wire with stainless steeel post Australian Hardwood handrail:</th>
        <td><input type="text" name="{{$TABLEHR}}[chr_lineal_meters_pahh]" value="{{$detail.chr_lineal_meters_pahh}}" size="5" /></td>
        <td><input type="text" name="{{$TABLEHR}}[chr_lineal_meter_rate_pahh]" value="{{$detail.chr_lineal_meter_rate_pahh}}" size="5" /></td>
        <td><input type="text" name="{{$TABLEHR}}[chr_lineal_meter_time_allowance_pahh]" value="{{$detail.chr_lineal_meter_time_allowance_pahh}}" size="5" /></td>
        <td><input type="text" name="{{$TABLEHR}}[chr_team_hourly_rate_pahh]" value="{{$detail.chr_team_hourly_rate_pahh}}" size="5" /></td>
        </tr>
        
        <tr>
        <th>Vertical stainless steel spokes with hardwood post, rail and handrail:</th>
        <td><input type="text" name="{{$TABLEHR}}[chr_lineal_meters_hprh]" value="{{$detail.chr_lineal_meters_hprh}}" size="5" /></td>
        <td><input type="text" name="{{$TABLEHR}}[chr_lineal_meter_rate_hprh]" value="{{$detail.chr_lineal_meter_rate_hprh}}" size="5" /></td>
        <td><input type="text" name="{{$TABLEHR}}[chr_lineal_meter_time_allowance_hprh]" value="{{$detail.chr_lineal_meter_time_allowance_hprh}}" size="5" /></td>
        <td><input type="text" name="{{$TABLEHR}}[chr_team_hourly_rate_hprh]" value="{{$detail.chr_team_hourly_rate_hprh}}" size="5" /></td>
        </tr>
        <tr>
        <th>Vertical stainless steel spokes with design pine post, rail and handrail:</th>
        <td><input type="text" name="{{$TABLEHR}}[chr_lineal_meters_pprh]" value="{{$detail.chr_lineal_meters_pprh}}" size="5" /></td>
        <td><input type="text" name="{{$TABLEHR}}[chr_lineal_meter_rate_pprh]" value="{{$detail.chr_lineal_meter_rate_pprh}}" size="5" /></td>
        <td><input type="text" name="{{$TABLEHR}}[chr_lineal_meter_time_allowance_pprh]" value="{{$detail.chr_lineal_meter_time_allowance_pprh}}" size="5" /></td>
        <td><input type="text" name="{{$TABLEHR}}[chr_team_hourly_rate_pprh]" value="{{$detail.chr_team_hourly_rate_pprh}}" size="5" /></td>
        </tr> 
        
        <th>Vertical stainless steel spokes with circular stainless steel, rail and handrail:</th>
        <td><input type="text" name="{{$TABLEHR}}[chr_lineal_meters_ssrh]" value="{{$detail.chr_lineal_meters_ssrh}}" size="5" /></td>
        <td><input type="text" name="{{$TABLEHR}}[chr_lineal_meter_rate_ssrh]" value="{{$detail.chr_lineal_meter_rate_ssrh}}" size="5" /></td>
        <td><input type="text" name="{{$TABLEHR}}[chr_lineal_meter_time_allowance_ssrh]" value="{{$detail.chr_lineal_meter_time_allowance_ssrh}}" size="5" /></td>
        <td><input type="text" name="{{$TABLEHR}}[chr_team_hourly_rate_ssrh]" value="{{$detail.chr_team_hourly_rate_ssrh}}" size="5" /></td>
        
        </tr> 
        
        <th>Painted timber (Treated pine) Balustrade:</th>
        <td><input type="text" name="{{$TABLEHR}}[chr_lineal_meters_tpb]" value="{{$detail.chr_lineal_meters_tpb}}" size="5" /></td>
        <td><input type="text" name="{{$TABLEHR}}[chr_lineal_meter_rate_tpb]" value="{{$detail.chr_lineal_meter_rate_tpb}}" size="5" /></td>
        <td><input type="text" name="{{$TABLEHR}}[chr_lineal_meter_time_allowance_tpb]" value="{{$detail.chr_lineal_meter_time_allowance_tpb}}" size="5" /></td>
        <td><input type="text" name="{{$TABLEHR}}[chr_team_hourly_rate_tpb]" value="{{$detail.chr_team_hourly_rate_tpb}}" size="5" /></td>
        </tr>
        
        <th>Painted timber (Design Pine) Balustrade:</th>
        <td><input type="text" name="{{$TABLEHR}}[chr_lineal_meters_dpb]" value="{{$detail.chr_lineal_meters_dpb}}" size="5" /></td>
        <td><input type="text" name="{{$TABLEHR}}[chr_lineal_meter_rate_dpb]" value="{{$detail.chr_lineal_meter_rate_dpb}}" size="5" /></td>
        <td><input type="text" name="{{$TABLEHR}}[chr_lineal_meter_time_allowance_dpb]" value="{{$detail.chr_lineal_meter_time_allowance_dpb}}" size="5" /></td>
        <td><input type="text" name="{{$TABLEHR}}[chr_team_hourly_rate_dpb]" value="{{$detail.chr_team_hourly_rate_dpb}}" size="5" /></td>
        </tr> 
        
        <th>Glass with clamp and timber hardwood post:</th>
        <td><input type="text" name="{{$TABLEHR}}[chr_lineal_meters_gthp]" value="{{$detail.chr_lineal_meters_gthp}}" size="5" /></td>
        <td><input type="text" name="{{$TABLEHR}}[chr_lineal_meter_rate_gthp]" value="{{$detail.chr_lineal_meter_rate_gthp}}" size="5" /></td>
        <td><input type="text" name="{{$TABLEHR}}[chr_lineal_meter_time_allowance_gthp]" value="{{$detail.chr_lineal_meter_time_allowance_gthp}}" size="5" /></td>
        <td><input type="text" name="{{$TABLEHR}}[chr_team_hourly_rate_gthp]" value="{{$detail.chr_team_hourly_rate_gthp}}" size="5" /></td>
        </tr>
        
        <th>Glass with stainless steel posts:</th>
        <td><input type="text" name="{{$TABLEHR}}[chr_lineal_meters_gssp]" value="{{$detail.chr_lineal_meters_gssp}}" size="5" /></td>
        <td><input type="text" name="{{$TABLEHR}}[chr_lineal_meter_rate_gssp]" value="{{$detail.chr_lineal_meter_rate_gssp}}" size="5" /></td>
        <td><input type="text" name="{{$TABLEHR}}[chr_lineal_meter_time_allowance_gssp]" value="{{$detail.chr_lineal_meter_time_allowance_gssp}}" size="5" /></td>
        <td><input type="text" name="{{$TABLEHR}}[chr_team_hourly_rate_gssp]" value="{{$detail.chr_team_hourly_rate_gssp}}" size="5" /></td>
        </tr>
        <th>Glass with stainless steel feet:</th>
        <td><input type="text" name="{{$TABLEHR}}[chr_lineal_meters_gssf]" value="{{$detail.chr_lineal_meters_gssf}}" size="5" /></td>
        <td><input type="text" name="{{$TABLEHR}}[chr_lineal_meter_rate_gssf]" value="{{$detail.chr_lineal_meter_rate_gssf}}" size="5" /></td>
        <td><input type="text" name="{{$TABLEHR}}[chr_lineal_meter_time_allowance_gssf]" value="{{$detail.chr_lineal_meter_time_allowance_gssf}}" size="5" /></td>
        <td><input type="text" name="{{$TABLEHR}}[chr_team_hourly_rate_gssf]" value="{{$detail.chr_team_hourly_rate_gssf}}" size="5" /></td>
        </tr>
        <th>Glass with clamp with timber hardwood post:</th>
        <td><input type="text" name="{{$TABLEHR}}[chr_lineal_meters_cthp]" value="{{$detail.chr_lineal_meters_cthp}}" size="5" /></td>
        <td><input type="text" name="{{$TABLEHR}}[chr_lineal_meter_rate_cthp]" value="{{$detail.chr_lineal_meter_rate_cthp}}" size="5" /></td>
        <td><input type="text" name="{{$TABLEHR}}[chr_lineal_meter_time_allowance_cthp]" value="{{$detail.chr_lineal_meter_time_allowance_cthp}}" size="5" /></td>
        <td><input type="text" name="{{$TABLEHR}}[chr_team_hourly_rate_cthp]" value="{{$detail.chr_team_hourly_rate_cthp}}" size="5" /></td>
        </tr>     
       </table>
       
       <br /> 

        <table id="list-table" width="100%" cellpadding="0" cellspacing="0">
		<tr> <th align="center" colspan="4" class="back"><div align="center"> Timber Screening Handrail - Raw Materials ( 1 meter in  height)</div> </th> </tr>
        <tr> <th align="center" colspan="4" class="back"> Posts - 90mm x35mm F27  </th> </tr>
        <tr>
        <th width="25%">Cost per lineal meter :</th>
        <td><input type="text" name="{{$TABLEHR}}[chr_cost_per_lineal_meter_posts]" value="{{$detail.chr_cost_per_lineal_meter_posts}}" size="5" /></td>
        <th width="25%">Lineal Metres Per Lineal Meter:</th>
        <td><input type="text" name="{{$TABLEHR}}[chr_lineal_meters_per_lineal_meter_posts]" value="{{$detail.chr_lineal_meters_per_lineal_meter_posts}}" size="5" /></td>
        </tr>
        
        <tr> <th align="center" colspan="4" class="back"> Top Rail - 140mm 35mm f27  </th> </tr>
        <tr>
        <th width="25%">Cost per lineal meter :</th>
        <td><input type="text" name="{{$TABLEHR}}[chr_cost_per_lineal_meter_toprail]" value="{{$detail.chr_cost_per_lineal_meter_toprail}}" size="5" /></td>
        <th width="25%">Lineal Metres Per Lineal Meter:</th>
        <td><input type="text" name="{{$TABLEHR}}[chr_lineal_meters_per_lineal_meter_toprail]" value="{{$detail.chr_lineal_meters_per_lineal_meter_toprail}}" size="5" /></td>
        </tr>
        
        <tr> <th align="center" colspan="4" class="back"> Decking Boards - 84mm - 90mm   </th> </tr>
        <tr>
        <th width="25%">Cost per lineal meter :</th>
        <td><input type="text" name="{{$TABLEHR}}[chr_cost_per_lineal_meter_decking]" value="{{$detail.chr_cost_per_lineal_meter_decking}}" size="5" /></td>
        <th width="25%">Lineal Metres Per Lineal Meter:</th>
        <td><input type="text" name="{{$TABLEHR}}[chr_lineal_meters_per_lineal_meter_decking]" value="{{$detail.chr_lineal_meters_per_lineal_meter_decking}}" size="5" /></td>
        </tr>
        
        <tr> <th align="center" colspan="4" class="back"> Screws - 10g 50mm Stainles Steel steel square Drive decking Screws </th> </tr>
        <tr>
        <th width="25%">Cost per lineal meter :</th>
        <td><input type="text" name="{{$TABLEHR}}[chr_cost_per_lineal_meter_screws]" value="{{$detail.chr_cost_per_lineal_meter_screws}}" size="5" /></td>
        <th width="25%">Lineal Metres Per Lineal Meter:</th>
        <td><input type="text" name="{{$TABLEHR}}[chr_lineal_meters_per_lineal_meter_screws]" value="{{$detail.chr_lineal_meters_per_lineal_meter_screws}}" size="5" /></td>
        </tr>
        
        <tr> <th align="center" colspan="4" class="back"> Organil Oil </th> </tr>
        <tr>
        <th width="25%">Cost per Liter :</th>
        <td><input type="text" name="{{$TABLEHR}}[chr_cost_per_liter_organil]" value="{{$detail.chr_cost_per_liter_organil}}" size="5" /></td>
        <th width="25%">Liters per Lineal Meters:</th>
        <td><input type="text" name="{{$TABLEHR}}[chr_lineal_meters_per_lineal_meter_organil]" value="{{$detail.chr_lineal_meters_per_lineal_meter_organil}}" size="5" /></td>
        </tr>
        
       </table> 
       <br />
        <table id="list-table" width="100%" cellpadding="0" cellspacing="0">
		<tr> <th align="center" colspan="6" class="back"><div align="center"> Timber Screening Handrail - Labour ( 1 meter in  height)</div> </th> </tr>
       <tr>
        <th width="25%">Lineal Meters Per Hour-Frame :</th>
        <td><input type="text" name="{{$TABLEHR}}[chr_linear_meter_per_hour_frame]" value="{{$detail.chr_linear_meter_per_hour_frame}}" size="5" /></td>
        <th width="25%">Cost Per Hour Labour-Frame:</th>
        <td><input type="text" name="{{$TABLEHR}}[chr_cost_per_hour_labour_frame]" value="{{$detail.chr_cost_per_hour_labour_frame}}" size="5" /></td>
        <th>&nbsp;</th> <td>&nbsp;</td>
        </tr>
        
       <tr>
        <th width="25%">Divder - Decking Board :</th>
        <td><input type="text" name="{{$TABLEHR}}[chr_divider_decking]" value="{{$detail.chr_divider_decking}}" size="5" /></td>
        <th width="25%">Cost Per Hour Labour - Decking Board:</th>
        <td><input type="text" name="{{$TABLEHR}}[chr_cost_per_hour_labour_decking]" value="{{$detail.chr_cost_per_hour_labour_decking}}" size="5" /></td>
        <th width="25%">Team Output -  Decking Board :</th>
        <td><input type="text" name="{{$TABLEHR}}[chr_team_output_decking]" value="{{$detail.chr_team_output_decking}}" size="5" /></td>
        </tr>
        
       </table> 
        
      <br /><br />
           
      <table id="list-table" width="100%" cellpadding="0" cellspacing="0"> 
	     
      <tr>
        <th> Status:</th>
        <td><select name="{{$TABLEHR}}[chr_status]" class="lrg" style="width:150px;">
            <option value="1" {{if $detail.chr_status == 1}} selected="selected" {{/if}}> Active </option>
            <option value="0" {{if $detail.chr_status == 0}} selected="selected" {{/if}}> InActive </option>
          </select>
        </td>
      </tr>
      
      <tr>
        <td colspan="2" style="text-align:center;"><input type="submit" name="subAddDetail" value="Save" class="vsml" />
          <input type="button" name="btnCancelDetail" value="Cancel" onclick="document.location.href='{{$BASE_URL}}{{$XFA.list_handrail}}'" class="vsml" />
        </td>
      </tr>
    </table>
  </form>
</div>
<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("detail");
    frmvalidator.EnableMsgsTogether();
    //frmvalidator.addValidation("seller_listing[sl_business_id]","req", "Please specify Valid Business Name.");
  
</script>