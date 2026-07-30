<script type="text/javascript" language="javascript" >
//********* Start of Main Calculation *******//

function main_calculation()
{
$('#pqdt_total1_values').val((parseInt($('#pqdt_decking_total_values').val()) + parseInt($('#pqdt_wrapping_total_values').val()) + parseInt($('#pqdt_subframe_total_values').val()) +parseInt($('#pqdt_handrail_total_values').val()) + parseInt($('#pqdt_stairs_material_values').val()) + parseInt($('#pqdt_roof_total_values').val()) + parseInt($('#pqdt_extra_led1_values').val()) + parseInt($('#pqdt_extra_approvals1_values').val()) + parseInt($('#pqdt_extra1_values').val()) + parseInt($('#pqdt_extra2_values').val()) + parseInt($('#pqdt_extra3_values').val())).toFixed(2));

$('#pqdt_total2_values').val((parseInt($('#pqdt_lead_generation_values').val()) + parseInt($('#pqdt_lead_converison_values').val())).toFixed(2));

$('#pqdt_op_total_values').val((parseInt($('#pqdt_charity_values').val()) + parseInt($('#pqdt_profit_values').val()) + parseInt($('#pqdt_insurance_values').val()) + parseInt($('#pqdt_office_other_values').val())+parseInt($('#pqdt_gross_profit_values').val())).toFixed(2));

$('#pqdt_ftotal2_values').val((parseInt($('#pqdt_total1_values').val()) + parseInt($('#pqdt_total2_values').val()) + parseInt($('#pqdt_op_total_values').val())).toFixed(2));
$('#pqdt_ftotal1_values').val($('#pqdt_ftotal2_values').val());
$('#pqdt_ftotal4_values').val((parseInt($('#pqdt_ftotal2_values').val()) - parseInt($('#pqdt_ftotal3_values').val())).toFixed(2));


$('#pqdt_decking_total_per').val(($('#pqdt_decking_total_values').val() / $('#pqdt_ftotal1_values').val() * 100).toFixed(2));
$('#pqdt_wrapping_total_per').val(($('#pqdt_wrapping_total_values').val() / $('#pqdt_ftotal1_values').val() * 100).toFixed(2));
$('#pqdt_subframe_total_per').val(($('#pqdt_subframe_total_values').val() / $('#pqdt_ftotal1_values').val() * 100).toFixed(2));
$('#pqdt_handrail_total_per').val(($('#pqdt_handrail_total_values').val() / $('#pqdt_ftotal1_values').val() * 100).toFixed(2));
$('#pqdt_stairs_material_per').val(($('#pqdt_stairs_material_values').val() / $('#pqdt_ftotal1_values').val() * 100).toFixed(2));
$('#pqdt_roof_total_per').val(($('#pqdt_roof_total_values').val() / $('#pqdt_ftotal1_values').val() * 100).toFixed(2));
$('#pqdt_extra_led1_per').val(($('#pqdt_extra_led1_values').val() / $('#pqdt_ftotal1_values').val() * 100).toFixed(2));
$('#pqdt_extra_approvals1_per').val(($('#pqdt_extra_approvals1_values').val() / $('#pqdt_ftotal1_values').val() * 100).toFixed(2));
$('#pqdt_extra1_per').val(($('#pqdt_extra1_values').val() / $('#pqdt_ftotal1_values').val() * 100).toFixed(2));
$('#pqdt_extra2_per').val(($('#pqdt_extra2_values').val() / $('#pqdt_ftotal1_values').val() * 100).toFixed(2));
$('#pqdt_extra3_per').val(($('#pqdt_extra3_values').val() / $('#pqdt_ftotal1_values').val() * 100).toFixed(2));
$('#pqdt_total1_per').val(($('#pqdt_total1_values').val() / $('#pqdt_ftotal1_values').val() * 100).toFixed(2));

$('#pqdt_lead_generation_per').val(($('#pqdt_lead_generation_values').val() / $('#pqdt_ftotal1_values').val() * 100).toFixed(2));
$('#pqdt_lead_converison_per').val(($('#pqdt_lead_converison_values').val() / $('#pqdt_ftotal1_values').val() * 100).toFixed(2));
$('#pqdt_total2_per').val(($('#pqdt_total2_values').val() / $('#pqdt_ftotal1_values').val() * 100).toFixed(2));

$('#pqdt_charity_per').val(($('#pqdt_charity_values').val() / $('#pqdt_ftotal1_values').val() * 100).toFixed(2));
$('#pqdt_profit_per').val(($('#pqdt_profit_values').val() / $('#pqdt_ftotal1_values').val() * 100).toFixed(2));
$('#pqdt_insurance_per').val(($('#pqdt_insurance_values').val() / $('#pqdt_ftotal1_values').val() * 100).toFixed(2));
$('#pqdt_office_other_per').val(($('#pqdt_office_other_values').val() / $('#pqdt_ftotal1_values').val() * 100).toFixed(2));
$('#pqdt_gross_profit_per').val(($('#pqdt_gross_profit_values').val() / $('#pqdt_ftotal1_values').val() * 100).toFixed(2));
$('#pqdt_op_total_per').val(($('#pqdt_op_total_values').val() / $('#pqdt_ftotal1_values').val() * 100).toFixed(2));

$('#pqdt_lead_generation1_values').val($('#pqdt_lead_generation_values').val());
$('#pqdt_lead_converison1_values').val($('#pqdt_lead_converison_values').val());
$('#pqdt_charity1_values').val($('#pqdt_charity_values').val());
$('#pqdt_profit1_values').val($('#pqdt_profit_values').val());
$('#pqdt_insurance1_values').val($('#pqdt_insurance_values').val());
$('#pqdt_office_other1_values').val($('#pqdt_office_other_values').val());

$('#pqdt_adjustment_values').val($('#pqdt_op_total_values').val());

$('#pqdt_decking_values').val(($('#pqdt_adjustment_values').val() * $('#pqdt_decking_per').val() / 100).toFixed(2));
$('#pqdt_wrapping_values').val(($('#pqdt_adjustment_values').val() * $('#pqdt_wrapping_per').val() / 100).toFixed(2));
$('#pqdt_sub_frame1_values').val(($('#pqdt_adjustment_values').val() * $('#pqdt_sub_frame1_per').val() / 100).toFixed(2));
$('#pqdt_handrail_values').val(($('#pqdt_adjustment_values').val() * $('#pqdt_handrail_per').val() / 100).toFixed(2));
$('#pqdt_stairs_values').val(($('#pqdt_adjustment_values').val() * $('#pqdt_stairs_per').val() / 100).toFixed(2));
$('#pqdt_roofing_values').val(($('#pqdt_adjustment_values').val() * $('#pqdt_roofing_per').val() / 100).toFixed(2));

$('#pqdt_must_per').val((parseInt($('#pqdt_decking_per').val()) + parseInt($('#pqdt_wrapping_per').val()) + parseInt($('#pqdt_sub_frame1_per').val()) + parseInt($('#pqdt_handrail_per').val()) + parseInt($('#pqdt_stairs_per').val()) + parseInt($('#pqdt_roofing_per').val())).toFixed(2));

$('#pqdt_must_values').val((parseInt($('#pqdt_decking_values').val()) + parseInt($('#pqdt_wrapping_values').val()) + parseInt($('#pqdt_sub_frame1_values').val()) + parseInt($('#pqdt_handrail_values').val()) + parseInt($('#pqdt_stairs_values').val()) + parseInt($('#pqdt_roofing_values').val())).toFixed(2));


$('#pqdt_decking_raw_materials_values').val($('#pqdt_decking_total_values').val());
$('#pqdt_decking_weight_adjustment_values').val($('#pqdt_decking_values').val());

$('#pqdt_wrapping_total1_values').val($('#pqdt_wrapping_total_values').val());
$('#pqdt_wrapping_adjustment_values').val($('#pqdt_wrapping_values').val());

$('#pqdt_sub_frame_values').val($('#pqdt_subframe_total_values').val());
$('#pqdt_subframe_adjustment_values').val($('#pqdt_sub_frame1_values').val());

$('#pqdt_handrail_total1_values').val($('#pqdt_handrail_total_values').val());
$('#pqdt_handrail_adjustment_values').val($('#pqdt_handrail_values').val());

$('#pqdt_stairs_total_values').val($('#pqdt_stairs_material_values').val());
$('#pqdt_stairs_adjustment_values').val($('#pqdt_stairs_values').val());

$('#pqdt_roof_total1_values').val($('#pqdt_roof_total_values').val());
$('#pqdt_roof_adjustment_values').val($('#pqdt_roofing_values').val());

$('#pqdt_extra_led2_values').val($('#pqdt_extra_led1_values').val());
$('#pqdt_extra_approvals2_values').val($('#pqdt_extra_approvals1_values').val());

$('#pqdt_extra11_values').val($('#pqdt_extra1_values').val());
$('#pqdt_extra22_values').val($('#pqdt_extra2_values').val());
$('#pqdt_extra33_values').val($('#pqdt_extra3_values').val());

$('#pqdt_total3_values').val((parseInt($('#pqdt_decking_raw_materials_values').val()) + parseInt($('#pqdt_decking_weight_adjustment_values').val()) +
							  parseInt($('#pqdt_wrapping_total1_values').val()) + parseInt($('#pqdt_wrapping_adjustment_values').val()) + 
							  parseInt($('#pqdt_sub_frame_values').val()) + parseInt($('#pqdt_subframe_adjustment_values').val()) +
							  parseInt($('#pqdt_handrail_total1_values').val()) + parseInt($('#pqdt_handrail_adjustment_values').val()) +
							  parseInt($('#pqdt_stairs_total_values').val()) + parseInt($('#pqdt_stairs_adjustment_values').val()) +
							  parseInt($('#pqdt_roof_total1_values').val()) + parseInt($('#pqdt_roof_adjustment_values').val()) +
							  parseInt($('#pqdt_extra_led2_values').val()) + parseInt($('#pqdt_extra_approvals2_values').val()) +
							  parseInt($('#pqdt_extra11_values').val()) + parseInt($('#pqdt_extra22_values').val()) + parseInt($('#pqdt_extra33_values').val())).toFixed(2));

$('#pqdt_decking_weight_adjustment_per').val((parseInt($('#pqdt_decking_raw_materials_values').val()) + parseInt($('#pqdt_decking_weight_adjustment_values').val())).toFixed(2));
$('#pqdt_wrapping_adjustment_per').val((parseInt($('#pqdt_wrapping_total1_values').val()) + parseInt($('#pqdt_wrapping_adjustment_values').val())).toFixed(2));
$('#pqdt_subframe_adjustment_per').val((parseInt($('#pqdt_sub_frame_values').val()) + parseInt($('#pqdt_subframe_adjustment_values').val())).toFixed(2));
$('#pqdt_handrail_adjustment_per').val((parseInt($('#pqdt_handrail_total1_values').val()) + parseInt($('#pqdt_handrail_adjustment_values').val())).toFixed(2));
$('#pqdt_stairs_adjustment_per').val((parseInt($('#pqdt_stairs_total_values').val()) + parseInt($('#pqdt_stairs_adjustment_values').val())).toFixed(2));
$('#pqdt_roof_adjustment_per').val((parseInt($('#pqdt_roof_total1_values').val()) + parseInt($('#pqdt_roof_adjustment_values').val())).toFixed(2));

$('#pqdt_extra_led2_per').val($('#pqdt_extra_led2_values').val());
$('#pqdt_extra_approvals2_per').val($('#pqdt_extra_approvals2_values').val());

$('#pqdt_extra11_per').val($('#pqdt_extra11_values').val());
$('#pqdt_extra22_per').val($('#pqdt_extra22_values').val());
$('#pqdt_extra33_per').val($('#pqdt_extra33_values').val());

$('#pqdt_total3_per').val((parseInt($('#pqdt_decking_weight_adjustment_per').val()) + parseInt($('#pqdt_wrapping_adjustment_per').val()) + 
						   parseInt($('#pqdt_subframe_adjustment_per').val()) + parseInt($('#pqdt_handrail_adjustment_per').val()) + 
						   parseInt($('#pqdt_stairs_adjustment_per').val()) + parseInt($('#pqdt_roof_adjustment_per').val()) + 
						   parseInt($('#pqdt_extra_led2_per').val()) + parseInt($('#pqdt_extra_approvals2_per').val()) +
						   parseInt($('#pqdt_extra11_per').val()) + parseInt($('#pqdt_extra22_per').val()) + parseInt($('#pqdt_extra33_per').val())).toFixed(2));

}

