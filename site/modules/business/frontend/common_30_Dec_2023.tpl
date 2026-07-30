{{if !empty($taskmsg)}}{{$taskmsg}}{{/if}}
{{if !empty($resultStates) AND count($resultStates)>0}}
<style>
	.ddcolor {color:#FFFFFF;}
</style>
<div id="divInfosaleToReturn">
  <select name="" multiple="multiple" style="width:290px;">
	{{foreach from=$resultStates item=item key=key}}  
    <option value="" onclick="javascript:setState('{{$item.s_name}}','{{$item.s_parent_state}}','{{$item.s_postal_code}}','{{$item.s_id}}');">{{$item.s_name}} - {{$item.s_parent_state}} - {{$item.s_postal_code}} </option> 
    {{/foreach}}
  </select>
</div>
{{/if}}
{{if !empty($quotesdata)}}
<link rel="stylesheet" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type='text/javascript' src='{{$BASE_URL}}js/jquery-1.7.2.js'></script>
<script type='text/javascript' src='{{$BASE_URL}}js/jsfunction.js'></script>
<script src="{{$BASE_URL}}js/jquery.hashchange.min.js" type="text/javascript"></script>
<script src="{{$BASE_URL}}js/jquery.easytabs.js" type="text/javascript"></script>


<div id="quoteIframe">
<form name="quotes" action="" method="post" id="type">
<input type="hidden" name="bsn_id" id="bsn_id" value="{{$p_id}}" />
<input type="hidden" name="calcurl" id="calcurl" value="{{$BASE_URL}}{{$XFA.calcadd}}" />
    <table cellpadding="0" cellspacing="0" border="0" width="99%">
            <tr>
            	<td width="33%"><input type="button" value="Job Profit and Loss" name="job_profit_and_loss"  class="openpopup" style="width:200px;" /></td>
            	<td width="33%"><input type="button" value="Decking" name="decking" class="openpopup" style="width:200px;" /></td>
                <td width="33%"><input type="button" value="Wrapping" name="wrapping" class="openpopup" style="width:200px;" /></td>
            </tr>
            <tr>
                <td><input type="button" value="Sub-frame" name="sub_frame" class="openpopup" style="width:200px;" /></td>
                <td><input type="button" value="Handrail" name="handrail" class="openpopup" style="width:200px;" /></td>
                <td><input type="button" value="Stairs" name="stairs" class="openpopup" style="width:200px;" /></td>
            </tr>
            <tr>
            	<td><input type="button" value="Roof" name="roof" class="openpopup" style="width:200px;" /></td>
            	<td><input type="button" name="extras" value="Extra's" class="openpopup" style="width:200px;" /></td>
                <td><input type="button" value="Ancilary" name="ancilary" class="openpopup" style="width:200px;" /></td>
           </tr>
           <tr>
            	<td><input type="button" value="Unique Project Extras" name="Unique_Project_Extras" class="openpopup" style="width:200px;" /></td>
            	<td></td>
                <td></td>
           </tr>
    </table>
    <div>&nbsp;</div>
<div>    
<div id="job_profit_and_loss" class="popupdiv">
<table cellpadding="0" cellspacing="0"  width="99%">
  <tr>
	<th>Production</th>
    <th>Lease Generation and Converison</th>
    <th>Office and Profit</th>
    <th>Total</th>
  </tr>
<tr>
	<td valign="top">
    	<table cellpadding="0" cellspacing="0"  width="100%" style="border:4px solid #333333;" >
        <tr><th width="170"><div align="left">Item</div></th>
        	<th width="100">$</th>
            <th width="100">%</th>
     	</tr>
              <tr>
                <th><div align="left">Decking Total:</div>
                	<div id="ptype" style="text-align:left;font-size:9px;" ></div>
                </th>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_decking_total_values]" id="pqdt_decking_total_values" value="0.00" /></td>
                <td>&nbsp;%<input type="text" name="{{$TABLE}}[TE][pqdt_decking_total_per]" id="pqdt_decking_total_per" value="0.00"/></td>
             </tr>
             <tr>
                <th><div align="left">Wrapping Total:</div></th>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_wrapping_total_values]" id="pqdt_wrapping_total_values" value="0.00" /></td>
                <td>&nbsp;%<input type="text" name="{{$TABLE}}[TE][pqdt_wrapping_total_per]" id="pqdt_wrapping_total_per" value="0.00"/></td>
             </tr>
             <tr>
                <th><div align="left">Subframe Total:</div></th>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_subframe_total_values]" id="pqdt_subframe_total_values" value="0.00" /></td>
                <td>&nbsp;%<input type="text" name="{{$TABLE}}[TE][pqdt_subframe_total_per]" id="pqdt_subframe_total_per" value="0.00"/></td>
             </tr>
             <tr>
                <th><div align="left">Handrail Total:</div></th>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_handrail_total_values]" id="pqdt_handrail_total_values" value="0.00" /></td>
                <td>&nbsp;%<input type="text" name="{{$TABLE}}[TE][pqdt_handrail_total_per]" id="pqdt_handrail_total_per" value="0.00"/></td>
             </tr>
                    
             <tr>
                <th><div align="left">Stairs Material (total):</div></th>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_stairs_material_values]" id="pqdt_stairs_material_values" value="0.00" /></td>
               <td>&nbsp;%<input type="text" name="{{$TABLE}}[TE][pqdt_stairs_material_per]" id="pqdt_stairs_material_per" value="0.00"/></td>
             </tr>
             <tr>
                <th><div align="left">Roof Total:</div></th>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_roof_total_values]" id="pqdt_roof_total_values" value="0.00" /></td>
                <td>&nbsp;%<input type="text" name="{{$TABLE}}[TE][pqdt_roof_total_per]" id="pqdt_roof_total_per" value=""/></td>
             </tr>
            
            <tr>
                <th><div align="left">Extra: LED downlights</div></th>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_extra_led1_values]" id="pqdt_extra_led1_values" value="0.00" /></td>
                <td>&nbsp;%<input type="text" name="{{$TABLE}}[TE][pqdt_extra_led1_per]" id="pqdt_extra_led1_per" value="0.00"/></td>
             </tr>
             
             <tr>
                <th><div align="left">Extra: Approvals</div></th>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_extra_approvals1_values]" id="pqdt_extra_approvals1_values" value="0.00" /></td>
                <td>&nbsp;%<input type="text" name="{{$TABLE}}[TE][pqdt_extra_approvals1_per]" id="pqdt_extra_approvals1_per" value="0.00"/></td>
             </tr>
             <tr>
                <th><div align="left">Extra:</div></th>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_extra1_values]" id="pqdt_extra1_values" value="0.00" /></td>
                <td>&nbsp;%<input type="text" name="{{$TABLE}}[TE][pqdt_extra1_per]" id="pqdt_extra1_per" value="0.00"/></td>
             </tr>
             <tr>
                <th><div align="left">Extra:</div></th>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_extra2_values]" id="pqdt_extra2_values" value="0.00" /></td>
                <td>&nbsp;%<input type="text" name="{{$TABLE}}[TE][pqdt_extra2_per]" id="pqdt_extra2_per" value="0.00"/></td>
             </tr>
             <tr>
                <th><div align="left">Extra:</div></th>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_extra3_values]" id="pqdt_extra3_values" value="0.00" /></td>
                <td>&nbsp;%<input type="text" name="{{$TABLE}}[TE][pqdt_extra3_per]" id="pqdt_extra3_per" value=""/></td>
             </tr>
        	<tr>
                <th><div align="left">Total::</div></th>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_total1_values]" id="pqdt_total1_values" value="0.00" /></td>
                <td>%&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_total1_per]" id="pqdt_total1_per" value=""/></td>
             </tr>
    	</table>
        
    </td>
    <td valign="top">
    	   	<table cellpadding="0" cellspacing="0"  width="100%" style="border:4px solid #333333 ;">
      		  <tr><th><div align="left">Item</div></th><th width="100">$</th><th width="100">%</th></tr>
              <tr>
                <th ><div align="left">Lead Generation:</div></th>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_lead_generation_values]" id="pqdt_lead_generation_values" value="0.00" /></td>
                <td>%&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_lead_generation_per]" id="pqdt_lead_generation_per" value="0.00"/></td>
              </tr>
              <tr>
                <th><div align="left">Lead Converison:</div></th>
              <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_lead_converison_values]" id="pqdt_lead_converison_values" value="0.00" /></td>
                <td>%&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_lead_converison_per]" id="pqdt_lead_converison_per" value="0.00"/></td>
              </tr>
             <tr>
             	<th>Total:</th>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_total2_values]" id="pqdt_total2_values" value="0.00" /></td>
                <td>%&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_total2_per]" id="pqdt_total2_per" value="0.00" /></td>
             </tr>
             </table>
        	
            <table cellpadding="0" cellspacing="0"  width="100%" style="border:4px solid #333333; margin-top:10px;" >
      		  <tr><th><div align="left">Item</div></th>
              	  <th width="100">$</th>
                  <th width="100"><span style="font-size:9px; font-weight:normal;">Price to be put in <br />Project Proposal</span></th></tr>
              <tr>
                <th><div align="left">Decking Raw Materials:</div></th>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_decking_raw_materials_values]" id="pqdt_decking_raw_materials_values" value="0.00" /></td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <th><div align="left">Decking Weight Adjustement:</div></th>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_decking_weight_adjustment_values]" id="pqdt_decking_weight_adjustment_values" value="0.00" /></td>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_decking_weight_adjustment_per]" id="pqdt_decking_weight_adjustment_per" value="0.00"/></td>
              </tr>
              <tr>
                <th><div align="left">Wrapping Total:</div></th>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_wrapping_total1_values]" id="pqdt_wrapping_total1_values" value="0.00" /></td>
                <td>&nbsp;</td>
              </tr>
              
              <tr>
                <th><div align="left">Wrapping Adjustment:</div></th>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_wrapping_adjustment_values]" id="pqdt_wrapping_adjustment_values" value="0.00" /></td>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_wrapping_adjustment_per]" id="pqdt_wrapping_adjustment_per" value="0.00"/></td>
              </tr>
              
              <tr>
                <th><div align="left">Sub Frame Total:</div></th>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_sub_frame_values]" id="pqdt_sub_frame_values" value="0.00" /></td>
                <td>&nbsp;</td>
              </tr>
              
              <tr>
                <th><div align="left">Sub Frame Adjustement:</div></th>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_subframe_adjustment_values]" id="pqdt_subframe_adjustment_values" value="0.00" /></td>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_subframe_adjustment_per]" id="pqdt_subframe_adjustment_per" value="0.00"/></td>
              </tr>
              
              <tr>
                <th><div align="left">Handrail Total:</div></th>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_handrail_total1_values]" id="pqdt_handrail_total1_values" value="0.00" /></td>
                <td>&nbsp;</td>
              </tr>
              
              <tr>
                <th><div align="left">Handrail Adjustment:</div></th>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_handrail_adjustment_values]" id="pqdt_handrail_adjustment_values" value="0.00" /></td>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_handrail_adjustment_per]" id="pqdt_handrail_adjustment_per" value="0.00"/></td>
              </tr>
              
              <tr>
                <th><div align="left">Stairs  Total:</div></th>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_stairs_total_values]" id="pqdt_stairs_total_values" value="0.00" /></td>
               <td>&nbsp;</td>
              </tr>
              
              <tr>
                <th><div align="left">Stairs Adjustment:</div></th>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_stairs_adjustment_values]" id="pqdt_stairs_adjustment_values" value="0.00" /></td>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_stairs_adjustment_per]" id="pqdt_stairs_adjustment_per" value="0.00"/></td>
              </tr>
              
              <tr>
                <th><div align="left">Roof Total:</div></th>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_roof_total1_values]" id="pqdt_roof_total1_values" value="0.00" /></td>
            <td>&nbsp;</td>
              </tr>
              <tr>
                <th><div align="left">Roof Adjustment:</div></th>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_roof_adjustment_values]" id="pqdt_roof_adjustment_values" value="0.00" /></td>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_roof_adjustment_per]" id="pqdt_roof_adjustment_per" value="0.00"/></td>
              </tr>
              <tr>
                <th><div align="left">Extra: LED downlights:</div></th>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_extra_led2_values]" id="pqdt_extra_led2_values" value="0.00" /></td>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_extra_led2_per]" id="pqdt_extra_led2_per" value="0.00"/></td>
              </tr>
              <tr>
                <th><div align="left">Extra: Approvals:</div></th>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_extra_approvals2_values]" id="pqdt_extra_approvals2_values" value="0.00" /></td>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_extra_approvals2_per]" id="pqdt_extra_approvals2_per" value="0.00"/></td>
              </tr>
              <tr>
                <th><div align="left">Extra:</div></th>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_extra11_values]" id="pqdt_extra11_values" value="0.00" /></td>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_extra11_per]" id="pqdt_extra11_per" value="0.00"/></td>
              </tr>
                            
               <tr>
                <th><div align="left">Extra:</div></th>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_extra22_values]" id="pqdt_extra22_values" value="0.00" /></td>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_extra22_per]" id="pqdt_extra22_per" value="0.00"/></td>
              </tr>
              
               <tr>
                <th><div align="left">Extra:</div></th>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_extra33_values]" id="pqdt_extra33_values" value="0.00" /></td>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_extra33_per]" id="pqdt_extra33_per" value="0.00"/></td>
              </tr>
              
               <tr>
                <th><div align="left">Total:</div></th>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_total3_values]" id="pqdt_total3_values" value="0.00" /></td>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_total3_per]" id="pqdt_total3_per" value="0.00"/></td>
              </tr>
             </table>
            
    </td>
   <td valign="top">
   	<table cellpadding="0" cellspacing="0"  width="100%" style="border:4px solid #333333;">
        <tr><th width="130"><div align="left">Item</div></th><th width="100">$</th><th width="100">%</th></tr>
              <tr>
                <th><div align="left">Charity:</div></th>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_charity_values]" id="pqdt_charity_values" value="0.00" /></td>
                <td>&nbsp;%<input type="text" name="{{$TABLE}}[TE][pqdt_charity_per]" id="pqdt_charity_per" value="0.00"/></td>
             </tr>
               <tr>
                <th><div align="left">Profit:</div></th>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_profit_values]" id="pqdt_profit_values" value="0.00" /></td>
                <td>&nbsp;%<input type="text" name="{{$TABLE}}[TE][pqdt_profit_per]" id="pqdt_profit_per" value="0.00"/></td>
             </tr>
              <tr>
                <th><div align="left">Insurance:</div></th>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_insurance_values]" id="pqdt_insurance_values" value="0.00" /></td>
                <td>&nbsp;%<input type="text" name="{{$TABLE}}[TE][pqdt_insurance_per]" id="pqdt_insurance_per" value="0.00"/></td>
             </tr>
              <tr>
                <th><div align="left">Office Other:</div></th>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_office_other_values]" id="pqdt_office_other_values" value="0.00" /></td>
                <td>&nbsp;%<input type="text" name="{{$TABLE}}[TE][pqdt_office_other_per]" id="pqdt_office_other_per" value="0.00"/></td>
             </tr>
              <tr>
             	<th><div align="left">Gross Profit:</div></th>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_gross_profit_values]" id="pqdt_gross_profit_values" value="0.00" /></td>
                <td>%&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_gross_profit_per]" id="pqdt_gross_profit_per" value="0.00" /></td>
             </tr>
             
             <tr>
             	<th><div align="left">Total:</div></th>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_op_total_values]" id="pqdt_op_total_values" value="0.00" /></td>
                <td>%&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_op_total_per]" id="pqdt_op_total_per" value="0.00" /></td>
             </tr>
             
             </table>
             
           	<table cellpadding="0" cellspacing="0"  width="100%" style="border:4px solid #333333; margin-top:10px;">
              <tr>
                <th width="130"><div align="left">Lead Generation:</div></th>
                <td></td>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_lead_generation1_values]" id="pqdt_lead_generation1_values" value="0.00"/></td>
             </tr>
             <tr>
                <th><div align="left">Lead Converison:</div></th>
                <td></td>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_lead_converison1_values]" id="pqdt_lead_converison1_values" value="0.00"/></td>
             </tr>
             <tr>
                <th><div align="left">Charity:</div></th>
                <td></td>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_charity1_values]" id="pqdt_charity1_values" value="0.00"/></td>
             </tr>
             <tr>
                <th><div align="left">Profit:</div></th>
                <td></td>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_profit1_values]" id="pqdt_profit1_values" value="0.00"/></td>
             </tr>
             <tr>
                <th><div align="left">Insurance:</div></th> 
                <td></td>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_insurance1_values]" id="pqdt_insurance1_values" value="0.00"/></td>
             </tr>
             <tr>
                <th><div align="left">Office Other:</div></th>
                <td></td>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_office_other1_values]" id="pqdt_office_other1_values" value="0.00"/></td>
             </tr>
             
             <tr>
                <th><div align="left">Adjustment:</div></th>
                <td></td>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_adjustment_values]" id="pqdt_adjustment_values" value="0.00"/></td>
             </tr>
             
             <tr>
                <th><div align="left">Decking:</div></th>
                <td>%&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_decking_per]" id="pqdt_decking_per" value="0.00"/></td>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_decking_values]" id="pqdt_decking_values" value="0.00"/></td>
             </tr>
              <tr>
                <th><div align="left">Wrapping:</div></th>
                <td>%&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_wrapping_per]" id="pqdt_wrapping_per" value="0.00"/></td>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_wrapping_values]" id="pqdt_wrapping_values" value="0.00"/></td>
             </tr>
              <tr>
                <th><div align="left">Sub Frame:</div></th>
                <td>%&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_sub_frame1_per]" id="pqdt_sub_frame1_per" value="0.00"/></td>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_sub_frame1_values]" id="pqdt_sub_frame1_values" value="0.00"/></td>
             </tr>
              <tr>
                <th><div align="left">Handrail:</div></th>
                <td>%&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_handrail_per]" id="pqdt_handrail_per" value="0.00"/></td>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_handrail_values]" id="pqdt_handrail_values" value="0.00"/></td>
             </tr>
             
               <tr>
                <th><div align="left">Stairs:</div></th>
                <td>%&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_stairs_per]" id="pqdt_stairs_per" value="0.00"/></td>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_stairs_values]" id="pqdt_stairs_values" value="0.00"/></td>
             </tr>
             
              <tr>
                <th><div align="left">Roofing:</div></th>
                <td>%&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_roofing_per]" id="pqdt_roofing_per" value="0.00"/></td>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_roofing_values]" id="pqdt_roofing_values" value="0.00"/></td>
             </tr>
            
             <tr>
                <th><div align="left">Must=100%:</div></th>
                <td>%&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_must_per]" id="pqdt_must_per" value="0.00"/></td>
                <td>$&nbsp;<input type="text" name="{{$TABLE}}[TE][pqdt_must_values]" id="pqdt_must_values" value="0.00"/></td>
             </tr>

             </table>
               
           
   </td>
   <td valign="top">
   	<table cellpadding="0" cellspacing="0"  width="100%">
              <tr><td><input type="text" name="{{$TABLE}}[TE][pqdt_ftotal1_values]" id="pqdt_ftotal1_values" value="0.00" /></td></tr>
              <tr><td><input type="text" name="{{$TABLE}}[TE][pqdt_ftotal2_values]" id="pqdt_ftotal2_values" value="0.00" /></td></tr>
              <tr><td><input type="text" name="{{$TABLE}}[TE][pqdt_ftotal1_values]" id="pqdt_ftotal3_values" value="0.00" /></td></tr>
              <tr><td><input type="text" name="{{$TABLE}}[TE][pqdt_ftotal2_values]" id="pqdt_ftotal4_values" value="0.00" /></td></tr>
     </table>        
   </td>
</tr> 
 </table><br /> 
  		<input type="button" name="calculate" id="calculate" value="Calculate" onclick="javascript:main_calculation();" />
   	  <input type="submit" name="submit" id="submit" value="Save Quote" />
  	</div>
  </div>
<div id="decking" class="popupdiv">
	<h1>Raw Materials Calculations - inc GST</h1>
    <h3>Decking Boards Raw Material</h3><br />
    <div style="float:left; padding:20px;">
    	<strong>Insert Project Total SQM:</strong> 
        <span><input type="text" name="decking_insert" id="decking_insert" value="0.00" /> 
        <strong>Select Project Type:</strong> 
        <span><select name="{{$TABLE}}[cd_type_id]" class="lrg" style="width:150px;" id="cd_type_id">
			{{foreach from=$Decking_types key="key" item="item"}}
				 <option value="{{$key}}" {{if $ctyid  == $key}} selected="selected" {{/if}}> {{$item}} </option>	            
            {{/foreach}}
          </select></span>
        &nbsp;<input type="submit" name="decking_value_set" id="decking_value_set" value="Load Value" /> 
        &nbsp;<input type="button" name="decking_calculate_new" id="decking_calculate_new" value="Calculate" /> </span>
    </div>
<table cellpadding="0" cellspacing="0"  width="99%">
  <tr>
    <th width="10%">SQM OR Lineal</th>
	<th width="15%">Cost Per SQM/Lineal Meter - Material</th>
    <th width="10%">Difficulty weight (default 100%)</th>
    <th width="10%">Total</th>
  </tr>
  <tr>
  	  <td>SQM</td>
      <td><input type="text" name="decking_cpslm1" id="decking_cpslm1" value="{{$dcaldata[0].cd_cost_per_sqm_lm_material}}" /></td>
      <td><input type="text" name="decking_diff1"  id="decking_diff1" value="100" /></td>
      <td><input type="text" name="decking_total1" id="decking_total1" value="0.00" class="dtotals" /></td>
  </tr>

  <tr>
    <th width="10%">SQM OR Lineal</th>
    <th width="15%">Cost Per SQM/Lineal Meter - Labour - Team</th>
    <th width="10%">Difficulty weight (default 100%)</th>
    <th width="10%">Total</th>
  </tr>
  
  <tr>
  	  <td>SQM</td>
      <td><input type="text" name="decking_cpslm2" id="decking_cpslm2" value="{{$dcaldata[0].cd_cost_per_sqm_lm_labour_team}}" /></td>
      <td><input type="text" name="decking_diff2"  id="decking_diff2" value="100" /></td>
      <td><input type="text" name="decking_total2" id="decking_total2" value="0.00" class="dtotals" /></td>
  </tr>
  
    <tr>
    <th width="10%">SQM OR Lineal</th>
    <th width="15%">Cost Per SQM/Lineal Meter - Labour - Indvidual</th>
    <th width="10%">Difficulty weight (default 100%)</th>
     <th width="10%">Total</th>
  </tr>

  <tr>
  	  <td>SQM</td>
      <td><input type="text" name="decking_cpslm3" id="decking_cpslm3" value="{{$dcaldata[0].cd_cost_per_sqm_lm_labour_indvidual}}" /></td>
      <td><input type="text" name="decking_diff3" id="decking_diff3" value="100" /></td>
      <td><input type="text" name="decking_total3" id="decking_total3" value="0.00" class="dtotals" /></td>
  </tr>

  <tr><th colspan="4"><h3>Decking Total Cost - inc gst - Raw Materials and Labour</h3></th></tr>
   <tr>
  	  <td colspan="3">
          <div align="right">
            <strong>Total:&nbsp;</strong>
          </div>
      </td>   
      <td><input type="text" name="decking_alltotal" id="decking_alltotal" value="0.00" class="subtotal" /></td>  
  </tr>
  </table>

 <table cellpadding="0" cellspacing="0"  width="99%">

    <tr>
  	  <td colspan="2"><div align="right"><strong>Grand Total:&nbsp;</strong></div></td>
      <td width="240"><input type="text" name="decking_alltotals" id="decking_alltotals" value="0.00" /></td>  
  </tr>
    <tr>
  	<td colspan="4">
      <input type="button" name="decking_calc" id="decking_calc" value="Calculate"/>&nbsp;
      <input type="button" name="decking_calc_save" id="decking_calc_save" value="Save Grand Total" alt="{{$BASE_URL}}{{$XFA.calcadd}}"/>
    </td>
  </tr>
 </table>  <br />
 <div id="showdeckcalc"></div>
 
  <table width="99%">
 <!-- <tr>
  	  <td><div align="right"><strong>Grand Total:&nbsp;</strong></div></td>
      <td width="100"><input type="text" name="decking_alltotals" id="decking_alltotals" value="0.00" /></td>  
  </tr>-->
  <tr>
  	<td colspan="2">
     <!-- <input type="button" name="decking_calc" id="decking_calc" value="Calculate"/>&nbsp;-->
    <input name="add_decking_cal" id="add_decking_cal" type="button" value="{{$button_text}}" />&nbsp;
    <!--<input type="button" name="decking_calc_save" id="decking_calc_save" value="Save" alt="{{$BASE_URL}}{{$XFA.calcadd}}"/>-->
    </td>
  </tr></table>
</div>
<div id="wrapping" class="popupdiv">
<div id="tab-wrapping" class='tab-container'>
<h1>Wrapping</h1><br />
 <ul class='etabs'>
   <li class='tab'><a href="#tabs11">Raw Materials</a></li>
   <li class='tab'><a href="#tabs12">Labour</a></li>
   <li class='tab'><a href="#tabs16">Render and Painted Blue Board for Wrapping</a></li>
 </ul>
 	<div class='panel-container'>
       <div id="tabs11">
        <h3>Wrapping Raw Materials</h3><br />
        <input type="submit" name="wrapping_value_set" id="wrapping_value_set" value="Load Value" /> 
          <table cellpadding="0" cellspacing="0"  width="99%">
              <tr>
                <th width="10%">Board Size</th>
                <th width="15%"></th>
                <th width="15%">Total Lineal Meters</th>
                <th width="15%">Height MM (CALCULATED IN 90MM Minimums)</th>
                <th width="10%">Total MM</th>
                <th width="15%">Divider</th>
                <th width="10%">Total SQM</th>
                <th>Lineal Meters per sqm</th>
                <th width="10%">Total Lineal Meters</th>
                <th>Lineal Meter Rates In GST</th>
                <th>Total</th>
              </tr>
              <tr>
                <td>86MM</td>
                <td></td>
                <td><input type="text" name="wrapping_wrm" id="wrapping_wrm" value="0.00" /></td>
                <td><input type="text" name="wrapping_hmm" id="wrapping_hmm" value="{{$wrapdata[0].cw_height_mm}}" /></td>
                <td><input type="text" name="wrapping_tm" id="wrapping_tm" value="0.00" /></td>
                <td><input type="text" name="wrapping_div" id="wrapping_div" value="{{$wrapdata[0].cw_divider}}" /></td>
                <td><input type="text" name="wrapping_ts" id="wrapping_ts" value="0.00" /></td>
                <td><input type="text" name="wrapping_lmps" id="wrapping_lmps" value="{{$wrapdata[0].cw_lineal_meters_per_sqm}}" /></td>
                <td><input type="text" name="wrapping_tlm" id="wrapping_tlm" value="0.00" /></td>
                <td><input type="text" name="wrapping_lmrg" id="wrapping_lmrg" value="{{$wrapdata[0].cw_lineal_meter_rates_in_gst}}" /></td>
                <td><input type="text" name="wrapping_total" id="wrapping_total" value="0.00" class="wrapping_total" /></td>
              </tr>
              <tr>
                <th width="10%">Board Size</th>
                <th width="15%">Type of Screw</th>
                <th width="15%"></th>
                <th width="15%"></th>
                <th width="10%">Total SQM</th>
                <th width="15%">Number of screws per SQM - inc gst please change number  comenserate with screw type</th>
                <th width="10%">Cost per unit - inc gst</th>
                <th>Units Per Job</th>
                <th></th>
                <th></th>
                <th></th>
              </tr>
               <tr>
                <td>84mm-90mm</td>
                <td>10g 50mm square drive, countersunk head, stainless steel metal screw</td>
                <td></td>
                <td></td>
                <td><input type="text" name="wrapping_tq" id="wrapping_tq" value="0.00" /></td>
                <td><input type="text" name="wrapping_nspq" id="wrapping_nspq" value="{{$wrapdata[0].cw_number_of_screws_per_sqm}}" /></td>
                <td><input type="text" name="wrapping_cpu" id="wrapping_cpu" value="{{$wrapdata[0].cw_cost_per_unit_inc_gst}}" /></td>
                <td><input type="text" name="wrapping_upj" id="wrapping_upj" value="0.00" /></td>
                <td></td>
                <td></td>
                <td><input type="text" name="wrapping_total1" id="wrapping_total1" value="0.00" class="wrapping_total" /></td>
              </tr>
              
                <tr>
                <th width="10%"></th>
                <th width="15%">Cost Per SQM</th>
                <th width="15%"></th>
                <th width="15%"></th>
                <th width="10%">Total SQM</th>
                <th width="15%"></th>
                <th width="10%"></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
              </tr>
              
              <tr>
                <td>Pine Frame</td>
                <td><input type="text" name="wrapping_tq" id="wrapping_cpsqm" value="{{$wrapdata[0].cw_cost_per_sqm}}" /></td>
                <td></td>
                <td></td>
                <td><input type="text" name="wrapping_totsqm" id="wrapping_totsqm" value="0.00" /></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td><input type="text" name="wrapping_totalpf" id="wrapping_totapf" value="0.00" class="wrapping_totalpf" /></td>
              </tr>
              
              
              <tr>
                <th width="10%"></th>
                <th width="15%">Cost Per Litre</th>
                <th width="15%">Litre per SQM</th>
                <th width="15%"></th>
                <th width="10%">Total SQM</th>
                <th width="15%">Project Liters</th>
                <th width="10%"></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
              </tr>
               <tr>
                <td></td>
                <td><input type="text" name="wrapping_cpl" id="wrapping_cpl" value="{{$wrapdata[0].cw_cost_per_litre}}" /></td>
                <td><input type="text" name="wrapping_lps" id="wrapping_lps" value="{{$wrapdata[0].cw_litre_per_sqm}}" /></td>
                <td></td>
                <td><input type="text" name="wrapping_tsq1" id="wrapping_tsq1" value="0.00" /></td>
                <td><input type="text" name="wrapping_plr" id="wrapping_plr" value="0.00" /></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td><input type="text" name="wrapping_total2" id="wrapping_total2" value="0.00" class="wrapping_total" /></td>
              </tr>
              <tr>
                <th width="10%"></th>
                <th width="15%">Type</th>
                <th width="15%">Units Per SQM</th>
                <th width="15%"></th>
                <th width="10%">Total SQM</th>
                <th width="15%">Total Units</th>
                <th width="10%">Cost Per Unit - inc gst </th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
              </tr>
               <tr>
                <td></td>
                <td>Smart Bit</td>
                <td><input type="text" name="wrapping_ups" id="wrapping_ups" value="{{$wrapdata[0].cw_units_per_sqm}}" /></td>
                <td></td>
                <td><input type="text" name="wrapping_tsq2" id="wrapping_tsq2" value="0.00" /></td>
                <td><input type="text" name="wrapping_tu2" id="wrapping_tu2" value="0.00" /></td>
                <td><input type="text" name="wrapping_cpu2" id="wrapping_cpu2" value="{{$wrapdata[0].cw_cost_per_unit_smart_bit}}" /></td>
                <td></td>
                <td></td>
                <td></td>
                <td><input type="text" name="wrapping_total3" id="wrapping_total3" value="0.00" class="wrapping_total" /></td>
              </tr>
              
              
           <tr>
              <td colspan="10"><input type="button" value="Calculate" id="wrapping_wrmtotalcost" />
              <h3 style="float:right;">Total:&nbsp;</h3></td>
              <td><input type="text" name="wrapping_alltotal" id="wrapping_alltotal" value="0.00" class="subtotal" /></td>  
 		   </tr> 
           
             
		</table>
      </div>
 <div id="tabs12">
 <h3>Wrapping Labour</h3><br />
 <table cellpadding="0" cellspacing="0"  width="99%">
  <tr>
    <th width="10%">Board</th>
	<th width="5%"></th>
    <th width="5%"></th>
    <th width="10%">JOB SQM</th>
    <th width="10%">Team or Individual Task</th>
    <th width="15%">Team leader output</th>
    <th width="10%">Team member output per hour</th>
    <th>Team Output</th>
    <th>Total Hour Allocation</th>
    <th>Team hour rate allowance</th>
    <th> Budget Cost Excluding GST </th>
  </tr>
   <tr>
  	<td>84MM</td>
    <td></td>
    <td></td>
    <td><input type="text" name="wrapping_labour_js" id="wrapping_labour_js" value="0.00" /></td>
    <td>Team </td>
    <td><input type="text" name="wrapping_labour_tlo" id="wrapping_labour_tlo" value="{{$wrapdata[0].cw_team_leader_output}}" /></td>
    <td><input type="text" name="wrapping_labour_tmoph" id="wrapping_labour_tmoph" value="{{$wrapdata[0].cw_team_member_output}}" /></td>
    <td><input type="text" name="wrapping_labour_to" id="wrapping_labour_to" value="0.00" /></td>
    <td><input type="text" name="wrapping_labour_tha" id="wrapping_labour_tha" value="0.00" /></td>
    <td><input type="text" name="wrapping_labour_thra" id="wrapping_labour_thra" value="{{$wrapdata[0].cw_team_hour_rate_allowance}}" /></td>
    <td><input type="text" name="wrapping_labour_bceg" id="wrapping_labour_bceg" value="00.00" /></td>
  </tr>
  <tr>
     <td colspan="10"><input type="button" value="Calculate" id="wrapping_labourcost" /><h3 style="float:right;">Total:&nbsp;</h3></td>
     <td><input type="text" name="wrapping_labourtotal" id="wrapping_labourtotal" value="0.00" /></td>  
  </tr>   
</table>

 </div>
     	 
 <div id="tabs16">
<h3>Render and Painted Blue Board for Wrapping - Raw Materials</h3><br />
<table cellpadding="0" cellspacing="0"  width="99%">
  <tr>
    <th width="20%">Subframe</th>
	<th width="5%"></th>
    <th width="10%">Cost per lineal meter</th>
    <th width="10%">Project SQM</th>
    <th width="10%">lineal meters per SQM</th>
    <th width="15%"> Total lineal meters required </th>
    <th width="10%"></th>

    <th> Total </th>
  </tr>
   <tr>
  	<td>90mm x 45mm H4 LOSP Treat Pine (posts)</td>
    <td></td>
    <td><input type="text" name="render_subframe_cplm" id="render_subframe_cplm" value="4.00" /></td>
    <td><input type="text" name="render_subframe_ps" id="render_subframe_ps" value="5.00" /></td>
    <td><input type="text" name="render_subframe_lmps" id="render_subframe_lmps" value="2.00" /></td>
    <td><input type="text" name="render_subframe_tlmr" id="render_subframe_tlmr" value="0.00" /></td>
    <td></td>

    <td><input type="text" name="render_subframe_total1" id="render_subframe_total1" value="0.00" class="render_paint_total" /></td>
  </tr>
  <tr>
    <th width="30%">Blue board sheeting</th>
	<th width="5%"></th>
    <th width="5%">Cost Per SQM</th>
    <th width="10%">Project SQM</th>
    <th width="10%"></th>
    <th width="15%"></th>
    <th width="10%"></th>

    <th> Total </th>
  </tr>
   <tr>
  	<td>Hardie Tex 7.5mm thick</td>
    <td></td>
    <td><input type="text" name="render_blue_cps" id="render_blue_cps" value="29.00" /></td>
    <td><input type="text" name="render_blue_ps" id="render_blue_ps" value="0.00" /></td>
    <td></td>
    <td></td>
    <td></td>
    <td><input type="text" name="render_blue_total1" id="render_blue_total1" value="0.00"  class="render_paint_total"/></td>
  </tr>
  <tr>
    <th width="30%">Paint</th>
	<th width="5%"></th>
    <th width="5%">Cost Per SQM</th>
    <th width="10%">Project SQM</th>
    <th width="10%"></th>
    <th width="15%"></th>
    <th width="10%"></th>

    <th> Total </th>
  </tr>
   <tr>
  	<td>Sub contractor</td>
    <td></td>
    <td><input type="text" name="render_paint_cps" id="render_paint_cps" value="25.00" /></td>
    <td><input type="text" name="render_paint_ps" id="render_paint_ps" value="0.00" /></td>
    <td></td>
    <td></td>
    <td></td>
    <td><input type="text" name="render_paint_total1" id="render_paint_total1" value="0.00"  class="render_paint_total"/></td>
  </tr>
  <tr>
    <th width="30%">Acrylic Render</th>
	<th width="5%"></th>
    <th width="5%">Cost Per SQM</th>
    <th width="10%">Project SQM</th>
    <th width="10%"></th>
    <th width="15%"></th>
    <th width="10%"></th>
    <th> Total </th>
  </tr>
   <tr>
  	<td>Sub contractor</td>
    <td></td>
    <td><input type="text" name="render_acrylic_cps" id="render_acrylic_cps" value="75.00" /></td>
    <td><input type="text" name="render_acrylic_ps" id="render_acrylic_ps" value="0.00" /></td>
    <td></td>
    <td></td>
    <td></td>
    <td><input type="text" name="render_acrylic_total1" id="render_acrylic_total1" value="0.00"  class="render_paint_total"/></td>
  </tr>
  <tr>
    <th width="30%">Blue board screws</th>
	<th width="5%"></th>
    <th width="5%">Cost Per SQM</th>
    <th width="10%">Project SQM</th>
    <th width="10%"></th>
    <th width="15%"></th>
    <th width="10%"></th>
    <th> Total </th>
  </tr>
   <tr>
  	<td>Screw Allowance</td>
    <td></td>
    <td><input type="text" name="render_screws_cps" id="render_screws_cps" value="2.00" /></td>
    <td><input type="text" name="render_screws_ps" id="render_screws_ps" value="0.00" /></td>
    <td></td>
    <td></td>
    <td></td>	
    <td><input type="text" name="render_screws_total1" id="render_screws_total1" value="0.00" class="render_paint_total"/></td>
  </tr>
   <tr>
     <td colspan="7"><h3 style="float:right;">Total:&nbsp;</h3></td>
     <td><input type="text" name="render_randerandpainted_labourtotal" id="render_randerandpainted_labourtotal" value="0.00"  /></td>  
  </tr>  
<tr></tr>  
</table><br/>
<h3>Render and Painted Blue Board for Wrapping - Labour</h3><br />
<table cellpadding="0" cellspacing="0"  width="99%">
  <tr>
    <th width="20%">Build</th>
	<th width="10%">Team Leader Output per Hour</th>
    <th width="10%">Team Member Output per Hour</th>
    <th width="10%">Project SQM</th>
    <th width="10%">Team Output</th>
    <th width="10%">Total Hours</th>
    <th width="10%">Hourly Allowance</th>
    <th> Total </th>
  </tr>
   <tr>
  	<td>Posts, Beams, Rafters Battens, Tie downs, Concrete</td>
    <td><input type="text" name="render_randerandpainted_tloph" id="render_randerandpainted_tloph" value="0.80" /></td>
    <td><input type="text" name="render_randerandpainted_tmoph" id="render_randerandpainted_tmoph" value="0.60" /></td>
    <td><input type="text" name="render_randerandpainted_ps" id="render_randerandpainted_ps" value="5.00" /></td>
    <td><input type="text" name="render_randerandpainted_to" id="render_randerandpainted_to" value="1.30" /></td>
    <td><input type="text" name="render_randerandpainted_th" id="render_randerandpainted_th" value="0.00" /></td>
    <td><input type="text" name="render_randerandpainted_ha" id="render_randerandpainted_ha" value="70.00" /></td>


    <td><input type="text" name="render_randerandpainted_total" id="render_randerandpainted_total" value="0.00" /></td>
  </tr>
  <tr><td colspan="7"><h3 style="float:right;">Total:&nbsp;</h3><input type="button" value="Calculate" id="render_subframe_labourcost" /></td>
  	  <td><input type="text" name="render_randerandpainted_total1" id="render_randerandpainted_total1" value="0.00" /></td></tr>  
  </table>
	</div>
    	<br />             
        <table cellpadding="0" cellspacing="0"  width="99%">
         <tr>
     		<td colspan="7"><h2 style="float:right;">
            &nbsp;<input type="button" value="{{$button_text}}" id="add_labourcost_cal" onclick="javascript:wrapinsertintojs($('#render_randerandpainted_alltotal').val());" />&nbsp;&nbsp;
            1Total:&nbsp;</h2></td>
     		<td width="100"><input type="text" name="render_randerandpainted_alltotal" id="render_randerandpainted_alltotal" value="0.00"  />
            </td>  
  		 </tr> 
        </table>
	</div>
   <script type="text/javascript">
    $(document).ready( function() {
      $('#tab-wrapping').easytabs();
    });
  </script> </div>
	<div></div>
</div>
<div id="sub_frame" class="popupdiv">
		<h1>Sub Frames</h1>
        <input type="submit" name="subframe_value_set" id="subframe_value_set" value="Load Value" /> 
<div id="tab-container" class="tab-container">
  <ul class='etabs'>
    <li class='tab'><a href="#tab1">Raw Materials-<br />Treated Pine</a></li>
    <li class='tab'><a href="#tab2">Labour-Treated <br />Pine</a></li>
    <li class='tab'><a href="#tab3">Raw Materials-<br />Design Pine</a></li>
    <li class='tab'><a href="#tab4">Labour-Design <br />Pine</a></li>
    <li class='tab'><a href="#tab5">Concrete Patio/Porch<br />-Raw Materials</a></li>
    <li class='tab'><a href="#tab6">Concrete Patio/<br />Porch-Labour</a></li>
    <li class='tab'><a href="#tab7">Hardwood Timber-<br />Raw Materials</a></li> 
    <li class='tab'><a href="#tab8">Labour-Design <br />Pine</a></li>   
  </ul>
  <div id="tab1">
    <h1>Sub Frame - Raw Materials-Treated Pine</h1><br />
        <table cellpadding="0" cellspacing="0"  width="99%">
          <tr>
            <th width="20%">Type</th>
            <th width="10%">Cost Per SQM - - inc GST</th>
            <th width="10%">Height Category</th>
            <th width="10%">Project Total SQM </th>
            <th width="10%"></th>
            <th width="10%">Total</th>
          </tr>
           <tr>
            <td>Treated Pine</td>
            <td><input type="text" name="subframe_treated_pine_cps" id="subframe_treated_pine_cps" value="{{$sfdata[0].csf_tp_cost_per_sqm}}" /></td>
            <td><input type="text" name="subframe_treated_pine_hc" id="subframe_treated_pine_hc" value="{{$sfdata[0].csf_height_category}}" /></td>
            <td><input type="text" name="subframe_treated_pine_pts" id="subframe_treated_pine_pts1" value="0.00" /></td>
            <td></td>
            <td><input type="text" name="subframe_treated_pine_total1" id="subframe_treated_pine_total1" value="0.00" class="subframe_treated_pine_total"/></td>
          </tr>
   		 <tr>
            <th >Kilos Per Bag</th>
            <th >Bags Per SQM</th>
            <th >Cost Per Bag - - inc GST</th>
            <th >Project Total SQM </th>
            <th >Total Bags Project</th>
            <th >Total</th>
         </tr>
         <tr>
            <td>20</td>
            <td><input type="text" name="subframe_treated_pine_bps" id="subframe_treated_pine_bps" value="{{$sfdata[0].csf_bags_per_sqm1}}" /></td>
            <td><input type="text" name="subframe_treated_pine_cpb" id="subframe_treated_pine_cpb" value="{{$sfdata[0].csf_cost_per_bag}}" /></td>
            <td><input type="text" name="subframe_treated_pine_pts" id="subframe_treated_pine_pts2" value="0.00" /></td>
            <td><input type="text" name="subframe_treated_pine_tbp" id="subframe_treated_pine_tbp" value="0.00" /></td>
            <td><input type="text" name="subframe_treated_pine_total2" id="subframe_treated_pine_total2" value="0.00" class="subframe_treated_pine_total"/></td>
         </tr>
 		 <tr>
            <th>Type</th>
            <th>Cost per unit - inc gst</th>
            <th>Units per SQM</th>
            <th>Project Total SQM </th>
            <th>Total Project Units</th>
            <th>Total</th>
         </tr>
         <tr>
            <td>Full Stirup Post Anchor</td>
            <td><input type="text" name="subframe_treated_pine_cpuinc" id="subframe_treated_pine_cpuinc" value="{{$sfdata[0].csf_cost_per_unit}}" /></td>
            <td><input type="text" name="subframe_treated_pine_ups" id="subframe_treated_pine_ups" value="{{$sfdata[0].csf_units_per_sqm}}" /></td>
            <td><input type="text" name="subframe_treated_pine_pts3" id="subframe_treated_pine_pts3" value="0.00" /></td>
            <td><input type="text" name="subframe_treated_pine_tpu" id="subframe_treated_pine_tpu" value="0.00" /></td>
            <td><input type="text" name="subframe_treated_pine_total3" id="subframe_treated_pine_total3" value="0.00" class="subframe_treated_pine_total"/></td>
         </tr>
         
          <tr>
            <th >Screw and Nails</th>
            <th >Cost Per SQM - - inc GST</th>
            <th ></th>
            <th >Project Total SQM </th>
            <th ></th>
            <th >Total</th>
         </tr>
         <tr>
            <td>Screw allowance</td>
            <td><input type="text" name="subframe_treated_pine_cps1" id="subframe_treated_pine_cps1" value="{{$sfdata[0].csf_bags_per_sqm2}}" /></td>
            <td></td>
            <td><input type="text" name="subframe_treated_pine_pts4" id="subframe_treated_pine_pts4" value="0.00" /></td>
            <td></td>
            <td><input type="text" name="subframe_treated_pine_total4" id="subframe_treated_pine_total4" value="0.00" class="subframe_treated_pine_total"/></td>
         </tr>
          <tr>
            <th >Type</th>
            <th >Cost per unit - inc gst</th>
            <th ></th>
            <th >Project Total SQM </th>
            <th ></th>
            <th >Total</th>
         </tr>
         <tr>
            <td>Tie down allowance</td>
            <td><input type="text" name="subframe_treated_pine_cpu1" id="subframe_treated_pine_cpu1" value="{{$sfdata[0].csf_tda_cost_per_sqm}}" /></td>
            <td></td>
            <td><input type="text" name="subframe_treated_pine_pts5" id="subframe_treated_pine_pts5" value="0.00" /></td>
            <td></td>
            <td><input type="text" name="subframe_treated_pine_total5" id="subframe_treated_pine_total5" value="0.00" class="subframe_treated_pine_total" /></td>
         </tr>
         
          <tr>
            <th >Types</th>
            <th >Litres Per SQM</th>
            <th ></th>
            <th ></th>
            <th ></th>
            <th >Total</th>
         </tr>
         <tr>
            <td>Painted with Woodland Gray </td>
            <td></td>
            <td></td>
            <td><input type="text" name="subframe_treated_pine_pts6" id="subframe_treated_pine_pts6" value="0.00" /></td>
            <td></td>
            <td><input type="text" name="subframe_treated_pine_woodgray" id="subframe_treated_pine_woodgray" value="0.00" /></td>
         </tr>
   <tr><td colspan="5">
   		<h3 style="float:right;">Total Raw Materials:&nbsp;</h3>
   			<input type="button" value="Calculate" id="subframe_treated_pine_cost" />&nbsp;
     		<input type="button" value="Calculate & Use" id="subframe_total_assign_to_sheet1" /></td>
        <td><input type="text" name="subframe_treated_pine_subtotal1" id="subframe_treated_pine_subtotal1" value="0.00" class="sub_frame_ldp"/></td>
    </tr>  
  </table>	
  <br />             
       
  </div>
  <div id="tab2">
   <h1>Sub Frame - Labour - Treated Pine</h1><br />
         <table cellpadding="0" cellspacing="0"  width="99%">
          <tr>
            <th width="20%">Action</th>
            <th width="10%"></th>
            <th width="10%">Job SQM</th>
            <th width="10%">Team or Individual Task</th>
            <th width="10%">Team leader SQM output per hour</th>
            <th width="10%">Team member SQM output per hour</th>
            <th width="10%">Team output per hour</th>
            <th width="10%">Total Hour Allocation</th>
            <th width="10%">Team hour rate allowance</th>
            <th width="10%">Budget Cost Excluding GST</th>
          </tr>
           <tr>
            <td>Labour Costs</td>
            <td></td>
            <td><input type="text" name="subframelabour_treated_js" id="subframelabour_treated_js" value="0.00" /></td>
            <td>Team</td>
            <td><input type="text" name="subframelabour_treated_tlsoph" id="subframelabour_treated_tlsoph" value="{{$sfdata[0].csf_tl_output_per_hr}}" /></td>
            <td><input type="text" name="subframelabour_treated_tmsoph" id="subframelabour_treated_tmsoph" value="{{$sfdata[0].csf_tm_output_per_hr}}" /></td>
            <td><input type="text" name="subframelabour_treated_toph" id="subframelabour_treated_toph" value="0.00" /></td>
            <td><input type="text" name="subframelabour_treated_tha" id="subframelabour_treated_tha" value="0.00" /></td>
            <td><input type="text" name="subframelabour_treated_thra" id="subframelabour_treated_thra" value="{{$sfdata[0].csf_team_hr_rate_allowance}}" /></td>
            <td><input type="text" name="subframelabour_treated_bceg" id="subframelabour_treated_bceg" value="0.00" /></td>
          </tr>
         
           <tr><td colspan="9">
   			<h3 style="float:right;">Total Labour Cost:&nbsp;</h3>
   			<input type="button" value="Calculate" id="subframelabour_treated_clac" />&nbsp;
     		<input type="button" value="Calculate & Use" id="subframe_total_assign_to_sheet2"/></td>
        	<td>
            <input type="text" name="subframe_treated_pine_subtotal1" id="subframelabour_treated_subtotal1" value="0.00" class="sub_frame_ldp" />
            <!--<input type="text" name="subframelabour_treated_subtotal2" id="subframelabour_treated_subtotal2" value="0.00" />-->
            </td>
    		</tr>  
        </table>
        
  </div>
  <div id="tab3">
   <h1>Sub Frame - Raw Materials- Design Pine</h1><br />
         <table cellpadding="0" cellspacing="0"  width="99%">
         <tr>
            <th width="20%">Type</th>
            <th width="10%"></th>
            <th width="10%">Cost Per SQM - inc GST</th>
            <th width="10%">Height Catergory</th>
            <th width="10%">Project Total SQM</th>
            <th width="10%"></th>
            <th width="10%">Total</th>
          </tr>
           <tr>
            <td>Treated Pine</td>
            <td></td>
            <td><input type="text" name="subframeraw_design_cps" id="subframeraw_design_cps" value="{{$sfdata[0].csf_tp_cost_per_sqm_dc}}" /></td>
            <td><input type="text" name="subframeraw_design_hc" id="subframeraw_design_hc" value="{{$sfdata[0].csf_height_category_dc}}" /></td>
            <td><input type="text" name="subframeraw_design_pts" id="subframeraw_design_pts" value="0.00" /></td>
            <td></td>
            <td><input type="text" name="subframeraw_design_total1" id="subframeraw_design_total1" value="0.00" class="subframeraw_design_total"/></td>
          </tr>
          <tr>
            <th width="20%">Kilos Per Bag</th>
            <th width="10%"></th>
            <th width="10%">Bags Per SQM</th>
            <th width="10%">Cost Per Bag - inc GST</th>
            <th width="10%">Project Total SQM</th>
            <th width="10%">Total Bags Project</th>
            <th width="10%">Total</th>
          </tr>
          <tr>
            <td>20</td>
            <td></td>
            <td><input type="text" name="subframeraw_design_bps" id="subframeraw_design_bps" value="{{$sfdata[0].csf_bags_per_sqm_dc1}}" /></td>
            <td><input type="text" name="subframeraw_design_cpb" id="subframeraw_design_cpb" value="{{$sfdata[0].csf_cost_per_bag_dc}}" /></td>
            <td><input type="text" name="subframeraw_design_pts2" id="subframeraw_design_pts2" value="0.00" /></td>
            <td><input type="text" name="subframeraw_design_tbp" id="subframeraw_design_tbp" value="0.00" /></td>
            <td><input type="text" name="subframeraw_design_total2" id="subframeraw_design_total2" value="0.00" class="subframeraw_design_total" /></td>
          </tr>
           <tr>
            <th width="20%">Type</th>
            <th width="10%"></th>
            <th width="10%">Cost per unit - inc gst</th>
            <th width="10%">Units per SQM</th>
            <th width="10%">Project Total SQM</th>
            <th width="10%">Total Project Units</th>
            <th width="10%">Total</th>
          </tr>
          <tr>
            <td>Full Stirup Post Anchor</td>
            <td></td>
            <td><input type="text" name="subframeraw_design_cpu"  	id="subframeraw_design_cpu" 	value="{{$sfdata[0].csf_cost_per_unit_dc}}" /></td>
            <td><input type="text" name="subframeraw_design_ups"  	id="subframeraw_design_ups" 	value="{{$sfdata[0].csf_units_per_sqm_dc}}" /></td>
            <td><input type="text" name="subframeraw_design_pts3" 	id="subframeraw_design_pts3" 	value="0.00" /></td>
            <td><input type="text" name="subframeraw_design_tpu"  	id="subframeraw_design_tpu" 	value="0.00" /></td>
            <td><input type="text" name="subframeraw_design_total3" id="subframeraw_design_total3" 	value="0.00" class="subframeraw_design_total"/></td>
          </tr>
          <tr>
            <th>Screw and Nails</th>
            <th></th>
            <th>Cost Per SQM - - inc GST</th>
            <th></th>
            <th>Project Total SQM</th>
            <th></th>
            <th>Total</th>
          </tr>
          <tr>
            <td>Screw allowance</td>
            <td></td>
            <td><input type="text" name="subframeraw_design_cpsig" id="subframeraw_design_cpsig" value="{{$sfdata[0].csf_bags_per_sqm_dc2}}" /></td>
            <td></td>
            <td><input type="text" name="subframeraw_design_pts4" id="subframeraw_design_pts4" value="0.00" /></td>
            <td></td>
            <td><input type="text" name="subframeraw_design_total4" id="subframeraw_design_total4" value="0.00" class="subframeraw_design_total"/></td>
          </tr>
          <tr>
            <th width="20%">Type</th>
            <th width="10%"></th>
            <th width="10%">Cost Per SQM - inc gst</th>
            <th width="10%"></th>
            <th width="10%">Project Total SQM</th>
            <th width="10%"></th>
            <th width="10%">Total</th>
          </tr>
          <tr>
            <td>Tie down allowance</td>
            <td></td>
            <td><input type="text"  name="subframeraw_design_cpstg" id="subframeraw_design_cpstg" value="{{$sfdata[0].csf_tda_cost_per_sqm_dc}}" /></td>
           <td></td>
            <td><input type="text"  name="subframeraw_design_pts5" id="subframeraw_design_pts5" value="0.00" /></td>
            <td></td>
            <td><input type="text"  name="subframeraw_design_total5" id="subframeraw_design_total5" value="0.00" class="subframeraw_design_total" /></td>
          </tr>
           <tr>
            <th width="20%">Types</th>
            <th width="10%"></th>
            <th width="10%">Litres Per SQM</th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%"></th>
          </tr>
          <tr>
            <td>Painted with Woodland Gray</td>
            <td></td>
            <td></td>
           <td></td>
            <td><input type="text"  name="subframeraw_design_pts6" id="subframeraw_design_pts6" value="0.00" /></td>
            <td></td>
            <td></td>
          </tr>
          <tr><td colspan="6">
   			<h3 style="float:right;">Total Raw Materials:&nbsp;</h3>
   			<input type="button" value="Calculate" id="subframelabour_design_clac" />&nbsp;
     		<input type="button" value="Calculate & Use" id="subframe_total_assign_to_sheet3" /></td>
        	<td>
            <input type="text" name="subframeraw_design_subtotal" id="subframeraw_design_subtotal" value="0.00" class="sub_frame_ldp"/>
            </td>
    		</tr>  
        </table>
       
  </div>
  <div id="tab4">
  <h1>Sub Frame -Labour - Design Pine</h1><br />
         <table cellpadding="0" cellspacing="0"  width="99%">
         <tr>
            <th width="20%">Action </th>
            <th width="10%"></th>
            <th width="10%">Job SQM</th>
            <th width="10%">Team or Individual Task</th>
            <th width="10%">Team leader SQM output per hour</th>
            <th width="10%">Team member SQM output per hour</th>
            <th width="10%">Team output per hour</th>
            <th width="10%">Total Hour Allocation</th>
            <th width="10%">Team hour rate allowance</th>
            <th width="10%"> Budget Cost Excluding GST</th>
          </tr>
          <tr>
            <td>Subframe less posts</td>
            <td></td>
            <td><input type="text" name="subframelabour_design_js" id="subframelabour_design_js" value="0.00" /></td>
            <td>Team</td>
            <td><input type="text" name="subframelabour_design_tlsqph" id="subframelabour_design_tlsqph" value="{{$sfdata[0].csf_tl_output_per_hr_dc_lp}}" /></td>
            <td><input type="text" name="subframelabour_design_tmsqph" id="subframelabour_design_tmsqph" value="{{$sfdata[0].csf_tm_output_per_hr_dc_lp}}" /></td>
            <td><input type="text" name="subframelabour_design_toph" id="subframelabour_design_toph" value="0.00" /></td>
            <td><input type="text" name="subframelabour_design_tha" id="subframelabour_design_tha" value="0.00" /></td>
            <td><input type="text" name="subframelabour_design_thra" id="subframelabour_design_thra" value="{{$sfdata[0].csf_team_hr_rate_allowance_dc_lp}}" /></td>
            <td><input type="text" name="subframelabour_design_bceg" id="subframelabour_design_bceg" value="0.00" /></td>
          </tr>
           <tr>
            <td>Posts treated pine and or design pine</td>
            <td>Post component</td>
            <td><input type="text" name="subframelabour_design_js1" id="subframelabour_design_js1" value="0.00" /></td>
            <td>Team</td>
            <td><input type="text" name="subframelabour_design_tlsqph1" id="subframelabour_design_tlsqph1" value="{{$sfdata[0].csf_tl_output_per_hr_dc_ptp}}" /></td>
            <td><input type="text" name="subframelabour_design_tmsqph1" id="subframelabour_design_tmsqph1" value="{{$sfdata[0].csf_tm_output_per_hr_dc_ptp}}" /></td>
            <td><input type="text" name="subframelabour_design_toph1" id="subframelabour_design_toph1" value="0.00" /></td>
            <td><input type="text" name="subframelabour_design_tha1" id="subframelabour_design_tha1" value="0.00" /></td>
            <td><input type="text" name="subframelabour_design_thra1" id="subframelabour_design_thra1" value="{{$sfdata[0].csf_team_hr_rate_allowance_dc_ptp}}" /></td>
            <td><input type="text" name="subframelabour_design_bceg1" id="subframelabour_design_bceg1" value="0.00" /></td>
          </tr> 
          <tr><td colspan="9">
   			<h3 style="float:right;">Total Labour Cost:&nbsp;</h3>
   			<input type="button" value="Calculate" id="subframelabour_designpine_clac" />&nbsp;
     		<input type="button" value="Calculate & Use" id="subframe_total_assign_to_sheet4" /></td>
        	<td><input type="text" name="subframelabour_design_subtotal" id="subframelabour_design_subtotal" value="0.00" class="sub_frame_ldp"/></td>
    		</tr>  
        </table>
    </div>
  <div id="tab5">
     <h1>Concrete Patio/Porch - SubFrame - Raw Materials</h1><br />
        <table cellpadding="0" cellspacing="0"  width="99%">
         <tr>
            <th width="20%">Material </th>
            <th width="10%">Cost per lineal Meter</th>
            <th width="10%">Meters used per SQM</th>
            <th width="10%">Area SQM</th>
            <th width="10%">Total Lineal Meters</th>
            <th width="10%">Total</th>
          </tr>
          <tr>
            <td>90mm x 45mm treated pine</td>
            <td><input type="text" name="subframeconcrete_rawmaterials_cplm1" id="subframeconcrete_rawmaterials_cplm1" value="{{$sfdata[0].csf_cost_per_lineal_meter}}" /></td>
            <td><input type="text" name="subframeconcrete_rawmaterials_mups1" id="subframeconcrete_rawmaterials_mups1" value="{{$sfdata[0].csf_meters_used_per_sqm}}" /></td>
            <td><input type="text" name="subframeconcrete_rawmaterials_as1" id="subframeconcrete_rawmaterials_as1" value="0.00" /></td>
            <td><input type="text" name="subframeconcrete_rawmaterials_tlm1" id="subframeconcrete_rawmaterials_tlm1" value="0.00" /></td>
            <td><input type="text" name="subframeconcrete_rawmaterials_total1" id="subframeconcrete_rawmaterials_total1" value="0.00" class="subframeconcrete_rawmaterials_total"/></td>
          </tr>	 
         <tr>
            <th>Material </th>
            <th>Unit Price</th>
            <th>Units Per SQM</th>
            <th>Area SQM</th>
            <th>Cost per SQM</th>
            <th>Total</th>
          </tr>
          <tr>
            <td>6.5mm x 100mm Hex head Galvanised concrete screw</td>
            <td><input type="text" name="subframeconcrete_rawmaterials_cplm2" id="subframeconcrete_rawmaterials_cplm2" value="{{$sfdata[0].csf_unit_price_con_screw}}" /></td>
            <td><input type="text" name="subframeconcrete_rawmaterials_mups2" id="subframeconcrete_rawmaterials_mups2" value="{{$sfdata[0].csf_units_per_sqm_con_screw}}" /></td>
            <td><input type="text" name="subframeconcrete_rawmaterials_as2" id="subframeconcrete_rawmaterials_as2" value="0.00" /></td>
            <td><input type="text" name="subframeconcrete_rawmaterials_tlm2" id="subframeconcrete_rawmaterials_tlm2" value="0.00" /></td>
            <td><input type="text" name="subframeconcrete_rawmaterials_total2" id="subframeconcrete_rawmaterials_total2" value="0.00" class="subframeconcrete_rawmaterials_total"/></td>
          </tr>	    
           <tr>
            <th>Material </th>
            <th>Unit Price</th>
            <th>Units Per SQM</th>
            <th>Area SQM</th>
            <th>Cost per SQM</th>
            <th>Total</th>
          </tr>
          <tr>
            <td>125mm bugle head batten screw</td>
            <td><input type="text" name="subframeconcrete_rawmaterials_cplm3" id="subframeconcrete_rawmaterials_cplm3" value="{{$sfdata[0].csf_unit_price_batten_screw}}" /></td>
           <td><input type="text" name="subframeconcrete_rawmaterials_mups3" id="subframeconcrete_rawmaterials_mups3" value="{{$sfdata[0].csf_units_per_sqm_batten_screw}}" /></td>
            <td><input type="text" name="subframeconcrete_rawmaterials_as3" id="subframeconcrete_rawmaterials_as3" value="0.00" /></td>
            <td><input type="text" name="subframeconcrete_rawmaterials_tlm3" id="subframeconcrete_rawmaterials_tlm3" value="0.00" /></td>
            <td><input type="text" name="subframeconcrete_rawmaterials_total3" id="subframeconcrete_rawmaterials_total3" value="0.00" class="subframeconcrete_rawmaterials_total"/></td>
          </tr>	         
           <tr>
            <th>Material </th>
            <th>Unit Price</th>
            <th>Units Per SQM</th>
            <th>Area SQM</th>
            <th>Cost per SQM</th>
            <th>Total</th>
          </tr>
          <tr>
            <td>Plastic Window Packer</td>
            <td><input type="text" name="subframeconcrete_rawmaterials_cplm4" id="subframeconcrete_rawmaterials_cplm4" value="{{$sfdata[0].csf_unit_price_window_packer}}" /></td>
          <td><input type="text" name="subframeconcrete_rawmaterials_mups4" id="subframeconcrete_rawmaterials_mups4" value="{{$sfdata[0].csf_units_per_sqm_window_packer}}" /></td>
            <td><input type="text" name="subframeconcrete_rawmaterials_as4" id="subframeconcrete_rawmaterials_as4" value="0.00" /></td>
            <td><input type="text" name="subframeconcrete_rawmaterials_tlm4" id="subframeconcrete_rawmaterials_tlm4" value="0.00" /></td>
            <td><input type="text" name="subframeconcrete_rawmaterials_total4" id="subframeconcrete_rawmaterials_total4" value="0.00" class="subframeconcrete_rawmaterials_total"/>			</td>
          </tr>
          <tr>
            <th>Material </th>
            <th>Price Per Can</th>
            <th>SQM Per Can</th>
            <th>Area SQM</th>
            <th>Cans Required</th>
            <th>Total</th>
          </tr>
          <tr>
            <td>Treated Pine Re Sealer</td>
            <td><input type="text" name="subframeconcrete_rawmaterials_cplm5" id="subframeconcrete_rawmaterials_cplm5" value="{{$sfdata[0].csf_price_per_can}}" /></td>
            <td><input type="text" name="subframeconcrete_rawmaterials_mups5" id="subframeconcrete_rawmaterials_mups5" value="{{$sfdata[0].csf_units_per_can_resealer}}" /></td>
            <td><input type="text" name="subframeconcrete_rawmaterials_as5" id="subframeconcrete_rawmaterials_as5" value="0.00" /></td>
            <td><input type="text" name="subframeconcrete_rawmaterials_tlm5" id="subframeconcrete_rawmaterials_tlm5" value="0.00" /></td>
            <td><input type="text" name="subframeconcrete_rawmaterials_total5" id="subframeconcrete_rawmaterials_total5" value="0.00" class="subframeconcrete_rawmaterials_total" /></td>
          </tr>	        
        <tr><td colspan="5">
   			<h3 style="float:right;">Total Raw Material:&nbsp;</h3>
   			<input type="button" value="Calculate" id="subframeconcrete_rawmaterials_clac" />&nbsp;
     		<input type="button" value="Calculate & Use" id="subframe_total_assign_to_sheet5" /></td>
        	<td><input type="text" name="subframeconcrete_rawmaterials_total" id="subframeconcrete_rawmaterials_total" value="0.00" class="sub_frame_ldp"/>
            	<input type="text" name="subframeconcrete_rawmaterials_per" id="subframeconcrete_rawmaterials_per" value="0.00" />
            </td>
    	</tr>           
        </table>
        
  </div>
  <div id="tab6">
    <h1>Concrete Patio/Porch - SubFrame -Labour</h1><br />
        <table cellpadding="0" cellspacing="0"  width="99%">
         <tr>
            <th width="20%">Team Leader Output Per Hour</th>
            <th width="10%">Team Member Outpur Per Hour</th>
            <th width="10%">Team Output SQM per Hour</th>
            <th width="10%">Area SQM</th>
            <th width="10%">Total Hours Required</th>
            <th width="10%">Cost Per Hour Labour</th>
            <th width="10%">Total</th>
             <!--<th width="10%">Div Total</th>-->
          </tr>
          <tr>
            <td><input type="text" name="subframeporch_rawmaterials_tloph" id="subframeporch_rawmaterials_tloph" value="{{$sfdata[0].csf_tl_output_per_hour_con}}" /></td>
            <td><input type="text" name="subframeporch_rawmaterials_tmoph" id="subframeporch_rawmaterials_tmoph" value="{{$sfdata[0].csf_tm_output_per_hour_con}}" /></td>
            <td><input type="text" name="subframeporch_rawmaterials_tosph" id="subframeporch_rawmaterials_tosph" value="0.00" /></td>
            <td><input type="text" name="subframeporch_rawmaterials_tas" id="subframeporch_rawmaterials_tas" value="0.00" /></td>
            <td><input type="text" name="subframeporch_rawmaterials_thr" id="subframeporch_rawmaterials_thr" value="0.00" /></td>
            <td><input type="text" name="subframeporch_rawmaterials_cphl" id="subframeporch_rawmaterials_cphl" value="{{$sfdata[0].csf_cost_per_hour_con}}" /></td>
            <td><input type="text" name="subframeporch_rawmaterials_total" id="subframeporch_rawmaterials_total" value="0.00" class="sub_frame_ldp"/></td>
           <!-- <td><input type="text" name="subframeporch_rawmaterials_dtotal" id="subframeporch_rawmaterials_dtotal" value="0.00" class="subframeporch_rawmaterials" /></td>-->
          </tr>	 
 		<tr><td colspan="8">
        <input type="button" value="Calculate" id="subframeporch_rawmaterials_clac" />
         			   &nbsp;<input type="button" value="Calculate & Use" id="subframe_total_assign_to_sheet6" />
            </td>           
    	</tr>      
        </table>
           
  </div>
  <div id="tab7">
   <h1>Sub-Frame - Hardwood Timber - Raw Materials</h1><br />
         <table cellpadding="0" cellspacing="0"  width="99%">
         <tr>
            <th width="40%">Joist</th>
            <th width="10%">Lineal Meters per SQM</th>
            <th width="10%">Price Per Lineal Meters</th>
            <th width="10%">Project Total SQM</th>
            <th width="10%">Total Lineal Meters</th>
            <th width="10%">Total</th>  
          </tr>
          <tr>
          	<td>140mm x 45mm Kiln Dried F27 Hardwood</td>
            <td><input type="text" name="subframetimber_rawmaterials_lmps1" id="subframetimber_rawmaterials_lmps1" value="{{$sfdata[0].csf_lineral_meter_per_sqm_joist}}" /></td>
            <td><input type="text" name="subframetimber_rawmaterials_pplm1" id="subframetimber_rawmaterials_pplm1" value="{{$sfdata[0].csf_price_per_lineal_meter_joist}}" /></td>
            <td><input type="text" name="subframetimber_rawmaterials_pts1"  id="subframetimber_rawmaterials_pts1" value="0.00" /></td>
            <td><input type="text" name="subframetimber_rawmaterials_plm1"  id="subframetimber_rawmaterials_plm1" value="0.00" /></td>
            <td><input type="text" name="subframetimber_rawmaterials_total1" id="subframetimber_rawmaterials_total1" value="0.00" class="subframeporch_rawmaterials"/></td>
          </tr>
          <tr>
            <th>Perimeter Beam</th>
            <th>Lineal Meters per SQM</th>
            <th>Price Per Lineal Meters</th>
            <th>Project Total SQM</th>
            <th>Total Lineal Meters</th>
            <th>Total</th>  
          </tr>
          <tr>
          	<td>240mm x 45mm Kiln Dried F27 Hardwood</td>
            <td><input type="text" name="subframetimber_rawmaterials_lmps2" id="subframetimber_rawmaterials_lmps2" value="{{$sfdata[0].csf_lineral_meter_per_sqm_pebeam}}" /></td>
            <td><input type="text" name="subframetimber_rawmaterials_pplm2" id="subframetimber_rawmaterials_pplm2" value="{{$sfdata[0].csf_price_per_lineal_meter_pebeam}}" /></td>
            <td><input type="text" name="subframetimber_rawmaterials_pts2" id="subframetimber_rawmaterials_pts2" value="0.00" /></td>
            <td><input type="text" name="subframetimber_rawmaterials_plm2" id="subframetimber_rawmaterials_plm2" value="0.00" /></td>
            <td><input type="text" name="subframetimber_rawmaterials_total2" id="subframetimber_rawmaterials_total2" value="0.00" class="subframeporch_rawmaterials"/></td>
          </tr>
          <tr>
            <th>Ledger Beam</th>
            <th>Lineal Meters per SQM</th>
            <th>Price Per Lineal Meters</th>
            <th>Project Total SQM</th>
            <th>Total Lineal Meters</th>
            <th>Total</th>
          </tr>
          <tr>
          	<td>140mm x 45mm Kiln Dried F27 Hardwood</td>
           <td><input type="text" name="subframetimber_rawmaterials_lmps3"  id="subframetimber_rawmaterials_lmps3"  value="{{$sfdata[0].csf_lineral_meter_per_sqm_lebeam}}" /></td>
          <td><input type="text" name="subframetimber_rawmaterials_pplm3"  id="subframetimber_rawmaterials_pplm3"  value="{{$sfdata[0].csf_price_per_lineal_meter_lebeam}}" /></td>
            <td><input type="text" name="subframetimber_rawmaterials_pts3"   id="subframetimber_rawmaterials_pts3"   value="0.00" /></td>
            <td><input type="text" name="subframetimber_rawmaterials_plm3"   id="subframetimber_rawmaterials_plm3"   value="0.00" /></td>
            <td><input type="text" name="subframetimber_rawmaterials_total3" id="subframetimber_rawmaterials_total3" value="0.00" class="subframeporch_rawmaterials"/></td>
          </tr>
          <tr>
            <th>Posts treated pine and or design pine</th>
            <th>Lineal Meters per SQM</th>
            <th>Cost Per SQM - - inc GST</th>
            <th>Project Total SQM</th>
            <th>Total Lineal Meters</th>
            <th>Total</th>
          </tr>
          <tr>
          	<td>125mm x 125mm swan f27 Hardwood</td>
            <td><input type="text" name="subframetimber_rawmaterials_lmps4"  id="subframetimber_rawmaterials_lmps4"  value="{{$sfdata[0].csf_lineral_meter_per_sqm_ptpine}}" /></td>
            <td><input type="text" name="subframetimber_rawmaterials_pplm4"  id="subframetimber_rawmaterials_pplm4"  value="{{$sfdata[0].csf_price_per_lineal_meter_ptpine}}" /></td>
            <td><input type="text" name="subframetimber_rawmaterials_pts4"   id="subframetimber_rawmaterials_pts4"   value="0.00" /></td>
            <td><input type="text" name="subframetimber_rawmaterials_plm4"   id="subframetimber_rawmaterials_plm4"   value="0.00" /></td>
            <td><input type="text" name="subframetimber_rawmaterials_total4" id="subframetimber_rawmaterials_total4" value="0.00" class="subframeporch_rawmaterials"/></td>
          </tr>
          <tr>
            <th >Post Stirrups - Custom Made</th>
            <th >Units Per SQM</th>
            <th >Costs Per Stirup </th>
            <th >Project Total SQM</th>
            <th >Total Lineal Meters</th>
            <th >Total</th>
          </tr>
          <tr>
          	<td>Custom Made Post Stirrups</td>
            <td><input type="text" name="subframetimber_rawmaterials_lmps5"  id="subframetimber_rawmaterials_lmps5"  value="{{$sfdata[0].csf_units_per_sqm_pstirrups}}" /></td>
            <td><input type="text" name="subframetimber_rawmaterials_pplm5"  id="subframetimber_rawmaterials_pplm5"  value="{{$sfdata[0].csf_cost_per_stirup}}" /></td>
            <td><input type="text" name="subframetimber_rawmaterials_pts5"   id="subframetimber_rawmaterials_pts5"   value="0.00" /></td>
            <td><input type="text" name="subframetimber_rawmaterials_plm5"   id="subframetimber_rawmaterials_plm5"   value="0.00" /></td>
            <td><input type="text" name="subframetimber_rawmaterials_total5" id="subframetimber_rawmaterials_total5" value="0.00" class="subframeporch_rawmaterials"/></td>
          </tr>
          <tr>
            <th >Tie down allowance</th>
            <th >Units Per SQM</th>
            <th >Cost Per SQM - inc gst</th>
            <th >Project Total SQM</th>
            <th >Total Lineal Meters</th>
            <th >Total</th>
          </tr>
          <tr>
          	<td>Tie down allowance</td>
            <td></td>
            <td><input type="text" name="subframetimber_rawmaterials_pplm6"  id="subframetimber_rawmaterials_pplm6"  value="{{$sfdata[0].csf_cost_per_sqm_tiedown}}" /></td>
            <td><input type="text" name="subframetimber_rawmaterials_pts6"   id="subframetimber_rawmaterials_pts6"   value="0.00" /></td>
            <td></td>
            <td><input type="text" name="subframetimber_rawmaterials_total6" id="subframetimber_rawmaterials_total6" value="0.00" class="subframeporch_rawmaterials"/></td>
          </tr>
          <tr>
            <th>Organ Oil</th>
            <th>Units Per SQM</th>
            <th>Cost Per SQM - inc gst</th>
            <th>Project Total SQM</th>
            <th>Total Lineal Meters</th>
            <th>Total</th>
          </tr>
          <tr>
          	<td>Painted with Woodland Gray</td>
            <td></td>
            <td><input type="text" name="subframetimber_rawmaterials_pplm7"  id="subframetimber_rawmaterials_pplm7"  value="{{$sfdata[0].csf_cost_per_sqm_organoil}}" /></td>
            <td><input type="text" name="subframetimber_rawmaterials_pts7"   id="subframetimber_rawmaterials_pts7"   value="0.00" /></td>
            <td></td>
            <td><input type="text" name="subframetimber_rawmaterials_total7" id="subframetimber_rawmaterials_total7" value="0.00" class="subframeporch_rawmaterials"/></td>
          </tr>
          <tr>
            <th>Mass Concrete for Footings</th>
            <th>Bags per SQM</th>
            <th>Cost Per Bag</th>
            <th>Project Total SQM</th>
            <th>Total Lineal Meters</th>
            <th>Total</th>
          </tr>
          <tr>
          	<td>Massconcrete</td>
            <td><input type="text" name="subframetimber_rawmaterials_lmps8"  id="subframetimber_rawmaterials_lmps8"  value="{{$sfdata[0].csf_bags_per_sqm_mass_concrete}}" /></td>
            <td><input type="text" name="subframetimber_rawmaterials_pplm8"  id="subframetimber_rawmaterials_pplm8"  value="{{$sfdata[0].csf_cost_per_bag_mass_concrete}}" /></td>
            <td><input type="text" name="subframetimber_rawmaterials_pts8"   id="subframetimber_rawmaterials_pts8"   value="0.00" /></td>
            <td><input type="text" name="subframetimber_rawmaterials_plm8"   id="subframetimber_rawmaterials_plm8"   value="0.00" /></td>
            <td><input type="text" name="subframetimber_rawmaterials_total8" id="subframetimber_rawmaterials_total8" value="0.00" class="subframeporch_rawmaterials"/></td>
           </tr>
           <tr>
           	 <td colspan="5">
           	 <h3 style="float:right;">Total Raw Material:&nbsp;</h3>
           	 <input type="button" value="Calculate" id="subframetimber_rawmaterials_calc" />&nbsp;
     		 <input type="button" value="Calculate & Use" id="subframe_total_assign_to_sheet7" /></td> 
             <td><input type="text" name="subframetimber_rawmaterials_alltotal" id="subframetimber_rawmaterials_alltotal" value="0.00" class="sub_frame_ldp" /></td>          
    	   </tr>     
          </table>
         
  </div>
  <div id="tab8">
   <h1>Sub Frame -Labour - Design Pine</h1><br />
         <table cellpadding="0" cellspacing="0"  width="99%">
         <tr>
            <th width="20%">Action </th>
            <th width="10%">Job SQM</th>
            <th width="10%">Team or Individual Task</th>
            <th width="10%">Team leader SQM output per hour</th>
            <th width="10%">Team member SQM output per hour</th>
            <th width="10%">Team output per hour</th>
            <th width="10%">Total Hour Allocation</th>
            <th width="10%">Team hour rate allowance</th>
            <th width="10%">Budget Cost Excluding GST</th>
          </tr>
          <tr>
          	<th>Labour </th>
            <td><input type="text" name="subframedp_rawmaterials_js1" id="subframedp_rawmaterials_js1" value="0.00" /></td>
            <td>Team</td>
            <td><input type="text" name="subframedp_rawmaterials_tloph1" id="subframedp_rawmaterials_tloph1" value="{{$sfdata[0].csf_tl_output_per_hour_sflabour}}" /></td>
            <td><input type="text" name="subframedp_rawmaterials_tmoph1" id="subframedp_rawmaterials_tmoph1" value="{{$sfdata[0].csf_tm_output_per_hour_sflabour}}" /></td>
            <td><input type="text" name="subframedp_rawmaterials_toph1" id="subframedp_rawmaterials_toph1" value="0.00" /></td>
            <td><input type="text" name="subframedp_rawmaterials_tha1" id="subframedp_rawmaterials_tha1" value="0.00" /></td>
            <td><input type="text" name="subframedp_rawmaterials_thra1" id="subframedp_rawmaterials_thra1" value="{{$sfdata[0].csf_team_hour_rate_allow_sflabour}}" /></td>
            <td><input type="text" name="subframedp_rawmaterials_bceg1" id="subframedp_rawmaterials_bceg1" value="0.00" /></td>  
          </tr>
             
          <tr>
          	<th>Post Labour</th>
            <td><input type="text" name="subframedp_rawmaterials_js3" id="subframedp_rawmaterials_js3" value="0.00" /></td>
            <td>Team</td>
            <td><input type="text" name="subframedp_rawmaterials_tloph3" id="subframedp_rawmaterials_tloph3" value="{{$sfdata[0].csf_tl_output_per_hour_post_labour}}" /></td>
            <td><input type="text" name="subframedp_rawmaterials_tmoph3" id="subframedp_rawmaterials_tmoph3" value="{{$sfdata[0].csf_tm_output_per_hour_post_labour}}" /></td>
            <td><input type="text" name="subframedp_rawmaterials_toph3" id="subframedp_rawmaterials_toph3" value="0.0" /></td>
            <td><input type="text" name="subframedp_rawmaterials_tha3" id="subframedp_rawmaterials_tha3" value="0.00" /></td>
            <td><input type="text" name="subframedp_rawmaterials_thra3" id="subframedp_rawmaterials_thra3" value="{{$sfdata[0].csf_team_hour_rate_allow_post_labour}}" /></td>
            <td><input type="text" name="subframedp_rawmaterials_bceg3" id="subframedp_rawmaterials_bceg3" value="0.00" /></td> 

          </tr>
          <tr><td colspan="8"><h3 style="float:right;">Total Labour Cost</h3>
          			<input type="button" value="Calculate" id="subframedp_rawmaterials_calc" />&nbsp;
     		 		<input type="button" value="Calculate & Use" id="subframe_total_assign_to_sheet8"/></td><td><input type="text" name="subframedp_rawmaterials_allbceg" id="subframedp_rawmaterials_allbceg" value="0.00" class="sub_frame_ldp" />
          </td></tr>
         </table>
 
  </div>
   <table cellpadding="0" cellspacing="0"  width="99%">
         <tr>
     		<td colspan="7"><h2 style="float:right;">Total:&nbsp;</h2></td>
     		<td width="100"><input type="text" name="subframe_randerandpainted_alltotal" id="subframe_randerandpainted_alltotal" value="0.00"  /></td>  
  		 </tr> 
        </table>           
</div>    
   <script type="text/javascript">
    $(document).ready( function() {
      $('#tab-container').easytabs();
    });
  </script>     
</div>
<div id="handrail" class="popupdiv">
<h1>Handrail</h1>
<input type="submit" name="handrail_value_set" id="handrail_value_set" value="Load Value" /> 
<div id="tab-Handrail" class="tab-container">
  <ul class='etabs'>
    <li class='tab'><a href="#tab21">Handrail Labour and<br /> Raw Materialse</a></li>
    <li class='tab'><a href="#tab22">Timber Screening Handrail - <br />Raw Materials (1 meter in height)</a></li>
    <li class='tab'><a href="#tab23">Timber Screening Handrail - <br />Labour ( 1 meter in height)</a></li>
  </ul>
  <div id="tab21"><h3>Handrail Labour and Raw Materials</h3>
        <table cellpadding="0" cellspacing="0"  width="99%">
         <tr>
            <th width="20%"> </th>
            <th width="10%">Lineal Meters</th>
            <th width="10%">Lineal Meter Rate</th>
            <th width="10%">Raw Material Per Lineal Meter</th>
            <th width="10%">Labour Allowance per lineal meter</th>
            <th width="5%">Activity</th>
            <th width="10%">Lineal Meter Time Allowance</th>
            <th width="10%">Allocated Hours</th>
            <th width="10%">Team Hourly Rate</th>
            <th width="10%">Labour Allowance</th>
            <th width="10%">Raw Material Allowance</th>
            <th width="10%">Project</th>
          </tr>
          <tr>
          	<th>Horizontal stainless steel wire with Australian hardwood timber post and handrail:</th>
            <td><input type="text" name="handrailanr_lm1" id="handrailanr_lm1" value="{{$hrdata[0].chr_lineal_meters_htph}}" /></td>
            <td><input type="text" name="handrailanr_lmr1" id="handrailanr_lmr1" value="{{$hrdata[0].chr_lineal_meter_rate_htph}}" /></td>
            <td><input type="text" name="handrailanr_rmplm1" id="handrailanr_rmplm1" value="0.00" /></td>
            <td><input type="text" name="handrailanr_laplm1" id="handrailanr_laplm1" value="0.00" /></td>
            <td>Team</td>
            <td><input type="text" name="handrailanr_lmta1" id="handrailanr_lmta1" value="{{$hrdata[0].chr_lineal_meter_time_allowance_htph}}" /></td>
            <td><input type="text" name="handrailanr_ah1" id="handrailanr_ah1" value="0.00" /></td>
            <td><input type="text" name="handrailanr_thr1" id="handrailanr_thr1" value="{{$hrdata[0].chr_team_hourly_rate_htph}}" /></td>
            <td><input type="text" name="handrailanr_la1" id="handrailanr_la1" value="0.00" /></td>  
            <td><input type="text" name="handrailanr_rma1" id="handrailanr_rma1" value="0.00" /></td>  
            <td><input type="text" name="handrailanr_proj1" id="handrailanr_proj1" value="0.00" /></td>    
          </tr>
          <tr>
          	<th>Horizontal stainless steel wire with design pine post and handrail:</th>       
            <td><input type="text" name="handrailanr_lm2" id="handrailanr_lm2" value="{{$hrdata[0].chr_lineal_meters_dpph}}" /></td>
            <td><input type="text" name="handrailanr_lmr2" id="handrailanr_lmr2" value="{{$hrdata[0].chr_lineal_meter_rate_dpph}}" /></td>
            <td><input type="text" name="handrailanr_rmplm2" id="handrailanr_rmplm2" value="0.00" /></td>
            <td><input type="text" name="handrailanr_laplm2" id="handrailanr_laplm2" value="0.00" /></td>
            <td>Team</td>
            <td><input type="text" name="handrailanr_lmta2" id="handrailanr_lmta2" value="{{$hrdata[0].chr_lineal_meter_time_allowance_dpph}}" /></td>
            <td><input type="text" name="handrailanr_ah2" id="handrailanr_ah2" value="0.00" /></td>
            <td><input type="text" name="handrailanr_thr2" id="handrailanr_thr2" value="{{$hrdata[0].chr_team_hourly_rate_dpph}}" /></td>
            <td><input type="text" name="handrailanr_la2" id="handrailanr_la2" value="0.00" /></td>  
            <td><input type="text" name="handrailanr_rma2" id="handrailanr_rma2" value="0.00" /></td>  
            <td><input type="text" name="handrailanr_proj2" id="handrailanr_proj2" value="0.00" /></td>    
          </tr>
          <tr>
          	<th>Horizontal stainless steel wire with stainless steeel post  Australian Hardwood handrail: </th>
            <td><input type="text" name="handrailanr_lm3" id="handrailanr_lm3" value="{{$hrdata[0].chr_lineal_meters_pahh}}" /></td>
            <td><input type="text" name="handrailanr_lmr3" id="handrailanr_lmr3" value="{{$hrdata[0].chr_lineal_meter_rate_pahh}}" /></td>
            <td><input type="text" name="handrailanr_rmplm3" id="handrailanr_rmplm3" value="0.00" /></td>
            <td><input type="text" name="handrailanr_laplm3" id="handrailanr_laplm3" value="0.00" /></td>
            <td>Team</td>
            <td><input type="text" name="handrailanr_lmta3" id="handrailanr_lmta3" value="{{$hrdata[0].chr_lineal_meter_time_allowance_pahh}}" /></td>
            <td><input type="text" name="handrailanr_ah3" id="handrailanr_ah3" value="0.00" /></td>
            <td><input type="text" name="handrailanr_thr3" id="handrailanr_thr3" value="{{$hrdata[0].chr_team_hourly_rate_pahh}}" /></td>
            <td><input type="text" name="handrailanr_la3" id="handrailanr_la3" value="0.00" /></td>  
            <td><input type="text" name="handrailanr_rma3" id="handrailanr_rma3" value="0.00" /></td>  
            <td><input type="text" name="handrailanr_proj3" id="handrailanr_proj3" value="0.00" /></td>
          </tr>
          <tr>
          	<th>Vertical stainless steel spokes with hardwood post, rail and handrail:</th>
            <td><input type="text" name="handrailanr_lm5" id="handrailanr_lm5" value="{{$hrdata[0].chr_lineal_meters_hprh}}" /></td>
            <td><input type="text" name="handrailanr_lmr5" id="handrailanr_lmr5" value="{{$hrdata[0].chr_lineal_meter_rate_hprh}}" /></td>
            <td><input type="text" name="handrailanr_rmplm5" id="handrailanr_rmplm5" value="0.00" /></td>
            <td><input type="text" name="handrailanr_laplm5" id="handrailanr_laplm5" value="0.00" /></td>
            <td>Team</td>
            <td><input type="text" name="handrailanr_lmta5" id="handrailanr_lmta5" value="{{$hrdata[0].chr_lineal_meter_time_allowance_hprh}}" /></td>
            <td><input type="text" name="handrailanr_ah5" id="handrailanr_ah5" value="0.00" /></td>
            <td><input type="text" name="handrailanr_thr5" id="handrailanr_thr5" value="{{$hrdata[0].chr_team_hourly_rate_hprh}}" /></td>
            <td><input type="text" name="handrailanr_la5" id="handrailanr_la5" value="0.00" /></td>  
            <td><input type="text" name="handrailanr_rma5" id="handrailanr_rma5" value="0.00" /></td>  
            <td><input type="text" name="handrailanr_proj5" id="handrailanr_proj5" value="0.00" /></td>   
          </tr>
          
          <tr>
          	<th>Vertical stainless steel spokes with design pine post, rail and handrail:</th>
            <td><input type="text" name="handrailanr_lm6" id="handrailanr_lm6" value="{{$hrdata[0].chr_lineal_meters_pprh}}" /></td>
            <td><input type="text" name="handrailanr_lmr6" id="handrailanr_lmr6" value="{{$hrdata[0].chr_lineal_meter_rate_pprh}}" /></td>
            <td><input type="text" name="handrailanr_rmplm6" id="handrailanr_rmplm6" value="0.00" /></td>
            <td><input type="text" name="handrailanr_laplm6" id="handrailanr_laplm6" value="0.00" /></td>
            <td>Team</td>
            <td><input type="text" name="handrailanr_lmta6" id="handrailanr_lmta6" value="{{$hrdata[0].chr_lineal_meter_time_allowance_pprh}}" /></td>
            <td><input type="text" name="handrailanr_ah6" id="handrailanr_ah6" value="0.00" /></td>
            <td><input type="text" name="handrailanr_thr6" id="handrailanr_thr6" value="{{$hrdata[0].chr_team_hourly_rate_pprh}}" /></td>
            <td><input type="text" name="handrailanr_la6" id="handrailanr_la6" value="0.00" /></td>  
            <td><input type="text" name="handrailanr_rma6" id="handrailanr_rma6" value="0.00" /></td>  
            <td><input type="text" name="handrailanr_proj6" id="handrailanr_proj6" value="0.00" /></td>  
          </tr>
          <tr>
          	<th>Vertical stainless steel spokes with circular stainless steel, rail and handrail:</th>
            <td><input type="text" name="handrailanr_lm7" id="handrailanr_lm7" value="{{$hrdata[0].chr_lineal_meters_ssrh}}" /></td>
            <td><input type="text" name="handrailanr_lmr7" id="handrailanr_lmr7" value="{{$hrdata[0].chr_lineal_meter_rate_ssrh}}" /></td>
            <td><input type="text" name="handrailanr_rmplm7" id="handrailanr_rmplm7" value="0.00" /></td>
            <td><input type="text" name="handrailanr_laplm7" id="handrailanr_laplm7" value="0.00" /></td>
            <td>Team</td>
            <td><input type="text" name="handrailanr_lmta7" id="handrailanr_lmta7" value="{{$hrdata[0].chr_lineal_meter_time_allowance_ssrh}}" /></td>
            <td><input type="text" name="handrailanr_ah7" id="handrailanr_ah7" value="0.00" /></td>
            <td><input type="text" name="handrailanr_thr7" id="handrailanr_thr7" value="{{$hrdata[0].chr_team_hourly_rate_ssrh}}" /></td>
            <td><input type="text" name="handrailanr_la7" id="handrailanr_la7" value="0.00" /></td>  
            <td><input type="text" name="handrailanr_rma7" id="handrailanr_rma7" value="0.00" /></td>  
            <td><input type="text" name="handrailanr_proj7" id="handrailanr_proj7" value="0.00" /></td>   
          </tr>
          <tr>
          	<th>Painted timber (Treated pine) Balustrade:</th>
              <td><input type="text" name="handrailanr_lm8" id="handrailanr_lm8" value="{{$hrdata[0].chr_lineal_meters_tpb}}" /></td>
            <td><input type="text" name="handrailanr_lmr8" id="handrailanr_lmr8" value="{{$hrdata[0].chr_lineal_meter_rate_tpb}}" /></td>
            <td><input type="text" name="handrailanr_rmplm8" id="handrailanr_rmplm8" value="0.00" /></td>
            <td><input type="text" name="handrailanr_laplm8" id="handrailanr_laplm8" value="0.00" /></td>
            <td>Team</td>
            <td><input type="text" name="handrailanr_lmta8" id="handrailanr_lmta8" value="{{$hrdata[0].chr_lineal_meter_time_allowance_tpb}}" /></td>
            <td><input type="text" name="handrailanr_ah8" id="handrailanr_ah8" value="0.00" /></td>
            <td><input type="text" name="handrailanr_thr8" id="handrailanr_thr8" value="{{$hrdata[0].chr_team_hourly_rate_tpb}}" /></td>
            <td><input type="text" name="handrailanr_la8" id="handrailanr_la8" value="0.00" /></td>  
            <td><input type="text" name="handrailanr_rma8" id="handrailanr_rma8" value="0.00" /></td>  
            <td><input type="text" name="handrailanr_proj8" id="handrailanr_proj8" value="0.00" /></td>   
          </tr>
          
          <tr>
          	<th>Painted timber (Design Pine) Balustrade:</th>
            <td><input type="text" name="handrailanr_lm4" id="handrailanr_lm4" value="{{$hrdata[0].chr_lineal_meters_dpb}}" /></td>
            <td><input type="text" name="handrailanr_lmr4" id="handrailanr_lmr4" value="{{$hrdata[0].chr_lineal_meter_rate_dpb}}" /></td>
            <td><input type="text" name="handrailanr_rmplm4" id="handrailanr_rmplm4" value="0.00" /></td>
            <td><input type="text" name="handrailanr_laplm4" id="handrailanr_laplm4" value="0.00" /></td>
            <td>Team</td>
            <td><input type="text" name="handrailanr_lmta4" id="handrailanr_lmta4" value="{{$hrdata[0].chr_lineal_meter_time_allowance_dpb}}" /></td>
            <td><input type="text" name="handrailanr_ah4" id="handrailanr_ah4" value="0.00" /></td>
            <td><input type="text" name="handrailanr_thr4" id="handrailanr_thr4" value="{{$hrdata[0].chr_team_hourly_rate_dpb}}" /></td>
            <td><input type="text" name="handrailanr_la4" id="handrailanr_la4" value="0.00" /></td>  
            <td><input type="text" name="handrailanr_rma4" id="handrailanr_rma4" value="0.00" /></td>  
            <td><input type="text" name="handrailanr_proj4" id="handrailanr_proj4" value="0.00" /></td>   
          </tr>
          <tr>
          	<th>Glass with clamp and timber hardwood post:</th>
            <td><input type="text" name="handrailanr_lm9" id="handrailanr_lm9" value="{{$hrdata[0].chr_lineal_meters_gthp}}" /></td>
            <td><input type="text" name="handrailanr_lmr9" id="handrailanr_lmr9" value="{{$hrdata[0].chr_lineal_meter_rate_gthp}}" /></td>
            <td><input type="text" name="handrailanr_rmplm9" id="handrailanr_rmplm9" value="0.00" /></td>
            <td><input type="text" name="handrailanr_laplm9" id="handrailanr_laplm9" value="0.00" /></td>
            <td>Team</td>
            <td><input type="text" name="handrailanr_lmta9" id="handrailanr_lmta9" value="{{$hrdata[0].chr_lineal_meter_time_allowance_gthp}}" /></td>
            <td><input type="text" name="handrailanr_ah9" id="handrailanr_ah9" value="0.00" /></td>
            <td><input type="text" name="handrailanr_thr9" id="handrailanr_thr9" value="{{$hrdata[0].chr_team_hourly_rate_gthp}}" /></td>
            <td><input type="text" name="handrailanr_la9" id="handrailanr_la9" value="0.00" /></td>  
            <td><input type="text" name="handrailanr_rma9" id="handrailanr_rma9" value="0.00" /></td>  
            <td><input type="text" name="handrailanr_proj9" id="handrailanr_proj9" value="0.00" /></td>    
          </tr>
          <tr>
          	<th>Glass with stainless steel posts:</th>
            <td><input type="text" name="handrailanr_lm10" id="handrailanr_lm10" value="{{$hrdata[0].chr_lineal_meters_gssp}}" /></td>
            <td><input type="text" name="handrailanr_lmr10" id="handrailanr_lmr10" value="{{$hrdata[0].chr_lineal_meter_rate_gssp}}" /></td>
            <td><input type="text" name="handrailanr_rmplm10" id="handrailanr_rmplm10" value="0.00" /></td>
            <td><input type="text" name="handrailanr_laplm10" id="handrailanr_laplm10" value="0.00" /></td>
            <td>Team</td>
            <td><input type="text" name="handrailanr_lmta10" id="handrailanr_lmta10" value="{{$hrdata[0].chr_lineal_meter_time_allowance_gssp}}" /></td>
            <td><input type="text" name="handrailanr_ah10" id="handrailanr_ah10" value="0.00" /></td>
            <td><input type="text" name="handrailanr_thr10" id="handrailanr_thr10" value="{{$hrdata[0].chr_team_hourly_rate_gssp}}" /></td>
            <td><input type="text" name="handrailanr_la10" id="handrailanr_la10" value="0.00" /></td>  
            <td><input type="text" name="handrailanr_rma10" id="handrailanr_rma10" value="0.00" /></td>  
            <td><input type="text" name="handrailanr_proj10" id="handrailanr_proj10" value="0.00" /></td>   
          </tr>
          
          <tr>
          	<th>Glass with stainless steel feet:</th>
            <td><input type="text" name="handrailanr_lm11" id="handrailanr_lm11" value="{{$hrdata[0].chr_lineal_meters_gssf}}" /></td>
            <td><input type="text" name="handrailanr_lmr11" id="handrailanr_lmr11" value="{{$hrdata[0].chr_lineal_meter_rate_gssf}}" /></td>
            <td><input type="text" name="handrailanr_rmplm11" id="handrailanr_rmplm11" value="0.00" /></td>
            <td><input type="text" name="handrailanr_laplm11" id="handrailanr_laplm11" value="0.00" /></td>
            <td>Team</td>
            <td><input type="text" name="handrailanr_lmta11" id="handrailanr_lmta12" value="{{$hrdata[0].chr_lineal_meter_time_allowance_gssf}}" /></td>
            <td><input type="text" name="handrailanr_ah11" id="handrailanr_ah11" value="0.00" /></td>
            <td><input type="text" name="handrailanr_thr11" id="handrailanr_thr11" value="{{$hrdata[0].chr_team_hourly_rate_gssf}}" /></td>
            <td><input type="text" name="handrailanr_la11" id="handrailanr_la11" value="0.00" /></td>  
            <td><input type="text" name="handrailanr_rma11" id="handrailanr_rma11" value="0.00" /></td>  
            <td><input type="text" name="handrailanr_proj11" id="handrailanr_proj11" value="0.00" /></td>   
          </tr>
          <tr>
          	<th>Glass with clamp with timber hardwood post:</th>
            <td><input type="text" name="handrailanr_lm12" id="handrailanr_lm12" value="{{$hrdata[0].chr_lineal_meters_cthp}}" /></td>
            <td><input type="text" name="handrailanr_lmr12" id="handrailanr_lmr12" value="{{$hrdata[0].chr_lineal_meter_rate_cthp}}" /></td>
            <td><input type="text" name="handrailanr_rmplm12" id="handrailanr_rmplm12" value="0.00" /></td>
            <td><input type="text" name="handrailanr_laplm12" id="handrailanr_laplm12" value="0.00" /></td>
            <td>Team</td>
            <td><input type="text" name="handrailanr_lmta13" id="handrailanr_lmta13" value="{{$hrdata[0].chr_lineal_meter_time_allowance_cthp}}" /></td>
            <td><input type="text" name="handrailanr_ah12" id="handrailanr_ah12" value="0.00" /></td>
            <td><input type="text" name="handrailanr_thr12" id="handrailanr_thr12" value="{{$hrdata[0].chr_team_hourly_rate_cthp}}" /></td>
            <td><input type="text" name="handrailanr_la12" id="handrailanr_la12" value="0.00" /></td>  
            <td><input type="text" name="handrailanr_rma12" id="handrailanr_rma12" value="0.00" /></td>  
            <td><input type="text" name="handrailanr_proj12" id="handrailanr_proj12" value="0.00" /></td>   
          </tr>
          <tr>
          	<th></th>
            <td><input type="text" name="handrailanr_lm13" id="handrailanr_lm13" value="0.00" /></td>
            <td><input type="text" name="handrailanr_lmr13" id="handrailanr_lmr13" value="525.00" /></td>
            <td><input type="text" name="handrailanr_rmplm13" id="handrailanr_rmplm13" value="0.00" /></td>
            <td><input type="text" name="handrailanr_laplm13" id="handrailanr_laplm13" value="0.00" /></td>
            <td>Team</td>
            <td><input type="text" name="handrailanr_lmta13" id="handrailanr_lmta13" value="0.50" /></td>
            <td><input type="text" name="handrailanr_ah13" id="handrailanr_ah13" value="0.00" /></td>
            <td><input type="text" name="handrailanr_thr13" id="handrailanr_thr13" value="70.00" /></td>
            <td><input type="text" name="handrailanr_la13" id="handrailanr_la13" value="0.00" /></td>  
            <td><input type="text" name="handrailanr_rma13" id="handrailanr_rma13" value="0.00" /></td>  
            <td><input type="text" name="handrailanr_proj13" id="handrailanr_proj13" value="0.00" /></td>   
          </tr>
           <tr><td colspan="11"><h3 style="float:right;">Total:&nbsp;&nbsp;</h3>
          			<input type="button" value="Calculate" id="handrailanr_calc" />&nbsp;
     		 		<input type="button" value="Calculate & Use" id="handrail_total_assign_to_sheet1" /></td><td><input type="text" name="handrailanr_alltotal" id="handrailanr_alltotal" value="0.00" class="sub_frame_ldp" />
          </td></tr>
         </table>
  </div>
  <div id="tab22"><h3>Timber Screening Handrail - Raw Materials (1 meter in height)</h3><br />
        <table cellpadding="0" cellspacing="0"  width="99%">
         <tr>
            <th width="20%">Posts </th>
            <th width="10%"></th>
            <th width="10%">Cost per lineal meter</th>
            <th width="10%">Handrail Meters</th>
            <th width="10%">Lineal Meters Per Lineal Meter</th>
            <th width="10%">Total Lineal Meters</th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<th>90mm x35mm F27</th>
            <td></td>
            <td><input type="text" name="timberscreeningh_cplm1" id="timberscreeningh_cplm1" value="5.50" /></td>
            <td><input type="text" name="timberscreeningh_hm1" id="timberscreeningh_hm1" value="0.00" /></td>
            <td><input type="text" name="timberscreeningh_lmplm1" id="timberscreeningh_lmplm1" value="1.60" /></td>
            <td><input type="text" name="timberscreeningh_tlm1" id="timberscreeningh_tlm1" value="0.00" /></td>
            <td><input type="text" name="timberscreeningh_total1" id="timberscreeningh_total1" value="0.00" /></td>    
          </tr>
           <tr>
          	<th>Top Rail</th>
            <th width="10%"></th>
            <th width="10%">Cost per lineal meter</th>
            <th width="10%">Handrail Meters</th>
            <th width="10%">Lineal Meters Per Lineal Meter</th>
            <th width="10%">Total Lineal Meters</th>
            <th width="10%">Total</th>
          </tr>
           <tr>
          	<th>140mm 35mm f27</th>
            <td></td>
            <td><input type="text" name="timberscreeningh_cplm2" id="timberscreeningh_cplm2" value="9.00" /></td>
            <td><input type="text" name="timberscreeningh_hm2" id="timberscreeningh_hm2" value="0.00" /></td>
            <td><input type="text" name="timberscreeningh_lmplm2" id="timberscreeningh_lmplm2" value="1.20" /></td>
            <td><input type="text" name="timberscreeningh_tlm2" id="timberscreeningh_tlm2" value="0.00" /></td>
            <td><input type="text" name="timberscreeningh_total2" id="timberscreeningh_total2" value="0.00" /></td> 
          </tr>
           <tr>
          	<th>Decking Boards</th>
            <th width="10%"></th>
            <th width="10%">Cost per lineal meter</th>
            <th width="10%">Handrail Meters</th>
            <th width="10%">Lineal Meters Per Lineal Meter</th>
            <th width="10%">Total Lineal Meters</th>
            <th width="10%">Total</th> 
          </tr>
           <tr>
          	<th>84mm - 90mm</th>
            <td></td>
            <td><input type="text" name="timberscreeningh_cplm3" id="timberscreeningh_cplm3" value="5.50" /></td>
            <td><input type="text" name="timberscreeningh_hm3" id="timberscreeningh_hm3" value="0.00" /></td>
            <td><input type="text" name="timberscreeningh_lmplm3" id="timberscreeningh_lmplm3" value="6.00" /></td>
            <td><input type="text" name="timberscreeningh_tlm3" id="timberscreeningh_tlm3" value="0.00" /></td>
            <td><input type="text" name="timberscreeningh_total3" id="timberscreeningh_total3" value="0.00" /></td> 
          </tr>
           <tr>
          	<th>Screws</th>
            <th width="10%"></th>
            <th width="10%">Cost per lineal meter</th>
            <th width="10%">Handrail Meters</th>
            <th width="10%">Units Per Lineal Meter</th>
            <th width="10%">Total Lineal Meters</th>
            <th width="10%">Total</th>    
          </tr>
          <tr>
          	<th>10g 50mm Stainles Steel steel square Drive decking Screws</th>
            <td></td>
            <td><input type="text" name="timberscreeningh_cplm4" id="timberscreeningh_cplm4" value="0.12" /></td>
            <td><input type="text" name="timberscreeningh_hm4" id="timberscreeningh_hm4" value="0.00" /></td>
            <td><input type="text" name="timberscreeningh_lmplm4" id="timberscreeningh_lmplm4" value="20.00" /></td>
            <td><input type="text" name="timberscreeningh_tlm4" id="timberscreeningh_tlm4" value="0.00" /></td>
            <td><input type="text" name="timberscreeningh_total4" id="timberscreeningh_total4" value="0.00" /></td>   
          </tr>
           <tr>
          	<th>Organil Oil</th>
            <th width="10%">Cost per Liter</th>
            <th width="10%">Liters per Lineal Meters</th>
            <th width="10%">Handrail Meters</th>
            <th width="10%">Units Per Lineal Meter</th>
            <th width="10%">Total Lineal Meters</th>
            <th width="10%">Total</th>    
          </tr>
          <tr>
          	<th>Organ Oil</th>          
            <td><input type="text" name="timberscreeningh_cpl5" id="timberscreeningh_cpl5" value="20.00" /></td>
            <td><input type="text" name="timberscreeningh_cplm5" id="timberscreeningh_cplm5" value="0.25" /></td>
            <td><input type="text" name="timberscreeningh_hm5" id="timberscreeningh_hm5" value="0.00" /></td>
            <td><input type="text" name="timberscreeningh_lmplm5" id="timberscreeningh_lmplm5" value="0.00" /></td>
            <td></td>
            <td><input type="text" name="timberscreeningh_total5" id="timberscreeningh_total5" value="0.00" /></td>      
          </tr>
           <tr><td colspan="6">
           <h3 style="float:right;">Total:&nbsp;&nbsp;</h3>
           <input type="button" value="Calculate" id="timberscreeningh_calc" />&nbsp;
           <input type="button" value="Calculate & Use" id="handrail_total_assign_to_sheet2"/></td>
           <td><input type="text" name="timberscreeningh_alltotal" id="timberscreeningh_alltotal" value="0.00" /></td></tr>
         </table>
             
  </div>
  <div id="tab23"><h3>Timber Screening Handrail - Labour ( 1 meter in  height)</h3><br />
         <table cellpadding="0" cellspacing="0"  width="99%">
         <tr>
            <th width="20%">Frame</th>
            <th width="10%">Activty</th>
            <th width="10%">Lineal Meters Per Hour</th>
            <th width="10%">Handrail Meters</th>
            <th width="10%">Total Hours Required</th>
            <th width="10%">Cost Per Hour Labour</th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td></td>
          	<td>Team</td>
            <td><input type="text" name="timberscreeninghl_lmph" id="timberscreeninghl_lmph" value="2.00" /></td>
            <td><input type="text" name="timberscreeninghl_hm" id="timberscreeninghl_hm" value="0.00" /></td>
            <td><input type="text" name="timberscreeninghl_thr" id="timberscreeninghl_thr" value="0.00" /></td>
            <td><input type="text" name="timberscreeninghl_cphl" id="timberscreeninghl_cphl" value="70.00" /></td>
            <td></td>
            <td></td> 
            <td><input type="text" name="timberscreeninghl_total" id="timberscreeninghl_total" value="0.00" /></td>   
          </tr>
          <tr>
            <th width="20%">Decking Boards</th>
            <th width="10%">Activty</th>
            <th width="10%">Divder</th>
            <th width="10%">Handrail Meters</th>
            <th width="10%">Total SQM of Decking</th>
            <th width="10%">Cost Per Hour Labour</th>
            <th width="10%">Team Output</th>
            <th width="10%">Total Hours</th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td></td>
          	<td>Team</td>
            <td><input type="text" name="timberscreeninghl_lmph1" id="timberscreeninghl_lmph1" value="2.00" /></td>
            <td><input type="text" name="timberscreeninghl_hm1" id="timberscreeninghl_hm1" value="0.00" /></td>
            <td><input type="text" name="timberscreeninghl_thr1" id="timberscreeninghl_thr1" value="0.00" /></td>
            <td><input type="text" name="timberscreeninghl_cphl1" id="timberscreeninghl_cphl1" value="70.00" /></td>
            <td><input type="text" name="timberscreeninghl_to" id="timberscreeninghl_to" value="1.00" /></td>
            <td><input type="text" name="timberscreeninghl_th" id="timberscreeninghl_th" value="0.00" /></td> 
            <td><input type="text" name="timberscreeninghl_total1" id="timberscreeninghl_total1" value="0.00" /></td> 
          </tr>
          <tr><td colspan="8">
           <h3 style="float:right;">Total:&nbsp;&nbsp;</h3>
           <input type="button" value="Calculate" id="timberscreeninghl_calc" />&nbsp;
           <input type="button" value="Calculate & Use" id="handrail_total_assign_to_sheet3"/></td>
           <td><input type="text" name="timberscreeninghl_alltotal" id="timberscreeninghl_alltotal" value="0.00" /></td></tr>
          </table>
          
  </div>
  </div>
	<table cellpadding="0" cellspacing="0"  width="99%">
         <tr>
            <td width="90%"><div align="right"><h2>Total:&nbsp;</h2></div></td>
            <td width="10%"><input type="text" name="timberscreening_alltotals" id="timberscreening_alltotals" value="0.00" /></td>
          </tr>
     </table> 
 <script type="text/javascript">
    $(document).ready( function() {
      $('#tab-Handrail').easytabs();
    });
 </script>             
</div>
<div id="stairs" class="popupdiv">
<h1>Stairs</h1>
<input type="submit" name="stairs_value_set" id="stairs_value_set" value="Load Value" /> 
<div id="tab-Stairs" class="tab-container">
  <ul class='etabs'>
    <li class='tab'><a href="#tab31">Stairs Total Cost <br />Labour and Materials</a></li>
    <li class='tab'><a href="#tab32">Stairs Total Cost <br />Labour and Materials</a></li>
    <li class='tab'><a href="#tab33">Stairs Total Cost <br />Labour and Materials</a></li>
    <li class='tab'><a href="#tab34">Stairs Total Cost <br />Labour and Materials</a></li>
  </ul>
  <div id="tab31"><h3>Stairs Total Cost Labour and Materials</h3>
  <table cellpadding="0" cellspacing="0"  width="99%">
         <tr>
            <th width="20%"></th>
            <th width="10%">Height MM</th>
            <th width="10%">Multipler</th>
            <th width="10%">Length mm</th>
            <th width="10%">Width mm</th>
            <th width="10%">Total MM</th>
            <th width="10%">Divider</th>
            <th width="10%">SQM</th>
            <th width="10%">Rate Per SQM - INC GST</th>
            <th width="10%">Project Cost</th>
          </tr>
          <tr>
          	<td>Materials: Traditional Hardwood Stairs with Striner and Tread</td>
          	<td><input type="text" name="stairs_hmm1" id="stairs_hmm1" value="{{$stdata[0].cst_height_thss}}" /></td>
            <td><input type="text" name="stairs_multi1" id="stairs_multi1" value="{{$stdata[0].cst_multipler_thss}}" /></td>
            <td><input type="text" name="stairs_lmm1" id="stairs_lmm1" value="0.00" /></td>
            <td><input type="text" name="stairs_wmm1" id="stairs_wmm1" value="{{$stdata[0].cst_width_thss}}" /></td>
            <td><input type="text" name="stairs_tmm1" id="stairs_tmm1" value="0.00" /></td>
            <td><input type="text" name="stairs_div1" id="stairs_div1" value="{{$stdata[0].cst_divider_thss}}" /></td>
            <td><input type="text" name="stairs_sqm1" id="stairs_sqm1" value="0.00" /></td>
            <td><input type="text" name="stairs_rps1" id="stairs_rps1" value="{{$stdata[0].cst_rate_per_sqm_thss}}" /></td> 
            <td><input type="text" name="stairs_pc1" id="stairs_pc1" value="0.00" /></td>   
          </tr>
          
          <tr>
            <th width="20%"></th>
            <th width="10%">Team</th>
            <th width="10%">SQM </th>
            <th width="10%">Total</th>
            <th width="10%">Total Hours</th>
            <th width="10%">Cost Per Hour</th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%"></th>
          </tr>
         <tr>
          	<td>Labour:  Traditional Hardwood Stairs with Striner and Tread</td>
          	<td>Yes</td>
            <td><input type="text" name="stairs_lsqm1" id="stairs_lsqm1" value="0.00" /></td>
            <td><input type="text" name="stairs_total1" id="stairs_total1" value="{{$stdata[0].cst_total_thss}}" /></td>
            <td><input type="text" name="stairs_totalhours1" id="stairs_totalhours1" value="0.00" /></td>
            <td><input type="text" name="stairs_costperhour1" id="stairs_costperhour1" value="{{$stdata[0].cst_cost_per_hour_thss}}" /></td>
            <td></td>
            <td></td>
            <td></td> 
            <td><input type="text" name="stairs_ltotal1" id="stairs_ltotal1" value="0.00" /></td>   
          </tr>   
          
          
          <tr>
            <th width="20%"></th>
            <th width="10%">Height MM</th>
            <th width="10%">Multipler</th>
            <th width="10%">Length mm</th>
            <th width="10%">Width mm</th>
            <th width="10%">Total MM</th>
            <th width="10%">Divider</th>
            <th width="10%">SQM</th>
            <th width="10%">Rate Per SQM - INC GST</th>
            <th width="10%">Project Cost</th>
          </tr>
          <tr>
          	<td>Materials: Cascading covered or overlaid stairs open - not enclosed side open - (decking boards to face and treads with treated pine frame):</td>
          	<td><input type="text" name="stairs_hmm2" id="stairs_hmm2" value="{{$stdata[0].cst_height_ccso}}" /></td>
            <td><input type="text" name="stairs_multi2" id="stairs_multi2" value="{{$stdata[0].cst_multipler_ccso}}" /></td>
            <td><input type="text" name="stairs_lmm2" id="stairs_lmm2" value="0.00" /></td>
            <td><input type="text" name="stairs_wmm2" id="stairs_wmm2" value="{{$stdata[0].cst_width_ccso}}" /></td>
            <td><input type="text" name="stairs_tmm2" id="stairs_tmm2" value="0.00" /></td>
            <td><input type="text" name="stairs_div2" id="stairs_div2" value="{{$stdata[0].cst_divider_ccso}}" /></td>
            <td><input type="text" name="stairs_sqm2" id="stairs_sqm2" value="0.00" /></td>
            <td><input type="text" name="stairs_rps2" id="stairs_rps2" value="{{$stdata[0].cst_rate_per_sqm_ccso}}" /></td> 
            <td><input type="text" name="stairs_pc2" id="stairs_pc2" value="0.00" /></td>  
          </tr>
          
          <tr>
            <th width="20%"></th>
            <th width="10%">Team</th>
            <th width="10%">SQM </th>
            <th width="10%">Total</th>
            <th width="10%">Total Hours</th>
            <th width="10%">Cost Per Hour</th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%"></th>
          </tr>
         <tr>
          	<td>Labour: Cascading covered or overlaid stairs open - not enclosed side open - (decking boards to face and treads with treated pine frame):</td>
          	<td>Yes</td>
            <td><input type="text" name="stairs_lsqm2" id="stairs_lsqm2" value="0.00" /></td>
            <td><input type="text" name="stairs_total2" id="stairs_total2" value="{{$stdata[0].cst_total_ccso}}" /></td>
            <td><input type="text" name="stairs_totalhours2" id="stairs_totalhours2" value="0.00" /></td>
            <td><input type="text" name="stairs_costperhour2" id="stairs_costperhour2" value="{{$stdata[0].cst_cost_per_hour_ccso}}" /></td>
            <td></td>
            <td></td>
            <td></td> 
            <td><input type="text" name="stairs_ltotal2" id="stairs_ltotal2" value="0.00" /></td>   
          </tr>  
          
		  <tr>
            <th width="20%"></th>
            <th width="10%">Height MM</th>
            <th width="10%">Multipler</th>
            <th width="10%">Length mm</th>
            <th width="10%">Width mm</th>
            <th width="10%">Total MM</th>
            <th width="10%">Divider</th>
            <th width="10%">SQM</th>
            <th width="10%">Rate Per SQM - INC GST</th>
            <th width="10%">Project Cost</th>
          </tr>
          <tr>
          	<td>Material: Floating treads (Central steel spine with 300mm wide x 50mm thick hardwood treads):</td>
          	<td><input type="text" name="stairs_hmm3" id="stairs_hmm3" value="{{$stdata[0].cst_height_ft}}" /></td>
            <td><input type="text" name="stairs_multi3" id="stairs_multi3" value="{{$stdata[0].cst_multipler_ft}}" /></td>
            <td><input type="text" name="stairs_lmm3" id="stairs_lmm3" value="0.00" /></td>
            <td><input type="text" name="stairs_wmm3" id="stairs_wmm3" value="{{$stdata[0].cst_width_ft}}" /></td>
            <td><input type="text" name="stairs_tmm3" id="stairs_tmm3" value="0.00" /></td>
            <td><input type="text" name="stairs_div3" id="stairs_div3" value="{{$stdata[0].cst_divider_ft}}" /></td>
            <td><input type="text" name="stairs_sqm3" id="stairs_sqm3" value="0.00" /></td>
            <td><input type="text" name="stairs_rps3" id="stairs_rps3" value="{{$stdata[0].cst_rate_per_sqm_ft}}" /></td> 
            <td><input type="text" name="stairs_pc3" id="stairs_pc3" value="0.00" /></td> 
          </tr>
          
          <tr>
            <th width="20%"></th>
            <th width="10%">Team</th>
            <th width="10%">SQM </th>
            <th width="10%">Total</th>
            <th width="10%">Total Hours</th>
            <th width="10%">Cost Per Hour</th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%"></th>
          </tr>
         <tr>
          	<td>Floating treads (Central steel spine with 300mm wide x 50mm thick hardwood treads):</td>
          	<td>Yes</td>
            <td><input type="text" name="stairs_lsqm3" id="stairs_lsqm3" value="0.00" /></td>
            <td><input type="text" name="stairs_total3" id="stairs_total3" value="{{$stdata[0].cst_total_ft}}" /></td>
            <td><input type="text" name="stairs_totalhours3" id="stairs_totalhours3" value="0.00" /></td>
            <td><input type="text" name="stairs_costperhour3" id="stairs_costperhour3" value="{{$stdata[0].cst_cost_per_hour_ft}}" /></td>
            <td></td>
            <td></td>
            <td></td> 
            <td><input type="text" name="stairs_ltotal3" id="stairs_ltotal3" value="0.00" /></td>   
          </tr>
          </table>
          <br /><br />
          
          <table cellpadding="0" cellspacing="0"  width="99%">

	   	  <tr><td colspan="9">
           <h3 style="float:right;">Total:&nbsp;&nbsp;</h3>
           <input type="button" value="Calculate" id="stairs_calc1" />&nbsp;
           <input type="button" value="Calculate & Use"  id = "stairs_total_assign_to_sheet1"/></td>
           <td><input type="text" name="stairs_subtotal" id="stairs_subtotal" value="0.00" /></td></tr>
  		 </table>       
  </div>
  <div id="tab32"><h3>Stairs Total Cost Labour and Materials</h3>
  <table cellpadding="0" cellspacing="0"  width="99%">
         <tr>
            <th width="20%"></th>
            <th width="10%">Height MM</th>
            <th width="10%">Multipler</th>
            <th width="10%">Length mm</th>
            <th width="10%">Width mm</th>
            <th width="10%">Total MM</th>
            <th width="10%">Divider</th>
            <th width="10%">SQM</th>
            <th width="10%">Rate Per SQM - INC GST</th>
            <th width="10%">Project Cost</th>
          </tr>
          <tr>
          	<td>Materials: Traditional Hardwood Stairs with Striner and Tread</td>
          	<td><input type="text" name="stairs_hmm4" id="stairs_hmm4" value="{{$stdata[0].cst_height_thss}}" /></td>
            <td><input type="text" name="stairs_multi4" id="stairs_multi4" value="{{$stdata[0].cst_multipler_thss}}" /></td>
            <td><input type="text" name="stairs_lmm4" id="stairs_lmm4" value="0.00" /></td>
            <td><input type="text" name="stairs_wmm4" id="stairs_wmm4" value="{{$stdata[0].cst_width_thss}}" /></td>
            <td><input type="text" name="stairs_tmm4" id="stairs_tmm4" value="0.00" /></td>
            <td><input type="text" name="stairs_div4" id="stairs_div4" value="{{$stdata[0].cst_divider_thss}}" /></td>
            <td><input type="text" name="stairs_sqm4" id="stairs_sqm4" value="0.00" /></td>
            <td><input type="text" name="stairs_rps4" id="stairs_rps4" value="{{$stdata[0].cst_rate_per_sqm_thss}}" /></td> 
            <td><input type="text" name="stairs_pc4" id="stairs_pc4" value="0.00" /></td>   
          </tr>
          
          <tr>
            <th width="20%"></th>
            <th width="10%">Team</th>
            <th width="10%">SQM </th>
            <th width="10%">Total</th>
            <th width="10%">Total Hours</th>
            <th width="10%">Cost Per Hour</th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%"></th>
          </tr>
         <tr>
          	<td>Labour:  Traditional Hardwood Stairs with Striner and Tread</td>
          	<td>Yes</td>
            <td><input type="text" name="stairs_lsqm4" id="stairs_lsqm4" value="0.00" /></td>
            <td><input type="text" name="stairs_total4" id="stairs_total4" value="{{$stdata[0].cst_total_thss}}" /></td>
            <td><input type="text" name="stairs_totalhours4" id="stairs_totalhours4" value="0.00" /></td>
            <td><input type="text" name="stairs_costperhour4" id="stairs_costperhour4" value="{{$stdata[0].cst_cost_per_hour_thss}}" /></td>
            <td></td>
            <td></td>
            <td></td> 
            <td><input type="text" name="stairs_ltotal4" id="stairs_ltotal4" value="0.00" /></td>   
          </tr>   
          
          
          <tr>
            <th width="20%"></th>
            <th width="10%">Height MM</th>
            <th width="10%">Multipler</th>
            <th width="10%">Length mm</th>
            <th width="10%">Width mm</th>
            <th width="10%">Total MM</th>
            <th width="10%">Divider</th>
            <th width="10%">SQM</th>
            <th width="10%">Rate Per SQM - INC GST</th>
            <th width="10%">Project Cost</th>
          </tr>
          <tr>
          	<td>Materials: Cascading covered or overlaid stairs open - not enclosed side open - (decking boards to face and treads with treated pine frame):</td>
          	<td><input type="text" name="stairs_hmm5" id="stairs_hmm5" value="{{$stdata[0].cst_height_ccso}}" /></td>
            <td><input type="text" name="stairs_multi5" id="stairs_multi5" value="{{$stdata[0].cst_multipler_ccso}}" /></td>
            <td><input type="text" name="stairs_lmm5" id="stairs_lmm5" value="0.00" /></td>
            <td><input type="text" name="stairs_wmm5" id="stairs_wmm5" value="{{$stdata[0].cst_width_ccso}}" /></td>
            <td><input type="text" name="stairs_tmm5" id="stairs_tmm5" value="0.00" /></td>
            <td><input type="text" name="stairs_div5" id="stairs_div5" value="{{$stdata[0].cst_divider_ccso}}" /></td>
            <td><input type="text" name="stairs_sqm5" id="stairs_sqm5" value="0.00" /></td>
            <td><input type="text" name="stairs_rps5" id="stairs_rps5" value="{{$stdata[0].cst_rate_per_sqm_ccso}}" /></td> 
            <td><input type="text" name="stairs_pc5" id="stairs_pc5" value="0.00" /></td>  
          </tr>
          
          <tr>
            <th width="20%"></th>
            <th width="10%">Team</th>
            <th width="10%">SQM </th>
            <th width="10%">Total</th>
            <th width="10%">Total Hours</th>
            <th width="10%">Cost Per Hour</th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%"></th>
          </tr>
         <tr>
          	<td>Labour: Cascading covered or overlaid stairs open - not enclosed side open - (decking boards to face and treads with treated pine frame):</td>
          	<td>Yes</td>
            <td><input type="text" name="stairs_lsqm5" id="stairs_lsqm5" value="0.00" /></td>
            <td><input type="text" name="stairs_total5" id="stairs_total5" value="{{$stdata[0].cst_total_ccso}}" /></td>
            <td><input type="text" name="stairs_totalhours5" id="stairs_totalhours5" value="0.00" /></td>
            <td><input type="text" name="stairs_costperhour5" id="stairs_costperhour5" value="{{$stdata[0].cst_cost_per_hour_ccso}}" /></td>
            <td></td>
            <td></td>
            <td></td> 
            <td><input type="text" name="stairs_ltotal5" id="stairs_ltotal5" value="0.00" /></td>   
          </tr>  
          
		  <tr>
            <th width="20%"></th>
            <th width="10%">Height MM</th>
            <th width="10%">Multipler</th>
            <th width="10%">Length mm</th>
            <th width="10%">Width mm</th>
            <th width="10%">Total MM</th>
            <th width="10%">Divider</th>
            <th width="10%">SQM</th>
            <th width="10%">Rate Per SQM - INC GST</th>
            <th width="10%">Project Cost</th>
          </tr>
          <tr>
          	<td>Material: Floating treads (Central steel spine with 300mm wide x 50mm thick hardwood treads):</td>
          	<td><input type="text" name="stairs_hmm6" id="stairs_hmm6" value="{{$stdata[0].cst_height_ft}}" /></td>
            <td><input type="text" name="stairs_multi6" id="stairs_multi6" value="{{$stdata[0].cst_multipler_ft}}" /></td>
            <td><input type="text" name="stairs_lmm6" id="stairs_lmm6" value="0.00" /></td>
            <td><input type="text" name="stairs_wmm6" id="stairs_wmm6" value="{{$stdata[0].cst_width_ft}}" /></td>
            <td><input type="text" name="stairs_tmm6" id="stairs_tmm6" value="0.00" /></td>
            <td><input type="text" name="stairs_div6" id="stairs_div6" value="{{$stdata[0].cst_divider_ft}}" /></td>
            <td><input type="text" name="stairs_sqm6" id="stairs_sqm6" value="0.00" /></td>
            <td><input type="text" name="stairs_rps6" id="stairs_rps6" value="{{$stdata[0].cst_rate_per_sqm_ft}}" /></td> 
            <td><input type="text" name="stairs_pc6" id="stairs_pc6" value="0.00" /></td> 
          </tr>
          
          <tr>
            <th width="20%"></th>
            <th width="10%">Team</th>
            <th width="10%">SQM </th>
            <th width="10%">Total</th>
            <th width="10%">Total Hours</th>
            <th width="10%">Cost Per Hour</th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%"></th>
          </tr>
         <tr>
          	<td>Floating treads (Central steel spine with 300mm wide x 50mm thick hardwood treads):</td>
          	<td>Yes</td>
            <td><input type="text" name="stairs_lsqm6" id="stairs_lsqm6" value="0.00" /></td>
            <td><input type="text" name="stairs_total6" id="stairs_total6" value="{{$stdata[0].cst_total_ft}}" /></td>
            <td><input type="text" name="stairs_totalhours6" id="stairs_totalhours6" value="0.00" /></td>
            <td><input type="text" name="stairs_costperhour6" id="stairs_costperhour6" value="{{$stdata[0].cst_cost_per_hour_ft}}" /></td>
            <td></td>
            <td></td>
            <td></td> 
            <td><input type="text" name="stairs_ltotal6" id="stairs_ltotal6" value="0.00" /></td>   
          </tr>
          </table>
          <br /><br />

           <table cellpadding="0" cellspacing="0"  width="99%">
           <tr><td colspan="9">
           <h3 style="float:right;">Total:&nbsp;&nbsp;</h3>
           <input type="button" value="Calculate" id="stairs_calc2" />&nbsp;
           <input type="button" value="Calculate & Use" id = "stairs_total_assign_to_sheet2" /></td>
           <td><input type="text" name="stairs_subtotal2" id="stairs_subtotal2" value="0.00" /></td></tr>
   </table> 
  </div>
  
  <div id="tab33"><h3>Stairs Total Cost Labour and Materials</h3>
  <table cellpadding="0" cellspacing="0"  width="99%">
         <tr>
            <th width="20%"></th>
            <th width="10%">Height MM</th>
            <th width="10%">Multipler</th>
            <th width="10%">Length mm</th>
            <th width="10%">Width mm</th>
            <th width="10%">Total MM</th>
            <th width="10%">Divider</th>
            <th width="10%">SQM</th>
            <th width="10%">Rate Per SQM - INC GST</th>
            <th width="10%">Project Cost</th>
          </tr>
          <tr>
          	<td>Materials: Traditional Hardwood Stairs with Striner and Tread</td>
          	<td><input type="text" name="stairs_hmm7" id="stairs_hmm7" value="{{$stdata[0].cst_height_thss}}" /></td>
            <td><input type="text" name="stairs_multi7" id="stairs_multi7" value="{{$stdata[0].cst_multipler_thss}}" /></td>
            <td><input type="text" name="stairs_lmm7" id="stairs_lmm7" value="0.00" /></td>
            <td><input type="text" name="stairs_wmm7" id="stairs_wmm7" value="{{$stdata[0].cst_width_thss}}" /></td>
            <td><input type="text" name="stairs_tmm7" id="stairs_tmm7" value="0.00" /></td>
            <td><input type="text" name="stairs_div7" id="stairs_div7" value="{{$stdata[0].cst_divider_thss}}" /></td>
            <td><input type="text" name="stairs_sqm7" id="stairs_sqm7" value="0.00" /></td>
            <td><input type="text" name="stairs_rps7" id="stairs_rps7" value="{{$stdata[0].cst_rate_per_sqm_thss}}" /></td> 
            <td><input type="text" name="stairs_pc7" id="stairs_pc7" value="0.00" /></td>   
          </tr>
          
          <tr>
            <th width="20%"></th>
            <th width="10%">Team</th>
            <th width="10%">SQM </th>
            <th width="10%">Total</th>
            <th width="10%">Total Hours</th>
            <th width="10%">Cost Per Hour</th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%"></th>
          </tr>
         <tr>
          	<td>Labour:  Traditional Hardwood Stairs with Striner and Tread</td>
          	<td>Yes</td>
            <td><input type="text" name="stairs_lsqm7" id="stairs_lsqm7" value="0.00" /></td>
            <td><input type="text" name="stairs_total7" id="stairs_total7" value="{{$stdata[0].cst_total_thss}}" /></td>
            <td><input type="text" name="stairs_totalhours7" id="stairs_totalhours7" value="0.00" /></td>
            <td><input type="text" name="stairs_costperhour7" id="stairs_costperhour7" value="{{$stdata[0].cst_cost_per_hour_thss}}" /></td>
            <td></td>
            <td></td>
            <td></td> 
            <td><input type="text" name="stairs_ltotal7" id="stairs_ltotal7" value="0.00" /></td>   
          </tr>   
          
          <tr>
            <th width="20%"></th>
            <th width="10%">Height MM</th>
            <th width="10%">Multipler</th>
            <th width="10%">Length mm</th>
            <th width="10%">Width mm</th>
            <th width="10%">Total MM</th>
            <th width="10%">Divider</th>
            <th width="10%">SQM</th>
            <th width="10%">Rate Per SQM - INC GST</th>
            <th width="10%">Project Cost</th>
          </tr>
          <tr>
          	<td>Materials: Cascading covered or overlaid stairs open - not enclosed side open - (decking boards to face and treads with treated pine frame):</td>
          	<td><input type="text" name="stairs_hmm8" id="stairs_hmm8" value="{{$stdata[0].cst_height_ccso}}" /></td>
            <td><input type="text" name="stairs_multi8" id="stairs_multi8" value="{{$stdata[0].cst_multipler_ccso}}" /></td>
            <td><input type="text" name="stairs_lmm8" id="stairs_lmm8" value="0.00" /></td>
            <td><input type="text" name="stairs_wmm8" id="stairs_wmm8" value="{{$stdata[0].cst_width_ccso}}" /></td>
            <td><input type="text" name="stairs_tmm8" id="stairs_tmm8" value="0.00" /></td>
            <td><input type="text" name="stairs_div8" id="stairs_div8" value="{{$stdata[0].cst_divider_ccso}}" /></td>
            <td><input type="text" name="stairs_sqm8" id="stairs_sqm8" value="0.00" /></td>
            <td><input type="text" name="stairs_rps8" id="stairs_rps8" value="{{$stdata[0].cst_rate_per_sqm_ccso}}" /></td> 
            <td><input type="text" name="stairs_pc8" id="stairs_pc8" value="0.00" /></td>  
          </tr>
          
          <tr>
            <th width="20%"></th>
            <th width="10%">Team</th>
            <th width="10%">SQM </th>
            <th width="10%">Total</th>
            <th width="10%">Total Hours</th>
            <th width="10%">Cost Per Hour</th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%"></th>
          </tr>
         <tr>
          	<td>Labour: Cascading covered or overlaid stairs open - not enclosed side open - (decking boards to face and treads with treated pine frame):</td>
          	<td>Yes</td>
            <td><input type="text" name="stairs_lsqm8" id="stairs_lsqm8" value="0.00" /></td>
            <td><input type="text" name="stairs_total8" id="stairs_total8" value="{{$stdata[0].cst_total_ccso}}" /></td>
            <td><input type="text" name="stairs_totalhours8" id="stairs_totalhours8" value="0.00" /></td>
            <td><input type="text" name="stairs_costperhour8" id="stairs_costperhour8" value="{{$stdata[0].cst_cost_per_hour_ccso}}" /></td>
            <td></td>
            <td></td>
            <td></td> 
            <td><input type="text" name="stairs_ltotal8" id="stairs_ltotal8" value="0.00" /></td>   
          </tr>  
          
		  <tr>
            <th width="20%"></th>
            <th width="10%">Height MM</th>
            <th width="10%">Multipler</th>
            <th width="10%">Length mm</th>
            <th width="10%">Width mm</th>
            <th width="10%">Total MM</th>
            <th width="10%">Divider</th>
            <th width="10%">SQM</th>
            <th width="10%">Rate Per SQM - INC GST</th>
            <th width="10%">Project Cost</th>
          </tr>
          <tr>
          	<td>Material: Floating treads (Central steel spine with 300mm wide x 50mm thick hardwood treads):</td>
          	<td><input type="text" name="stairs_hmm9" id="stairs_hmm9" value="{{$stdata[0].cst_height_ft}}" /></td>
            <td><input type="text" name="stairs_multi9" id="stairs_multi9" value="{{$stdata[0].cst_multipler_ft}}" /></td>
            <td><input type="text" name="stairs_lmm9" id="stairs_lmm9" value="0.00" /></td>
            <td><input type="text" name="stairs_wmm9" id="stairs_wmm9" value="{{$stdata[0].cst_width_ft}}" /></td>
            <td><input type="text" name="stairs_tmm9" id="stairs_tmm9" value="0.00" /></td>
            <td><input type="text" name="stairs_div9" id="stairs_div9" value="{{$stdata[0].cst_divider_ft}}" /></td>
            <td><input type="text" name="stairs_sqm9" id="stairs_sqm9" value="0.00" /></td>
            <td><input type="text" name="stairs_rps9" id="stairs_rps9" value="{{$stdata[0].cst_rate_per_sqm_ft}}" /></td> 
            <td><input type="text" name="stairs_pc9" id="stairs_pc9" value="0.00" /></td> 
          </tr>
          
          <tr>
            <th width="20%"></th>
            <th width="10%">Team</th>
            <th width="10%">SQM </th>
            <th width="10%">Total</th>
            <th width="10%">Total Hours</th>
            <th width="10%">Cost Per Hour</th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%"></th>
          </tr>
         <tr>
          	<td>Floating treads (Central steel spine with 300mm wide x 50mm thick hardwood treads):</td>
          	<td>Yes</td>
            <td><input type="text" name="stairs_lsqm9" id="stairs_lsqm9" value="0.00" /></td>
            <td><input type="text" name="stairs_total9" id="stairs_total9" value="{{$stdata[0].cst_total_ft}}" /></td>
            <td><input type="text" name="stairs_totalhours9" id="stairs_totalhours9" value="0.00" /></td>
            <td><input type="text" name="stairs_costperhour9" id="stairs_costperhour9" value="{{$stdata[0].cst_cost_per_hour_ft}}" /></td>
            <td></td>
            <td></td>
            <td></td> 
            <td><input type="text" name="stairs_ltotal9" id="stairs_ltotal9" value="0.00" /></td>   
          </tr>
          </table>

          <br /><br />
           <table cellpadding="0" cellspacing="0"  width="99%">
           <tr><td colspan="9">
           <h3 style="float:right;">Total:&nbsp;&nbsp;</h3>
           <input type="button" value="Calculate" id="stairs_calc3" />&nbsp;
           <input type="button" value="Calculate & Use"  id = "stairs_total_assign_to_sheet3"/></td>
           <td><input type="text" name="stairs_subtotal3" id="stairs_subtotal3" value="0.00" /></td></tr>
   </table> 
  </div>
  
  <div id="tab34"><h3>Stairs Total Cost Labour and Materials</h3>
   <table cellpadding="0" cellspacing="0"  width="99%">
         <tr>
            <th width="20%"></th>
            <th width="10%">Height MM</th>
            <th width="10%">Multipler</th>
            <th width="10%">Length mm</th>
            <th width="10%">Width mm</th>
            <th width="10%">Total MM</th>
            <th width="10%">Divider</th>
            <th width="10%">SQM</th>
            <th width="10%">Rate Per SQM - INC GST</th>
            <th width="10%">Project Cost</th>
          </tr>
          <tr>
          	<td>Materials: Traditional Hardwood Stairs with Striner and Tread</td>
          	<td><input type="text" name="stairs_hmm10" id="stairs_hmm10" value="{{$stdata[0].cst_height_thss}}" /></td>
            <td><input type="text" name="stairs_multi10" id="stairs_multi10" value="{{$stdata[0].cst_multipler_thss}}" /></td>
            <td><input type="text" name="stairs_lmm10" id="stairs_lmm10" value="0.00" /></td>
            <td><input type="text" name="stairs_wmm10" id="stairs_wmm10" value="{{$stdata[0].cst_width_thss}}" /></td>
            <td><input type="text" name="stairs_tmm10" id="stairs_tmm10" value="0.00" /></td>
            <td><input type="text" name="stairs_div10" id="stairs_div10" value="{{$stdata[0].cst_divider_thss}}" /></td>
            <td><input type="text" name="stairs_sqm10" id="stairs_sqm10" value="0.00" /></td>
            <td><input type="text" name="stairs_rps10" id="stairs_rps10" value="{{$stdata[0].cst_rate_per_sqm_thss}}" /></td> 
            <td><input type="text" name="stairs_pc10" id="stairs_pc10" value="0.00" /></td>   
          </tr>
          
          <tr>
            <th width="20%"></th>
            <th width="10%">Team</th>
            <th width="10%">SQM </th>
            <th width="10%">Total</th>
            <th width="10%">Total Hours</th>
            <th width="10%">Cost Per Hour</th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%"></th>
          </tr>
         <tr>
          	<td>Labour:  Traditional Hardwood Stairs with Striner and Tread</td>
          	<td>Yes</td>
            <td><input type="text" name="stairs_lsqm10" id="stairs_lsqm10" value="0.00" /></td>
            <td><input type="text" name="stairs_total10" id="stairs_total10" value="{{$stdata[0].cst_total_thss}}" /></td>
            <td><input type="text" name="stairs_totalhours10" id="stairs_totalhours10" value="0.00" /></td>
            <td><input type="text" name="stairs_costperhour10" id="stairs_costperhour10" value="{{$stdata[0].cst_cost_per_hour_thss}}" /></td>
            <td></td>
            <td></td>
            <td></td> 
            <td><input type="text" name="stairs_ltotal10" id="stairs_ltotal10" value="0.00" /></td>   
          </tr>   
          
          <tr>
            <th width="20%"></th>
            <th width="10%">Height MM</th>
            <th width="10%">Multipler</th>
            <th width="10%">Length mm</th>
            <th width="10%">Width mm</th>
            <th width="10%">Total MM</th>
            <th width="10%">Divider</th>
            <th width="10%">SQM</th>
            <th width="10%">Rate Per SQM - INC GST</th>
            <th width="10%">Project Cost</th>
          </tr>
          <tr>
          	<td>Materials: Cascading covered or overlaid stairs open - not enclosed side open - (decking boards to face and treads with treated pine frame):</td>
          	<td><input type="text" name="stairs_hmm11" id="stairs_hmm11" value="{{$stdata[0].cst_height_ccso}}" /></td>
            <td><input type="text" name="stairs_multi11" id="stairs_multi11" value="{{$stdata[0].cst_multipler_ccso}}" /></td>
            <td><input type="text" name="stairs_lmm11" id="stairs_lmm11" value="0.00" /></td>
            <td><input type="text" name="stairs_wmm11" id="stairs_wmm11" value="{{$stdata[0].cst_width_ccso}}" /></td>
            <td><input type="text" name="stairs_tmm11" id="stairs_tmm11" value="0.00" /></td>
            <td><input type="text" name="stairs_div11" id="stairs_div11" value="{{$stdata[0].cst_divider_ccso}}" /></td>
            <td><input type="text" name="stairs_sqm11" id="stairs_sqm11" value="0.00" /></td>
            <td><input type="text" name="stairs_rps11" id="stairs_rps11" value="{{$stdata[0].cst_rate_per_sqm_ccso}}" /></td> 
            <td><input type="text" name="stairs_pc11" id="stairs_pc11" value="0.00" /></td>  
          </tr>
          
          <tr>
            <th width="20%"></th>
            <th width="10%">Team</th>
            <th width="10%">SQM </th>
            <th width="10%">Total</th>
            <th width="10%">Total Hours</th>
            <th width="10%">Cost Per Hour</th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%"></th>
          </tr>
         <tr>
          	<td>Labour: Cascading covered or overlaid stairs open - not enclosed side open - (decking boards to face and treads with treated pine frame):</td>
          	<td>Yes</td>
            <td><input type="text" name="stairs_lsqm11" id="stairs_lsqm11" value="0.00" /></td>
            <td><input type="text" name="stairs_total11" id="stairs_total11" value="{{$stdata[0].cst_total_ccso}}" /></td>
            <td><input type="text" name="stairs_totalhours11" id="stairs_totalhours11" value="0.00" /></td>
            <td><input type="text" name="stairs_costperhour11" id="stairs_costperhour11" value="{{$stdata[0].cst_cost_per_hour_ccso}}" /></td>
            <td></td>
            <td></td>
            <td></td> 
            <td><input type="text" name="stairs_ltotal11" id="stairs_ltotal11" value="0.00" /></td>   
          </tr>  
          
		  <tr>
            <th width="20%"></th>
            <th width="10%">Height MM</th>
            <th width="10%">Multipler</th>
            <th width="10%">Length mm</th>
            <th width="10%">Width mm</th>
            <th width="10%">Total MM</th>
            <th width="10%">Divider</th>
            <th width="10%">SQM</th>
            <th width="10%">Rate Per SQM - INC GST</th>
            <th width="10%">Project Cost</th>
          </tr>
          <tr>
          	<td>Material: Floating treads (Central steel spine with 300mm wide x 50mm thick hardwood treads):</td>
          	<td><input type="text" name="stairs_hmm12" id="stairs_hmm12" value="{{$stdata[0].cst_height_ft}}" /></td>
            <td><input type="text" name="stairs_multi12" id="stairs_multi12" value="{{$stdata[0].cst_multipler_ft}}" /></td>
            <td><input type="text" name="stairs_lmm12" id="stairs_lmm12" value="0.00" /></td>
            <td><input type="text" name="stairs_wmm12" id="stairs_wmm12" value="{{$stdata[0].cst_width_ft}}" /></td>
            <td><input type="text" name="stairs_tmm12" id="stairs_tmm12" value="0.00" /></td>
            <td><input type="text" name="stairs_div12" id="stairs_div12" value="{{$stdata[0].cst_divider_ft}}" /></td>
            <td><input type="text" name="stairs_sqm12" id="stairs_sqm12" value="0.00" /></td>
            <td><input type="text" name="stairs_rps12" id="stairs_rps12" value="{{$stdata[0].cst_rate_per_sqm_ft}}" /></td> 
            <td><input type="text" name="stairs_pc12" id="stairs_pc12" value="0.00" /></td> 
          </tr>
          
          <tr>
            <th width="20%"></th>
            <th width="10%">Team</th>
            <th width="10%">SQM </th>
            <th width="10%">Total</th>
            <th width="10%">Total Hours</th>
            <th width="10%">Cost Per Hour</th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%"></th>
          </tr>
         <tr>
          	<td>Floating treads (Central steel spine with 300mm wide x 50mm thick hardwood treads):</td>
          	<td>Yes</td>
            <td><input type="text" name="stairs_lsqm12" id="stairs_lsqm12" value="0.00" /></td>
            <td><input type="text" name="stairs_total12" id="stairs_total12" value="{{$stdata[0].cst_total_ft}}" /></td>
            <td><input type="text" name="stairs_totalhours12" id="stairs_totalhours12" value="0.00" /></td>
            <td><input type="text" name="stairs_costperhour12" id="stairs_costperhour12" value="{{$stdata[0].cst_cost_per_hour_ft}}" /></td>
            <td></td>
            <td></td>
            <td></td> 
            <td><input type="text" name="stairs_ltotal12" id="stairs_ltotal12" value="0.00" /></td>   
          </tr>
          </table>
 
          <br /><br />
           <table cellpadding="0" cellspacing="0"  width="99%">
           <tr><td colspan="9">
           <h3 style="float:right;">Total:&nbsp;&nbsp;</h3>
           <input type="button" value="Calculate" id="stairs_calc4" />&nbsp;
           <input type="button" value="Calculate & Use" id = "stairs_total_assign_to_sheet4"/></td>
           <td><input type="text" name="stairs_subtotal4" id="stairs_subtotal4" value="0.00" /></td></tr>
   </table> 
  </div>
  
  <table cellpadding="0" cellspacing="0"  width="99%">
         <tr>
            <td width="90%"><h2 align="right">Total:&nbsp;</h2></td>
            <td width="10%"><input type="text" name="stairs_alltotals" id="stairs_alltotals" value="0.00" /></td>
          </tr>
     </table> 
  </div>        
  <script type="text/javascript">
    $(document).ready( function() {
      $('#tab-Stairs').easytabs();
    });
 </script>       
</div>
<div id="roof" class="popupdiv">
<h1>Roof</h1><br />
<div id="tab-Roof" class="tab-container">
  <ul class='etabs'>
    <li class='tab'><a href="#tab41">Gable Roof-Treated <br />Pine-Raw Materials</a></li>
    <li class='tab'><a href="#tab42">-Treated <br />Pine-Labour</a></li>
    <li class='tab'><a href="#tab43">Skillion Roof Method-<br />Hardwood-Raw Materials</a></li>
    <li class='tab'><a href="#tab44">-Hardwood <br />-Labour</a></li>
    <li class='tab'><a href="#tab45">Skillion Roof-Treat<br /> Pine-Labour</a></li>
    <li class='tab'><a href="#tab46">-Treated <br />Pine-Raw Materials</a></li>
    <li class='tab'><a href="#tab47">Pergola Frame-Non Roof-<br />Treated Pine-Raw Materials</a></li>
    <li class='tab'><a href="#tab48">- Non Roof-Treated<br /> Pine -Labour</a></li>
  </ul>

  <div id="tab41"><h3>Gable Roof - Treated Pine - Raw Materials</h3>
  	 <table cellpadding="0" cellspacing="0"  width="99%">
         <tr>
            <th width="20%">Posts</th>
            <th width="10%"></th>
            <th width="10%">Cost per lineal meter</th>
            <th width="10%">Project SQM</th>
            <th width="10%">Methodology:</th>
            <th width="10%">Posts per SQM</th>
            <th width="10%">Total Post For This Job</th>
            <th width="10%">lineal meters per Post</th>
            <th width="10%">Total lineal Meter</th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td>90mm x 90mm H4 LOSP Treat Pine (posts)</td>
          	<td></td>
            <td><input type="text" name="gable_roof_cplm1" id="gable_roof_cplm1" value="13.00" /></td>
            <td><input type="text" name="gable_roof_ps1" id="gable_roof_ps1" value="0.00" /></td>
            <td></td>
            <td><input type="text" name="gable_roof_pps1" id="gable_roof_pps1" value="0.18" /></td>
            <td><input type="text" name="gable_roof_tpftj1" id="gable_roof_tpftj1" value="0.00" /></td>
            <td><input type="text" name="gable_roof_lmps1" id="gable_roof_lmps1" value="3.00" /></td> 
            <td><input type="text" name="gable_roof_tlm1" id="gable_roof_tlm1" value="0.00" /></td> 
            <td><input type="text" name="gable_roof_total1" id="gable_roof_total1" value="0.00" /></td>   
          </tr>
           <tr>
            <th width="20%">Beams</th>
            <th width="10%"></th>
            <th width="10%">Cost per lineal meter</th>
            <th width="10%">Project SQM</th>
            <th width="10%">Methodology:</th>
            <th width="10%">Lineal meters per SQM</th>
            <th width="10%">Total lineal meters need This Job</th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td>240mm x 45mm Treated Pine (beam)</td>
          	<td></td>
            <td><input type="text" name="gable_roof_cplm2" id="gable_roof_cplm2" value="15.00" /></td>
            <td><input type="text" name="gable_roof_ps2" id="gable_roof_ps2" value="0.00" /></td>
            <td></td>
            <td><input type="text" name="gable_roof_pps2" id="gable_roof_pps2" value="0.57" /></td>
            <td><input type="text" name="gable_roof_tpftj2" id="gable_roof_tpftj2" value="0.00" /></td>
            <td></td> 
            <td></td> 
            <td><input type="text" name="gable_roof_total2" id="gable_roof_total2" value="0.00" /></td>   
          </tr>
           <tr>
            <th width="20%">Rafters</th>
            <th width="10%"></th>
            <th width="10%">Cost per lineal meter</th>
            <th width="10%">Project SQM</th>
            <th width="10%">Methodology:</th>
            <th width="10%">Lineal meters per SQM</th>
            <th width="10%">Total lineal meters need This Job</th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%">Total</th
          ></tr>
          <tr>
          	<td>190mm x 45mm Treated Pine (Rafters);</td>
          	<td></td>
            <td><input type="text" name="gable_roof_cplm3" id="gable_roof_cplm3" value="10.50" /></td>
            <td><input type="text" name="gable_roof_ps3" id="gable_roof_ps3" value="0.00" /></td>
            <td></td>
            <td><input type="text" name="gable_roof_pps3" id="gable_roof_pps3" value="1.70" /></td>
            <td><input type="text" name="gable_roof_tpftj3" id="gable_roof_tpftj3" value="0.00" /></td>
            <td></td> 
            <td></td> 
            <td><input type="text" name="gable_roof_total3" id="gable_roof_total3" value="0.00" /></td>    
          </tr>
           <tr>
            <th width="20%">Battens</th>
            <th width="10%"></th>
            <th width="10%">Cost per lineal meter</th>
            <th width="10%">Project SQM</th>
            <th width="10%">Methodology:</th>
            <th width="10%">Lineal meters per SQM</th>
            <th width="10%">Total lineal meters need This Job</th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%">Total</th
          ></tr>
          <tr>
          	<td>70mm x 45mm Treated Pine (5.4 lenghts reqquired) (battens)</td>
          	<td></td>
            <td></td>
            <td><input type="text" name="gable_roof_ps4" id="gable_roof_ps4" value="0.00" /></td>
            <td></td>
            <td><input type="text" name="gable_roof_lmps4" id="gable_roof_lmps4" value="2.00" /></td>
            <td><input type="text" name="gable_roof_tpftj4" id="gable_roof_tpftj4" value="4.00" /></td>
            <td></td> 
            <td></td> 
            <td><input type="text" name="gable_roof_total4" id="gable_roof_total4" value="0.00" /></td>     
          </tr>
           <tr>
            <th width="20%">Paint</th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%">Project SQM</th>
            <th width="10%">Methodology:</th>
            <th width="10%">Price per SQM</th>
            <th width="10%">Total lineal meters need This Job</th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td>Paint Allowance</td>
          	<td></td>
            <td></td>
            <td><input type="text" name="gable_roof_ps5" id="gable_roof_ps5" value="0.00" /></td>
            <td><input type="text" name="gable_roof_pps5" id="gable_roof_pps5" value="7.00" /></td>
            <td></td>
            <td></td>
            <td></td> 
            <td></td> 
            <td><input type="text" name="gable_roof_total5" id="gable_roof_total5" value="0.00" /></td>   
          </tr>
           <tr>
            <th width="20%">Concrete</th>
            <th width="10%">Cost per Bag</th>
            <th width="10%"></th>
            <th width="10%">Project SQM</th>
            <th width="10%">Methodology:</th>
            <th width="10%">Bags per SQM</th>
            <th width="10%">Total bags</th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td>20kg Bag Pre Mix concrete</td>
          	<td><input type="text" name="gable_roof_cpb6" id="gable_roof_cpb6" value="7.00" /></td>
            <td></td>
            <td><input type="text" name="gable_roof_ps6" id="gable_roof_ps6" value="0.00" /></td>
            <td></td>
            <td><input type="text" name="gable_roof_bps6" id="gable_roof_bps6" value="0.66" /></td>
            <td><input type="text" name="gable_roof_tb6" id="gable_roof_tb6" value="0.00" /></td>
            <td></td> 
            <td></td> 
            <td><input type="text" name="gable_roof_total6" id="gable_roof_total6" value="0.00" /></td>   
          </tr>
           <tr>
            <th width="20%">Stirup</th>
            <th width="10%">Cost per post</th>
            <th width="10%"></th>
            <th width="10%">Project SQM</th>
            <th width="10%">Methodology:</th>
            <th width="10%">Total Posts</th>
            <th width="10%">Round Up</th>
            <th width="10%">Total Posts</th>
            <th width="10%"></th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td>Full Stirup Post Anchor</td>
          	<td><input type="text" name="gable_roof_cpp7" id="gable_roof_cpp7" value="8.00" /></td>
            <td></td>
            <td><input type="text" name="gable_roof_ps7" id="gable_roof_ps7" value="0.00" /></td>
            <td></td>
            <td><input type="text" name="gable_roof_tp7" id="gable_roof_tp7" value="0.00" /></td>
            <td><input type="text" name="gable_roof_ru7" id="gable_roof_ru7" value="1.00" /></td>
            <td><input type="text" name="gable_roof_tp17" id="gable_roof_tp17" value="0.00" /></td> 
            <td></td> 
            <td><input type="text" name="gable_roof_total7" id="gable_roof_total7" value="0.00" /></td>   
          </tr>
           <tr>
            <th width="20%">Brackets</th>
            <th width="10%"></th>
            <th width="10%">Cost per Unit</th>
            <th width="10%">Project SQM</th>
            <th width="10%">Methodology:</th>
            <th width="10%">Units Per SQM</th>
            <th width="10%">Total Units</th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td>Roof extenda Brackets</td>
          	<td></td>
            <td><input type="text" name="gable_roof_cpu8" id="gable_roof_cpu8" value="65.00" /></td>
            <td><input type="text" name="gable_roof_ps8" id="gable_roof_ps8" value="0.00" /></td>
            <td></td>
            <td><input type="text" name="gable_roof_ups8" id="gable_roof_ups8" value="0.50" /></td>
            <td><input type="text" name="gable_roof_tu8" id="gable_roof_tu8" value="0.00" /></td>
            <td></td> 
            <td></td> 
            <td><input type="text" name="gable_roof_total8" id="gable_roof_total8" value="0.00" /></td>   
          </tr>
           <tr>
            <th width="20%">Wahsers</th>
            <th width="10%"></th>
            <th width="10%">Cost per Bolt</th>
            <th width="10%">Project SQM</th>
            <th width="10%">Total Number of Bolts per SQM</th>
            <th width="10%">Total Number Of Bolts</th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td>M12 x 120mm cup head bolt, nut and washer, galvanized.</td>
          	<td></td>
            <td><input type="text" name="gable_roof_cpu9" id="gable_roof_cpb9" value="2.00" /></td>
            <td><input type="text" name="gable_roof_ps9" id="gable_roof_ps9" value="0.00" /></td>
            <td><input type="text" name="gable_roof_tnobps9" id="gable_roof_tnobps9" value="2.00" /></td>
            <td><input type="text" name="gable_roof_tnob9" id="gable_roof_tnob9" value="0.00" /></td>
            <td></td>
            <td></td> 
            <td></td> 
            <td><input type="text" name="gable_roof_total9" id="gable_roof_total9" value="0.00" /></td>   
          </tr>
           <tr>
            <th width="20%">?????</th>
            <th width="10%"></th>
            <th width="10%">Cost per SQM</th>
            <th width="10%">Project SQM</th>
            <th width="10%">Total Number of Bolts per SQM</th>
            <th width="10%">Total Number Of Bolts</th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td>M12 x 65mm cup head bolt, nut and washer, galvanized</td>
          	<td></td>
            <td><input type="text" name="gable_roof_cps10" id="gable_roof_cps10" value="1.50" /></td>
            <td><input type="text" name="gable_roof_ps10" id="gable_roof_ps10" value="0.00" /></td>
            <td><input type="text" name="gable_roof_tnobps10" id="gable_roof_tnobps10" value="2.00" /></td>
            <td><input type="text" name="gable_roof_tnob10" id="gable_roof_tnob10" value="0.00" /></td>
            <td></td>
            <td></td> 
            <td></td> 
            <td><input type="text" name="gable_roof_total10" id="gable_roof_total10" value="0.00" /></td>  
          </tr>
           <tr>
            <th width="20%">Roffing supply and Install</th>
            <th width="10%"></th>
            <th width="10%">Cost per SQM INC GST</th>
            <th width="10%">Project SQM</th>
            <th width="10%">Methodology:</th>
            <th width="10%">Posts per SQM</th>
            <th width="10%">Total Post For This Job</th>
            <th width="10%">lineal meters per Post</th>
            <th width="10%">Total lineal Meter</th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td>Subcontract Supply and Install of colourbond roofing</td>
          	<td></td>
            <td><input type="text" name="gable_roof_cps11" id="gable_roof_cps11" value="66.00" /></td>
            <td><input type="text" name="gable_roof_ps11" id="gable_roof_ps11" value="0.00" /></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td> 
            <td><input type="text" name="gable_roof_total11" id="gable_roof_total11" value="0.00" /></td>  
          </tr>
          <tr><td colspan="9">
           <h3 style="float:right;">Total:&nbsp;&nbsp;</h3>
           <input type="button" value="Calculate" id="gableroof_calc1" />&nbsp;
           <input type="button" value="Calculate & Use" /></td>
           <td><input type="text" name="gableroof_subtotal1" id="gableroof_subtotal1" value="0.00" class="sub_frame_roof" /></td>
          </tr>
   </table> 
  </div>
  <div id="tab42"><h3>Gable Roof - Treated Pine - Raw Materials</h3><br />
  <table cellpadding="0" cellspacing="0"  width="99%">
         <tr>
            <th width="20%">Material or Action</th>
            <th width="10%">Team Leader Output per Hour</th>
            <th width="10%">Team Member Output per Hour</th>
            <th width="10%">Project SQM</th>
            <th width="10%">Team Output</th>
            <th width="10%">Total Hours</th>
            <th width="10%">Team cost per Hour</th>
            <th width="10%">Team OR person Activity</th>
            <th width="10%"></th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td>Posts, Beams, Rafters Battens, Tie downs, Concrete</td>
          	<td><input type="text" name="gable_pine_tloph1" id="gable_pine_tloph1" value="0.80" /></td>
            <td><input type="text" name="gable_pine_tmoph1" id="gable_pine_tmoph1" value="0.60" /></td>
            <td><input type="text" name="gable_pine_ps1" id="gable_pine_ps1" value="0.00" /></td>
            <td><input type="text" name="gable_pine_to1" id="gable_pine_to1" value="0.00" /></td>
            <td><input type="text" name="gable_pine_th1" id="gable_pine_th1" value="0.00" /></td>
            <td><input type="text" name="gable_pine_tcph1" id="gable_pine_tcph1" value="70.00" /></td>
            <td></td> 
            <td></td> 
            <td><input type="text" name="gable_pine_total1" id="gable_pine_total1" value="0.00" /></td>   
          </tr>
           <tr>
            <th width="20%">Material or Action</th>
            <th width="10%">SQM per Hour</th>
            <th width="10%">Cost including Gst per lineal meter</th>
            <th width="10%">Project SQM</th>
            <th width="10%">Total Hours</th>
            <th width="10%"></th>
            <th width="10%">Team cost per Hour</th>
            <th width="10%">Notes</th>
            <th width="10%"></th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td>Pre Paint all timber </td>
          	<td><input type="text" name="gable_pine_tloph2" id="gable_pine_tloph2" value="3.00" /></td>
            <td></td>
            <td><input type="text" name="gable_pine_ps2" id="gable_pine_ps2" value="0.00" /></td>
            <td><input type="text" name="gable_pine_th2" id="gable_pine_th2" value="0.00" /></td>
            <td></td>
            <td><input type="text" name="gable_pine_tcph2" id="gable_pine_tcph2" value="35.00" /></td>
            <td></td> 
            <td></td> 
            <td><input type="text" name="gable_pine_total1" id="gable_pine_total2" value="0.00" /></td>   
          </tr>
          
           <tr>
            <th width="20%">Material or Action</th>
            <th width="10%">lineal meters per Hour</th>
            <th width="10%">Cost including Gst per lineal meter</th>
            <th width="10%">Project SQM</th>
            <th width="10%">Total Hours</th>
            <th width="10%"></th>
            <th width="10%">Team cost per Hour</th>
            <th width="10%">Notes</th>
            <th width="10%"></th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td>Paint touch ups</td>
          	<td></td>
            <td></td>
            <td><input type="text" name="gable_pine_ps3" id="gable_pine_ps3" value="0.00" /></td>
            <td></td>
            <td></td>
            <td><input type="text" name="gable_pine_tcph3" id="gable_pine_tcph3" value="35.00" /></td>
            <td></td> 
            <td></td> 
            <td><input type="text" name="gable_pine_total3" id="gable_pine_total3" value="0.00" /></td>   
          </tr>
        <tr><td colspan="9"><h3 style="float:right;">Total:&nbsp;&nbsp;</h3>
           <input type="button" value="Calculate" id="gablepine_calc1" />&nbsp;
           <input type="button" value="Calculate & Use" /></td>
           <td><input type="text" name="gablepine_subtotal1" id="gablepine_subtotal1" value="0.00" class="sub_frame_roof" /></td></tr>  
   </table>       
  </div>
  <div id="tab43"><h3>Skillion Roof Method - Hardwood - Raw Materials</h3><br />
  <table cellpadding="0" cellspacing="0"  width="99%">
         <tr>
            <th width="20%">Posts</th>
            <th width="10%"></th>
            <th width="10%">Cost per lineal meter</th>
            <th width="10%">Project SQM</th>
            <th width="10%">lineal meters per SQM</th>
            <th width="10%">Total lineal Mets</th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td>125mm x 125mm F27 ( Post)</td>
          	<td></td>
            <td><input type="text" name="gableskillion_cplm1" id="gableskillion_cplm1" value="40.00" /></td>
            <td><input type="text" name="gableskillion_ps1" id="gableskillion_ps1" value="0.00" /></td>
            <td><input type="text" name="gableskillion_lmps1" id="gableskillion_lmps1" value="0.60" /></td>
            <td><input type="text" name="gableskillion_tlm1" id="gableskillion_tlm1" value="10.20" /></td>
            <td><input type="text" name="gableskillion_total1" id="gableskillion_total1" value="0.00" /></td> 
          </tr>
          <tr>
            <th width="20%">Beams</th>
            <th width="10%"></th>
            <th width="10%">Cost per lineal meter</th>
            <th width="10%">Project SQM</th>
            <th width="10%">lineal meters per SQM</th>
            <th width="10%">Total lineal Mets</th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td>140mm x 35mm F27 (Beams)</td>
          	<td></td>
            <td><input type="text" name="gableskillion_cplm2" id="gableskillion_cplm2" value="9.00" /></td>
            <td><input type="text" name="gableskillion_ps2" id="gableskillion_ps2" value="0.00" /></td>
            <td><input type="text" name="gableskillion_lmps2" id="gableskillion_lmps2" value="0.80" /></td>
            <td><input type="text" name="gableskillion_tlm2" id="gableskillion_tlm2" value="13.60" /></td>
            <td><input type="text" name="gableskillion_total2" id="gableskillion_total2" value="0.00" /></td>   
          </tr>
          <tr>
            <th width="20%">Rafters</th>
            <th width="10%"></th>
            <th width="10%">Cost per lineal meter</th>
            <th width="10%">Project SQM</th>
            <th width="10%">lineal meters per SQM</th>
            <th width="10%">Total lineal Mets</th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td>140mm  x 35mm (Rafters)</td>
          	<td></td>
            <td><input type="text" name="gableskillion_cplm3" id="gableskillion_cplm3" value="9.00" /></td>
            <td><input type="text" name="gableskillion_ps3" id="gableskillion_ps3" value="0.00" /></td>
            <td><input type="text" name="gableskillion_lmps" id="gableskillion_lmps3" value="1.50" /></td>
            <td><input type="text" name="gableskillion_tlm3" id="gableskillion_tlm3" value="0.00" /></td>
            <td><input type="text" name="gableskillion_total3" id="gableskillion_total3" value="0.00" /></td>    
          </tr>
          <tr>
            <th width="20%">Battens</th>
            <th width="10%"></th>
            <th width="10%">Cost per lineal meter</th>
            <th width="10%">Project SQM</th>
            <th width="10%">lineal meters per SQM</th>
            <th width="10%">Total lineal Mets</th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td>70mm x 35  F27 (batten)</td>
          	<td></td>
            <td><input type="text" name="gableskillion_cplm4" id="gableskillion_cplm4" value="5.00" /></td>
            <td><input type="text" name="gableskillion_ps4" id="gableskillion_ps4" value="0.00" /></td>
            <td><input type="text" name="gableskillion_lmps4" id="gableskillion_lmps4" value="1.50" /></td>
            <td><input type="text" name="gableskillion_tlm4" id="gableskillion_tlm4" value="0.00" /></td>
            <td><input type="text" name="gableskillion_total4" id="gableskillion_total4" value="0.00" /></td>  
          </tr>
          <tr>
            <th width="20%">Paint</th>
            <th width="10%">Cost per litre</th>
            <th width="10%">Cost per lineal meter</th>
            <th width="10%">Project SQM</th>
            <th width="10%">litres per SQM</th>
            <th width="10%">Total litres Needed</th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td>Paint</td>
          	<td><input type="text" name="gableskillion_cplm5" id="gableskillion_cplm5" value="20.00" /></td>
            <td></td>
            <td><input type="text" name="gableskillion_ps5" id="gableskillion_ps5" value="0.00" /></td>
            <td><input type="text" name="gableskillion_lmps5" id="gableskillion_lmps5" value="0.083" /></td>
            <td><input type="text" name="gableskillion_tlm5" id="gableskillion_tlm5" value="0.00" /></td>
            <td><input type="text" name="gableskillion_total5" id="gableskillion_total5" value="0.00" /></td>  
          </tr>
          <tr>
            <th width="20%">Concrete</th>
            <th width="10%">Cost per Bag</th>
            <th width="10%">Cost per lineal meter</th>
            <th width="10%">Project SQM</th>
            <th width="10%">bags per SQM</th>
            <th width="10%">Total bags</th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td>20kg Bag Pre Mix concrete</td>
          	<td><input type="text" name="gableskillion_cplm6" id="gableskillion_cplm6" value="7.00" /></td>
            <td></td>
            <td><input type="text" name="gableskillion_ps6" id="gableskillion_ps6" value="0.00" /></td>
            <td><input type="text" name="gableskillion_lmps6" id="gableskillion_lmps6" value="0.67" /></td>
            <td><input type="text" name="gableskillion_tlm6" id="gableskillion_tlm6" value="0.00" /></td>
            <td><input type="text" name="gableskillion_total6" id="gableskillion_total6" value="0.00" /></td>    
          </tr>
          <tr>
            <th width="20%">Screws</th>
            <th width="10%"></th>
            <th width="10%">Cost per SQM </th>
            <th width="10%">Project SQM</th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td>Screw Allowance</td>
          	<td></td>
            <td><input type="text" name="gableskillion_cplm7" id="gableskillion_cplm7" value="5.00" /></td>
            <td><input type="text" name="gableskillion_ps7" id="gableskillion_ps7" value="0.00" /></td>
            <td></td>
            <td></td>
            <td><input type="text" name="gableskillion_total7" id="gableskillion_total7" value="0.00" /></td>    
          </tr>
          <tr>
            <th width="20%">Roffing supply and Install</th>
            <th width="10%"></th>
            <th width="10%">Cost per SQM INC GST</th>
            <th width="10%">Project SQM</th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td>Subcontract Supply and Install of colourbond roofing</td>
          	<td></td>
            <td><input type="text" name="gableskillion_cplm8" id="gableskillion_cplm8" value="66.00" /></td>
            <td><input type="text" name="gableskillion_ps8" id="gableskillion_ps8" value="0.00" /></td>
            <td></td>
            <td></td>
            <td><input type="text" name="gableskillion_total8" id="gableskillion_total8" value="0.00" /></td>   
          </tr>
         <tr><td colspan="6"><h3 style="float:right;">Total:&nbsp;&nbsp;</h3>
           <input type="button" value="Calculate" id="gableskillion_calc1" />&nbsp;
           <input type="button" value="Calculate & Use" /></td>
           <td><input type="text" name="gableskillion_subtotal1" id="gableskillion_subtotal1" value="0.00" class="sub_frame_roof"/></td></tr>  
    </table>      
  </div>
  <div id="tab44"><h3>Skillion Roof Method - Hardwood - Labour</h3><br />
   <table cellpadding="0" cellspacing="0"  width="99%">
         <tr>
            <th width="20%">Material or Action</th>
            <th width="10%">Team Leader Output per Hour </th>
            <th width="10%">Team Member Output per Hour</th>
            <th width="10%">Project SQM</th>
            <th width="10%">Team Output</th>
            <th width="10%">Total Hours</th>
            <th width="10%">Team cost per Hour</th>
            <th width="10%">Notes</th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td>Posts, Beams, Rafters Battens, Tie downs, Concrete</td>
          	<td><input type="text" name="gableskillionlabour_tloph1" id="gableskillionlabour_tloph1" value="0.60" /></td>
            <td><input type="text" name="gableskillionlabour_tmoph1" id="gableskillionlabour_tmoph1" value="0.40" /></td>
            <td><input type="text" name="gableskillionlabour_ps1" id="gableskillionlabour_ps1" value="0.00" /></td>
            <td><input type="text" name="gableskillionlabour_to1" id="gableskillionlabour_to1" value="0.00" /></td>
            <td><input type="text" name="gableskillionlabour_th1" id="gableskillionlabour_th1" value="0.00" /></td>
            <td><input type="text" name="gableskillionlabour_tcph1" id="gableskillionlabour_tcph1" value="70.00" /></td> 
            <td></td>
            <td><input type="text" name="gableskillionlabour_total1" id="gableskillionlabour_total1" value="0.00" /></td>            
          </tr>
          <tr>
            <th width="20%">Material or Action</th>
            <th width="10%">lineal meters per Hour</th>
            <th width="10%">Total House</th>
            <th width="10%">Project SQM</th>
            <th width="10%">Total meters</th>
            <th width="10%"></th>
            <th width="10%">Team cost per Hour</th>
            <th width="10%">Notes</th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td>Pre Paint all timber</td>
          	<td><input type="text" name="gableskillionlabour_tloph2" id="gableskillionlabour_tloph2" value="10.00" /></td>
            <td><input type="text" name="gableskillionlabour_tmoph2" id="gableskillionlabour_tmoph2" value="0.00" /></td>
            <td><input type="text" name="gableskillionlabour_ps2" id="gableskillionlabour_ps2" value="0.00" /></td>
            <td><input type="text" name="gableskillionlabour_to2" id="gableskillionlabour_to2" value="0.00" /></td>
            <td><input type="text" name="gableskillionlabour_th2" id="gableskillionlabour_th2" value="3.00" /></td>
            <td><input type="text" name="gableskillionlabour_tcph2" id="gableskillionlabour_tcph2" value="35.00" /></td> 
            <td></td>
            <td><input type="text" name="gableskillionlabour_total2" id="gableskillionlabour_total2" value="0.00" /></td>      
          </tr>
           <tr>
            <th width="20%">Material or Action</th>
            <th width="10%">SQM per hour</th>
            <th width="10%">Cost including Gst per lineal meter</th>
            <th width="10%">Project SQM</th>
            <th width="10%">Total Hours</th>
            <th width="10%"></th>
            <th width="10%">Team cost per Hour</th>
            <th width="10%">Notes</th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td>Paint touch ups</td>
          	<td><input type="text" name="gableskillionlabour_tloph3" id="gableskillionlabour_tloph3" value="6.00" /></td>
            <td></td>
            <td><input type="text" name="gableskillionlabour_ps3" id="gableskillionlabour_ps3" value="0.00" /></td>
            <td><input type="text" name="gableskillionlabour_to3" id="gableskillionlabour_to3" value="0.00" /></td>
            <td></td>
            <td><input type="text" name="gableskillionlabour_tcph3" id="gableskillionlabour_tcph3" value="35.00" /></td> 
            <td></td>
            <td><input type="text" name="gableskillionlabour_total3" id="gableskillionlabour_total3" value="0.00" /></td> 
          </tr>
			<tr><td colspan="8"><h3 style="float:right;">Total:&nbsp;&nbsp;</h3>
           <input type="button" value="Calculate" id="gableskillionlabour_calc" />&nbsp;
           <input type="button" value="Calculate & Use" /></td>
           <td><input type="text" name="gableskillionlabour_subtotal" id="gableskillionlabour_subtotal" value="0.00" class="sub_frame_roof"/></td>
           </tr>
      </table>
  </div>
  <div id="tab45"><h3>Skllion Roof - Treated Pine -  Raw Materials</h3><br />
  <table cellpadding="0" cellspacing="0"  width="99%">
         <tr>
            <th width="20%">Posts</th>
            <th width="10%"></th>
            <th width="10%">Cost per lineal meter</th>
            <th width="10%">Project SQM</th>
            <th width="10%">lineal meters per SQM</th>
            <th width="10%"> Total lineal meters required</th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td>90mm x 90mm H4 LOSP Treat Pine (posts)</td>
          	<td></td>
            <td><input type="text" name="gableskillionraw_cplm1" id="gableskillionraw_cplm1" value="13.00" /></td>
            <td><input type="text" name="gableskillionraw_ps1" id="gableskillionraw_ps1" value="0.00" /></td>
            <td><input type="text" name="gableskillionraw_lmps1" id="gableskillionraw_lmps1" value="0.60" /></td>
            <td><input type="text" name="gableskillionraw_tlmr1" id="gableskillionraw_tlmr1" value="0.00" /></td>
            <td><input type="text" name="gableskillionraw_total1" id="gableskillionraw_total1" value="0.00" /></td> 
          </tr>
          <tr>
            <th width="20%">Beams</th>
            <th width="10%">Minimum Length</th>
            <th width="10%">Cost per lineal meter</th>
            <th width="10%">Project SQM</th>
            <th width="10%">lineal meters per SQM</th>
            <th width="10%">Total lineal meters required</th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td>240mm x 45mm Treated Pine (beam)</td>
          	<td>5.4 meters</td>
            <td><input type="text" name="gableskillionraw_cplm2" id="gableskillionraw_cplm2" value="20.00" /></td>
            <td><input type="text" name="gableskillionraw_ps2" id="gableskillionraw_ps2" value="0.00" /></td>
            <td><input type="text" name="gableskillionraw_lmps2" id="gableskillionraw_lmps2" value="0.41" /></td>
            <td><input type="text" name="gableskillionraw_tlmr2" id="gableskillionraw_tlmr2" value="0.00" /></td>
            <td><input type="text" name="gableskillionraw_total2" id="gableskillionraw_total2" value="0.00" /></td>    
          </tr>
          <tr>
            <th width="20%">Rafters</th>
            <th width="10%"></th>
            <th width="10%">Cost per lineal meter</th>
            <th width="10%">Project SQM</th>
            <th width="10%">lineal meters per SQM</th>
            <th width="10%">Total lineal Mets</th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td>190mm x 45mm Treated Pine (rafters)</td>
          	<td></td>
            <td><input type="text" name="gableskillionraw_cplm3" 	id="gableskillionraw_cplm3" 	value="14.00" /></td>
            <td><input type="text" name="gableskillionraw_ps3" 		id="gableskillionraw_ps3" 		value="0.00" /></td>
            <td><input type="text" name="gableskillionraw_lmps3" 	id="gableskillionraw_lmps3" 	value="0.46" /></td>
            <td><input type="text" name="gableskillionraw_tlmr3" 	id="gableskillionraw_tlmr3" 	value="0.00" /></td>
            <td><input type="text" name="gableskillionraw_total3" 	id="gableskillionraw_total3" 	value="0.00" /></td>
          </tr>
          <tr>
            <th width="20%">Battens</th>
            <th width="10%"></th>
            <th width="10%">Cost per lineal meter</th>
            <th width="10%">Project SQM</th>
            <th width="10%">lineal meters per SQM</th>
            <th width="10%">Total lineal Mets</th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td>70mm x 45mm Treated Pine ) (battens)</td>
          	<td>(5.4 lenghts required)</td>
            <td><input type="text" name="gableskillionraw_cplm4" 	id="gableskillionraw_cplm4" 	value="3.50" /></td>
            <td><input type="text" name="gableskillionraw_ps4" 		id="gableskillionraw_ps4" 		value="0.00" /></td>
            <td><input type="text" name="gableskillionraw_lmps4" 	id="gableskillionraw_lmps4" 	value="0.90" /></td>
            <td><input type="text" name="gableskillionraw_tlmr4" 	id="gableskillionraw_tlmr4" 	value="0.00" /></td>
            <td><input type="text" name="gableskillionraw_total4" 	id="gableskillionraw_total4" 	value="0.00" /></td>  
          </tr>
          <tr>
            <th width="20%">Paint</th>
            <th></th>
            <th width="10%">Cost per litre</th>
            <th width="10%">Project SQM</th>
            <th width="10%">litres per SQM</th>
            <th width="10%">Total litres Needed</th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td>Paint</td>
          	<td></td>
            <td><input type="text" name="gableskillionraw_cplm5" 	id="gableskillionraw_cplm5" 	value="20.00" /></td>
            <td><input type="text" name="gableskillionraw_ps5" 		id="gableskillionraw_ps5" 		value="0.00" /></td>
            <td><input type="text" name="gableskillionraw_lmps5" 	id="gableskillionraw_lmps5" 	value="0.083" /></td>
            <td><input type="text" name="gableskillionraw_tlmr5" 	id="gableskillionraw_tlmr5" 	value="0.00" /></td>
            <td><input type="text" name="gableskillionraw_total5" 	id="gableskillionraw_total5" 	value="0.00" /></td> 
          </tr>
          <tr>
            <th width="20%">Concrete</th>
            <th width="10%"></th>
            <th width="10%">Cost per Bag</th>
            <th width="10%">Project SQM</th>
            <th width="10%">bags per SQM</th>
            <th width="10%">Total bags</th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td>20kg Bag Pre Mix concrete</td>
          	<td></td>
            <td><input type="text" name="gableskillionraw_cplm6" 	id="gableskillionraw_cplm6" 	value="7.00" /></td>
            <td><input type="text" name="gableskillionraw_ps6" 		id="gableskillionraw_ps6" 		value="0.00" /></td>
            <td><input type="text" name="gableskillionraw_lmps6" 	id="gableskillionraw_lmps6" 	value="0.67" /></td>
            <td><input type="text" name="gableskillionraw_tlmr6" 	id="gableskillionraw_tlmr6" 	value="0.00" /></td>
            <td><input type="text" name="gableskillionraw_total6" 	id="gableskillionraw_total6" 	value="0.00" /></td>   
          </tr>
          <tr>
            <th width="20%">Anchors</th>
            <th width="10%"></th>
            <th width="10%">Cost per SQM </th>
            <th width="10%">Project SQM</th>
            <th width="10%">Posts per SQM</th>
            <th width="10%">Total Posts Required</th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td>Full Stirup Post Anchor</td>
          	<td></td>
            <td><input type="text" name="gableskillionraw_cplm7" 	id="gableskillionraw_cplm7" 	value="8.00" /></td>
            <td><input type="text" name="gableskillionraw_ps7" 		id="gableskillionraw_ps7" 		value="0.00" /></td>
            <td><input type="text" name="gableskillionraw_lmps7" 	id="gableskillionraw_lmps7" 	value="0.20" /></td>
            <td><input type="text" name="gableskillionraw_tlmr7" 	id="gableskillionraw_tlmr7" 	value="0.00" /></td>
            <td><input type="text" name="gableskillionraw_total7" 	id="gableskillionraw_total7" 	value="0.00" /></td>   
          </tr>
          <tr>
            <th width="20%">Screws</th>
            <th width="10%"></th>
            <th width="10%">Cost per SQM INC GST</th>
            <th width="10%">Project SQM</th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td>Screw Allowance</td>
          	<td></td>
            <td><input type="text" name="gableskillionraw_cplm8" 	id="gableskillionraw_cplm8" 	value="5.00" /></td>
            <td><input type="text" name="gableskillionraw_ps8" 		id="gableskillionraw_ps8" 		value="0.00" /></td>
            <td></td>
            <td></td>
            <td><input type="text" name="gableskillionraw_total8" 	id="gableskillionraw_total8" 	value="0.00" /></td>  
          </tr>
          <tr>
            <th width="20%">Roffing supply and Install</th>
            <th width="10%"></th>
            <th width="10%">Cost per SQM INC GST</th>
            <th width="10%">Project SQM</th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td>Subcontract Supply and Install of colourbond roofing/ Laserlight</td>
          	<td></td>
            <td><input type="text" name="gableskillionraw_cplm9" 	id="gableskillionraw_cplm9" 	value="66.00" /></td>
            <td><input type="text" name="gableskillionraw_ps9" 		id="gableskillionraw_ps9" 		value="0.00" /></td>
            <td></td>
            <td></td>
            <td><input type="text" name="gableskillionraw_total9" 	id="gableskillionraw_total9" 	value="0.00" /></td>   
          </tr>
         <tr><td colspan="6"><h3 style="float:right;">Total:&nbsp;&nbsp;</h3>
           <input type="button" value="Calculate" id="gableskillionraw_calc" />&nbsp;
           <input type="button" value="Calculate & Use" /></td>
           <td><input type="text" name="gableskillionraw_subtotal" id="gableskillionraw_subtotal" value="0.00" class="sub_frame_roof"/></td>
         </tr>
       </table>   
  </div>
  <div id="tab46"><h3>Skillion Roof -Treat Pine- Labour</h3><br />
  <table cellpadding="0" cellspacing="0"  width="99%">
         <tr>
            <th width="20%">Build</th>
            <th width="10%">Team Leader Output per Hour </th>
            <th width="10%">Team Member Output per Hour</th>
            <th width="10%">Project SQM</th>
            <th width="10%">Team Output</th>
            <th width="10%">Total Hours</th>
            <th width="10%">Hourly Allowance</th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td>Posts, Beams, Rafters Battens, Tie downs, Concrete</td>
          	<td><input type="text" name="rooftreatedpine_tloph1"  id="rooftreatedpine_tloph1" value="0.80" /></td>
            <td><input type="text" name="rooftreatedpine_tmoph1"  id="rooftreatedpine_tmoph1" value="0.60" /></td>
            <td><input type="text" name="rooftreatedpine_ps1" 	  id="rooftreatedpine_ps1" value="0.00" /></td>
            <td><input type="text" name="rooftreatedpine_to1" 	  id="rooftreatedpine_to1" value="1.40" /></td>
            <td><input type="text" name="rooftreatedpine_th1" 	  id="rooftreatedpine_th1" value="0.00" /></td>
            <td><input type="text" name="rooftreatedpine_ha1" 	  id="rooftreatedpine_ha1" value="70.00" /></td>
            <td><input type="text" name="rooftreatedpine_total1"  id="rooftreatedpine_total1" value="0.00" /></td>            
          </tr>
          <tr>
            <th width="20%">Paint</th>
            <th width="10%">lineal meters per Hour</th>
            <th width="10%">lineal meters per SQM</th>
            <th width="10%">Project SQM</th>
            <th width="10%">Total lineal meters</th>
            <th width="10%">Total Hours</th>
            <th width="10%">Hourly Allowance</th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td>Pre Paint all timber</td>
          	<td><input type="text" name="rooftreatedpine_tloph2" 	id="rooftreatedpine_tloph2" value="10.00" /></td>
            <td><input type="text" name="rooftreatedpine_tmoph2" 	id="rooftreatedpine_tmoph2" value="3.20" /></td>
            <td><input type="text" name="rooftreatedpine_ps2" 		id="rooftreatedpine_ps2" value="0.00" /></td>
            <td><input type="text" name="rooftreatedpine_to2" 		id="rooftreatedpine_to2" value="0.00" /></td>
            <td><input type="text" name="rooftreatedpine_th2" 		id="rooftreatedpine_th2" value="0.00" /></td>
            <td><input type="text" name="rooftreatedpine_ha2" 		id="rooftreatedpine_ha2" value="35.00" /></td>
            <td><input type="text" name="rooftreatedpine_total2" 	id="rooftreatedpine_total2" value="0.00" /></td>           
          </tr>
           <tr>
            <th width="20%">Touch Up</th>
            <th width="10%">lineal meters per Hour</th>
            <th width="10%">SQM per Hour</th>
            <th width="10%">Project SQM</th>
            <th width="10%"></th>
            <th width="10%">Total Hours</th>
        	<th></th>
            <th width="10%">Total</th>
          </tr>
         <tr><td colspan="7"><h3 style="float:right;">Total:&nbsp;&nbsp;</h3>
           <input type="button" value="Calculate" id="rooftreatedpine_calc" />&nbsp;
           <input type="button" value="Calculate & Use" /></td>
           <td><input type="text" name="rooftreatedpine_subtotal" id="rooftreatedpine_subtotal" value="0.00" class="sub_frame_roof"/></td>
         </tr>
  </table>  
  </div>
  <div id="tab47"><h3>Pergola Frame - Non Roof - Treated Pine - Raw Materials (Pergola Treated Pine)</h3>
  <br />
   <table cellpadding="0" cellspacing="0"  width="99%">
         <tr>
            <th width="20%">Posts</th>
            <th width="10%"></th>
            <th width="10%">Cost per lineal meter</th>
            <th width="10%">Project SQM</th>
            <th width="10%">lineal meters per SQM</th>
            <th width="10%"> Total lineal meters required</th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td>90mm x 90mm H4 LOSP Treat Pine (posts)</td>
          	<td></td>
            <td><input type="text" name="rooftreatedpinerawm_cplm1" 	id="rooftreatedpinerawm_cplm1" value="13.00" /></td>
            <td><input type="text" name="rooftreatedpinerawm_pm1" 	id="rooftreatedpinerawm_pm1" value="0.00" /></td>
            <td><input type="text" name="rooftreatedpinerawm_lmps1" 	id="rooftreatedpinerawm_lmps1" value="0.60" /></td>
            <td><input type="text" name="rooftreatedpinerawm_tlmr1" 	id="rooftreatedpinerawm_tlmr1" value="0.00" /></td>
            <td><input type="text" name="rooftreatedpinerawm_total1" id="rooftreatedpinerawm_total1" value="0.00" /></td>
          </tr>
		 <tr>
            <th width="20%">Beams</th>
            <th width="10%">Minimum Length</th>
            <th width="10%">Cost per lineal meter</th>
            <th width="10%">Project SQM</th>
            <th width="10%">lineal meters per SQM</th>
            <th width="10%"> Total lineal meters required</th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td>9240mm x 45mm Treated Pine (beam)</td>
          	<td>5.4 meters</td>
            <td><input type="text" name="rooftreatedpinerawm_cplm2" 	id="rooftreatedpinerawm_cplm2" value="20.00" /></td>
            <td><input type="text" name="rooftreatedpinerawm_pm2" 	id="rooftreatedpinerawm_pm2" value="0.00" /></td>
            <td><input type="text" name="rooftreatedpinerawm_lmps2" 	id="rooftreatedpinerawm_lmps2" value="0.41" /></td>
            <td><input type="text" name="rooftreatedpinerawm_tlmr2" 	id="rooftreatedpinerawm_tlmr2" value="0.00" /></td>
            <td><input type="text" name="rooftreatedpinerawm_total2" id="rooftreatedpinerawm_total2" value="0.00" /></td>
          </tr>
          
          <tr>
            <th width="20%">Rafters</th>
            <th width="10%"></th>
            <th width="10%">Cost per lineal meter</th>
            <th width="10%">Project SQM</th>
            <th width="10%">lineal meters per SQM</th>
            <th width="10%"> Total lineal meters required</th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td>190mm x 45mm Treated Pine (rafters)</td>
          	<td></td>
            <td><input type="text" name="rooftreatedpinerawm_cplm3" 	id="rooftreatedpinerawm_cplm3"  value="14.00" /></td>
            <td><input type="text" name="rooftreatedpinerawm_pm3" 		id="rooftreatedpinerawm_pm3" 	value="0.00" /></td>
            <td><input type="text" name="rooftreatedpinerawm_lmps3" 	id="rooftreatedpinerawm_lmps3"  value="0.46" /></td>
            <td><input type="text" name="rooftreatedpinerawm_tlmr3" 	id="rooftreatedpinerawm_tlmr3"  value="0.00" /></td>
            <td><input type="text" name="rooftreatedpinerawm_total3" 	id="rooftreatedpinerawm_total3" value="0.00" /></td>
          </tr>
          <tr>
            <th width="20%">Battens</th>
            <th width="10%">Minimum Length</th>
            <th width="10%">Cost per lineal meter</th>
            <th width="10%">Project SQM</th>
            <th width="10%">lineal meters per SQM</th>
            <th width="10%"> Total lineal meters required</th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td>70mm x 45mm Treated Pine ) (battens)</td>
          	<td>(5.4 lenghts required)</td>
            <td><input type="text" name="rooftreatedpinerawm_cplm4" 	id="rooftreatedpinerawm_cplm4"  value="3.50" /></td>
            <td><input type="text" name="rooftreatedpinerawm_pm4" 		id="rooftreatedpinerawm_pm4" 	value="0.00" /></td>
            <td><input type="text" name="rooftreatedpinerawm_lmps4" 	id="rooftreatedpinerawm_lmps4"  value="0.90" /></td>
            <td><input type="text" name="rooftreatedpinerawm_tlmr4" 	id="rooftreatedpinerawm_tlmr4"  value="0.00" /></td>
            <td><input type="text" name="rooftreatedpinerawm_total4" 	id="rooftreatedpinerawm_total4" value="0.00" /></td>
          </tr>
          <tr>
            <th width="20%">Paint</th>
            <th width="10%"></th>
            <th width="10%">Cost per litre</th>
            <th width="10%">Project SQM</th>
            <th width="10%">litres per SQM</th>
            <th width="10%">Total litres needed</th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td>Paint</td>
          	<td></td>
            <td><input type="text" name="rooftreatedpinerawm_cplm5" 	id="rooftreatedpinerawm_cplm5"  value="20.00" /></td>
            <td><input type="text" name="rooftreatedpinerawm_pm5" 		id="rooftreatedpinerawm_pm5" 	value="0.00" /></td>
            <td><input type="text" name="rooftreatedpinerawm_lmps5" 	id="rooftreatedpinerawm_lmps5"  value="0.083" /></td>
            <td><input type="text" name="rooftreatedpinerawm_tlmr5" 	id="rooftreatedpinerawm_tlmr5"  value="0.00" /></td>
            <td><input type="text" name="rooftreatedpinerawm_total5" 	id="rooftreatedpinerawm_total5" value="0.00" /></td>
          </tr>
          <tr>
            <th width="20%">Concrete</th>
            <th width="10%"></th>
            <th width="10%">Cost per lineal meter</th>
            <th width="10%">Project SQM</th>
            <th width="10%">lineal meters per SQM</th>
            <th width="10%"> Total lineal meters required</th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td>20kg Bag Pre Mix concrete</td>
          	<td></td>
            <td><input type="text" name="rooftreatedpinerawm_cplm6" 	id="rooftreatedpinerawm_cplm6"  value="7.00" /></td>
            <td><input type="text" name="rooftreatedpinerawm_pm6" 		id="rooftreatedpinerawm_pm6" 	value="0.00" /></td>
            <td><input type="text" name="rooftreatedpinerawm_lmps6" 	id="rooftreatedpinerawm_lmps6"  value="0.67" /></td>
            <td><input type="text" name="rooftreatedpinerawm_tlmr6" 	id="rooftreatedpinerawm_tlmr6"  value="0.00" /></td>
            <td><input type="text" name="rooftreatedpinerawm_total6" 	id="rooftreatedpinerawm_total6" value="0.00" /></td>
          </tr>
          <tr>
            <th width="20%">Anchors</th>
            <th width="10%"></th>
            <th width="10%">Cost per lineal meter</th>
            <th width="10%">Project SQM</th>
            <th width="10%">lineal meters per SQM</th>
            <th width="10%"> Total lineal meters required</th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td>Full Stirup Post Anchor</td>
          	<td></td>
            <td><input type="text" name="rooftreatedpinerawm_cplm7" 	id="rooftreatedpinerawm_cplm7"  value="8.00" /></td>
            <td><input type="text" name="rooftreatedpinerawm_pm7" 		id="rooftreatedpinerawm_pm7" 	value="0.00" /></td>
            <td><input type="text" name="rooftreatedpinerawm_lmps7" 	id="rooftreatedpinerawm_lmps7"  value="0.20" /></td>
            <td><input type="text" name="rooftreatedpinerawm_tlmr7" 	id="rooftreatedpinerawm_tlmr7"  value="0.00" /></td>
            <td><input type="text" name="rooftreatedpinerawm_total7" 	id="rooftreatedpinerawm_total7" value="0.00" /></td>
          </tr>
          <tr>
            <th width="20%">Screws</th>
            <th width="10%"></th>
            <th width="10%">Cost per lineal meter</th>
            <th width="10%">Project SQM</th>
            <th width="10%">lineal meters per SQM</th>
            <th width="10%"> Total lineal meters required</th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td>Screw Allowance</td>
          	<td></td>
            <td><input type="text" name="rooftreatedpinerawm_cplm8" 	id="rooftreatedpinerawm_cplm8"  value="5.00" /></td>
            <td><input type="text" name="rooftreatedpinerawm_pm8" 		id="rooftreatedpinerawm_pm8" 	value="0.00" /></td>
            <td><input type="text" name="rooftreatedpinerawm_lmps8" 	id="rooftreatedpinerawm_lmps8"  value="0.00" /></td>
            <td><input type="text" name="rooftreatedpinerawm_tlmr8" 	id="rooftreatedpinerawm_tlmr8"  value="0.00" /></td>
            <td><input type="text" name="rooftreatedpinerawm_total8" 	id="rooftreatedpinerawm_total8" value="0.00" /></td>
          </tr>
          <tr><td colspan="6"><h3 style="float:right;">Total:&nbsp;&nbsp;</h3>
           <input type="button" value="Calculate" id="rooftreatedpinerawm_calc" />&nbsp;
           <input type="button" value="Calculate & Use" /></td>
           <td><input type="text" name="rooftreatedpinerawm_subtotal" id="rooftreatedpinerawm_subtotal" value="0.00" class="sub_frame_roof" /></td>
         </tr>  
  </table>       
  </div>
  <div id="tab48"><h3>Pergola Frame - Non Roof - Treated Pine -Labour</h3><br />
   <table cellpadding="0" cellspacing="0"  width="99%">
         <tr>
            <th width="20%">Build</th>
            <th width="10%">Team Leader Output per Hour</th>
            <th width="10%">Team Member Output per Hour</th>
            <th width="10%">Project SQM</th>
            <th width="10%">Team Output</th>
            <th width="10%">Total Hours</th>
            <th width="10%">Hourly Allowance</th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td>Posts, Beams, Rafters Battens, Tie downs, Concrete</td>
            <td><input type="text" name="rooftreatedpinelabour_tloph1" 	id="rooftreatedpinelabour_tloph1" value="0.80" /></td>
            <td><input type="text" name="rooftreatedpinelabour_tmoph1" 	id="rooftreatedpinelabour_tmoph1" value="0.60" /></td>
            <td><input type="text" name="rooftreatedpinelabour_ps1" 	id="rooftreatedpinelabour_ps1" 	  value="0.00" /></td>
            <td><input type="text" name="rooftreatedpinelabour_to1" 	id="rooftreatedpinelabour_to1"    value="1.40" /></td>
            <td><input type="text" name="rooftreatedpinelabour_th1" 	id="rooftreatedpinelabour_th1"    value="0.00" /></td>
            <td><input type="text" name="rooftreatedpinelabour_ha1" 	id="rooftreatedpinelabour_ha1"    value="70.00" /></td>
            <td><input type="text" name="rooftreatedpinelabour_total1" 	id="rooftreatedpinelabour_total1" value="0.00" /></td>
          </tr>
          <tr>
            <th width="20%">Paint</th>
            <th width="10%">Team Member lineal meters per Hour</th>
            <th width="10%">lineal meters per SQM</th>
            <th width="10%">Project SQM</th>
            <th width="10%">Total lineal meters</th>
            <th width="10%">Total Hours</th>
            <th width="10%">Hourly Allowance</th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td>Pre Paint all timber</td>
            <td><input type="text" name="rooftreatedpinelabour_tloph2" 	id="rooftreatedpinelabour_tloph2" value="10.00" /></td>
            <td><input type="text" name="rooftreatedpinelabour_tmoph2" 	id="rooftreatedpinelabour_tmoph2" value="3.20" /></td>
            <td><input type="text" name="rooftreatedpinelabour_ps2" 	id="rooftreatedpinelabour_ps2" 	  value="0.00" /></td>
            <td><input type="text" name="rooftreatedpinelabour_to2" 	id="rooftreatedpinelabour_to2"    value="0.00" /></td>
            <td><input type="text" name="rooftreatedpinelabour_th2" 	id="rooftreatedpinelabour_th2"    value="0.00" /></td>
            <td><input type="text" name="rooftreatedpinelabour_ha2" 	id="rooftreatedpinelabour_ha2"    value="35.00" /></td>
            <td><input type="text" name="rooftreatedpinelabour_total2" 	id="rooftreatedpinelabour_total2" value="0.00" /></td>
          </tr>
          <tr>
            <th width="20%">Touch Up</th>
            <th width="10%">lineal meters per Hour</th>
            <th width="10%">SQM per Hour</th>
            <th width="10%">Project SQM</th>
            <th width="10%"></th>
            <th width="10%">Total Hours</th>
            <th width="10%"></th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td>Paint touch ups</td>
            <td></td>
            <td><input type="text" name="rooftreatedpinelabour_tmoph3" 	id="rooftreatedpinelabour_tmoph3" value="6.00" /></td>
            <td><input type="text" name="rooftreatedpinelabour_ps3" 	id="rooftreatedpinelabour_ps3" 	  value="0.00" /></td>
            <td></td>
            <td><input type="text" name="rooftreatedpinelabour_th3" 	id="rooftreatedpinelabour_th3"    value="0.00" /></td>
            <td><input type="text" name="rooftreatedpinelabour_ha3" 	id="rooftreatedpinelabour_ha3"    value="35.00" /></td>
            <td><input type="text" name="rooftreatedpinelabour_total3" 	id="rooftreatedpinelabour_total3" value="0.00" /></td>
          </tr>
          <tr><td colspan="7">
           <h3 style="float:right;">Total:&nbsp;&nbsp;</h3>
               <input type="button" value="Calculate" id="rooftreatedpinelabour_calc" />&nbsp;
               <input type="button" value="Calculate & Use" /></td>
           <td><input type="text" name="rooftreatedpinelabour_subtotal" id="rooftreatedpinelabour_subtotal" value="0.00" class="sub_frame_roof" /></td>
         </tr>   
   </table>      
  </div>
</div>
  <script type="text/javascript">
    $(document).ready( function() {
      $('#tab-Roof').easytabs();
    });
 </script>  
<table cellpadding="0" cellspacing="0" width="99%">
    <tr>
          	  <td colspan="7"><h3 align="right">Total:&nbsp;</h3></td>
          	  <td colspan="2" width="10%"><input type="text" name="roof_all_total" id="roof_all_total" value="0.00" /></td>
    </tr> 
</table>      
</div>
<div id="extras" class="popupdiv">
			<h1>Extra</h1><br />
  <input type="submit" name="extras_value_set" id="extras_value_set" value="Load Value" />       
  
  <div id="tab-extra" class="tab-container">
  <ul class='etabs'>
    <li class='tab'><a href="#tab51">Timber Decking Board Screening<br /> with Hardwood Posts - Labour</a></li>
    <li class='tab'><a href="#tab53">Timber Decking Board Screening with<br /> Hardwood Posts - Labor and Raw Materials</a></li>
    <li class='tab'><a href="#tab54">In Built Seating - Boxed-in with <br /> storage Bench Seat - Raw Materials</a></li>
  </ul>
  <div id="tab51"><h3>Timber Decking Board Screening with Hardwood Posts - Labour</h3> <br />         
    <table cellpadding="0" cellspacing="0"  width="99%">
         <tr>
            <th width="20%">Board Size</th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%">Total SQM (http://www.unitconversion.org/area/square-millimeters-to-square-meters-conversion.html)</th>
            <th width="10%">Lineal Meters per sqm</th>
            <th width="10%">Total Lineal Meters</th>
            <th width="10%">Lineal Meter Rates In GST</th>
            <th width="10%"></th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td>86MM</td>
            <td></td>
            <td></td>
            <td><input type="text" name="roofextra_ts1" id="roofextra_ts1" value="0.00" /></td>
            <td><input type="text" name="roofextra_lmps1" id="roofextra_lmps1" value="{{$exdata[0].cex_timber_lmps1}}" /></td>
            <td><input type="text" name="roofextra_tlm1" id="roofextra_tlm1" value="0.00" /></td>
            <td><input type="text" name="roofextra_lmr1" id="roofextra_lmr1" value="{{$exdata[0].cex_timber_lmr1}}" /></td>
            <td></td>
            <td><input type="text" name="roofextra_total1" id="roofextra_total1" value="0.00" /></td>
          </tr>    
           <tr>
            <th width="20%">Board Size</th>
            <th width="10%">Type of Screw</th>
            <th width="10%"></th>
            <th width="10%">Total SQM</th>
            <th width="10%"></th>
            <th width="10%">Number of screws per SQM - inc gst please change number  comenserate with screw type</th>
            <th width="10%">Cost per unit - inc gst </th>
            <th width="10%">Units Per Job</th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td>84mm-90mm</td>
            <td>10g 50mm square drive, countersunk head, stainless steel metal screw</td>
            <td></td>
            <td><input type="text" name="roofextra_ts2" id="roofextra_ts2" value="0.00" /></td>
            <td></td>
            <td><input type="text" name="roofextra_tlm2" id="roofextra_tlm2" value="55.00" /></td>
            <td><input type="text" name="roofextra_tsw2" id="roofextra_tsw2" value="0.11" /></td>
            <td><input type="text" name="roofextra_upj2" id="roofextra_upj2" value="0.00" /></td>
            <td><input type="text" name="roofextra_total2" id="roofextra_total2" value="0.00" /></td>
          </tr>    
           <tr>
            <th width="20%"></th>
            <th width="10%">Cost Per Litre</th>
            <th width="10%">Litre per SQM</th>
            <th width="10%">Total SQM</th>
            <th width="10%"></th>
            <th width="10%">Project Liters</th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td></td>
            <td><input type="text" name="roofextra_cpl3" id="roofextra_cpl3" value="15.00" /></td>
            <td><input type="text" name="roofextra_lps3" id="roofextra_lps3" value="0.50" /></td>
            <td><input type="text" name="roofextra_ts3" id="roofextra_ts3" value="0.00" /></td>
            <td></td>
            <td><input type="text" name="roofextra_pl3" id="roofextra_pl3" value="0.00" /></td>
            <td></td>
            <td></td>
            <td><input type="text" name="roofextra_total3" id="roofextra_total3" value="0.00" /></td>
          </tr> 
          
           <tr>
            <th width="20%"></th>
            <th width="10%">Type</th>
            <th width="10%">Units Per SQM</th>
            <th width="10%">Total SQM</th>
            <th width="10%"></th>
            <th width="10%">Total Units</th>
            <th width="10%">Cost Per Unit - inc gst</th>
            <th width="10%"></th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td></td>
            <td></td>
            <td><input type="text" name="roofextra_ups4" id="roofextra_ups4" value="0.25" /></td>
            <td><input type="text" name="roofextra_ts4" id="roofextra_ts4" value="0.00" /></td>
            <td></td>
            <td><input type="text" name="roofextra_tu4" id="roofextra_tu4" value="0.00" /></td>
            <td><input type="text" name="roofextra_cpu4" id="roofextra_cpu4" value="5.00" /></td>
            <td></td>
            <td><input type="text" name="roofextra_total4" id="roofextra_total4" value="0.00" /></td>
          </tr>
           <tr>
            <th width="20%">Material</th>
            <th width="10%">Cost Per Linlean Meter</th>
            <th width="10%"></th>
            <th width="10%">Total SQM</th>
            <th width="10%"></th>
            <th width="10%">Lineal Meters Per SSQM</th>
            <th width="10%">Total Lineal Meters</th>
            <th width="10%"></th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td>90mm x 35mm think Klin dried f27 Hardwood Post</td>
            <td><input type="text" name="roofextra_cplm6" id="roofextra_cplm6" value="5.50" /></td>
            <td></td>
            <td><input type="text" name="roofextra_ts6" id="roofextra_ts6" value="0.00" /></td>
            <td></td>
            <td><input type="text" name="roofextra_lmps6" id="roofextra_lmps6" value="1.60" /></td>
            <td><input type="text" name="roofextra_tlm6" id="roofextra_tlm6" value="0.00" /></td>
            <td></td>
            <td><input type="text" name="roofextra_total6" id="roofextra_total6" value="0.00" /></td>
          </tr>                        
		 <tr><td colspan="8"><h3 style="float:right;">Sub Total:&nbsp;&nbsp;</h3></td>
           <td><input type="text" name="roofextra_subtotal" id="roofextra_subtotal" value="0.00" class="sub_frame_roofextra" /></td>
         </tr>   
</table>  <h3>Timber Decking Board Screening with Hardwood Posts - Labour</h3><br />          
      <table cellpadding="0" cellspacing="0"  width="99%">
         <tr>
            <th width="20%">Board</th>
            <th width="10%">JOB SQM</th>
            <th width="10%">Team or Individual Task</th>
            <th width="10%">Team leader output</th>
            <th width="10%">Team member output per hour</th>
            <th width="10%">Team Output</th>
            <th width="10%">Total Hour Allocation</th>
            <th width="10%">Team hour rate allowance</th>
            <th width="10%">Budget Cost Excluding GST</th>
          </tr>
          <tr>
          	<td>Posts</td>
            <td><input type="text" name="roofextralabour_js1" id="roofextralabour_js1" value="0.00" /></td>
            <td>Team</td>
            <td><input type="text" name="roofextralabour_tlo1" id="roofextralabour_tlo1" value="2.00" /></td>
            <td><input type="text" name="roofextralabour_tmoph1" id="roofextralabour_tmoph1" value="1.50" /></td>
            <td><input type="text" name="roofextralabour_to1" id="roofextralabour_to1" value="0.00" /></td>
            <td><input type="text" name="roofextralabour_tha1" id="roofextralabour_tha1" value="0.00" /></td>
            <td><input type="text" name="roofextralabour_thra1" id="roofextralabour_thra1" value="70.00" /></td>
            <td><input type="text" name="roofextralabour_bceg1" id="roofextralabour_bceg1" value="0.00" /></td>
          </tr>
          <tr>
            <th width="20%">Board</th>
            <th width="10%">JOB SQM</th>
            <th width="10%">Team or Individual Task</th>
            <th width="10%">Team leader output</th>
            <th width="10%">Team member output per hour</th>
            <th width="10%">Team Output</th>
            <th width="10%">Total Hour Allocation</th>
            <th width="10%">Team hour rate allowance</th>
            <th width="10%">Budget Cost Excluding GST</th>
          </tr>
          <tr>
          	<td>84MM</td>
			<td><input type="text" name="roofextralabour_js2" id="roofextralabour_js2" value="0.00" /></td>
            <td>Team</td>
            <td><input type="text" name="roofextralabour_tlo2" id="roofextralabour_tlo2" value="0.70" /></td>
            <td><input type="text" name="roofextralabour_tmoph2" id="roofextralabour_tmoph2" value="0.30" /></td>
            <td><input type="text" name="roofextralabour_to2" id="roofextralabour_to2" value="0.00" /></td>
            <td><input type="text" name="roofextralabour_tha2" id="roofextralabour_tha2" value="0.00" /></td>
            <td><input type="text" name="roofextralabour_thra2" id="roofextralabour_thra2" value="70.00" /></td>
            <td><input type="text" name="roofextralabour_bceg2" id="roofextralabour_bceg2" value="0.00" /></td>
          </tr> 
 		  <tr><td colspan="8"><h3 style="float:right;">Sub Total:&nbsp;&nbsp;</h3></td>
          <td><input type="text" name="roofextralabour_subtotal" id="roofextralabour_subtotal" value="0.00" class="sub_frame_roofextra" /></td>
          </tr>
          <tr><td colspan="8">
          <h3 style="float:right;">Total:&nbsp;&nbsp;</h3>
             <input type="button" value="Calculate" id="roofextra_calc" />&nbsp;
             <input type="button" value="Calculate & Use" /></td>
           <td><input type="text" name="roofextralabour_total" id="roofextralabour_total" value="0.00" class="sub_frame_roofextra" /></td>
         </tr>           
      </table>        
  </div>
  <div id="tab53"><h3>In Built Seating - Open Frame Bench Seat - Raw Materials</h3><br />          
    <table cellpadding="0" cellspacing="0"  width="99%">
         <tr>
            <th width="20%">Board Size</th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%">Total Linleal Meters of Seating</th>
            <th width="10%">LineaL meters of boards per lineal meters of Seat</th>
            <th width="10%">Total Lineal Meters</th>
            <th width="10%">Lineal Meter Rates In GST</th>
            <th width="10%"></th>
          </tr>
          <tr>
          	<td>86MM</td>
            <td></td>
            <td></td>
            <td><input type="text" name="roofextralabour2_tlmos1" id="roofextralabour2_tlmos1" value="0.00" /></td>
            <td><input type="text" name="roofextralabour2_lmobpl1" id="roofextralabour2_lmobpl1" value="12.00" /></td>
            <td><input type="text" name="roofextralabour2_tlm1" id="roofextralabour2_tlm1" value="0.00" /></td>
            <td><input type="text" name="roofextralabour2_lmr1" id="roofextralabour2_lmr1" value="5.50" /></td>
            <td><input type="text" name="roofextralabour2_total1" id="roofextralabour2_total1" value="0.00" class="sub_frame_extra2" /></td>
          </tr>
          
           <tr>
            <th width="20%">Material</th>
            <th width="10%">Type of Screw</th>
            <th width="10%"></th>
            <th width="10%">Total Linleal Meters of Seating</th>
            <th width="10%">Number of screws per SQM - inc gst please change number  comenserate with screw type</th>
            <th width="10%">Cost per unit - inc gst </th>
            <th width="10%">Units Per Job</th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td>84mm-90mm</td>
            <td>10g 50mm square drive, countersunk head, stainless steel metal screw</td>
            <td></td>
            <td><input type="text" name="roofextralabour2_tlmos2" id="roofextralabour2_tlmos2" value="0.00" /></td>
            <td><input type="text" name="roofextralabour2_nos2" id="roofextralabour2_nos2" value="55.00" /></td>
            <td><input type="text" name="roofextralabour2_cpu2" id="roofextralabour2_cpu2" value="0.11" /></td>
            <td><input type="text" name="roofextralabour2_upj2" id="roofextralabour2_upj2" value="0.00" /></td>
            <td><input type="text" name="roofextralabour2_total2" id="roofextralabour2_total2" value="0.00" class="sub_frame_extra2" /></td>
          </tr>
           <tr>
            <th width="20%">Material</th>
            <th width="10%">Cost Per Litre</th>
            <th width="10%">Liters per lineal meter of seating</th>
            <th width="10%">Total Linleal Meters of Seating</th>
            <th width="10%"></th>
            <th width="10%">Project Liters</th>
            <th width="10%"></th>
            <th width="10%"></th>
          </tr>
          <tr>
          	<td></td>
            <td><input type="text" name="roofextralabour2_cpl3" id="roofextralabour2_cpl3" value="15.00" /></td>
            <td><input type="text" name="roofextralabour2_lplm3" id="roofextralabour2_lplm3" value="0.25" /></td>
            <td><input type="text" name="roofextralabour2_tlmos3" id="roofextralabour2_tlmos3" value="0.00" /></td>
            <td></td>
            <td><input type="text" name="roofextralabour2_pl3" id="roofextralabour2_pl3" value="0.00" /></td>
            <td></td>
            <td><input type="text"name="roofextralabour2_total3" id="roofextralabour2_total3" value="0.00" class="sub_frame_extra2" /></td>
          </tr>
           <tr>
            <th width="20%">Material</th>
            <th width="10%">Type</th>
            <th width="10%">Units Per SQM</th>
            <th width="10%">Total Linleal Meters of Seating</th>
            <th width="10%"></th>
            <th width="10%">Total Units</th>
            <th width="10%">Cost Per Unit - inc gst</th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td></td>
            <td>Smart Bit</td>
            <td><input type="text" name="roofextralabour2_ups4" id="roofextralabour2_ups4" value="0.25" /></td>
            <td><input type="text" name="roofextralabour2_tlms4" id="roofextralabour2_tlms4" value="0.00" /></td>
            <td></td>
            <td><input type="text" name="roofextralabour2_tu4" id="roofextralabour2_tu4" value="0.00" /></td>
            <td><input type="text" name="roofextralabour2_cpu4" id="roofextralabour2_cpu4" value="5.00" /></td>
            <td><input type="text" name="roofextralabour2_total4" id="roofextralabour2_total4" value="0.00" class="sub_frame_extra2" /></td>
          </tr>  
          <tr>
            <th width="20%">Material</th>
            <th width="10%">Cost Per Lineal Meter</th>
            <th width="10%"></th>
            <th width="10%">Total Lineal Meters of Seating</th>
            <th width="10%"></th>
            <th width="10%">Lineal Meters Per SQM</th>
            <th width="10%">Total Lineal Meters</th>
            <th width="10%">Total</th>
          </tr>
          <tr>
            <td>90mm x 35mm think Klin dried f27 Hardwood Post</td>
            <td><input type="text" name="roofextralabour2_cplm5" id="roofextralabour2_cplm5" value="5.50" /></td>
            <td></td>
            <td><input type="text" name="roofextralabour2_tlmos5" id="roofextralabour2_tlmos5" value="0.00" /></td>
            <td></td>
            <td><input type="text" name="roofextralabour2_lmps5" id="roofextralabour2_lmps5" value="1.60" /></td>
            <td><input type="text" name="roofextralabour2_tlm5" id="roofextralabour2_tlm5" value="0.00" /></td>
            <td><input type="text" name="roofextralabour2_total5" id="roofextralabour2_total5" value="0.00" class="sub_frame_extra2" /></td>
          </tr>
          <tr>
            <th width="20%">Material</th>
            <th width="10%">Cost Per Lineal Meter</th>
            <th width="10%"></th>
            <th width="10%">Total Lineal Meters of Seating</th>
            <th width="10%">LineaL meters of posts per lineal meters of Seat</th>
            <th width="10%">Total Lineal Meters</th>
            <th width="10%"></th>
            <th width="10%">Total</th>
          </tr>
          <tr>
            <td>125mm x 125mm hardwood posts </td>
            <td><input type="text" name="roofextralabour2_cplm6" id="roofextralabour2_cplm6" value="40.00" /></td>
            <td></td>
            <td><input type="text" name="roofextralabour2_tlms6" id="roofextralabour2_tlms6" value="0.00" /></td>
            <td><input type="text" name="roofextralabour2_lmops6" id="roofextralabour2_lmops6" value="0.80" /></td>
            <td><input type="text" name="roofextralabour2_tlm6" id="roofextralabour2_tlm6" value="0.00" /></td>
            <td></td>
            <td><input type="text" name="roofextralabour2_total6" id="roofextralabour2_total6" value="0.00" class="sub_frame_extra2"/></td>
          </tr>
          <tr>
            <th width="20%">Material</th>
            <th width="10%">Screw Allowance per Lineal meters</th>
            <th width="10%"></th>
            <th width="10%">Total Lineal Meters</th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%">Total</th>
          </tr>
          <tr>
            <td>Screws</td>
            <td><input type="text" name="roofextralabour2_saplm7" id="roofextralabour2_saplm7" value="10.00" /></td>
            <td></td>
            <td><input type="text" name="roofextralabour2_tlm7" id="roofextralabour2_tlm7" value="0.00" /></td>
            <td></td>
            <td></td>
            <td></td>
            <td><input type="text" name="roofextralabour2_total7" id="roofextralabour2_total7" value="0.00" class="sub_frame_extra2" /></td>
          </tr>              
           <tr>
          	  <td colspan="7"><h3 align="right">Total:&nbsp;</h3></td>
          	  <td colspan="2" width="10%">
                  <input type="text" name="roofextralabour2_subtotal" id="roofextralabour2_subtotal" value="0.00" />
                  <input type="text" name="roofextralabour2_div" id="roofextralabour2_div" value="0.00" />
              </td>
    	  </tr>
      </table><br /><h3>In Built Seating - Open Frame Bench Seat - Labour</h3><br />
      <table cellpadding="0" cellspacing="0"  width="99%">
         <tr>
            <th width="20%">Board</th>
            <th width="10%">SQM Per Lineal</th>
            <th width="10%">Lineal</th>
            <th width="10%">Total SQM</th>
            <th width="10%">Team or Individual Task</th>
            <th width="10%">Team leader output </th>
            <th width="10%">Team member output per hour</th>
            <th width="10%">Team Output</th>
            <th width="10%">Total Hour Allocation</th>
            <th width="10%">Team hour rate allowance</th>
            <th width="10%"> Budget Cost Excluding GST</th>
          </tr>
          <tr>
          	<td>Boards</td>
            <td><input type="text" name="roofextralabour3_spl1" id="roofextralabour3_spl1" value="0.50" /></td>
            <td><input type="text" name="roofextralabour3_lin1" id="roofextralabour3_lin1"  value="0.00" /></td>
             <td><input type="text" name="roofextralabour3_ts1" id="roofextralabour3_ts1" value="0.00" /></td>
            <td>Team</td>
            <td><input type="text" name="roofextralabour3_tlo1" id="roofextralabour3_tlo1" value="0.80" /></td>
            <td><input type="text" name="roofextralabour3_tmoph1" id="roofextralabour3_tmoph1" value="0.70" /></td>
            <td><input type="text" name="roofextralabour3_to1" id="roofextralabour3_to1" value="0.00" /></td>
            <td><input type="text" name="roofextralabour3_tha1" id="roofextralabour3_tha1" value="0.00" /></td>
            <td><input type="text" name="roofextralabour3_thra1" id="roofextralabour3_thra1" value="70.00" /></td>
            <td><input type="text" name="roofextralabour3_total1" id="roofextralabour3_total1" value="0.00" /></td>
          </tr>
           <tr>
            <th width="20%">Board</th>
            <th width="10%">SQM Per Lineal</th>
            <th width="10%">Lineal</th>
            <th width="10%">Total SQM</th>
            <th width="10%">Team or Individual Task</th>
            <th width="10%">Team leader output </th>
            <th width="10%">Team member output per hour</th>
            <th width="10%">Team Output</th>
            <th width="10%">Total Hour Allocation</th>
            <th width="10%">Team hour rate allowance</th>
            <th width="10%"> Budget Cost Excluding GST</th>
          </tr>
         <tr>
          	<td>Posts</td>
            <td></td>
            <td><input type="text" name="roofextralabour3_lin2" id="roofextralabour3_lin2" value="0.00" /></td>
            <td></td>
            <td>Team</td>
            <td><input type="text" name="roofextralabour3_tlo2" id="roofextralabour3_tlo2" value="0.50" /></td>
            <td><input type="text" name="roofextralabour3_tmoph2" id="roofextralabour3_tmoph2" value="0.25" /></td>
            <td><input type="text" name="roofextralabour3_to2" id="roofextralabour3_to2" value="0.00" /></td>
            <td><input type="text" name="roofextralabour3_tha2" id="roofextralabour3_tha2" value="0.00" /></td>
            <td><input type="text" name="roofextralabour3_thra2" id="roofextralabour3_thra2" value="70.00" /></td>
            <td><input type="text" name="roofextralabour3_total2" id="roofextralabour3_total2" value="0.00" /></td>
          <tr>
          	 <td colspan="9">
          	 <h3 style="float:right;">Total:&nbsp;&nbsp;</h3>
             <input type="button" value="Calculate" id="roofextralabour3_calc" />&nbsp;
             <input type="button" value="Calculate & Use" />
             </td>
             <td colspan="2"><input type="text" name="roofextralabour3_alltotal2" id="roofextralabour3_alltotal2" value="0.00" />
           	   <input type="text" name="roofextralabour3_div" id="roofextralabour3_div" value="0.00" />
               <input type="text" name="roofextralabour3_alltotals" id="roofextralabour3_alltotals" value="0.00" />
             </td>
         </tr>                 
      </table>        
   {{include file=$calcjs}}            
  </div>
  
    <div id="tab54"><h3>In Built Seating - Boxed-in with storage Bench Seat - Raw Materials</h3> <br />         
    <table cellpadding="0" cellspacing="0"  width="99%">
         <tr>
            <th width="20%">Board Size</th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%">Total Linleal Meters of Seating</th>
            <th width="10%">LineaL meters of boards per lineal meters of Seat</th>
            <th width="10%">Total Lineal Meters</th>
            <th width="10%">Lineal Meter Rates In GST</th>
            <th width="10%"></th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td>86MM</td>
            <td></td>
            <td></td>
            <td><input type="text" name="roofextra_ts1" id="roofextra_ts1" value="0.00" /></td>
            <td><input type="text" name="roofextra_lmps1" id="roofextra_lmps1" value="12.00" /></td>
            <td><input type="text" name="roofextra_tlm1" id="roofextra_tlm1" value="0.00" /></td>
            <td><input type="text" name="roofextra_lmr1" id="roofextra_lmr1" value="5.50" /></td>
            <td></td>
            <td><input type="text" name="roofextra_total1" id="roofextra_total1" value="0.00" /></td>
          </tr>    
           <tr>
            <th width="20%">Board Size</th>
            <th width="10%">Type of Screw</th>
            <th width="10%"></th>
            <th width="10%">Total Linleal Meters of Seating</th>
            <th width="10%"></th>
            <th width="10%">Number of screws per SQM - inc gst please change number  comenserate with screw type</th>
            <th width="10%">Cost per unit - inc gst </th>
            <th width="10%">Units Per Job</th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td>84mm-90mm</td>
            <td>10g 50mm square drive, countersunk head, stainless steel metal screw</td>
            <td></td>
            <td><input type="text" name="roofextra_ts2" id="roofextra_ts2" value="0.00" /></td>
            <td></td>
            <td><input type="text" name="roofextra_tlm2" id="roofextra_tlm2" value="55.00" /></td>
            <td><input type="text" name="roofextra_tsw2" id="roofextra_tsw2" value="0.11" /></td>
            <td><input type="text" name="roofextra_upj2" id="roofextra_upj2" value="0.00" /></td>
            <td><input type="text" name="roofextra_total2" id="roofextra_total2" value="0.00" /></td>
          </tr>    
           <tr>
            <th width="20%"></th>
            <th width="10%">Cost Per Litre</th>
            <th width="10%">Liters per lineal meter of seating</th>
            <th width="10%">Total Linleal Meters of Seating</th>
            <th width="10%"></th>
            <th width="10%">Project Liters</th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td></td>
            <td><input type="text" name="roofextra_cpl3" id="roofextra_cpl3" value="15.00" /></td>
            <td><input type="text" name="roofextra_lps3" id="roofextra_lps3" value="0.50" /></td>
            <td><input type="text" name="roofextra_ts3" id="roofextra_ts3" value="0.00" /></td>
            <td></td>
            <td><input type="text" name="roofextra_pl3" id="roofextra_pl3" value="0.00" /></td>
            <td></td>
            <td></td>
            <td><input type="text" name="roofextra_total3" id="roofextra_total3" value="0.00" /></td>
          </tr> 
          
           <tr>
            <th width="20%"></th>
            <th width="10%">Type</th>
            <th width="10%">Units Per SQM</th>
            <th width="10%">Total Linleal Meters of Seating</th>
            <th width="10%"></th>
            <th width="10%">Total Units</th>
            <th width="10%">Cost Per Unit - inc gst</th>
            <th width="10%"></th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td></td>
            <td></td>
            <td><input type="text" name="roofextra_ups4" id="roofextra_ups4" value="0.25" /></td>
            <td><input type="text" name="roofextra_ts4" id="roofextra_ts4" value="0.00" /></td>
            <td></td>
            <td><input type="text" name="roofextra_tu4" id="roofextra_tu4" value="0.00" /></td>
            <td><input type="text" name="roofextra_cpu4" id="roofextra_cpu4" value="5.00" /></td>
            <td></td>
            <td><input type="text" name="roofextra_total4" id="roofextra_total4" value="0.00" /></td>
          </tr>
           <tr>
            <th width="20%">Material</th>
            <th width="10%">Cost Per Linlean Meter</th>
            <th width="10%"></th>
            <th width="10%">Total Linleal Meters of Seating</th>
            <th width="10%"></th>
            <th width="10%">Lineal Meters Per SQM</th>
            <th width="10%">Total Lineal Meters</th>
            <th width="10%"></th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td>90mm x 35mm think Klin dried f27 Hardwood Post</td>
            <td><input type="text" name="roofextra_cplm6" id="roofextra_cplm6" value="5.50" /></td>
            <td></td>
            <td><input type="text" name="roofextra_ts6" id="roofextra_ts6" value="0.00" /></td>
            <td></td>
            <td><input type="text" name="roofextra_lmps6" id="roofextra_lmps6" value="1.60" /></td>
            <td><input type="text" name="roofextra_tlm6" id="roofextra_tlm6" value="0.00" /></td>
            <td></td>
            <td><input type="text" name="roofextra_total6" id="roofextra_total6" value="0.00" /></td>
          </tr>                    
           <tr>
            <th width="20%">Material</th>
            <th width="10%">Cost Per Linlean Meter</th>
            <th width="10%"></th>
            <th width="10%">Total Linleal Meters of Seating</th>
            <th width="10%"></th>
            <th width="10%">LineaL meters of posts per lineal meters of Seat</th>
            <th width="10%">Total Lineal Meters</th>
            <th width="10%"></th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td>125mm x 125mm hardwood posts </td>
            <td><input type="text" name="roofextra_cplm6" id="roofextra_cplm6" value="5.50" /></td>
            <td></td>
            <td><input type="text" name="roofextra_ts6" id="roofextra_ts6" value="0.00" /></td>
            <td></td>
            <td><input type="text" name="roofextra_lmps6" id="roofextra_lmps6" value="1.60" /></td>
            <td><input type="text" name="roofextra_tlm6" id="roofextra_tlm6" value="0.00" /></td>
            <td></td>
            <td><input type="text" name="roofextra_total6" id="roofextra_total6" value="0.00" /></td>
          </tr>          
          
            <tr>
            <th width="20%">Material</th>
            <th width="10%">Screw Allowance per Lineal meters</th>
            <th width="10%"></th>
            <th width="10%">Total Lineal Meters</th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%">Total</th>
          </tr>
          <tr>
          	<td>Screws</td>
            <td><input type="text" name="roofextra_cplm6" id="roofextra_cplm6" value="5.50" /></td>
            <td></td>
            <td><input type="text" name="roofextra_ts6" id="roofextra_ts6" value="0.00" /></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td><input type="text" name="roofextra_total6" id="roofextra_total6" value="0.00" /></td>
          </tr>
              
		 <tr><td colspan="8"><h3 style="float:right;">Sub Total:&nbsp;&nbsp;</h3></td>
           <td><input type="text" name="roofextra_subtotal" id="roofextra_subtotal" value="0.00" class="sub_frame_roofextra" /></td>
         </tr>   
</table>  <h3>In Built Seating - Boxed-in with storage Bench Seat - Labour</h3><br />          
      <table cellpadding="0" cellspacing="0"  width="99%">
         <tr>
            <th width="20%">Board</th>
            <th width="10%">SQM Per Lineal</th>
            <th width="10%">Lineal</th>
            <th width="10%">Total SQM</th>
            <th width="10%">Team or Individual Task</th>
            <th width="10%">Team member output per hour </th>
            <th width="10%">Team Output</th>
            <th width="10%">Total Hour Allocation</th>
            <th width="10%">Team hour rate allowance </th>
			<th width="10%">Budget Cost Excluding GST</th>
          </tr>
          <tr>
          	<td>Posts</td>
            <td><input type="text" name="roofextralabour_js1" id="roofextralabour_js1" value="0.00" /></td>
            <td>Team</td>
            <td><input type="text" name="roofextralabour_tlo1" id="roofextralabour_tlo1" value="2.00" /></td>
            <td><input type="text" name="roofextralabour_tmoph1" id="roofextralabour_tmoph1" value="1.50" /></td>
            <td><input type="text" name="roofextralabour_to1" id="roofextralabour_to1" value="0.00" /></td>
            <td><input type="text" name="roofextralabour_tha1" id="roofextralabour_tha1" value="0.00" /></td>
            <td><input type="text" name="roofextralabour_thra1" id="roofextralabour_thra1" value="70.00" /></td>
            <td> </td>
            <td><input type="text" name="roofextralabour_bceg1" id="roofextralabour_bceg1" value="0.00" /></td>
          </tr>
          <tr>
           <th width="20%">Board</th>
            <th width="10%"></th>
            <th width="10%">Lineal</th>
            <th width="10%"></th>
            <th width="10%">Team or Individual Task</th>
            <th width="10%">Team member output per hour </th>
            <th width="10%">Team Output</th>
            <th width="10%">Total Hour Allocation</th>
            <th width="10%">Team hour rate allowance </th>
			<th width="10%">Budget Cost Excluding GST</th>
          </tr>
          <tr>
          	<td>84MM</td>
			<td><input type="text" name="roofextralabour_js2" id="roofextralabour_js2" value="0.00" /></td>
            <td>Team</td>
            <td><input type="text" name="roofextralabour_tlo2" id="roofextralabour_tlo2" value="0.70" /></td>
            <td><input type="text" name="roofextralabour_tmoph2" id="roofextralabour_tmoph2" value="0.30" /></td>
            <td><input type="text" name="roofextralabour_to2" id="roofextralabour_to2" value="0.00" /></td>
            <td><input type="text" name="roofextralabour_tha2" id="roofextralabour_tha2" value="0.00" /></td>
            <td><input type="text" name="roofextralabour_thra2" id="roofextralabour_thra2" value="70.00" /></td>
            <td> </td>
            <td><input type="text" name="roofextralabour_bceg2" id="roofextralabour_bceg2" value="0.00" /></td>
          </tr> 
 		  <tr><td colspan="8"><h3 style="float:right;">Sub Total:&nbsp;&nbsp;</h3></td>
          <td><input type="text" name="roofextralabour_subtotal" id="roofextralabour_subtotal" value="0.00" class="sub_frame_roofextra" /></td>
          </tr>
          <tr><td colspan="8">
          <h3 style="float:right;">Total:&nbsp;&nbsp;</h3>
             <input type="button" value="Calculate" id="roofextra_calc" />&nbsp;
             <input type="button" value="Calculate & Use" /></td>
           <td><input type="text" name="roofextralabour_total" id="roofextralabour_total" value="0.00" class="sub_frame_roofextra" /></td>
         </tr>           
      </table>        
  </div>   
     
       
   <table cellpadding="0" cellspacing="0" width="99%">
        </tr>	  
    		<td colspan="8"><h3 align="right">In Built Seating - Open Frame Bench Seat Total:&nbsp;</h3></td>
          	<td colspan="2" width="10%"><input type="text" name="" value="0.00" /></td>
    	</tr>
   </table>        
  </div>          
 <script type="text/javascript">
    $(document).ready( function() {
      $('#tab-extra').easytabs();
    });
 </script>           
</div>

<div id="ancilary" class="popupdiv"><h1>Ancillary All Jobs</h1><br />
<table cellpadding="0" cellspacing="0"  width="99%">
         <tr>
            <th width="20%">Building Approval</th>
            <td width="10%"></td>
            <td width="10%"></td>
            <td width="10%"></td>
            <td width="10%"></td>
            <td width="10%"></td>
            <td width="10%"><input type="text" name="ancillary_ba" id="ancillary_ba" value="0.00" /></td>
          </tr>
          <tr><th colspan="7">&nbsp;</th></tr>
           <tr>
            <th width="20%">Skip Hire 1 week</th>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td width="10%"><input type="text" name="ancillary_shw1" id="ancillary_shw1" value="0.00" /></td>
          </tr>
           <tr>
            <th width="20%">Skip Hire 2 week</th>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td width="10%"><input type="text" name="ancillary_shw2" id="ancillary_shw2" value="0.00" /></td>
          </tr>
          <tr><th colspan="7">&nbsp;</th></tr>
         <tr>
            <th width="20%">Development Approval</th>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td width="10%"><input type="text" name="ancillary_da" id="ancillary_da" value="0.00" /></td>
          </tr>
          <tr><th colspan="7">&nbsp;</th></tr>
          <tr>
           <td></td>
           <td></td>
           <td>SQM</td>
           <td></td>
           <td></td>
           <td></td>
           <td width="10%">Total</td>
          </tr>
          <tr>
          	<td>Labour Colourbond or lasterlight non supply</td>
            <td><input type="text" name="ancillary_lc1" id="ancillary_lc1" value="0.00" /></td>
            <td><input type="text" name="ancillary_sqm1" id="ancillary_sqm1" value="0.00" /></td>
            <td></td>
            <td></td>
            <td></td>
            <td><input type="text" name="ancillary_total1" id="ancillary_total1" value="0.00" /></td>
          </tr>
          <tr>
          	<td>Labour Colourbond or lasterlightremove and reinstall</td>
            <td><input type="text" name="ancillary_lc1" id="ancillary_lc1" value="0.00" /></td>
            <td><input type="text" name="ancillary_sqm1" id="ancillary_sqm1" value="0.00" /></td>
            <td></td>
            <td></td>
            <td></td>
            <td><input type="text" name="ancillary_total2" id="ancillary_total2" value="0.00" /></td>
          </tr>
           <tr><th colspan="7">&nbsp;</th></tr>
            <tr>
          	<td>Screen Wrapping Raw Materials</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td><input type="text" name="ancillary_swr" id="ancillary_swr" value="0.00" /></td>
          </tr>
          <tr>
          	<td>Screen Wrapping Labour</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td><input type="text" name="ancillary_swl" id="ancillary_swl" value="0.00" /></td>
         </tr>
         <tr><th colspan="7">&nbsp;</th></tr>
         <tr>
            <th width="20%">Gate</th>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td width="10%"><input type="text" name="ancillary_gate" id="ancillary_gate" value="0.00" /></td>
          </tr>
         <tr><th colspan="7">&nbsp;</th></tr>
         <tr>
         	<td></td>
            <td></td>
            <td>Units</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
         </tr>
         <tr>
          	<td>Access door for plumbing</td>
            <td><input type="text" name="ancillary_adfp" id="ancillary_adfp" value="150.00" /></td>
            <td><input type="text" name="ancillary_adfpu" id="ancillary_adfpu" value="3.00" /></td>
            <td></td>
            <td></td>
            <td></td>
            <td><input type="text" name="ancillary_adfptotal" id="ancillary_adfptotal" value="0.00" /></td>
         </tr>
         <tr><th colspan="7">&nbsp;</th></tr> 
         <tr>
          	<td>Remove Handrail and relocate</td>
            <td><input type="text" name="ancillary_rhar" id="ancillary_rhar" value="70.00" /></td>
            <td><input type="text" name="ancillary_rharu" id="ancillary_rharu" value="4.00" /></td>
            <td></td>
            <td></td>
            <td></td>
            <td><input type="text" name="ancillary_rhartotal" id="ancillary_rhartotal" value="0.00" /></td>
         </tr>
         <tr><th colspan="7">&nbsp;</th></tr>          
         <tr>
          	<td>Flashing New Pergola</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td><input type="text" name="ancillary_fnptotal" id="ancillary_fnptotal" value="0.00" /></td>
         </tr>
         <tr><th colspan="7">&nbsp;</th></tr>  
         <tr>
          	<td>Replace handrail</td>
            <td><input type="text" name="ancillary_rh" id="ancillary_rh" value="70.00" /></td>
            <td><input type="text" name="ancillary_rhu" id="ancillary_rhu" value="2.00" /></td>
            <td><input type="text" name="ancillary_rhu1" id="ancillary_rhu1" value="0.00" /></td>
            <td><input type="text" name="ancillary_rhu2" id="ancillary_rhu2" value="50.00" /></td>
            <td></td>
            <td><input type="text" name="ancillary_rhtotal" id="ancillary_rhtotal" value="0.00" /></td>
         </tr>
         <tr><th colspan="7">&nbsp;</th></tr>
          <tr>
         	<td>Remove lasterlight and replace battens</td>
            <td>Per Hour</td>
            <td>Total Hours</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
         </tr>
          <tr>
          	<td>Labour</td>
            <td><input type="text" name="ancillary_lph" id="ancillary_lph" value="0.00" /></td>
            <td><input type="text" name="ancillary_lth" id="ancillary_lth" value="0.00" /></td>
            <td></td>
            <td></td>
            <td></td>
            <td><input type="text" name="ancillary_ltotal" id="ancillary_ltotal" value="0.00" /></td>
         </tr>
         <tr>
          	<td>Batttens Cypress</td>
            <td><input type="text" name="ancillary_bcph" id="ancillary_bcph" value="0.00" /></td>
            <td><input type="text" name="ancillary_bcth" id="ancillary_bcth" value="0.00" /></td>
            <td></td>
            <td></td>
            <td></td>
            <td><input type="text" name="ancillary_bctotal" id="ancillary_bctotal" value="0.00" /></td>
         </tr>
          <tr>
          	<td>Total</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td><input type="text" name="ancillary_ttotal" id="ancillary_ttotal" value="0.00" /></td>
         </tr>
         <tr><th colspan="7">&nbsp;</th></tr>
          <tr>
          	<td>Supporting bearers, posts and footings</td>
            <td>Per Hour</td>
            <td>Hours</td>
            <td></td>
            <td></td>
            <td></td>
            <td>Tptal</td>
         </tr>
         <tr>
          	<td>Labour</td>
            <td><input type="text" name="ancillary_laph" id="ancillary_laph" value="0.00" /></td>
            <td><input type="text" name="ancillary_lah" id="ancillary_lah" value="0.00" /></td>
            <td></td>
            <td></td>
            <td></td>
            <td><input type="text" name="ancillary_latotal" id="ancillary_latotal" value="0.00" /></td>
         </tr>
         <tr>
          	<td>Materails</td>
             <td><input type="text" name="ancillary_maph" id="ancillary_maph" value="0.00" /></td>
            <td><input type="text" name="ancillary_mah" id="ancillary_mah" value="0.00" /></td>
            <td></td>
            <td></td>
            <td></td>
            <td><input type="text" name="ancillary_matotal" id="ancillary_matotal" value="0.00" /></td>
         </tr> 
         <tr><td colspan="6">
          <h3 style="float:right;">Total:&nbsp;&nbsp;</h3>
             <input type="button" value="Calculate" id="ancillary_calc" />&nbsp;
             <input type="button" value="Calculate & Use" /></td>
           <td><input type="text" name="ancillary_totals" id="ancillary_totals" value="0.00" class="sub_frame_roofextra" /></td>
         </tr>        
</table>
</div><div id="Unique_Project_Extras" class="popupdiv"><h1>Unique Project Extras</h1><br />
<h3>Remove Structural Roof Beam</h3><br />
<table cellpadding="0" cellspacing="0"  width="99%">
         <tr>
            <th width="20%">Material or activity </th>
            <th width="10%">Unit Cost</th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%">Total</th>
          </tr>
          <tr>
            <td width="20%">Footing</td>
            <td><input type="text" name="" value="0.00" /></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td width="10%"><input type="text" name="" value="0.00" /></td>
          </tr>
           <tr>
            <th width="20%">Material or activity </th>
            <th width="10%"></th>
            <th width="10%">Myltuplier</th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%">Total</th>
          </tr>
          <tr>
            <td width="20%">Bricklayer</td>
            <td></td>
            <td><input type="text" name="" value="0.00" /></td>
            <td></td>
            <td></td>
            <td></td>
            <td width="10%"><input type="text" name="" value="0.00" /></td>
          </tr>
          <tr>
            <th width="20%">Material or activity</th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%">Total</th>
          </tr>
          <tr>
            <td width="20%">Extra Materials</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td width="10%"><input type="text" name="" value="0.00" /></td>
          </tr>    
</table>
<br /><h3>Demolition of Existing Deck</h3><br />
<table cellpadding="0" cellspacing="0"  width="99%">
         <tr>
            <th width="20%">Material or activity </th>
            <th width="10%">Unit Cost</th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%">Total</th>
          </tr>
          <tr>
            <td width="20%">Skip Hire</td>
            <td><input type="text" name="" value="0.00" /></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td width="10%"><input type="text" name="" value="0.00" /></td>
          </tr>
           <tr>
            <th width="20%">Material or activity </th>
            <th width="10%"></th>
            <th width="10%">Total Hours</th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%">Total</th>
          </tr>
          <tr>
            <td width="20%">Labour</td>
            <td><input type="text" name="" value="0.00" /></td>
            <td><input type="text" name="" value="0.00" /></td>
            <td></td>
            <td></td>
            <td></td>
            <td width="10%"><input type="text" name="" value="0.00" /></td>
          </tr>
          <tr>
            <th width="20%">Material or activity</th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%">Total</th>
          </tr>
          <tr>
            <td width="20%">Blades Hire</td>
            <td><input type="text" name="" value="0.00" /></td>
            <td><input type="text" name="" value="0.00" /></td>
            <td></td>
            <td></td>
            <td></td>
            <td width="10%"><input type="text" name="" value="0.00" /></td>
          </tr>    
          <tr>
            <th width="20%">Material or activity</th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%"></th>
            <th width="10%">Total</th>
          </tr>
          <tr>
            <td width="20%">Hire</td>
            <td><input type="text" name="" value="0.00" /></td>
            <td><input type="text" name="" value="0.00" /></td>
            <td></td>
            <td></td>
            <td></td>
            <td width="10%"><input type="text" name="" value="0.00" /></td>
          </tr>    
</table>
</div>
<script type="text/javascript">
$('.openpopup').click(function(){
$('.popupdiv').fadeOut(0);  
$('#'+this.name).fadeToggle(1800);

});

  
  $(document).ready(function() {
    $('input[type="text"]').keydown(maskInput);
	$('input[type="text"]').blur(maskInput);
	 $('input[type="text"]').blur(function(){
	 if(!isNaN(this.value) && this.value.length!=0) {
	 this.value = parseFloat(this.value).toFixed(2);
	 }
	 });
	  $('input[type="text"]').click(function(){
	 if(this.value == '0.00') {
	 this.value = '';
	 }
	 
	 
	});
});
</script>


{{/if}}

{{if !empty($allTasks) AND count($allTasks)}}

<table cellpadding="0" cellspacing="0" border="1"  width="100%">
  <tr>
    <th width="9%">Action</th>
    <th width="2%">Seq</th>
    <th width="1%">UID</th>
    <th width="8%">Email Link</th>
    <th width="26%">Task Name</th>
    <th width="5%">Complete</th>
    <th width="8%">Complete Date</th>
    <th width="8%">Completed By</th>
    <th width="25%" align="left">Relevant Procedures</th>
    <th width="5%" align="left">Auto Email</th>
    <th width="5%" align="left">Auto Text</th>
    <th width="2%" align="left">Help</th>
    <th width="5%" align="left">Video Link</th>
  </tr>
  {{assign var="bg" value="D4D7FE"}}   
  {{foreach from=$allTasks item=item key=key}}
  {{if $bg == 'D4D7FE'}} {{assign var="bg" value="FFF"}} {{elseif $bg == 'FFF'}} {{assign var="bg" value="D4D7FE"}} {{/if}}
    
  {{if $item.bt_complete eq 1}}
  	 <tr id="grTask{{$item.bt_id}}" style="background:#090;" >
  {{else}}
  
      {{if $item.bt_task_not_required eq 1}}
            <tr id="grTask{{$item.bt_id}}" style="background:#CCC;" >
      {{else}}
        <tr id="grTask{{$item.bt_id}}" >
      {{/if}}
  {{/if}}
  
  
    <td>
	<a href="javascript:modelwindow('{{$BASE_URL}}business.subtask/bus_id/{{$item.bt_bsn_id}}/tsid/{{$item.bt_task_status_id}}/tid/{{$item.bt_task_id}}','90%','90%', 'yes');">
<img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/sub.png" title="Sub Task Edit"/></a> 
    
    <a href="javascript:modelwindow('{{$BASE_URL}}business.taskedit/bus_id/{{$item.bt_bsn_id}}/taskId/{{$item.bt_id}}','90%','90%', 'yes');">
	<img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png" title="Task Edit"/></a>
    
     <!-- <a href="javascript:requestTaskEdit({{$item.bt_id}},'OpenEdit');"> <img style="height: 20px; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png" title="Edit"/></a>&nbsp; -->    

    <a onclick="javascript:requestTaskDone({{$item.bt_id}});"><img style="height: 20px; width:20px;" src="{{$BASE_URL}}css/admin/images/complete.png" title="Complete"/></a>
   
   	<a href="javascript:modelwindow('{{$BASE_URL}}business.ps_qa/bus_id/{{$item.bt_bsn_id}}/tsid/{{$item.bt_task_status_id}}/tid/{{$item.bt_task_id}}','90%','90%', 'yes');">
<img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/qa.png" title="Sub Task Edit"/></a> <br />
   
    Make Not Required:
     <input type hidden name = "not_required_task[{{$item.bt_id}}][bt_id]" value = "{{$item.bt_id}}"  />
     <input type="checkbox" name = "not_required_task[{{$item.bt_id}}][bt_task_not_required]" id="notreqTask{{$item.bt_id}}" onclick="tasknotrequired({{$item.bt_id}}, {{$item.bt_complete}});" {{if $item.bt_task_not_required eq 1 }} checked="checked" {{/if}} /> 
     <p id="myElemTask{{$item.doc_id}}" style="display:none;"></p>
   
   </td>
      
    <td align="center">{{counter}}</td>
    <td align="center">{{if $item.bst_task_id == 0}}{{$item.bst_id}}{{else}}{{$item.bst_task_id}}{{/if}}</td>
    <td> 
     
    {{foreach from=$emaillinks item=item_l key=key_l}}
    
    	{{assign var=someVar value=","|explode:$item_l.eml_link_uid}}
           
       	{{if $item.bst_task_id eq $someVar[0] || $item.bst_task_id eq $someVar[1] || $item.bst_task_id eq $someVar[2] || $item.bst_task_id eq $someVar[3] || $item.bst_task_id eq $someVar[4]  || $item.bst_task_id eq $someVar[5] || $item.bst_task_id eq $someVar[6] || $item.bst_task_id eq $someVar[7]}}

        	<a href="{{$BASE_URL}}emaillibrary.compose/eml_id/{{$item_l.eml_id}}" target="_blank">{{$item_l.eml_code}}</a><br />
        {{/if}}
        
    {{/foreach}}
    
    </td>
    <td style="color:{{if $item.bt_complete=='0'}}RED{{/if}};">{{$item.st_name}} - {{$item.bst_task_name}}</td>
    <td style="text-align:center;"><input type="checkbox" {{if $item.bt_complete=='1'}}checked="checked"{{/if}} disabled="disabled"/> </td>
    <td style="text-align:center;">{{if $item.bt_completed_date != 0}}{{$item.bt_completed_date|date_format:"%d/%m/%Y"}} {{/if}}</td>
    <td style="text-align:center;">{{if $item.bt_complete=='1'}} {{$item.user_name}} {{else}} {{$item.p_name}} {{/if}}</td>
    <td align="left">
    
    {{foreach from=$allTasksProc item=item_p key=key_p}}
    
    {{if $item.bt_task_id eq $item_p.btp_bst_id}}
    <div> <a href="{{$BASE_URL}}{{$FILE_PATH}}files/template_documents_hub/{{$item_p.btp_doc}}?dummy={{$ran}}">{{$item_p.btp_doc_longtext}}</a> </div><br />
    {{/if}}
    
    {{/foreach}}

   <strong>MsTeam Document Links</strong> 
    
    {{foreach from=$allTasksTeam item=item_t key=key_t}}
    
    {{if $item.bt_task_id eq $item_t.btp_bst_id}}
    {{if $item_t.dhd_link_pdf}} <div> <a href="{{$item_t.dhd_link_pdf}}" target="_blank">{{$item_t.btp_doc_longtext}}-PDF</a> </div><br />{{/if}}
    {{if $item_t.dhd_link_word}} <div> <a href="{{$item_t.dhd_link_word}}" target="_blank">{{$item_t.btp_doc_longtext}}-Word</a> </div><br />{{/if}}

    {{/if}}
    
    {{/foreach}}
    
    </td>
    <td align="center">

      {{if $item.bst_auto_email_text eq '1'}} Yes {{else}} No {{/if}} 
     
      </td>
      
       <td align="center">

      {{if $item.bst_auto_sms_text eq '1'}} Yes {{else}} No {{/if}} 
     
      </td>
      
      
    <td align="left">{{if $item.bst_instruction}}
    <a href="javascript:parent.showFancybox('{{$item.bst_instruction|strip_tags}}');">
   	<!--  <a href="javascript:alert('{{$item.bst_instruction|strip_tags|html_entity_decode:2:"UTF-8"|htmlentities:2:"UTF-8"}}');" >-->
    <img style="height: 20px;; width:20px" src="{{$BASE_URL}}images/help.png" title="Help"/></a>
	{{/if}}
	</td>
    <td>{{if $item.bst_video_link}} <a href="{{$item.bst_video_link}}" target="_blank">Link</a>{{/if}}
    </td>
    
  </tr>
  {{/foreach}}
   <tr> <td colspan="7"><input type="submit" name="not_required_task_save" value="Save Not Required" /></td>
</table>
<!-- Begin Pagination -->
{{if $last > 1}}
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center" style="border:none;">
  <tr> {{if $last}}
    <td align="center"><div class='pagination'> {{if $pagenum == 1}} <span class='disabled'>&laquo; previous</span> {{else}} <a class="pagination" href="javascript:requestAllTasks({{math equation="x - y" x=$pagenum y=1}})" title="Previous">&laquo; previous</a> {{/if}}
        
        {{if $pagenum != 1}} <span class="paginate"><a class="pagination"  href="javascript:requestAllTasks(1)" title="{{$page_num}} Page">1</a></span> {{else}}<span class='current'>1</span> {{/if}}{{if $pagenum != 2}} <span class="paginate"><a class="pagination"  href="javascript:requestAllTasks(2)" title="{{$page_num}} Page">2</a></span> {{else}}<span class='current'>2</span> {{/if}}
        {{if $paginateprev.0 > 3}}
        ...
        {{/if}}
        {{foreach from=$paginateprev key="page_key" item="page_num"}}
        {{if $page_num == $pagenum OR $page_num <= 2}}
        {{elseif $page_num == $lastone}}
        
        {{else}} <span class="paginate"><a class="pagination"  href="javascript:requestAllTasks({{$page_num}})" title="{{$page_num}} Page">{{$page_num}}</a></span> {{/if}}
        {{/foreach}}
        
        {{foreach from=$paginatenext key="page_key" item="page_num2"}}
        {{if $page_num2 < $last AND $page_num2 != $lastone}}
        {{if $page_num2 == 1}}
        {{elseif $page_num2 == 2}}
        {{else}}
        {{if $page_num2 == $pagenum OR $page_num2 <= 0}} <span class='current'> {{$page_num2}}</span> {{else}} <a class="pagination"  href="javascript:requestAllTasks({{$page_num2}})" title="{{$page_num2}} Page">{{$page_num2}}</a> {{/if}}
        {{/if}}     
        {{/if}}
        {{/foreach}}
        {{if $page_num2 < $lasttow}}
        ...
        {{/if}}
        {{if $lastone == 1}}
        {{elseif $lastone == 2}}
        {{else}}
        {{if $pagenum == $lastone }} <span class='current'>{{$lastone}}</span> {{else}} <a class="pagination"  href="javascript:requestAllTasks({{$lastone}})" title="{{$lastone}} Page">{{$lastone}}</a> {{/if}}
        {{/if}}
        {{if $last == 1}}
        {{elseif $last == 2}}
        {{else}}
        {{if $pagenum == $last}} <span class='current'>{{$last}}</span> {{else}} <a class="pagination"  href="javascript:requestAllTasks({{$last}})" title="{{$last}} Page">{{$last}}</a> {{/if}}
        {{/if}}
        {{if $pagenum == $last}} <span class='disabled'>next &raquo;</span> {{else}} <a class="pagination" href="javascript:requestAllTasks({{math equation="x + y" x=$pagenum y=1}})" title="Next">next &raquo;</a></div>
      {{/if}} </td>
    {{else}}
    <td align="center" height="300">Record Not found... </td>
    {{/if}} </tr>
</table>
{{/if}}
<!-- End Pagination -->
{{/if}}
{{if !empty($allTasksProposal) AND count($allTasksProposal)}}
<style>
ol {list-style-type: decimal; }
ul {list-style-type:disc; }
</style>
<div id="myContent{{$n}}">
<table cellpadding="0" cellspacing="0" border="1"  width="100%" id="divtruelog" style="border-collapse:collapse;">
  <tr>
    <th width="7%">Action</th>
    <th width="2%">Seq</th>
    <th width="2%">UID</th>
    <th width="32%">Task Name</th>
    <th width="5%">Complete</th>
    <th width="8%">Complete Date</th>
    <th width="8%">Completed By</th>
    <th width="27%" align="left">Relevant Procedures</th>
    <th width="5%" align="left">Task Emails</th>
    <th width="2%" align="left">Help</th>
     <th width="5%" align="left">Video Link</th>
  </tr>
  {{assign var="bg" value="D4D7FE"}}   
  {{foreach from=$allTasksProposal item=item key=key}}
  {{if $bg == 'D4D7FE'}} {{assign var="bg" value="FFF"}} {{elseif $bg == 'FFF'}} {{assign var="bg" value="D4D7FE"}} {{/if}}
  <tr style="background-color:#{{$bg}};">
  
    <td>
<a href="javascript:modelwindow('{{$BASE_URL}}business.subtaskproposal/bus_id/{{$item.bt_bsn_id}}/tn/{{$item.bt_task_list_number}}/tid/{{$item.bt_task_id}}','90%','90%', 'yes');">
 <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/sub.png" title="Sub Task Edit"/></a> 
    
    
    <a href="javascript:modelwindow('{{$BASE_URL}}business.taskeditproposal/bus_id/{{$item.bt_bsn_id}}/taskId/{{$item.bt_id}}/tn/{{$item.bt_task_list_number}}','90%','90%', 'yes');">
 <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png" title="Task Edit"/></a>  
 
 	<a href="javascript:modelwindow('{{$BASE_URL}}business.proposal_qa/bus_id/{{$item.bt_bsn_id}}/tsid/{{$item.bt_task_status_id}}/tid/{{$item.bt_task_id}}','90%','90%', 'yes');">
<img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/qa.png" title="Sub Task Edit"/></a> 

   <!-- <a onclick="javascript:requestTaskDoneProposal({{$item.bt_id}},{{$n}});"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/complete.png" title="Complete"/></a>-->
   
   </td>
      
    <td align="center">{{counter}}</td>
    <td align="center">{{if $item.bst_task_id == 0}}{{$item.bst_id}}{{else}}{{$item.bst_task_id}}{{/if}}</td>
    <td style="color:{{if $item.bt_complete=='0'}}RED{{/if}};">{{$item.st_name}} - {{$item.bst_task_name}}</td>
    <td style="text-align:center;"><input type="checkbox" {{if $item.bt_complete=='1'}}checked="checked"{{/if}} disabled="disabled"/></td>
    <td style="text-align:center;">{{if $item.bt_completed_date != 0}}{{$item.bt_completed_date|date_format:"%d/%m/%Y"}} {{/if}}</td>
    <td style="text-align:center;">{{$item.user_name}}</td>
    <td align="left">
    
    {{foreach from=$allTasksProcProposal item=item_p key=key_p}}
    
    {{if $item.bt_task_id eq $item_p.btp_bst_id}}
    <div> <a href="{{$BASE_URL}}{{$FILE_PATH}}files/template_documents_hub/{{$item_p.btp_doc}}?dummy={{$ran}}">{{$item_p.btp_doc_longtext}}</a> </div><br />
    {{/if}}
    
    {{/foreach}}
    
    
    </td>
    
    <td>
    
   {{foreach from=$proposalEmailLink item=item_e key=key_e}}
    
    {{if $item.bt_task_id eq $item_e.pel_task_id}}
    <div> <a href="{{$BASE_URL}}emaillibrary.compose/eml_id/{{$item_e.pel_email_id}}" target="_blank">{{$item_e.pel_email_linked}}</a> </div><br />
    {{/if}}
    
    {{/foreach}} 
    
    
     </td>
    
<!--    <td align="center">{{if $item.et_id}}
      <div align="center"><a href="javascript:parent.seller_tasks_email({{$item.bt_bsn_id}},{{$item.et_id}});"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}images/emailnew.png" title="Email"/></a></div>
      {{/if}}</td>-->
    <td align="left">{{if $item.bst_instruction}}
      <a href="javascript:parent.showFancybox('{{$item.bst_instruction}}');"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}images/help.png" title="Help"/></a>
      {{/if}}
    </td>

    <td> {{if $item.bst_video_link}} <a href="{{$item.bst_video_link}}" target="_blank">Link</a> {{/if}} </td>
    
    
  </tr>
  {{/foreach}}
</table>
<!-- Begin Pagination -->
{{if $last > 1}}
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center" style="border:none;">
  <tr> {{if $last}}
    <td align="center"><div class='pagination'> {{if $pagenum == 1}} <span class='disabled'>&laquo; previous</span> {{else}} <a class="pagination" href="javascript:requestAllTasksProposal({{math equation="x - y" x=$pagenum y=1}},{{$n}})" title="Previous">&laquo; previous</a> {{/if}}
        
        {{if $pagenum != 1}} <span class="paginate"><a class="pagination"  href="javascript:requestAllTasksProposal(1,{{$n}})" title="{{$page_num}} Page">1</a></span> {{else}}<span class='current'>1</span> {{/if}}{{if $pagenum != 2}} <span class="paginate"><a class="pagination"  href="javascript:requestAllTasksProposal(2,{{$n}})" title="{{$page_num}} Page">2</a></span> {{else}}<span class='current'>2</span> {{/if}}
        {{if $paginateprev.0 > 3}}
        ...
        {{/if}}
        {{foreach from=$paginateprev key="page_key" item="page_num"}}
        {{if $page_num == $pagenum OR $page_num <= 2}}
        {{elseif $page_num == $lastone}}
        
        {{else}} <span class="paginate"><a class="pagination"  href="javascript:requestAllTasksProposal({{$page_num}},{{$n}})" title="{{$page_num}} Page">{{$page_num}}</a></span> {{/if}}
        {{/foreach}}
        
        {{foreach from=$paginatenext key="page_key" item="page_num2"}}
        {{if $page_num2 < $last AND $page_num2 != $lastone}}
        {{if $page_num2 == 1}}
        {{elseif $page_num2 == 2}}
        {{else}}
        {{if $page_num2 == $pagenum OR $page_num2 <= 0}} <span class='current'> {{$page_num2}}</span> {{else}} <a class="pagination"  href="javascript:requestAllTasksProposal({{$page_num2}},{{$n}})" title="{{$page_num2}} Page">{{$page_num2}}</a> {{/if}}
        {{/if}}     
        {{/if}}
        {{/foreach}}
        {{if $page_num2 < $lasttow}}
        ...
        {{/if}}
        {{if $lastone == 1}}
        {{elseif $lastone == 2}}
        {{else}}
        {{if $pagenum == $lastone }} <span class='current'>{{$lastone}}</span> {{else}} <a class="pagination"  href="javascript:requestAllTasksProposal({{$lastone}},{{$n}})" title="{{$lastone}} Page">{{$lastone}}</a> {{/if}}
        {{/if}}
        {{if $last == 1}}
        {{elseif $last == 2}}
        {{else}}
        {{if $pagenum == $last}} <span class='current'>{{$last}}</span> {{else}} <a class="pagination"  href="javascript:requestAllTasksProposal({{$last}},{{$n}})" title="{{$last}} Page">{{$last}}</a> {{/if}}
        {{/if}}
        {{if $pagenum == $last}} <span class='disabled'>next &raquo;</span> {{else}} <a class="pagination" href="javascript:requestAllTasksProposal({{math equation="x + y" x=$pagenum y=1}},{{$n}})" title="Next">next &raquo;</a></div>
      {{/if}} </td>
    {{else}}
    <td align="center" height="300">Record Not found... </td>
    {{/if}} </tr>
</table>
{{/if}}
</div>
<!-- End Pagination -->
{{/if}}
{{if !empty($taskId)}}
<table cellpadding="0" cellspacing="0" style="border:1px solid #339999; width:100%">
  <tr>
    <td><table cellpadding="0" cellspacing="0">
        <tr>
          <td> {{if $taskData.st_name}}<strong>Status:</strong> {{$taskData.st_name}} {{/if}}
          	   {{if $taskData.pt_name}}<strong>Types:</strong> {{$taskData.pt_name}} {{/if}}	
          </td>
          <td>&nbsp;</td>
          <td><strong>Task Name:</strong> {{$taskData.bst_task_name}}</td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td><table cellpadding="0" cellspacing="0" >
        <tr>
          <td><strong>Complete:</strong>
            <input type="checkbox" {{if $taskData.bt_complete == 1}} checked="checked" {{/if}} id="bt_complete" />
          </td>
          <td style="width:90px;">&nbsp;</td>
          <td><strong>Complete Date:</strong>
            <input type="text" name="{{$TABLE}}[bsn_status_date]" value="{{$taskData.date}}" class="w16em dateformat-d-ds-m-ds-Y" id="editTaskDate" maxlength="25" />
            &nbsp;
            <input type="text" name="{{$TABLE}}[bsn_status_time]" value="{{$taskData.time}}" class="vvsml" id="editTaskTime" readonly="readonly"/>
            &nbsp;<a href="javascript:setcur_date('curdate','editTaskDate','editTaskTime');" title="System Date/Time">
            <img src="{{$BASE_URL}}images/clock.png" alt="System Date" /></a> </td>
          
          <td style="width:50px;">&nbsp;</td>
          <td><strong>Completed By:</strong>{{$taskData.customer_name|default:"Administrator"}}</td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td><table cellpadding="0" cellspacing="0" >
        <tr>
          <td><strong>Comments:</strong></td>
          <td><textarea name="" cols="55" rows="5" id="bt_comment">{{$taskData.bt_comment}}</textarea></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td><strong>Instruction:</strong>{{$taskData.bt_instruction}} </td>
  </tr>
  <tr>
    <td><input type="button" value="Update" onclick="requestTaskEdit({{$taskData.bt_id}},'SaveEdit');" />
      <input type="button" value="Cancel" onclick="requestTaskEdit({{$taskData.bt_id}},'CloseEdit');" /></td>
  </tr>
</table>
{{/if}}

{{if !empty($taskUpdateMsg)}}
    {{$taskUpdateMsg}}
{{/if}}

{{if $checkListErrorMsg}}
<!-- Begin Create Document Checklist section -->
<div style="color:#FF6600; font-weight:bold;">{{$checkListErrorMsg}}</div>
<br />
{{/if}}
{{if !empty($allptTasks) AND count($allptTasks)}}
<table cellpadding="0" cellspacing="0" id="taskstypes"  width="100%">
  <tr>
    <th width="12%">Action</th>
    <th width="3%">Seq</th>
    <th width="33%">Task Name</th>
    <th width="5%">Complete</th>
    <th width="10%">Complete Date</th>
    <th width="10%">Completed By</th>
    <th width="12%" align="left">Comment</th>
    <th width="7%" align="left">Email Task</th>
    <th width="10%" align="left">Merge Docs</th>
  </tr>
  {{assign var="bg" value="D4D7FE"}}   
  {{foreach from=$allptTasks item=item key=key}}
  {{if $bg == 'D4D7FE'}} {{assign var="bg" value="FFF"}} {{elseif $bg == 'FFF'}} {{assign var="bg" value="D4D7FE"}} {{/if}}
  <tr style="background-color:#{{$bg}};">
    <td><a href="javascript:requestptypeTaskEdit({{$item.bt_id}},'OpenEdit');"> <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png" title="Edit"/></a>&nbsp;&nbsp; <a href="javascript:requestptypeTaskDone({{$item.bt_id}});"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/complete.png" title="Complete"/></a>&nbsp;&nbsp;
      {{if $item.bst_document}}<a href="{{$BASE_URL}}{{$FILE_PATH}}files/task_files/{{$item.bst_document}}?dummy={{$ran}}" target="_blank"><img src="{{$BASE_URL}}css/default/images/document-task.gif" title="View"/></a>{{/if}}&nbsp;&nbsp; </td>
    <td align="center">{{counter}}</td>
    <td style="color:{{if $item.bt_complete=='0'}}RED{{/if}};">{{$item.pt_name}} - {{$item.bst_task_name}}</td>
    <td style="text-align:center;"><input type="checkbox" {{if $item.bt_complete=='1'}}checked="checked"{{/if}} disabled="disabled"/></td>
    <td style="text-align:center;">{{if $item.bt_completed_date != 0}}{{$item.bt_completed_date|date_format:"%d/%m/%Y"}} {{/if}}</td>
    <td style="text-align:center;">{{$item.user_name}}</td>
    <td align="left">{{$item.bt_comment}}</td>
    <td align="center">{{if $item.et_id}}
      <div align="center"><a href="javascript:parent.seller_tasks_email({{$item.bt_bsn_id}},{{$item.et_id}});"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}images/emailnew.png" title="Email"/></a></div>
      {{/if}}</td>
    <td align="left"></td>
  </tr>
  {{/foreach}}
</table>
<!-- Begin Pagination -->
{{if $last > 1}}
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center" style="border:none;">
  <tr> {{if $last}}
    <td align="center"><div class='pagination'> {{if $pagenum == 1}} <span class='disabled'>&laquo; previous</span> {{else}} <a class="pagination" href="javascript:requestAllTasks({{math equation="x - y" x=$pagenum y=1}})" title="Previous">&laquo; previous</a> {{/if}}
        
        {{if $pagenum != 1}} <span class="paginate"><a class="pagination"  href="javascript:requestAllTasks(1)" title="{{$page_num}} Page">1</a></span> {{else}}<span class='current'>1</span> {{/if}}{{if $pagenum != 2}} <span class="paginate"><a class="pagination"  href="javascript:requestAllTasks(2)" title="{{$page_num}} Page">2</a></span> {{else}}<span class='current'>2</span> {{/if}}
        {{if $paginateprev.0 > 3}}
        ...
        {{/if}}
        {{foreach from=$paginateprev key="page_key" item="page_num"}}
        {{if $page_num == $pagenum OR $page_num <= 2}}
        {{elseif $page_num == $lastone}}
        
        {{else}} <span class="paginate"><a class="pagination"  href="javascript:requestAllTasks({{$page_num}})" title="{{$page_num}} Page">{{$page_num}}</a></span> {{/if}}
        {{/foreach}}
        
        {{foreach from=$paginatenext key="page_key" item="page_num2"}}
        {{if $page_num2 < $last AND $page_num2 != $lastone}}
        {{if $page_num2 == 1}}
        {{elseif $page_num2 == 2}}
        {{else}}
        {{if $page_num2 == $pagenum OR $page_num2 <= 0}} <span class='current'> {{$page_num2}}</span> {{else}} <a class="pagination"  href="javascript:requestAllTasks({{$page_num2}})" title="{{$page_num2}} Page">{{$page_num2}}</a> {{/if}}
        {{/if}}     
        {{/if}}
        {{/foreach}}
        {{if $page_num2 < $lasttow}}
        ...
        {{/if}}
        {{if $lastone == 1}}
        {{elseif $lastone == 2}}
        {{else}}
        {{if $pagenum == $lastone }} <span class='current'>{{$lastone}}</span> {{else}} <a class="pagination"  href="javascript:requestAllTasks({{$lastone}})" title="{{$lastone}} Page">{{$lastone}}</a> {{/if}}
        {{/if}}
        {{if $last == 1}}
        {{elseif $last == 2}}
        {{else}}
        {{if $pagenum == $last}} <span class='current'>{{$last}}</span> {{else}} <a class="pagination"  href="javascript:requestAllTasks({{$last}})" title="{{$last}} Page">{{$last}}</a> {{/if}}
        {{/if}}
        {{if $pagenum == $last}} <span class='disabled'>next &raquo;</span> {{else}} <a class="pagination" href="javascript:requestAllTasks({{math equation="x + y" x=$pagenum y=1}})" title="Next">next &raquo;</a></div>
      {{/if}} </td>
    {{else}}
    <td align="center" height="300">Record Not found... </td>
    {{/if}} </tr>
</table>
{{/if}}
<!-- End Pagination -->
{{/if}}


{{if !empty($taskUpdateMsg)}}
    {{$taskUpdateMsg}}
{{/if}}

{{if !empty($print_data)}}
<table cellpadding="0" cellspacing="0" width="100%">
  <tr>
    <th width="18%">Action</th>
    <th width="25%">Document Name</th>
    <th width="18%">File Name</th>
    <th width="6%">Date Uploaded</th>
    <th width="7%">User Name</th>
    <th width="8%">Documentclick </th>
    <th width="8%">Doc Not Avail.</th>
    <th width="10%">Customer WWW</th>
  </tr>
   <form name="nr" method="post" action="">
  {{foreach from=$print_data item=item key=key}}
  {{if $item.doc_not_required eq 1}}
  	<tr id="gr{{$item.doc_id}}" style="background:#CCC;" >
  {{else}}
    <tr id="gr{{$item.doc_id}}" >
  {{/if}}
    <td><a href="javascript:RequestcheckListIframe('checklist','{{$item.doc_id}}','','');" >
    <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a><br />
     Make Not Required:
     <input type hidden name = "not_required[{{$item.doc_id}}][doc_id]" value = "{{$item.doc_id}}"  />
     <input type="checkbox" name = "not_required[{{$item.doc_id}}][doc_not_required]" id="notreq{{$item.doc_id}}" onclick="process({{$item.doc_bsn_id}},{{$item.doc_id}});" {{if $item.doc_not_required eq 1 }} checked="checked" {{/if}} /> 
     <p id="myElem{{$item.doc_id}}" style="display:none;"></p>

    
    </td>
    <td style="padding-left:5px;">{{$item.admin_doc_manual}}{{if $item.doc_file_name !== '' && $item.admin_doc_id == 12}} CONTRACT SIGNED {{else}}{{$item.admin_doc_name}}{{/if}}</td>
	
    {{if !empty($ipad)}} 
    <td style="text-align:left;">
  <!--  <a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name}}?dummy={{$ran}}" class="action_checklist" title="{{$item.doc_file_name}}" target="_blank">{{$item.doc_file_name|truncate:"40"}}</a>
-->    
    <a href="/business.download_content?file_name={{$item.doc_file_name}}&module_name=business.home" >{{$item.doc_file_name|truncate:"40"}}</a>
    </td>
   
    {{else}}
   <td style="text-align:left;">
<!--   <a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name}}?dummy={{$ran}}')" class="action_checklist" title="{{$item.doc_file_name}}">{{$item.doc_file_name|truncate:"40"}}</a>-->
   
   <a href="javascript:parent.modelviewimages('/business.download_content?file_name={{$item.doc_file_name}}&module_name=business.home')" class="action_checklist" title="{{$item.doc_file_name}}">{{$item.doc_file_name|truncate:"40"}}</a>
   
   {{if $item.doc_file_name}}<br /><a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name}}" target="_blank">Link</a>
   {{/if}}
   </td>
     {{/if}}

    <td style="text-align:center;">{{$item.doc_date_uploaded|date_format:"%d/%m/%Y"}}</td>
    <td style="text-align:center;">{{$item.user_name}}</td>
    <td style="text-align:center;"><input type="checkbox" {{if $item.doc_upload_to_dossier == 1}} checked="checked"{{/if}} disabled="disabled" /></td>
    <td style="text-align:center;"><input type="checkbox" {{if $item.doc_not_avail == 1}} checked="checked"{{/if}} disabled="disabled" /></td>
    <td style="text-align:left;">
<input type="radio" name="md{{$item.doc_id}}" value="1" onclick="updateCustWWW({{$item.doc_id}}, {{$item.doc_bsn_id}}, 1)" {{if $item.doc_cust_www  == 1}} checked="checked" {{/if}}/> <span style="padding-top:5px;"> Yes </span> <br />
<input type="radio" name="md{{$item.doc_id}}" value="0" onclick="updateCustWWW({{$item.doc_id}}, {{$item.doc_bsn_id}}, 0)" {{if $item.doc_cust_www == 0}} checked="checked" {{/if}} /> NO 
</td>
  </tr>
  {{/foreach}}

  
   <tr> <td colspan="7"><input type="submit" name="not_required_save_dc" value="Save Not Required1" /></td>
 <!-- <td> <input type="submit" name="add_doc_mini" value="Add New Document" /></td>-->
  </tr>
  </form>
</table>
{{/if}}


{{if !empty($print_data_mini)}}
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<div style="font-style:bold; text-align:left; padding:5px;">   
<form name="tablename" method="post" action="" >
<input type="hidden" name="proposal[dpn_bsn_id]" value="{{$bsn_id_mini}}" />
<input type="hidden" name="proposal[dpn_proposal_number]" value="1" />
<div style="width:75%; float:left;">
Document Proposal : <input type="text" name="proposal[dpn_name]" value="{{$dpn_name}}"}} style="width:400px;"  /> &nbsp;
Primary Design : <input type="radio" name="proposal[dpn_primary_design]" value="1"  {{if $dpn_primary_design  == 1}} checked="checked" {{/if}}/>  Yes  &nbsp; 
<input type="radio" name="proposal[dpn_primary_design]" value="0"  {{if $dpn_primary_design == 0}} checked="checked" {{/if}} /> NO <br />
Design Type : <select name="proposal[dpn_design_type]">
<option value="1" {{if $dpn_design_type eq 1}} selected="selected" {{/if}}>Concept Design</option>
<option value="2" {{if $dpn_design_type eq 2}} selected="selected" {{/if}}>Modification Design</option>
<option value="3" {{if $dpn_design_type eq 3}} selected="selected" {{/if}}>Existing Design</option>
<option value="4" {{if $dpn_design_type eq 4}} selected="selected" {{/if}}>External Design </option>
</select>
&nbsp &nbsp; &nbsp; Customer Designer: <input type="text" name="proposal[dpn_customer_designer]" value="{{$dpn_customer_designer}}" style="width:200px;"  /> &nbsp; 
Arch : <input type="text" name="proposal[dpn_architect]" value="{{$dpn_architect}}" style="width:200px;"  />

<br />

Checklist Number : 
<input type="hidden" name="proposal[dpn_unique_id]" value="{{$dpn_unique_id}}" style="width:200px;" readonly="readonly"  /> {{$dpn_unique_id}} &nbsp;
Project Type : <select name="proposal[dpn_project_type]">
<option value="1" {{if $dpn_project_type eq 1}} selected="selected" {{/if}}>SR</option>
<option value="2" {{if $dpn_project_type eq 2}} selected="selected" {{/if}}>FPE</option>
<option value="3" {{if $dpn_project_type eq 3}} selected="selected" {{/if}}>Other</option>
</select> &nbsp; &nbsp;
Include in report : <input type="radio" name="proposal[dpn_include_in_report]" value="1"  {{if $dpn_include_in_report  == 1}} checked="checked" {{/if}}/>  Yes  &nbsp; 
<input type="radio" name="proposal[dpn_include_in_report]" value="0"  {{if $dpn_include_in_report == 0}} checked="checked" {{/if}} /> NO 
&nbsp; &nbsp;
Include in Entity Report : <input type="radio" name="proposal[dpn_add_to_er]" value="1"  {{if $dpn_add_to_er  == 1}} checked="checked" {{/if}}/>  Yes  &nbsp; 
<input type="radio" name="proposal[dpn_add_to_er]" value="0"  {{if $dpn_add_to_er == 0}} checked="checked" {{/if}} /> NO 

&nbsp; &nbsp;<br />  Show on Design report : 
<input type="hidden" name="proposal[dpn_dr_hide]" value="1" />
 <label class="switch">
 <input class="switch-input" type="checkbox"  name="proposal[dpn_dr_hide]" value="0" onclick="this.form.submit();" {{if $dpn_dr_hide eq 0 }} checked="checked" {{/if}} />
       <span class="switch-label" data-on="Yes" data-off="No"></span> 
       <span class="switch-handle"></span> <br />
  </label>

</div>
<div style="width:25%; float:right;">
  Notes: <br />
 <textarea rows="3" cols="40" name="proposal[dpn_notes]">{{$dpn_notes}}</textarea>
</div><br />
File Path - 1  <input type="text" name="proposal[dpn_link1]" value="{{$dpn_link1}}" style="width:700px;"  />
&nbsp; &nbsp;Created By : <input type="text" name="proposal[dpn_created_by]" value="{{$dpn_created_by}}" style="width:200px;" readonly="readonly"  />
 <br />
File Path - 2  <input type="text" name="proposal[dpn_link2]" value="{{$dpn_link2}}" style="width:700px;"  /> 
&nbsp; &nbsp;Created Date : <input type="text" name="proposal[dpn_created_date]" value="{{$dpn_created_date}}" style="width:100px;" readonly="readonly" placeholder="Date will appear after save"/>
<br />

Youtube Winter <input type="text" name="proposal[dpn_you_winter]" value="{{$dpn_you_winter}}" style="width:700px;"  /> 
Budget :<input type="text" name="proposal[dpn_budget]" value="{{$dpn_budget}}"}} style="width:180px;"  /> <br />
Youtube Summer <input type="text" name="proposal[dpn_you_summer]" value="{{$dpn_you_summer}}" style="width:700px;"  /> 

If existing design what the design no <input type="text" name="proposal[dpn_ex_designno]" value="{{$dpn_ex_designno}}"}} style="width:40px;"  />            <br />
<input type="submit" name="table_name" value="Save" />
&nbsp; &nbsp; 

<input type="button" name="addfile" value="Compose Email" onclick="javascript:modelwindow('{{$BASE_URL}}business.proposalchecklistemail/bus_id/{{$bsn_id_mini}}/dpn_proposal_number/1','90%','90%', 'yes');" id="addfile" class="vsml" />

</form>
</div>
<table cellpadding="0" cellspacing="0" width="100%" id="divtruelog" style="border-collapse:collapse;">
  <tr>
    <th width="18%">Action</th>
    <th width="25%">Document Name</th>
    <th width="18%">File Name</th>
    <th width="6%">Date Uploaded</th>
    <th width="7%">User Name</th>
    <th width="10%">Customer WWW</th>
  </tr>
   <form name="nr" method="post" action="">
  {{foreach from=$print_data_mini item=item key=key}}
  {{if $item.doc_not_required eq 1}}
  	<tr id="gr{{$item.doc_id}}" style="background:#CCC;" >
  {{else}}
    <tr id="gr{{$item.doc_id}}" >
  {{/if}}
    <td><a href="javascript:RequestcheckListIframe('checklistmini','{{$item.doc_id}}','{{$item.doc_checklist_number}}','');" >
    <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>
    &nbsp;&nbsp;
    
    <br />
     Make Not Required:
     <input type hidden name = "not_required[{{$item.doc_id}}][doc_id]" value = "{{$item.doc_id}}"  />
     <input type="checkbox" name = "not_required[{{$item.doc_id}}][doc_not_required]" id="notreq{{$item.doc_id}}" onclick="process({{$item.doc_bsn_id}},{{$item.doc_id}});" {{if $item.doc_not_required eq 1 }} checked="checked" {{/if}} /> 
     <p id="myElem{{$item.doc_id}}" style="display:none;"></p>

    
    </td>
    <td style="padding-left:5px;">{{$item.admin_doc_manual}}{{if $item.doc_file_name !== '' && $item.admin_doc_id == 12}} CONTRACT SIGNED {{else}}{{$item.admin_doc_name}}{{/if}}</td>
	
    {{if !empty($ipad)}} 
    <td style="text-align:left;"><a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name}}?dummy={{$ran}}" class="action_checklist" title="{{$item.doc_file_name}}" target="_blank">{{$item.doc_file_name|truncate:"40"}}</a></td>
   
    {{else}}
   <td style="text-align:left;"><a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name}}?dummy={{$ran}}')" class="action_checklist" title="{{$item.doc_file_name}}">{{$item.doc_file_name|truncate:"40"}}</a></td>
     {{/if}}

    <td style="text-align:center;">{{if !empty($item.doc_file_name)}}{{$item.doc_date_uploaded|date_format:"%d/%m/%Y"}}{{/if}}</td>
    <td style="text-align:center;">{{$item.user_name}}</td>
 <!--   <td style="text-align:center;"><input type="checkbox" {{if $item.doc_upload_to_dossier == 1}} checked="checked"{{/if}} disabled="disabled" /></td>
    <td style="text-align:center;"><input type="checkbox" {{if $item.doc_not_avail == 1}} checked="checked"{{/if}} disabled="disabled" /></td>
-->   
 <td style="text-align:left;">
<input type="radio" name="not_required[{{$item.doc_id}}][cwww]" value="1"  {{if $item.doc_cust_www  == 1}} checked="checked" {{/if}}/> <span style="padding-top:5px;"> Yes </span> <br />
<input type="radio" name="not_required[{{$item.doc_id}}][cwww]" value="0"  {{if $item.doc_cust_www == 0}} checked="checked" {{/if}} /> NO 
</td>
  </tr>
  {{/foreach}}
  

  {{if !empty($cus_minidata)}}


   {{foreach from=$cus_minidata item=itemc key=keyc}}
   
   {{if !empty($itemc.cdc_doc_name)}}
   {{if $itemc.cdc_not_required eq 1}}
  	<tr id="grc{{$itemc.cdc_id}}" style="background:#CCC;" >
   {{else}}
    <tr id="grc{{$itemc.cdc_id}}" >
   {{/if}}

  <td><a href="javascript:RequestcheckListIframe('adddoc_checklistmini','{{$itemc.cdc_id}}','1','');" >
    <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a><br />
     Make Not Required:
     <input type hidden name = "not_required_custom[{{$itemc.cdc_id}}][cdc_id]" value = "{{$itemc.cdc_id}}"  />
     <input type="checkbox" name = "not_required_custom[{{$itemc.cdc_id}}][cdc_not_required]" id="notreq2{{$itemc.cdc_id}}" onclick="process2({{$itemc.cdc_bsn_id}},{{$itemc.cdc_id}});" {{if $itemc.cdc_not_required eq 1 }} checked="checked" {{/if}} /> 
     <p id="myElem2{{$itemc.cdc_id}}" style="display:none;"></p>
     </td>
  <td>{{$itemc.cdc_doc_name}}</td>
   
   {{if !empty($ipad)}} 
    <td style="text-align:left;"><a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$itemc.cdc_file_name}}?dummy={{$ran}}" class="action_checklist" title="{{$itemc.cdc_file_name}}" target="_blank">{{$itemc.cdc_file_name|truncate:"40"}}</a></td>
   
    {{else}}
   <td style="text-align:left;"><a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$itemc.cdc_file_name}}?dummy={{$ran}}')" class="action_checklist" title="{{$itemc.cdc_file_name}}">{{$itemc.cdc_file_name|truncate:"40"}}</a></td>
     {{/if}}
  
  
  
  <td> {{if !empty($itemc.cdc_file_name)}} {{$itemc.cdc_date_uploaded|date_format:"%d/%m/%Y"}} {{/if}} </td>
  <td> {{$itemc.cdc_user_name}} </td>
  <td> 
  <input type="radio" name="not_required_custom[{{$itemc.cdc_id}}][cwww]" value="1"  {{if $itemc.cdc_cust_www  == 1}} checked="checked" {{/if}}/> <span style="padding-top:5px;"> Yes </span> <br />
  <input type="radio" name="not_required_custom[{{$itemc.cdc_id}}][cwww]" value="0"  {{if $itemc.cdc_cust_www == 0}} checked="checked" {{/if}} /> NO 

   </td>
  </tr>
  {{/if}}
  
  {{/foreach}}
  {{/if}}
  
  
   <tr> <td colspan="6"><input type="submit" name="not_required_save" value="Update Proposal List" />
   <!--<a href="javascript:RequestcheckListIframe('adddoc_checklistmini','','{{$bsn_id_mini}}','1');" class="btn" >-->
   <a href="javascript:RequestcheckListIframe('adddoc_checklistmini','','1','');" >Add New Document</a> &nbsp; &nbsp;
    
      <strong> <span style="border:1px solid #AAA; padding:4px;"> Task List {{$done}}/{{$tot}} </span> </strong> &nbsp; &nbsp;
      <input type="button" value="Add Tasks / Sync Task" onclick="requestAddTaskProposal(1);" />
     <!-- <input type="hidden" id="bt_task_list_number" value="1" />-->
      <input type="button" value="Load Proposal Task List" onclick="requestAllTasksProposal(0,1);" />
      <input type="button" value="Show Hide Proposal Task List" onclick="javascript:parent.toggleDiv('myContent1');" />
    
   </td>
   <!--<input type="button" name="CreateDocumentCheckList" value="Create New" onclick="requestDocumentCheckListMini('add_new');" />-->
  </tr>
  </form>

</table>
<table width="100%" >  
    <tr> <td>  <div id="taskmsgproposal" style="color:#FF6600;" align="left"></div> </td> </tr>
    <tr> <td> <div id="AllTaskDivProposal1"></div> </td> </tr>
    <tr> <td> <div id="editTaskDivProposal" align="left"></div> </td> </tr>
</table>

{{/if}}


{{if !empty($print_data_mini2)}}
<br />
<div style="font-style:bold; text-align:left; padding:5px;"> 
<form name="tablename" method="post" action="" >
<input type="hidden" name="proposal[dpn_bsn_id]" value="{{$bsn_id_mini}}" />
<input type="hidden" name="proposal[dpn_proposal_number]" value="2" />
<div style="width:75%; float:left;">
Document Proposal : <input type="text" name="proposal[dpn_name]" value="{{$dpn_name_2}}"}} style="width:400px;"  />
Primary Design : <input type="radio" name="proposal[dpn_primary_design]" value="1"  {{if $dpn_primary_design_2  == 1}} checked="checked" {{/if}}/>  Yes  &nbsp; 
<input type="radio" name="proposal[dpn_primary_design]" value="0"  {{if $dpn_primary_design_2 == 0}} checked="checked" {{/if}} /> NO <br />
Design Type : <select name="proposal[dpn_design_type]">
<option value="1" {{if $dpn_design_type_2 eq 1}} selected="selected" {{/if}}>Concept Design</option>
<option value="2" {{if $dpn_design_type_2 eq 2}} selected="selected" {{/if}}>Modification Design</option>
<option value="3" {{if $dpn_design_type_2 eq 3}} selected="selected" {{/if}}>Existing Design</option>
<option value="4" {{if $dpn_design_type_2 eq 4}} selected="selected" {{/if}}>External Design </option>
</select> &nbsp &nbsp; &nbsp;
Customer Designer: <input type="text" name="proposal[dpn_customer_designer]" value="{{$dpn_customer_designer_2}}"}} style="width:200px;" /> &nbsp; 
Arch : <input type="text" name="proposal[dpn_architect]" value="{{$dpn_architect_2}}" style="width:200px;"  />

<br />


Checklist Number : 
<input type="hidden" name="proposal[dpn_unique_id]" value="{{$dpn_unique_id_2}}" style="width:200px;"  readonly="readonly" /> {{$dpn_unique_id_2}} &nbsp;
Project Type : <select name="proposal[dpn_project_type]">
<option value="1" {{if $dpn_project_type_2 eq 1}} selected="selected" {{/if}}>SR</option>
<option value="2" {{if $dpn_project_type_2 eq 2}} selected="selected" {{/if}}>FPE</option>
<option value="3" {{if $dpn_project_type_2 eq 3}} selected="selected" {{/if}}>Other</option>
</select>
&nbsp; &nbsp;
Include in report : <input type="radio" name="proposal[dpn_include_in_report]" value="1"  {{if $dpn_include_in_report_2  == 1}} checked="checked" {{/if}}/>  Yes  &nbsp; 
<input type="radio" name="proposal[dpn_include_in_report]" value="0"  {{if $dpn_include_in_report_2 == 0}} checked="checked" {{/if}} /> NO 
&nbsp; &nbsp;

Include in Entity Report : <input type="radio" name="proposal[dpn_add_to_er]" value="1"  {{if $dpn_add_to_er_2  == 1}} checked="checked" {{/if}}/>  Yes  &nbsp; 
<input type="radio" name="proposal[dpn_add_to_er]" value="0"  {{if $dpn_add_to_er_2 == 0}} checked="checked" {{/if}} /> NO

<br />  Show on Design report : 
<input type="hidden" name="proposal[dpn_dr_hide]" value="1" />
 <label class="switch">
 <input class="switch-input" type="checkbox"  name="proposal[dpn_dr_hide]" value="0" onclick="this.form.submit();" {{if $dpn_dr_hide_2 eq 0 }} checked="checked" {{/if}} />
       <span class="switch-label" data-on="Yes" data-off="No"></span> 
       <span class="switch-handle"></span> <br />
  </label>
</div>
<div style="width:25%; float:right;">
Notes: <br />
 <textarea rows="3" cols="40" name="proposal[dpn_notes]">{{$dpn_notes_2}}</textarea>
</div>
<br />
File Path - 1  <input type="text" name="proposal[dpn_link1]" value="{{$dpn_link1_2}}"}} style="width:700px;"  /> 
&nbsp; &nbsp;Created By : <input type="text" name="proposal[dpn_created_by]" value="{{$dpn_created_by_2}}" style="width:200px;" readonly="readonly"  />
 <br />

File Path - 2  <input type="text" name="proposal[dpn_link2]" value="{{$dpn_link2_2}}"}} style="width:700px;"  />
&nbsp; &nbsp;Created Date : <input type="text" name="proposal[dpn_created_date]" value="{{$dpn_created_date_2}}" style="width:100px;" readonly="readonly" placeholder="Date will appear after save"/>
<br />

Youtube Winter <input type="text" name="proposal[dpn_you_winter]" value="{{$dpn_you_winter_2}}" style="width:700px;"  /> 
Budget :<input type="text" name="proposal[dpn_budget]" value="{{$dpn_budget_2}}"}} style="width:180px;"  /> <br />
Youtube Summer <input type="text" name="proposal[dpn_you_summer]" value="{{$dpn_you_summer_2}}" style="width:700px;"  /> 

If existing design what the design no <input type="text" name="proposal[dpn_ex_designno]" value="{{$dpn_ex_designno_2}}"}} style="width:40px;"  /> <br />
<input type="submit" name="table_name" value="Save" />
&nbsp; &nbsp; 

<input type="button" name="addfile" value="Compose Email" onclick="javascript:modelwindow('{{$BASE_URL}}business.proposalchecklistemail/bus_id/{{$bsn_id_mini}}/dpn_proposal_number/2','90%','90%', 'yes');" id="addfile" class="vsml" />
<!--<input type="button" name="CreateDocumentCheckList" value="Create New" onclick="javascript:if(!confirm('Are you sure you want to create new Document Proposal?')) return false;requestDocumentCheckListMini('add_new');" />
-->
</form>

</div>
<table cellpadding="0" cellspacing="0" width="100%" id="divtruelog" style="border-collapse:collapse;">
  <tr>
    <th width="18%">Action</th>
    <th width="25%">Document Name</th>
    <th width="18%">File Name</th>
    <th width="6%">Date Uploaded</th>
    <th width="7%">User Name</th>
    <th width="10%">Customer WWW</th>
  </tr>
   <form name="nr" method="post" action="">
  {{foreach from=$print_data_mini2 item=item key=key}}
  {{if $item.doc_not_required eq 1}}
  	<tr id="gr{{$item.doc_id}}" style="background:#CCC;" >
  {{else}}
    <tr id="gr{{$item.doc_id}}" >
  {{/if}}
    <td><a href="javascript:RequestcheckListIframe('checklistmini','{{$item.doc_id}}','{{$item.doc_checklist_number}}','');" >
    <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a><br />
     Make Not Required:
     <input type hidden name = "not_required[{{$item.doc_id}}][doc_id]" value = "{{$item.doc_id}}"  />
     <input type="checkbox" name = "not_required[{{$item.doc_id}}][doc_not_required]" id="notreq{{$item.doc_id}}" onclick="process({{$item.doc_bsn_id}},{{$item.doc_id}});" {{if $item.doc_not_required eq 1 }} checked="checked" {{/if}} /> 
     <p id="myElem{{$item.doc_id}}" style="display:none;"></p>

    
    </td>
    <td style="padding-left:5px;">{{$item.admin_doc_manual}}{{if $item.doc_file_name !== '' && $item.admin_doc_id == 12}} CONTRACT SIGNED {{else}}{{$item.admin_doc_name}}{{/if}}</td>
	
    {{if !empty($ipad)}} 
    <td style="text-align:left;"><a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name}}?dummy={{$ran}}" class="action_checklist" title="{{$item.doc_file_name}}" target="_blank">{{$item.doc_file_name|truncate:"40"}}</a></td>
   
    {{else}}
   <td style="text-align:left;"><a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name}}?dummy={{$ran}}')" class="action_checklist" title="{{$item.doc_file_name}}">{{$item.doc_file_name|truncate:"40"}}</a></td>
     {{/if}}

    <td style="text-align:center;">{{$item.doc_date_uploaded|date_format:"%d/%m/%Y"}}</td>
    <td style="text-align:center;">{{$item.user_name}}</td>
 <td style="text-align:left;">
<input type="radio" name="not_required[{{$item.doc_id}}][cwww]" value="1"  {{if $item.doc_cust_www  == 1}} checked="checked" {{/if}}/> <span style="padding-top:5px;"> Yes </span> <br />
<input type="radio" name="not_required[{{$item.doc_id}}][cwww]" value="0"  {{if $item.doc_cust_www == 0}} checked="checked" {{/if}} /> NO 
</td>
  </tr>
  {{/foreach}}
  

  {{if !empty($cus_minidata2)}}

   {{foreach from=$cus_minidata2 item=itemc key=keyc}}
   {{if $itemc.cdc_not_required eq 1}}
  	<tr id="grc{{$itemc.cdc_id}}" style="background:#CCC;" >
  {{else}}
    <tr id="grc{{$itemc.cdc_id}}" >
  {{/if}}

  <td><a href="javascript:RequestcheckListIframe('adddoc_checklistmini','{{$itemc.cdc_id}}','2','');" >
    <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a><br />
     Make Not Required:
     <input type hidden name = "not_required_custom[{{$itemc.cdc_id}}][cdc_id]" value = "{{$itemc.cdc_id}}"  />
     <input type="checkbox" name = "not_required_custom[{{$itemc.cdc_id}}][cdc_not_required]" id="notreq2{{$itemc.cdc_id}}" onclick="process2({{$itemc.cdc_bsn_id}},{{$itemc.cdc_id}});" {{if $itemc.cdc_not_required eq 1 }} checked="checked" {{/if}} /> 
     <p id="myElem2{{$itemc.cdc_id}}" style="display:none;"></p>
     </td>
  <td> {{$itemc.cdc_doc_name}} </td>
  {{if !empty($ipad)}} 
    <td style="text-align:left;"><a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$itemc.cdc_file_name}}?dummy={{$ran}}" class="action_checklist" title="{{$itemc.cdc_file_name}}" target="_blank">{{$itemc.cdc_file_name|truncate:"40"}}</a></td>
   
    {{else}}
   <td style="text-align:left;"><a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$itemc.cdc_file_name}}?dummy={{$ran}}')" class="action_checklist" title="{{$item.doc_file_name}}">{{$itemc.cdc_file_name|truncate:"40"}}</a></td>
     {{/if}}
  <td> {{$itemc.cdc_date_uploaded|date_format:"%d/%m/%Y"}}</td>
  <td> {{$itemc.cdc_user_name}} </td>
  <td> 
<input type="radio" name="not_required_custom[{{$itemc.cdc_id}}][cwww]" value="1"  {{if $itemc.cdc_cust_www  == 1}} checked="checked" {{/if}}/> <span style="padding-top:5px;"> Yes </span> <br />
<input type="radio" name="not_required_custom[{{$itemc.cdc_id}}][cwww]" value="0"  {{if $itemc.cdc_cust_www == 0}} checked="checked" {{/if}} /> NO 

   </td>
  </tr>
  {{/foreach}}
  {{/if}}
  
  
   <tr> <td colspan="6"><input type="submit" name="not_required_save" value="Update Proposal List" />
   <a href="javascript:RequestcheckListIframe('adddoc_checklistmini','','2','');" class="btn" >
    Add New Document</a> &nbsp;
      <strong> <span style="border:1px solid #AAA; padding:4px;"> Task List {{$done2}}/{{$tot2}} </span> </strong> &nbsp; &nbsp;
      <input type="button" value="Add Tasks / Sync Task" onclick="requestAddTaskProposal(2);" />
      <input type="button" value="Load Proposal Task List" onclick="requestAllTasksProposal(0,2);" />
      <input type="button" value="Show Hide Proposal Task List" onclick="javascript:parent.toggleDiv('myContent2');" />
    
   </td>
   
  </tr>
  </form>
</table>
<table width="100%" >  
    <tr> <td>  <div id="taskmsgproposal" style="color:#FF6600;" align="left"></div> </td> </tr>
    <tr> <td> <div id="AllTaskDivProposal2"></div> </td> </tr>
    <tr> <td> <div id="editTaskDivProposal" align="left"></div> </td> </tr>
</table>
{{/if}}


{{if !empty($print_data_mini3)}}
<br />
<div style="font-style:bold; text-align:left; padding:5px;">
<form name="tablename" method="post" action="" >
<input type="hidden" name="proposal[dpn_bsn_id]" value="{{$bsn_id_mini}}" />
<input type="hidden" name="proposal[dpn_proposal_number]" value="3" />
<div style="width:75%; float:left;">
Document Proposal : <input type="text" name="proposal[dpn_name]" value="{{$dpn_name_3}}"}} style="width:400px;"  />
Primary Design : <input type="radio" name="proposal[dpn_primary_design]" value="1"  {{if $dpn_primary_design_3  == 1}} checked="checked" {{/if}}/>  Yes  &nbsp; 
<input type="radio" name="proposal[dpn_primary_design]" value="0"  {{if $dpn_primary_design_3 == 0}} checked="checked" {{/if}} /> NO <br />
Design Type : <select name="proposal[dpn_design_type]">
<option value="1" {{if $dpn_design_type_3 eq 1}} selected="selected" {{/if}}>Concept Design</option>
<option value="2" {{if $dpn_design_type_3 eq 2}} selected="selected" {{/if}}>Modification Design</option>
<option value="3" {{if $dpn_design_type_3 eq 3}} selected="selected" {{/if}}>Existing Design</option>
<option value="4" {{if $dpn_design_type_3 eq 4}} selected="selected" {{/if}}>External Design </option>
</select> &nbsp &nbsp; &nbsp;
Customer Designer: <input type="text" name="proposal[dpn_customer_designer]" value="{{$dpn_customer_designer_3}}"}} style="width:200px;" /> &nbsp; 
Arch : <input type="text" name="proposal[dpn_architect]" value="{{$dpn_architect_3}}" style="width:200px;"  />
<br />

Checklist Number : 
<input type="hidden" name="proposal[dpn_unique_id]" value="{{$dpn_unique_id_3}}" style="width:200px;" readonly="readonly" />{{$dpn_unique_id_3}} &nbsp;
Project Type : <select name="proposal[dpn_project_type]">
<option value="1" {{if $dpn_project_type_3 eq 1}} selected="selected" {{/if}}>SR</option>
<option value="2" {{if $dpn_project_type_3 eq 2}} selected="selected" {{/if}}>FPE</option>
<option value="3" {{if $dpn_project_type_3 eq 3}} selected="selected" {{/if}}>Other</option>
</select>&nbsp; &nbsp;
Include in report : <input type="radio" name="proposal[dpn_include_in_report]" value="1"  {{if $dpn_include_in_report_3  == 1}} checked="checked" {{/if}}/>  Yes  &nbsp; 
<input type="radio" name="proposal[dpn_include_in_report]" value="0"  {{if $dpn_include_in_report_3 == 0}} checked="checked" {{/if}} /> NO 
&nbsp; &nbsp;

Include in Entity Report : <input type="radio" name="proposal[dpn_add_to_er]" value="1"  {{if $dpn_add_to_er_3  == 1}} checked="checked" {{/if}}/>  Yes  &nbsp; 
<input type="radio" name="proposal[dpn_add_to_er]" value="0"  {{if $dpn_add_to_er_3 == 0}} checked="checked" {{/if}} /> NO

<br />  Show on Design report : 
<input type="hidden" name="proposal[dpn_dr_hide]" value="1" />
 <label class="switch">
 <input class="switch-input" type="checkbox"  name="proposal[dpn_dr_hide]" value="0" onclick="this.form.submit();" {{if $dpn_dr_hide_3 eq 0 }} checked="checked" {{/if}} />
       <span class="switch-label" data-on="Yes" data-off="No"></span> 
       <span class="switch-handle"></span> <br />
  </label>
</div>
<div style="width:25%; float:right;">
Notes: <br />
 <textarea rows="3" cols="40" name="proposal[dpn_notes]">{{$dpn_notes_3}}</textarea>
</div>
<br />
File Path - 1  <input type="text" name="proposal[dpn_link1]" value="{{$dpn_link1_3}}"}} style="width:700px;"  /> 
&nbsp; &nbsp;Created By : <input type="text" name="proposal[dpn_created_by]" value="{{$dpn_created_by_3}}" style="width:200px;" readonly="readonly"  />
 <br />
File Path - 2  <input type="text" name="proposal[dpn_link2]" value="{{$dpn_link2_3}}"}} style="width:700px;"  /> 
&nbsp; &nbsp;Created Date : <input type="text" name="proposal[dpn_created_date]" value="{{$dpn_created_date_3}}" style="width:100px;" readonly="readonly" placeholder="Date will appear after save"/>
<br />


Youtube Winter <input type="text" name="proposal[dpn_you_winter]" value="{{$dpn_you_winter_3}}" style="width:700px;"  /> 
Budget :<input type="text" name="proposal[dpn_budget]" value="{{$dpn_budget_3}}"}} style="width:180px;"  /> <br />
Youtube Summer <input type="text" name="proposal[dpn_you_summer]" value="{{$dpn_you_summer_3}}" style="width:700px;"  /> 

If existing design what the design no <input type="text" name="proposal[dpn_ex_designno]" value="{{$dpn_ex_designno_3}}"}} style="width:40px;"  /> <br />
<input type="submit" name="table_name" value="Save" />

&nbsp; &nbsp;

<input type="button" name="addfile" value="Compose Email" onclick="javascript:modelwindow('{{$BASE_URL}}business.proposalchecklistemail/bus_id/{{$bsn_id_mini}}/dpn_proposal_number/3','90%','90%', 'yes');" id="addfile" class="vsml" /> 
<!--<input type="button" name="CreateDocumentCheckList" value="Create New" onclick="javascript:if(!confirm('Are you sure you want to create new Document Proposal?')) return false;requestDocumentCheckListMini('add_new');" />
--></form>

 </div>
<table cellpadding="0" cellspacing="0" width="100%" id="divtruelog" style="border-collapse:collapse;">
  <tr>
    <th width="18%">Action</th>
    <th width="25%">Document Name</th>
    <th width="18%">File Name</th>
    <th width="6%">Date Uploaded</th>
    <th width="7%">User Name</th>
    <th width="10%">Customer WWW</th>
  </tr>
   <form name="nr" method="post" action="">
  {{foreach from=$print_data_mini3 item=item key=key}}
  {{if $item.doc_not_required eq 1}}
  	<tr id="gr{{$item.doc_id}}" style="background:#CCC;" >
  {{else}}
    <tr id="gr{{$item.doc_id}}" >
  {{/if}}
    <td><a href="javascript:RequestcheckListIframe('checklistmini','{{$item.doc_id}}','{{$item.doc_checklist_number}}','');" >
    <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a><br />
     Make Not Required:
     <input type hidden name = "not_required[{{$item.doc_id}}][doc_id]" value = "{{$item.doc_id}}"  />
     <input type="checkbox" name = "not_required[{{$item.doc_id}}][doc_not_required]" id="notreq{{$item.doc_id}}" onclick="process({{$item.doc_bsn_id}},{{$item.doc_id}});" {{if $item.doc_not_required eq 1 }} checked="checked" {{/if}} /> 
     <p id="myElem{{$item.doc_id}}" style="display:none;"></p>

    
    </td>
    <td style="padding-left:5px;">{{$item.admin_doc_manual}}{{if $item.doc_file_name !== '' && $item.admin_doc_id == 12}} CONTRACT SIGNED {{else}}{{$item.admin_doc_name}}{{/if}}</td>
	
    {{if !empty($ipad)}} 
    <td style="text-align:left;"><a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name}}?dummy={{$ran}}" class="action_checklist" title="{{$item.doc_file_name}}" target="_blank">{{$item.doc_file_name|truncate:"40"}}</a></td>
   
    {{else}}
   <td style="text-align:left;"><a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name}}?dummy={{$ran}}')" class="action_checklist" title="{{$item.doc_file_name}}">{{$item.doc_file_name|truncate:"40"}}</a></td>
     {{/if}}

    <td style="text-align:center;">{{$item.doc_date_uploaded|date_format:"%d/%m/%Y"}}</td>
    <td style="text-align:center;">{{$item.user_name}}</td>
 <td style="text-align:left;">
<input type="radio" name="not_required[{{$item.doc_id}}][cwww]" value="1"  {{if $item.doc_cust_www == 1}} checked="checked" {{/if}}/> <span style="padding-top:5px;"> Yes </span> <br />
<input type="radio" name="not_required[{{$item.doc_id}}][cwww]" value="0"  {{if $item.doc_cust_www == 0}} checked="checked" {{/if}} /> NO 
</td>
  </tr>
  {{/foreach}}
  

  {{if !empty($cus_minidata3)}}

   {{foreach from=$cus_minidata3 item=itemc key=keyc}}
   {{if $itemc.cdc_not_required eq 1}}
  	<tr id="grc{{$itemc.cdc_id}}" style="background:#CCC;" >
  {{else}}
    <tr id="grc{{$itemc.cdc_id}}" >
  {{/if}}

  <td><a href="javascript:RequestcheckListIframe('adddoc_checklistmini','{{$itemc.cdc_id}}','3','');" >
    <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a><br />
     Make Not Required:
     <input type hidden name = "not_required_custom[{{$itemc.cdc_id}}][cdc_id]" value = "{{$itemc.cdc_id}}"  />
     <input type="checkbox" name = "not_required_custom[{{$itemc.cdc_id}}][cdc_not_required]" id="notreq2{{$itemc.cdc_id}}" onclick="process2({{$itemc.cdc_bsn_id}},{{$itemc.cdc_id}});" {{if $itemc.cdc_not_required eq 1 }} checked="checked" {{/if}} /> 
     <p id="myElem2{{$itemc.cdc_id}}" style="display:none;"></p>
     </td>
  <td> {{$itemc.cdc_doc_name}} </td>
  {{if !empty($ipad)}} 
    <td style="text-align:left;"><a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$itemc.cdc_file_name}}?dummy={{$ran}}" class="action_checklist" title="{{$itemc.cdc_file_name}}" target="_blank">{{$itemc.cdc_file_name|truncate:"40"}}</a></td>
   
    {{else}}
   <td style="text-align:left;"><a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$itemc.cdc_file_name}}?dummy={{$ran}}')" class="action_checklist" title="{{$item.doc_file_name}}">{{$itemc.cdc_file_name|truncate:"40"}}</a></td>
     {{/if}}
  <td> {{$itemc.cdc_date_uploaded|date_format:"%d/%m/%Y"}} </td>
  <td> {{$itemc.cdc_user_name}} </td>
  <td> 
  <input type="radio" name="not_required_custom[{{$itemc.doc_id}}][cwww]" value="1"  {{if $itemc.cdc_cust_www == 1}} checked="checked" {{/if}}/> <span style="padding-top:5px;"> Yes </span> <br />
  <input type="radio" name="not_required_custom[{{$itemc.doc_id}}][cwww]" value="0"  {{if $itemc.cdc_cust_www == 0}} checked="checked" {{/if}} /> NO 

   </td>
  </tr>
  {{/foreach}}
  {{/if}}
  
   <tr> <td colspan="6"><input type="submit" name="not_required_save" value="Update Proposal List" />
   <a href="javascript:RequestcheckListIframe('adddoc_checklistmini','','3','');" class="btn" >
    Add New Document</a> &nbsp;
      <strong> <span style="border:1px solid #AAA; padding:4px;"> Task List {{$done3}}/{{$tot3}} </span> </strong> &nbsp; &nbsp;
      <input type="button" value="Add Tasks / Sync Task" onclick="requestAddTaskProposal(3);" />
      <input type="button" value="Load Proposal Task List" onclick="requestAllTasksProposal(0,3);" />
      <input type="button" value="Show Hide Proposal Task List" onclick="javascript:parent.toggleDiv('myContent3');" />
   </td>
   
  </tr>
  </form>
</table>
<table width="100%" >  
    <tr> <td>  <div id="taskmsgproposal" style="color:#FF6600;" align="left"></div> </td> </tr>
    <tr> <td> <div id="AllTaskDivProposal3"></div> </td> </tr>
    <tr> <td> <div id="editTaskDivProposal" align="left"></div> </td> </tr>
</table>

{{/if}}

{{if !empty($print_data_mini4)}}
<br />
<div style="font-style:bold; text-align:left; padding:5px;">
<form name="tablename" method="post" action="" >
<input type="hidden" name="proposal[dpn_bsn_id]" value="{{$bsn_id_mini}}" />
<input type="hidden" name="proposal[dpn_proposal_number]" value="4" />
<div style="width:75%; float:left;">
Document Proposal : <input type="text" name="proposal[dpn_name]" value="{{$dpn_name_4}}"}} style="width:400px;"  />
Primary Design : <input type="radio" name="proposal[dpn_primary_design]" value="1"  {{if $dpn_primary_design_4  == 1}} checked="checked" {{/if}}/>  Yes  &nbsp; 
<input type="radio" name="proposal[dpn_primary_design]" value="0"  {{if $dpn_primary_design_4 == 0}} checked="checked" {{/if}} /> NO <br />
Design Type : <select name="proposal[dpn_design_type]">
<option value="1" {{if $dpn_design_type_4 eq 1}} selected="selected" {{/if}}>Concept Design</option>
<option value="2" {{if $dpn_design_type_4 eq 2}} selected="selected" {{/if}}>Modification Design</option>
<option value="3" {{if $dpn_design_type_4 eq 3}} selected="selected" {{/if}}>Existing Design</option>
<option value="4" {{if $dpn_design_type_4 eq 4}} selected="selected" {{/if}}>External Design </option>
</select> &nbsp &nbsp; &nbsp;
Customer Designer: <input type="text" name="proposal[dpn_customer_designer]" value="{{$dpn_customer_designer_4}}"}} style="width:200px;"/> &nbsp; 
Arch : <input type="text" name="proposal[dpn_architect]" value="{{$dpn_architect_4}}" style="width:200px;"  />
<br />

Checklist Number : 
<input type="hidden" name="proposal[dpn_unique_id]" value="{{$dpn_unique_id_4}}" style="width:200px;" readonly="readonly" /> {{$dpn_unique_id_4}} &nbsp;
Project Type : <select name="proposal[dpn_project_type]">
<option value="1" {{if $dpn_project_type_4 eq 1}} selected="selected" {{/if}}>SR</option>
<option value="2" {{if $dpn_project_type_4 eq 2}} selected="selected" {{/if}}>FPE</option>
<option value="3" {{if $dpn_project_type_4 eq 3}} selected="selected" {{/if}}>Other</option>
</select>&nbsp; &nbsp;
Include in report : <input type="radio" name="proposal[dpn_include_in_report]" value="1"  {{if $dpn_include_in_report_4  == 1}} checked="checked" {{/if}}/>  Yes  &nbsp; 
<input type="radio" name="proposal[dpn_include_in_report]" value="0"  {{if $dpn_include_in_report_4 == 0}} checked="checked" {{/if}} /> NO 
&nbsp; &nbsp;

Include in Entity Report : <input type="radio" name="proposal[dpn_add_to_er]" value="1"  {{if $dpn_add_to_er_4  == 1}} checked="checked" {{/if}}/>  Yes  &nbsp; 
<input type="radio" name="proposal[dpn_add_to_er]" value="0"  {{if $dpn_add_to_er_4 == 0}} checked="checked" {{/if}} /> NO

<br />  Show on Design report : 
<input type="hidden" name="proposal[dpn_dr_hide]" value="1" />
 <label class="switch">
 <input class="switch-input" type="checkbox"  name="proposal[dpn_dr_hide]" value="0" onclick="this.form.submit();" {{if $dpn_dr_hide_4 eq 0 }} checked="checked" {{/if}} />
       <span class="switch-label" data-on="Yes" data-off="No"></span> 
       <span class="switch-handle"></span> <br />
  </label>
</div>
<div style="width:25%; float:right;">
Notes: <br>
 <textarea rows="3" cols="40" name="proposal[dpn_notes]">{{$dpn_notes_4}}</textarea>
</div>
<br />
File Path - 1  <input type="text" name="proposal[dpn_link1]" value="{{$dpn_link1_4}}"}} style="width:700px;"  /> 
&nbsp; &nbsp;Created By : <input type="text" name="proposal[dpn_created_by]" value="{{$dpn_created_by_4}}" style="width:200px;" readonly="readonly"  />
 <br />
File Path - 2  <input type="text" name="proposal[dpn_link2]" value="{{$dpn_link2_4}}"}} style="width:700px;"  />
&nbsp; &nbsp;Created Date : <input type="text" name="proposal[dpn_created_date]" value="{{$dpn_created_date_4}}" style="width:100px;" readonly="readonly" placeholder="Date will appear after save"/>
<br />


Youtube Winter <input type="text" name="proposal[dpn_you_winter]" value="{{$dpn_you_winter_4}}" style="width:700px;"  /> 
Budget :<input type="text" name="proposal[dpn_budget]" value="{{$dpn_budget_4}}"}} style="width:180px;"  /> <br />
Youtube Summer <input type="text" name="proposal[dpn_you_summer]" value="{{$dpn_you_summer_4}}" style="width:700px;"  /> 

If existing design what the design no <input type="text" name="proposal[dpn_ex_designno]" value="{{$dpn_ex_designno_4}}"}} style="width:40px;"  /> <br />
<input type="submit" name="table_name" value="Save" />

&nbsp; &nbsp; 

<input type="button" name="addfile" value="Compose Email" onclick="javascript:modelwindow('{{$BASE_URL}}business.proposalchecklistemail/bus_id/{{$bsn_id_mini}}/dpn_proposal_number/4','90%','90%', 'yes');" id="addfile" class="vsml" />
<!--<input type="button" name="CreateDocumentCheckList" value="Create New" onclick="javascript:if(!confirm('Are you sure you want to create new Document Proposal?')) return false;requestDocumentCheckListMini('add_new');" />
-->
</form>
</div>

<table cellpadding="0" cellspacing="0" width="100%" id="divtruelog" style="border-collapse:collapse;">
  <tr>
    <th width="18%">Action</th>
    <th width="25%">Document Name</th>
    <th width="18%">File Name</th>
    <th width="6%">Date Uploaded</th>
    <th width="7%">User Name</th>
    <th width="10%">Customer WWW</th>
  </tr>
   <form name="nr" method="post" action="">
  {{foreach from=$print_data_mini4 item=item key=key}}
  {{if $item.doc_not_required eq 1}}
  	<tr id="gr{{$item.doc_id}}" style="background:#CCC;" >
  {{else}}
    <tr id="gr{{$item.doc_id}}" >
  {{/if}}
    <td><a href="javascript:RequestcheckListIframe('checklistmini','{{$item.doc_id}}','{{$item.doc_checklist_number}}','');" >
    <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a><br />
     Make Not Required:
     <input type hidden name = "not_required[{{$item.doc_id}}][doc_id]" value = "{{$item.doc_id}}"  />
     <input type="checkbox" name = "not_required[{{$item.doc_id}}][doc_not_required]" id="notreq{{$item.doc_id}}" onclick="process({{$item.doc_bsn_id}},{{$item.doc_id}});" {{if $item.doc_not_required eq 1 }} checked="checked" {{/if}} /> 
     <p id="myElem{{$item.doc_id}}" style="display:none;"></p>

    
    </td>
    <td style="padding-left:5px;">{{$item.admin_doc_manual}}{{if $item.doc_file_name !== '' && $item.admin_doc_id == 12}} CONTRACT SIGNED {{else}}{{$item.admin_doc_name}}{{/if}}</td>
	
    {{if !empty($ipad)}} 
    <td style="text-align:left;"><a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name}}?dummy={{$ran}}" class="action_checklist" title="{{$item.doc_file_name}}" target="_blank">{{$item.doc_file_name|truncate:"40"}}</a></td>
   
    {{else}}
   <td style="text-align:left;"><a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name}}?dummy={{$ran}}')" class="action_checklist" title="{{$item.doc_file_name}}">{{$item.doc_file_name|truncate:"40"}}</a></td>
     {{/if}}

    <td style="text-align:center;">{{$item.doc_date_uploaded|date_format:"%d/%m/%Y"}}</td>
    <td style="text-align:center;">{{$item.user_name}}</td>
 <td style="text-align:left;">
<input type="radio" name="not_required[{{$item.doc_id}}][cwww]" value="1"  {{if $item.doc_cust_www == 1}} checked="checked" {{/if}}/> <span style="padding-top:5px;"> Yes </span> <br />
<input type="radio" name="not_required[{{$item.doc_id}}][cwww]" value="0"  {{if $item.doc_cust_www == 0}} checked="checked" {{/if}} /> NO 
</td>
  </tr>
  {{/foreach}}
  

  {{if !empty($cus_minidata4)}}

   {{foreach from=$cus_minidata4 item=itemc key=keyc}}
   {{if $itemc.cdc_not_required eq 1}}
  	<tr id="grc{{$itemc.cdc_id}}" style="background:#CCC;" >
  {{else}}
    <tr id="grc{{$itemc.cdc_id}}" >
  {{/if}}

  <td><a href="javascript:RequestcheckListIframe('adddoc_checklistmini','{{$itemc.cdc_id}}','4','');" >
    <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a><br />
     Make Not Required:
     <input type hidden name = "not_required_custom[{{$itemc.cdc_id}}][cdc_id]" value = "{{$itemc.cdc_id}}"  />
     <input type="checkbox" name = "not_required_custom[{{$itemc.cdc_id}}][cdc_not_required]" id="notreq2{{$itemc.cdc_id}}" onclick="process2({{$itemc.cdc_bsn_id}},{{$itemc.cdc_id}});" {{if $itemc.cdc_not_required eq 1 }} checked="checked" {{/if}} /> 
     <p id="myElem2{{$itemc.cdc_id}}" style="display:none;"></p>
     </td>
  <td> {{$itemc.cdc_doc_name}} </td>
  {{if !empty($ipad)}} 
    <td style="text-align:left;"><a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$itemc.cdc_file_name}}?dummy={{$ran}}" class="action_checklist" title="{{$itemc.cdc_file_name}}" target="_blank">{{$itemc.cdc_file_name|truncate:"40"}}</a></td>
   
    {{else}}
   <td style="text-align:left;"><a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$itemc.cdc_file_name}}?dummy={{$ran}}')" class="action_checklist" title="{{$item.doc_file_name}}">{{$itemc.cdc_file_name|truncate:"40"}}</a></td>
     {{/if}}
  <td> {{$itemc.cdc_date_uploaded|date_format:"%d/%m/%Y"}} </td>
  <td> {{$itemc.cdc_user_name}} </td>
  <td> 
<input type="radio" name="not_required_custom[{{$itemc.cdc_id}}][cwww]" value="1" {{if $itemc.cdc_cust_www == 1}} checked="checked" {{/if}}/> <span style="padding-top:5px;"> Yes </span> <br />
<input type="radio" name="not_required_custom[{{$itemc.cdc_id}}][cwww]" value="0" {{if $itemc.cdc_cust_www == 0}} checked="checked" {{/if}} /> NO 

   </td>
  </tr>
  {{/foreach}}
  {{/if}}
  
   <tr> <td colspan="6"><input type="submit" name="not_required_save" value="Update Proposal List" />
   <a href="javascript:RequestcheckListIframe('adddoc_checklistmini','','4','');" class="btn" >
    Add New Document</a>&nbsp;
      <strong> <span style="border:1px solid #AAA; padding:4px;"> Task List {{$done4}}/{{$tot4}} </span> </strong> &nbsp; &nbsp;
      <input type="button" value="Add Tasks / Sync Task" onclick="requestAddTaskProposal(4);" />
      <input type="button" value="Load Proposal Task List" onclick="requestAllTasksProposal(0,4);" />
      <input type="button" value="Show Hide Proposal Task List" onclick="javascript:parent.toggleDiv('myContent4');" />
   </td>
   
  </tr>
  </form>
</table>
<table width="100%" >  
    <tr> <td>  <div id="taskmsgproposal" style="color:#FF6600;" align="left"></div> </td> </tr>
    <tr> <td> <div id="AllTaskDivProposal4"></div> </td> </tr>
    <tr> <td> <div id="editTaskDivProposal" align="left"></div> </td> </tr>
</table>
{{/if}}

{{if !empty($print_data_mini5)}}
<br />
<div style="font-style:bold; text-align:left; padding:5px;"> 
<form name="tablename" method="post" action="" >
<input type="hidden" name="proposal[dpn_bsn_id]" value="{{$bsn_id_mini}}" />
<input type="hidden" name="proposal[dpn_proposal_number]" value="5" />
<div style="width:75%; float:left;">
Document Proposal : <input type="text" name="proposal[dpn_name]" value="{{$dpn_name_5}}"}} style="width:400px;"  />
Primary Design : <input type="radio" name="proposal[dpn_primary_design]" value="1"  {{if $dpn_primary_design_5  == 1}} checked="checked" {{/if}}/>  Yes  &nbsp; 
<input type="radio" name="proposal[dpn_primary_design]" value="0"  {{if $dpn_primary_design_5 == 0}} checked="checked" {{/if}} /> NO <br />
Design Type : <select name="proposal[dpn_design_type]">
<option value="1" {{if $dpn_design_type_5 eq 1}} selected="selected" {{/if}}>Concept Design</option>
<option value="2" {{if $dpn_design_type_5 eq 2}} selected="selected" {{/if}}>Modification Design</option>
<option value="3" {{if $dpn_design_type_5 eq 3}} selected="selected" {{/if}}>Existing Design</option>
<option value="4" {{if $dpn_design_type_5 eq 4}} selected="selected" {{/if}}>External Design </option>
</select> &nbsp &nbsp; &nbsp;
Customer Designer: <input type="text" name="proposal[dpn_customer_designer]" value="{{$dpn_customer_designer_5}}"}} style="width:200px;"/> &nbsp; 
Arch : <input type="text" name="proposal[dpn_architect]" value="{{$dpn_architect_5}}" style="width:200px;"  />
<br />

Checklist Number : 
<input type="hidden" name="proposal[dpn_unique_id]" value="{{$dpn_unique_id_5}}" style="width:200px;" readonly="readonly"  /> {{$dpn_unique_id_5}} &nbsp;
Project Type : <select name="proposal[dpn_project_type]">
<option value="1" {{if $dpn_project_type_5 eq 1}} selected="selected" {{/if}}>SR</option>
<option value="2" {{if $dpn_project_type_5 eq 2}} selected="selected" {{/if}}>FPE</option>
<option value="3" {{if $dpn_project_type_5 eq 3}} selected="selected" {{/if}}>Other</option>
</select>&nbsp; &nbsp;
Include in report : <input type="radio" name="proposal[dpn_include_in_report]" value="1"  {{if $dpn_include_in_report_5  == 1}} checked="checked" {{/if}}/>  Yes  &nbsp; 
<input type="radio" name="proposal[dpn_include_in_report]" value="0"  {{if $dpn_include_in_report_5 == 0}} checked="checked" {{/if}} /> NO 
&nbsp; &nbsp;

Include in Entity Report : <input type="radio" name="proposal[dpn_add_to_er]" value="1"  {{if $dpn_add_to_er_5  == 1}} checked="checked" {{/if}}/>  Yes  &nbsp; 
<input type="radio" name="proposal[dpn_add_to_er]" value="0"  {{if $dpn_add_to_er_5 == 0}} checked="checked" {{/if}} /> NO

<br />  Show on Design report : 
<input type="hidden" name="proposal[dpn_dr_hide]" value="1" />
 <label class="switch">
 <input class="switch-input" type="checkbox"  name="proposal[dpn_dr_hide]" value="0" onclick="this.form.submit();" {{if $dpn_dr_hide_5 eq 0 }} checked="checked" {{/if}} />
       <span class="switch-label" data-on="Yes" data-off="No"></span> 
       <span class="switch-handle"></span> <br />
  </label>

</div>
<div style="width:25%; float:right;">
Notes: <br>
 <textarea rows="3" cols="40" name="proposal[dpn_notes]">{{$dpn_notes_5}}</textarea>
</div>
<br />
File Path - 1  <input type="text" name="proposal[dpn_link1]" value="{{$dpn_link1_5}}"}} style="width:700px;"  /> 
&nbsp; &nbsp;Created By : <input type="text" name="proposal[dpn_created_by]" value="{{$dpn_created_by_5}}" style="width:200px;" readonly="readonly"  />
 <br />
File Path - 2  <input type="text" name="proposal[dpn_link2]" value="{{$dpn_link2_5}}"}} style="width:700px;"  /> 

&nbsp; &nbsp;Created Date : <input type="text" name="proposal[dpn_created_date]" value="{{$dpn_created_date_5}}" style="width:100px;" readonly="readonly" placeholder="Date will appear after save"/>
<br />

Youtube Winter <input type="text" name="proposal[dpn_you_winter]" value="{{$dpn_you_winter_5}}" style="width:700px;"  /> 
Budget :<input type="text" name="proposal[dpn_budget]" value="{{$dpn_budget_5}}"}} style="width:180px;"  /> <br />
Youtube Summer <input type="text" name="proposal[dpn_you_summer]" value="{{$dpn_you_summer_5}}" style="width:700px;"  /> 

If existing design what the design no <input type="text" name="proposal[dpn_ex_designno]" value="{{$dpn_ex_designno_5}}"}} style="width:40px;"  /> <br />
<input type="submit" name="table_name" value="Save" />

&nbsp; &nbsp; 

<input type="button" name="addfile" value="Compose Email" onclick="javascript:modelwindow('{{$BASE_URL}}business.proposalchecklistemail/bus_id/{{$bsn_id_mini}}/dpn_proposal_number/5','90%','90%', 'yes');" id="addfile" class="vsml" />
</form>

</div>

<table cellpadding="0" cellspacing="0" width="100%" id="divtruelog" style="border-collapse:collapse;">
  <tr>
    <th width="18%">Action</th>
    <th width="25%">Document Name</th>
    <th width="18%">File Name</th>
    <th width="6%">Date Uploaded</th>
    <th width="7%">User Name</th>
    <th width="10%">Customer WWW</th>
  </tr>
   <form name="nr" method="post" action="">
  {{foreach from=$print_data_mini5 item=item key=key}}
  {{if $item.doc_not_required eq 1}}
  	<tr id="gr{{$item.doc_id}}" style="background:#CCC;" >
  {{else}}
    <tr id="gr{{$item.doc_id}}" >
  {{/if}}
    <td><a href="javascript:RequestcheckListIframe('checklistmini','{{$item.doc_id}}','{{$item.doc_checklist_number}}','');" >
    <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a><br />
     Make Not Required:
     <input type hidden name = "not_required[{{$item.doc_id}}][doc_id]" value = "{{$item.doc_id}}"  />
     <input type="checkbox" name = "not_required[{{$item.doc_id}}][doc_not_required]" id="notreq{{$item.doc_id}}" onclick="process({{$item.doc_bsn_id}},{{$item.doc_id}});" {{if $item.doc_not_required eq 1 }} checked="checked" {{/if}} /> 
     <p id="myElem{{$item.doc_id}}" style="display:none;"></p>

    
    </td>
    <td style="padding-left:5px;">{{$item.admin_doc_manual}}{{if $item.doc_file_name !== '' && $item.admin_doc_id == 12}} CONTRACT SIGNED {{else}}{{$item.admin_doc_name}}{{/if}}</td>
	
    {{if !empty($ipad)}} 
    <td style="text-align:left;"><a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name}}?dummy={{$ran}}" class="action_checklist" title="{{$item.doc_file_name}}" target="_blank">{{$item.doc_file_name|truncate:"40"}}</a></td>
   
    {{else}}
   <td style="text-align:left;"><a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name}}?dummy={{$ran}}')" class="action_checklist" title="{{$item.doc_file_name}}">{{$item.doc_file_name|truncate:"40"}}</a></td>
     {{/if}}

    <td style="text-align:center;">{{$item.doc_date_uploaded|date_format:"%d/%m/%Y"}}</td>
    <td style="text-align:center;">{{$item.user_name}}</td>
 <td style="text-align:left;">
<input type="radio" name="not_required[{{$item.doc_id}}][cwww]" value="1" {{if $item.doc_cust_www  == 1}} checked="checked" {{/if}}/> <span style="padding-top:5px;"> Yes </span> <br />
<input type="radio" name="not_required[{{$item.doc_id}}][cwww]" value="0" {{if $item.doc_cust_www == 0}} checked="checked" {{/if}} /> NO 
</td>
  </tr>
  {{/foreach}}
  

  {{if !empty($cus_minidata5)}}

   {{foreach from=$cus_minidata5 item=itemc key=keyc}}
   {{if $itemc.cdc_not_required eq 1}}
  	<tr id="grc{{$itemc.cdc_id}}" style="background:#CCC;" >
  {{else}}
    <tr id="grc{{$itemc.cdc_id}}" >
  {{/if}}

  <td><a href="javascript:RequestcheckListIframe('adddoc_checklistmini','{{$itemc.cdc_id}}','5','');" >
    <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a><br />
     Make Not Required:
     <input type hidden name = "not_required_custom[{{$itemc.cdc_id}}][cdc_id]" value = "{{$itemc.cdc_id}}"  />
     <input type="checkbox" name = "not_required_custom[{{$itemc.cdc_id}}][cdc_not_required]" id="notreq2{{$itemc.cdc_id}}" onclick="process2({{$itemc.cdc_bsn_id}},{{$itemc.cdc_id}});" {{if $itemc.cdc_not_required eq 1 }} checked="checked" {{/if}} /> 
     <p id="myElem2{{$itemc.cdc_id}}" style="display:none;"></p>
     </td>
  <td> {{$itemc.cdc_doc_name}} </td>
 {{if !empty($ipad)}} 
    <td style="text-align:left;"><a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$itemc.cdc_file_name}}?dummy={{$ran}}" class="action_checklist" title="{{$itemc.cdc_file_name}}" target="_blank">{{$itemc.cdc_file_name|truncate:"40"}}</a></td>
   
    {{else}}
   <td style="text-align:left;"><a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$itemc.cdc_file_name}}?dummy={{$ran}}')" class="action_checklist" title="{{$item.doc_file_name}}">{{$itemc.cdc_file_name|truncate:"40"}}</a></td>
     {{/if}}
  <td> {{$itemc.cdc_date_uploaded|date_format:"%d/%m/%Y"}} </td>
  <td> {{$itemc.cdc_user_name}} </td>
  <td> 
<input type="radio" name="not_required_custom[{{$itemc.cdc_id}}][cwww]" value="1" {{if $itemc.cdc_cust_www == 1}} checked="checked" {{/if}}/> <span style="padding-top:5px;"> Yes </span> <br />
<input type="radio" name="not_required_custom[{{$itemc.cdc_id}}][cwww]" value="0" {{if $itemc.cdc_cust_www == 0}} checked="checked" {{/if}} /> NO 

   </td>
  </tr>
  {{/foreach}}
  {{/if}}
  
   <tr> <td colspan="6"><input type="submit" name="not_required_save" value="Update Proposal List" />
   <a href="javascript:RequestcheckListIframe('adddoc_checklistmini','','5','');" class="btn" >
    Add New Document</a>&nbsp;
      <strong> <span style="border:1px solid #AAA; padding:4px;"> Task List {{$done5}}/{{$tot5}} </span> </strong> &nbsp; &nbsp;
      <input type="button" value="Add Tasks / Sync Task" onclick="requestAddTaskProposal(5);" />
      <input type="button" value="Load Proposal Task List" onclick="requestAllTasksProposal(0,5);" />
      <input type="button" value="Show Hide Proposal Task List" onclick="javascript:parent.toggleDiv('myContent5');" />
   </td>
  
  </tr>
  </form>
</table>
<table width="100%" >  
    <tr> <td>  <div id="taskmsgproposal" style="color:#FF6600;" align="left"></div> </td> </tr>
    <tr> <td> <div id="AllTaskDivProposal5"></div> </td> </tr>
    <tr> <td> <div id="editTaskDivProposal" align="left"></div> </td> </tr>
</table>
{{/if}}


{{if !empty($print_data_mini6)}}
<br />
<div style="font-style:bold; text-align:left; padding:5px;"> 
<form name="tablename" method="post" action="" >
<input type="hidden" name="proposal[dpn_bsn_id]" value="{{$bsn_id_mini}}" />
<input type="hidden" name="proposal[dpn_proposal_number]" value="6" />
<div style="width:75%; float:left;">
Document Proposal : <input type="text" name="proposal[dpn_name]" value="{{$dpn_name_6}}"}} style="width:400px;"  />
Primary Design : <input type="radio" name="proposal[dpn_primary_design]" value="1"  {{if $dpn_primary_design_6  == 1}} checked="checked" {{/if}}/>  Yes  &nbsp; 
<input type="radio" name="proposal[dpn_primary_design]" value="0"  {{if $dpn_primary_design_6 == 0}} checked="checked" {{/if}} /> NO <br />
Design Type : <select name="proposal[dpn_design_type]">
<option value="1" {{if $dpn_design_type_6 eq 1}} selected="selected" {{/if}}>Concept Design</option>
<option value="2" {{if $dpn_design_type_6 eq 2}} selected="selected" {{/if}}>Modification Design</option>
<option value="3" {{if $dpn_design_type_6 eq 3}} selected="selected" {{/if}}>Existing Design</option>
<option value="4" {{if $dpn_design_type_6 eq 4}} selected="selected" {{/if}}>External Design </option>
</select> &nbsp &nbsp; &nbsp;
Customer Designer: <input type="text" name="proposal[dpn_customer_designer]" value="{{$dpn_customer_designer_6}}"}} style="width:200px;"/> &nbsp; <br />

Checklist Number : 
<input type="hidden" name="proposal[dpn_unique_id]" value="{{$dpn_unique_id_6}}" style="width:200px;"  readonly="readonly" /> {{$dpn_unique_id_6}} &nbsp;
Project Type : <select name="proposal[dpn_project_type]">
<option value="1" {{if $dpn_project_type_6 eq 1}} selected="selected" {{/if}}>SR</option>
<option value="2" {{if $dpn_project_type_6 eq 2}} selected="selected" {{/if}}>FPE</option>
<option value="3" {{if $dpn_project_type_6 eq 3}} selected="selected" {{/if}}>Other</option>
</select>&nbsp; &nbsp;
Include in report : <input type="radio" name="proposal[dpn_include_in_report]" value="1"  {{if $dpn_include_in_report_6  == 1}} checked="checked" {{/if}}/>  Yes  &nbsp; 
<input type="radio" name="proposal[dpn_include_in_report]" value="0"  {{if $dpn_include_in_report_6 == 0}} checked="checked" {{/if}} /> NO 
&nbsp; &nbsp;

Include in Entity Report : <input type="radio" name="proposal[dpn_add_to_er]" value="1"  {{if $dpn_add_to_er_6  == 1}} checked="checked" {{/if}}/>  Yes  &nbsp; 
<input type="radio" name="proposal[dpn_add_to_er]" value="0"  {{if $dpn_add_to_er_6 == 0}} checked="checked" {{/if}} /> NO

<br />  Show on Design report : 
<input type="hidden" name="proposal[dpn_dr_hide]" value="1" />
 <label class="switch">
 <input class="switch-input" type="checkbox"  name="proposal[dpn_dr_hide]" value="0" onclick="this.form.submit();" {{if $dpn_dr_hide_6 eq 0 }} checked="checked" {{/if}} />
       <span class="switch-label" data-on="Yes" data-off="No"></span> 
       <span class="switch-handle"></span> <br />
  </label>
</div>
<div style="width:25%; float:right;">
Notes: <br>
 <textarea rows="5" cols="40" name="proposal[dpn_notes]">{{$dpn_notes_6}}</textarea>
</div>
File Path - 1  <input type="text" name="proposal[dpn_link1]" value="{{$dpn_link1_6}}"}} style="width:700px;"  /> <br />
File Path - 2  <input type="text" name="proposal[dpn_link2]" value="{{$dpn_link2_6}}"}} style="width:700px;"  /> <br />

Youtube Winter <input type="text" name="proposal[dpn_you_winter]" value="{{$dpn_you_winter_6}}" style="width:700px;"  /> <br />
Youtube Summer <input type="text" name="proposal[dpn_you_summer]" value="{{$dpn_you_summer_6}}" style="width:700px;"  /> 

If existing design what the design no <input type="text" name="proposal[dpn_ex_designno]" value="{{$dpn_ex_designno_6}}"}} style="width:40px;"  /> <br />
<input type="submit" name="table_name" value="Save" />

&nbsp;&nbsp; 
<input type="button" name="addfile" value="Compose Email" onclick="javascript:modelwindow('{{$BASE_URL}}business.proposalchecklistemail/bus_id/{{$bsn_id_mini}}/dpn_proposal_number/6','90%','90%', 'yes');" id="addfile" class="vsml" />

</form>

</div>

<table cellpadding="0" cellspacing="0" width="100%" id="divtruelog" style="border-collapse:collapse;">
  <tr>
    <th width="18%">Action</th>
    <th width="25%">Document Name</th>
    <th width="18%">File Name</th>
    <th width="6%">Date Uploaded</th>
    <th width="7%">User Name</th>
    <th width="10%">Customer WWW</th>
  </tr>
   <form name="nr" method="post" action="">
  {{foreach from=$print_data_mini6 item=item key=key}}
  {{if $item.doc_not_required eq 1}}
  	<tr id="gr{{$item.doc_id}}" style="background:#CCC;" >
  {{else}}
    <tr id="gr{{$item.doc_id}}" >
  {{/if}}
    <td><a href="javascript:RequestcheckListIframe('checklistmini','{{$item.doc_id}}','{{$item.doc_checklist_number}}','');" >
    <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a><br />
     Make Not Required:
     <input type hidden name = "not_required[{{$item.doc_id}}][doc_id]" value = "{{$item.doc_id}}"  />
     <input type="checkbox" name = "not_required[{{$item.doc_id}}][doc_not_required]" id="notreq{{$item.doc_id}}" onclick="process({{$item.doc_bsn_id}},{{$item.doc_id}});" {{if $item.doc_not_required eq 1 }} checked="checked" {{/if}} /> 
     <p id="myElem{{$item.doc_id}}" style="display:none;"></p>

    
    </td>
    <td style="padding-left:5px;">{{$item.admin_doc_manual}}{{if $item.doc_file_name !== '' && $item.admin_doc_id == 12}} CONTRACT SIGNED {{else}}{{$item.admin_doc_name}}{{/if}}</td>
	
    {{if !empty($ipad)}} 
    <td style="text-align:left;"><a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name}}?dummy={{$ran}}" class="action_checklist" title="{{$item.doc_file_name}}" target="_blank">{{$item.doc_file_name|truncate:"40"}}</a></td>
   
    {{else}}
   <td style="text-align:left;"><a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name}}?dummy={{$ran}}')" class="action_checklist" title="{{$item.doc_file_name}}">{{$item.doc_file_name|truncate:"40"}}</a></td>
     {{/if}}

    <td style="text-align:center;">{{$item.doc_date_uploaded|date_format:"%d/%m/%Y"}}</td>
    <td style="text-align:center;">{{$item.user_name}}</td>
 <td style="text-align:left;">
<input type="radio" name="not_required[{{$item.doc_id}}][cwww]" value="1" {{if $item.doc_cust_www  == 1}} checked="checked" {{/if}}/> <span style="padding-top:5px;"> Yes </span> <br />
<input type="radio" name="not_required[{{$item.doc_id}}][cwww]" value="0" {{if $item.doc_cust_www == 0}} checked="checked" {{/if}} /> NO 
</td>
  </tr>
  {{/foreach}}
  

  {{if !empty($cus_minidata6)}}

   {{foreach from=$cus_minidata6 item=itemc key=keyc}}
   {{if $itemc.cdc_not_required eq 1}}
  	<tr id="grc{{$itemc.cdc_id}}" style="background:#CCC;" >
  {{else}}
    <tr id="grc{{$itemc.cdc_id}}" >
  {{/if}}

  <td><a href="javascript:RequestcheckListIframe('adddoc_checklistmini','{{$itemc.cdc_id}}','6','');" >
    <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a><br />
     Make Not Required:
     <input type hidden name = "not_required_custom[{{$itemc.cdc_id}}][cdc_id]" value = "{{$itemc.cdc_id}}"  />
     <input type="checkbox" name = "not_required_custom[{{$itemc.cdc_id}}][cdc_not_required]" id="notreq2{{$itemc.cdc_id}}" onclick="process2({{$itemc.cdc_bsn_id}},{{$itemc.cdc_id}});" {{if $itemc.cdc_not_required eq 1 }} checked="checked" {{/if}} /> 
     <p id="myElem2{{$itemc.cdc_id}}" style="display:none;"></p>
     </td>
  <td> {{$itemc.cdc_doc_name}} </td>
 {{if !empty($ipad)}} 
    <td style="text-align:left;"><a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$itemc.cdc_file_name}}?dummy={{$ran}}" class="action_checklist" title="{{$itemc.cdc_file_name}}" target="_blank">{{$itemc.cdc_file_name|truncate:"40"}}</a></td>
   
    {{else}}
   <td style="text-align:left;"><a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$itemc.cdc_file_name}}?dummy={{$ran}}')" class="action_checklist" title="{{$item.doc_file_name}}">{{$itemc.cdc_file_name|truncate:"40"}}</a></td>
     {{/if}}
  <td> {{$itemc.cdc_date_uploaded|date_format:"%d/%m/%Y"}} </td>
  <td> {{$itemc.cdc_user_name}} </td>
  <td> 
<input type="radio" name="not_required_custom[{{$itemc.cdc_id}}][cwww]" value="1" {{if $itemc.cdc_cust_www == 1}} checked="checked" {{/if}}/> <span style="padding-top:5px;"> Yes </span> <br />
<input type="radio" name="not_required_custom[{{$itemc.cdc_id}}][cwww]" value="0" {{if $itemc.cdc_cust_www == 0}} checked="checked" {{/if}} /> NO 

   </td>
  </tr>
  {{/foreach}}
  {{/if}}
  
   <tr> <td colspan="6"><input type="submit" name="not_required_save" value="Update Proposal List" />
   <a href="javascript:RequestcheckListIframe('adddoc_checklistmini','','6','');" class="btn" >
    Add New Document</a> &nbsp;
      <strong> <span style="border:1px solid #AAA; padding:4px;"> Task List {{$done6}}/{{$tot6}} </span> </strong> &nbsp; &nbsp;
      <input type="button" value="Add Tasks / Sync Task" onclick="requestAddTaskProposal(6);" />
      <input type="button" value="Load Proposal Task List" onclick="requestAllTasksProposal(0,6);" />
      <input type="button" value="Show Hide Proposal Task List" onclick="javascript:parent.toggleDiv('myContent6');" />
   </td>
  
  </tr>
  </form>
</table>
<table width="100%" >  
    <tr> <td>  <div id="taskmsgproposal" style="color:#FF6600;" align="left"></div> </td> </tr>
    <tr> <td> <div id="AllTaskDivProposal6"></div> </td> </tr>
    <tr> <td> <div id="editTaskDivProposal" align="left"></div> </td> </tr>
</table>
{{/if}}


{{if !empty($print_data_mini7)}}
<br />
<div style="font-style:bold; text-align:left; padding:5px;"> 
<form name="tablename" method="post" action="" >
<input type="hidden" name="proposal[dpn_bsn_id]" value="{{$bsn_id_mini}}" />
<input type="hidden" name="proposal[dpn_proposal_number]" value="7" />
<div style="width:75%; float:left;">
Document Proposal : <input type="text" name="proposal[dpn_name]" value="{{$dpn_name_7}}"}} style="width:400px;"  />
Primary Design : <input type="radio" name="proposal[dpn_primary_design]" value="1"  {{if $dpn_primary_design_7  == 1}} checked="checked" {{/if}}/>  Yes  &nbsp; 
<input type="radio" name="proposal[dpn_primary_design]" value="0"  {{if $dpn_primary_design_7 == 0}} checked="checked" {{/if}} /> NO <br />
Design Type : <select name="proposal[dpn_design_type]">
<option value="1" {{if $dpn_design_type_7 eq 1}} selected="selected" {{/if}}>Concept Design</option>
<option value="2" {{if $dpn_design_type_7 eq 2}} selected="selected" {{/if}}>Modification Design</option>
<option value="3" {{if $dpn_design_type_7 eq 3}} selected="selected" {{/if}}>Existing Design</option>
<option value="4" {{if $dpn_design_type_7 eq 4}} selected="selected" {{/if}}>External Design </option>
</select> &nbsp &nbsp; &nbsp;
Customer Designer: <input type="text" name="proposal[dpn_customer_designer]" value="{{$dpn_customer_designer_7}}"}} style="width:200px;"/> &nbsp; <br />

Checklist Number : 
<input type="hidden" name="proposal[dpn_unique_id]" value="{{$dpn_unique_id_7}}" style="width:200px;"  /> {{$dpn_unique_id_7}} &nbsp;
Project Type : <select name="proposal[dpn_project_type]">
<option value="1" {{if $dpn_project_type_7 eq 1}} selected="selected" {{/if}}>SR</option>
<option value="2" {{if $dpn_project_type_7 eq 2}} selected="selected" {{/if}}>FPE</option>
<option value="3" {{if $dpn_project_type_7 eq 3}} selected="selected" {{/if}}>Other</option>
</select>&nbsp; &nbsp;
Include in report : <input type="radio" name="proposal[dpn_include_in_report]" value="1"  {{if $dpn_include_in_report_7  == 1}} checked="checked" {{/if}}/>  Yes  &nbsp; 
<input type="radio" name="proposal[dpn_include_in_report]" value="0"  {{if $dpn_include_in_report_7 == 0}} checked="checked" {{/if}} /> NO 
&nbsp; &nbsp;

Include in Entity Report : <input type="radio" name="proposal[dpn_add_to_er]" value="1"  {{if $dpn_add_to_er_7  == 1}} checked="checked" {{/if}}/>  Yes  &nbsp; 
<input type="radio" name="proposal[dpn_add_to_er]" value="0"  {{if $dpn_add_to_er_7 == 0}} checked="checked" {{/if}} /> NO

<br />  Show on Design report : 
<input type="hidden" name="proposal[dpn_dr_hide]" value="1" />
 <label class="switch">
 <input class="switch-input" type="checkbox"  name="proposal[dpn_dr_hide]" value="0" onclick="this.form.submit();" {{if $dpn_dr_hide_7 eq 0 }} checked="checked" {{/if}} />
       <span class="switch-label" data-on="Yes" data-off="No"></span> 
       <span class="switch-handle"></span> <br />
  </label>
</div>
<div style="width:25%; float:right;">
Notes: <br>
 <textarea rows="5" cols="40" name="proposal[dpn_notes]">{{$dpn_notes_7}}</textarea>
</div>
File Path - 1  <input type="text" name="proposal[dpn_link1]" value="{{$dpn_link1_7}}"}} style="width:700px;"  /> <br />
File Path - 2  <input type="text" name="proposal[dpn_link2]" value="{{$dpn_link2_7}}"}} style="width:700px;"  /> <br />

Youtube Winter <input type="text" name="proposal[dpn_you_winter]" value="{{$dpn_you_winter_7}}" style="width:700px;"  /> <br />
Youtube Summer <input type="text" name="proposal[dpn_you_summer]" value="{{$dpn_you_summer_7}}" style="width:700px;"  /> 

If existing design what the design no <input type="text" name="proposal[dpn_ex_designno]" value="{{$dpn_ex_designno_7}}"}} style="width:40px;"  /> <br />
<input type="submit" name="table_name" value="Save" />

&nbsp; &nbsp; 
 
<input type="button" name="addfile" value="Compose Email" onclick="javascript:modelwindow('{{$BASE_URL}}business.proposalchecklistemail/bus_id/{{$bsn_id_mini}}/dpn_proposal_number/7','90%','90%', 'yes');" id="addfile" class="vsml" />

</form>

</div>

<table cellpadding="0" cellspacing="0" width="100%" id="divtruelog" style="border-collapse:collapse;">
  <tr>
    <th width="18%">Action</th>
    <th width="25%">Document Name</th>
    <th width="18%">File Name</th>
    <th width="6%">Date Uploaded</th>
    <th width="7%">User Name</th>
    <th width="10%">Customer WWW</th>
  </tr>
   <form name="nr" method="post" action="">
  {{foreach from=$print_data_mini7 item=item key=key}}
  {{if $item.doc_not_required eq 1}}
  	<tr id="gr{{$item.doc_id}}" style="background:#CCC;" >
  {{else}}
    <tr id="gr{{$item.doc_id}}" >
  {{/if}}
    <td><a href="javascript:RequestcheckListIframe('checklistmini','{{$item.doc_id}}','{{$item.doc_checklist_number}}','');" >
    <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a><br />
     Make Not Required:
     <input type hidden name = "not_required[{{$item.doc_id}}][doc_id]" value = "{{$item.doc_id}}"  />
     <input type="checkbox" name = "not_required[{{$item.doc_id}}][doc_not_required]" id="notreq{{$item.doc_id}}" onclick="process({{$item.doc_bsn_id}},{{$item.doc_id}});" {{if $item.doc_not_required eq 1 }} checked="checked" {{/if}} /> 
     <p id="myElem{{$item.doc_id}}" style="display:none;"></p>

    
    </td>
    <td style="padding-left:5px;">{{$item.admin_doc_manual}}{{if $item.doc_file_name !== '' && $item.admin_doc_id == 12}} CONTRACT SIGNED {{else}}{{$item.admin_doc_name}}{{/if}}</td>
	
    {{if !empty($ipad)}} 
    <td style="text-align:left;"><a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name}}?dummy={{$ran}}" class="action_checklist" title="{{$item.doc_file_name}}" target="_blank">{{$item.doc_file_name|truncate:"40"}}</a></td>
   
    {{else}}
   <td style="text-align:left;"><a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name}}?dummy={{$ran}}')" class="action_checklist" title="{{$item.doc_file_name}}">{{$item.doc_file_name|truncate:"40"}}</a></td>
     {{/if}}

    <td style="text-align:center;">{{$item.doc_date_uploaded|date_format:"%d/%m/%Y"}}</td>
    <td style="text-align:center;">{{$item.user_name}}</td>
 <td style="text-align:left;">
<input type="radio" name="not_required[{{$item.doc_id}}][cwww]" value="1" {{if $item.doc_cust_www  == 1}} checked="checked" {{/if}}/> <span style="padding-top:5px;"> Yes </span> <br />
<input type="radio" name="not_required[{{$item.doc_id}}][cwww]" value="0" {{if $item.doc_cust_www == 0}} checked="checked" {{/if}} /> NO 
</td>
  </tr>
  {{/foreach}}
  

  {{if !empty($cus_minidata7)}}

   {{foreach from=$cus_minidata7 item=itemc key=keyc}}
   {{if $itemc.cdc_not_required eq 1}}
  	<tr id="grc{{$itemc.cdc_id}}" style="background:#CCC;" >
  {{else}}
    <tr id="grc{{$itemc.cdc_id}}" >
  {{/if}}

  <td><a href="javascript:RequestcheckListIframe('adddoc_checklistmini','{{$itemc.cdc_id}}','7','');" >
    <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a><br />
     Make Not Required:
     <input type hidden name = "not_required_custom[{{$itemc.cdc_id}}][cdc_id]" value = "{{$itemc.cdc_id}}"  />
     <input type="checkbox" name = "not_required_custom[{{$itemc.cdc_id}}][cdc_not_required]" id="notreq2{{$itemc.cdc_id}}" onclick="process2({{$itemc.cdc_bsn_id}},{{$itemc.cdc_id}});" {{if $itemc.cdc_not_required eq 1 }} checked="checked" {{/if}} /> 
     <p id="myElem2{{$itemc.cdc_id}}" style="display:none;"></p>
     </td>
  <td> {{$itemc.cdc_doc_name}} </td>
 {{if !empty($ipad)}} 
    <td style="text-align:left;"><a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$itemc.cdc_file_name}}?dummy={{$ran}}" class="action_checklist" title="{{$itemc.cdc_file_name}}" target="_blank">{{$itemc.cdc_file_name|truncate:"40"}}</a></td>
   
    {{else}}
   <td style="text-align:left;"><a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$itemc.cdc_file_name}}?dummy={{$ran}}')" class="action_checklist" title="{{$item.doc_file_name}}">{{$itemc.cdc_file_name|truncate:"40"}}</a></td>
     {{/if}}
  <td> {{$itemc.cdc_date_uploaded|date_format:"%d/%m/%Y"}} </td>
  <td> {{$itemc.cdc_user_name}} </td>
  <td> 
<input type="radio" name="not_required_custom[{{$itemc.cdc_id}}][cwww]" value="1" {{if $itemc.cdc_cust_www == 1}} checked="checked" {{/if}}/> <span style="padding-top:5px;"> Yes </span> <br />
<input type="radio" name="not_required_custom[{{$itemc.cdc_id}}][cwww]" value="0" {{if $itemc.cdc_cust_www == 0}} checked="checked" {{/if}} /> NO 

   </td>
  </tr>
  {{/foreach}}
  {{/if}}
  
   <tr> <td colspan="6"><input type="submit" name="not_required_save" value="Update Proposal List" />
   <a href="javascript:RequestcheckListIframe('adddoc_checklistmini','','7','');" class="btn" >
    Add New Document</a> &nbsp; &nbsp;
      <strong> <span style="border:1px solid #AAA; padding:4px;"> Task List {{$done7}}/{{$tot7}} </span> </strong> &nbsp; &nbsp;
      <input type="button" value="Add Tasks / Sync Task" onclick="requestAddTaskProposal(7);" />
      <input type="button" value="Load Proposal Task List" onclick="requestAllTasksProposal(0,7);" />
      <input type="button" value="Show Hide Proposal Task List" onclick="javascript:parent.toggleDiv('myContent7');" />
   </td>
   
  </tr>
  </form>
</table>
<table width="100%" >  
    <tr> <td>  <div id="taskmsgproposal" style="color:#FF6600;" align="left"></div> </td> </tr>
    <tr> <td> <div id="AllTaskDivProposal7"></div> </td> </tr>
    <tr> <td> <div id="editTaskDivProposal" align="left"></div> </td> </tr>
</table>
{{/if}}



{{if !empty($print_data_mini8)}}
<br />
<div style="font-style:bold; text-align:left; padding:5px;"> 
<form name="tablename" method="post" action="" >
<input type="hidden" name="proposal[dpn_bsn_id]" value="{{$bsn_id_mini}}" />
<input type="hidden" name="proposal[dpn_proposal_number]" value="8" />
<div style="width:75%; float:left;">
Document Proposal : <input type="text" name="proposal[dpn_name]" value="{{$dpn_name_8}}"}} style="width:400px;"  />
Primary Design : <input type="radio" name="proposal[dpn_primary_design]" value="1"  {{if $dpn_primary_design_8  == 1}} checked="checked" {{/if}}/>  Yes  &nbsp; 
<input type="radio" name="proposal[dpn_primary_design]" value="0"  {{if $dpn_primary_design_8 == 0}} checked="checked" {{/if}} /> NO <br />
Design Type : <select name="proposal[dpn_design_type]">
<option value="1" {{if $dpn_design_type_8 eq 1}} selected="selected" {{/if}}>Concept Design</option>
<option value="2" {{if $dpn_design_type_8 eq 2}} selected="selected" {{/if}}>Modification Design</option>
<option value="3" {{if $dpn_design_type_8 eq 3}} selected="selected" {{/if}}>Existing Design</option>
<option value="4" {{if $dpn_design_type_8 eq 4}} selected="selected" {{/if}}>External Design </option>
</select> &nbsp &nbsp; &nbsp;
Customer Designer: <input type="text" name="proposal[dpn_customer_designer]" value="{{$dpn_customer_designer_8}}"}} style="width:200px;"/> &nbsp; <br />


Checklist Number : 
<input type="hidden" name="proposal[dpn_unique_id]" value="{{$dpn_unique_id_8}}" style="width:200px;"  /> {{$dpn_unique_id_8}}&nbsp;
Project Type : <select name="proposal[dpn_project_type]">
<option value="1" {{if $dpn_project_type_8 eq 1}} selected="selected" {{/if}}>SR</option>
<option value="2" {{if $dpn_project_type_8 eq 2}} selected="selected" {{/if}}>FPE</option>
<option value="3" {{if $dpn_project_type_8 eq 3}} selected="selected" {{/if}}>Other</option>
</select>&nbsp; &nbsp;
Include in report : <input type="radio" name="proposal[dpn_include_in_report]" value="1"  {{if $dpn_include_in_report_8  == 1}} checked="checked" {{/if}}/>  Yes  &nbsp; 
<input type="radio" name="proposal[dpn_include_in_report]" value="0"  {{if $dpn_include_in_report_8 == 0}} checked="checked" {{/if}} /> NO 
&nbsp; &nbsp;

Include in Entity Report : <input type="radio" name="proposal[dpn_add_to_er]" value="1"  {{if $dpn_add_to_er_8  == 1}} checked="checked" {{/if}}/>  Yes  &nbsp; 
<input type="radio" name="proposal[dpn_add_to_er]" value="0"  {{if $dpn_add_to_er_8 == 0}} checked="checked" {{/if}} /> NO

<br />  Show on Design report : 
<input type="hidden" name="proposal[dpn_dr_hide]" value="1" />
 <label class="switch">
 <input class="switch-input" type="checkbox"  name="proposal[dpn_dr_hide]" value="0" onclick="this.form.submit();" {{if $dpn_dr_hide_8 eq 0 }} checked="checked" {{/if}} />
       <span class="switch-label" data-on="Yes" data-off="No"></span> 
       <span class="switch-handle"></span> <br />
  </label>
</div>
<div style="width:25%; float:right;">
Notes: <br>
 <textarea rows="5" cols="40" name="proposal[dpn_notes]">{{$dpn_notes_8}}</textarea>
</div>
File Path - 1  <input type="text" name="proposal[dpn_link1]" value="{{$dpn_link1_8}}"}} style="width:700px;"  /> <br />
File Path - 2  <input type="text" name="proposal[dpn_link2]" value="{{$dpn_link2_8}}"}} style="width:700px;"  /> <br />

Youtube Winter <input type="text" name="proposal[dpn_you_winter]" value="{{$dpn_you_winter_8}}" style="width:700px;"  /> <br />
Youtube Summer <input type="text" name="proposal[dpn_you_summer]" value="{{$dpn_you_summer_8}}" style="width:700px;"  /> 

If existing design what the design no <input type="text" name="proposal[dpn_ex_designno]" value="{{$dpn_ex_designno_8}}"}} style="width:40px;"  /> <br />
<input type="submit" name="table_name" value="Save" />

&nbsp; &nbsp; 

<input type="button" name="addfile" value="Compose Email" onclick="javascript:modelwindow('{{$BASE_URL}}business.proposalchecklistemail/bus_id/{{$bsn_id_mini}}/dpn_proposal_number/8','90%','90%', 'yes');" id="addfile" class="vsml" />

</form>

</div>

<table cellpadding="0" cellspacing="0" width="100%" id="divtruelog" style="border-collapse:collapse;">
  <tr>
    <th width="18%">Action</th>
    <th width="25%">Document Name</th>
    <th width="18%">File Name</th>
    <th width="6%">Date Uploaded</th>
    <th width="7%">User Name</th>
    <th width="10%">Customer WWW</th>
  </tr>
   <form name="nr" method="post" action="">
  {{foreach from=$print_data_mini8 item=item key=key}}
  {{if $item.doc_not_required eq 1}}
  	<tr id="gr{{$item.doc_id}}" style="background:#CCC;" >
  {{else}}
    <tr id="gr{{$item.doc_id}}" >
  {{/if}}
    <td><a href="javascript:RequestcheckListIframe('checklistmini','{{$item.doc_id}}','{{$item.doc_checklist_number}}','');" >
    <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a><br />
     Make Not Required:
     <input type hidden name = "not_required[{{$item.doc_id}}][doc_id]" value = "{{$item.doc_id}}"  />
     <input type="checkbox" name = "not_required[{{$item.doc_id}}][doc_not_required]" id="notreq{{$item.doc_id}}" onclick="process({{$item.doc_bsn_id}},{{$item.doc_id}});" {{if $item.doc_not_required eq 1 }} checked="checked" {{/if}} /> 
     <p id="myElem{{$item.doc_id}}" style="display:none;"></p>

    
    </td>
    <td style="padding-left:5px;">{{$item.admin_doc_manual}}{{if $item.doc_file_name !== '' && $item.admin_doc_id == 12}} CONTRACT SIGNED {{else}}{{$item.admin_doc_name}}{{/if}}</td>
	
    {{if !empty($ipad)}} 
    <td style="text-align:left;"><a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name}}?dummy={{$ran}}" class="action_checklist" title="{{$item.doc_file_name}}" target="_blank">{{$item.doc_file_name|truncate:"40"}}</a></td>
   
    {{else}}
   <td style="text-align:left;"><a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name}}?dummy={{$ran}}')" class="action_checklist" title="{{$item.doc_file_name}}">{{$item.doc_file_name|truncate:"40"}}</a></td>
     {{/if}}

    <td style="text-align:center;">{{$item.doc_date_uploaded|date_format:"%d/%m/%Y"}}</td>
    <td style="text-align:center;">{{$item.user_name}}</td>
 <td style="text-align:left;">
<input type="radio" name="not_required[{{$item.doc_id}}][cwww]" value="1" {{if $item.doc_cust_www  == 1}} checked="checked" {{/if}}/> <span style="padding-top:5px;"> Yes </span> <br />
<input type="radio" name="not_required[{{$item.doc_id}}][cwww]" value="0" {{if $item.doc_cust_www == 0}} checked="checked" {{/if}} /> NO 
</td>
  </tr>
  {{/foreach}}
  

  {{if !empty($cus_minidata8)}}

   {{foreach from=$cus_minidata8 item=itemc key=keyc}}
   {{if $itemc.cdc_not_required eq 1}}
  	<tr id="grc{{$itemc.cdc_id}}" style="background:#CCC;" >
  {{else}}
    <tr id="grc{{$itemc.cdc_id}}" >
  {{/if}}

  <td><a href="javascript:RequestcheckListIframe('adddoc_checklistmini','{{$itemc.cdc_id}}','8','');" >
    <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a><br />
     Make Not Required:
     <input type hidden name = "not_required_custom[{{$itemc.cdc_id}}][cdc_id]" value = "{{$itemc.cdc_id}}"  />
     <input type="checkbox" name = "not_required_custom[{{$itemc.cdc_id}}][cdc_not_required]" id="notreq2{{$itemc.cdc_id}}" onclick="process2({{$itemc.cdc_bsn_id}},{{$itemc.cdc_id}}, this.checked);" {{if $itemc.cdc_not_required eq 1 }} checked="checked" {{/if}} /> 
     <p id="myElem2{{$itemc.cdc_id}}" style="display:none;"></p>
     </td>
  <td> {{$itemc.cdc_doc_name}} </td>
 {{if !empty($ipad)}} 
    <td style="text-align:left;"><a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$itemc.cdc_file_name}}?dummy={{$ran}}" class="action_checklist" title="{{$itemc.cdc_file_name}}" target="_blank">{{$itemc.cdc_file_name|truncate:"40"}}</a></td>
   
    {{else}}
   <td style="text-align:left;"><a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$itemc.cdc_file_name}}?dummy={{$ran}}')" class="action_checklist" title="{{$item.doc_file_name}}">{{$itemc.cdc_file_name|truncate:"40"}}</a></td>
     {{/if}}
  <td> {{$itemc.cdc_date_uploaded|date_format:"%d/%m/%Y"}} </td>
  <td> {{$itemc.cdc_user_name}} </td>
  <td> 
<input type="radio" name="not_required_custom[{{$itemc.cdc_id}}][cwww]" value="1" {{if $itemc.cdc_cust_www == 1}} checked="checked" {{/if}}/> <span style="padding-top:5px;"> Yes </span> <br />
<input type="radio" name="not_required_custom[{{$itemc.cdc_id}}][cwww]" value="0" {{if $itemc.cdc_cust_www == 0}} checked="checked" {{/if}} /> NO 

   </td>
  </tr>
  {{/foreach}}
  {{/if}}
  
   <tr> <td colspan="6"><input type="submit" name="not_required_save" value="Update Proposal List" />
   <a href="javascript:RequestcheckListIframe('adddoc_checklistmini','','8','');" class="btn" >
    Add New Document</a> &nbsp; &nbsp;
      <strong> <span style="border:1px solid #AAA; padding:4px;"> Task List {{$done8}}/{{$tot8}} </span> </strong> &nbsp; &nbsp;
      <input type="button" value="Add Tasks / Sync Task" onclick="requestAddTaskProposal(8);" />
      <input type="button" value="Load Proposal Task List" onclick="requestAllTasksProposal(0,8);" />
      <input type="button" value="Show Hide Proposal Task List" onclick="javascript:parent.toggleDiv('myContent8');" />
   </td>
   
  </tr>
  </form>
</table>
<table width="100%" >  
    <tr> <td>  <div id="taskmsgproposal" style="color:#FF6600;" align="left"></div> </td> </tr>
    <tr> <td> <div id="AllTaskDivProposal8"></div> </td> </tr>
    <tr> <td> <div id="editTaskDivProposal" align="left"></div> </td> </tr>
</table>
{{/if}}


{{if !empty($print_data_mini9)}}
<br />
<div style="font-style:bold; text-align:left; padding:5px;"> 
<form name="tablename" method="post" action="" >
<input type="hidden" name="proposal[dpn_bsn_id]" value="{{$bsn_id_mini}}" />
<input type="hidden" name="proposal[dpn_proposal_number]" value="9" />
<div style="width:75%; float:left;">
Document Proposal : <input type="text" name="proposal[dpn_name]" value="{{$dpn_name_9}}"}} style="width:400px;"  />
Primary Design : <input type="radio" name="proposal[dpn_primary_design]" value="1"  {{if $dpn_primary_design_9  == 1}} checked="checked" {{/if}}/>  Yes  &nbsp; 
<input type="radio" name="proposal[dpn_primary_design]" value="0"  {{if $dpn_primary_design_9 == 0}} checked="checked" {{/if}} /> NO <br />
Design Type : <select name="proposal[dpn_design_type]">
<option value="1" {{if $dpn_design_type_9 eq 1}} selected="selected" {{/if}}>Concept Design</option>
<option value="2" {{if $dpn_design_type_9 eq 2}} selected="selected" {{/if}}>Modification Design</option>
<option value="3" {{if $dpn_design_type_9 eq 3}} selected="selected" {{/if}}>Existing Design</option>
<option value="4" {{if $dpn_design_type_9 eq 4}} selected="selected" {{/if}}>External Design </option>
</select> &nbsp &nbsp; &nbsp;
Customer Designer: <input type="text" name="proposal[dpn_customer_designer]" value="{{$dpn_customer_designer_9}}"}} style="width:200px;"/> &nbsp; <br />

Checklist Number : 
<input type="hidden" name="proposal[dpn_unique_id]" value="{{$dpn_unique_id_9}}" style="width:200px;"  /> {{$dpn_unique_id_9}} &nbsp;
Project Type : <select name="proposal[dpn_project_type]">
<option value="1" {{if $dpn_project_type_9 eq 1}} selected="selected" {{/if}}>SR</option>
<option value="2" {{if $dpn_project_type_9 eq 2}} selected="selected" {{/if}}>FPE</option>
<option value="3" {{if $dpn_project_type_9 eq 3}} selected="selected" {{/if}}>Other</option>
</select>&nbsp; &nbsp;
Include in report : <input type="radio" name="proposal[dpn_include_in_report]" value="1"  {{if $dpn_include_in_report_9  == 1}} checked="checked" {{/if}}/>  Yes  &nbsp; 
<input type="radio" name="proposal[dpn_include_in_report]" value="0"  {{if $dpn_include_in_report_9 == 0}} checked="checked" {{/if}} /> NO 
&nbsp; &nbsp;

Include in Entity Report : <input type="radio" name="proposal[dpn_add_to_er]" value="1"  {{if $dpn_add_to_er_9  == 1}} checked="checked" {{/if}}/>  Yes  &nbsp; 
<input type="radio" name="proposal[dpn_add_to_er]" value="0"  {{if $dpn_add_to_er_9 == 0}} checked="checked" {{/if}} /> NO

</div>
<div style="width:25%; float:right;">
Notes: <br>
 <textarea rows="5" cols="40" name="proposal[dpn_notes]">{{$dpn_notes_9}}</textarea>
</div>
File Path - 1  <input type="text" name="proposal[dpn_link1]" value="{{$dpn_link1_9}}"}} style="width:700px;"  /> <br />
File Path - 2  <input type="text" name="proposal[dpn_link2]" value="{{$dpn_link2_9}}"}} style="width:700px;"  /> <br />

Youtube Winter <input type="text" name="proposal[dpn_you_winter]" value="{{$dpn_you_winter_9}}" style="width:700px;"  /> <br />
Youtube Summer <input type="text" name="proposal[dpn_you_summer]" value="{{$dpn_you_summer_9}}" style="width:700px;"  /> 

If existing design what the design no <input type="text" name="proposal[dpn_ex_designno]" value="{{$dpn_ex_designno_9}}"}} style="width:40px;"  /> <br />
<input type="submit" name="table_name" value="Save" />

&nbsp; &nbsp; 
&nbsp;&nbsp; 
<input type="button" name="addfile" value="Compose Email" onclick="javascript:modelwindow('{{$BASE_URL}}business.proposalchecklistemail/bus_id/{{$bsn_id_mini}}/dpn_proposal_number/9','90%','90%', 'yes');" id="addfile" class="vsml" />

</form>

</div>

<table cellpadding="0" cellspacing="0" width="100%" id="divtruelog" style="border-collapse:collapse;">
  <tr>
    <th width="18%">Action</th>
    <th width="25%">Document Name</th>
    <th width="18%">File Name</th>
    <th width="6%">Date Uploaded</th>
    <th width="7%">User Name</th>
    <th width="10%">Customer WWW</th>
  </tr>
   <form name="nr" method="post" action="">
  {{foreach from=$print_data_mini9 item=item key=key}}
  {{if $item.doc_not_required eq 1}}
  	<tr id="gr{{$item.doc_id}}" style="background:#CCC;" >
  {{else}}
    <tr id="gr{{$item.doc_id}}" >
  {{/if}}
    <td><a href="javascript:RequestcheckListIframe('checklistmini','{{$item.doc_id}}','{{$item.doc_checklist_number}}','');" >
    <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a><br />
     Make Not Required:
     <input type hidden name = "not_required[{{$item.doc_id}}][doc_id]" value = "{{$item.doc_id}}"  />
     <input type="checkbox" name = "not_required[{{$item.doc_id}}][doc_not_required]" id="notreq{{$item.doc_id}}" onclick="process({{$item.doc_bsn_id}},{{$item.doc_id}});" {{if $item.doc_not_required eq 1 }} checked="checked" {{/if}} /> 
     <p id="myElem{{$item.doc_id}}" style="display:none;"></p>

    
    </td>
    <td style="padding-left:5px;">{{$item.admin_doc_manual}}{{if $item.doc_file_name !== '' && $item.admin_doc_id == 12}} CONTRACT SIGNED {{else}}{{$item.admin_doc_name}}{{/if}}</td>
	
    {{if !empty($ipad)}} 
    <td style="text-align:left;"><a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name}}?dummy={{$ran}}" class="action_checklist" title="{{$item.doc_file_name}}" target="_blank">{{$item.doc_file_name|truncate:"40"}}</a></td>
   
    {{else}}
   <td style="text-align:left;"><a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name}}?dummy={{$ran}}')" class="action_checklist" title="{{$item.doc_file_name}}">{{$item.doc_file_name|truncate:"40"}}</a></td>
     {{/if}}

    <td style="text-align:center;">{{$item.doc_date_uploaded|date_format:"%d/%m/%Y"}}</td>
    <td style="text-align:center;">{{$item.user_name}}</td>
 <td style="text-align:left;">
<input type="radio" name="not_required[{{$item.doc_id}}][cwww]" value="1" {{if $item.doc_cust_www  == 1}} checked="checked" {{/if}}/> <span style="padding-top:5px;"> Yes </span> <br />
<input type="radio" name="not_required[{{$item.doc_id}}][cwww]" value="0" {{if $item.doc_cust_www == 0}} checked="checked" {{/if}} /> NO 
</td>
  </tr>
  {{/foreach}}
  

  {{if !empty($cus_minidata9)}}

   {{foreach from=$cus_minidata9 item=itemc key=keyc}}
   {{if $itemc.cdc_not_required eq 1}}
  	<tr id="grc{{$itemc.cdc_id}}" style="background:#CCC;" >
  {{else}}
    <tr id="grc{{$itemc.cdc_id}}" >
  {{/if}}

  <td><a href="javascript:RequestcheckListIframe('adddoc_checklistmini','{{$itemc.cdc_id}}','9','');" >
    <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a><br />
     Make Not Required:
     <input type hidden name = "not_required_custom[{{$itemc.cdc_id}}][cdc_id]" value = "{{$itemc.cdc_id}}"  />
     <input type="checkbox" name = "not_required_custom[{{$itemc.cdc_id}}][cdc_not_required]" id="notreq2{{$itemc.cdc_id}}" onclick="process2({{$itemc.cdc_bsn_id}},{{$itemc.cdc_id}});" {{if $itemc.cdc_not_required eq 1 }} checked="checked" {{/if}} /> 
     <p id="myElem2{{$itemc.cdc_id}}" style="display:none;"></p>
     </td>
  <td> {{$itemc.cdc_doc_name}} </td>
 {{if !empty($ipad)}} 
    <td style="text-align:left;"><a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$itemc.cdc_file_name}}?dummy={{$ran}}" class="action_checklist" title="{{$itemc.cdc_file_name}}" target="_blank">{{$itemc.cdc_file_name|truncate:"40"}}</a></td>
   
    {{else}}
   <td style="text-align:left;"><a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$itemc.cdc_file_name}}?dummy={{$ran}}')" class="action_checklist" title="{{$item.doc_file_name}}">{{$itemc.cdc_file_name|truncate:"40"}}</a></td>
     {{/if}}
  <td> {{$itemc.cdc_date_uploaded|date_format:"%d/%m/%Y"}} </td>
  <td> {{$itemc.cdc_user_name}} </td>
  <td> 
<input type="radio" name="not_required_custom[{{$itemc.cdc_id}}][cwww]" value="1" {{if $itemc.cdc_cust_www == 1}} checked="checked" {{/if}}/> <span style="padding-top:5px;"> Yes </span> <br />
<input type="radio" name="not_required_custom[{{$itemc.cdc_id}}][cwww]" value="0" {{if $itemc.cdc_cust_www == 0}} checked="checked" {{/if}} /> NO 

   </td>
  </tr>
  {{/foreach}}
  {{/if}}
  
   <tr> <td colspan="6"><input type="submit" name="not_required_save" value="Update Proposal List" />
   <a href="javascript:RequestcheckListIframe('adddoc_checklistmini','','9','');" class="btn" >
    Add New Document</a> &nbsp; &nbsp;
      <strong> <span style="border:1px solid #AAA; padding:4px;"> Task List {{$done9}}/{{$tot9}} </span> </strong> &nbsp; &nbsp;
      <input type="button" value="Add Tasks / Sync Task" onclick="requestAddTaskProposal(9);" />
      <input type="button" value="Load Proposal Task List" onclick="requestAllTasksProposal(0,9);" />
      <input type="button" value="Show Hide Proposal Task List" onclick="javascript:parent.toggleDiv('myContent9');" />
   </td>
   
  </tr>
  </form>
</table>
<table width="100%" >  
    <tr> <td>  <div id="taskmsgproposal" style="color:#FF6600;" align="left"></div> </td> </tr>
    <tr> <td> <div id="AllTaskDivProposal9"></div> </td> </tr>
    <tr> <td> <div id="editTaskDivProposal" align="left"></div> </td> </tr>
</table>
{{/if}}



{{if !empty($print_data_mini10)}}
<br />
<div style="font-style:bold; text-align:left; padding:5px;"> 
<form name="tablename" method="post" action="" >
<input type="hidden" name="proposal[dpn_bsn_id]" value="{{$bsn_id_mini}}" />
<input type="hidden" name="proposal[dpn_proposal_number]" value="10" />
<div style="width:75%; float:left;">
Document Proposal : <input type="text" name="proposal[dpn_name]" value="{{$dpn_name_10}}"}} style="width:400px;"  />
Primary Design : <input type="radio" name="proposal[dpn_primary_design]" value="1"  {{if $dpn_primary_design_10  == 1}} checked="checked" {{/if}}/>  Yes  &nbsp; 
<input type="radio" name="proposal[dpn_primary_design]" value="0"  {{if $dpn_primary_design_10 == 0}} checked="checked" {{/if}} /> NO <br />
Design Type : <select name="proposal[dpn_design_type]">
<option value="1" {{if $dpn_design_type_10 eq 1}} selected="selected" {{/if}}>Concept Design</option>
<option value="2" {{if $dpn_design_type_10 eq 2}} selected="selected" {{/if}}>Modification Design</option>
<option value="3" {{if $dpn_design_type_10 eq 3}} selected="selected" {{/if}}>Existing Design</option>
<option value="4" {{if $dpn_design_type_10 eq 4}} selected="selected" {{/if}}>External Design </option>
</select> &nbsp &nbsp; &nbsp;
Customer Designer: <input type="text" name="proposal[dpn_customer_designer]" value="{{$dpn_customer_designer_10}}"}} style="width:200px;"/> &nbsp; <br />

Checklist Number : 
<input type="hidden" name="proposal[dpn_unique_id]" value="{{$dpn_unique_id_10}}" style="width:200px;"  /> {{$dpn_unique_id_10}} &nbsp;
Project Type : <select name="proposal[dpn_project_type]">
<option value="1" {{if $dpn_project_type_10 eq 1}} selected="selected" {{/if}}>SR</option>
<option value="2" {{if $dpn_project_type_10 eq 2}} selected="selected" {{/if}}>FPE</option>
<option value="3" {{if $dpn_project_type_10 eq 3}} selected="selected" {{/if}}>Other</option>
</select>&nbsp; &nbsp;
Include in report : <input type="radio" name="proposal[dpn_include_in_report]" value="1"  {{if $dpn_include_in_report_10  == 1}} checked="checked" {{/if}}/>  Yes  &nbsp; 
<input type="radio" name="proposal[dpn_include_in_report]" value="0"  {{if $dpn_include_in_report_10 == 0}} checked="checked" {{/if}} /> NO 
&nbsp; &nbsp;

Include in Entity Report : <input type="radio" name="proposal[dpn_add_to_er]" value="1"  {{if $dpn_add_to_er_10  == 1}} checked="checked" {{/if}}/>  Yes  &nbsp; 
<input type="radio" name="proposal[dpn_add_to_er]" value="0"  {{if $dpn_add_to_er_10 == 0}} checked="checked" {{/if}} /> NO

</div>
<div style="width:25%; float:right;">
Notes: <br>
 <textarea rows="5" cols="40" name="proposal[dpn_notes]">{{$dpn_notes_10}}</textarea>
</div>
File Path - 1  <input type="text" name="proposal[dpn_link1]" value="{{$dpn_link1_10}}"}} style="width:700px;"  /> <br />
File Path - 2  <input type="text" name="proposal[dpn_link2]" value="{{$dpn_link2_10}}"}} style="width:700px;"  /> <br />

Youtube Winter <input type="text" name="proposal[dpn_you_winter]" value="{{$dpn_you_winter_10}}" style="width:700px;"  /> <br />
Youtube Summer <input type="text" name="proposal[dpn_you_summer]" value="{{$dpn_you_summer_10}}" style="width:700px;"  /> 

If existing design what the design no <input type="text" name="proposal[dpn_ex_designno]" value="{{$dpn_ex_designno_10}}"}} style="width:40px;"  /> <br />
<input type="submit" name="table_name" value="Save" />

&nbsp; &nbsp; 

<input type="button" name="addfile" value="Compose Email" onclick="javascript:modelwindow('{{$BASE_URL}}business.proposalchecklistemail/bus_id/{{$bsn_id_mini}}/dpn_proposal_number/10','90%','90%', 'yes');" id="addfile" class="vsml" />

</form>

</div>

<table cellpadding="0" cellspacing="0" width="100%" id="divtruelog" style="border-collapse:collapse;">
  <tr>
    <th width="18%">Action</th>
    <th width="25%">Document Name</th>
    <th width="18%">File Name</th>
    <th width="6%">Date Uploaded</th>
    <th width="7%">User Name</th>
    <th width="10%">Customer WWW</th>
  </tr>
   <form name="nr" method="post" action="">
  {{foreach from=$print_data_mini10 item=item key=key}}
  {{if $item.doc_not_required eq 1}}
  	<tr id="gr{{$item.doc_id}}" style="background:#CCC;" >
  {{else}}
    <tr id="gr{{$item.doc_id}}" >
  {{/if}}
    <td><a href="javascript:RequestcheckListIframe('checklistmini','{{$item.doc_id}}','{{$item.doc_checklist_number}}','');" >
    <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a><br />
     Make Not Required:
     <input type hidden name = "not_required[{{$item.doc_id}}][doc_id]" value = "{{$item.doc_id}}"  />
     <input type="checkbox" name = "not_required[{{$item.doc_id}}][doc_not_required]" id="notreq{{$item.doc_id}}" onclick="process({{$item.doc_bsn_id}},{{$item.doc_id}});" {{if $item.doc_not_required eq 1 }} checked="checked" {{/if}} /> 
     <p id="myElem{{$item.doc_id}}" style="display:none;"></p>

    
    </td>
    <td style="padding-left:5px;">{{$item.admin_doc_manual}}{{if $item.doc_file_name !== '' && $item.admin_doc_id == 12}} CONTRACT SIGNED {{else}}{{$item.admin_doc_name}}{{/if}}</td>
	
    {{if !empty($ipad)}} 
    <td style="text-align:left;"><a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name}}?dummy={{$ran}}" class="action_checklist" title="{{$item.doc_file_name}}" target="_blank">{{$item.doc_file_name|truncate:"40"}}</a></td>
   
    {{else}}
   <td style="text-align:left;"><a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name}}')?dummy={{$ran}}" class="action_checklist" title="{{$item.doc_file_name}}">{{$item.doc_file_name|truncate:"40"}}</a></td>
     {{/if}}

    <td style="text-align:center;">{{$item.doc_date_uploaded|date_format:"%d/%m/%Y"}}</td>
    <td style="text-align:center;">{{$item.user_name}}</td>
 <td style="text-align:left;">
<input type="radio" name="not_required[{{$item.doc_id}}][cwww]" value="1" {{if $item.doc_cust_www  == 1}} checked="checked" {{/if}}/> <span style="padding-top:5px;"> Yes </span> <br />
<input type="radio" name="not_required[{{$item.doc_id}}][cwww]" value="0" {{if $item.doc_cust_www == 0}} checked="checked" {{/if}} /> NO 
</td>
  </tr>
  {{/foreach}}
  

  {{if !empty($cus_minidata10)}}

   {{foreach from=$cus_minidata10 item=itemc key=keyc}}
   {{if $itemc.cdc_not_required eq 1}}
  	<tr id="grc{{$itemc.cdc_id}}" style="background:#CCC;" >
  {{else}}
    <tr id="grc{{$itemc.cdc_id}}" >
  {{/if}}

  <td><a href="javascript:RequestcheckListIframe('adddoc_checklistmini','{{$itemc.cdc_id}}','10','');" >
    <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a><br />
     Make Not Required:
     <input type hidden name = "not_required_custom[{{$itemc.cdc_id}}][cdc_id]" value = "{{$itemc.cdc_id}}"  />
     <input type="checkbox" name = "not_required_custom[{{$itemc.cdc_id}}][cdc_not_required]" id="notreq2{{$itemc.cdc_id}}" onclick="process2({{$itemc.cdc_bsn_id}},{{$itemc.cdc_id}});" {{if $itemc.cdc_not_required eq 1 }} checked="checked" {{/if}} /> 
     <p id="myElem2{{$itemc.cdc_id}}" style="display:none;"></p>
     </td>
  <td> {{$itemc.cdc_doc_name}} </td>
 {{if !empty($ipad)}} 
    <td style="text-align:left;"><a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$itemc.cdc_file_name}}?dummy={{$ran}}" class="action_checklist" title="{{$itemc.cdc_file_name}}" target="_blank">{{$itemc.cdc_file_name|truncate:"40"}}</a></td>
   
    {{else}}
   <td style="text-align:left;"><a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$itemc.cdc_file_name}}?dummy={{$ran}}')" class="action_checklist" title="{{$item.doc_file_name}}">{{$itemc.cdc_file_name|truncate:"40"}}</a></td>
     {{/if}}
  <td> {{$itemc.cdc_date_uploaded|date_format:"%d/%m/%Y"}} </td>
  <td> {{$itemc.cdc_user_name}} </td>
  <td> 
<input type="radio" name="not_required_custom[{{$itemc.cdc_id}}][cwww]" value="1" {{if $itemc.cdc_cust_www == 1}} checked="checked" {{/if}}/> <span style="padding-top:5px;"> Yes </span> <br />
<input type="radio" name="not_required_custom[{{$itemc.cdc_id}}][cwww]" value="0" {{if $itemc.cdc_cust_www == 0}} checked="checked" {{/if}} /> NO 

   </td>
  </tr>
  {{/foreach}}
  {{/if}}
  
   <tr> <td colspan="6"><input type="submit" name="not_required_save" value="Update Proposal List" />
   <a href="javascript:RequestcheckListIframe('adddoc_checklistmini','','10','');" class="btn" >
    Add New Document</a> &nbsp; &nbsp;
      <strong> <span style="border:1px solid #AAA; padding:4px;"> Task List {{$done10}}/{{$tot10}} </span> </strong> &nbsp; &nbsp;
      <input type="button" value="Add Tasks / Sync Task" onclick="requestAddTaskProposal(10);" />
      <input type="button" value="Load Proposal Task List" onclick="requestAllTasksProposal(0,10);" />
      <input type="button" value="Show Hide Proposal Task List" onclick="javascript:parent.toggleDiv('myContent10');" />
   </td>
   
  </tr>
  </form>
</table>
<table width="100%" >  
    <tr> <td>  <div id="taskmsgproposal" style="color:#FF6600;" align="left"></div> </td> </tr>
    <tr> <td> <div id="AllTaskDivProposal10"></div> </td> </tr>
    <tr> <td> <div id="editTaskDivProposal" align="left"></div> </td> </tr>
</table>
{{/if}}



{{if !empty($print_data_mini11)}}
<br />
<div style="font-style:bold; text-align:left; padding:5px;"> 
<form name="tablename" method="post" action="" >
<input type="hidden" name="proposal[dpn_bsn_id]" value="{{$bsn_id_mini}}" />
<input type="hidden" name="proposal[dpn_proposal_number]" value="11" />
<div style="width:75%; float:left;">
Document Proposal : <input type="text" name="proposal[dpn_name]" value="{{$dpn_name_11}}"}} style="width:400px;"  />
Primary Design : <input type="radio" name="proposal[dpn_primary_design]" value="1"  {{if $dpn_primary_design_11  == 1}} checked="checked" {{/if}}/>  Yes  &nbsp; 
<input type="radio" name="proposal[dpn_primary_design]" value="0"  {{if $dpn_primary_design_11 == 0}} checked="checked" {{/if}} /> NO <br />
Design Type : <select name="proposal[dpn_design_type]">
<option value="1" {{if $dpn_design_type_11 eq 1}} selected="selected" {{/if}}>Concept Design</option>
<option value="2" {{if $dpn_design_type_11 eq 2}} selected="selected" {{/if}}>Modification Design</option>
<option value="3" {{if $dpn_design_type_11 eq 3}} selected="selected" {{/if}}>Existing Design</option>
<option value="4" {{if $dpn_design_type_11 eq 4}} selected="selected" {{/if}}>External Design </option>
</select> &nbsp &nbsp; &nbsp;
Customer Designer: <input type="text" name="proposal[dpn_customer_designer]" value="{{$dpn_customer_designer_11}}"}} style="width:200px;"/> &nbsp; <br />

Checklist Number : <input type="text" name="proposal[dpn_unique_id]" value="{{$dpn_unique_id_11}}" style="width:200px;"  /> &nbsp;
Project Type : <select name="proposal[dpn_project_type]">
<option value="1" {{if $dpn_project_type_11 eq 1}} selected="selected" {{/if}}>SR</option>
<option value="2" {{if $dpn_project_type_11 eq 2}} selected="selected" {{/if}}>FPE</option>
<option value="3" {{if $dpn_project_type_11 eq 3}} selected="selected" {{/if}}>Other</option>
</select>

</div>
<div style="width:25%; float:right;">
Notes: <br>
 <textarea rows="5" cols="40" name="proposal[dpn_notes]">{{$dpn_notes_11}}</textarea>
</div>
<input type="submit" name="table_name" value="Save" />

&nbsp; &nbsp;

<input type="button" name="addfile" value="Compose Email" onclick="javascript:modelwindow('{{$BASE_URL}}business.proposalchecklistemail/bus_id/{{$bsn_id_mini}}/dpn_proposal_number/11','90%','90%', 'yes');" id="addfile" class="vsml" />
 
</form>

</div>

<table cellpadding="0" cellspacing="0" width="100%" id="divtruelog" style="border-collapse:collapse;">
  <tr>
    <th width="18%">Action</th>
    <th width="25%">Document Name</th>
    <th width="18%">File Name</th>
    <th width="6%">Date Uploaded</th>
    <th width="7%">User Name</th>
    <th width="10%">Customer WWW</th>
  </tr>
   <form name="nr" method="post" action="">
  {{foreach from=$print_data_mini11 item=item key=key}}
  {{if $item.doc_not_required eq 1}}
  	<tr id="gr{{$item.doc_id}}" style="background:#CCC;" >
  {{else}}
    <tr id="gr{{$item.doc_id}}" >
  {{/if}}
    <td><a href="javascript:RequestcheckListIframe('checklistmini','{{$item.doc_id}}','{{$item.doc_checklist_number}}','');" >
    <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a><br />
     Make Not Required:
     <input type hidden name = "not_required[{{$item.doc_id}}][doc_id]" value = "{{$item.doc_id}}"  />
     <input type="checkbox" name = "not_required[{{$item.doc_id}}][doc_not_required]" id="notreq{{$item.doc_id}}" onclick="process({{$item.doc_bsn_id}},{{$item.doc_id}});" {{if $item.doc_not_required eq 1 }} checked="checked" {{/if}} /> 
     <p id="myElem{{$item.doc_id}}" style="display:none;"></p>

    
    </td>
    <td style="padding-left:5px;">{{$item.admin_doc_manual}}{{if $item.doc_file_name !== '' && $item.admin_doc_id == 12}} CONTRACT SIGNED {{else}}{{$item.admin_doc_name}}{{/if}}</td>
	
    {{if !empty($ipad)}} 
    <td style="text-align:left;"><a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name}}?dummy={{$ran}}" class="action_checklist" title="{{$item.doc_file_name}}" target="_blank">{{$item.doc_file_name|truncate:"40"}}</a></td>
   
    {{else}}
   <td style="text-align:left;"><a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name}}?dummy={{$ran}}')" class="action_checklist" title="{{$item.doc_file_name}}">{{$item.doc_file_name|truncate:"40"}}</a></td>
     {{/if}}

    <td style="text-align:center;">{{$item.doc_date_uploaded|date_format:"%d/%m/%Y"}}</td>
    <td style="text-align:center;">{{$item.user_name}}</td>
 <td style="text-align:left;">
<input type="radio" name="not_required[{{$item.doc_id}}][cwww]" value="1" {{if $item.doc_cust_www  == 1}} checked="checked" {{/if}}/> <span style="padding-top:5px;"> Yes </span> <br />
<input type="radio" name="not_required[{{$item.doc_id}}][cwww]" value="0" {{if $item.doc_cust_www == 0}} checked="checked" {{/if}} /> NO 
</td>
  </tr>
  {{/foreach}}
  

  {{if !empty($cus_minidata11)}}

   {{foreach from=$cus_minidata11 item=itemc key=keyc}}
   {{if $itemc.cdc_not_required eq 1}}
  	<tr id="grc{{$itemc.cdc_id}}" style="background:#CCC;" >
  {{else}}
    <tr id="grc{{$itemc.cdc_id}}" >
  {{/if}}

  <td><a href="javascript:RequestcheckListIframe('adddoc_checklistmini','{{$itemc.cdc_id}}','11','');" >
    <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a><br />
     Make Not Required:
     <input type hidden name = "not_required_custom[{{$itemc.cdc_id}}][cdc_id]" value = "{{$itemc.cdc_id}}"  />
     <input type="checkbox" name = "not_required_custom[{{$itemc.cdc_id}}][cdc_not_required]" id="notreq2{{$itemc.cdc_id}}" onclick="process2({{$itemc.cdc_bsn_id}},{{$itemc.cdc_id}});" {{if $itemc.cdc_not_required eq 1 }} checked="checked" {{/if}} /> 
     <p id="myElem2{{$itemc.cdc_id}}" style="display:none;"></p>
     </td>
  <td> {{$itemc.cdc_doc_name}} </td>
 {{if !empty($ipad)}} 
    <td style="text-align:left;"><a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$itemc.cdc_file_name}}?dummy={{$ran}}" class="action_checklist" title="{{$itemc.cdc_file_name}}" target="_blank">{{$itemc.cdc_file_name|truncate:"40"}}</a></td>
   
    {{else}}
   <td style="text-align:left;"><a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$itemc.cdc_file_name}}?dummy={{$ran}}')" class="action_checklist" title="{{$item.doc_file_name}}">{{$itemc.cdc_file_name|truncate:"40"}}</a></td>
     {{/if}}
  <td> {{$itemc.cdc_date_uploaded|date_format:"%d/%m/%Y"}} </td>
  <td> {{$itemc.cdc_user_name}} </td>
  <td> 
<input type="radio" name="not_required_custom[{{$itemc.cdc_id}}][cwww]" value="1" {{if $itemc.cdc_cust_www == 1}} checked="checked" {{/if}}/> <span style="padding-top:5px;"> Yes </span> <br />
<input type="radio" name="not_required_custom[{{$itemc.cdc_id}}][cwww]" value="0" {{if $itemc.cdc_cust_www == 0}} checked="checked" {{/if}} /> NO 

   </td>
  </tr>
  {{/foreach}}
  {{/if}}
  
   <tr> <td colspan="6"><input type="submit" name="not_required_save" value="Update Proposal List" />
   <a href="javascript:RequestcheckListIframe('adddoc_checklistmini','','11','');" class="btn" >
    Add New Document</a> &nbsp; &nbsp;
      <strong> <span style="border:1px solid #AAA; padding:4px;"> Task List {{$done11}}/{{$tot11}} </span> </strong> &nbsp; &nbsp;
      <input type="button" value="Add Tasks / Sync Task" onclick="requestAddTaskProposal(11);" />
      <input type="button" value="Load Proposal Task List" onclick="requestAllTasksProposal(0,11);" />
      <input type="button" value="Show Hide Proposal Task List" onclick="javascript:parent.toggleDiv('myContent11');" />
   </td>
   
  </tr>
  </form>
</table>
<table width="100%" >  
    <tr> <td>  <div id="taskmsgproposal" style="color:#FF6600;" align="left"></div> </td> </tr>
    <tr> <td> <div id="AllTaskDivProposal11"></div> </td> </tr>
    <tr> <td> <div id="editTaskDivProposal" align="left"></div> </td> </tr>
</table>
{{/if}}



{{if !empty($print_data_mini12)}}
<br />
<div style="font-style:bold; text-align:left; padding:5px;"> 
<form name="tablename" method="post" action="" >
<input type="hidden" name="proposal[dpn_bsn_id]" value="{{$bsn_id_mini}}" />
<input type="hidden" name="proposal[dpn_proposal_number]" value="12" />
<div style="width:75%; float:left;">
Document Proposal : <input type="text" name="proposal[dpn_name]" value="{{$dpn_name_12}}"}} style="width:400px;"  />
Primary Design : <input type="radio" name="proposal[dpn_primary_design]" value="1"  {{if $dpn_primary_design_12  == 1}} checked="checked" {{/if}}/>  Yes  &nbsp; 
<input type="radio" name="proposal[dpn_primary_design]" value="0"  {{if $dpn_primary_design_12 == 0}} checked="checked" {{/if}} /> NO <br />
Design Type : <select name="proposal[dpn_design_type]">
<option value="1" {{if $dpn_design_type_12 eq 1}} selected="selected" {{/if}}>Concept Design</option>
<option value="2" {{if $dpn_design_type_12 eq 2}} selected="selected" {{/if}}>Modification Design</option>
<option value="3" {{if $dpn_design_type_12 eq 3}} selected="selected" {{/if}}>Existing Design</option>
<option value="4" {{if $dpn_design_type_12 eq 4}} selected="selected" {{/if}}>External Design </option>
</select> &nbsp &nbsp; &nbsp;
Customer Designer: <input type="text" name="proposal[dpn_customer_designer]" value="{{$dpn_customer_designer_12}}"}} style="width:200px;"/> &nbsp; <br />

Checklist Number : <input type="text" name="proposal[dpn_unique_id]" value="{{$dpn_unique_id_12}}" style="width:200px;"  /> &nbsp;
Project Type : <select name="proposal[dpn_project_type]">
<option value="1" {{if $dpn_project_type_12 eq 1}} selected="selected" {{/if}}>SR</option>
<option value="2" {{if $dpn_project_type_12 eq 2}} selected="selected" {{/if}}>FPE</option>
<option value="3" {{if $dpn_project_type_12 eq 3}} selected="selected" {{/if}}>Other</option>
</select>
</div>
<div style="width:25%; float:right;">
Notes: <br>
 <textarea rows="5" cols="40" name="proposal[dpn_notes]">{{$dpn_notes_12}}</textarea>
</div>

<input type="submit" name="table_name" value="Save" />

&nbsp;&nbsp; 
<input type="button" name="addfile" value="Compose Email" onclick="javascript:modelwindow('{{$BASE_URL}}business.proposalchecklistemail/bus_id/{{$bsn_id_mini}}/dpn_proposal_number/12','90%','90%', 'yes');" id="addfile" class="vsml" />

</form>

</div>

<table cellpadding="0" cellspacing="0" width="100%" id="divtruelog" style="border-collapse:collapse;">
  <tr>
    <th width="18%">Action</th>
    <th width="25%">Document Name</th>
    <th width="18%">File Name</th>
    <th width="6%">Date Uploaded</th>
    <th width="7%">User Name</th>
    <th width="10%">Customer WWW</th>
  </tr>
   <form name="nr" method="post" action="">
  {{foreach from=$print_data_mini12 item=item key=key}}
  {{if $item.doc_not_required eq 1}}
  	<tr id="gr{{$item.doc_id}}" style="background:#CCC;" >
  {{else}}
    <tr id="gr{{$item.doc_id}}" >
  {{/if}}
    <td><a href="javascript:RequestcheckListIframe('checklistmini','{{$item.doc_id}}','{{$item.doc_checklist_number}}','');" >
    <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a><br />
     Make Not Required:
     <input type hidden name = "not_required[{{$item.doc_id}}][doc_id]" value = "{{$item.doc_id}}"  />
     <input type="checkbox" name = "not_required[{{$item.doc_id}}][doc_not_required]" id="notreq{{$item.doc_id}}" onclick="process({{$item.doc_bsn_id}},{{$item.doc_id}});" {{if $item.doc_not_required eq 1 }} checked="checked" {{/if}} /> 
     <p id="myElem{{$item.doc_id}}" style="display:none;"></p>

    
    </td>
    <td style="padding-left:5px;">{{$item.admin_doc_manual}}{{if $item.doc_file_name !== '' && $item.admin_doc_id == 12}} CONTRACT SIGNED {{else}}{{$item.admin_doc_name}}{{/if}}</td>
	
    {{if !empty($ipad)}} 
    <td style="text-align:left;"><a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name}}?dummy={{$ran}}" class="action_checklist" title="{{$item.doc_file_name}}" target="_blank">{{$item.doc_file_name|truncate:"40"}}</a></td>
   
    {{else}}
   <td style="text-align:left;"><a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name}}?dummy={{$ran}}')" class="action_checklist" title="{{$item.doc_file_name}}">{{$item.doc_file_name|truncate:"40"}}</a></td>
     {{/if}}

    <td style="text-align:center;">{{$item.doc_date_uploaded|date_format:"%d/%m/%Y"}}</td>
    <td style="text-align:center;">{{$item.user_name}}</td>
 <td style="text-align:left;">
<input type="radio" name="not_required[{{$item.doc_id}}][cwww]" value="1" {{if $item.doc_cust_www  == 1}} checked="checked" {{/if}}/> <span style="padding-top:5px;"> Yes </span> <br />
<input type="radio" name="not_required[{{$item.doc_id}}][cwww]" value="0" {{if $item.doc_cust_www == 0}} checked="checked" {{/if}} /> NO 
</td>
  </tr>
  {{/foreach}}
  

  {{if !empty($cus_minidata12)}}

   {{foreach from=$cus_minidata12 item=itemc key=keyc}}
   {{if $itemc.cdc_not_required eq 1}}
  	<tr id="grc{{$itemc.cdc_id}}" style="background:#CCC;" >
  {{else}}
    <tr id="grc{{$itemc.cdc_id}}" >
  {{/if}}

  <td><a href="javascript:RequestcheckListIframe('adddoc_checklistmini','{{$itemc.cdc_id}}','12','');" >
    <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a><br />
     Make Not Required:
     <input type hidden name = "not_required_custom[{{$itemc.cdc_id}}][cdc_id]" value = "{{$itemc.cdc_id}}"  />
     <input type="checkbox" name = "not_required_custom[{{$itemc.cdc_id}}][cdc_not_required]" id="notreq2{{$itemc.cdc_id}}" onclick="process2({{$itemc.cdc_bsn_id}},{{$itemc.cdc_id}});" {{if $itemc.cdc_not_required eq 1 }} checked="checked" {{/if}} /> 
     <p id="myElem2{{$itemc.cdc_id}}" style="display:none;"></p>
     </td>
  <td> {{$itemc.cdc_doc_name}} </td>
 {{if !empty($ipad)}} 
    <td style="text-align:left;"><a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$itemc.cdc_file_name}}?dummy={{$ran}}" class="action_checklist" title="{{$itemc.cdc_file_name}}" target="_blank">{{$itemc.cdc_file_name|truncate:"40"}}</a></td>
   
    {{else}}
   <td style="text-align:left;"><a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$itemc.cdc_file_name}}?dummy={{$ran}}')" class="action_checklist" title="{{$item.doc_file_name}}">{{$itemc.cdc_file_name|truncate:"40"}}</a></td>
     {{/if}}
  <td> {{$itemc.cdc_date_uploaded|date_format:"%d/%m/%Y"}} </td>
  <td> {{$itemc.cdc_user_name}} </td>
  <td> 
<input type="radio" name="not_required_custom[{{$itemc.cdc_id}}][cwww]" value="1" {{if $itemc.cdc_cust_www == 1}} checked="checked" {{/if}}/> <span style="padding-top:5px;"> Yes </span> <br />
<input type="radio" name="not_required_custom[{{$itemc.cdc_id}}][cwww]" value="0" {{if $itemc.cdc_cust_www == 0}} checked="checked" {{/if}} /> NO 

   </td>
  </tr>
  {{/foreach}}
  {{/if}}
  
   <tr> <td colspan="6"><input type="submit" name="not_required_save" value="Update Proposal List" />
   <a href="javascript:RequestcheckListIframe('adddoc_checklistmini','','12','');" class="btn" >
    Add New Document</a> &nbsp; &nbsp;
      <strong> <span style="border:1px solid #AAA; padding:4px;"> Task List {{$done12}}/{{$tot12}} </span> </strong> &nbsp; &nbsp;
      <input type="button" value="Add Tasks / Sync Task" onclick="requestAddTaskProposal(12);" />
      <input type="button" value="Load Proposal Task List" onclick="requestAllTasksProposal(0,12);" />
      <input type="button" value="Show Hide Proposal Task List" onclick="javascript:parent.toggleDiv('myContent12');" />
   </td>
   
  </tr>
  </form>
</table>
<table width="100%" >  
    <tr> <td>  <div id="taskmsgproposal" style="color:#FF6600;" align="left"></div> </td> </tr>
    <tr> <td> <div id="AllTaskDivProposal12"></div> </td> </tr>
    <tr> <td> <div id="editTaskDivProposal" align="left"></div> </td> </tr>
</table>
{{/if}}



{{if !empty($print_data_mini13)}}
<br />
<div style="font-style:bold; text-align:left; padding:5px;"> 
<form name="tablename" method="post" action="" >
<input type="hidden" name="proposal[dpn_bsn_id]" value="{{$bsn_id_mini}}" />
<input type="hidden" name="proposal[dpn_proposal_number]" value="13" />
<div style="width:75%; float:left;">
Document Proposal : <input type="text" name="proposal[dpn_name]" value="{{$dpn_name_13}}"}} style="width:400px;"  />
Primary Design : <input type="radio" name="proposal[dpn_primary_design]" value="1"  {{if $dpn_primary_design_13  == 1}} checked="checked" {{/if}}/>  Yes  &nbsp; 
<input type="radio" name="proposal[dpn_primary_design]" value="0"  {{if $dpn_primary_design_13 == 0}} checked="checked" {{/if}} /> NO <br />
Design Type : <select name="proposal[dpn_design_type]">
<option value="1" {{if $dpn_design_type_13 eq 1}} selected="selected" {{/if}}>Concept Design</option>
<option value="2" {{if $dpn_design_type_13 eq 2}} selected="selected" {{/if}}>Modification Design</option>
<option value="3" {{if $dpn_design_type_13 eq 3}} selected="selected" {{/if}}>Existing Design</option>
<option value="4" {{if $dpn_design_type_13 eq 4}} selected="selected" {{/if}}>External Design </option>
</select> &nbsp &nbsp; &nbsp;
Customer Designer: <input type="text" name="proposal[dpn_customer_designer]" value="{{$dpn_customer_designer_13}}"}} style="width:200px;"/> &nbsp; <br />

Checklist Number : <input type="text" name="proposal[dpn_unique_id]" value="{{$dpn_unique_id_13}}" style="width:200px;"  /> &nbsp;
Project Type : <select name="proposal[dpn_project_type]">
<option value="1" {{if $dpn_project_type_13 eq 1}} selected="selected" {{/if}}>SR</option>
<option value="2" {{if $dpn_project_type_13 eq 2}} selected="selected" {{/if}}>FPE</option>
<option value="3" {{if $dpn_project_type_13 eq 3}} selected="selected" {{/if}}>Other</option>
</select>

</div>
<div style="width:25%; float:right;">
Notes: <br>
 <textarea rows="5" cols="40" name="proposal[dpn_notes]">{{$dpn_notes_13}}</textarea>
</div>
<input type="submit" name="table_name" value="Save" />

&nbsp;&nbsp; 
<input type="button" name="addfile" value="Compose Email" onclick="javascript:modelwindow('{{$BASE_URL}}business.proposalchecklistemail/bus_id/{{$bsn_id_mini}}/dpn_proposal_number/13','90%','90%', 'yes');" id="addfile" class="vsml" />
 
</form>

</div>

<table cellpadding="0" cellspacing="0" width="100%" id="divtruelog" style="border-collapse:collapse;">
  <tr>
    <th width="18%">Action</th>
    <th width="25%">Document Name</th>
    <th width="18%">File Name</th>
    <th width="6%">Date Uploaded</th>
    <th width="7%">User Name</th>
    <th width="10%">Customer WWW</th>
  </tr>
   <form name="nr" method="post" action="">
  {{foreach from=$print_data_mini13 item=item key=key}}
  {{if $item.doc_not_required eq 1}}
  	<tr id="gr{{$item.doc_id}}" style="background:#CCC;" >
  {{else}}
    <tr id="gr{{$item.doc_id}}" >
  {{/if}}
    <td><a href="javascript:RequestcheckListIframe('checklistmini','{{$item.doc_id}}','{{$item.doc_checklist_number}}','');" >
    <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a><br />
     Make Not Required:
     <input type hidden name = "not_required[{{$item.doc_id}}][doc_id]" value = "{{$item.doc_id}}"  />
     <input type="checkbox" name = "not_required[{{$item.doc_id}}][doc_not_required]" id="notreq{{$item.doc_id}}" onclick="process({{$item.doc_bsn_id}},{{$item.doc_id}});" {{if $item.doc_not_required eq 1 }} checked="checked" {{/if}} /> 
     <p id="myElem{{$item.doc_id}}" style="display:none;"></p>

    
    </td>
    <td style="padding-left:5px;">{{$item.admin_doc_manual}}{{if $item.doc_file_name !== '' && $item.admin_doc_id == 12}} CONTRACT SIGNED {{else}}{{$item.admin_doc_name}}{{/if}}</td>
	
    {{if !empty($ipad)}} 
    <td style="text-align:left;"><a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name}}?dummy={{$ran}}" class="action_checklist" title="{{$item.doc_file_name}}" target="_blank">{{$item.doc_file_name|truncate:"40"}}</a></td>
   
    {{else}}
   <td style="text-align:left;"><a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name}}?dummy={{$ran}}')" class="action_checklist" title="{{$item.doc_file_name}}">{{$item.doc_file_name|truncate:"40"}}</a></td>
     {{/if}}

    <td style="text-align:center;">{{$item.doc_date_uploaded|date_format:"%d/%m/%Y"}}</td>
    <td style="text-align:center;">{{$item.user_name}}</td>
 <td style="text-align:left;">
<input type="radio" name="not_required[{{$item.doc_id}}][cwww]" value="1" {{if $item.doc_cust_www  == 1}} checked="checked" {{/if}}/> <span style="padding-top:5px;"> Yes </span> <br />
<input type="radio" name="not_required[{{$item.doc_id}}][cwww]" value="0" {{if $item.doc_cust_www == 0}} checked="checked" {{/if}} /> NO 
</td>
  </tr>
  {{/foreach}}
  

  {{if !empty($cus_minidata13)}}

   {{foreach from=$cus_minidata13 item=itemc key=keyc}}
   {{if $itemc.cdc_not_required eq 1}}
  	<tr id="grc{{$itemc.cdc_id}}" style="background:#CCC;" >
  {{else}}
    <tr id="grc{{$itemc.cdc_id}}" >
  {{/if}}

  <td><a href="javascript:RequestcheckListIframe('adddoc_checklistmini','{{$itemc.cdc_id}}','13','');" >
    <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a><br />
     Make Not Required:
     <input type hidden name = "not_required_custom[{{$itemc.cdc_id}}][cdc_id]" value = "{{$itemc.cdc_id}}"  />
     <input type="checkbox" name = "not_required_custom[{{$itemc.cdc_id}}][cdc_not_required]" id="notreq2{{$itemc.cdc_id}}" onclick="process2({{$itemc.cdc_bsn_id}},{{$itemc.cdc_id}});" {{if $itemc.cdc_not_required eq 1 }} checked="checked" {{/if}} /> 
     <p id="myElem2{{$itemc.cdc_id}}" style="display:none;"></p>
     </td>
  <td> {{$itemc.cdc_doc_name}} </td>
 {{if !empty($ipad)}} 
    <td style="text-align:left;"><a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$itemc.cdc_file_name}}?dummy={{$ran}}" class="action_checklist" title="{{$itemc.cdc_file_name}}" target="_blank">{{$itemc.cdc_file_name|truncate:"40"}}</a></td>
   
    {{else}}
   <td style="text-align:left;"><a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$itemc.cdc_file_name}}?dummy={{$ran}}')" class="action_checklist" title="{{$item.doc_file_name}}">{{$itemc.cdc_file_name|truncate:"40"}}</a></td>
     {{/if}}
  <td> {{$itemc.cdc_date_uploaded|date_format:"%d/%m/%Y"}} </td>
  <td> {{$itemc.cdc_user_name}} </td>
  <td> 
<input type="radio" name="not_required_custom[{{$itemc.cdc_id}}][cwww]" value="1" {{if $itemc.cdc_cust_www == 1}} checked="checked" {{/if}}/> <span style="padding-top:5px;"> Yes </span> <br />
<input type="radio" name="not_required_custom[{{$itemc.cdc_id}}][cwww]" value="0" {{if $itemc.cdc_cust_www == 0}} checked="checked" {{/if}} /> NO 

   </td>
  </tr>
  {{/foreach}}
  {{/if}}
  
   <tr> <td colspan="6"><input type="submit" name="not_required_save" value="Update Proposal List" />
   <a href="javascript:RequestcheckListIframe('adddoc_checklistmini','','13','');" class="btn" >
    Add New Document</a> &nbsp; &nbsp;
      <strong> <span style="border:1px solid #AAA; padding:4px;"> Task List {{$done13}}/{{$tot13}} </span> </strong> &nbsp; &nbsp;
      <input type="button" value="Add Tasks / Sync Task" onclick="requestAddTaskProposal(13);" />
      <input type="button" value="Load Proposal Task List" onclick="requestAllTasksProposal(0,13);" />
      <input type="button" value="Show Hide Proposal Task List" onclick="javascript:parent.toggleDiv('myContent13');" />
   </td>
   
  </tr>
  </form>
</table>
<table width="100%" >  
    <tr> <td>  <div id="taskmsgproposal" style="color:#FF6600;" align="left"></div> </td> </tr>
    <tr> <td> <div id="AllTaskDivProposal13"></div> </td> </tr>
    <tr> <td> <div id="editTaskDivProposal" align="left"></div> </td> </tr>
</table>
{{/if}}



{{if !empty($print_data_mini14)}}
<br />
<div style="font-style:bold; text-align:left; padding:5px;"> 
<form name="tablename" method="post" action="" >
<input type="hidden" name="proposal[dpn_bsn_id]" value="{{$bsn_id_mini}}" />
<input type="hidden" name="proposal[dpn_proposal_number]" value="14" />
<div style="width:75%; float:left;">
Document Proposal : <input type="text" name="proposal[dpn_name]" value="{{$dpn_name_14}}"}} style="width:400px;"  />
Primary Design : <input type="radio" name="proposal[dpn_primary_design]" value="1"  {{if $dpn_primary_design_14  == 1}} checked="checked" {{/if}}/>  Yes  &nbsp; 
<input type="radio" name="proposal[dpn_primary_design]" value="0"  {{if $dpn_primary_design_14 == 0}} checked="checked" {{/if}} /> NO <br />
Design Type : <select name="proposal[dpn_design_type]">
<option value="1" {{if $dpn_design_type_14 eq 1}} selected="selected" {{/if}}>Concept Design</option>
<option value="2" {{if $dpn_design_type_14 eq 2}} selected="selected" {{/if}}>Modification Design</option>
<option value="3" {{if $dpn_design_type_14 eq 3}} selected="selected" {{/if}}>Existing Design</option>
<option value="4" {{if $dpn_design_type_14 eq 4}} selected="selected" {{/if}}>External Design </option>
</select> &nbsp &nbsp; &nbsp;
Customer Designer: <input type="text" name="proposal[dpn_customer_designer]" value="{{$dpn_customer_designer_14}}"}} style="width:200px;"/> &nbsp; <br />

Checklist Number : <input type="text" name="proposal[dpn_unique_id]" value="{{$dpn_unique_id_14}}" style="width:200px;"  /> &nbsp;
Project Type : <select name="proposal[dpn_project_type]">
<option value="1" {{if $dpn_project_type_14 eq 1}} selected="selected" {{/if}}>SR</option>
<option value="2" {{if $dpn_project_type_14 eq 2}} selected="selected" {{/if}}>FPE</option>
<option value="3" {{if $dpn_project_type_14 eq 3}} selected="selected" {{/if}}>Other</option>
</select>
</div>
<div style="width:25%; float:right;">
Notes: <br>
 <textarea rows="5" cols="40" name="proposal[dpn_notes]">{{$dpn_notes_14}}</textarea>
</div>

<input type="submit" name="table_name" value="Save" />

&nbsp;&nbsp; 
<input type="button" name="addfile" value="Compose Email" onclick="javascript:modelwindow('{{$BASE_URL}}business.proposalchecklistemail/bus_id/{{$bsn_id_mini}}/dpn_proposal_number/14','90%','90%', 'yes');" id="addfile" class="vsml" />

</form>

</div>

<table cellpadding="0" cellspacing="0" width="100%" id="divtruelog" style="border-collapse:collapse;">
  <tr>
    <th width="18%">Action</th>
    <th width="25%">Document Name</th>
    <th width="18%">File Name</th>
    <th width="6%">Date Uploaded</th>
    <th width="7%">User Name</th>
    <th width="10%">Customer WWW</th>
  </tr>
   <form name="nr" method="post" action="">
  {{foreach from=$print_data_mini14 item=item key=key}}
  {{if $item.doc_not_required eq 1}}
  	<tr id="gr{{$item.doc_id}}" style="background:#CCC;" >
  {{else}}
    <tr id="gr{{$item.doc_id}}" >
  {{/if}}
    <td><a href="javascript:RequestcheckListIframe('checklistmini','{{$item.doc_id}}','{{$item.doc_checklist_number}}','');" >
    <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a><br />
     Make Not Required:
     <input type hidden name = "not_required[{{$item.doc_id}}][doc_id]" value = "{{$item.doc_id}}"  />
     <input type="checkbox" name = "not_required[{{$item.doc_id}}][doc_not_required]" id="notreq{{$item.doc_id}}" onclick="process({{$item.doc_bsn_id}},{{$item.doc_id}});" {{if $item.doc_not_required eq 1 }} checked="checked" {{/if}} /> 
     <p id="myElem{{$item.doc_id}}" style="display:none;"></p>

    
    </td>
    <td style="padding-left:5px;">{{$item.admin_doc_manual}}{{if $item.doc_file_name !== '' && $item.admin_doc_id == 12}} CONTRACT SIGNED {{else}}{{$item.admin_doc_name}}{{/if}}</td>
	
    {{if !empty($ipad)}} 
    <td style="text-align:left;"><a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name}}?dummy={{$ran}}" class="action_checklist" title="{{$item.doc_file_name}}" target="_blank">{{$item.doc_file_name|truncate:"40"}}</a></td>
   
    {{else}}
   <td style="text-align:left;"><a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name}}?dummy={{$ran}}')" class="action_checklist" title="{{$item.doc_file_name}}">{{$item.doc_file_name|truncate:"40"}}</a></td>
     {{/if}}

    <td style="text-align:center;">{{$item.doc_date_uploaded|date_format:"%d/%m/%Y"}}</td>
    <td style="text-align:center;">{{$item.user_name}}</td>
 <td style="text-align:left;">
<input type="radio" name="not_required[{{$item.doc_id}}][cwww]" value="1" {{if $item.doc_cust_www  == 1}} checked="checked" {{/if}}/> <span style="padding-top:5px;"> Yes </span> <br />
<input type="radio" name="not_required[{{$item.doc_id}}][cwww]" value="0" {{if $item.doc_cust_www == 0}} checked="checked" {{/if}} /> NO 
</td>
  </tr>
  {{/foreach}}
  

  {{if !empty($cus_minidata14)}}

   {{foreach from=$cus_minidata14 item=itemc key=keyc}}
   {{if $itemc.cdc_not_required eq 1}}
  	<tr id="grc{{$itemc.cdc_id}}" style="background:#CCC;" >
  {{else}}
    <tr id="grc{{$itemc.cdc_id}}" >
  {{/if}}

  <td><a href="javascript:RequestcheckListIframe('adddoc_checklistmini','{{$itemc.cdc_id}}','14','');" >
    <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a><br />
     Make Not Required:
     <input type hidden name = "not_required_custom[{{$itemc.cdc_id}}][cdc_id]" value = "{{$itemc.cdc_id}}"  />
     <input type="checkbox" name = "not_required_custom[{{$itemc.cdc_id}}][cdc_not_required]" id="notreq2{{$itemc.cdc_id}}" onclick="process2({{$itemc.cdc_bsn_id}},{{$itemc.cdc_id}});" {{if $itemc.cdc_not_required eq 1 }} checked="checked" {{/if}} /> 
     <p id="myElem2{{$itemc.cdc_id}}" style="display:none;"></p>
     </td>
  <td> {{$itemc.cdc_doc_name}} </td>
 {{if !empty($ipad)}} 
    <td style="text-align:left;"><a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$itemc.cdc_file_name}}?dummy={{$ran}}" class="action_checklist" title="{{$itemc.cdc_file_name}}" target="_blank">{{$itemc.cdc_file_name|truncate:"40"}}</a></td>
   
    {{else}}
   <td style="text-align:left;"><a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$itemc.cdc_file_name}}?dummy={{$ran}}')" class="action_checklist" title="{{$item.doc_file_name}}">{{$itemc.cdc_file_name|truncate:"40"}}</a></td>
     {{/if}}
  <td> {{$itemc.cdc_date_uploaded|date_format:"%d/%m/%Y"}} </td>
  <td> {{$itemc.cdc_user_name}} </td>
  <td> 
<input type="radio" name="not_required_custom[{{$itemc.cdc_id}}][cwww]" value="1" {{if $itemc.cdc_cust_www == 1}} checked="checked" {{/if}}/> <span style="padding-top:5px;"> Yes </span> <br />
<input type="radio" name="not_required_custom[{{$itemc.cdc_id}}][cwww]" value="0" {{if $itemc.cdc_cust_www == 0}} checked="checked" {{/if}} /> NO 

   </td>
  </tr>
  {{/foreach}}
  {{/if}}
  
   <tr> <td colspan="6"><input type="submit" name="not_required_save" value="Update Proposal List" />
   <a href="javascript:RequestcheckListIframe('adddoc_checklistmini','','14','');" class="btn" >
    Add New Document</a> &nbsp; &nbsp;
      <strong> <span style="border:1px solid #AAA; padding:4px;"> Task List {{$done14}}/{{$tot14}} </span> </strong> &nbsp; &nbsp;
      <input type="button" value="Add Tasks / Sync Task" onclick="requestAddTaskProposal(14);" />
      <input type="button" value="Load Proposal Task List" onclick="requestAllTasksProposal(0,14);" />
      <input type="button" value="Show Hide Proposal Task List" onclick="javascript:parent.toggleDiv('myContent14');" />
   </td>
   
  </tr>
  </form>
</table>
<table width="100%" >  
    <tr> <td>  <div id="taskmsgproposal" style="color:#FF6600;" align="left"></div> </td> </tr>
    <tr> <td> <div id="AllTaskDivProposal14"></div> </td> </tr>
    <tr> <td> <div id="editTaskDivProposal" align="left"></div> </td> </tr>
</table>
{{/if}}


{{if !empty($print_data_mini15)}}
<br />
<div style="font-style:bold; text-align:left; padding:5px;"> 
<form name="tablename" method="post" action="" >
<input type="hidden" name="proposal[dpn_bsn_id]" value="{{$bsn_id_mini}}" />
<input type="hidden" name="proposal[dpn_proposal_number]" value="15" />
<div style="width:75%; float:left;">
Document Proposal : <input type="text" name="proposal[dpn_name]" value="{{$dpn_name_15}}"}} style="width:400px;"  />
Primary Design : <input type="radio" name="proposal[dpn_primary_design]" value="1"  {{if $dpn_primary_design_15  == 1}} checked="checked" {{/if}}/>  Yes  &nbsp; 
<input type="radio" name="proposal[dpn_primary_design]" value="0"  {{if $dpn_primary_design_15 == 0}} checked="checked" {{/if}} /> NO <br />
Design Type : <select name="proposal[dpn_design_type]">
<option value="1" {{if $dpn_design_type_15 eq 1}} selected="selected" {{/if}}>Concept Design</option>
<option value="2" {{if $dpn_design_type_15 eq 2}} selected="selected" {{/if}}>Modification Design</option>
<option value="3" {{if $dpn_design_type_15 eq 3}} selected="selected" {{/if}}>Existing Design</option>
<option value="4" {{if $dpn_design_type_15 eq 4}} selected="selected" {{/if}}>External Design </option>
</select> &nbsp &nbsp; &nbsp;
Customer Designer: <input type="text" name="proposal[dpn_customer_designer]" value="{{$dpn_customer_designer_15}}"}} style="width:200px;"/> &nbsp; <br />

Checklist Number : <input type="text" name="proposal[dpn_unique_id]" value="{{$dpn_unique_id_15}}" style="width:200px;"  /> &nbsp;
Project Type : <select name="proposal[dpn_project_type]">
<option value="1" {{if $dpn_project_type_15 eq 1}} selected="selected" {{/if}}>SR</option>
<option value="2" {{if $dpn_project_type_15 eq 2}} selected="selected" {{/if}}>FPE</option>
<option value="3" {{if $dpn_project_type_15 eq 3}} selected="selected" {{/if}}>Other</option>
</select>

</div>
<div style="width:25%; float:right;">
Notes: <br>
 <textarea rows="5" cols="40" name="proposal[dpn_notes]">{{$dpn_notes_15}}</textarea>
</div>

<input type="submit" name="table_name" value="Save" />

&nbsp;&nbsp; 
<input type="button" name="addfile" value="Compose Email" onclick="javascript:modelwindow('{{$BASE_URL}}business.proposalchecklistemail/bus_id/{{$bsn_id_mini}}/dpn_proposal_number/15','90%','90%', 'yes');" id="addfile" class="vsml" />
 
</form>

</div>

<table cellpadding="0" cellspacing="0" width="100%" id="divtruelog" style="border-collapse:collapse;">
  <tr>
    <th width="18%">Action</th>
    <th width="25%">Document Name</th>
    <th width="18%">File Name</th>
    <th width="6%">Date Uploaded</th>
    <th width="7%">User Name</th>
    <th width="10%">Customer WWW</th>
  </tr>
   <form name="nr" method="post" action="">
  {{foreach from=$print_data_mini15 item=item key=key}}
  {{if $item.doc_not_required eq 1}}
  	<tr id="gr{{$item.doc_id}}" style="background:#CCC;" >
  {{else}}
    <tr id="gr{{$item.doc_id}}" >
  {{/if}}
    <td><a href="javascript:RequestcheckListIframe('checklistmini','{{$item.doc_id}}','{{$item.doc_checklist_number}}','');" >
    <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a><br />
     Make Not Required:
     <input type hidden name = "not_required[{{$item.doc_id}}][doc_id]" value = "{{$item.doc_id}}"  />
     <input type="checkbox" name = "not_required[{{$item.doc_id}}][doc_not_required]" id="notreq{{$item.doc_id}}" onclick="process({{$item.doc_bsn_id}},{{$item.doc_id}});" {{if $item.doc_not_required eq 1 }} checked="checked" {{/if}} /> 
     <p id="myElem{{$item.doc_id}}" style="display:none;"></p>

    
    </td>
    <td style="padding-left:5px;">{{$item.admin_doc_manual}}{{if $item.doc_file_name !== '' && $item.admin_doc_id == 12}} CONTRACT SIGNED {{else}}{{$item.admin_doc_name}}{{/if}}</td>
	
    {{if !empty($ipad)}} 
    <td style="text-align:left;"><a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name}}?dummy={{$ran}}" class="action_checklist" title="{{$item.doc_file_name}}" target="_blank">{{$item.doc_file_name|truncate:"40"}}</a></td>
   
    {{else}}
   <td style="text-align:left;"><a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name}}?dummy={{$ran}}')" class="action_checklist" title="{{$item.doc_file_name}}">{{$item.doc_file_name|truncate:"40"}}</a></td>
     {{/if}}

    <td style="text-align:center;">{{$item.doc_date_uploaded|date_format:"%d/%m/%Y"}}</td>
    <td style="text-align:center;">{{$item.user_name}}</td>
 <td style="text-align:left;">
<input type="radio" name="not_required[{{$item.doc_id}}][cwww]" value="1" {{if $item.doc_cust_www  == 1}} checked="checked" {{/if}}/> <span style="padding-top:5px;"> Yes </span> <br />
<input type="radio" name="not_required[{{$item.doc_id}}][cwww]" value="0" {{if $item.doc_cust_www == 0}} checked="checked" {{/if}} /> NO 
</td>
  </tr>
  {{/foreach}}
  

  {{if !empty($cus_minidata15)}}

   {{foreach from=$cus_minidata15 item=itemc key=keyc}}
   {{if $itemc.cdc_not_required eq 1}}
  	<tr id="grc{{$itemc.cdc_id}}" style="background:#CCC;" >
  {{else}}
    <tr id="grc{{$itemc.cdc_id}}" >
  {{/if}}

  <td><a href="javascript:RequestcheckListIframe('adddoc_checklistmini','{{$itemc.cdc_id}}','15','');" >
    <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a><br />
     Make Not Required:
     <input type hidden name = "not_required_custom[{{$itemc.cdc_id}}][cdc_id]" value = "{{$itemc.cdc_id}}"  />
     <input type="checkbox" name = "not_required_custom[{{$itemc.cdc_id}}][cdc_not_required]" id="notreq2{{$itemc.cdc_id}}" onclick="process2({{$itemc.cdc_bsn_id}},{{$itemc.cdc_id}});" {{if $itemc.cdc_not_required eq 1 }} checked="checked" {{/if}} /> 
     <p id="myElem2{{$itemc.cdc_id}}" style="display:none;"></p>
     </td>
  <td> {{$itemc.cdc_doc_name}} </td>
 {{if !empty($ipad)}} 
    <td style="text-align:left;"><a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$itemc.cdc_file_name}}?dummy={{$ran}}" class="action_checklist" title="{{$itemc.cdc_file_name}}" target="_blank">{{$itemc.cdc_file_name|truncate:"40"}}</a></td>
   
    {{else}}
   <td style="text-align:left;"><a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$itemc.cdc_file_name}}?dummy={{$ran}}')" class="action_checklist" title="{{$item.doc_file_name}}">{{$itemc.cdc_file_name|truncate:"40"}}</a></td>
     {{/if}}
  <td> {{$itemc.cdc_date_uploaded|date_format:"%d/%m/%Y"}} </td>
  <td> {{$itemc.cdc_user_name}} </td>
  <td> 
<input type="radio" name="not_required_custom[{{$itemc.cdc_id}}][cwww]" value="1" {{if $itemc.cdc_cust_www == 1}} checked="checked" {{/if}}/> <span style="padding-top:5px;"> Yes </span> <br />
<input type="radio" name="not_required_custom[{{$itemc.cdc_id}}][cwww]" value="0" {{if $itemc.cdc_cust_www == 0}} checked="checked" {{/if}} /> NO 

   </td>
  </tr>
  {{/foreach}}
  {{/if}}
  
   <tr> <td colspan="6"><input type="submit" name="not_required_save" value="Update Proposal List" />
   <a href="javascript:RequestcheckListIframe('adddoc_checklistmini','','15','');" class="btn" >
    Add New Document</a> &nbsp; &nbsp;
      <strong> <span style="border:1px solid #AAA; padding:4px;"> Task List {{$done15}}/{{$tot15}} </span> </strong> &nbsp; &nbsp;
      <input type="button" value="Add Tasks / Sync Task" onclick="requestAddTaskProposal(15);" />
      <input type="button" value="Load Proposal Task List" onclick="requestAllTasksProposal(0,15);" />
      <input type="button" value="Show Hide Proposal Task List" onclick="javascript:parent.toggleDiv('myContent15');" />
   </td>
   
  </tr>
  </form>
</table>
<table width="100%" >  
    <tr> <td>  <div id="taskmsgproposal" style="color:#FF6600;" align="left"></div> </td> </tr>
    <tr> <td> <div id="AllTaskDivProposal15"></div> </td> </tr>
    <tr> <td> <div id="editTaskDivProposal" align="left"></div> </td> </tr>
</table>
{{/if}}



{{if !empty($print_data_mini16)}}
<br />
<div style="font-style:bold; text-align:left; padding:5px;"> 
<form name="tablename" method="post" action="" >
<input type="hidden" name="proposal[dpn_bsn_id]" value="{{$bsn_id_mini}}" />
<input type="hidden" name="proposal[dpn_proposal_number]" value="16" />
<div style="width:75%; float:left;">
Document Proposal : <input type="text" name="proposal[dpn_name]" value="{{$dpn_name_16}}"}} style="width:400px;"  />
Primary Design : <input type="radio" name="proposal[dpn_primary_design]" value="1"  {{if $dpn_primary_design_16  == 1}} checked="checked" {{/if}}/>  Yes  &nbsp; 
<input type="radio" name="proposal[dpn_primary_design]" value="0"  {{if $dpn_primary_design_16 == 0}} checked="checked" {{/if}} /> NO <br />
Design Type : <select name="proposal[dpn_design_type]">
<option value="1" {{if $dpn_design_type_16 eq 1}} selected="selected" {{/if}}>Concept Design</option>
<option value="2" {{if $dpn_design_type_16 eq 2}} selected="selected" {{/if}}>Modification Design</option>
<option value="3" {{if $dpn_design_type_16 eq 3}} selected="selected" {{/if}}>Existing Design</option>
<option value="4" {{if $dpn_design_type_16 eq 4}} selected="selected" {{/if}}>External Design </option>
</select> &nbsp &nbsp; &nbsp;
Customer Designer: <input type="text" name="proposal[dpn_customer_designer]" value="{{$dpn_customer_designer_16}}"}} style="width:200px;"/> &nbsp; <br />

Checklist Number : <input type="text" name="proposal[dpn_unique_id]" value="{{$dpn_unique_id_16}}" style="width:200px;"  /> &nbsp;
Project Type : <select name="proposal[dpn_project_type]">
<option value="1" {{if $dpn_project_type_16 eq 1}} selected="selected" {{/if}}>SR</option>
<option value="2" {{if $dpn_project_type_16 eq 2}} selected="selected" {{/if}}>FPE</option>
<option value="3" {{if $dpn_project_type_16 eq 3}} selected="selected" {{/if}}>Other</option>
</select>
</div>
<div style="width:25%; float:right;">
Notes: <br>
 <textarea rows="5" cols="40" name="proposal[dpn_notes]">{{$dpn_notes_16}}</textarea>
</div>
<input type="submit" name="table_name" value="Save" />

&nbsp;&nbsp; 
<input type="button" name="addfile" value="Compose Email" onclick="javascript:modelwindow('{{$BASE_URL}}business.proposalchecklistemail/bus_id/{{$bsn_id_mini}}/dpn_proposal_number/16','90%','90%', 'yes');" id="addfile" class="vsml" />

</form>

</div>

<table cellpadding="0" cellspacing="0" width="100%" id="divtruelog" style="border-collapse:collapse;">
  <tr>
    <th width="18%">Action</th>
    <th width="25%">Document Name</th>
    <th width="18%">File Name</th>
    <th width="6%">Date Uploaded</th>
    <th width="7%">User Name</th>
    <th width="10%">Customer WWW</th>
  </tr>
   <form name="nr" method="post" action="">
  {{foreach from=$print_data_mini16 item=item key=key}}
  {{if $item.doc_not_required eq 1}}
  	<tr id="gr{{$item.doc_id}}" style="background:#CCC;" >
  {{else}}
    <tr id="gr{{$item.doc_id}}" >
  {{/if}}
    <td><a href="javascript:RequestcheckListIframe('checklistmini','{{$item.doc_id}}','{{$item.doc_checklist_number}}','');" >
    <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a><br />
     Make Not Required:
     <input type hidden name = "not_required[{{$item.doc_id}}][doc_id]" value = "{{$item.doc_id}}"  />
     <input type="checkbox" name = "not_required[{{$item.doc_id}}][doc_not_required]" id="notreq{{$item.doc_id}}" onclick="process({{$item.doc_bsn_id}},{{$item.doc_id}});" {{if $item.doc_not_required eq 1 }} checked="checked" {{/if}} /> 
     <p id="myElem{{$item.doc_id}}" style="display:none;"></p>

    
    </td>
    <td style="padding-left:5px;">{{$item.admin_doc_manual}}{{if $item.doc_file_name !== '' && $item.admin_doc_id == 12}} CONTRACT SIGNED {{else}}{{$item.admin_doc_name}}{{/if}}</td>
	
    {{if !empty($ipad)}} 
    <td style="text-align:left;"><a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name}}?dummy={{$ran}}" class="action_checklist" title="{{$item.doc_file_name}}" target="_blank">{{$item.doc_file_name|truncate:"40"}}</a></td>
   
    {{else}}
   <td style="text-align:left;"><a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name}}?dummy={{$ran}}')" class="action_checklist" title="{{$item.doc_file_name}}">{{$item.doc_file_name|truncate:"40"}}</a></td>
     {{/if}}

    <td style="text-align:center;">{{$item.doc_date_uploaded|date_format:"%d/%m/%Y"}}</td>
    <td style="text-align:center;">{{$item.user_name}}</td>
 <td style="text-align:left;">
<input type="radio" name="not_required[{{$item.doc_id}}][cwww]" value="1" {{if $item.doc_cust_www  == 1}} checked="checked" {{/if}}/> <span style="padding-top:5px;"> Yes </span> <br />
<input type="radio" name="not_required[{{$item.doc_id}}][cwww]" value="0" {{if $item.doc_cust_www == 0}} checked="checked" {{/if}} /> NO 
</td>
  </tr>
  {{/foreach}}
  

  {{if !empty($cus_minidata16)}}

   {{foreach from=$cus_minidata16 item=itemc key=keyc}}
   {{if $itemc.cdc_not_required eq 1}}
  	<tr id="grc{{$itemc.cdc_id}}" style="background:#CCC;" >
  {{else}}
    <tr id="grc{{$itemc.cdc_id}}" >
  {{/if}}

  <td><a href="javascript:RequestcheckListIframe('adddoc_checklistmini','{{$itemc.cdc_id}}','16','');" >
    <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a><br />
     Make Not Required:
     <input type hidden name = "not_required_custom[{{$itemc.cdc_id}}][cdc_id]" value = "{{$itemc.cdc_id}}"  />
     <input type="checkbox" name = "not_required_custom[{{$itemc.cdc_id}}][cdc_not_required]" id="notreq2{{$itemc.cdc_id}}" onclick="process2({{$itemc.cdc_bsn_id}},{{$itemc.cdc_id}});" {{if $itemc.cdc_not_required eq 1 }} checked="checked" {{/if}} /> 
     <p id="myElem2{{$itemc.cdc_id}}" style="display:none;"></p>
     </td>
  <td> {{$itemc.cdc_doc_name}} </td>
 {{if !empty($ipad)}} 
    <td style="text-align:left;"><a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$itemc.cdc_file_name}}?dummy={{$ran}}" class="action_checklist" title="{{$itemc.cdc_file_name}}" target="_blank">{{$itemc.cdc_file_name|truncate:"40"}}</a></td>
   
    {{else}}
   <td style="text-align:left;"><a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$itemc.cdc_file_name}}?dummy={{$ran}}')" class="action_checklist" title="{{$item.doc_file_name}}">{{$itemc.cdc_file_name|truncate:"40"}}</a></td>
     {{/if}}
  <td> {{$itemc.cdc_date_uploaded|date_format:"%d/%m/%Y"}} </td>
  <td> {{$itemc.cdc_user_name}} </td>
  <td> 
<input type="radio" name="not_required_custom[{{$itemc.cdc_id}}][cwww]" value="1" {{if $itemc.cdc_cust_www == 1}} checked="checked" {{/if}}/> <span style="padding-top:5px;"> Yes </span> <br />
<input type="radio" name="not_required_custom[{{$itemc.cdc_id}}][cwww]" value="0" {{if $itemc.cdc_cust_www == 0}} checked="checked" {{/if}} /> NO 

   </td>
  </tr>
  {{/foreach}}
  {{/if}}
  
   <tr> <td colspan="6"><input type="submit" name="not_required_save" value="Update Proposal List" />
   <a href="javascript:RequestcheckListIframe('adddoc_checklistmini','','16','');" class="btn" >
    Add New Document</a> &nbsp; &nbsp;
      <strong> <span style="border:1px solid #AAA; padding:4px;"> Task List {{$done16}}/{{$tot16}} </span> </strong> &nbsp; &nbsp;
      <input type="button" value="Add Tasks / Sync Task" onclick="requestAddTaskProposal(16);" />
      <input type="button" value="Load Proposal Task List" onclick="requestAllTasksProposal(0,16);" />
      <input type="button" value="Show Hide Proposal Task List" onclick="javascript:parent.toggleDiv('myContent16');" />
   </td>
   
  </tr>
  </form>
</table>
<table width="100%" >  
    <tr> <td>  <div id="taskmsgproposal" style="color:#FF6600;" align="left"></div> </td> </tr>
    <tr> <td> <div id="AllTaskDivProposal16"></div> </td> </tr>
    <tr> <td> <div id="editTaskDivProposal" align="left"></div> </td> </tr>
</table>
{{/if}}


{{if !empty($print_data_mini17)}}
<br />
<div style="font-style:bold; text-align:left; padding:5px;"> 
<form name="tablename" method="post" action="" >
<input type="hidden" name="proposal[dpn_bsn_id]" value="{{$bsn_id_mini}}" />
<input type="hidden" name="proposal[dpn_proposal_number]" value="17" />
<div style="width:75%; float:left;">
Document Proposal : <input type="text" name="proposal[dpn_name]" value="{{$dpn_name_17}}"}} style="width:400px;"  />
Primary Design : <input type="radio" name="proposal[dpn_primary_design]" value="1"  {{if $dpn_primary_design_17  == 1}} checked="checked" {{/if}}/>  Yes  &nbsp; 
<input type="radio" name="proposal[dpn_primary_design]" value="0"  {{if $dpn_primary_design_17 == 0}} checked="checked" {{/if}} /> NO <br />
Design Type : <select name="proposal[dpn_design_type]">
<option value="1" {{if $dpn_design_type_17 eq 1}} selected="selected" {{/if}}>Concept Design</option>
<option value="2" {{if $dpn_design_type_17 eq 2}} selected="selected" {{/if}}>Modification Design</option>
<option value="3" {{if $dpn_design_type_17 eq 3}} selected="selected" {{/if}}>Existing Design</option>
<option value="4" {{if $dpn_design_type_17 eq 4}} selected="selected" {{/if}}>External Design </option>
</select> &nbsp &nbsp; &nbsp;
Customer Designer: <input type="text" name="proposal[dpn_customer_designer]" value="{{$dpn_customer_designer_17}}"}} style="width:200px;"/> &nbsp; <br />

Checklist Number : <input type="text" name="proposal[dpn_unique_id]" value="{{$dpn_unique_id_17}}" style="width:200px;"  /> &nbsp;
Project Type : <select name="proposal[dpn_project_type]">
<option value="1" {{if $dpn_project_type_17 eq 1}} selected="selected" {{/if}}>SR</option>
<option value="2" {{if $dpn_project_type_17 eq 2}} selected="selected" {{/if}}>FPE</option>
<option value="3" {{if $dpn_project_type_17 eq 3}} selected="selected" {{/if}}>Other</option>
</select>

</div>
<div style="width:25%; float:right;">
Notes: <br>
 <textarea rows="5" cols="40" name="proposal[dpn_notes]">{{$dpn_notes_17}}</textarea>
</div>
<input type="submit" name="table_name" value="Save" />

&nbsp;&nbsp; 
<input type="button" name="addfile" value="Compose Email" onclick="javascript:modelwindow('{{$BASE_URL}}business.proposalchecklistemail/bus_id/{{$bsn_id_mini}}/dpn_proposal_number/17','90%','90%', 'yes');" id="addfile" class="vsml" />
 
</form>

</div>

<table cellpadding="0" cellspacing="0" width="100%" id="divtruelog" style="border-collapse:collapse;">
  <tr>
    <th width="18%">Action</th>
    <th width="25%">Document Name</th>
    <th width="18%">File Name</th>
    <th width="6%">Date Uploaded</th>
    <th width="7%">User Name</th>
    <th width="10%">Customer WWW</th>
  </tr>
   <form name="nr" method="post" action="">
  {{foreach from=$print_data_mini17 item=item key=key}}
  {{if $item.doc_not_required eq 1}}
  	<tr id="gr{{$item.doc_id}}" style="background:#CCC;" >
  {{else}}
    <tr id="gr{{$item.doc_id}}" >
  {{/if}}
    <td><a href="javascript:RequestcheckListIframe('checklistmini','{{$item.doc_id}}','{{$item.doc_checklist_number}}','');" >
    <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a><br />
     Make Not Required:
     <input type hidden name = "not_required[{{$item.doc_id}}][doc_id]" value = "{{$item.doc_id}}"  />
     <input type="checkbox" name = "not_required[{{$item.doc_id}}][doc_not_required]" id="notreq{{$item.doc_id}}" onclick="process({{$item.doc_bsn_id}},{{$item.doc_id}});" {{if $item.doc_not_required eq 1 }} checked="checked" {{/if}} /> 
     <p id="myElem{{$item.doc_id}}" style="display:none;"></p>

    
    </td>
    <td style="padding-left:5px;">{{$item.admin_doc_manual}}{{if $item.doc_file_name !== '' && $item.admin_doc_id == 12}} CONTRACT SIGNED {{else}}{{$item.admin_doc_name}}{{/if}}</td>
	
    {{if !empty($ipad)}} 
    <td style="text-align:left;"><a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name}}?dummy={{$ran}}" class="action_checklist" title="{{$item.doc_file_name}}" target="_blank">{{$item.doc_file_name|truncate:"40"}}</a></td>
   
    {{else}}
   <td style="text-align:left;"><a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name}}?dummy={{$ran}}')" class="action_checklist" title="{{$item.doc_file_name}}">{{$item.doc_file_name|truncate:"40"}}</a></td>
     {{/if}}

    <td style="text-align:center;">{{$item.doc_date_uploaded|date_format:"%d/%m/%Y"}}</td>
    <td style="text-align:center;">{{$item.user_name}}</td>
 <td style="text-align:left;">
<input type="radio" name="not_required[{{$item.doc_id}}][cwww]" value="1" {{if $item.doc_cust_www  == 1}} checked="checked" {{/if}}/> <span style="padding-top:5px;"> Yes </span> <br />
<input type="radio" name="not_required[{{$item.doc_id}}][cwww]" value="0" {{if $item.doc_cust_www == 0}} checked="checked" {{/if}} /> NO 
</td>
  </tr>
  {{/foreach}}
  

  {{if !empty($cus_minidata17)}}

   {{foreach from=$cus_minidata17 item=itemc key=keyc}}
   {{if $itemc.cdc_not_required eq 1}}
  	<tr id="grc{{$itemc.cdc_id}}" style="background:#CCC;" >
  {{else}}
    <tr id="grc{{$itemc.cdc_id}}" >
  {{/if}}

  <td><a href="javascript:RequestcheckListIframe('adddoc_checklistmini','{{$itemc.cdc_id}}','17','');" >
    <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a><br />
     Make Not Required:
     <input type hidden name = "not_required_custom[{{$itemc.cdc_id}}][cdc_id]" value = "{{$itemc.cdc_id}}"  />
     <input type="checkbox" name = "not_required_custom[{{$itemc.cdc_id}}][cdc_not_required]" id="notreq2{{$itemc.cdc_id}}" onclick="process2({{$itemc.cdc_bsn_id}},{{$itemc.cdc_id}});" {{if $itemc.cdc_not_required eq 1 }} checked="checked" {{/if}} /> 
     <p id="myElem2{{$itemc.cdc_id}}" style="display:none;"></p>
     </td>
  <td> {{$itemc.cdc_doc_name}} </td>
 {{if !empty($ipad)}} 
    <td style="text-align:left;"><a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$itemc.cdc_file_name}}?dummy={{$ran}}" class="action_checklist" title="{{$itemc.cdc_file_name}}" target="_blank">{{$itemc.cdc_file_name|truncate:"40"}}</a></td>
   
    {{else}}
   <td style="text-align:left;"><a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$itemc.cdc_file_name}}?dummy={{$ran}}')" class="action_checklist" title="{{$item.doc_file_name}}">{{$itemc.cdc_file_name|truncate:"40"}}</a></td>
     {{/if}}
  <td> {{$itemc.cdc_date_uploaded|date_format:"%d/%m/%Y"}} </td>
  <td> {{$itemc.cdc_user_name}} </td>
  <td> 
<input type="radio" name="not_required_custom[{{$itemc.cdc_id}}][cwww]" value="1" {{if $itemc.cdc_cust_www == 1}} checked="checked" {{/if}}/> <span style="padding-top:5px;"> Yes </span> <br />
<input type="radio" name="not_required_custom[{{$itemc.cdc_id}}][cwww]" value="0" {{if $itemc.cdc_cust_www == 0}} checked="checked" {{/if}} /> NO 

   </td>
  </tr>
  {{/foreach}}
  {{/if}}
  
   <tr> <td colspan="6"><input type="submit" name="not_required_save" value="Update Proposal List" />
   <a href="javascript:RequestcheckListIframe('adddoc_checklistmini','','17','');" class="btn" >
    Add New Document</a> &nbsp; &nbsp;
      <strong> <span style="border:1px solid #AAA; padding:4px;"> Task List {{$done17}}/{{$tot17}} </span> </strong> &nbsp; &nbsp;
      <input type="button" value="Add Tasks / Sync Task" onclick="requestAddTaskProposal(17);" />
      <input type="button" value="Load Proposal Task List" onclick="requestAllTasksProposal(0,17);" />
      <input type="button" value="Show Hide Proposal Task List" onclick="javascript:parent.toggleDiv('myContent17');" />
   </td>
   
  </tr>
  </form>
</table>
<table width="100%" >  
    <tr> <td>  <div id="taskmsgproposal" style="color:#FF6600;" align="left"></div> </td> </tr>
    <tr> <td> <div id="AllTaskDivProposal17"></div> </td> </tr>
    <tr> <td> <div id="editTaskDivProposal" align="left"></div> </td> </tr>
</table>
{{/if}}


{{if !empty($print_data_mini18)}}
<br />
<div style="font-style:bold; text-align:left; padding:5px;"> 
<form name="tablename" method="post" action="" >
<input type="hidden" name="proposal[dpn_bsn_id]" value="{{$bsn_id_mini}}" />
<input type="hidden" name="proposal[dpn_proposal_number]" value="18" />
<div style="width:75%; float:left;">
Document Proposal : <input type="text" name="proposal[dpn_name]" value="{{$dpn_name_18}}"}} style="width:400px;"  />
Primary Design : <input type="radio" name="proposal[dpn_primary_design]" value="1"  {{if $dpn_primary_design_18  == 1}} checked="checked" {{/if}}/>  Yes  &nbsp; 
<input type="radio" name="proposal[dpn_primary_design]" value="0"  {{if $dpn_primary_design_18 == 0}} checked="checked" {{/if}} /> NO <br />
Design Type : <select name="proposal[dpn_design_type]">
<option value="1" {{if $dpn_design_type_18 eq 1}} selected="selected" {{/if}}>Concept Design</option>
<option value="2" {{if $dpn_design_type_18 eq 2}} selected="selected" {{/if}}>Modification Design</option>
<option value="3" {{if $dpn_design_type_18 eq 3}} selected="selected" {{/if}}>Existing Design</option>
<option value="4" {{if $dpn_design_type_18 eq 4}} selected="selected" {{/if}}>External Design </option>
</select> &nbsp &nbsp; &nbsp;
Customer Designer: <input type="text" name="proposal[dpn_customer_designer]" value="{{$dpn_customer_designer_18}}"}} style="width:200px;"/> &nbsp; <br />

Checklist Number : <input type="text" name="proposal[dpn_unique_id]" value="{{$dpn_unique_id_18}}" style="width:200px;"  /> &nbsp;
Project Type : <select name="proposal[dpn_project_type]">
<option value="1" {{if $dpn_project_type_18 eq 1}} selected="selected" {{/if}}>SR</option>
<option value="2" {{if $dpn_project_type_18 eq 2}} selected="selected" {{/if}}>FPE</option>
<option value="3" {{if $dpn_project_type_18 eq 3}} selected="selected" {{/if}}>Other</option>
</select>

</div>
<div style="width:25%; float:right;">
Notes: <br>
 <textarea rows="5" cols="40" name="proposal[dpn_notes]">{{$dpn_notes_18}}</textarea>
</div>
<input type="submit" name="table_name" value="Save" />

&nbsp;&nbsp; 
<input type="button" name="addfile" value="Compose Email" onclick="javascript:modelwindow('{{$BASE_URL}}business.proposalchecklistemail/bus_id/{{$bsn_id_mini}}/dpn_proposal_number/18','90%','90%', 'yes');" id="addfile" class="vsml" />

</form>

</div>

<table cellpadding="0" cellspacing="0" width="100%" id="divtruelog" style="border-collapse:collapse;">
  <tr>
    <th width="18%">Action</th>
    <th width="25%">Document Name</th>
    <th width="18%">File Name</th>
    <th width="6%">Date Uploaded</th>
    <th width="7%">User Name</th>
    <th width="10%">Customer WWW</th>
  </tr>
   <form name="nr" method="post" action="">
  {{foreach from=$print_data_mini18 item=item key=key}}
  {{if $item.doc_not_required eq 1}}
  	<tr id="gr{{$item.doc_id}}" style="background:#CCC;" >
  {{else}}
    <tr id="gr{{$item.doc_id}}" >
  {{/if}}
    <td><a href="javascript:RequestcheckListIframe('checklistmini','{{$item.doc_id}}','{{$item.doc_checklist_number}}','');" >
    <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a><br />
     Make Not Required:
     <input type hidden name = "not_required[{{$item.doc_id}}][doc_id]" value = "{{$item.doc_id}}"  />
     <input type="checkbox" name = "not_required[{{$item.doc_id}}][doc_not_required]" id="notreq{{$item.doc_id}}" onclick="process({{$item.doc_bsn_id}},{{$item.doc_id}});" {{if $item.doc_not_required eq 1 }} checked="checked" {{/if}} /> 
     <p id="myElem{{$item.doc_id}}" style="display:none;"></p>

    
    </td>
    <td style="padding-left:5px;">{{$item.admin_doc_manual}}{{if $item.doc_file_name !== '' && $item.admin_doc_id == 12}} CONTRACT SIGNED {{else}}{{$item.admin_doc_name}}{{/if}}</td>
	
    {{if !empty($ipad)}} 
    <td style="text-align:left;"><a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name}}?dummy={{$ran}}" class="action_checklist" title="{{$item.doc_file_name}}" target="_blank">{{$item.doc_file_name|truncate:"40"}}</a></td>
   
    {{else}}
   <td style="text-align:left;"><a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name}}?dummy={{$ran}}')" class="action_checklist" title="{{$item.doc_file_name}}">{{$item.doc_file_name|truncate:"40"}}</a></td>
     {{/if}}

    <td style="text-align:center;">{{$item.doc_date_uploaded|date_format:"%d/%m/%Y"}}</td>
    <td style="text-align:center;">{{$item.user_name}}</td>
 <td style="text-align:left;">
<input type="radio" name="not_required[{{$item.doc_id}}][cwww]" value="1" {{if $item.doc_cust_www  == 1}} checked="checked" {{/if}}/> <span style="padding-top:5px;"> Yes </span> <br />
<input type="radio" name="not_required[{{$item.doc_id}}][cwww]" value="0" {{if $item.doc_cust_www == 0}} checked="checked" {{/if}} /> NO 
</td>
  </tr>
  {{/foreach}}
  

  {{if !empty($cus_minidata18)}}

   {{foreach from=$cus_minidata18 item=itemc key=keyc}}
   {{if $itemc.cdc_not_required eq 1}}
  	<tr id="grc{{$itemc.cdc_id}}" style="background:#CCC;" >
  {{else}}
    <tr id="grc{{$itemc.cdc_id}}" >
  {{/if}}

  <td><a href="javascript:RequestcheckListIframe('adddoc_checklistmini','{{$itemc.cdc_id}}','18','');" >
    <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a><br />
     Make Not Required:
     <input type hidden name = "not_required_custom[{{$itemc.cdc_id}}][cdc_id]" value = "{{$itemc.cdc_id}}"  />
     <input type="checkbox" name = "not_required_custom[{{$itemc.cdc_id}}][cdc_not_required]" id="notreq2{{$itemc.cdc_id}}" onclick="process2({{$itemc.cdc_bsn_id}},{{$itemc.cdc_id}});" {{if $itemc.cdc_not_required eq 1 }} checked="checked" {{/if}} /> 
     <p id="myElem2{{$itemc.cdc_id}}" style="display:none;"></p>
     </td>
  <td> {{$itemc.cdc_doc_name}} </td>
 {{if !empty($ipad)}} 
    <td style="text-align:left;"><a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$itemc.cdc_file_name}}?dummy={{$ran}}" class="action_checklist" title="{{$itemc.cdc_file_name}}" target="_blank">{{$itemc.cdc_file_name|truncate:"40"}}</a></td>
   
    {{else}}
   <td style="text-align:left;"><a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$itemc.cdc_file_name}}?dummy={{$ran}}')" class="action_checklist" title="{{$item.doc_file_name}}">{{$itemc.cdc_file_name|truncate:"40"}}</a></td>
     {{/if}}
  <td> {{$itemc.cdc_date_uploaded|date_format:"%d/%m/%Y"}} </td>
  <td> {{$itemc.cdc_user_name}} </td>
  <td> 
<input type="radio" name="not_required_custom[{{$itemc.cdc_id}}][cwww]" value="1" {{if $itemc.cdc_cust_www == 1}} checked="checked" {{/if}}/> <span style="padding-top:5px;"> Yes </span> <br />
<input type="radio" name="not_required_custom[{{$itemc.cdc_id}}][cwww]" value="0" {{if $itemc.cdc_cust_www == 0}} checked="checked" {{/if}} /> NO 

   </td>
  </tr>
  {{/foreach}}
  {{/if}}
  
   <tr> <td colspan="6"><input type="submit" name="not_required_save" value="Update Proposal List" />
   <a href="javascript:RequestcheckListIframe('adddoc_checklistmini','','18','');" class="btn" >
    Add New Document</a> &nbsp; &nbsp;
      <strong> <span style="border:1px solid #AAA; padding:4px;"> Task List {{$done18}}/{{$tot18}} </span> </strong> &nbsp; &nbsp;
      <input type="button" value="Add Tasks / Sync Task" onclick="requestAddTaskProposal(18);" />
      <input type="button" value="Load Proposal Task List" onclick="requestAllTasksProposal(0,18);" />
      <input type="button" value="Show Hide Proposal Task List" onclick="javascript:parent.toggleDiv('myContent18');" />
   </td>
   
  </tr>
  </form>
</table>
<table width="100%" >  
    <tr> <td>  <div id="taskmsgproposal" style="color:#FF6600;" align="left"></div> </td> </tr>
    <tr> <td> <div id="AllTaskDivProposal18"></div> </td> </tr>
    <tr> <td> <div id="editTaskDivProposal" align="left"></div> </td> </tr>
</table>
{{/if}}


{{if !empty($print_data_mini19)}}
<br />
<div style="font-style:bold; text-align:left; padding:5px;"> 
<form name="tablename" method="post" action="" >
<input type="hidden" name="proposal[dpn_bsn_id]" value="{{$bsn_id_mini}}" />
<input type="hidden" name="proposal[dpn_proposal_number]" value="19" />
<div style="width:75%; float:left;">
Document Proposal : <input type="text" name="proposal[dpn_name]" value="{{$dpn_name_19}}"}} style="width:400px;"  />
Primary Design : <input type="radio" name="proposal[dpn_primary_design]" value="1"  {{if $dpn_primary_design_19  == 1}} checked="checked" {{/if}}/>  Yes  &nbsp; 
<input type="radio" name="proposal[dpn_primary_design]" value="0"  {{if $dpn_primary_design_19 == 0}} checked="checked" {{/if}} /> NO <br />
Design Type : <select name="proposal[dpn_design_type]">
<option value="1" {{if $dpn_design_type_19 eq 1}} selected="selected" {{/if}}>Concept Design</option>
<option value="2" {{if $dpn_design_type_19 eq 2}} selected="selected" {{/if}}>Modification Design</option>
<option value="3" {{if $dpn_design_type_19 eq 3}} selected="selected" {{/if}}>Existing Design</option>
<option value="4" {{if $dpn_design_type_19 eq 4}} selected="selected" {{/if}}>External Design </option>
</select> &nbsp &nbsp; &nbsp;
Customer Designer: <input type="text" name="proposal[dpn_customer_designer]" value="{{$dpn_customer_designer_19}}"}} style="width:200px;"/> &nbsp; <br />

Checklist Number : <input type="text" name="proposal[dpn_unique_id]" value="{{$dpn_unique_id_19}}" style="width:200px;"  /> &nbsp;
Project Type : <select name="proposal[dpn_project_type]">
<option value="1" {{if $dpn_project_type_19 eq 1}} selected="selected" {{/if}}>SR</option>
<option value="2" {{if $dpn_project_type_19 eq 2}} selected="selected" {{/if}}>FPE</option>
<option value="3" {{if $dpn_project_type_19 eq 3}} selected="selected" {{/if}}>Other</option>
</select>

</div>
<div style="width:25%; float:right;">
Notes: <br>
 <textarea rows="5" cols="40" name="proposal[dpn_notes]">{{$dpn_notes_19}}</textarea>
</div>

<input type="submit" name="table_name" value="Save" />

&nbsp;&nbsp; 
<input type="button" name="addfile" value="Compose Email" onclick="javascript:modelwindow('{{$BASE_URL}}business.proposalchecklistemail/bus_id/{{$bsn_id_mini}}/dpn_proposal_number/19','90%','90%', 'yes');" id="addfile" class="vsml" />

</form>

</div>

<table cellpadding="0" cellspacing="0" width="100%" id="divtruelog" style="border-collapse:collapse;">
  <tr>
    <th width="18%">Action</th>
    <th width="25%">Document Name</th>
    <th width="18%">File Name</th>
    <th width="6%">Date Uploaded</th>
    <th width="7%">User Name</th>
    <th width="10%">Customer WWW</th>
  </tr>
   <form name="nr" method="post" action="">
  {{foreach from=$print_data_mini19 item=item key=key}}
  {{if $item.doc_not_required eq 1}}
  	<tr id="gr{{$item.doc_id}}" style="background:#CCC;" >
  {{else}}
    <tr id="gr{{$item.doc_id}}" >
  {{/if}}
    <td><a href="javascript:RequestcheckListIframe('checklistmini','{{$item.doc_id}}','{{$item.doc_checklist_number}}','');" >
    <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a><br />
     Make Not Required:
     <input type hidden name = "not_required[{{$item.doc_id}}][doc_id]" value = "{{$item.doc_id}}"  />
     <input type="checkbox" name = "not_required[{{$item.doc_id}}][doc_not_required]" id="notreq{{$item.doc_id}}" onclick="process({{$item.doc_bsn_id}},{{$item.doc_id}});" {{if $item.doc_not_required eq 1 }} checked="checked" {{/if}} /> 
     <p id="myElem{{$item.doc_id}}" style="display:none;"></p>

    
    </td>
    <td style="padding-left:5px;">{{$item.admin_doc_manual}}{{if $item.doc_file_name !== '' && $item.admin_doc_id == 12}} CONTRACT SIGNED {{else}}{{$item.admin_doc_name}}{{/if}}</td>
	
    {{if !empty($ipad)}} 
    <td style="text-align:left;"><a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name}}?dummy={{$ran}}" class="action_checklist" title="{{$item.doc_file_name}}" target="_blank">{{$item.doc_file_name|truncate:"40"}}</a></td>
   
    {{else}}
   <td style="text-align:left;"><a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name}}?dummy={{$ran}}')" class="action_checklist" title="{{$item.doc_file_name}}">{{$item.doc_file_name|truncate:"40"}}</a></td>
     {{/if}}

    <td style="text-align:center;">{{$item.doc_date_uploaded|date_format:"%d/%m/%Y"}}</td>
    <td style="text-align:center;">{{$item.user_name}}</td>
 <td style="text-align:left;">
<input type="radio" name="not_required[{{$item.doc_id}}][cwww]" value="1" {{if $item.doc_cust_www  == 1}} checked="checked" {{/if}}/> <span style="padding-top:5px;"> Yes </span> <br />
<input type="radio" name="not_required[{{$item.doc_id}}][cwww]" value="0" {{if $item.doc_cust_www == 0}} checked="checked" {{/if}} /> NO 
</td>
  </tr>
  {{/foreach}}
  

  {{if !empty($cus_minidata19)}}

   {{foreach from=$cus_minidata19 item=itemc key=keyc}}
   {{if $itemc.cdc_not_required eq 1}}
  	<tr id="grc{{$itemc.cdc_id}}" style="background:#CCC;" >
  {{else}}
    <tr id="grc{{$itemc.cdc_id}}" >
  {{/if}}

  <td><a href="javascript:RequestcheckListIframe('adddoc_checklistmini','{{$itemc.cdc_id}}','19','');" >
    <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a><br />
     Make Not Required:
     <input type hidden name = "not_required_custom[{{$itemc.cdc_id}}][cdc_id]" value = "{{$itemc.cdc_id}}"  />
     <input type="checkbox" name = "not_required_custom[{{$itemc.cdc_id}}][cdc_not_required]" id="notreq2{{$itemc.cdc_id}}" onclick="process2({{$itemc.cdc_bsn_id}},{{$itemc.cdc_id}});" {{if $itemc.cdc_not_required eq 1 }} checked="checked" {{/if}} /> 
     <p id="myElem2{{$itemc.cdc_id}}" style="display:none;"></p>
     </td>
  <td> {{$itemc.cdc_doc_name}} </td>
 {{if !empty($ipad)}} 
    <td style="text-align:left;"><a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$itemc.cdc_file_name}}?dummy={{$ran}}" class="action_checklist" title="{{$itemc.cdc_file_name}}" target="_blank">{{$itemc.cdc_file_name|truncate:"40"}}</a></td>
   
    {{else}}
   <td style="text-align:left;"><a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$itemc.cdc_file_name}}?dummy={{$ran}}')" class="action_checklist" title="{{$item.doc_file_name}}">{{$itemc.cdc_file_name|truncate:"40"}}</a></td>
     {{/if}}
  <td> {{$itemc.cdc_date_uploaded|date_format:"%d/%m/%Y"}} </td>
  <td> {{$itemc.cdc_user_name}} </td>
  <td> 
<input type="radio" name="not_required_custom[{{$itemc.cdc_id}}][cwww]" value="1" {{if $itemc.cdc_cust_www == 1}} checked="checked" {{/if}}/> <span style="padding-top:5px;"> Yes </span> <br />
<input type="radio" name="not_required_custom[{{$itemc.cdc_id}}][cwww]" value="0" {{if $itemc.cdc_cust_www == 0}} checked="checked" {{/if}} /> NO 

   </td>
  </tr>
  {{/foreach}}
  {{/if}}
  
   <tr> <td colspan="6"><input type="submit" name="not_required_save" value="Update Proposal List" />
   <a href="javascript:RequestcheckListIframe('adddoc_checklistmini','','19','');" class="btn" >
    Add New Document</a> &nbsp; &nbsp;
      <strong> <span style="border:1px solid #AAA; padding:4px;"> Task List {{$done19}}/{{$tot19}} </span> </strong> &nbsp; &nbsp;
      <input type="button" value="Add Tasks / Sync Task" onclick="requestAddTaskProposal(19);" />
      <input type="button" value="Load Proposal Task List" onclick="requestAllTasksProposal(0,19);" />
      <input type="button" value="Show Hide Proposal Task List" onclick="javascript:parent.toggleDiv('myContent19');" />
   </td>
   
  </tr>
  </form>
</table>
<table width="100%" >  
    <tr> <td>  <div id="taskmsgproposal" style="color:#FF6600;" align="left"></div> </td> </tr>
    <tr> <td> <div id="AllTaskDivProposal19"></div> </td> </tr>
    <tr> <td> <div id="editTaskDivProposal" align="left"></div> </td> </tr>
</table>
{{/if}}


{{if !empty($print_data_mini20)}}
<br />
<div style="font-style:bold; text-align:left; padding:5px;"> 
<form name="tablename" method="post" action="" >
<input type="hidden" name="proposal[dpn_bsn_id]" value="{{$bsn_id_mini}}" />
<input type="hidden" name="proposal[dpn_proposal_number]" value="20" />
<div style="width:75%; float:left;">
Document Proposal : <input type="text" name="proposal[dpn_name]" value="{{$dpn_name_20}}"}} style="width:400px;"  />
Primary Design : <input type="radio" name="proposal[dpn_primary_design]" value="1"  {{if $dpn_primary_design_20  == 1}} checked="checked" {{/if}}/>  Yes  &nbsp; 
<input type="radio" name="proposal[dpn_primary_design]" value="0"  {{if $dpn_primary_design_20 == 0}} checked="checked" {{/if}} /> NO <br />
Design Type : <select name="proposal[dpn_design_type]">
<option value="1" {{if $dpn_design_type_20 eq 1}} selected="selected" {{/if}}>Concept Design</option>
<option value="2" {{if $dpn_design_type_20 eq 2}} selected="selected" {{/if}}>Modification Design</option>
<option value="3" {{if $dpn_design_type_20 eq 3}} selected="selected" {{/if}}>Existing Design</option>
<option value="4" {{if $dpn_design_type_20 eq 4}} selected="selected" {{/if}}>External Design </option>
</select> &nbsp &nbsp; &nbsp;
Customer Designer: <input type="text" name="proposal[dpn_customer_designer]" value="{{$dpn_customer_designer_20}}"}} style="width:200px;"/> &nbsp; <br />

Checklist Number : <input type="text" name="proposal[dpn_unique_id]" value="{{$dpn_unique_id_20}}" style="width:200px;"  /> &nbsp;
Project Type : <select name="proposal[dpn_project_type]">
<option value="1" {{if $dpn_project_type_20 eq 1}} selected="selected" {{/if}}>SR</option>
<option value="2" {{if $dpn_project_type_20 eq 2}} selected="selected" {{/if}}>FPE</option>
<option value="3" {{if $dpn_project_type_20 eq 3}} selected="selected" {{/if}}>Other</option>
</select>
</div>
<div style="width:25%; float:right;">
Notes: <br>
 <textarea rows="5" cols="40" name="proposal[dpn_notes]">{{$dpn_notes_20}}</textarea>
</div>

<input type="submit" name="table_name" value="Save" />

&nbsp;&nbsp; 
<input type="button" name="addfile" value="Compose Email" onclick="javascript:modelwindow('{{$BASE_URL}}business.proposalchecklistemail/bus_id/{{$bsn_id_mini}}/dpn_proposal_number/20','90%','90%', 'yes');" id="addfile" class="vsml" />

</form>

</div>

<table cellpadding="0" cellspacing="0" width="100%" id="divtruelog" style="border-collapse:collapse;">
  <tr>
    <th width="18%">Action</th>
    <th width="25%">Document Name</th>
    <th width="18%">File Name</th>
    <th width="6%">Date Uploaded</th>
    <th width="7%">User Name</th>
    <th width="10%">Customer WWW</th>
  </tr>
   <form name="nr" method="post" action="">
  {{foreach from=$print_data_mini20 item=item key=key}}
  {{if $item.doc_not_required eq 1}}
  	<tr id="gr{{$item.doc_id}}" style="background:#CCC;" >
  {{else}}
    <tr id="gr{{$item.doc_id}}" >
  {{/if}}
    <td><a href="javascript:RequestcheckListIframe('checklistmini','{{$item.doc_id}}','{{$item.doc_checklist_number}}','');" >
    <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a><br />
     Make Not Required:
     <input type hidden name = "not_required[{{$item.doc_id}}][doc_id]" value = "{{$item.doc_id}}"  />
     <input type="checkbox" name = "not_required[{{$item.doc_id}}][doc_not_required]" id="notreq{{$item.doc_id}}" onclick="process({{$item.doc_bsn_id}},{{$item.doc_id}});" {{if $item.doc_not_required eq 1 }} checked="checked" {{/if}} /> 
     <p id="myElem{{$item.doc_id}}" style="display:none;"></p>

    
    </td>
    <td style="padding-left:5px;">{{$item.admin_doc_manual}}{{if $item.doc_file_name !== '' && $item.admin_doc_id == 12}} CONTRACT SIGNED {{else}}{{$item.admin_doc_name}}{{/if}}</td>
	
    {{if !empty($ipad)}} 
    <td style="text-align:left;"><a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name}}?dummy={{$ran}}" class="action_checklist" title="{{$item.doc_file_name}}" target="_blank">{{$item.doc_file_name|truncate:"40"}}</a></td>
   
    {{else}}
   <td style="text-align:left;"><a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name}}?dummy={{$ran}}')" class="action_checklist" title="{{$item.doc_file_name}}">{{$item.doc_file_name|truncate:"40"}}</a></td>
     {{/if}}

    <td style="text-align:center;">{{$item.doc_date_uploaded|date_format:"%d/%m/%Y"}}</td>
    <td style="text-align:center;">{{$item.user_name}}</td>
 <td style="text-align:left;">
<input type="radio" name="not_required[{{$item.doc_id}}][cwww]" value="1" {{if $item.doc_cust_www  == 1}} checked="checked" {{/if}}/> <span style="padding-top:5px;"> Yes </span> <br />
<input type="radio" name="not_required[{{$item.doc_id}}][cwww]" value="0" {{if $item.doc_cust_www == 0}} checked="checked" {{/if}} /> NO 
</td>
  </tr>
  {{/foreach}}
  

  {{if !empty($cus_minidata20)}}

   {{foreach from=$cus_minidata20 item=itemc key=keyc}}
   {{if $itemc.cdc_not_required eq 1}}
  	<tr id="grc{{$itemc.cdc_id}}" style="background:#CCC;" >
  {{else}}
    <tr id="grc{{$itemc.cdc_id}}" >
  {{/if}}

  <td><a href="javascript:RequestcheckListIframe('adddoc_checklistmini','{{$itemc.cdc_id}}','20','');" >
    <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a><br />
     Make Not Required:
     <input type hidden name = "not_required_custom[{{$itemc.cdc_id}}][cdc_id]" value = "{{$itemc.cdc_id}}"  />
     <input type="checkbox" name = "not_required_custom[{{$itemc.cdc_id}}][cdc_not_required]" id="notreq2{{$itemc.cdc_id}}" onclick="process2({{$itemc.cdc_bsn_id}},{{$itemc.cdc_id}});" {{if $itemc.cdc_not_required eq 1 }} checked="checked" {{/if}} /> 
     <p id="myElem2{{$itemc.cdc_id}}" style="display:none;"></p>
     </td>
  <td> {{$itemc.cdc_doc_name}} </td>
 {{if !empty($ipad)}} 
    <td style="text-align:left;"><a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$itemc.cdc_file_name}}?dummy={{$ran}}" class="action_checklist" title="{{$itemc.cdc_file_name}}" target="_blank">{{$itemc.cdc_file_name|truncate:"40"}}</a></td>
   
    {{else}}
   <td style="text-align:left;"><a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$itemc.cdc_file_name}}?dummy={{$ran}}')" class="action_checklist" title="{{$item.doc_file_name}}">{{$itemc.cdc_file_name|truncate:"40"}}</a></td>
     {{/if}}
  <td> {{$itemc.cdc_date_uploaded|date_format:"%d/%m/%Y"}} </td>
  <td> {{$itemc.cdc_user_name}} </td>
  <td> 
<input type="radio" name="not_required_custom[{{$itemc.cdc_id}}][cwww]" value="1" {{if $itemc.cdc_cust_www == 1}} checked="checked" {{/if}}/> <span style="padding-top:5px;"> Yes </span> <br />
<input type="radio" name="not_required_custom[{{$itemc.cdc_id}}][cwww]" value="0" {{if $itemc.cdc_cust_www == 0}} checked="checked" {{/if}} /> NO 

   </td>
  </tr>
  {{/foreach}}
  {{/if}}
  
   <tr> <td colspan="6"><input type="submit" name="not_required_save" value="Update Proposal List" />
   <a href="javascript:RequestcheckListIframe('adddoc_checklistmini','','20','');" class="btn" >
    Add New Document</a> &nbsp; &nbsp;
      <strong> <span style="border:1px solid #AAA; padding:4px;"> Task List {{$done20}}/{{$tot20}} </span> </strong> &nbsp; &nbsp;
      <input type="button" value="Add Tasks / Sync Task" onclick="requestAddTaskProposal(20);" />
      <input type="button" value="Load Proposal Task List" onclick="requestAllTasksProposal(0,20);" />
      <input type="button" value="Show Hide Proposal Task List" onclick="javascript:parent.toggleDiv('myContent20');" />
   </td>
   
  </tr>
  </form>
</table>
<table width="100%" >  
    <tr> <td>  <div id="taskmsgproposal" style="color:#FF6600;" align="left"></div> </td> </tr>
    <tr> <td> <div id="AllTaskDivProposal20"></div> </td> </tr>
    <tr> <td> <div id="editTaskDivProposal" align="left"></div> </td> </tr>
</table>
{{/if}}




{{if !empty($iframe_data) AND $iframe_data==1}}
<!--------------- Begin iframe_data ------->
<link rel="stylesheet" href="{{$BASE_URL}}css/default/cis-styles.css" />
<div style="border:1px #CCCCCC solid; padding:5px;" id="checkListIframe"  >
  <script>
function remove_img()
	{
		document.getElementById('doc_file_name_temp').value = '';
		document.getElementById('label_doc_file_name_temp').style.visibility = 'hidden';
		document.getElementById('crossimg').style.visibility = 'hidden';
	}
</script>
  <form action="" method="post" enctype="multipart/form-data" name="iframe-form">
    <input type="hidden" name="doc[doc_id]" value="{{$doc_data.doc_id}}" />
    <table cellpadding="0" cellspacing="0" class="table"  >
      <tr>
        <td><strong>Document Name:</strong></td>
        <td style="background-color:#E0E6FF;padding:5px; font-size:12px; font-weight:bold;">{{$doc_data.admin_doc_name}}</td>
      </tr>
      <tr>
        <td><strong>File Name:</strong></td>
        <td>{{$doc_data.doc_file_name}}</td>
      </tr>
      <tr>
        <td><strong>Load File:</strong></td>
        <td><input type="file" name="image" id="doc_file_name" />
          {{if !empty($doc_data.doc_file_name)}}
          <input type="hidden" name="doc[doc_file_name_temp]" value="{{$doc_data.doc_file_name}}" id="doc_file_name_temp" />
          <a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$doc_data.doc_file_name}}')" id="label_doc_file_name_temp" target="_blank">{{$doc_data.doc_file_name}}</a> <a href="javascript:remove_img();" id="crossimg"><img src="{{$BASE_URL}}css/default/images/notdone-task.gif" id="crossimg" /></a> {{/if}} </td>
      </tr>
      <tr>
        <td colspan="2">
          <table width="991" cellpadding="0" cellspacing="0" style="border:none;">
            <tr>
              <td width="178"><strong>DocumentClick:</strong>
                <input type="checkbox" {{if $doc_data.doc_upload_to_dossier == 1}} checked="checked" {{/if}} name="doc[doc_upload_to_dossier]" value="1" /></td>
              <td width="246">&nbsp;</td>
              <td width="23" style="padding-left:15px;"></td>
              <td width="195"><strong>Document Not Available:</strong>
                <input type="checkbox" {{if $doc_data.doc_not_avail == 1}} checked="checked" {{/if}} name="doc[doc_not_avail]" value="1" /></td>
              <td width="347">&nbsp;</td>
            </tr>
            <tr>
              <td><strong>Date Uploaded:</strong></td>
              <td>{{$doc_data.doc_date_uploaded}}</td>
              <td style="padding-left:15px;"></td>
              <td><strong>Loaded By:</strong></td>
              <td>{{$doc_data.user_name}}</td>
            </tr>
          </table></td>
      </tr>
      <tr>
        <td><strong>Note:</strong></td>
        <td><textarea cols="50" rows="5" name="doc[doc_msg]">{{$doc_data.doc_msg}}</textarea></td>
      </tr>
      <tr>
        <td colspan="2" style="text-align:center;"><input type="submit"  value="Save" name="submit_iframe" style="cursor:pointer;" />
          <input type="button"  value="Cancel" onclick="parent.hideiFrame('checkListIframe');" style="cursor:pointer;" />
        </td>
      </tr>
    </table>
  </form>
</div>
<!--------------- End iframe_data ------->
<!-- End Create Document Checklist section -->
{{/if}}

{{if !empty($iframe_data_mini) AND $iframe_data_mini==1}}
<!--------------- Begin iframe_data_mini ------->
<link rel="stylesheet" href="{{$BASE_URL}}css/default/cis-styles.css" />
<div style="border:1px #CCCCCC solid; padding:5px;" id="checkListIframeMini"  >
  <script>
function remove_img()
	{
		document.getElementById('doc_file_name_temp').value = '';
		document.getElementById('label_doc_file_name_temp').style.visibility = 'hidden';
		document.getElementById('crossimg').style.visibility = 'hidden';
	}
</script>
  <form action="" method="post" enctype="multipart/form-data" name="iframe-form">
    <input type="hidden" name="doc[doc_id]" value="{{$doc_data.doc_id}}" />
    <table cellpadding="0" cellspacing="0" class="table" style="font-size:12px;"  >
      <tr>
        <td><strong>Document Name:</strong></td>
        <td style="background-color:#E0E6FF;padding:5px; font-size:12px; font-weight:bold;">{{$doc_data.admin_doc_name}}</td>
      </tr>
      <tr>
        <td><strong>File Name:</strong></td>
        <td>{{$doc_data.doc_file_name}}</td>
      </tr>
      <tr>
        <td><strong>Load File:</strong></td>
        <td><input type="file" name="image" id="doc_file_name" />
         <input type="hidden" name="doc[doc_checklist_number]" value="{{$doc_data.doc_checklist_number}}"  />
          {{if !empty($doc_data.doc_file_name)}}
          <input type="hidden" name="doc[doc_file_name_temp]" value="{{$doc_data.doc_file_name}}" id="doc_file_name_temp" />
         
          <a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$doc_data.doc_file_name}}?dummy={{$ran}}')" id="label_doc_file_name_temp" target="_blank">{{$doc_data.doc_file_name}}</a> <a href="javascript:remove_img();" id="crossimg"><img src="{{$BASE_URL}}css/default/images/notdone-task.gif" id="crossimg" /></a> {{/if}} </td>
      </tr>
      <tr>
        <td colspan="2">
          <table width="991" cellpadding="0" cellspacing="0" style="border:none; font-size:12px;">
            <tr>
              <td width="178"><strong>Upload To Dossier:</strong>
                <input type="checkbox" {{if $doc_data.doc_upload_to_dossier == 1}} checked="checked" {{/if}} name="doc[doc_upload_to_dossier]" value="1" /></td>
              <td width="246">&nbsp;</td>
              <td width="23" style="padding-left:15px;"></td>
              <td width="195"><strong>Document Not Available:</strong>
                <input type="checkbox" {{if $doc_data.doc_not_avail == 1}} checked="checked" {{/if}} name="doc[doc_not_avail]" value="1" /></td>
              <td width="347">&nbsp;</td>
            </tr>
            <tr>
              <td><strong>Date Uploaded:</strong></td>
              <td>{{$doc_data.doc_date_uploaded}}</td>
              <td style="padding-left:15px;"></td>
              <td><strong>Loaded By:</strong></td>
              <td>{{$doc_data.user_name}}</td>
            </tr>
          </table></td>
      </tr>
      <tr>
        <td><strong>Note:</strong></td>
        <td><textarea cols="50" rows="5" name="doc[doc_msg]">{{$doc_data.doc_msg}}</textarea></td>
      </tr>
      <tr>
        <td colspan="2" style="text-align:center;"><input type="submit"  value="Save" name="submit_iframe_mini" style="cursor:pointer;" />
          <input type="button"  value="Cancel" onclick="parent.hideiFrame('checkListIframeMini');" style="cursor:pointer;" />
        </td>
      </tr>
    </table>
  </form>
</div>
<!--------------- End iframe_data_mini ------->
<!-- End Create Document Checklist section -->
{{/if}}


{{if !empty($iframe_data_mini_adddoc) AND $iframe_data_mini_adddoc==1}}
<!--------------- Begin iframe_data_mini_adddoc ------->
<link rel="stylesheet" href="{{$BASE_URL}}css/default/cis-styles.css" />
<div style="border:1px #CCCCCC solid; padding:5px;" id="adddoc_checkListIframeMini"  >
  <script>
function remove_img()
	{
		document.getElementById('cdc_file_name_temp').value = '';
		document.getElementById('label_cdc_file_name_temp').style.visibility = 'hidden';
		document.getElementById('crossimg').style.visibility = 'hidden';
	}
</script>
  <form action="" method="post" enctype="multipart/form-data" name="iframe-form">
   <!-- <input type="hidden" name="mini[bsn_id]" value="{{$p_id}}" />-->
    <table cellpadding="0" cellspacing="0" class="table" style="font-size:12px;"  >
      <tr>
        <td><strong>Document Name1:</strong></td>
        <td><input type="text" name="mini[cdc_doc_name]" value="{{$cdetail.cdc_doc_name}}" style="width:550px;" /></td>
      </tr>
      <tr>
        <td><strong>File Name:</strong></td>
        <td>{{$cdetail.cdc_file_name}}</td>
      </tr>
      <tr>
        <td><strong>Load File:</strong></td>
        <td><input type="file" name="custom_mini" id="cdc_file_name_mini" />
          {{if !empty($cdetail.cdc_file_name)}}
          <input type="hidden" name="doc[cdc_file_name_temp]" value="{{$cdetail.cdc_file_name}}" id="cdc_file_name_temp" />
          <a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$cdetail.cdc_file_name}}?dummy={{$ran}}')" id="label_cdc_file_name_temp" target="_blank">{{$cdetail.cdc_file_name}}</a>
          <a href="javascript:remove_img();" id="crossimg"><img src="{{$BASE_URL}}css/default/images/notdone-task.gif" id="crossimg" /></a> {{/if}} </td>
      </tr>
      <tr>
        <td colspan="2">
          <table width="991" cellpadding="0" cellspacing="0" style="border:none; font-size:12px;">
<!--            <tr>
              <td width="178"><strong>Upload To Dossier:</strong>
                <input type="checkbox" {{if $doc_data.doc_upload_to_dossier == 1}} checked="checked" {{/if}} name="doc[doc_upload_to_dossier]" value="1" /></td>
              <td width="246">&nbsp;</td>
              <td width="23" style="padding-left:15px;"></td>
              <td width="195"><strong>Document Not Available:</strong>
                <input type="checkbox" {{if $doc_data.doc_not_avail == 1}} checked="checked" {{/if}} name="doc[doc_not_avail]" value="1" /></td>
              <td width="347">&nbsp;</td>
            </tr>-->
            <tr>
              <td><strong>Date Uploaded:</strong></td>
              <td>{{$doc_data.doc_date_uploaded}}</td>
              <td style="padding-left:15px;"></td>
              <td><strong>Loaded By:</strong></td>
              <td>{{$doc_data.user_name}}</td>
            </tr>
          </table></td>
      </tr>
<!--      <tr>
        <td><strong>Note:</strong></td>
        <td><textarea cols="50" rows="5" name="doc[doc_msg]">{{$doc_data.doc_msg}}</textarea></td>
      </tr>-->
      <tr>
        <td colspan="2" style="text-align:center;"><input type="submit"  value="Save" name="submit_iframe_mini_doc" style="cursor:pointer;" />
          <input type="button"  value="Cancel" onclick="parent.hideiFrame('adddoc_checkListIframeMini');" style="cursor:pointer;" />
        </td>
      </tr>
    </table>
  </form>
</div>
<!--------------- End iframe_data_mini_adddoc ------->
<!-- End Create Document Checklist section -->
{{/if}}





{{if !empty($showcDocumentsIframe) AND $showcDocumentsIframe == 1}}
<link rel="stylesheet" href="{{$BASE_URL}}css/default/cis-styles.css" />
<!-------- Show Document iframe ------>
<div id="checkListIframe" >
  <form action="" method="post" enctype="multipart/form-data">
    <input type="hidden" value="{{if $bus_id}}{{$bus_id}}{{else}}{{$detail.bpd_bsi_id}}{{/if}}" name="data[bpd_bsi_id]" />
    <input type="hidden" value="{{$detail.bpd_id}}" name="data[bpd_id]" />
    {{if !empty($inrenaldocuments)}}
    <input type="hidden" value="1" name="data[bpd_doc_inner]" />
    {{/if}}
    <table cellpadding="0" cellspacing="0" class="table" style="border:1px solid #CCCCCC; padding:10px; width:100%; text-align:left;" >
      	<tr>
  	    <th width="150">Load Document Check List: </th>
        <td>
            <select name="cdata">
                <option value="0"> Show All </option>
                {{foreach from=$custom_dcl item=item key=key}}
                <option value="{{$key}}" {{if $key == $cdata }} selected="selected" {{/if}}>{{$item}} </option>
                {{/foreach}}
            </select>
            
         </td>
         <td>
         <input type="submit" value="Load" name="subDocument" />
         </td>
         </tr>
    
    </table>
  </form>
</div>
{{/if}} 

{{if !empty($cprint_data)}}
<form name="disena" method="post" action="">
<link rel="stylesheet" href="{{$BASE_URL}}css/default/cis-styles.css" />
<span> {{$type}} </span>
<table cellpadding="0" cellspacing="0" width="100%" id="customDocumenttable" >
  <tr>
    <th width="7%">Action</th>
    <th width="32%">Document Name</th>
   <!-- <th width="14%">Document Type</th>-->
    <th width="15%">File Name</th>
    <th width="10%">Date Uploaded</th>
    <th width="7%">User Name</th>
    <th width="9%">Upload To Dossier</th>
    <th width="10%">Doc Not Avail.</th>
    <th width="6%">Manual</th>
  </tr>
  {{foreach from=$cprint_data item=item key=key}}
   {{if $item.doc_disable eq 1 }}	
    <tr style="background:red; color:#000;">
   {{else}}
   <tr>
   {{/if}} 
    <td><a href="javascript:parent.RequestcheckListIframe('cchecklist','{{$item.doc_id}}','','');" >
    <img style="height: 20px; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>
 
    <a href="javascript:parent.RequestcheckListIframe('dedocuments','{{$item.doc_id}}','{{$item.cdata}}','');" >{{if $item.doc_disable eq -1 }}Disable{{else}}Enable{{/if}} </a>
    </td>
    <td style="padding-left:5px;">{{$item.admin_doc_manual}}{{if $item.doc_file_name !== '' && $item.admin_doc_id == 12}} CONTRACT SIGNED {{else}}{{$item.admin_cdoc_name}}{{/if}}</td>
   <!-- <td>{{$item.admin_cdoc_type}} </td>-->
    <td style="text-align:left;"><a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name}}?dummy={{$ran}}')" class="action_checklist" title="{{$item.doc_file_name}}">{{$item.doc_file_name|truncate:"40"}}</a></td>
    <td style="text-align:center;">{{if $item.doc_date_uploaded}}{{$item.doc_date_uploaded|date_format:"%d/%m/%y"}}{{/if}}</td>
    <td style="text-align:center;">{{$item.user_name}}</td>
    <td style="text-align:center;"><input type="checkbox" {{if $item.doc_upload_to_dossier == 1}} checked="checked"{{/if}} disabled="disabled" /></td>
    <td style="text-align:center;"><input type="checkbox" {{if $item.doc_not_avail == 1}} checked="checked"{{/if}} disabled="disabled" /></td>
    <td style="text-align:center;">{{if !empty($item.admin_doc_manual)}}<a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.admin_doc_manual}}?dummy={{$ran}}" rel="nofollow">View</a>{{/if}}</td>
  </tr>
  
    <script type="text/javascript">
  	$('tr').each(function(){
           $('tr').css("background","yellow");   
        });
    </script>
  
  {{/foreach}}
</table>
{{/if}}


{{if $iframe_close == 1}}
<script>
	parent.hideiFrame('cdocumentsIframe1');
</script>
{{/if}}

{{if $iframe_cdata == 1}}

<!--------------- Begin iframe_data ------->
<link rel="stylesheet" href="{{$BASE_URL}}css/default/cis-styles.css" />
<div style="border:1px #CCCCCC solid; padding:5px;" id="checkListIframe">
  <script>
 	parent.RequestcheckListIframe('cdocuments','','divbusinesspadocInfoToReturn','');
		
function remove_img()
	{
		document.getElementById('doc_file_name_temp').value = '';
		document.getElementById('label_doc_file_name_temp').style.visibility = 'hidden';
		document.getElementById('crossimg').style.visibility = 'hidden';
	}
</script>
  <form action="" method="post" enctype="multipart/form-data" name="iframe-form">
    <input type="hidden" name="doc[doc_id]" value="{{$doc_data.doc_id}}" />
    <table cellpadding="0" cellspacing="0" class="table"  >
      <tr>
        <td><strong>Document Name:</strong></td>
        <td style="background-color:#E0E6FF;padding:5px; font-size:12px; font-weight:bold;">{{$doc_data.admin_cdoc_name}}</td>
      </tr>
      <tr>
        <td><strong>File Name:</strong></td>
        <td>{{$doc_data.doc_file_name}}</td>
      </tr>
      <tr>
        <td><strong>Load File:</strong></td>
        <td><input type="file" name="image" id="doc_file_name_mini" />
          {{if !empty($doc_data.doc_file_name)}}
          <input type="hidden" name="doc[doc_file_name_temp]" value="{{$doc_data.doc_file_name}}" id="doc_file_name_temp" />
          <a href="javascript:parent.modelviewimages('https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$doc_data.doc_file_name}}?dummy={{$ran}}')" id="label_doc_file_name_temp" target="_blank">{{$doc_data.doc_file_name}}</a> <a href="javascript:remove_img();" id="crossimg"><img src="{{$BASE_URL}}css/default/images/notdone-task.gif" id="crossimg" /></a> {{/if}} </td>
      </tr>
      <tr>
        <td colspan="2">
          <table width="991" cellpadding="0" cellspacing="0" style="border:none;">
            <tr>
              <td width="178"><strong>Upload To Dossier:</strong>
                <input type="checkbox" {{if $doc_data.doc_upload_to_dossier == 1}} checked="checked" {{/if}} name="doc[doc_upload_to_dossier]" value="1" /></td>
              <td width="246">&nbsp;</td>
              <td width="23" style="padding-left:15px;"></td>
              <td width="195"><strong>Document Not Available:</strong>
                <input type="checkbox" {{if $doc_data.doc_not_avail == 1}} checked="checked" {{/if}} name="doc[doc_not_avail]" value="1" /></td>
              <td width="347">&nbsp;</td>
            </tr>
            <tr>
              <td><strong>Date Uploaded:</strong></td>
              <td>{{$doc_data.doc_date_uploaded}}</td>
              <td style="padding-left:15px;"></td>
              <td><strong>Loaded By:</strong></td>
              <td>{{$doc_data.user_name}}</td>
            </tr>
          </table></td>
      </tr>
      <tr>
        <td><strong>Note:</strong></td>
        <td><textarea cols="50" rows="5" name="doc[doc_msg]">{{$doc_data.doc_msg}}</textarea></td>
      </tr>
      <tr>
        <td colspan="2" style="text-align:center;"><input type="submit"  value="Save" name="submit_iframe" style="cursor:pointer;" />
          <input type="button"  value="Cancel" onclick="parent.hideiFrame('cdocumentsIframe1');" style="cursor:pointer;" />
        </td>
      </tr>
    </table>
  </form>
</div>
<!--------------- End iframe_data ------->
<!-- End Create Document Checklist section -->
{{/if}}


{{if !empty($showpaNotesIframe) AND $showpaNotesIframe == 1}}
<link rel="stylesheet" href="{{$BASE_URL}}css/default/cis-styles.css" />
<!-------- Show Document iframe ------>
<div id="checkListIframe" >
  <form action="" method="post" enctype="multipart/form-data">
    <input type="hidden" value="{{if $bus_id}}{{$bus_id}}{{else}}{{$detail.bpn_bsi_id}}{{/if}}" name="data[bpn_bsi_id]" />
    <input type="hidden" value="{{$detail.bpn_id}}" name="data[bpn_id]" />
    <table cellpadding="0" cellspacing="0" class="table" style="border:1px solid #CCCCCC; padding:10px; width:100%; text-align:left;" >
     <tr><th>Type:</th>
		<td colspan="3">
            <select name="data[bpn_type]" style="width:200px;">
                {{foreach from=$type key="id" item="oprname"}}
                <option value="{{$id}}" {{if $id == $detail.bpn_type}} selected="selected" {{/if}}>{{$oprname}}</option>
                {{/foreach}}
            </select>
<br /></td></tr>
<tr><th>Notes:</th><td><textarea cols="100" rows="5" name="data[bpn_notes]">{{$detail.bpn_notes}}</textarea></td></tr>
      
      <tr>
        <th> <input type="submit" value="Save" name="subDocument" />
        </th>
        <td><input type="button" value="cancel" onclick="parent.hideiFrame('panotesIframe','');" />
        </td>
      </tr>
    </table>
  </form>
</div>
{{/if}} 
{{if !empty($notes_success_msg)}}
<script>
	parent.hideiFrame('panotesIframe','{{$notes_success_msg}}');
	parent.iframeRequest(5,'');
</script>
{{/if}}
{{if !empty($iframe_msg)}}
<script>
	parent.hideiFrame('checkListIframe','');
	parent.requestDocumentCheckList();
</script>
{{/if}}
{{if !empty($iframe_msg_mini)}}
<script>
	parent.hideiFrame('checkListIframeMini','');
	parent.requestDocumentCheckListMini();
</script>
{{/if}}



{{if !empty($showpaDocumentsIframe) AND $showpaDocumentsIframe == 1}}
<link rel="stylesheet" href="{{$BASE_URL}}css/default/cis-styles.css" />
<!-------- Show Document iframe ------>
<div id="checkListIframe" >
  <form action="" method="post" enctype="multipart/form-data">
    <input type="hidden" value="{{if $bus_id}}{{$bus_id}}{{else}}{{$detail.bpd_bsi_id}}{{/if}}" name="data[bpd_bsi_id]" />
    <input type="hidden" value="{{$detail.bpd_id}}" name="data[bpd_id]" />
    {{if !empty($inrenaldocuments)}}
    <input type="hidden" value="1" name="data[bpd_doc_inner]" />
    {{/if}}
    <table cellpadding="0" cellspacing="0" class="table" style="border:1px solid #CCCCCC; padding:10px; width:100%; text-align:left;" >
      <tr>
        <th width="100"> Document Name: </th>
        <td><input type="text" name="data[bpd_type]" value="{{$detail.bpd_type}}" style="width:550px;" />
        </td>
      </tr>
      <tr>
        <th>File Name: </th>
     <td>{{if !empty($detail.bpd_doc_name)}} <a href="https://deckquote.s3.amazonaws.com/files/business_documents/{{$detail.bpd_doc_name}}?dummy={{$ran}}" target="_blank">{{$detail.bpd_doc_name}}</a>
     <input type="hidden" value="{{$detail.bpd_doc_name}}" name="data[bpd_doc_name]" />
       {{else}}Document must be saved before being displayed.{{/if}}</td>
      </tr>
      <tr>
        <th> Load File: </th>
        <td><input type="file"  name="document" />
          <div style="color:#FF0000;">{{$file_exist}}</div></td>
      </tr>
      <tr>
        <th> Notes: </th>
        <td><textarea cols="102" rows="5" name="data[bpd_comment]">{{$detail.bpd_comment}}</textarea>
        </td>
      </tr>
      <tr>
        <th> <input type="submit" value="Save" name="subDocument" />
        </th>
        <td><input type="button" value="cancel" onclick="parent.hideiFrame('padocumentsIframe','');" />
        </td>
      </tr>
    </table>
  </form>
</div>
{{/if}} 
{{if !empty($padocs_success_msg)}}
	<script>
            parent.hideiFrame('padocumentsIframe','{{$success_msg}}');
            parent.iframeRequest(4,'');
    </script>
{{/if}}

{{if !empty($showDocumentsIframe) AND $showDocumentsIframe == 1}}
<link rel="stylesheet" href="{{$BASE_URL}}css/default/cis-styles.css" />
<!-------- Show Document iframe ------>
<div id="checkListIframe" >
  <form action="" method="post" enctype="multipart/form-data">
    <input type="hidden" value="{{if $bus_id}}{{$bus_id}}{{else}}{{$detail.bd_bsi_id}}{{/if}}" name="data[bd_bsi_id]" />
    <input type="hidden" value="{{$detail.bd_id}}" name="data[bd_id]" />
    {{if !empty($inrenaldocuments)}}
    <input type="hidden" value="1" name="data[bd_doc_inner]" />
    {{/if}}
    <table cellpadding="0" cellspacing="0" class="table" style="border:1px solid #CCCCCC; padding:10px; width:100%; text-align:left;" >
      <tr>
        <th width="100"> Document Name: </th>
        <td><input type="text" name="data[bd_type]" value="{{$detail.bd_type}}" style="width:550px;" />
        </td>
      </tr>
      <tr>
        <th> Type Status: </th>
        <td><select name="data[bd_status]" >
        	{{foreach from=$docstatus key="stid" item="statuses"}}
        	  <option value="{{$stid}}" {{if $detail.bd_status == $stid }} selected="selected" {{/if}}>{{$statuses}}</option>
        	{{/foreach}}
          </select>
        </td>
      </tr>
      <tr>
        <th> File Name: </th>
        <td> {{if !empty($detail.bd_doc_name)}} <a href="https://deckquote.s3.amazonaws.com/files/business_documents/{{$detail.bd_doc_name}}?dummy={{$ran}}" target="_blank">{{$detail.bd_doc_name}}</a>
          <input type="hidden" value="{{$detail.bd_doc_name}}" name="data[bd_doc_name]" />
          {{else}}Document must be saved before being displayed.{{/if}}</td>
      </tr>
      <tr>
        <th> Load File: </th>
        <td><input type="file"  name="document" />
          <div style="color:#FF0000;">{{$file_exist}}</div></td>
      </tr>
      <tr>
        <th> Notes: </th>
        <td><textarea cols="102" rows="5" name="data[bd_comment]">{{$detail.bd_comment}}</textarea>
        </td>
      </tr>
      <tr>
        <th> <input type="submit" value="Save" name="subDocument" />
        </th>
        <td><input type="button" value="cancel" onclick="parent.hideiFrame('adddocumentsIframe','');" />
        </td>
      </tr>
    </table>
  </form>
</div>

{{/if}} 


{{if !empty($showspIframe) AND $showspIframe == 1}}
<link rel="stylesheet" href="{{$BASE_URL}}css/default/cis-styles.css" />
<!-------- Show Document iframe ------>
<div id="checkListIframe" >
  <form action="" method="post" enctype="multipart/form-data">
    <input type="hidden" value="{{if $bus_id}}{{$bus_id}}{{else}}{{$detail.sp_bsn_id}}{{/if}}" name="data[sp_bsn_id]" />
    <input type="hidden" value="{{$detail.sp_id}}" name="data[sp_id]" />
  
    <table cellpadding="0" cellspacing="0" class="table" style="border:1px solid #CCCCCC; padding:10px; width:100%; text-align:left;" >
      <tr>
        <th width="100"> Document Name: </th>
        <td><input type="text" name="data[sp_doc_name]" value="{{$detail.sp_doc_name}}" style="width:550px;" />
        </td>
      </tr>
      <tr>
        <th>Status: </th>
        <td><select name="data[sp_status]" >
        	  <option value="Signed"   {{if $detail.sp_status  == 'Signed' }} selected="selected" {{/if}}>Signed</option>
              <option value="UnSigned" {{if $detail.sp_status  == 'UnSigned' }} selected="selected" {{/if}}>UnSigned</option>
          </select>
        </td>
      </tr>
      <tr>
        
      <tr>
        <th> Upload Word File: </th>
        <td><input type="file"  name="spword" />
          <div style="color:#FF0000;">{{$file_exist}}</div></td>
      </tr>
      <tr>
        <th> Upload PDF File: </th>
        <td><input type="file"  name="sppdf" />
          <div style="color:#FF0000;">{{$file_exist}}</div></td>
      </tr>
      
     
      <tr>
        <th> <input type="submit" value="Save" name="spDocument" />
        </th>
        <td><input type="button" value="cancel" onclick="parent.hideiFrame('addspIframe','');" />
        </td>
      </tr>
    </table>
  </form>
</div>

{{/if}} 



{{if !empty($showvariationsIframe) AND $showvariationsIframe == 1}}
<link rel="stylesheet" href="{{$BASE_URL}}css/default/cis-styles.css" />
<!-------- Show Document iframe ------>
<div id="checkListIframe" >
  <form action="" method="post" enctype="multipart/form-data">
    <input type="hidden" value="{{if $bus_id}}{{$bus_id}}{{else}}{{$detail.va_bsn_id}}{{/if}}" name="data[va_bsn_id]" />
    <input type="hidden" value="{{$detail.va_id}}" name="data[va_id]" />
  
    <table cellpadding="0" cellspacing="0" class="table" style="border:1px solid #CCCCCC; padding:10px; width:100%; text-align:left;" >
      <tr>
        <th width="100"> Document Name: </th>
        <td><input type="text" name="data[va_doc_name]" value="{{$detail.va_doc_name}}" style="width:550px;" />
        </td>
      </tr>
      <tr>
        <th>Status: </th>
        <td><select name="data[va_status]" >
        	   <option value="Signed"   {{if $detail.va_status  == 'Signed' }} selected="selected" {{/if}}>Signed</option>
               <option value="Draft" {{if $detail.va_status  == 'Draft' }} selected="selected" {{/if}}>Draft</option>
               <option value="Sent"  {{if $detail.va_status  == 'Sent' }} selected="selected" {{/if}}>Sent</option>
               <option value="Work Scheduled"  {{if $detail.va_status  == 'Work Scheduled' }} selected="selected" {{/if}}>Work Scheduled</option>
               <option value="Work Completed"  {{if $detail.va_status  == 'Work Completed' }} selected="selected" {{/if}}>Work Completed</option>
               <option value="Rejected"  {{if $detail.va_status  == 'Rejected' }} selected="selected" {{/if}}>Rejected</option>
              
          </select>
        </td>
      </tr>
      <tr>
        
      <tr>
        <th> Upload Word File: </th>
        <td><input type="file"  name="vaword" />
          <div style="color:#FF0000;">{{$file_exist}}</div></td>
      </tr>
     
      <tr>
        <th> Upload PDF File: </th>
        <td><input type="file"  name="vapdf" />
          <div style="color:#FF0000;">{{$file_exist}}</div></td>
      </tr>
      
      <tr>
        <th> Upload Signed PDF File: </th>
        <td><input type="file"  name="vasigned" />
          <div style="color:#FF0000;">{{$file_exist}}</div></td>
      </tr>
     
      <tr>
        <th> <input type="submit" value="Save" name="spDocument" />
        </th>
        <td><input type="button" value="cancel" onclick="parent.hideiFrame('addvariationsIframe','');" />
        </td>
      </tr>
    </table>
  </form>
</div>

{{/if}} 





{{if !empty($documents_data_show)}}
{{$divid}}||

<table cellpadding="0" cellspacing="0" width="100%">
{{if $documents_data}}
  <tr>
    <th width="10%">Action</th>
    <th width="30%">Document Name</th>
    <th width="20%">File Name</th>
    <th width="10%">Date Uploaded</th>
    <th width="10%">User Name</th>
    <th width="10%">Status</th>
    <th width="10%">Comments</th>
  </tr>

  {{foreach from=$documents_data item=item key=key}}
  <tr>
    <td> {{if empty($inrenaldocuments)}}<a href="javascript:RequestcheckListIframe('adddocuments','{{$item.bd_id}}','{{$divid}}','');" >{{else}} <a href="javascript:RequestcheckListIframe('intdocuments','{{$item.bd_id}}','{{$divid}}','');" >{{/if}} <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a> &nbsp;
      {{if $USER_GROUP == 'Administrators'}}
      {{if empty($inrenaldocuments)}} <a href="javascript:requestDeleteDocument('{{$item.bd_id}}','1');" >{{else}} <a href="javascript:requestDeleteDocument('{{$item.bd_id}}','3');" >{{/if}} <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>{{/if}} </td>
    <td style="text-align:left;">{{if $item.bd_type!='0' AND $item.bd_type!=''}}{{$item.bd_type}}{{/if}}</td>
    <td style="text-align:center;"><a href="https://deckquote.s3.amazonaws.com/files/business_documents/{{$item.bd_doc_name}}?dummy={{$ran}}" title="{{$item.bd_doc_name}}" class="action_small" target="_blank">{{$item.bd_doc_name|truncate:"30"}}</a></td>
    <td style="text-align:center;">{{$item.bd_uploaded_date}}</td>
    <td style="text-align:left;">{{$item.user_name}}</td>
     <td style="text-align:center;">{{foreach from=$docstatus key="key2" item="item2"}}{{if $item.bd_status == $key2}}{{$item2}}{{/if}}{{/foreach}}</td>
    <td style="text-align:left;">{{$item.bd_comment}}</td>
  </tr>
  {{/foreach}}
</table>

{{if $last > 1}}
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center" style="border:none;">
  <tr> {{if $last}}
    <td align="center"><div class='pagination'> {{if $pagenum == 1}} <span class='disabled'>&laquo; previous</span> {{else}} <a class="pagination" href="javascript:javascript:iframeRequest(1,{{math equation="x - y" x=$pagenum y=1}})" title="Previous">&laquo; previous</a> {{/if}}
        
        {{if $pagenum != 1}} <span class="paginate"><a class="pagination"  href="javascript:iframeRequest(1,1)" title="{{$page_num}} Page">1</a></span> {{else}}<span class='current'>1</span> {{/if}}{{if $pagenum != 2}} <span class="paginate"><a class="pagination"  href="javascript:iframeRequest(1,2)" title="{{$page_num}} Page">2</a></span> {{else}}<span class='current'>2</span> {{/if}}
        {{if $paginateprev.0 > 3}}
        ...
        {{/if}}
        {{foreach from=$paginateprev key="page_key" item="page_num"}}
        {{if $page_num == $pagenum OR $page_num <= 2}}
        {{elseif $page_num == $lastone}}
        
        {{else}} <span class="paginate"><a class="pagination"  href="javascript:iframeRequest(1,{{$page_num}})" title="{{$page_num}} Page">{{$page_num}}</a></span> {{/if}}
        {{/foreach}}
        
        {{foreach from=$paginatenext key="page_key" item="page_num2"}}
        {{if $page_num2 < $last AND $page_num2 != $lastone}}
        {{if $page_num2 == 1}}
        {{elseif $page_num2 == 2}}
        {{else}}
        {{if $page_num2 == $pagenum OR $page_num2 <= 0}} <span class='current'> {{$page_num2}}</span> {{else}} <a class="pagination"  href="javascript:iframeRequest(1,{{$page_num2}})" title="{{$page_num2}} Page">{{$page_num2}}</a> {{/if}}
        {{/if}}     
        {{/if}}
        {{/foreach}}
        {{if $page_num2 < $lasttow}}
        ...
        {{/if}}
        {{if $lastone == 1}}
        {{elseif $lastone == 2}}
        {{else}}
        {{if $pagenum == $lastone }} <span class='current'>{{$lastone}}</span> {{else}} <a class="pagination"  href="javascript:iframeRequest(1,{{$lastone}})" title="{{$lastone}} Page">{{$lastone}}</a> {{/if}}
        {{/if}}
        {{if $last == 1}}
        {{elseif $last == 2}}
        {{else}}
        {{if $pagenum == $last}} <span class='current'>{{$last}}</span> {{else}} <a class="pagination"  href="javascript:iframeRequest(1,{{$last}})" title="{{$last}} Page">{{$last}}</a> {{/if}}
        {{/if}}
        {{if $pagenum == $last}} <span class='disabled'>next &raquo;</span> {{else}} <a class="pagination" href="javascript:iframeRequest(1,{{math equation="x + y" x=$pagenum y=1}})" title="Next">next &raquo;</a></div>
      {{/if}} </td>
    {{else}}
    <td align="center" height="300">Record Not found... </td>
    {{/if}} </tr>
</table>
{{/if}}

{{/if}}
{{/if}}


{{if !empty($special_data_show)}}
{{$divid}}||

<table cellpadding="0" cellspacing="0" width="100%" id="divtruelog">
{{if $special_data}}
  <tr>
    <th width="6%">Action</th>
    <th width="20%">Document Name</th>
    <th width="10%">When Uploaded</th>
    <th width="14%">Who Uploaded</th>
    <th width="15%">Word Doc</th>
    <th width="15%">PDF Doc</th>
    <th width="10%">Status</th>
  </tr>

  {{foreach from=$special_data item=item key=key}}
  <tr>
    <td> <a href="javascript:RequestcheckListIframe('addspecialcondition','{{$item.sp_id}}','{{$divid}}','');" ><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a> &nbsp;
     
       <a href="javascript:requestDeleteDocument('{{$item.sp_id}}','7');" > <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a> </td>
      
    <td style="text-align:left;">{{$item.sp_doc_name}}</td>
    <td style="text-align:left;">{{$item.sp_date}}</td>
    <td style="text-align:left;">{{$item.sp_who}}</td>
    <td style="text-align:center;"><a href="https://deckquote.s3.amazonaws.com/files/special_conditions_doc/{{$item.sp_word}}?dummy={{$ran}}" title="{{$item.sp_word}}" class="action_small" target="_blank">{{$item.sp_word|truncate:"30"}}</a></td>
    
     <td style="text-align:center;"><a href="https://deckquote.s3.amazonaws.com/files/special_conditions_doc/{{$item.sp_pdf}}?dummy={{$ran}}" title="{{$item.sp_pdf}}" class="action_small" target="_blank">{{$item.sp_pdf|truncate:"30"}}</a></td>
    <td style="text-align:center;">
    <select name="data[sp_status]" onchange="parent.update_sp_status({{$item.sp_id}}, this.value)" >
        	  <option value="Signed"   {{if $item.sp_status  == 'Signed' }} selected="selected" {{/if}}>Signed</option>
              <option value="UnSigned" {{if $item.sp_status  == 'UnSigned' }} selected="selected" {{/if}}>UnSigned</option>
          </select>
    
    </td>
     
  </tr>
  {{/foreach}}
</table>

{{if $last > 1}}
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center" style="border:none;">
  <tr> {{if $last}}
    <td align="center"><div class='pagination'> {{if $pagenum == 1}} <span class='disabled'>&laquo; previous</span> {{else}} <a class="pagination" href="javascript:javascript:iframeRequest(7,{{math equation="x - y" x=$pagenum y=1}})" title="Previous">&laquo; previous</a> {{/if}}
        
        {{if $pagenum != 1}} <span class="paginate"><a class="pagination"  href="javascript:iframeRequest(7,1)" title="{{$page_num}} Page">1</a></span> {{else}}<span class='current'>1</span> {{/if}}{{if $pagenum != 2}} <span class="paginate"><a class="pagination"  href="javascript:iframeRequest(7,2)" title="{{$page_num}} Page">2</a></span> {{else}}<span class='current'>2</span> {{/if}}
        {{if $paginateprev.0 > 3}}
        ...
        {{/if}}
        {{foreach from=$paginateprev key="page_key" item="page_num"}}
        {{if $page_num == $pagenum OR $page_num <= 2}}
        {{elseif $page_num == $lastone}}
        
        {{else}} <span class="paginate"><a class="pagination"  href="javascript:iframeRequest(7,{{$page_num}})" title="{{$page_num}} Page">{{$page_num}}</a></span> {{/if}}
        {{/foreach}}
        
        {{foreach from=$paginatenext key="page_key" item="page_num2"}}
        {{if $page_num2 < $last AND $page_num2 != $lastone}}
        {{if $page_num2 == 1}}
        {{elseif $page_num2 == 2}}
        {{else}}
        {{if $page_num2 == $pagenum OR $page_num2 <= 0}} <span class='current'> {{$page_num2}}</span> {{else}} <a class="pagination"  href="javascript:iframeRequest(7,{{$page_num2}})" title="{{$page_num2}} Page">{{$page_num2}}</a> {{/if}}
        {{/if}}     
        {{/if}}
        {{/foreach}}
        {{if $page_num2 < $lasttow}}
        ...
        {{/if}}
        {{if $lastone == 1}}
        {{elseif $lastone == 2}}
        {{else}}
        {{if $pagenum == $lastone }} <span class='current'>{{$lastone}}</span> {{else}} <a class="pagination"  href="javascript:iframeRequest(7,{{$lastone}})" title="{{$lastone}} Page">{{$lastone}}</a> {{/if}}
        {{/if}}
        {{if $last == 1}}
        {{elseif $last == 2}}
        {{else}}
        {{if $pagenum == $last}} <span class='current'>{{$last}}</span> {{else}} <a class="pagination"  href="javascript:iframeRequest(7,{{$last}})" title="{{$last}} Page">{{$last}}</a> {{/if}}
        {{/if}}
        {{if $pagenum == $last}} <span class='disabled'>next &raquo;</span> {{else}} <a class="pagination" href="javascript:iframeRequest(7,{{math equation="x + y" x=$pagenum y=1}})" title="Next">next &raquo;</a></div>
      {{/if}} </td>
    {{else}}
    <td align="center" height="300">Record Not found... </td>
    {{/if}} </tr>
</table>
{{/if}}

{{/if}}
{{/if}}



{{if !empty($variations_data_show)}}
{{$divid}}||

<table cellpadding="0" cellspacing="0" width="100%" id="divtruelog">
{{if $variations_data}}
  <tr>
    <th width="6%">Action</th>
    <th width="5%">Variation ID</th>
    <th width="15%">Document Name</th>
    <th width="10%">When Uploaded</th>
    <th width="14%">Who Uploaded</th>
    <th width="15%">Word Doc</th>
    <th width="15%">PDF Doc</th>
    <th width="15%">Signed PDF</th>
    <th width="8%">Signed Date</th>
    <th width="8%">Status</th>
  </tr>

  {{foreach from=$variations_data item=item key=key}}
  <tr>
    <td> <a href="javascript:RequestcheckListIframe('addvariations','{{$item.va_id}}','{{$divid}}','');" ><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;
     
       <a href="javascript:requestDeleteDocument('{{$item.va_id}}','8');" > <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a> </td>
    <td>{{$item.va_id}}</td>  
    <td style="text-align:left;">{{$item.va_doc_name}}</td>
    <td style="text-align:left;">{{$item.va_date}}</td>
    <td style="text-align:left;">{{$item.va_who}}</td>
    <td style="text-align:center;"><a href="https://deckquote.s3.amazonaws.com/files/variations_doc/{{$item.va_word}}?dummy={{$ran}}" title="{{$item.va_word}}" class="action_small" target="_blank">{{$item.va_word|truncate:"30"}}</a></td>
    
     <td style="text-align:center;"><a href="https://deckquote.s3.amazonaws.com/files/variations_doc/{{$item.va_pdf}}?dummy={{$ran}}" title="{{$item.va_pdf}}" class="action_small" target="_blank">{{$item.va_pdf|truncate:"30"}}</a></td>
     
      <td style="text-align:center;"><a href="https://deckquote.s3.amazonaws.com/files/variations_doc/{{$item.va_signed}}?dummy={{$ran}}" title="{{$item.va_signed}}" class="action_small" target="_blank">{{$item.va_signed|truncate:"30"}}</a></td> 
    <td>{{$item.va_signed_date}}</td>  
    <td style="text-align:center;">
    
    <select name="data[va_status]" onchange="parent.update_va_status({{$item.va_id}}, this.value)" >
       <option value="Signed" {{if $item.va_status  == 'Signed'}} selected="selected" {{/if}}>Signed</option>
       <option value="Draft"  {{if $item.va_status  == 'Draft' }} selected="selected" {{/if}}>Draft</option>
       <option value="Sent"  {{if $item.va_status  == 'Sent' }} selected="selected" {{/if}}>Sent</option>
       <option value="Work Scheduled"  {{if $item.va_status  == 'Work Scheduled' }} selected="selected" {{/if}}>Work Scheduled</option>
       <option value="Work Completed"  {{if $item.va_status  == 'Work Completed' }} selected="selected" {{/if}}>Work Completed</option>
       <option value="Rejected"  {{if $item.va_status  == 'Rejected' }} selected="selected" {{/if}}>Rejected</option> 
    </select>
    
    </td>
     
  </tr>
  {{/foreach}}
</table>

{{if $last > 1}}
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center" style="border:none;">
  <tr> {{if $last}}
    <td align="center"><div class='pagination'> {{if $pagenum == 1}} <span class='disabled'>&laquo; previous</span> {{else}} <a class="pagination" href="javascript:javascript:iframeRequest(8,{{math equation="x - y" x=$pagenum y=1}})" title="Previous">&laquo; previous</a> {{/if}}
        
        {{if $pagenum != 1}} <span class="paginate"><a class="pagination"  href="javascript:iframeRequest(8,1)" title="{{$page_num}} Page">1</a></span> {{else}}<span class='current'>1</span> {{/if}}{{if $pagenum != 2}} <span class="paginate"><a class="pagination"  href="javascript:iframeRequest(8,2)" title="{{$page_num}} Page">2</a></span> {{else}}<span class='current'>2</span> {{/if}}
        {{if $paginateprev.0 > 3}}
        ...
        {{/if}}
        {{foreach from=$paginateprev key="page_key" item="page_num"}}
        {{if $page_num == $pagenum OR $page_num <= 2}}
        {{elseif $page_num == $lastone}}
        
        {{else}} <span class="paginate"><a class="pagination"  href="javascript:iframeRequest(8,{{$page_num}})" title="{{$page_num}} Page">{{$page_num}}</a></span> {{/if}}
        {{/foreach}}
        
        {{foreach from=$paginatenext key="page_key" item="page_num2"}}
        {{if $page_num2 < $last AND $page_num2 != $lastone}}
        {{if $page_num2 == 1}}
        {{elseif $page_num2 == 2}}
        {{else}}
        {{if $page_num2 == $pagenum OR $page_num2 <= 0}} <span class='current'> {{$page_num2}}</span> {{else}} <a class="pagination"  href="javascript:iframeRequest(8,{{$page_num2}})" title="{{$page_num2}} Page">{{$page_num2}}</a> {{/if}}
        {{/if}}     
        {{/if}}
        {{/foreach}}
        {{if $page_num2 < $lasttow}}
        ...
        {{/if}}
        {{if $lastone == 1}}
        {{elseif $lastone == 2}}
        {{else}}
        {{if $pagenum == $lastone }} <span class='current'>{{$lastone}}</span> {{else}} <a class="pagination"  href="javascript:iframeRequest(8,{{$lastone}})" title="{{$lastone}} Page">{{$lastone}}</a> {{/if}}
        {{/if}}
        {{if $last == 1}}
        {{elseif $last == 2}}
        {{else}}
        {{if $pagenum == $last}} <span class='current'>{{$last}}</span> {{else}} <a class="pagination"  href="javascript:iframeRequest(8,{{$last}})" title="{{$last}} Page">{{$last}}</a> {{/if}}
        {{/if}}
        {{if $pagenum == $last}} <span class='disabled'>next &raquo;</span> {{else}} <a class="pagination" href="javascript:iframeRequest(8,{{math equation="x + y" x=$pagenum y=1}})" title="Next">next &raquo;</a></div>
      {{/if}} </td>
    {{else}}
    <td align="center" height="300">Record Not found... </td>
    {{/if}} </tr>
</table>
{{/if}}

{{/if}}
{{/if}}


{{if !empty($success_msg_sp)}}
<script>
		parent.hideiFrame('addspIframe','{{$success_msg_sp}}');
		parent.iframeRequest(7,'');
</script>
{{/if}}

{{if !empty($success_msg_var)}}
<script>
		parent.hideiFrame('addvariationsIframe','{{$success_msg_var}}');
		parent.iframeRequest(8,'');
</script>
{{/if}}

{{if !empty($success_msg)}}
<script>
		parent.hideiFrame('adddocumentsIframe','{{$success_msg}}');
		parent.iframeRequest(1,'');
</script>


<script>
		parent.hideiFrame('intdocumentsIframe','{{$success_msg}}');
		parent.iframeRequest(3,'');
	</script>
    
{{/if}}
{{if !empty($showImagesIframe) AND $showImagesIframe == 1}}
<link rel="stylesheet" href="{{$BASE_URL}}css/default/cis-styles.css" />
<!-------- Show Document iframe ------>
<div id="checkListIframe" >
  <form action="" method="post" enctype="multipart/form-data">
    <input type="hidden" value="{{if $bus_id}}{{$bus_id}}{{else}}{{$detail.bf_bsn_id}}{{/if}}" name="data[bf_bsn_id]" />
    <input type="hidden" value="{{$detail.bf_id}}" name="data[bf_id]" />
    <table cellpadding="0" cellspacing="0" class="table" style="border:1px solid #CCCCCC; padding:5px;" width="99%" >
      <tr>
        <th width="100"> Image Name: </th>
        <td> {{if !empty($detail.bf_name)}} <a href="{{$BASE_URL}}{{$FILE_PATH}}files/business_images/{{$detail.bf_name}}?dummy={{$ran}}" target="_blank">{{$detail.bf_name}}</a>
          <input type="hidden" value="{{$detail.bf_name}}" name="data[bf_name]" />
          {{else}}Image must be saved before being displayed.{{/if}}</td>
      </tr>
      <tr>
        <th> Image Load: </th>
        <td><input type="file" name="images" />
          <div style="color:#FF0000;">{{$file_exist}}</div></td>
      </tr>
      <tr>
        <th> Image Role: </th>
        <td><select name="data[bf_role]" >
            <option value="0" {{if $detail.bf_role == 0 }} selected="selected" {{/if}}>Other Images</option>
            <option value="1" {{if $detail.bf_role == 1 }} selected="selected" {{/if}}>Main Image</option>
          </select>
        </td>
      </tr>
      <tr>
        <th> Comment: </th>
        <td><textarea cols="100" rows="3" name="data[bf_comments]" style="border: 1px solid #CCCCCC;">{{$detail.bf_comments}}</textarea>
        </td>
      </tr>
      <tr>
        <th> <input type="submit" value="Save" name="subImage" />
        </th>
        <td><input type="button" value="cancel" onclick="parent.hideiFrame('imagesIframe','');" />
        </td>
      </tr>
    </table>
  </form>
</div>

{{/if}} 

{{if !empty($show_images_data)}}
{{$divid}}||
{{if !empty($images_data)}}
<table cellpadding="0" cellspacing="0" width="100%" >
  <tr>
    <th>Action</th>
    <th>Image Name</th>
    <th>Role</th>
    <th>User</th>
    <th>Uploaded Date</th>
    <th>Width</th>
    <th>Height</th>
    <th>Comments</th>
  </tr>
  {{foreach from=$images_data item=item key=key}}
  <tr>
    <td><a href="javascript:RequestcheckListIframe('images','{{$item.bf_id}}','{{$divid}}','');" > <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a> &nbsp;&nbsp; 
      {{if $USER_GROUP == 'Administrators'}} <a href="javascript:requestDeleteDocument('{{$item.bf_id}}','2');" ><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a> {{/if}}</td>
    <td style="text-align:left;"><a onclick="javascript:parent.modelviewimages('{{$BASE_URL}}{{$FILE_PATH}}files/business_images/{{$item.bf_name}}');" style="text-decoration:underline; cursor:pointer;" >
    	<img src="{{$BASE_URL}}{{$FILE_PATH}}files/business_images/thumb_{{$item.bf_name}}" width="30"  /></a></td>
    <td style="text-align:center;">{{if $item.bf_role==0}}Other Images{{elseif $item.bf_role==1}}<strong>Main Image</strong>{{/if}}</td>
    <td style="text-align:left;">{{$item.customer_name|default:"Administrator"}}</td>
    <td style="text-align:center;">{{$item.bf_uploaded_date}}</td>
    <td style="text-align:center;">{{$item.bf_width}} px</td>
    <td style="text-align:center;">{{$item.bf_height}} px</td>
    <td style="text-align:left;">{{$item.bf_comments}}</td>
  </tr>
  {{/foreach}}
</table>
{{/if}}
<!-- Begin Pagination -->
{{if $last > 1}}
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center" style="border:none;">
  <tr> {{if $last}}
    <td align="center"><div class='pagination'> {{if $pagenum == 1}} <span class='disabled'>&laquo; previous</span> {{else}} <a class="pagination" href="javascript:javascript:iframeRequest(2,{{math equation="x - y" x=$pagenum y=1}})" title="Previous">&laquo; previous</a> {{/if}}
        
        {{if $pagenum != 1}} <span class="paginate"><a class="pagination"  href="javascript:iframeRequest(2,1)" title="{{$page_num}} Page">1</a></span> {{else}}<span class='current'>1</span> {{/if}}{{if $pagenum != 2}} <span class="paginate"><a class="pagination"  href="javascript:iframeRequest(2,2)" title="{{$page_num}} Page">2</a></span> {{else}}<span class='current'>2</span> {{/if}}
        {{if $paginateprev.0 > 3}}
        ...
        {{/if}}
        {{foreach from=$paginateprev key="page_key" item="page_num"}}
        {{if $page_num == $pagenum OR $page_num <= 2}}
        {{elseif $page_num == $lastone}}
        
        {{else}} <span class="paginate"><a class="pagination"  href="javascript:iframeRequest(2,{{$page_num}})" title="{{$page_num}} Page">{{$page_num}}</a></span> {{/if}}
        {{/foreach}}
        
        {{foreach from=$paginatenext key="page_key" item="page_num2"}}
        {{if $page_num2 < $last AND $page_num2 != $lastone}}
        {{if $page_num2 == 1}}
        {{elseif $page_num2 == 2}}
        {{else}}
        {{if $page_num2 == $pagenum OR $page_num2 <= 0}} <span class='current'> {{$page_num2}}</span> {{else}} <a class="pagination"  href="javascript:iframeRequest(2,{{$page_num2}})" title="{{$page_num2}} Page">{{$page_num2}}</a> {{/if}}
        {{/if}}     
        {{/if}}
        {{/foreach}}
        {{if $page_num2 < $lasttow}}
        ...
        {{/if}}
        {{if $lastone == 1}}
        {{elseif $lastone == 2}}
        {{else}}
        {{if $pagenum == $lastone }} <span class='current'>{{$lastone}}</span> {{else}} <a class="pagination"  href="javascript:iframeRequest(2,{{$lastone}})" title="{{$lastone}} Page">{{$lastone}}</a> {{/if}}
        {{/if}}
        {{if $last == 1}}
        {{elseif $last == 2}}
        {{else}}
        {{if $pagenum == $last}} <span class='current'>{{$last}}</span> {{else}} <a class="pagination"  href="javascript:iframeRequest(2,{{$last}})" title="{{$last}} Page">{{$last}}</a> {{/if}}
        {{/if}}
        {{if $pagenum == $last}} <span class='disabled'>next &raquo;</span> {{else}} <a class="pagination" href="javascript:iframeRequest(2,{{math equation="x + y" x=$pagenum y=1}})" title="Next">next &raquo;</a></div>
      {{/if}} </td>
    {{else}}
    <td align="center" height="300">Record Not found... </td>
    {{/if}} </tr>
</table>
{{/if}}
<!-- End Pagination -->
{{/if}}


{{if !empty($show_pnnotes_data)}}
{{$divid}}||

<table cellpadding="0" cellspacing="0" width="100%">
{{if $pnnotes_data}}
  <tr>
    <th width="10%">Action</th>
    <th width="20%">Type</th>
    <th width="20%">Date</th>
    <th width="20%" >User</th>
    <th>Notes</th>
  </tr>

  {{foreach from=$pnnotes_data item=item key=key}}
  <tr>
    <td><a href="javascript:RequestcheckListIframe('panotes','{{$item.bpn_id}}','{{$divid}}','');" ><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a> &nbsp;
      {{if $USER_GROUP == 'Administrators'}}<a href="javascript:requestDeleteDocument('{{$item.bpn_id}}','5');" ><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>{{/if}} </td>
   <td style="text-align:center;">{{foreach from=$type key="key2" item="item2"}}{{if $item.bpn_type == $key2}}{{$item2}}{{/if}}{{/foreach}}</td>
    <td style="text-align:center;">{{$item.bpn_uploaded_date}}</td>
    <td style="text-align:left;">{{$item.user_name}}</td>
    <td style="text-align:left;">{{$item.bpn_notes}}</td>
  </tr>
  {{/foreach}}
</table>

{{if $last > 1}}
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center" style="border:none;">
  <tr> {{if $last}}
    <td align="center"><div class='pagination'> {{if $pagenum == 1}} <span class='disabled'>&laquo; previous</span> {{else}} <a class="pagination" href="javascript:javascript:iframeRequest(1,{{math equation="x - y" x=$pagenum y=1}})" title="Previous">&laquo; previous</a> {{/if}}
        
        {{if $pagenum != 1}} <span class="paginate"><a class="pagination"  href="javascript:iframeRequest(1,1)" title="{{$page_num}} Page">1</a></span> {{else}}<span class='current'>1</span> {{/if}}{{if $pagenum != 2}} <span class="paginate"><a class="pagination"  href="javascript:iframeRequest(1,2)" title="{{$page_num}} Page">2</a></span> {{else}}<span class='current'>2</span> {{/if}}
        {{if $paginateprev.0 > 3}}
        ...
        {{/if}}
        {{foreach from=$paginateprev key="page_key" item="page_num"}}
        {{if $page_num == $pagenum OR $page_num <= 2}}
        {{elseif $page_num == $lastone}}
        
        {{else}} <span class="paginate"><a class="pagination"  href="javascript:iframeRequest(1,{{$page_num}})" title="{{$page_num}} Page">{{$page_num}}</a></span> {{/if}}
        {{/foreach}}
        
        {{foreach from=$paginatenext key="page_key" item="page_num2"}}
        {{if $page_num2 < $last AND $page_num2 != $lastone}}
        {{if $page_num2 == 1}}
        {{elseif $page_num2 == 2}}
        {{else}}
        {{if $page_num2 == $pagenum OR $page_num2 <= 0}} <span class='current'> {{$page_num2}}</span> {{else}} <a class="pagination"  href="javascript:iframeRequest(1,{{$page_num2}})" title="{{$page_num2}} Page">{{$page_num2}}</a> {{/if}}
        {{/if}}     
        {{/if}}
        {{/foreach}}
        {{if $page_num2 < $lasttow}}
        ...
        {{/if}}
        {{if $lastone == 1}}
        {{elseif $lastone == 2}}
        {{else}}
        {{if $pagenum == $lastone }} <span class='current'>{{$lastone}}</span> {{else}} <a class="pagination"  href="javascript:iframeRequest(1,{{$lastone}})" title="{{$lastone}} Page">{{$lastone}}</a> {{/if}}
        {{/if}}
        {{if $last == 1}}
        {{elseif $last == 2}}
        {{else}}
        {{if $pagenum == $last}} <span class='current'>{{$last}}</span> {{else}} <a class="pagination"  href="javascript:iframeRequest(1,{{$last}})" title="{{$last}} Page">{{$last}}</a> {{/if}}
        {{/if}}
        {{if $pagenum == $last}} <span class='disabled'>next &raquo;</span> {{else}} <a class="pagination" href="javascript:iframeRequest(1,{{math equation="x + y" x=$pagenum y=1}})" title="Next">next &raquo;</a></div>
      {{/if}} </td>
    {{else}}
    <td align="center" height="300">Record Not found... </td>
    {{/if}} </tr>
</table>
{{/if}}

{{/if}}
{{/if}}












{{if !empty($img_success_msg)}}
<!-- <div style="font-size:12px; font-weight:bold; color:#FF3300;">{{$success_msg}}</div> -->
<script>
		parent.hideiFrame('imagesIframe','{{$img_success_msg}}');
		parent.iframeRequest(2,'');
	</script>
{{/if}}



{{if !empty($show_pddocs_data)}}
{{$divid}}||
<table cellpadding="0" cellspacing="0" width="100%">
{{if $pddocs_data}}
  <tr>
    <th width="10%">Action</th>
    <th width="30%">Document Name</th>
    <th width="20%">File Name</th>
    <th width="10%">Date Uploaded</th>
    <th width="10%">User Name</th>
    <th width="10%">Comments</th>
  </tr>

  {{foreach from=$pddocs_data item=item key=key}}
  <tr>
    <td> <a href="javascript:RequestcheckListIframe('padocuments','{{$item.bpd_id}}','{{$divid}}','');" ><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a> &nbsp;
      {{if $USER_GROUP == 'Administrators'}}
      {{if empty($inrenaldocuments)}} <a href="javascript:requestDeleteDocument('{{$item.bpd_id}}','4');" >{{else}} <a href="javascript:requestDeleteDocument('{{$item.bpd_id}}','3');" >{{/if}} <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>{{/if}} </td>
    <td style="text-align:left;">{{if $item.bpd_type!='0' AND $item.bpd_type!=''}}{{$item.bpd_type}}{{/if}}</td>
    <td style="text-align:center;"><a href="https://deckquote.s3.amazonaws.com/files/business_documents/{{$item.bpd_doc_name}}?dummy={{$ran}}" title="{{$item.bpd_doc_name}}" class="action_small" target="_blank">{{$item.bpd_doc_name|truncate:"30"}}</a></td>
    <td style="text-align:center;">{{$item.bpd_uploaded_date|date_format:'%m-%d-%Y'}}</td>
    <td style="text-align:left;">{{$item.user_name}}</td>
    <td style="text-align:left;">{{$item.bpd_comment}}</td>
  </tr>
  {{/foreach}}
</table>

{{if $last > 1}}
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center" style="border:none;">
  <tr> {{if $last}}
    <td align="center"><div class='pagination'> {{if $pagenum == 1}} <span class='disabled'>&laquo; previous</span> {{else}} <a class="pagination" href="javascript:javascript:iframeRequest(4,{{math equation="x - y" x=$pagenum y=1}})" title="Previous">&laquo; previous</a> {{/if}}
        
        {{if $pagenum != 1}} <span class="paginate"><a class="pagination"  href="javascript:iframeRequest(4,1)" title="{{$page_num}} Page">1</a></span> {{else}}<span class='current'>1</span> {{/if}}{{if $pagenum != 2}} <span class="paginate"><a class="pagination"  href="javascript:iframeRequest(4,2)" title="{{$page_num}} Page">2</a></span> {{else}}<span class='current'>2</span> {{/if}}
        {{if $paginateprev.0 > 3}}
        ...
        {{/if}}
        {{foreach from=$paginateprev key="page_key" item="page_num"}}
        {{if $page_num == $pagenum OR $page_num <= 2}}
        {{elseif $page_num == $lastone}}
        
        {{else}} <span class="paginate"><a class="pagination"  href="javascript:iframeRequest(4,{{$page_num}})" title="{{$page_num}} Page">{{$page_num}}</a></span> {{/if}}
        {{/foreach}}
        
        {{foreach from=$paginatenext key="page_key" item="page_num2"}}
        {{if $page_num2 < $last AND $page_num2 != $lastone}}
        {{if $page_num2 == 1}}
        {{elseif $page_num2 == 2}}
        {{else}}
        {{if $page_num2 == $pagenum OR $page_num2 <= 0}} <span class='current'> {{$page_num2}}</span> {{else}} <a class="pagination"  href="javascript:iframeRequest(1,{{$page_num2}})" title="{{$page_num2}} Page">{{$page_num2}}</a> {{/if}}
        {{/if}}     
        {{/if}}
        {{/foreach}}
        {{if $page_num2 < $lasttow}}
        ...
        {{/if}}
        {{if $lastone == 1}}
        {{elseif $lastone == 2}}
        {{else}}
        {{if $pagenum == $lastone }} <span class='current'>{{$lastone}}</span> {{else}} <a class="pagination"  href="javascript:iframeRequest(4,{{$lastone}})" title="{{$lastone}} Page">{{$lastone}}</a> {{/if}}
        {{/if}}
        {{if $last == 1}}
        {{elseif $last == 2}}
        {{else}}
        {{if $pagenum == $last}} <span class='current'>{{$last}}</span> {{else}} <a class="pagination"  href="javascript:iframeRequest(4,{{$last}})" title="{{$last}} Page">{{$last}}</a> {{/if}}
        {{/if}}
        {{if $pagenum == $last}} <span class='disabled'>next &raquo;</span> {{else}} <a class="pagination" href="javascript:iframeRequest(4,{{math equation="x + y" x=$pagenum y=1}})" title="Next">next &raquo;</a></div>
      {{/if}} </td>
    {{else}}
    <td align="center" height="300">Record Not found... </td>
    {{/if}} </tr>
</table>
{{/if}}

{{/if}}
{{/if}}






{{if !empty($list)}}
<div id="divbusinesscustomreInfoToReturn">
  <table cellpadding="3" cellspacing="3" width="100%" id="list-table" >
    <tr bgcolor="#CCCCCC">
      <th width="15%">Action</th>
      <th width="25%">Partners</th>
      <th width="40%">Comments</th>
      <th width="12%">Email Saluation</th>
      <th width="8%">Notification</th>
    </tr>
    {{foreach from=$list key="key" item="item"}}
    <tr>
      <th><div>
      <a href="{{$BASE_URL}}js/vcard/index.php?fname={{$item.bcust_fname}}&lname={{$item.bcust_lname}}&email1={{$item.bcust_misc_email1}}&email2={{$item.bcust_misc_email2}}&mobile={{$item.bcust_misc_moble}}&business={{$item.bcust_misc_business}}&home={{$item.bcust_misc_home}}" class="action_new" title="Download Vcard"><img style="height: 17px; width:22px" src="{{$BASE_URL}}images/vcard.png"/></a>&nbsp;&nbsp;
      <a href="javascript:iframe2('seller','{{$BASE_URL}}{{$XFA.home}}/bs_id/{{$item.bs_id}}')" title="Edit"> <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;     
     {{if $USER_GROUP == 'Administrators'}} 
       <a href="javascript:requestsellerDelete({{$item.bs_id}})" onclick="javascript:if(!confirm('Are you sure want to delete the Seller?')) return false;" title="Delete"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>&nbsp;&nbsp;
     {{/if}}    
       <a href="javascript:parent.modelview('{{$item.bs_customers_id}}');" title="Quick View"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/view.png"/></a> </div></th>
      <td><a href="{{$BASE_URL}}customer.detail/bcust_id/{{$item.bs_customers_id}}" target="_blank">{{$item.bcust_fname}}&nbsp;{{$item.bcust_lname}}</a></td>
      <td>{{$item.bs_comments}}</td>
      <td>{{$item.bs_email_salutation}}</td>
      <td><input type="checkbox" readonly="readonly" {{if $item.bs_qanotification == 1}} checked="checked" {{/if}} /></td>
    </tr>
    {{/foreach}}
  </table>
</div>
{{if $last > 1}}
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> {{if $list}}
    <td align="center"><div class='pagination'> {{if $pagenum == 1}} <span class='disabled'>&laquo; previous</span> {{else}} <a class="pagination" href="javascript:requestsellerInfo({{math equation="x - y" x=$pagenum y=1}})" title="Previous">&laquo; previous</a> {{/if}}
        
        {{if $pagenum != 1}} <span class="paginate"><a class="pagination"  href="javascript:requestsellerInfo(1)" title="{{$page_num}} Page">1</a></span> {{else}}<span class='current'>1</span> {{/if}}{{if $pagenum != 2}} <span class="paginate"><a class="pagination"  href="javascript:requestsellerInfo(2)" title="{{$page_num}} Page">2</a></span> {{else}}<span class='current'>2</span> {{/if}}
        {{if $paginateprev.0 > 3}}
        ...
        {{/if}}
        {{foreach from=$paginateprev key="page_key" item="page_num"}}
        {{if $page_num == $pagenum OR $page_num <= 2}}
        {{elseif $page_num == $lastone}}
        
        {{else}} <span class="paginate"><a class="pagination"  href="javascript:requestsellerInfo({{$page_num}})" title="{{$page_num}} Page">{{$page_num}}</a></span> {{/if}}
        {{/foreach}}
        
        {{foreach from=$paginatenext key="page_key" item="page_num2"}}
        {{if $page_num2 < $last AND $page_num2 != $lastone}}
        {{if $page_num2 == 1}}
        {{elseif $page_num2 == 2}}
        {{else}}
        {{if $page_num2 == $pagenum OR $page_num2 <= 0}} <span class='current'> {{$page_num2}}</span> {{else}} <a class="pagination"  href="javascript:requestsellerInfo({{$page_num2}})" title="{{$page_num2}} Page">{{$page_num2}}</a> {{/if}}
        {{/if}}     
        {{/if}}
        {{/foreach}}
        {{if $page_num2 < $lasttow}}
        ...
        {{/if}}
        {{if $lastone == 1}}
        {{elseif $lastone == 2}}
        {{else}}
        {{if $pagenum == $lastone }} <span class='current'>{{$lastone}}</span> {{else}} <a class="pagination"  href="javascript:requestsellerInfo({{$lastone}})" title="{{$lastone}} Page">{{$lastone}}</a> {{/if}}
        {{/if}}
        {{if $last == 1}}
        {{elseif $last == 2}}
        {{else}}
        {{if $pagenum == $last}} <span class='current'>{{$last}}</span> {{else}} <a class="pagination"  href="javascript:requestsellerInfo({{$last}})" title="{{$last}} Page">{{$last}}</a> {{/if}}
        {{/if}}
        {{if $pagenum == $last}} <span class='disabled'>next &raquo;</span> {{else}} <a class="pagination" href="javascript:requestsellerInfo({{math equation="x + y" x=$pagenum y=1}})" title="Next">next &raquo;</a></div>
      {{/if}} </td>
    {{else}}
    <td align="center" height="300">Record Not found... </td>
    {{/if}} </tr>
</table>
{{/if}}
</div>
{{/if}}

{{if !empty($quickViewData)}}
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<table cellpadding="0" cellspacing="0" width="100%;" id="model-table">
  <tr>
    <td width="84">First Name:</td>
    <td width="296" style="text-align:left;">{{$quickViewData.bcust_fname}}</td>
    <td width="112">Last Name:</td>
    <td width="428" style="text-align:left;">{{$quickViewData.bcust_lname}} <span class="action" style="float:right;"> <a href="{{$BASE_URL}}js/vcard/index.php?fname={{$quickViewData.bcust_fname}}&lname={{$quickViewData.bcust_lname}}&email1={{$quickViewData.bcust_misc_email1}}&email2={{$quickViewData.bcust_misc_email2}}&mobile={{$quickViewData.bcust_misc_moble}}&business={{$quickViewData.bcust_misc_business}}&home={{$quickViewData.bcust_misc_home}}" class="action_new" target="_blank">Vcard</a></span></td>
  </tr>
  <tr>
    <td width="100"> Email:</td>
    <th> {{$quickViewData.bcust_misc_email1}} </th>
    <td >Secondary Email:</td>
    <th> {{$quickViewData.bcust_misc_email2}} </th>
  </tr>
  <tr>
    <th colspan="4"> <strong>Mobile:</strong> {{$quickViewData.bcust_misc_moble}} <strong style="padding-left:70px;">Business:</strong> {{$quickViewData.bcust_misc_business}} <strong style="padding-left:70px;">Home:</strong> {{$quickViewData.bcust_misc_home}} </th>
  </tr>
  <tr>
    <th colspan="4"><strong>Address:</strong> {{$quickViewData.bcust_address}} </th>
  </tr>
  <tr>
    <th colspan="4"><strong>Postal Address:</strong>{{$quickViewData.bcust_postcode}}</th>
  </tr>
</table>
{{/if}}

{{if !empty($resultAdverts)}}
<table cellpadding="0" cellspacing="0" width="100%" id="list-table">
  <tr bgcolor="#CCCCCC">
    <th width="7%">Action</th>
    <th width="20%"> Website Listed In </th>
    <th width="20%">Heading</th>
    <th width="30%">Adv Link </th>
    <th width="5%">Type</th>
    <th width="5%">Status</th>
  </tr>
  {{foreach from=$resultAdverts item=item key=key}}
  <tr>
    <td><a href="javascript:add_edit_adverts({{$item.sl_id}});"> <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
      {{if $USER_GROUP == 'Administrators'}} <a href="javascript:requestAdvertDelete({{$item.sl_id}});" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;"> <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a> {{/if}} </td>
    <td>{{$item.soe_name}} {{if $item.s_district}} - {{$item.s_district}} {{/if}}{{if $item.sl_enhance_type == 1}} - Enhanced {{/if}}</td>
    <td>{{$item.sl_adv_name}}</td>
    <td><a href="{{$item.sl_link}}" target="_blank" title="{{$item.sl_link}}">{{$item.sl_link|truncate:"50"}}</a></td>
    <td>{{if $item.sl_listing_type == 1}}Disclosed {{else}} Undisclosed{{/if}}</td>
    <td>{{if $item.sl_status == 1}} Active {{else}} Inactive {{/if}}</td>
  </tr>
  {{/foreach}}
</table>
{{if $last > 1}}
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center" style="border:none;">
  <tr> {{if $last}}
    <td align="center"><div class='pagination'> {{if $pagenum == 1}} <span class='disabled'>&laquo; previous</span> {{else}} <a class="pagination" href="javascript:javascript:parent.requestadvertsDiv({{math equation="x - y" x=$pagenum y=1}})" title="Previous">&laquo; previous</a> {{/if}}
        
        {{if $pagenum != 1}} <span class="paginate"><a class="pagination"  href="javascript:parent.requestadvertsDiv(1)" title="{{$page_num}} Page">1</a></span> {{else}}<span class='current'>1</span> {{/if}}{{if $pagenum != 2}} <span class="paginate"><a class="pagination"  href="javascript:parent.requestadvertsDiv(2)" title="{{$page_num}} Page">2</a></span> {{else}}<span class='current'>2</span> {{/if}}
        {{if $paginateprev.0 > 3}}
        ...
        {{/if}}
        {{foreach from=$paginateprev key="page_key" item="page_num"}}
        {{if $page_num == $pagenum OR $page_num <= 2}}
        {{elseif $page_num == $lastone}}
        
        {{else}} <span class="paginate"><a class="pagination"  href="javascript:parent.requestadvertsDiv({{$page_num}})" title="{{$page_num}} Page">{{$page_num}}</a></span> {{/if}}
        {{/foreach}}
        
        {{foreach from=$paginatenext key="page_key" item="page_num2"}}
        {{if $page_num2 < $last AND $page_num2 != $lastone}}
        {{if $page_num2 == 1}}
        {{elseif $page_num2 == 2}}
        {{else}}
        {{if $page_num2 == $pagenum OR $page_num2 <= 0}} <span class='current'> {{$page_num2}}</span> {{else}} <a class="pagination"  href="javascript:requestadvertsDiv({{$page_num2}})" title="{{$page_num2}} Page">{{$page_num2}}</a> {{/if}}
        {{/if}}     
        {{/if}}
        {{/foreach}}
        {{if $page_num2 < $lasttow}}
        ...
        {{/if}}
        {{if $lastone == 1}}
        {{elseif $lastone == 2}}
        {{else}}
        {{if $pagenum == $lastone }} <span class='current'>{{$lastone}}</span> {{else}} <a class="pagination"  href="javascript:requestadvertsDiv({{$lastone}})" title="{{$lastone}} Page">{{$lastone}}</a> {{/if}}
        {{/if}}
        {{if $last == 1}}
        {{elseif $last == 2}}
        {{else}}
        {{if $pagenum == $last}} <span class='current'>{{$last}}</span> {{else}} <a class="pagination"  href="javascript:requestadvertsDiv({{$last}})" title="{{$last}} Page">{{$last}}</a> {{/if}}
        {{/if}}
        {{if $pagenum == $last}} <span class='disabled'>next &raquo;</span> {{else}} <a class="pagination" href="javascript:requestadvertsDiv({{math equation="x + y" x=$pagenum y=1}})" title="Next">next &raquo;</a></div>
      {{/if}} </td>
    {{else}}
    <td align="center" height="300">Record Not found... </td>
    {{/if}} </tr>
</table>
{{/if}}

{{/if}}



{{if !empty($resultPriceranges)}}
<table cellpadding="0" cellspacing="0" width="100%" id="list-table">
  <tr bgcolor="#CCCCCC">
    <th width="40%">Heading</th>
    <th width="30%">Website Listed In </th>
    <th width="10%">Price (Desc)</th>
    <th width="15%">Change Date</th>
    <th width="5%">Status</th>
  </tr>
  {{foreach from=$resultPriceranges item=item key=key}}
  <tr>
    <td>{{$item.bpr_name}}</td>
    <td>{{$item.soe_name}} {{if $item.s_district}} - {{$item.s_district}} {{/if}}{{if $item.sl_enhance_type == 1}} - Enhanced {{/if}}</td>
    <td>{{$item.bpr_price}}</td>
    <td>{{$item.bpr_timestamp|date_format:"%d/%m/%Y %H:%M"}}</td>
    <td>{{if $item.bpr_status == 1}} Active {{else}} Inactive {{/if}}</td>
  </tr>
  {{/foreach}}
</table>
{{if $last > 1}}
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center" style="border:none;">
  <tr> {{if $last}}
    <td align="center"><div class='pagination'> {{if $pagenum == 1}} <span class='disabled'>&laquo; previous</span> {{else}} <a class="pagination" href="javascript:javascript:parent.requestadvertsDiv({{math equation="x - y" x=$pagenum y=1}})" title="Previous">&laquo; previous</a> {{/if}}
        
        {{if $pagenum != 1}} <span class="paginate"><a class="pagination"  href="javascript:parent.requestpricerangeDiv(1)" title="{{$page_num}} Page">1</a></span> {{else}}<span class='current'>1</span> {{/if}}{{if $pagenum != 2}} <span class="paginate"><a class="pagination"  href="javascript:parent.requestpricerangeDiv(2)" title="{{$page_num}} Page">2</a></span> {{else}}<span class='current'>2</span> {{/if}}
        {{if $paginateprev.0 > 3}}
        ...
        {{/if}}
        {{foreach from=$paginateprev key="page_key" item="page_num"}}
        {{if $page_num == $pagenum OR $page_num <= 2}}
        {{elseif $page_num == $lastone}}
        
        {{else}} <span class="paginate"><a class="pagination"  href="javascript:parent.requestpricerangeDiv({{$page_num}})" title="{{$page_num}} Page">{{$page_num}}</a></span> {{/if}}
        {{/foreach}}
        
        {{foreach from=$paginatenext key="page_key" item="page_num2"}}
        {{if $page_num2 < $last AND $page_num2 != $lastone}}
        {{if $page_num2 == 1}}
        {{elseif $page_num2 == 2}}
        {{else}}
        {{if $page_num2 == $pagenum OR $page_num2 <= 0}} <span class='current'> {{$page_num2}}</span> {{else}} <a class="pagination"  href="javascript:requestpricerangeDiv({{$page_num2}})" title="{{$page_num2}} Page">{{$page_num2}}</a> {{/if}}
        {{/if}}     
        {{/if}}
        {{/foreach}}
        {{if $page_num2 < $lasttow}}
        ...
        {{/if}}
        {{if $lastone == 1}}
        {{elseif $lastone == 2}}
        {{else}}
        {{if $pagenum == $lastone }} <span class='current'>{{$lastone}}</span> {{else}} <a class="pagination"  href="javascript:requestpricerangeDiv({{$lastone}})" title="{{$lastone}} Page">{{$lastone}}</a> {{/if}}
        {{/if}}
        {{if $last == 1}}
        {{elseif $last == 2}}
        {{else}}
        {{if $pagenum == $last}} <span class='current'>{{$last}}</span> {{else}} <a class="pagination"  href="javascript:requestpricerangeDiv({{$last}})" title="{{$last}} Page">{{$last}}</a> {{/if}}
        {{/if}}
        {{if $pagenum == $last}} <span class='disabled'>next &raquo;</span> {{else}} <a class="pagination" href="javascript:requestpricerangeDiv({{math equation="x + y" x=$pagenum y=1}})" title="Next">next &raquo;</a></div>
      {{/if}} </td>
    {{else}}
    <td align="center" height="300">Record Not found... </td>
    {{/if}} </tr>
</table>
{{/if}}
{{/if}}
{{if !empty($resultEdlogs)}}
<table cellpadding="0" cellspacing="0" width="100%" id="divtruelog" >
  <tr bgcolor="#CCCCCC">
    <th width="7%">Action</th>
    <th width="20%">To Name </th>     
    <th width="20%">To Email </th>
    <th width="30%">Title </th>
    <th width="10%">Support Name </th>
    <th width="20%">Date</th>
  </tr>
  {{foreach from=$resultEdlogs item=item key=key}}
  <tr>
    <td><a href="javascript:parent.elogview({{$item.edl_id}});" title="Quick View"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/view.png"/></a>
    {{if $USER_GROUP == 'Administrators'}} <a href="javascript:requestelogDelete({{$item.edl_id}});" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;"> <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a> {{/if}} </td>
   
     <td>{{$item.edl_toname}}</td>
    <td>{{$item.edl_to}}</td>
    <td>{{$item.edl_title|truncate:"100"}}</td>
	<td>{{$item.user_name}}</td>
    <td>{{$item.edl_date|date_format:"%d-%m-%Y"}}</td>
  </tr>
  {{/foreach}}
</table>
<!-- Begin Pagination -->
{{if $last > 1}}
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center" style="border:none;">
  <tr> {{if $last}}
    <td align="center"><div class='pagination'> {{if $pagenum == 1}} <span class='disabled'>&laquo; previous</span> {{else}} <a class="pagination" href="javascript:javascript:parent.requestbuselogInfo({{math equation="x - y" x=$pagenum y=1}})" title="Previous">&laquo; previous</a> {{/if}}
        {{if $pagenum != 1}} <span class="paginate"><a class="pagination"  href="javascript:parent.requestbuselogInfo(1)" title="{{$page_num}} Page">1</a></span> {{else}}<span class='current'>1</span> {{/if}}{{if $pagenum != 2}} <span class="paginate"><a class="pagination"  href="javascript:parent.requestbuselogInfo(2)" title="{{$page_num}} Page">2</a></span> {{else}}<span class='current'>2</span> {{/if}}
        {{if $paginateprev.0 > 3}}
        ...
        {{/if}}
        {{foreach from=$paginateprev key="page_key" item="page_num"}}
        {{if $page_num == $pagenum OR $page_num <= 2}}
        {{elseif $page_num == $lastone}}
        
        {{else}} <span class="paginate"><a class="pagination"  href="javascript:parent.requestbuselogInfo({{$page_num}})" title="{{$page_num}} Page">{{$page_num}}</a></span> {{/if}}
        {{/foreach}}
        
        {{foreach from=$paginatenext key="page_key" item="page_num2"}}
        {{if $page_num2 < $last AND $page_num2 != $lastone}}
        {{if $page_num2 == 1}}
        {{elseif $page_num2 == 2}}
        {{else}}
        {{if $page_num2 == $pagenum OR $page_num2 <= 0}} <span class='current'> {{$page_num2}}</span> {{else}} <a class="pagination"  href="javascript:requestbuselogInfo({{$page_num2}})" title="{{$page_num2}} Page">{{$page_num2}}</a> {{/if}}
        {{/if}}     
        {{/if}}
        {{/foreach}}
        {{if $page_num2 < $lasttow}}
        ...
        {{/if}}
        {{if $lastone == 1}}
        {{elseif $lastone == 2}}
        {{else}}
        {{if $pagenum == $lastone }} <span class='current'>{{$lastone}}</span> {{else}} <a class="pagination"  href="javascript:requestbuselogInfo({{$lastone}})" title="{{$lastone}} Page">{{$lastone}}</a> {{/if}}
        {{/if}}
        {{if $last == 1}}
        {{elseif $last == 2}}
        {{else}}
        {{if $pagenum == $last}} <span class='current'>{{$last}}</span> {{else}} <a class="pagination"  href="javascript:requestbuselogInfo({{$last}})" title="{{$last}} Page">{{$last}}</a> {{/if}}
        {{/if}}
        {{if $pagenum == $last}} <span class='disabled'>next &raquo;</span> {{else}} <a class="pagination" href="javascript:requestbuselogInfo({{math equation="x + y" x=$pagenum y=1}})" title="Next">next &raquo;</a></div>
      {{/if}} </td>
    {{else}}
    <td align="center" height="300">Record Not found... </td>
    {{/if}} </tr>
</table>
{{/if}}
<!-- End Pagination -->
{{/if}}

{{if !empty($resultOcontact)}}
<table cellpadding="0" cellspacing="0" width="100%" id="list-table">
  <tr>
    <th width="10%">Action</th>
    <th>Contact Type</th>
    <th>Name</th>
    <th>Email</th>
    <th>Mobile</th>
    <th>Business</th>
  </tr>
  {{foreach from=$resultOcontact item=item key=key}}
  <tr>
    <td><div align="right"><a href="javascript:add_edit_othercontact({{$item.oc_id}});" title="Edit" > <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a> &nbsp;&nbsp; <a href="javascript:requestOthercontactDelete('{{$item.oc_id}}');" onclick="javascript:if(!confirm('Are you sure want to delete the Contact?')) return false;" title="Delete"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a> </div></td>
    <td>{{$item.ct_name}}</td>
    <td>{{$item.oc_fname}}&nbsp;{{$item.oc_lname}}</td>
    <td>{{$item.oc_email}}</td>
    <td>{{$item.oc_mobile}}</td>
    <td>{{$item.oc_business}}</td>
  </tr>
  {{/foreach}}
</table>
{{if $last > 1}}
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center" style="border:none;">
  <tr> {{if $last}}
    <td align="center"><div class='pagination'> {{if $pagenum == 1}} <span class='disabled'>&laquo; previous</span> {{else}} <a class="pagination" href="javascript:javascript:parent.requestOthercontactDiv({{math equation="x - y" x=$pagenum y=1}})" title="Previous">&laquo; previous</a> {{/if}}
        
        {{if $pagenum != 1}} <span class="paginate"><a class="pagination"  href="javascript:parent.requestOthercontactDiv(1)" title="{{$page_num}} Page">1</a></span> {{else}}<span class='current'>1</span> {{/if}}{{if $pagenum != 2}} <span class="paginate"><a class="pagination"  href="javascript:parent.requestOthercontactDiv(2)" title="{{$page_num}} Page">2</a></span> {{else}}<span class='current'>2</span> {{/if}}
        {{if $paginateprev.0 > 3}}
        ...
        {{/if}}
        {{foreach from=$paginateprev key="page_key" item="page_num"}}
        {{if $page_num == $pagenum OR $page_num <= 2}}
        {{elseif $page_num == $lastone}}
        
        {{else}} <span class="paginate"><a class="pagination"  href="javascript:parent.requestOthercontactDiv({{$page_num}})" title="{{$page_num}} Page">{{$page_num}}</a></span> {{/if}}
        {{/foreach}}
        
        {{foreach from=$paginatenext key="page_key" item="page_num2"}}
        {{if $page_num2 < $last AND $page_num2 != $lastone}}
        {{if $page_num2 == 1}}
        {{elseif $page_num2 == 2}}
        {{else}}
        {{if $page_num2 == $pagenum OR $page_num2 <= 0}} <span class='current'> {{$page_num2}}</span> {{else}} <a class="pagination"  href="javascript:requestOthercontactDiv({{$page_num2}})" title="{{$page_num2}} Page">{{$page_num2}}</a> {{/if}}
        {{/if}}     
        {{/if}}
        {{/foreach}}
        {{if $page_num2 < $lasttow}}
        ...
        {{/if}}
        {{if $lastone == 1}}
        {{elseif $lastone == 2}}
        {{else}}
        {{if $pagenum == $lastone }} <span class='current'>{{$lastone}}</span> {{else}} <a class="pagination"  href="javascript:requestOthercontactDiv({{$lastone}})" title="{{$lastone}} Page">{{$lastone}}</a> {{/if}}
        {{/if}}
        {{if $last == 1}}
        {{elseif $last == 2}}
        {{else}}
        {{if $pagenum == $last}} <span class='current'>{{$last}}</span> {{else}} <a class="pagination"  href="javascript:requestOthercontactDiv({{$last}})" title="{{$last}} Page">{{$last}}</a> {{/if}}
        {{/if}}
        {{if $pagenum == $last}} <span class='disabled'>next &raquo;</span> {{else}} <a class="pagination" href="javascript:requestOthercontactDiv({{math equation="x + y" x=$pagenum y=1}})" title="Next">next &raquo;</a></div>
      {{/if}} </td>
    {{else}}
    <td align="center" height="300">Record Not found... </td>
    {{/if}} </tr>
</table>
{{/if}}
{{/if}}
{{if $compose_email_temp_data}}
<link rel="stylesheet" href="{{$BASE_URL}}css/default/cis-styles.css" />
<div style="border:1px #CCCCCC solid; padding:5px;" id="nwenIframe"  >
  <script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
  <script type="text/javascript" src="{{$BASE_URL}}js/default.js"></script>
  {{if $close_win == 1}}
  <script type="text/javascript">
<!--hide
window.close();
//-->
</script>
  {{/if}}
  <script type="text/javascript">
 
 function call_top()
 			{
			showTop();			
			}
 
var getfileslisturl = "{{$BASE_URL}}{{$XFA.email_attachment}}?a_req=list"; // The server-side script
		function handleHttpfilesResponselist() {   
			if (http.readyState == 4) {
				  if(http.status==200) {
					  var results=http.responseText;
					
				  document.getElementById('emailattachmnets_list').innerHTML = results;
				  closeTop();	
				  if(results !='')
					{document.getElementById('emailattachmnets_list').style.visibility = 'visible';
					}
				}
			  }
			}
		
		function requestattach_list() {   
	
				curl22 = getfileslisturl + "&random=" + Math.random();
		
				http.open("GET", curl22, true);
				http.onreadystatechange = handleHttpfilesResponselist;
				http.send(null);
				showTop();	
				
        }
	
var getfiledeleteurl = "{{$BASE_URL}}{{$XFA.email_attachment}}?a_req=del"; // The server-side script
		function handleHttpfilesResponsedel() {   
			if (http.readyState == 4) {
				  if(http.status==200) {
					  var results=http.responseText;
					
				  if(results !='')
					{
				  requestattach_list();
				  closeTop();
					}
				}
			  }
			}
		
		function requestattach_del(key) {   
	
				curl22 = getfiledeleteurl +"&key="+ key +"&random=" + Math.random();
		
				http.open("GET", curl22, true);
				http.onreadystatechange = handleHttpfilesResponsedel;
				http.send(null);
				showTop();			
        }	
	
		
<!-- Begin Ajax comman XMLHttpRequest -->				
		function getHTTPObject() {
		  var xmlhttp;
		
		  if(window.XMLHttpRequest){
			xmlhttp = new XMLHttpRequest();
		  }
		  else if (window.ActiveXObject){
		
			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
			if (!xmlhttp){
				xmlhttp=new ActiveXObject("Msxml2.XMLHTTP");
				}
			}
		  return xmlhttp; 
		}
		var http = getHTTPObject(); //We create the HTTP Object
<!-- End Ajax comman XMLHttpRequest -->	

</SCRIPT>
  <form action="" method="post" name="iframe_form">
    <input type="hidden" name="semail[bus_id]" value="{{$bus_id}}" />
    <table cellpadding="0" cellspacing="0" class="table" >
      {{if $sent_mail}}
      <tr>
        <td colspan="2"><strong>{{$sent_mail}}</strong></td>
      </tr>
      {{/if}}
      <tr>
        <td><strong>Select Seller(s):</strong></td>
        <td><ul>
            {{foreach from=$bussellers name='bussellers' key="key" item="item"}}
            <li>
              <input type="checkbox" name="semail[sellers][]" value="{{$item.bcust_misc_email1}}||{{$item.bcust_fname}}||{{$item.bcust_lname}}" />
              &nbsp;{{$item.bcust_fname}}&nbsp;{{$item.bcust_lname}}</li>
            {{/foreach}}
          </ul></td>
      </tr>
      <tr>
        <th>Variables: </th>
        <td><table cellpadding="0" cellspacing="0" border="0" id="buyer_email_table" width="800">
            <tr> {{counter assign="count"}}
              {{foreach from=$email_temp_vars_seller item="item" key="key"}}
              <td width="300"><b>{{$key}}</b> =>
                <input type="text" readonly="readonly" value="{{$item}}" /></td>
              {{if $count % 3 == 0}} </tr>
            <tr> {{/if}}
              {{counter  assign="count"}}
              {{/foreach}}
          </table></td>
      </tr>
      <tr>
        <td><strong>Email Title:</strong></td>
        <td><input type="text" name="semail[title]" style="width:515px;" value="{{$compose_email_temp_data.et_subject}}" /></td>
      </tr>
      <tr>
        <td><strong>Message:</strong></td>
        <td><table id="none-table22">
            <tr>
              <td>{{fckeditor InstanceName="semail[body]" Value=$compose_email_temp_data.et_body Width="800px" Height="400px" }}</td>
            </tr>
          </table></td>
      </tr>
      <tr>
        <td><strong>Attachment:</strong> </td>
        <td><br />
          <div id="emailattachmnets_list"> {{if $attach_file}}
            <div style="float:left; width:100%; padding-right:20px;">
              <ul>
                {{foreach from=$attach_file key="key" item="item"}}
                <li><img src="{{$BASE_URL}}images/email_attach.png" width="20">&nbsp;&nbsp;{{$item}}&nbsp;&nbsp;<a href="javascript:requestattach_del({{$key}});">Remove</a></li>
                {{/foreach}}
              </ul>
            </div>
            {{/if}} </div>
          <div id="emailattachment">
            <iframe name="mail_attachment" id="mail_attachment" src="{{$BASE_URL}}{{$XFA.email_attachment}}" width="100%" height="60" frameborder="0" scrolling="no" hspace=10 vspace=5 onload="javascript:closeTop();" style="overflow-x: hidden; overflow-y: scroll;"></iframe>
          </div></td>
      </tr>
      <tr>
        <td colspan="2" style="text-align:center;"><input type="submit"  value="Send" name="submit_email" style="cursor:pointer;" />
          <input type="button"  value="Cancel" onclick="parent.hideiFrame('nwenIframe');" style="cursor:pointer;" />
        </td>
      </tr>
    </table>
  </form>
  <script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("iframe_form");
    frmvalidator.EnableMsgsTogether();
	{{if $bussellers_count > 1}}
    frmvalidator.addValidation("semail[sellers][]","selone_radio","Please Select Atleast One Seller.");
	{{else}}
	frmvalidator.addValidation("semail[sellers][]","shouldselchk=on","Please select seller.");
	{{/if}}
	    frmvalidator.addValidation("semail[title]","req", "Please specify title.");
		frmvalidator.addValidation("semail[body]","req", "Please specify body.");
</script>
</div>
{{/if}}
{{if $email_temp_data}}
<link rel="stylesheet" href="{{$BASE_URL}}css/default/cis-styles.css" />
<div style="border:1px #CCCCCC solid; padding:5px; width:99%" id="nwenIframe"  >
  <script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
  <script type="text/javascript" src="{{$BASE_URL}}js/default.js"></script>
  {{if $close_win == 1}}
  <script type="text/javascript">
<!--hide
window.close();
//-->
</script>
  {{/if}}
  <script type="text/javascript">
 
 function call_top()
 			{
			showTop();			
			}
 
var getfileslisturl = "{{$BASE_URL}}{{$XFA.email_attachment}}?a_req=list"; // The server-side script
		function handleHttpfilesResponselist() {   
			if (http.readyState == 4) {
				  if(http.status==200) {
					  var results=http.responseText;
					
				  document.getElementById('emailattachmnets_list').innerHTML = results;
				  closeTop();	
				  if(results !='')
					{document.getElementById('emailattachmnets_list').style.visibility = 'visible';
					}
				}
			  }
			}
		
		function requestattach_list() {   
	
				curl22 = getfileslisturl + "&random=" + Math.random();
		
				http.open("GET", curl22, true);
				http.onreadystatechange = handleHttpfilesResponselist;
				http.send(null);
				showTop();	
				
        }
	
var getfiledeleteurl = "{{$BASE_URL}}{{$XFA.email_attachment}}?a_req=del"; // The server-side script
		function handleHttpfilesResponsedel() {   
			if (http.readyState == 4) {
				  if(http.status==200) {
					  var results=http.responseText;
					
				  if(results !='')
					{
				  requestattach_list();
				  closeTop();
					}
				}
			  }
			}
		
		function requestattach_del(key) {   
	
				curl22 = getfiledeleteurl +"&key="+ key +"&random=" + Math.random();
		
				http.open("GET", curl22, true);
				http.onreadystatechange = handleHttpfilesResponsedel;
				http.send(null);
				showTop();			
        }	
	
		
<!-- Begin Ajax comman XMLHttpRequest -->				
		function getHTTPObject() {
		  var xmlhttp;
		
		  if(window.XMLHttpRequest){
			xmlhttp = new XMLHttpRequest();
		  }
		  else if (window.ActiveXObject){
		
			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
			if (!xmlhttp){
				xmlhttp=new ActiveXObject("Msxml2.XMLHTTP");
				}
			}
		  return xmlhttp; 
		}
		var http = getHTTPObject(); //We create the HTTP Object
<!-- End Ajax comman XMLHttpRequest -->	

function checkAll(opr)
	{
	   var node_list = document.getElementsByTagName('input');
		if(opr == 'check')
			{
			checked = true;
			}else{
			checked = false;
			}
	var j=1;
	for (var i = 0; i < node_list.length; i++) {
		var node = node_list[i];
	 	
		if (node.getAttribute('type') == 'checkbox') {
			 node.checked = checked;
			 j++;
		 }
		}
	//document.getElementById('buyercount').innerHTML = j;
	}


</SCRIPT>
  <form action="" method="post" name="iframe_form">
    <input type="hidden" name="semail[bus_id]" value="{{$bus_id}}" />
    <input type="hidden" name="semail[edt_id]" value="{{$email_temp_data.edt_id}}" />
    <table cellpadding="0" cellspacing="0" width="107	0" >
      <tr>
        <td width="100" valign="top"><table cellpadding="0" cellspacing="0" width="100%" style="border: 1px solid #CCC; height:900px; top:0;">
            <tr>
              <td valign="top" style="height:20px;"><div style="font-size:14px; font-weight:bold; padding:10px;">Select Buyer(s):</div></td>
            </tr>
            <tr>
              <td valign="top"><div class="allchecked"> <a href="javascript:checkAll('check');">Check All</a> <a href="javascript:checkAll('uncheck');">Uncheck All</a>
                  <p><br />
                    Total Buyers:- <span id="buyercount">{{$busbuyers_count}}</span></p>
                </div>
                <div style="padding-left:5px; padding-top:5px;">
                  <select name="semail[buyertype]" style="width:150px; font-size:12px;" onchange="submit();">
                    <option value="1" {{if $buyertype == 1}} selected="selected" {{/if}}>Buyer Enquired</option>
                    <option value="2" {{if $buyertype == 2}} selected="selected" {{/if}}>Signed deed of confidentiality</option>
                    <option value="3" {{if $buyertype == 3}} selected="selected" {{/if}}>Unsigned deed of confidentiality</option>
                    <option value="4" {{if $buyertype == 4}} selected="selected" {{/if}}>All Buyers</option>
                  </select>
                </div>
                <div class="truelogbuyerlist">
                  <ul>
                    {{foreach from=$busbuyers name='busbuyers' key="key" item="item"}}
                    <li>
                      <input type="checkbox" name="semail[buyers][]" value="{{$item.bcust_id}}||{{$item.bcust_misc_email1}}||{{$item.bcust_fname}}||{{$item.bcust_lname}}" />
                      &nbsp;{{$item.bcust_fname}}&nbsp;{{$item.bcust_lname}}</li>
                    {{/foreach}}
                  </ul>
                </div></td>
            </tr>
          </table></td>
        <td width="70%" style="padding-left:20px;" ><table cellpadding="0" cellspacing="0" class="table" width="100%" >
            {{if $sent_mail}}
            <tr>
              <td colspan="2"><div style="color:#006600; font-size:13px; padding:10px;" align="center"><strong>{{$sent_mail}}</strong></div></td>
            </tr>
            {{/if}}   
            {{if $error}}
            <tr>
              <td colspan="2"><div style="color: #FF0000; font-size:13px; padding:10px;" align="center"><strong>{{$error}}</strong></div></td>
            </tr>
            {{/if}}
            <tr>
              <td align="right"><strong>Templates:</strong>&nbsp;</td>
              <td><select name="semail[temp_id]" style="width:700px;" onchange="submit();" >
                  <option value="">--Select Template--</option>
                  	
            {{foreach from=$templates key="key" item="item"}}
            
                  <option value="{{$item.edt_id}}" {{if $email_temp_data.edt_id == $item.edt_id}} selected="selected" {{/if}}>{{$item.edt_title}}</option>
                  
            {{/foreach}}
        
                </select></td>
            </tr>
            <tr>
              <td align="right"><strong>Title:</strong>&nbsp;</td>
              <td><input type="text" name="semail[title]" style="width:515px;" value="{{$email_temp_data.et_subject}}" /></td>
            </tr>
            <tr>
              <td align="right"><strong>Message:</strong>&nbsp;</td>
              <td><table id="none-table22">
                  <tr>
                    <td>{{fckeditor InstanceName="semail[body]" Value=$email_temp_data.et_body Width="870px" Height="800px" }}</td>
                  </tr>
                </table></td>
            </tr>
            <tr>
              <td colspan="2" style="text-align:center;"><input type="submit"  value="Save" name="save_email" style="cursor:pointer;" />
                &nbsp;
                <input type="submit"  value="Send" name="submit_email" style="cursor:pointer;" />
                &nbsp;
                &nbsp;
                <input type="submit"  value="Send Test Email" name="submit_email" style="cursor:pointer;" />
                &nbsp;
                <input value="Delete" type="submit" name="delete_email"  style="cursor:pointer;" />
                <input type="button"  value="Cancel" onclick="parent.hideiFrame('truelogIframe');" style="cursor:pointer;" />
              </td>
            </tr>
          </table></td>
      </tr>
    </table>
  </form>
</div>
{{/if}} 
{{if $followupsform}}
<link rel="stylesheet" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type='text/javascript' src='{{$BASE_URL}}js/jquery.js'></script>
<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
{{if $oprsucces}}
<script type="text/javascript">
$('div#adddiv_new', window.parent.document).hide();
parent.requestFollowupsDiv(1);
</script>
{{/if}}
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}/js/chrometheme/chromestyle2.css" />
 <table id="product-table"><tr>
                <td colspan="2">
                <div class="green"><b>{{if $oprsucces}} Record has beed saved. {{/if}}</b></div>
                <form name="followups" method="post" action="">
                <input type="hidden" name="follows[sf_id]" value="{{$followupsdetail.sf_id}}" />
                	<table cellpadding="0" cellspacing="0" >
                    	<tr>
                        	<td>Source:&nbsp;
                            <select name="follows[sf_source]" style="width:150px;">
                           	<option value="0">--select--</option>
                                            {{foreach from=$alltablefollowsource item="item" key="key"}}
                           	<option value="{{$item.sfo_id}}" {{if $item.sfo_id == $followupsdetail.sf_source}} selected="selected" {{/if}}>{{$item.sfo_name}}</option>
                                            {{/foreach}}
                            </select>	
                            </td>
                            <td>Type:&nbsp;
                            <select name="follows[sf_types]" style="width:150px;">
                           	<option value="0">--select--</option>
                                            {{foreach from=$alltablefollowtypes item="item" key="key"}}
                           	<option value="{{$item.tfo_id}}" {{if $item.tfo_id == $followupsdetail.sf_types}} selected="selected" {{/if}}>{{$item.tfo_name}}</option>
                                            {{/foreach}}
                            </select>	
                            </td>
                            
                            <td width="130">
     Date:&nbsp;<input type="text" name="follows[sf_date]" value="{{$followupsdetail.sf_date}}" class="w16em dateformat-d-ds-m-ds-Y" maxlength="25" id="demo5" readonly="readonly" style="width:100px;"/>
                               </td>
                            <td></td>
                    	</tr>
                        <tr><td colspan="3"><textarea cols="100" rows="10" name="follows[sf_notes]">{{$followupsdetail.sf_notes}}</textarea></td></tr>
                        
                	</table>
             
         <script type="text/javascript" language="javascript">
			var frmvalidator  = new Validator("followups");
			frmvalidator.EnableMsgsTogether();
			//frmvalidator.addValidation("follows[sf_source]","dontselect=0", "Please specify source.");
			frmvalidator.addValidation("follows[sf_date]","req", "Please specify date.");
			frmvalidator.addValidation("follows[sf_notes]","req", "Please specify notes.");
		</script>
                   
                </td>
                <td>
                
<!--            <div id="hottable">
  				  <table cellpadding="0" cellspacing="0" border="0"  >
            <tr>
                <td class="hotbuttons"><input type="button" value="Recent Projects" id="recpro" class="buttonyellow"/></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td class="hotbuttons"><input type="button" value="Product Catalogues" id="procat" class="buttonyellow"/></td>
            </tr>
            <tr><td colspan="3">&nbsp;</td></tr>
            <tr>
                <td class="hotbuttons"><input type="button" value="Service Guarantees" id="sergua" class="buttonyellow"/></td>
                <td>&nbsp;</td>
                <td class="hotbuttons"><input type="button" value="Appraisals Survey" id="apps" class="buttonyellow"/></td>
            </tr>
            <tr><td colspan="3">&nbsp;</td></tr>
            <tr>
                <td class="hotbuttons"><input type="button" value="Understand Approvals ACT" id="undapp" class="buttonyellow"/></td>
                <td>&nbsp;</td>
                <td class="hotbuttons"><input type="button" value="All" id="all" class="buttonyellow"/></td> 
            </tr>
  		</table>
    
    	</div>-->
        
        
</td></tr>
   <!-- <tr><td colspan="3">What they want done:<br /><textarea cols="200" rows="3" name="follows[sf_wtwd]">{{$followupsdetail.sf_wtwd}}</textarea></td></tr>
    <tr><td colspan="3">When they want it done by:<br /><textarea cols="200" rows="3" name="follows[sf_wtwidb]">{{$followupsdetail.sf_wtwidb}}</textarea></td></tr>
    <tr><td colspan="3">Their Budget:<br /><textarea cols="200" rows="3" name="follows[sf_tb]">{{$followupsdetail.sf_tb}}</textarea></td></tr>
-->    <tr><td colspan="3"><input type="submit" name="savefollows" value="Save & Close" />&nbsp;</td></tr>
</table>
</form>            
 <script type="text/javascript">
        $(".buttonyellow").click(function() {
        if(confirm("Are you sure want to do this?")){
            var opr = $(this).attr("id");
            var bsnid = $('#bus_id').val();
            $.get('{{$BASE_URL}}business.functions', { opr: opr, busid: bsnid },
              function(data){
                alert(data);
            });
           }	
        });				
 </script>
{{/if}}
{{if $showlistmoney}}
<link rel="stylesheet" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type='text/javascript' src='{{$BASE_URL}}js/jquery.js'></script>
{{if !$listmoney}}<div align="center" style="color:#FF6600;" id="pmerror"> <strong>Record Not Founds.</strong> </div>
<script type="text/javascript">
alert();
    //$('#pmerror').hide('fast');
</script>
{{else}}
<table cellpadding="0" cellspacing="0" width="98%" id="taskstypes" style="border-collapse:collapse;" >
  <tr bgcolor="#CCCCCC">
    <th width="10%">Action</th>
    <th>Notes</th>
    <th width="10%">Type</th>
    <th width="10%">Amount</th>
  </tr>
  {{foreach from=$listmoney item=item key=key}}
      <tr height="20">
        <td><div align="right">
     <a href="javascript:add_edit_money({{$item.pm_id}});" title="Edit" > 
     <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a> &nbsp;&nbsp; 
     <a href="javascript:requestpmsDelete('{{$item.pm_id}}');" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"> 
     <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a> 
 	</div></td>
    	<td><div style="font-size:12px; font-weight:normal;" align="left">{{$item.pm_notes}}</div></td>
        <td>{{$item.pm_type}}</td>
        <td>{{$item.pm_amount}}</td>
      </tr>
  {{/foreach}}
  </table>
{{/if}}
{{/if}}
{{if $listsalesfollowup}}
<link rel="stylesheet" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type='text/javascript' src='{{$BASE_URL}}js/jquery.js'></script>
<table cellpadding="0" cellspacing="0" width="100%" id="divtruelog" style="border-collapse:collapse;" >
  <tr bgcolor="#CCCCCC">
    <th width="10%">Action</th>
    <th>Notes</th>
    <th width="10%">Person</th>
    <th width="10%">Date</th>
    <th width="10%">Source</th>
     <th width="10%">Type</th>
  </tr>
  {{foreach from=$listsalesfollowup item=item key=key}}
      <tr height="20">
        <td>
 <div align="right">
     <a href="javascript:add_edit_followups({{$item.sf_id}});" title="Edit" > 
     <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a> &nbsp;&nbsp; 
     <a href="javascript:requestfollowupsDelete('{{$item.sf_id}}');" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"> 
     <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a> 
 </div>
 </td>  <td>{{$item.sf_notes}}</td>
        <td>{{$item.user_name}}</td>
        <td>{{$item.sf_date|date_format:"%d-%m-%Y"}}</td>
        <td>{{$item.sfo_name}}</td>
        <td>{{$item.tfo_name}}</td>
      </tr>
  {{/foreach}}
  </table>
{{if $last > 1}}
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center" style="border:none;">
  <tr> {{if $last}}
    <td align="center"><div class='pagination'> {{if $pagenum == 1}} <span class='disabled'>&laquo; previous</span> {{else}} <a class="pagination" href="javascript:javascript:requestFollowupsDiv({{math equation="x - y" x=$pagenum y=1}})" title="Previous">&laquo; previous</a> {{/if}}
        {{if $pagenum != 1}} <span class="paginate"><a class="pagination"  href="javascript:requestFollowupsDiv(1)" title="{{$page_num}} Page">1</a></span> {{else}}<span class='current'>1</span> {{/if}}{{if $pagenum != 2}} <span class="paginate"><a class="pagination"  href="javascript:requestFollowupsDiv(2)" title="{{$page_num}} Page">2</a></span> {{else}}<span class='current'>2</span> {{/if}}
        {{if $paginateprev.0 > 3}}
        ...
        {{/if}}
        {{foreach from=$paginateprev key="page_key" item="page_num"}}
        {{if $page_num == $pagenum OR $page_num <= 2}}
        {{elseif $page_num == $lastone}}
        
        {{else}} <span class="paginate"><a class="pagination"  href="javascript:requestFollowupsDiv({{$page_num}})" title="{{$page_num}} Page">{{$page_num}}</a></span> {{/if}}
        {{/foreach}}
        
        {{foreach from=$paginatenext key="page_key" item="page_num2"}}
        {{if $page_num2 < $last AND $page_num2 != $lastone}}
        {{if $page_num2 == 1}}
        {{elseif $page_num2 == 2}}
        {{else}}
        {{if $page_num2 == $pagenum OR $page_num2 <= 0}} <span class='current'> {{$page_num2}}</span> {{else}} <a class="pagination"  href="javascript:requestFollowupsDiv({{$page_num2}})" title="{{$page_num2}} Page">{{$page_num2}}</a> {{/if}}
        {{/if}}     
        {{/if}}
        {{/foreach}}
        {{if $page_num2 < $lasttow}}
        ...
        {{/if}}
        {{if $lastone == 1}}
        {{elseif $lastone == 2}}
        {{else}}
        {{if $pagenum == $lastone }} <span class='current'>{{$lastone}}</span> {{else}} <a class="pagination"  href="javascript:requestFollowupsDiv({{$lastone}})" title="{{$lastone}} Page">{{$lastone}}</a> {{/if}}
        {{/if}}
        {{if $last == 1}}
        {{elseif $last == 2}}
        {{else}}
        {{if $pagenum == $last}} <span class='current'>{{$last}}</span> {{else}} <a class="pagination"  href="javascript:requestFollowupsDiv({{$last}})" title="{{$last}} Page">{{$last}}</a> {{/if}}
        {{/if}}
        {{if $pagenum == $last}} <span class='disabled'>next &raquo;</span> {{else}} <a class="pagination" href="javascript:requestFollowupsDiv({{math equation="x + y" x=$pagenum y=1}})" title="Next">next &raquo;</a></div>
      {{/if}} </td>
    {{else}}
    <td align="center" height="300">Record Not found... </td>
    {{/if}} </tr>
</table>
{{/if}}  
{{/if}}