//********* End of Main Calculation *******//

////Decking/////
			
			  function calculate_dacking()
			  {
			  var tot1 = ($('#decking_insert').val() * $('#decking_cpslm1').val()).toFixed(2); 
			  $('#decking_total1').val(($('#decking_diff1').val() * tot1/100).toFixed(2)); 	
			  
			  var tot2 = ($('#decking_insert').val() * $('#decking_cpslm2').val()).toFixed(2); 
			  $('#decking_total2').val(($('#decking_diff2').val() * tot2/100).toFixed(2)); 
			  
			  var tot3 = ($('#decking_insert').val() * $('#decking_cpslm3').val()).toFixed(2); 
			  $('#decking_total3').val(($('#decking_diff3').val() * tot3/100).toFixed(2)); 	
						
			   var total = 0;
		       $('input.dtotals').each(function(){ total += parseFloat(this.value, 10); }); 
		       $('#decking_alltotal').val(total.toFixed(2));
			  
			   $('#labour_pts1').val($('#decking_pts').val());
			   $('#labour_pts2').val($('#decking_pts').val());
			   
			   $('#labour_toph1').val(parseFloat($('#labour_tlo1').val()) + parseFloat($('#labour_tmo1').val()) );
			    
			   $('#labour_tha1').val(($('#labour_pts1').val() / $('#labour_toph1').val()).toFixed(2)); 
			   $('#labour_total1').val(($('#labour_tha1').val() * $('#labour_thra1').val()).toFixed(2));
			   $('#labour_tha2').val(($('#labour_pts2').val() / $('#labour_sph2').val()).toFixed(2)); 
			   $('#labour_total2').val(($('#labour_tha2').val() * $('#labour_thra2').val()).toFixed(2));
			   var total1 = 0;
			   $('input.dtotals2').each(function(){ total1 += parseFloat(this.value, 10); }); 
			   $('#decking_alltotal2').val(total1.toFixed(2));
			   var total2 = 0;
			   $('input.subtotal').each(function(){ total2 += parseFloat(this.value, 10); }); 
			   $('#decking_alltotals').val(total2.toFixed(2));
			   	var url = $('#decking_calc_save').attr('alt');
				var bsn_id = $('#bsn_id').val();
				
			   $("#showdeckcalc").load(url+"/bsn_id/" + bsn_id + "/req/show");	
				}

			  $('#decking_calc').click(function(){ calculate_dacking(); });
			  
			  $('#decking_calculate_new').click(function(){ calculate_dacking(); });
					  
			  $('#decking_calc_save').click(function(){ 
			    var url = $('#decking_calc_save').attr('alt');
				var bsn_id = $('#bsn_id').val();
				var cd_type_id = $('#cd_type_id').val();
				var bdc_ptsqm = $('#decking_insert').val();
				var decking_alltotals = $('#decking_alltotals').val();
				
					
			  	$.post(url, { bsn_id: bsn_id, bdc_ptsqm: bdc_ptsqm, decking_alltotals: decking_alltotals, cd_type_id: cd_type_id })
				.done(function(data){
					alert("Data Saved Successfully.");
					$("#showdeckcalc").load(url+"/bsn_id/" + bsn_id + "/req/show");	
				});
				});
			  
			  function edit_deckingjs(val) 
					{		
						alert("Testing");			
						$('#decking_insert').val(val+'.00');
						calculate_dacking();
					}
			  function deletejs(id)
			  	{
				var url = $('#calcurl').val();
				var bsn_id = $('#bsn_id').val();
				$.get(url+"/req/delete/bdc_id/"+id, function(data) { $("#showdeckcalc").load(url+"/bsn_id/" + bsn_id + "/req/show"); });
				}
			  	
////Decking/////

/////Labour output and production costs//////			 
			   $('#decking_labourcost').click(function(){
			   $('#labour_pts1').val($('#decking_pts').val());
			   $('#labour_pts2').val($('#decking_pts').val());
 
			   $('#labour_tha1').val(($('#labour_pts1').val() / $('#labour_toph1').val()).toFixed(2)); 
			   $('#labour_total1').val(($('#labour_tha1').val() * $('#labour_thra1').val()).toFixed(2));
			   $('#labour_tha2').val(($('#labour_pts2').val() / $('#labour_sph2').val()).toFixed(2)); 
			   $('#labour_total2').val(($('#labour_tha2').val() * $('#labour_thra2').val()).toFixed(2));
			   var total1 = 0;
			   $('input.dtotals2').each(function(){ total1 += parseFloat(this.value, 10); }); 
			   $('#decking_alltotal2').val(total1.toFixed(2));
			   var total2 = 0;
			   $('input.subtotal').each(function(){ total2 += parseFloat(this.value, 10); }); 
			   $('#decking_alltotals').val(total2.toFixed(2));
			   });
			   
			   $('#add_labourcost_cal').click(function(){ $('#decking_tt').val($('#decking_alltotal').val()); });
/////Labour output and production costs//////

/////Wrapping//////
   			  $('#wrapping_wrmtotalcost').click(function(){
			  $('#wrapping_tm').val(($('#wrapping_wrm').val() * $('#wrapping_hmm').val()).toFixed(2)); 
			  $('#wrapping_ts').val(($('#wrapping_tm').val() / $('#wrapping_div').val()).toFixed(2));
			  $('#wrapping_tlm').val(($('#wrapping_ts').val() * $('#wrapping_lmps').val()).toFixed(2));
			  $('#wrapping_total').val(($('#wrapping_tlm').val() * $('#wrapping_lmrg').val()).toFixed(2));	
			  $('#wrapping_tq').val($('#wrapping_ts').val());
			  $('#wrapping_tsq1').val($('#wrapping_ts').val());
			  $('#wrapping_tsq2').val($('#wrapping_ts').val());
			  $('#wrapping_labour_js').val($('#wrapping_ts').val()); 
			  
			  $('#wrapping_totsqm').val($('#wrapping_tq').val()); 
			  $('#wrapping_totapf').val(($('#wrapping_cpsqm').val() * $('#wrapping_totsqm').val()).toFixed(2));	
			  
			  $('#wrapping_upj').val(($('#wrapping_tq').val() * $('#wrapping_nspq').val()).toFixed(2));		  
			  $('#wrapping_total1').val(($('#wrapping_cpu').val() * $('#wrapping_upj').val()).toFixed(2));	
			  $('#wrapping_plr').val(($('#wrapping_lps').val() * $('#wrapping_tsq1').val()).toFixed(2));	
			  $('#wrapping_total2').val(($('#wrapping_cpl').val() * $('#wrapping_plr').val()).toFixed(2));
			  
			  $('#wrapping_tu2').val(($('#wrapping_ups').val() * $('#wrapping_tsq2').val()).toFixed(2));
			  $('#wrapping_total3').val(($('#wrapping_tu2').val() * $('#wrapping_cpu2').val()).toFixed(2));	
			  var totalw = 0;
		   		$('input.wrapping_total').each(function(){ totalw += parseFloat(this.value, 10); }); 
		   $('#wrapping_alltotal').val(totalw.toFixed(2));
		   
		   $('#render_randerandpainted_alltotal').val((parseFloat($('#render_randerandpainted_labourtotal').val()) + parseFloat($('#render_randerandpainted_total').val()) + parseFloat($('#wrapping_alltotal').val()) + parseFloat($('#wrapping_labourtotal').val())).toFixed(2));
			  });
			  
			  
			$('#wrapping_labourcost').click(function(){
			  //$('#wrapping_labour_js').val($('#wrapping_ts').val());
			  $('#wrapping_labour_to').val((parseFloat($('#wrapping_labour_tlo').val()) + parseFloat($('#wrapping_labour_tmoph').val())).toFixed(2));
			  $('#wrapping_labour_tha').val(($('#wrapping_labour_js').val() / $('#wrapping_labour_to').val()).toFixed(2));
			  $('#wrapping_labour_bceg').val(($('#wrapping_labour_tha').val() * $('#wrapping_labour_thra').val()).toFixed(2)); 
			  $('#wrapping_labourtotal').val($('#wrapping_labour_bceg').val());
			  
			  $('#render_randerandpainted_alltotal').val((parseFloat($('#render_randerandpainted_labourtotal').val()) + parseFloat($('#render_randerandpainted_total').val()) + parseFloat($('#wrapping_alltotal').val()) + parseFloat($('#wrapping_labourtotal').val())).toFixed(2));
  			});
			
			
			$('#wrapping_labourcost2').click(function(){
			  $('#wrapping_tm2').val(($('#wrapping_wrm2').val() * $('#wrapping_hmm2').val()).toFixed(2)); 
			  $('#wrapping_ts2').val(($('#wrapping_tm2').val() / $('#wrapping_div2').val()).toFixed(2));
			  $('#wrapping_tlm2').val(($('#wrapping_ts2').val() * $('#wrapping_lmps2').val()).toFixed(2));
			  $('#wrapping_total22').val(($('#wrapping_tlm2').val() * $('#wrapping_lmrg2').val()).toFixed(2));	
			  $('#wrapping_tq2').val($('#wrapping_ts2').val());
			  $('#wrapping_tsq12').val($('#wrapping_ts2').val());
			  $('#wrapping_tsq22').val($('#wrapping_ts2').val());
			  $('#wrapping_labour_js2').val($('#wrapping_ts2').val()); 
			  $('#wrapping_upj2').val(($('#wrapping_tq2').val() * $('#wrapping_nspq2').val()).toFixed(2));		  
			  $('#wrapping_total12').val(($('#wrapping_cpu22').val() * $('#wrapping_upj2').val()).toFixed(2));	
			  $('#wrapping_plr2').val(($('#wrapping_lps2').val() * $('#wrapping_tsq12').val()).toFixed(2));	
			  $('#wrapping_total222').val(($('#wrapping_cpl2').val() * $('#wrapping_plr2').val()).toFixed(2));
			  
			  $('#wrapping_tu22').val(($('#wrapping_ups2').val() * $('#wrapping_tsq22').val()).toFixed(2));
			  $('#wrapping_total4').val(($('#wrapping_tu22').val() * $('#wrapping_cpu222').val()).toFixed(2)); 	
			 	   var totalw = 0;
				   $('input.wrapping_total22').each(function(){ totalw += parseFloat(this.value, 10); }); 
				   $('#wrapping_labourtotal2').val(totalw.toFixed(2));
			$('#render_randerandpainted_alltotal').val((parseFloat($('#render_randerandpainted_labourtotal').val()) + parseFloat($('#render_randerandpainted_total').val()) + parseFloat($('#wrapping_alltotal').val()) + parseFloat($('#wrapping_labourtotal').val())).toFixed(2));
			  });
			
			  $('#wrapping_labourcost22').click(function(){
			  //$('#wrapping_labour_js2').val($('#wrapping_ts2').val());
			  $('#wrapping_labour_to2').val((parseFloat($('#wrapping_labour_tlo2').val()) + parseFloat($('#wrapping_labour_tmoph2').val())).toFixed(2));
			  $('#wrapping_labour_tha2').val(($('#wrapping_labour_js2').val() / $('#wrapping_labour_to2').val()).toFixed(2));
			  $('#wrapping_labour_bceg2').val(($('#wrapping_labour_tha2').val() * $('#wrapping_labour_thra2').val()).toFixed(2)); 
			  $('#wrapping_labourtotal22').val($('#wrapping_labour_bceg2').val());
			  
			$('#render_randerandpainted_alltotal').val((parseFloat($('#render_randerandpainted_labourtotal').val()) + parseFloat($('#render_randerandpainted_total').val()) + parseFloat($('#wrapping_alltotal').val()) + parseFloat($('#wrapping_labourtotal').val())).toFixed(2));
  			});
			
			  $('#render_subframe_labourcost').click(function(){
			  $('#render_subframe_tlmr').val((parseFloat($('#render_subframe_ps').val()) * parseFloat($('#render_subframe_lmps').val())).toFixed(2));
			  $('#render_blue_ps').val($('#render_subframe_ps').val());
			  $('#render_paint_ps').val($('#render_subframe_ps').val());
			  $('#render_acrylic_ps').val($('#render_subframe_ps').val());
			  $('#render_screws_ps').val($('#render_subframe_ps').val());
		
			  $('#render_subframe_total1').val(($('#render_subframe_cplm').val() * $('#render_subframe_tlmr').val()).toFixed(2));
			  $('#render_blue_total1').val(($('#render_blue_cps').val() * $('#render_blue_ps').val()).toFixed(2)); 
			  $('#render_paint_total1').val(($('#render_paint_cps').val() * $('#render_paint_ps').val()).toFixed(2)); 
			  $('#render_acrylic_total1').val(($('#render_acrylic_cps').val() * $('#render_acrylic_ps').val()).toFixed(2)); 
			  $('#render_screws_total1').val(($('#render_screws_cps').val() * $('#render_screws_ps').val()).toFixed(2)); 
			  
			var totalrp = 0;
			$('input.render_paint_total').each(function(){ totalrp += parseFloat(this.value, 10); }); 
			$('#render_randerandpainted_labourtotal').val(totalrp.toFixed(2));	  
  	
			$('#render_randerandpainted_ps').val($('#render_subframe_ps').val());
			$('#render_randerandpainted_th').val(($('#render_randerandpainted_ps').val() / $('#render_randerandpainted_to').val()).toFixed(2));
			$('#render_randerandpainted_total').val(($('#render_randerandpainted_th').val() * $('#render_randerandpainted_ha').val()).toFixed(2));  
			$('#render_randerandpainted_total1').val($('#render_randerandpainted_total').val());
			
			$('#render_randerandpainted_alltotal').val((parseFloat($('#render_randerandpainted_labourtotal').val()) + parseFloat($('#render_randerandpainted_total').val()) + parseFloat($('#wrapping_alltotal').val()) + parseFloat($('#wrapping_labourtotal').val())).toFixed(2));		
			});
/////Wrapping//////			
			
///////Sub Frame////////			
			 $('#subframe_treated_pine_cost').click(function(){
			 $('#subframe_treated_pine_total1').val(($('#subframe_treated_pine_cps').val() * $('#subframe_treated_pine_pts1').val()).toFixed(2));
			 $('#subframe_treated_pine_pts2').val($('#subframe_treated_pine_pts1').val());
			 $('#subframe_treated_pine_pts3').val($('#subframe_treated_pine_pts1').val());
			 $('#subframe_treated_pine_pts4').val($('#subframe_treated_pine_pts1').val());
			 $('#subframe_treated_pine_pts5').val($('#subframe_treated_pine_pts1').val());
			 $('#subframe_treated_pine_pts6').val($('#subframe_treated_pine_pts1').val());
			 $('#subframelabour_treated_js').val($('#subframe_treated_pine_pts1').val());
			 $('#subframelabour_treated_jsdp').val($('#subframe_treated_pine_pts1').val());
			 
			 /*$('#subframeraw_design_pts').val($('#subframe_treated_pine_pts1').val());*/
			 
			 $('#subframe_treated_pine_tbp').val(($('#subframe_treated_pine_bps').val() * $('#subframe_treated_pine_pts1').val()).toFixed(2));
			 $('#subframe_treated_pine_total2').val(($('#subframe_treated_pine_tbp').val() * $('#subframe_treated_pine_cpb').val()).toFixed(2));
			 $('#subframe_treated_pine_tpu').val(($('#subframe_treated_pine_ups').val() * $('#subframe_treated_pine_pts3').val()).toFixed(2)); 
			 $('#subframe_treated_pine_total3').val(($('#subframe_treated_pine_cpuinc').val() * $('#subframe_treated_pine_tpu').val()).toFixed(2));  
			 $('#subframe_treated_pine_total4').val(($('#subframe_treated_pine_cps1').val() * $('#subframe_treated_pine_pts4').val()).toFixed(2));
			 $('#subframe_treated_pine_total5').val(($('#subframe_treated_pine_cpu1').val() * $('#subframe_treated_pine_pts5').val()).toFixed(2));
			 
			 var totalsb = 0;
			 $('input.subframe_treated_pine_total').each(function(){ totalsb += parseFloat(this.value, 10); }); 
			 $('#subframe_treated_pine_subtotal1').val(totalsb.toFixed(2));	 
			 $('#subframe_treated_pine_woodgray').val(($('#subframe_treated_pine_subtotal1').val() / $('#subframe_treated_pine_pts6').val()).toFixed(2));  
			 
			 var alltotaltim = 0;
			$('input.sub_frame_ldp').each(function(){ alltotaltim += parseFloat(this.value, 10); }); 
			$('#subframe_randerandpainted_alltotal').val(alltotaltim.toFixed(2));
			 });
			
			 $('#subframelabour_treated_clac').click(function(){
			 $('#subframelabour_treated_toph').val((parseFloat($('#subframelabour_treated_tlsoph').val()) + parseFloat($('#subframelabour_treated_tmsoph').val())).toFixed(2));		
			 $('#subframelabour_treated_tha').val(($('#subframelabour_treated_js').val() / $('#subframelabour_treated_toph').val()).toFixed(2));
			 $('#subframelabour_treated_bceg').val(($('#subframelabour_treated_tha').val() * $('#subframelabour_treated_thra').val()).toFixed(2)); 
			 
			 /*$('#subframelabour_treated_toph1').val((parseFloat($('#subframelabour_treated_tlsoph1').val()) + parseFloat($('#subframelabour_treated_tmsoph1').val())).toFixed(2));		
			 $('#subframelabour_treated_tha1').val(($('#subframelabour_treated_jsdp').val() / $('#subframelabour_treated_toph1').val()).toFixed(2));
			 $('#subframelabour_treated_bceg1').val(($('#subframelabour_treated_tha1').val() * $('#subframelabour_treated_thra1').val()).toFixed(2)); 
			 $('#subframelabour_treated_subtotal1').val((parseFloat($('#subframelabour_treated_bceg').val()) + parseFloat($('#subframelabour_treated_bceg1').val())).toFixed(2));
			 $('#subframelabour_treated_subtotal2').val(($('#subframelabour_treated_subtotal1').val() / $('#subframelabour_treated_jsdp').val()).toFixed(2));*/
			 
			 $('#subframelabour_treated_subtotal1').val(parseFloat($('#subframelabour_treated_bceg').val()).toFixed(2));
			  var alltotaltim = 0;
			$('input.sub_frame_ldp').each(function(){ alltotaltim += parseFloat(this.value, 10); }); 
			$('#subframe_randerandpainted_alltotal').val(alltotaltim.toFixed(2));
			
			 });
			
			 $('#subframelabour_design_clac').click(function(){
			 $('#subframeraw_design_total1').val(($('#subframeraw_design_cps').val() * $('#subframeraw_design_pts').val()).toFixed(2));
			 $('#subframeraw_design_pts2').val($('#subframeraw_design_pts').val());
			 $('#subframeraw_design_pts3').val($('#subframeraw_design_pts').val());
			 $('#subframeraw_design_pts4').val($('#subframeraw_design_pts').val());
			 $('#subframeraw_design_pts5').val($('#subframeraw_design_pts').val());
			 $('#subframeraw_design_pts6').val($('#subframeraw_design_pts').val());
			 $('#subframelabour_design_js').val(parseFloat($('#subframeraw_design_pts').val()).toFixed(2)); 
			 $('#subframelabour_design_js1').val(parseFloat($('#subframeraw_design_pts').val()).toFixed(2)); 
			    
			 $('#subframeraw_design_tbp').val(($('#subframeraw_design_bps').val() * $('#subframeraw_design_pts2').val()).toFixed(2));
			 $('#subframeraw_design_total2').val(($('#subframeraw_design_tbp').val() * $('#subframeraw_design_cpb').val()).toFixed(2));
			 $('#subframeraw_design_tpu').val(($('#subframeraw_design_ups').val() * $('#subframeraw_design_pts3').val()).toFixed(2));
			 $('#subframeraw_design_total3').val(($('#subframeraw_design_cpu').val() * $('#subframeraw_design_tpu').val()).toFixed(2));
			 $('#subframeraw_design_total4').val(($('#subframeraw_design_cpsig').val() * $('#subframeraw_design_pts4').val()).toFixed(2));
			 $('#subframeraw_design_total5').val(($('#subframeraw_design_cpstg').val() * $('#subframeraw_design_pts5').val()).toFixed(2));
			 var totalsd = 0;
			 $('input.subframeraw_design_total').each(function(){ totalsd += parseFloat(this.value, 10); }); 
			 $('#subframeraw_design_subtotal').val(totalsd.toFixed(2));	 
			 var alltotaltim = 0;
			$('input.sub_frame_ldp').each(function(){ alltotaltim += parseFloat(this.value, 10); }); 
			$('#subframe_randerandpainted_alltotal').val(alltotaltim.toFixed(2));
			 
			 });
			
			 $('#subframelabour_designpine_clac').click(function(){
			 $('#subframelabour_design_toph').val((parseFloat($('#subframelabour_design_tlsqph').val()) + parseFloat($('#subframelabour_design_tmsqph').val())).toFixed(2));	
			 $('#subframelabour_design_js1').val($('#subframelabour_design_js').val());
			 $('#subframelabour_design_tha').val(($('#subframelabour_design_js').val() / $('#subframelabour_design_toph').val()).toFixed(2)); 
			 $('#subframelabour_design_bceg').val(($('#subframelabour_design_tha').val() * $('#subframelabour_design_thra').val()).toFixed(2));
			 $('#subframelabour_design_toph1').val((parseFloat($('#subframelabour_design_tlsqph1').val()) + parseFloat($('#subframelabour_design_tmsqph1').val())).toFixed(2));	
			 $('#subframelabour_design_tha1').val(($('#subframelabour_design_js1').val() / $('#subframelabour_design_toph1').val()).toFixed(2)); 
			 $('#subframelabour_design_bceg1').val(($('#subframelabour_design_tha1').val() * $('#subframelabour_design_thra1').val()).toFixed(2));
			 $('#subframelabour_design_subtotal').val((parseFloat($('#subframelabour_design_bceg').val()) + parseFloat($('#subframelabour_design_bceg1').val())).toFixed(2)); 
			 
			 var alltotaltim = 0;
			$('input.sub_frame_ldp').each(function(){ alltotaltim += parseFloat(this.value, 10); }); 
			$('#subframe_randerandpainted_alltotal').val(alltotaltim.toFixed(2));
			 
			 });
			 
			 $('#subframeconcrete_rawmaterials_clac').click(function(){
			 $('#subframeconcrete_rawmaterials_tlm1').val(($('#subframeconcrete_rawmaterials_mups1').val() * $('#subframeconcrete_rawmaterials_as1').val()).toFixed(2));
			 $('#subframeconcrete_rawmaterials_as2').val($('#subframeconcrete_rawmaterials_as1').val());
			 $('#subframeconcrete_rawmaterials_as3').val($('#subframeconcrete_rawmaterials_as1').val());
			 $('#subframeconcrete_rawmaterials_as4').val($('#subframeconcrete_rawmaterials_as1').val());
			 $('#subframeconcrete_rawmaterials_as5').val($('#subframeconcrete_rawmaterials_as1').val()); 
			 $('#subframeconcrete_rawmaterials_tlm2').val(($('#subframeconcrete_rawmaterials_mups2').val() * $('#subframeconcrete_rawmaterials_as2').val()).toFixed(2));
			 $('#subframeconcrete_rawmaterials_tlm3').val(($('#subframeconcrete_rawmaterials_mups3').val() * $('#subframeconcrete_rawmaterials_as3').val()).toFixed(2));
			 $('#subframeconcrete_rawmaterials_tlm4').val(($('#subframeconcrete_rawmaterials_mups4').val() * $('#subframeconcrete_rawmaterials_as4').val()).toFixed(2));
			 $('#subframeconcrete_rawmaterials_tlm5').val(($('#subframeconcrete_rawmaterials_as5').val() / $('#subframeconcrete_rawmaterials_mups5').val()).toFixed(2));
			 $('#subframeconcrete_rawmaterials_total1').val(($('#subframeconcrete_rawmaterials_cplm1').val() * $('#subframeconcrete_rawmaterials_tlm1').val()).toFixed(2));
			 $('#subframeconcrete_rawmaterials_total2').val(($('#subframeconcrete_rawmaterials_cplm2').val() * $('#subframeconcrete_rawmaterials_tlm2').val()).toFixed(2));
			 $('#subframeconcrete_rawmaterials_total3').val(($('#subframeconcrete_rawmaterials_cplm3').val() * $('#subframeconcrete_rawmaterials_tlm3').val()).toFixed(2));
			 $('#subframeconcrete_rawmaterials_total4').val(($('#subframeconcrete_rawmaterials_cplm4').val() * $('#subframeconcrete_rawmaterials_tlm4').val()).toFixed(2));
			 $('#subframeconcrete_rawmaterials_total5').val(($('#subframeconcrete_rawmaterials_cplm5').val() * $('#subframeconcrete_rawmaterials_tlm5').val()).toFixed(2));
			 var totalsbc = 0;
			 $('input.subframeconcrete_rawmaterials_total').each(function(){ totalsbc += parseFloat(this.value, 10); }); 
			 $('#subframeconcrete_rawmaterials_total').val(totalsbc.toFixed(2));	 	
			 $('#subframeconcrete_rawmaterials_per').val(($('#subframeconcrete_rawmaterials_total').val() / $('#subframeconcrete_rawmaterials_as1').val()).toFixed(2));	
			 
			 var alltotaltim = 0;
			$('input.sub_frame_ldp').each(function(){ alltotaltim += parseFloat(this.value, 10); }); 
			$('#subframe_randerandpainted_alltotal').val(alltotaltim.toFixed(2));
			 
			 });
			 
			 $('#subframeporch_rawmaterials_clac').click(function(){
			 $('#subframeporch_rawmaterials_tas').val($('#subframeconcrete_rawmaterials_as1').val());
			 $('#subframeporch_rawmaterials_tosph').val((parseFloat($('#subframeporch_rawmaterials_tloph').val()) + parseFloat($('#subframeporch_rawmaterials_tmoph').val())).toFixed(2)); 
			 $('#subframeporch_rawmaterials_thr').val(($('#subframeporch_rawmaterials_tas').val() / $('#subframeporch_rawmaterials_tosph').val()).toFixed(2));
			 $('#subframeporch_rawmaterials_total').val(($('#subframeporch_rawmaterials_thr').val() * $('#subframeporch_rawmaterials_cphl').val()).toFixed(2));
			 $('#subframeporch_rawmaterials_dtotal').val(($('#subframeporch_rawmaterials_total').val() / $('#subframeporch_rawmaterials_tas').val()).toFixed(2));
			 
			 var alltotaltim = 0;
			$('input.sub_frame_ldp').each(function(){ alltotaltim += parseFloat(this.value, 10); }); 
			$('#subframe_randerandpainted_alltotal').val(alltotaltim.toFixed(2));
			 
			 });
			 
		     $('#subframetimber_rawmaterials_calc').click(function(){	 
			 $('#subframetimber_rawmaterials_plm1').val(($('#subframetimber_rawmaterials_lmps1').val() * $('#subframetimber_rawmaterials_pts1').val()).toFixed(2));
			 $('#subframetimber_rawmaterials_pts2').val($('#subframetimber_rawmaterials_pts1').val());
			 $('#subframetimber_rawmaterials_pts3').val($('#subframetimber_rawmaterials_pts1').val());
			 $('#subframetimber_rawmaterials_pts4').val($('#subframetimber_rawmaterials_pts1').val());
			 $('#subframetimber_rawmaterials_pts5').val($('#subframetimber_rawmaterials_pts1').val());
			 $('#subframetimber_rawmaterials_pts6').val($('#subframetimber_rawmaterials_pts1').val());
			 $('#subframetimber_rawmaterials_pts7').val($('#subframetimber_rawmaterials_pts1').val());
			 $('#subframetimber_rawmaterials_pts8').val($('#subframetimber_rawmaterials_pts1').val());
			 $('#subframetimber_rawmaterials_total1').val(($('#subframetimber_rawmaterials_pplm1').val() * $('#subframetimber_rawmaterials_plm1').val()).toFixed(2));
			 $('#subframetimber_rawmaterials_plm2').val(($('#subframetimber_rawmaterials_lmps2').val() * $('#subframetimber_rawmaterials_pts2').val()).toFixed(2));
			 $('#subframetimber_rawmaterials_total2').val(($('#subframetimber_rawmaterials_pplm2').val() * $('#subframetimber_rawmaterials_plm2').val()).toFixed(2));
			 $('#subframetimber_rawmaterials_plm3').val(($('#subframetimber_rawmaterials_lmps3').val() * $('#subframetimber_rawmaterials_pts3').val()).toFixed(2));
			 $('#subframetimber_rawmaterials_total3').val(($('#subframetimber_rawmaterials_pplm3').val() * $('#subframetimber_rawmaterials_plm3').val()).toFixed(2));
			 $('#subframetimber_rawmaterials_plm4').val(($('#subframetimber_rawmaterials_lmps4').val() * $('#subframetimber_rawmaterials_pts4').val()).toFixed(2));
			 $('#subframetimber_rawmaterials_total4').val(($('#subframetimber_rawmaterials_pts4').val() * $('#subframetimber_rawmaterials_plm4').val()).toFixed(2));
			 $('#subframetimber_rawmaterials_plm5').val(($('#subframetimber_rawmaterials_lmps5').val() * $('#subframetimber_rawmaterials_pts5').val()).toFixed(2));
			 $('#subframetimber_rawmaterials_total5').val(($('#subframetimber_rawmaterials_pplm5').val() * $('#subframetimber_rawmaterials_plm5').val()).toFixed(2));
			 $('#subframetimber_rawmaterials_total6').val(($('#subframetimber_rawmaterials_pplm6').val() * $('#subframetimber_rawmaterials_pts6').val()).toFixed(2));
			 $('#subframetimber_rawmaterials_total7').val(($('#subframetimber_rawmaterials_pplm7').val() * $('#subframetimber_rawmaterials_pts7').val()).toFixed(2));
			 $('#subframetimber_rawmaterials_plm8').val(($('#subframetimber_rawmaterials_lmps8').val() * $('#subframetimber_rawmaterials_pts8').val()).toFixed(2));
			 $('#subframetimber_rawmaterials_total8').val(($('#subframetimber_rawmaterials_pplm8').val() * $('#subframetimber_rawmaterials_plm8').val()).toFixed(2)); 
			  var totaltim = 0;
			 $('input.subframeporch_rawmaterials').each(function(){ totaltim += parseFloat(this.value, 10); }); 
			 $('#subframetimber_rawmaterials_alltotal').val(totaltim.toFixed(2));	
			 
			 var alltotaltim = 0;
			$('input.sub_frame_ldp').each(function(){ alltotaltim += parseFloat(this.value, 10); }); 
			$('#subframe_randerandpainted_alltotal').val(alltotaltim.toFixed(2));
			 });	 
			 
			$('#subframedp_rawmaterials_calc').click(function(){	
			$('#subframedp_rawmaterials_js1').val($('#subframetimber_rawmaterials_pts1').val());
			/*$('#subframedp_rawmaterials_js2').val($('#subframetimber_rawmaterials_pts1').val());*/
			$('#subframedp_rawmaterials_js3').val($('#subframetimber_rawmaterials_pts1').val());
			 
			$('#subframedp_rawmaterials_toph1').val((parseFloat($('#subframedp_rawmaterials_tloph1').val()) + parseFloat($('#subframedp_rawmaterials_tmoph1').val())).toFixed(2)); 
			$('#subframedp_rawmaterials_tha1').val(($('#subframedp_rawmaterials_js1').val() / $('#subframedp_rawmaterials_toph1').val()).toFixed(2));	 	
			$('#subframedp_rawmaterials_bceg1').val(($('#subframedp_rawmaterials_tha1').val() * $('#subframedp_rawmaterials_thra1').val()).toFixed(2));	
			/*$('#subframedp_rawmaterials_tha2').val((parseFloat($('#subframedp_rawmaterials_tmoph2').val())* parseFloat($('#subframedp_rawmaterials_js2').val())).toFixed(2)); */
			/*$('#subframedp_rawmaterials_bceg2').val(($('#subframedp_rawmaterials_tha2').val() * $('#subframedp_rawmaterials_thra2').val()).toFixed(2));	*/
			
		    $('#subframedp_rawmaterials_toph3').val((parseFloat($('#subframedp_rawmaterials_tloph3').val()) + parseFloat($('#subframedp_rawmaterials_tmoph3').val())).toFixed(2)); 
			$('#subframedp_rawmaterials_tha3').val(($('#subframedp_rawmaterials_js3').val() / $('#subframedp_rawmaterials_toph3').val()).toFixed(2));	
			$('#subframedp_rawmaterials_bceg3').val(($('#subframedp_rawmaterials_tha3').val() * $('#subframedp_rawmaterials_thra3').val()).toFixed(2));	
			$('#subframedp_rawmaterials_allbceg').val((parseFloat($('#subframedp_rawmaterials_bceg1').val()) + parseFloat($('#subframedp_rawmaterials_bceg3').val())).toFixed(2));
			 
			var alltotaltim = 0;
			$('input.sub_frame_ldp').each(function(){ alltotaltim += parseFloat(this.value, 10); }); 
			$('#subframe_randerandpainted_alltotal').val(alltotaltim.toFixed(2));	
			});
			
			$('#subframe_total_assign_to_sheet1').click(function(){	
			$('#pqdt_subframe_total_values').val($('#subframe_randerandpainted_alltotal').val());
			alert("Successfully inserted to job sheet");
			});
			
			$('#subframe_total_assign_to_sheet2').click(function(){	
			$('#pqdt_subframe_total_values').val($('#subframe_randerandpainted_alltotal').val());
			alert("Successfully inserted to job sheet");
			});
				
			$('#subframe_total_assign_to_sheet3').click(function(){	
			$('#pqdt_subframe_total_values').val($('#subframe_randerandpainted_alltotal').val());
			alert("Successfully inserted to job sheet");
			});
				
			$('#subframe_total_assign_to_sheet4').click(function(){	
			$('#pqdt_subframe_total_values').val($('#subframe_randerandpainted_alltotal').val());
			alert("Successfully inserted to job sheet");
			});
				
			$('#subframe_total_assign_to_sheet5').click(function(){	
			$('#pqdt_subframe_total_values').val($('#subframe_randerandpainted_alltotal').val());
			alert("Successfully inserted to job sheet");
			});
				
			$('#subframe_total_assign_to_sheet6').click(function(){	
			$('#pqdt_subframe_total_values').val($('#subframe_randerandpainted_alltotal').val());
			alert("Successfully inserted to job sheet");
			});
				
			$('#subframe_total_assign_to_sheet7').click(function(){	
			$('#pqdt_subframe_total_values').val($('#subframe_randerandpainted_alltotal').val());
			alert("Successfully inserted to job sheet");
			});
				
			$('#subframe_total_assign_to_sheet8').click(function(){	
			$('#pqdt_subframe_total_values').val($('#subframe_randerandpainted_alltotal').val());
			alert("Successfully inserted to job sheet");
			});
			
			
///////Sub Frame////////

///////Handrail////////
			$('#handrailanr_calc').click(function(){
			var handraltotal = 0.00;			
			for(i=1; i < 14; i++){
				var subtot = ($('#handrailanr_lm'+i).val() * $('#handrailanr_lmr'+i).val()).toFixed(2);
				$('#handrailanr_proj'+i).val(subtot);
				$('#handrailanr_ah'+i).val(($('#handrailanr_lm'+i).val() / $('#handrailanr_lmta'+i).val()).toFixed(2));
				$('#handrailanr_la'+i).val(($('#handrailanr_ah'+i).val() * $('#handrailanr_thr'+i).val()).toFixed(2));
				$('#handrailanr_rma'+i).val((parseFloat($('#handrailanr_proj'+i).val()) - parseFloat($('#handrailanr_la'+i).val())).toFixed(2)); 
				$('#handrailanr_rmplm'+i).val(($('#handrailanr_rma'+i).val() / $('#handrailanr_lm'+i).val()).toFixed(2));
				$('#handrailanr_laplm'+i).val((parseFloat($('#handrailanr_lmr'+i).val()) - parseFloat($('#handrailanr_rmplm'+i).val())).toFixed(2)); 
					handraltotal += parseFloat(subtot, 10);		 
				}
				$('#handrailanr_alltotal').val(handraltotal.toFixed(2));
				$('#timberscreening_alltotals').val((parseFloat($('#handrailanr_alltotal').val()) + parseFloat($('#timberscreeningh_alltotal').val()) + parseFloat($('#timberscreeninghl_alltotal').val())).toFixed(2));
			}); 

			$('#timberscreeningh_calc').click(function(){ 
			var timberscreeninghtotal = 0.00;
				for(i=1; i < 5; i++){
					$('#timberscreeningh_hm'+i).val($('#timberscreeningh_hm1').val());
					$('#timberscreeningh_tlm'+i).val(($('#timberscreeningh_lmplm'+i).val() * $('#timberscreeningh_hm'+i).val()).toFixed(2));
					var subtot = ($('#timberscreeningh_tlm'+i).val() * $('#timberscreeningh_cplm'+i).val()).toFixed(2);
					$('#timberscreeningh_total'+i).val(subtot);
					timberscreeninghtotal += parseFloat(subtot, 10);		 
				}	
			$('#timberscreeningh_hm5').val($('#timberscreeningh_hm1').val());
			$('#timberscreeningh_lmplm5').val(($('#timberscreeningh_hm5').val() * $('#timberscreeningh_cplm5').val()).toFixed(2));
			$('#timberscreeningh_total5').val(($('#timberscreeningh_cpl5').val() * $('#timberscreeningh_lmplm5').val()).toFixed(2));
			$('#timberscreeningh_alltotal').val((timberscreeninghtotal + parseFloat($('#timberscreeningh_total5').val())).toFixed(2));	
			$('#timberscreening_alltotals').val((parseFloat($('#handrailanr_alltotal').val()) + parseFloat($('#timberscreeningh_alltotal').val()) + parseFloat($('#timberscreeninghl_alltotal').val())).toFixed(2));	
			});
			
			$('#timberscreeninghl_calc').click(function(){ 
			$('#timberscreeninghl_hm').val($('#timberscreeningh_hm1').val());
			$('#timberscreeninghl_hm1').val($('#timberscreeningh_hm1').val());
			$('#timberscreeninghl_thr').val(($('#timberscreeninghl_hm').val() / $('#timberscreeninghl_lmph').val()).toFixed(2));
			$('#timberscreeninghl_thr1').val(($('#timberscreeninghl_hm1').val() / $('#timberscreeninghl_lmph1').val()).toFixed(2));
			$('#timberscreeninghl_th').val(($('#timberscreeninghl_thr1').val() / $('#timberscreeninghl_to').val()).toFixed(2));
			
			$('#timberscreeninghl_total').val(($('#timberscreeninghl_thr').val() * $('#timberscreeninghl_cphl').val()).toFixed(2));
			$('#timberscreeninghl_total1').val(($('#timberscreeninghl_cphl').val() * $('#timberscreeninghl_th').val()).toFixed(2));
			$('#timberscreeninghl_alltotal').val((parseFloat($('#timberscreeninghl_total').val()) + parseFloat($('#timberscreeninghl_total1').val())).toFixed(2)); 
			
			
			$('#timberscreening_alltotals').val((parseFloat($('#handrailanr_alltotal').val()) + parseFloat($('#timberscreeningh_alltotal').val()) + parseFloat($('#timberscreeninghl_alltotal').val())).toFixed(2));
			});
						
			$('#handrail_total_assign_to_sheet1').click(function(){	
			$('#pqdt_handrail_total_values').val($('#timberscreening_alltotals').val());
			alert("Successfully inserted to job sheet");
			});
			
			$('#handrail_total_assign_to_sheet2').click(function(){	
			$('#pqdt_handrail_total_values').val($('#timberscreening_alltotals').val());
			alert("Successfully inserted to job sheet");
			});
			
			$('#handrail_total_assign_to_sheet3').click(function(){	
			$('#pqdt_handrail_total_values').val($('#timberscreening_alltotals').val());
			alert("Successfully inserted to job sheet");
			});
			
			
///////Handrail////////	
///////Stairs////////	
			$('#stairs_calc1').click(function(){ 
				var stairstotal = 0.00;
				for(i=1; i <= 3; i++){	
					$('#stairs_lmm'+i).val(($('#stairs_hmm'+i).val() * $('#stairs_multi'+i).val()).toFixed(2));
					$('#stairs_tmm'+i).val(($('#stairs_lmm'+i).val() * $('#stairs_wmm'+i).val()).toFixed(2));
					$('#stairs_sqm'+i).val(($('#stairs_tmm'+i).val() / $('#stairs_div'+i).val()).toFixed(6));
					var subtot = ($('#stairs_sqm'+i).val() * $('#stairs_rps'+i).val()).toFixed(2);
					$('#stairs_pc'+i).val(subtot);
					stairstotal += parseFloat(subtot, 10);
					$('#stairs_lsqm'+i).val($('#stairs_sqm'+i).val());		 
					$('#stairs_totalhours'+i).val(($('#stairs_lsqm'+i).val() / $('#stairs_total'+i).val()).toFixed(6));
					
					$('#stairs_ltotal'+i).val(($('#stairs_totalhours'+i).val() * $('#stairs_costperhour'+i).val()).toFixed(2));
				}	
				/*$('#stairs_subtotal').val(stairstotal.toFixed(2));*/
			$('#stairs_subtotal').val(parseFloat($('#stairs_ltotal1').val(),2) + parseFloat($('#stairs_ltotal2').val(),2) + parseFloat($('#stairs_ltotal3').val(),2) + stairstotal);
			$('#stairs_alltotals').val((parseFloat($('#stairs_subtotal').val()) + parseFloat($('#stairs_subtotal2').val()) + parseFloat($('#stairs_subtotal3').val()) + parseFloat($('#stairs_subtotal4').val())).toFixed(2)); 
			});
			
			$('#stairs_calc2').click(function(){ 
				var stairstotal = 0.00;
				for(i=4; i <= 6; i++){	
					$('#stairs_lmm'+i).val(($('#stairs_hmm'+i).val() * $('#stairs_multi'+i).val()).toFixed(2));
					$('#stairs_tmm'+i).val(($('#stairs_lmm'+i).val() * $('#stairs_wmm'+i).val()).toFixed(2));
					$('#stairs_sqm'+i).val(($('#stairs_tmm'+i).val() / $('#stairs_div'+i).val()).toFixed(6));
					var subtot = ($('#stairs_sqm'+i).val() * $('#stairs_rps'+i).val()).toFixed(2);
					$('#stairs_pc'+i).val(subtot);
					stairstotal += parseFloat(subtot, 10);	
					
					$('#stairs_lsqm'+i).val($('#stairs_sqm'+i).val());		 
					$('#stairs_totalhours'+i).val(($('#stairs_lsqm'+i).val() / $('#stairs_total'+i).val()).toFixed(6));	 
					$('#stairs_ltotal'+i).val(($('#stairs_totalhours'+i).val() * $('#stairs_costperhour'+i).val()).toFixed(2));
				}	
		   $('#stairs_subtotal2').val(parseFloat($('#stairs_ltotal4').val(),2) + parseFloat($('#stairs_ltotal5').val(),2) + parseFloat($('#stairs_ltotal6').val(),2) + stairstotal);
		  $('#stairs_alltotals').val((parseFloat($('#stairs_subtotal').val()) + parseFloat($('#stairs_subtotal2').val()) + parseFloat($('#stairs_subtotal3').val()) + parseFloat($('#stairs_subtotal4').val())).toFixed(2)); 
		   });
		   
		   $('#stairs_calc3').click(function(){ 
				var stairstotal = 0.00;
				for(i=7; i <= 9; i++){	
					$('#stairs_lmm'+i).val(($('#stairs_hmm'+i).val() * $('#stairs_multi'+i).val()).toFixed(2));
					$('#stairs_tmm'+i).val(($('#stairs_lmm'+i).val() * $('#stairs_wmm'+i).val()).toFixed(2));
					$('#stairs_sqm'+i).val(($('#stairs_tmm'+i).val() / $('#stairs_div'+i).val()).toFixed(6));
					var subtot = ($('#stairs_sqm'+i).val() * $('#stairs_rps'+i).val()).toFixed(2);
					$('#stairs_pc'+i).val(subtot);
					stairstotal += parseFloat(subtot, 10);	
					
					$('#stairs_lsqm'+i).val($('#stairs_sqm'+i).val());		 
					$('#stairs_totalhours'+i).val(($('#stairs_lsqm'+i).val() / $('#stairs_total'+i).val()).toFixed(6));	 
					$('#stairs_ltotal'+i).val(($('#stairs_totalhours'+i).val() * $('#stairs_costperhour'+i).val()).toFixed(2));
				}	
		   $('#stairs_subtotal3').val(parseFloat($('#stairs_ltotal7').val(),2) + parseFloat($('#stairs_ltotal8').val(),2) + parseFloat($('#stairs_ltotal9').val(),2) + stairstotal);
		 $('#stairs_alltotals').val((parseFloat($('#stairs_subtotal').val()) + parseFloat($('#stairs_subtotal2').val()) + parseFloat($('#stairs_subtotal3').val()) + parseFloat($('#stairs_subtotal4').val())).toFixed(2));  
		   });
		   
		   $('#stairs_calc4').click(function(){ 
				var stairstotal = 0.00;
				for(i=10; i <= 12; i++){	
					$('#stairs_lmm'+i).val(($('#stairs_hmm'+i).val() * $('#stairs_multi'+i).val()).toFixed(2));
					$('#stairs_tmm'+i).val(($('#stairs_lmm'+i).val() * $('#stairs_wmm'+i).val()).toFixed(2));
					$('#stairs_sqm'+i).val(($('#stairs_tmm'+i).val() / $('#stairs_div'+i).val()).toFixed(6));
					var subtot = ($('#stairs_sqm'+i).val() * $('#stairs_rps'+i).val()).toFixed(2);
					$('#stairs_pc'+i).val(subtot);
					stairstotal += parseFloat(subtot, 10);	
					
					$('#stairs_lsqm'+i).val($('#stairs_sqm'+i).val());		 
					$('#stairs_totalhours'+i).val(($('#stairs_lsqm'+i).val() / $('#stairs_total'+i).val()).toFixed(6));	 
					$('#stairs_ltotal'+i).val(($('#stairs_totalhours'+i).val() * $('#stairs_costperhour'+i).val()).toFixed(2));
				}	
	   $('#stairs_subtotal4').val(parseFloat($('#stairs_ltotal10').val(),2) + parseFloat($('#stairs_ltotal11').val(),2) + parseFloat($('#stairs_ltotal12').val(),2) + stairstotal);
	   $('#stairs_alltotals').val((parseFloat($('#stairs_subtotal').val()) + parseFloat($('#stairs_subtotal2').val()) + parseFloat($('#stairs_subtotal3').val()) + parseFloat($('#stairs_subtotal4').val())).toFixed(2)); 
		   });
		   
			$('#stairs_total_assign_to_sheet1').click(function(){	
			$('#pqdt_stairs_material_values').val($('#stairs_alltotals').val());
			alert("Successfully inserted to job sheet");
			});
			
			$('#stairs_total_assign_to_sheet2').click(function(){	
			$('#pqdt_stairs_material_values').val($('#stairs_alltotals').val());
			alert("Successfully inserted to job sheet");
			});
			
			$('#stairs_total_assign_to_sheet3').click(function(){	
			$('#pqdt_stairs_material_values').val($('#stairs_alltotals').val());
			alert("Successfully inserted to job sheet");   
			});
		   
		    $('#stairs_total_assign_to_sheet4').click(function(){	
			$('#pqdt_stairs_material_values').val($('#stairs_alltotals').val());
			alert("Successfully inserted to job sheet"); 
			});
		   
///////Stairs////////			
///////Gable Roof////////
		$('#gableroof_calc1').click(function(){ 
		for(i=2; i < 12; i++){	$('#gable_roof_ps'+i).val($('#gable_roof_ps1').val()); }
		$('#gable_roof_tpftj1').val(($('#gable_roof_ps1').val() * $('#gable_roof_pps1').val()).toFixed(2));		
		$('#gable_roof_tlm1').val(($('#gable_roof_tpftj1').val() * $('#gable_roof_lmps1').val()).toFixed(2));		
		$('#gable_roof_total1').val(($('#gable_roof_cplm1').val() * $('#gable_roof_tlm1').val()).toFixed(2));

		$('#gable_roof_tpftj2').val(($('#gable_roof_ps2').val() * $('#gable_roof_pps2').val()).toFixed(2));	
		$('#gable_roof_total2').val(($('#gable_roof_tpftj2').val() * $('#gable_roof_cplm2').val()).toFixed(2));

		$('#gable_roof_tpftj3').val(($('#gable_roof_ps3').val() * $('#gable_roof_pps3').val()).toFixed(2));
		$('#gable_roof_total3').val(($('#gable_roof_ps3').val() * $('#gable_roof_cplm3').val()).toFixed(2));
		
		$('#gable_roof_tpftj4').val(($('#gable_roof_ps4').val() * $('#gable_roof_lmps4').val()).toFixed(2));
		$('#gable_roof_total4').val(($('#gable_roof_ps4').val() * $('#gable_roof_tpftj4').val()).toFixed(2));
		
		$('#gable_roof_total5').val(($('#gable_roof_ps5').val() * $('#gable_roof_pps5').val()).toFixed(2));
		
		$('#gable_roof_tb6').val(($('#gable_roof_ps6').val() * $('#gable_roof_bps6').val()).toFixed(2));
		$('#gable_roof_total6').val(($('#gable_roof_cpb6').val() * $('#gable_roof_tb6').val()).toFixed(2));	
					
		$('#gable_roof_tp7').val($('#gable_roof_tpftj1').val());			
		$('#gable_roof_tp17').val((parseFloat($('#gable_roof_tp7').val()) + parseFloat($('#gable_roof_ru7').val())).toFixed(2)); 			
		$('#gable_roof_total7').val(($('#gable_roof_tp17').val() * $('#gable_roof_cpp7').val()).toFixed(2));
			
		$('#gable_roof_tu8').val(($('#gable_roof_ps8').val() * $('#gable_roof_ups8').val()).toFixed(2));
		$('#gable_roof_total8').val(($('#gable_roof_cpu8').val() * $('#gable_roof_tu8').val()).toFixed(2));
		
		$('#gable_roof_tnob9').val(($('#gable_roof_ps9').val() * $('#gable_roof_tnobps9').val()).toFixed(2));
		$('#gable_roof_total9').val(($('#gable_roof_cpb9').val() * $('#gable_roof_tnob9').val()).toFixed(2));
		
		$('#gable_roof_tnob10').val(($('#gable_roof_ps10').val() * $('#gable_roof_tnobps10').val()).toFixed(2));
		$('#gable_roof_total10').val(($('#gable_roof_cps10').val() * $('#gable_roof_tnob10').val()).toFixed(2));
		$('#gable_roof_total11').val(($('#gable_roof_cps11').val() * $('#gable_roof_ps11').val()).toFixed(2));		
		var rooftotal = 0.00;
				for(i=1; i < 12; i++){	
					var subtot = $('#gable_roof_total'+i).val();
					rooftotal += parseFloat(subtot, 10);		 
				}	

		$('#gableroof_subtotal1').val(rooftotal);
				var alltotalroof = 0.00;
			$('input.sub_frame_roof').each(function(){ alltotalroof += parseFloat(this.value, 10); }); 
			$('#roof_all_total').val(alltotalroof.toFixed(2));			
		});
	$('#gablepine_calc1').click(function(){ 
	$('#gable_pine_to1').val((parseFloat($('#gable_pine_tloph1').val()) + parseFloat($('#gable_pine_tmoph1').val())).toFixed(2));
	$('#gable_pine_th1').val(($('#gable_pine_ps1').val() / $('#gable_pine_to1').val()).toFixed(4));
	$('#gable_pine_total1').val(($('#gable_pine_th1').val() * $('#gable_pine_tcph1').val()).toFixed(2));
	$('#gable_pine_ps2').val($('#gable_pine_ps1').val());
	$('#gable_pine_ps3').val($('#gable_pine_ps1').val());
	$('#gable_pine_th2').val(($('#gable_pine_ps2').val() / $('#gable_pine_tloph2').val()).toFixed(4));
	$('#gable_pine_total2').val(($('#gable_pine_th2').val() * $('#gable_pine_tcph2').val()).toFixed(2));
	$('#gable_pine_total3').val(($('#gable_pine_ps3').val() * $('#gable_pine_tcph3').val()).toFixed(2));	
	$('#gablepine_subtotal1').val((parseFloat($('#gable_pine_total1').val()) + parseFloat($('#gable_pine_total2').val()) + parseFloat($('#gable_pine_total3').val())).toFixed(2));
	
			var alltotalroof = 0.00;
			$('input.sub_frame_roof').each(function(){ alltotalroof += parseFloat(this.value, 10); }); 
			$('#roof_all_total').val(alltotalroof.toFixed(2));	
	});
	$('#gableskillion_calc1').click(function(){ 
	var roofskilliontotal = 0.00;	
	 for(i=1; i < 9; i++){ $('#gableskillion_ps'+i).val($('#gableskillion_ps1').val()); 
	 $('#gableskillion_tlm'+i).val(($('#gableskillion_ps'+i).val() * $('#gableskillion_lmps'+i).val()).toFixed(2));
	 }
	 $('#gableskillion_total1').val(($('#gableskillion_cplm1').val() * $('#gableskillion_tlm1').val()).toFixed(2));	
	 $('#gableskillion_total2').val(($('#gableskillion_cplm2').val() * $('#gableskillion_tlm2').val()).toFixed(2));	
	 $('#gableskillion_total3').val(($('#gableskillion_cplm3').val() * $('#gableskillion_ps3').val()).toFixed(2));	
	 $('#gableskillion_total4').val(($('#gableskillion_cplm4').val() * $('#gableskillion_tlm4').val()).toFixed(2));	
	 $('#gableskillion_total5').val(($('#gableskillion_cplm5').val() * $('#gableskillion_tlm5').val()).toFixed(2));		
	 $('#gableskillion_total6').val(($('#gableskillion_cplm6').val() * $('#gableskillion_tlm6').val()).toFixed(2));	
	 $('#gableskillion_total7').val(($('#gableskillion_cplm7').val() * $('#gableskillion_ps7').val()).toFixed(2));	
	 $('#gableskillion_total8').val(($('#gableskillion_cplm8').val() * $('#gableskillion_ps8').val()).toFixed(2));	
	  for(i=1; i < 9; i++){  
	  var subtot = $('#gableskillion_total'+i).val(); roofskilliontotal += parseFloat(subtot, 10); } 
	  $('#gableskillion_subtotal1').val(roofskilliontotal);
	  
	  		var alltotalroof = 0.00;
			$('input.sub_frame_roof').each(function(){ alltotalroof += parseFloat(this.value, 10); }); 
			$('#roof_all_total').val(alltotalroof.toFixed(2));	
	});
	
	$('#gableskillionlabour_calc').click(function(){ 
	var roofskillionlabourtotal = 0.00;	
	$('#gableskillionlabour_ps1').val($('#gableskillion_ps8').val());
	$('#gableskillionlabour_ps2').val($('#gableskillion_ps8').val());
	$('#gableskillionlabour_ps3').val($('#gableskillion_ps8').val());
	$('#gableskillionlabour_to1').val((parseFloat($('#gableskillionlabour_tloph1').val()) + parseFloat($('#gableskillionlabour_tmoph1').val())).toFixed(2));
	$('#gableskillionlabour_th1').val(($('#gableskillionlabour_ps1').val() / $('#gableskillionlabour_to1').val()).toFixed(2));	
	$('#gableskillionlabour_total1').val(($('#gableskillionlabour_th1').val() * $('#gableskillionlabour_tcph1').val()).toFixed(2));
	
	$('#gableskillionlabour_to2').val(($('#gableskillionlabour_ps2').val() * $('#gableskillionlabour_th2').val()).toFixed(2));
	$('#gableskillionlabour_tmoph2').val(($('#gableskillionlabour_to2').val() / $('#gableskillionlabour_tloph2').val()).toFixed(2));
	$('#gableskillionlabour_total2').val(($('#gableskillionlabour_tmoph2').val() * $('#gableskillionlabour_tcph2').val()).toFixed(2));
	
	$('#gableskillionlabour_to3').val(($('#gableskillionlabour_tloph3').val() / $('#gableskillionlabour_ps3').val()).toFixed(2));
	$('#gableskillionlabour_total3').val(($('#gableskillionlabour_to3').val() * $('#gableskillionlabour_tcph3').val()).toFixed(2));
	$('#gableskillionlabour_subtotal').val((parseFloat($('#gableskillionlabour_total1').val()) + parseFloat($('#gableskillionlabour_total2').val()) + parseFloat($('#gableskillionlabour_total3').val())).toFixed(2));
	
			var alltotalroof = 0.00;
			$('input.sub_frame_roof').each(function(){ alltotalroof += parseFloat(this.value, 10); }); 
			$('#roof_all_total').val(alltotalroof.toFixed(2));	
	});

$('#gableskillionraw_calc').click(function(){ 	
	var gableskillionrawtotal = 0.00;
	for(i=1; i < 8; i++){  
	$('#gableskillionraw_ps'+i).val($('#gableskillionraw_ps1').val());		
	$('#gableskillionraw_tlmr'+i).val(($('#gableskillionraw_ps'+i).val() * $('#gableskillionraw_lmps'+i).val()).toFixed(2));
	$('#gableskillionraw_total'+i).val(($('#gableskillionraw_tlmr'+i).val() * $('#gableskillionraw_cplm'+i).val()).toFixed(2));
	  var subtot = $('#gableskillionraw_total'+i).val(); 
	  gableskillionrawtotal += parseFloat(subtot, 10); 
	}
	$('#gableskillionraw_ps8').val($('#gableskillionraw_ps1').val());
	$('#gableskillionraw_ps9').val($('#gableskillionraw_ps1').val());
	
	$('#gableskillionraw_total8').val(($('#gableskillionraw_cplm8').val() * $('#gableskillionraw_ps8').val()).toFixed(2));
	$('#gableskillionraw_total9').val(($('#gableskillionraw_cplm9').val() * $('#gableskillionraw_ps9').val()).toFixed(2));
	
	$('#gableskillionraw_subtotal').val(( gableskillionrawtotal + parseFloat($('#gableskillionraw_total8').val()) + parseFloat($('#gableskillionraw_total9').val())).toFixed(2));
	
			var alltotalroof = 0.00;
			$('input.sub_frame_roof').each(function(){ alltotalroof += parseFloat(this.value, 10); }); 
			$('#roof_all_total').val(alltotalroof.toFixed(2));	
});	

	$('#rooftreatedpine_calc').click(function(){ 
	$('#rooftreatedpine_ps1').val($('#gableskillionraw_ps1').val());
	$('#rooftreatedpine_ps2').val($('#gableskillionraw_ps1').val());
	$('#rooftreatedpine_th1').val(($('#rooftreatedpine_ps1').val() / $('#rooftreatedpine_to1').val()).toFixed(2));
	$('#rooftreatedpine_total1').val(($('#rooftreatedpine_th1').val() * $('#rooftreatedpine_ha1').val()).toFixed(2));
	$('#rooftreatedpine_to2').val(($('#rooftreatedpine_ps2').val() * $('#rooftreatedpine_tmoph2').val()).toFixed(2));
	$('#rooftreatedpine_th2').val(($('#rooftreatedpine_to2').val() / $('#rooftreatedpine_tloph2').val()).toFixed(2));
	$('#rooftreatedpine_total2').val(($('#rooftreatedpine_ha2').val() * $('#rooftreatedpine_th2').val()).toFixed(2));
	$('#rooftreatedpine_subtotal').val((parseFloat($('#rooftreatedpine_total1').val()) + parseFloat($('#rooftreatedpine_total2').val())).toFixed(2));
	
			var alltotalroof = 0.00;
			$('input.sub_frame_roof').each(function(){ alltotalroof += parseFloat(this.value, 10); }); 
			$('#roof_all_total').val(alltotalroof.toFixed(2));	
});

$('#rooftreatedpinerawm_calc').click(function(){ 	
	var rooftreatedpinerawmtotal = 0.00;
	for(i=1; i < 9; i++){  
	$('#rooftreatedpinerawm_pm'+i).val($('#rooftreatedpinerawm_pm1').val());		
	$('#rooftreatedpinerawm_tlmr'+i).val(($('#rooftreatedpinerawm_pm'+i).val() * $('#rooftreatedpinerawm_lmps'+i).val()).toFixed(2));
	$('#rooftreatedpinerawm_total'+i).val(($('#rooftreatedpinerawm_tlmr'+i).val() * $('#rooftreatedpinerawm_cplm'+i).val()).toFixed(2));
	var subtot = $('#rooftreatedpinerawm_total'+i).val(); 
	  rooftreatedpinerawmtotal += parseFloat(subtot, 10); 
	}
	$('#rooftreatedpinerawm_total8').val(($('#rooftreatedpinerawm_pm8').val() * $('#rooftreatedpinerawm_cplm8').val()).toFixed(2));
	$('#rooftreatedpinerawm_subtotal').val(( rooftreatedpinerawmtotal + parseFloat($('#rooftreatedpinerawm_total8').val())).toFixed(2));
	
			var alltotalroof = 0.00;
			$('input.sub_frame_roof').each(function(){ alltotalroof += parseFloat(this.value, 10); }); 
			$('#roof_all_total').val(alltotalroof.toFixed(2));	
});	

	$('#rooftreatedpinelabour_calc').click(function(){
	$('#rooftreatedpinelabour_ps1').val($('#rooftreatedpinerawm_pm1').val());
	$('#rooftreatedpinelabour_ps2').val($('#rooftreatedpinerawm_pm1').val());			
	$('#rooftreatedpinelabour_ps3').val($('#rooftreatedpinerawm_pm1').val());	
	
	$('#rooftreatedpinelabour_to2').val(($('#rooftreatedpinelabour_ps2').val() * $('#rooftreatedpinelabour_tmoph2').val()).toFixed(2));
	$('#rooftreatedpinelabour_th1').val(($('#rooftreatedpinelabour_ps1').val() / $('#rooftreatedpinelabour_to1').val()).toFixed(2));
	$('#rooftreatedpinelabour_th2').val(($('#rooftreatedpinelabour_to2').val() / $('#rooftreatedpinelabour_tloph2').val()).toFixed(2));
	$('#rooftreatedpinelabour_th3').val(($('#rooftreatedpinelabour_ps3').val() / $('#rooftreatedpinelabour_tmoph3').val()).toFixed(2));	

	$('#rooftreatedpinelabour_total1').val(($('#rooftreatedpinelabour_th1').val() * $('#rooftreatedpinelabour_ha1').val()).toFixed(2));
	$('#rooftreatedpinelabour_total2').val(($('#rooftreatedpinelabour_th2').val() * $('#rooftreatedpinelabour_ha2').val()).toFixed(2));
	$('#rooftreatedpinelabour_total3').val(($('#rooftreatedpinelabour_th3').val() * $('#rooftreatedpinelabour_ha3').val()).toFixed(2));
	$('#rooftreatedpinelabour_subtotal').val(( 
			parseFloat($('#rooftreatedpinelabour_total1').val()) + 
			parseFloat($('#rooftreatedpinelabour_total2').val()) + 
			parseFloat($('#rooftreatedpinelabour_total3').val())).toFixed(2));
			
		var alltotalroof = 0.00;
			$('input.sub_frame_roof').each(function(){ alltotalroof += parseFloat(this.value, 10); }); 
			$('#roof_all_total').val(alltotalroof.toFixed(2));			
	});

	$('#roofextra_calc').click(function(){
		for(i=1; i < 7; i++){ $('#roofextra_ts'+i).val($('#roofextra_ts1').val()); }
	$('#roofextra_tlm1').val(($('#roofextra_ts1').val() * $('#roofextra_lmps1').val()).toFixed(2));	
	$('#roofextra_total1').val(($('#roofextra_tlm1').val() * $('#roofextra_lmr1').val()).toFixed(2));
	
	$('#roofextra_upj2').val(($('#roofextra_ts2').val() * $('#roofextra_tlm2').val()).toFixed(2));	
	$('#roofextra_total2').val(($('#roofextra_tsw2').val() * $('#roofextra_upj2').val()).toFixed(2));
	
	$('#roofextra_pl3').val(($('#roofextra_lps3').val() * $('#roofextra_ts3').val()).toFixed(2));
	$('#roofextra_total3').val(($('#roofextra_pl3').val() * $('#roofextra_cpl3').val()).toFixed(2));
	
	$('#roofextra_tu4').val(($('#roofextra_ups4').val() * $('#roofextra_ts4').val()).toFixed(2));
	$('#roofextra_total4').val(($('#roofextra_tu4').val() * $('#roofextra_cpu4').val()).toFixed(2));
	
	$('#roofextra_tlm6').val(($('#roofextra_ts6').val() * $('#roofextra_lmps6').val()).toFixed(2));
	$('#roofextra_total6').val(($('#roofextra_cplm6').val() * $('#roofextra_tlm6').val()).toFixed(2));
	
	$('#roofextra_subtotal').val((parseFloat($('#roofextra_total1').val()) + parseFloat($('#roofextra_total2').val()) + parseFloat($('#roofextra_total3').val()) + parseFloat($('#roofextra_total4').val()) + parseFloat($('#roofextra_total6').val())).toFixed(2));
	
		
	$('#roofextralabour_js1').val($('#roofextra_ts1').val());
	$('#roofextralabour_js2').val($('#roofextra_ts1').val());
	$('#roofextralabour_to1').val((parseFloat($('#gableskillionraw_total8').val()) + parseFloat($('#gableskillionraw_total9').val())).toFixed(2));
	

	$('#roofextralabour_js1').val($('#roofextra_ts1').val());		
	$('#roofextralabour_js2').val($('#roofextra_ts1').val());		
	$('#roofextralabour_to1').val((parseFloat($('#roofextralabour_tlo1').val()) + parseFloat($('#roofextralabour_tmoph1').val())).toFixed(2));	
	$('#roofextralabour_tha1').val(($('#roofextralabour_js1').val() / $('#roofextralabour_to1').val()).toFixed(2));
	$('#roofextralabour_bceg1').val(($('#roofextralabour_tha1').val() * $('#roofextralabour_thra1').val()).toFixed(2));	
	
	$('#roofextralabour_to2').val((parseFloat($('#roofextralabour_tlo2').val()) + parseFloat($('#roofextralabour_tmoph2').val())).toFixed(2));	
	$('#roofextralabour_tha2').val(($('#roofextralabour_js2').val() / $('#roofextralabour_to2').val()).toFixed(2));
	$('#roofextralabour_bceg2').val(($('#roofextralabour_tha2').val() * $('#roofextralabour_thra2').val()).toFixed(2));		
	$('#roofextralabour_subtotal').val((parseFloat($('#roofextralabour_bceg1').val()) + parseFloat($('#roofextralabour_bceg2').val())).toFixed(2));
	$('#roofextralabour_total').val((parseFloat($('#roofextra_subtotal').val()) + parseFloat($('#roofextralabour_subtotal').val())).toFixed(2));	
	
	});
	
	$('#roofextralabour3_calc').click(function(){ 
	$('#roofextralabour2_tlmos2').val($('#roofextralabour2_tlmos1').val());
	$('#roofextralabour2_tlmos3').val($('#roofextralabour2_tlmos1').val());
	$('#roofextralabour2_tlms4').val($('#roofextralabour2_tlmos1').val());
	$('#roofextralabour2_tlmos5').val($('#roofextralabour2_tlmos1').val());
	$('#roofextralabour2_tlms6').val($('#roofextralabour2_tlmos1').val());
	$('#roofextralabour2_tlm7').val($('#roofextralabour2_tlmos1').val());
	
	$('#roofextralabour2_tlm1').val(($('#roofextralabour2_tlmos1').val() * $('#roofextralabour2_lmobpl1').val()).toFixed(2));
	$('#roofextralabour2_total1').val(($('#roofextralabour2_tlm1').val() * $('#roofextralabour2_lmr1').val()).toFixed(2));
	
	$('#roofextralabour2_upj2').val(($('#roofextralabour2_tlmos2').val() * $('#roofextralabour2_nos2').val()).toFixed(2));
	$('#roofextralabour2_total2').val(($('#roofextralabour2_cpu2').val() * $('#roofextralabour2_upj2').val()).toFixed(2));

	$('#roofextralabour2_pl3').val(($('#roofextralabour2_lplm3').val() * $('#roofextralabour2_tlmos3').val()).toFixed(2));
	$('#roofextralabour2_total3').val(($('#roofextralabour2_pl3').val() * $('#roofextralabour2_cpl3').val()).toFixed(2));	
	
	$('#roofextralabour2_tu4').val(($('#roofextralabour2_ups4').val() * $('#roofextralabour2_tlms4').val()).toFixed(2));
	$('#roofextralabour2_total4').val(($('#roofextralabour2_tu4').val() * $('#roofextralabour2_cpu4').val()).toFixed(2));	
	
	$('#roofextralabour2_tlm5').val(($('#roofextralabour2_tlmos5').val() * $('#roofextralabour2_lmps5').val()).toFixed(2));
	$('#roofextralabour2_total5').val(($('#roofextralabour2_tlm5').val() * $('#roofextralabour2_cplm5').val()).toFixed(2));			
			
	$('#roofextralabour2_tlm6').val(($('#roofextralabour2_tlms6').val() * $('#roofextralabour2_lmops6').val()).toFixed(2));
	$('#roofextralabour2_total6').val(($('#roofextralabour2_cplm6').val() * $('#roofextralabour2_tlm6').val()).toFixed(2));
	$('#roofextralabour2_total7').val(($('#roofextralabour2_saplm7').val() * $('#roofextralabour2_tlm7').val()).toFixed(2));				

	var alltotalextra2 = 0.00;
		$('input.sub_frame_extra2').each(function(){ alltotalextra2 += parseFloat(this.value, 10); }); 
		$('#roofextralabour2_subtotal').val(alltotalextra2.toFixed(2));
					
	$('#roofextralabour2_div').val(($('#roofextralabour2_subtotal').val() / $('#roofextralabour2_tlmos1').val()).toFixed(2));		
	$('#roofextralabour3_lin1').val($('#roofextralabour2_tlmos1').val());
	$('#roofextralabour3_lin2').val($('#roofextralabour2_tlmos1').val());
	$('#roofextralabour3_ts1').val(($('#roofextralabour3_spl1').val() * $('#roofextralabour3_lin1').val()).toFixed(2));
	$('#roofextralabour3_to1').val((parseFloat($('#roofextralabour3_tlo1').val()) + parseFloat($('#roofextralabour3_tmoph1').val())).toFixed(2));
	$('#roofextralabour3_tha1').val(($('#roofextralabour3_ts1').val() * $('#roofextralabour3_to1').val()).toFixed(2));
	$('#roofextralabour3_total1').val(($('#roofextralabour3_tha1').val() * $('#roofextralabour3_thra1').val()).toFixed(2));
	$('#roofextralabour3_to2').val((parseFloat($('#roofextralabour3_tlo2').val()) + parseFloat($('#roofextralabour3_tmoph2').val())).toFixed(2));
	$('#roofextralabour3_tha2').val(($('#roofextralabour3_lin2').val() / $('#roofextralabour3_to2').val()).toFixed(2));
	$('#roofextralabour3_total2').val(($('#roofextralabour3_tha2').val() * $('#roofextralabour3_thra2').val()).toFixed(2));
	$('#roofextralabour3_alltotal2').val((parseFloat($('#roofextralabour3_total1').val()) + parseFloat($('#roofextralabour3_total2').val())).toFixed(2));
	$('#roofextralabour3_div').val(($('#roofextralabour3_alltotal2').val() / $('#roofextralabour3_lin1').val()).toFixed(2));
	$('#roofextralabour3_alltotals').val((parseFloat($('#roofextralabour2_subtotal').val()) + parseFloat($('#roofextralabour3_alltotal2').val())).toFixed(2));
	});
///////Gable Roof////////	

$('#add_decking_cal').click(function(){ $('#pqdt_decking_total_values').val($('#instojs').val()); alert("Successfully inserted to job sheet"); });

function insertintojs(id, total)
{
var tot = total;
$('#pqdt_decking_total_values').val(tot);
alert("Successfully inserted to job sheet");
}

function wrapinsertintojs(wtotal)
{
var wtot = wtotal;
$('#pqdt_wrapping_total_values').val(wtot);
alert("Successfully inserted to job sheet");
}

function calselected()
{
var selectedtotal = 0.00;
var projtype ='';				
		$("input[name='insert[]']:checked").each(function ()
		{
		  selectedtotal += parseFloat(this.value, 10);
		  projtype = projtype + "("+ (this.alt).trim() + ")" + "<br>";
	    }); 
		$('#instojs').val(selectedtotal.toFixed(2));
		$('#ptype').html(projtype);
}
</script>