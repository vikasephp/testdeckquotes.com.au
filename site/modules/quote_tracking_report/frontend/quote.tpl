

<div class="wrapper1">
    <div class="div1">
    </div>
</div>

<div class="wrapper2">
    <div class="div2 tableFixHead" >

  <table id="doclist-table" class="nav-back" width="100%">
    <thead>
      <tr>
        <th class="topmenu" align="center" valign="middle" width="3%">SrNo</th>
        <th class="topmenu" align="center" valign="middle" width="15%">Project Address</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Type</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Startig Onsite Date</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Wall & Roof Frames</th>
        <th class="topmenu" align="center" valign="middle" width="3%">First-floor Floor Frame</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Ground-floor Floor Frame</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Windows & Doors</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Water and Gas Upgrades</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Electrical Upgrades</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Engineer's Design</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Exterior Colours and Materials</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Skylights</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Close Up</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Retaining Wall</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Steel Roof</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Roof Tiles</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Cupolex Domes</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Footings Steel</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Slab Steel</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Construction Package</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Job/Component</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Glass Splashback</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Base Brick Accessories</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Base Bricks</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Top Brick Accessories</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Top Bricks</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Interior Stairs</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Shower Screen</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Lighting & Electrical</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Deck</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Deck Handrail</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Pergola</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Carport</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Scaffolding</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Windows Flashing</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Inclusions Rough-in Quote</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Inclusions Joinery Quote</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Inclusions Fit-Off Quote</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Unique Order 1</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Unique Order 2</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Heating and Cooling</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Garage Door</th>   
        <th class="topmenu" align="center" valign="middle" width="5%">Water Tank</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Wall and Floor Tiles</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Window Coverings</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Floor Coverings</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Mirror</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Pricelist Calculator</th> 
        <th class="topmenu" align="center" valign="middle" width="5%">Brick Sand</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Structural Steel</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Insulation</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Fix-Out</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Fit-Off</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Asbestos Removal</th>
        
        <th class="topmenu" align="center" valign="middle" width="5%">Scaffold</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Hot Water STC Rebate</th>
            
        <th class="topmenu" align="center" valign="middle" width="5%">Action</th>
         
      </tr>
      
      <tr>
       <td colspan="4"></td> 
       {{assign var=ctr value= 1}}
       {{foreach from=$datacol key="keyc" item="itemc"}}
           {{if $ctr gt 2}}
               <td>
               
               <form name="one" method="post" action="">
     <input type="text" name="tb" onkeyup = "update_text('{{$itemc.Field}}',this.value)" value="{{$itemc.text_value}}"  style="width:122px" />
               <select name="columns[{{$itemc.Field}}]" onchange="submit();">
               <option value="-140" {{if $itemc.drop_value eq '-140'}} selected="selected"{{/if}}>-20 weeks from SOD</option>
               <option value="-133" {{if $itemc.drop_value eq '-133'}} selected="selected"{{/if}}>-19 weeks from SOD</option>
               <option value="-126" {{if $itemc.drop_value eq '-126'}} selected="selected"{{/if}}>-18 weeks from SOD</option>
               <option value="-119" {{if $itemc.drop_value eq '-119'}} selected="selected"{{/if}}>-17 weeks from SOD</option>
               <option value="-112" {{if $itemc.drop_value eq '-112'}} selected="selected"{{/if}}>-16 weeks from SOD</option>
               <option value="-105" {{if $itemc.drop_value eq '-105'}} selected="selected"{{/if}}>-15 weeks from SOD</option>
               <option value="-98" {{if $itemc.drop_value eq '-98'}} selected="selected"{{/if}}>-14 weeks from SOD</option>
               <option value="-91" {{if $itemc.drop_value eq '-91'}} selected="selected"{{/if}}>-13 weeks from SOD</option>
               <option value="-84" {{if $itemc.drop_value eq '-84'}} selected="selected"{{/if}}>-12 weeks from SOD</option>
               <option value="-77" {{if $itemc.drop_value eq '-77'}} selected="selected"{{/if}}>-11 weeks from SOD</option>
               <option value="-70" {{if $itemc.drop_value eq '-70'}} selected="selected"{{/if}}>-10 weeks from SOD</option>
               <option value="-63" {{if $itemc.drop_value eq '-63'}} selected="selected"{{/if}}>-9 weeks from SOD</option>
               <option value="-56" {{if $itemc.drop_value eq '-56'}} selected="selected"{{/if}}>-8 weeks from SOD</option>
               <option value="-49" {{if $itemc.drop_value eq '-49'}} selected="selected"{{/if}}>-7 weeks from SOD</option>
               <option value="-42" {{if $itemc.drop_value eq '-42'}} selected="selected"{{/if}}>-6 weeks from SOD</option>
               <option value="-35" {{if $itemc.drop_value eq '-35'}} selected="selected"{{/if}}>-5 weeks from SOD</option>
               <option value="-28" {{if $itemc.drop_value eq '-28'}} selected="selected"{{/if}}>-4 weeks from SOD</option>
               <option value="-21" {{if $itemc.drop_value eq '-21'}} selected="selected"{{/if}}>-3 weeks from SOD</option>
               <option value="-14" {{if $itemc.drop_value eq '-14'}} selected="selected"{{/if}}>-2 weeks from SOD</option>
               <option value="-7"  {{if $itemc.drop_value eq '-7'}} selected="selected"{{/if}}>-1 weeks from SOD</option>
               <option value="0"  {{if $itemc.drop_value eq '0'}} selected="selected"{{/if}}>0 weeks from SOD</option>
               <option value="7"  {{if $itemc.drop_value eq '7'}} selected="selected"{{/if}}>1 weeks from SOD</option>
               <option value="14" {{if $itemc.drop_value eq '14'}} selected="selected"{{/if}}>2 weeks from SOD</option>
               <option value="21" {{if $itemc.drop_value eq '21'}} selected="selected"{{/if}}>3 weeks from SOD</option>
               <option value="28" {{if $itemc.drop_value eq '28'}} selected="selected"{{/if}}>4 weeks from SOD</option>
               <option value="35" {{if $itemc.drop_value eq '35'}} selected="selected"{{/if}}>5 weeks from SOD</option>
               <option value="42" {{if $itemc.drop_value eq '42'}} selected="selected"{{/if}}>6 weeks from SOD</option>
               <option value="49" {{if $itemc.drop_value eq '49'}} selected="selected"{{/if}}>7 weeks from SOD</option>   
               <option value="56" {{if $itemc.drop_value eq '56'}} selected="selected"{{/if}}>8 weeks from SOD</option>  
               <option value="63" {{if $itemc.drop_value eq '63'}} selected="selected"{{/if}}>9 weeks from SOD</option>
               <option value="70" {{if $itemc.drop_value eq '70'}} selected="selected"{{/if}}>10 weeks from SOD</option>
               <option value="77" {{if $itemc.drop_value eq '77'}} selected="selected"{{/if}}>11 weeks from SOD</option>
               <option value="84" {{if $itemc.drop_value eq '84'}} selected="selected"{{/if}} >12 weeks from SOD</option>
               <option value="91" {{if $itemc.drop_value eq '91'}} selected="selected"{{/if}}>13 weeks from SOD</option>
               <option value="98" {{if $itemc.drop_value eq '98'}} selected="selected"{{/if}}>14 weeks from SOD</option>  
               <option value="105" {{if $itemc.drop_value eq '105'}} selected="selected"{{/if}}>15 weeks from SOD</option>
               <option value="112" {{if $itemc.drop_value eq '112'}} selected="selected"{{/if}}>16 weeks from SOD</option>
               <option value="119" {{if $itemc.drop_value eq '119'}} selected="selected"{{/if}}>17 weeks from SOD</option>  
               <option value="126" {{if $itemc.drop_value eq '126'}} selected="selected"{{/if}}>18 weeks from SOD</option>
               <option value="133" {{if $itemc.drop_value eq '133'}} selected="selected"{{/if}}>19 weeks from SOD</option>
               <option value="140" {{if $itemc.drop_value eq '140'}} selected="selected"{{/if}}>20 weeks from SOD</option>
                 
               </select>
               </form>
               </td>
           {{/if}}
       {{assign var=ctr value=$ctr+1}}
   
       {{/foreach}}
       
        <script>
        function update_text(field,value)
		{
			
			$.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}quote_tracking_report.update_text/field/"+field+"/value/"+value,
					   success: function(result){
					}
				});
		}
       </script>
      </tr>
      
      
    {{if $list}}
    <tbody>
    <form name="mlist" method="post">
      <!--{{assign var=countn value= $numstartvounter}}-->
       {{assign var=countn value= 1}}
      
      {{foreach from=$list key="key" item="item"}}
      <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
        <td> {{$countn}} </td>
        <td>{{$item.qt_project_address}}</td>
        <td>{{$item.pt_name}}</td>
        
        <td>
     <input type="text" name="start_onsite_date[{{$item.qt_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo1_{{$item.qt_id}}" value="{{$item.bsn_starting_onsite_date}}" onfocus = "update_onsite({{$item.bsn_id}}, this.value);" /> 
           
        <script>
 	   
        function update_onsite(id,value)
		{
		
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}quote_tracking_report.update_onsite/bsn_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
	
       </script>  
        
        
        </td>
        
        <td style="background-color:{{$item.col_1}};" >
        
        <a href="{{$BASE_URL}}quote_tracking_report.date_popup/qt_id/{{$item.qt_id}}/cn/Wall & Roof Frames" class="various">{{$item.qt_wall_roof}}</a></td>
        <td  style="background-color:{{$item.col_2}}">
        <a href="{{$BASE_URL}}quote_tracking_report.date_popup/qt_id/{{$item.qt_id}}/cn/First-floor Floor Frame" class="various">{{$item.qt_ff_floor_frame}}</a></td>
        <td style="background-color:{{$item.col_3}}">
        <a href="{{$BASE_URL}}quote_tracking_report.date_popup/qt_id/{{$item.qt_id}}/cn/Ground-floor Floor Frame" class="various">{{$item.qt_gf_floor_frame}}</a></td>
        <td style="background-color:{{$item.col_4}}">
        <a href="{{$BASE_URL}}quote_tracking_report.date_popup/qt_id/{{$item.qt_id}}/cn/Windows & Doors" class="various">{{$item.qt_window_door}}</a>
        </td>
        <td style="background-color:{{$item.col_5}};">
         <a href="{{$BASE_URL}}quote_tracking_report.date_popup/qt_id/{{$item.qt_id}}/cn/Water and Gas Upgrades" class="various">{{$item.qt_water_gas}}</a>
        </td>
        <td style="background-color:{{$item.col_6}};">
        <a href="{{$BASE_URL}}quote_tracking_report.date_popup/qt_id/{{$item.qt_id}}/cn/Electrical Upgrades" class="various">{{$item.qt_ele_upgrade}}</a>
        </td>
        <td style="background-color:{{$item.col_7}};">
       <a href="{{$BASE_URL}}quote_tracking_report.date_popup/qt_id/{{$item.qt_id}}/cn/Engineer's Design" class="various">{{$item.qt_eng_design}} </a>
        </td>
        <td style="background-color:{{$item.col_8}};">
         <a href="{{$BASE_URL}}quote_tracking_report.date_popup/qt_id/{{$item.qt_id}}/cn/Exterior Colours and Materials" class="various">{{$item.qt_ext_colour}}</a></td>
        <td style="background-color:{{$item.col_9}};">
        <a href="{{$BASE_URL}}quote_tracking_report.date_popup/qt_id/{{$item.qt_id}}/cn/Skylights" class="various">{{$item.qt_skylight}}</a> </td>
        <td style="background-color:{{$item.col_10}};">
        <a href="{{$BASE_URL}}quote_tracking_report.date_popup/qt_id/{{$item.qt_id}}/cn/Close Up" class="various">{{$item.qt_close_up}}</a> </td>
        
        <td style="background-color:{{$item.col_11}};">
        <a href="{{$BASE_URL}}quote_tracking_report.date_popup/qt_id/{{$item.qt_id}}/cn/Retaining Wall" class="various">{{$item.qt_ret_wall}}</a> </td>
        <td style="background-color:{{$item.col_12}};">
        <a href="{{$BASE_URL}}quote_tracking_report.date_popup/qt_id/{{$item.qt_id}}/cn/Steel Roof" class="various">{{$item.qt_steel_roof}}</a> </td>
        <td style="background-color:{{$item.col_13}};">
        <a href="{{$BASE_URL}}quote_tracking_report.date_popup/qt_id/{{$item.qt_id}}/cn/Roof Tiles" class="various">{{$item.qt_roof_tiles}}</a></td>
        <td style="background-color:{{$item.col_14}};">
        <a href="{{$BASE_URL}}quote_tracking_report.date_popup/qt_id/{{$item.qt_id}}/cn/Cupolex Domes" class="various">{{$item.qt_cop_domes}}</a> </td>
        <td style="background-color:{{$item.col_15}};">
        <a href="{{$BASE_URL}}quote_tracking_report.date_popup/qt_id/{{$item.qt_id}}/cn/Footings Steel" class="various">{{$item.qt_foot_steel}}</a></td>
        <td style="background-color:{{$item.col_16}};">
        <a href="{{$BASE_URL}}quote_tracking_report.date_popup/qt_id/{{$item.qt_id}}/cn/Slab Steel" class="various">{{$item.qt_slab_steel}}</a></td>
        <td style="background-color:{{$item.col_17}};">
        <a href="{{$BASE_URL}}quote_tracking_report.date_popup/qt_id/{{$item.qt_id}}/cn/Construction Package" class="various">{{$item.qt_cons_package}}</a></td>
        <td style="background-color:{{$item.col_18}};">
        <a href="{{$BASE_URL}}quote_tracking_report.date_popup/qt_id/{{$item.qt_id}}/cn/Job Component" class="various">{{$item.qt_job_comp}}</a></td>
        <td style="background-color:{{$item.col_19}};">
        <a href="{{$BASE_URL}}quote_tracking_report.date_popup/qt_id/{{$item.qt_id}}/cn/Glass Splashback" class="various">{{$item.qt_glass_spl}}</a></td>
        <td style="background-color:{{$item.col_20}};">
        <a href="{{$BASE_URL}}quote_tracking_report.date_popup/qt_id/{{$item.qt_id}}/cn/Base Brick Accessories" class="various">{{$item.qt_bb_access}}</a></td>
        <td style="background-color:{{$item.col_21}};">
        <a href="{{$BASE_URL}}quote_tracking_report.date_popup/qt_id/{{$item.qt_id}}/cn/Base Bricks" class="various">{{$item.qt_base_bricks}}</a></td>  
      
        <td style="background-color:{{$item.col_22}};">
       <a href="{{$BASE_URL}}quote_tracking_report.date_popup/qt_id/{{$item.qt_id}}/cn/Top Brick Accessories" class="various">{{$item.qt_top_bri_acc}}</a></td>
        <td style="background-color:{{$item.col_23}};">
        <a href="{{$BASE_URL}}quote_tracking_report.date_popup/qt_id/{{$item.qt_id}}/cn/Top Bricks" class="various">{{$item.qt_top_brick}}</a></td>
        <td style="background-color:{{$item.col_24}};">
        <a href="{{$BASE_URL}}quote_tracking_report.date_popup/qt_id/{{$item.qt_id}}/cn/Interior Stairs" class="various">{{$item.qt_int_stair}}</a> </td>
        <td style="background-color:{{$item.col_25}};">
        <a href="{{$BASE_URL}}quote_tracking_report.date_popup/qt_id/{{$item.qt_id}}/cn/Shower Screen" class="various">{{$item.qt_sho_scrren}}</a> </td>
        <td style="background-color:{{$item.col_26}};">
        <a href="{{$BASE_URL}}quote_tracking_report.date_popup/qt_id/{{$item.qt_id}}/cn/Lighting & Electrical" class="various">{{$item.qt_light_ele}}</a></td>
        <td style="background-color:{{$item.col_27}};">
        <a href="{{$BASE_URL}}quote_tracking_report.date_popup/qt_id/{{$item.qt_id}}/cn/Deck" class="various">{{$item.qt_deck}}</a></td>
      
        <td style="background-color:{{$item.col_28}};">
        <a href="{{$BASE_URL}}quote_tracking_report.date_popup/qt_id/{{$item.qt_id}}/cn/Deck Handrail" class="various">{{$item.qt_deck_hand}}</a></td>
        <td style="background-color:{{$item.col_29}};">
         <a href="{{$BASE_URL}}quote_tracking_report.date_popup/qt_id/{{$item.qt_id}}/cn/Pergola" class="various">{{$item.qt_pergola}}</a></td>
        <td style="background-color:{{$item.col_30}};">
        <a href="{{$BASE_URL}}quote_tracking_report.date_popup/qt_id/{{$item.qt_id}}/cn/Carport" class="various">{{$item.qt_carport}}</a></td>
        <td style="background-color:{{$item.col_31}};">
        <a href="{{$BASE_URL}}quote_tracking_report.date_popup/qt_id/{{$item.qt_id}}/cn/Scaffolding" class="various">{{$item.qt_scaffolding}}</a></td>
        <td style="background-color:{{$item.col_32}};">
        <a href="{{$BASE_URL}}quote_tracking_report.date_popup/qt_id/{{$item.qt_id}}/cn/Windows Flashing" class="various">{{$item.qt_wind_flash}}</a></td>
        <td style="background-color:{{$item.col_33}};">
        <a href="{{$BASE_URL}}quote_tracking_report.date_popup/qt_id/{{$item.qt_id}}/cn/Inclusions Rough-in Quote" class="various">{{$item.qt_inc_rou_quote}}</a></td>
          
         <td style="background-color:{{$item.col_34}};">
    <a href="{{$BASE_URL}}quote_tracking_report.date_popup/qt_id/{{$item.qt_id}}/cn/Inclusions Joinery Quote" class="various">{{$item.qt_inc_join_quote}}</a></td>
         <td style="background-color:{{$item.col_35}};">
        <a href="{{$BASE_URL}}quote_tracking_report.date_popup/qt_id/{{$item.qt_id}}/cn/Inclusions Fit-Off Quote" class="various">{{$item.qt_incl_fit_quote}}</a></td>
         <td style="background-color:{{$item.col_36}};">
        <a href="{{$BASE_URL}}quote_tracking_report.date_popup/qt_id/{{$item.qt_id}}/cn/Unique Order 1" class="various">{{$item.qt_un_order_1}}</a></td>
         <td style="background-color:{{$item.col_37}};">
         <a href="{{$BASE_URL}}quote_tracking_report.date_popup/qt_id/{{$item.qt_id}}/cn/Unique Order 2" class="various">{{$item.qt_un_order_2}}</a></td>
         <td style="background-color:{{$item.col_38}};">
         <a href="{{$BASE_URL}}quote_tracking_report.date_popup/qt_id/{{$item.qt_id}}/cn/Heating and Cooling" class="various">{{$item.qt_heat_cool}}</a></td>
         <td style="background-color:{{$item.col_39}};">
         <a href="{{$BASE_URL}}quote_tracking_report.date_popup/qt_id/{{$item.qt_id}}/cn/Garage Door" class="various">{{$item.qt_garage_door}}</a></td>
          
         <td style="background-color:{{$item.col_40}};">
         <a href="{{$BASE_URL}}quote_tracking_report.date_popup/qt_id/{{$item.qt_id}}/cn/Water Tank" class="various">{{$item.qt_water_tank}}</a></td>
         <td style="background-color:{{$item.col_41}};">
       <a href="{{$BASE_URL}}quote_tracking_report.date_popup/qt_id/{{$item.qt_id}}/cn/Wall and Floor Tiles" class="various">{{$item.qt_wall_fl_tiles}}</a></td>
        <td style="background-color:{{$item.col_42}};">
      <a href="{{$BASE_URL}}quote_tracking_report.date_popup/qt_id/{{$item.qt_id}}/cn/Window Coverings" class="various">{{$item.qt_wind_cove}}</a></td>
        <td style="background-color:{{$item.col_43}};">
       <a href="{{$BASE_URL}}quote_tracking_report.date_popup/qt_id/{{$item.qt_id}}/cn/Floor Coverings" class="various">{{$item.qt_floor_cov}}</a></td>
        <td style="background-color:{{$item.col_44}};">
        <a href="{{$BASE_URL}}quote_tracking_report.date_popup/qt_id/{{$item.qt_id}}/cn/Mirror" class="various">{{$item.qt_mirror}}</a></td>
        <td style="background-color:{{$item.col_45}};">
        <a href="{{$BASE_URL}}quote_tracking_report.date_popup/qt_id/{{$item.qt_id}}/cn/Pricelist Calculator" class="various">{{$item.qt_pric_calc}}</a></td>
          
       <td style="background-color:{{$item.col_46}};">
       <a href="{{$BASE_URL}}quote_tracking_report.date_popup/qt_id/{{$item.qt_id}}/cn/Brick Sand" class="various">{{$item.qt_brick_sand}}</a></td>
       <td style="background-color:{{$item.col_47}};">
      <a href="{{$BASE_URL}}quote_tracking_report.date_popup/qt_id/{{$item.qt_id}}/cn/Structural Steel" class="various">{{$item.qt_stru_steel}}</a></td>
          
       <td style="background-color:{{$item.col_48}};">
       <a href="{{$BASE_URL}}quote_tracking_report.date_popup/qt_id/{{$item.qt_id}}/cn/Insulation" class="various">{{$item.qt_insulation}}</a> </td>
       <td style="background-color:{{$item.col_49}};">
       <a href="{{$BASE_URL}}quote_tracking_report.date_popup/qt_id/{{$item.qt_id}}/cn/Fix-Out" class="various">{{$item.qt_fit_out}}</a></td>
       <td style="background-color:{{$item.col_50}};">
       <a href="{{$BASE_URL}}quote_tracking_report.date_popup/qt_id/{{$item.qt_id}}/cn/Fit-Off" class="various">{{$item.qt_fit_off}}</a> </td>
       <td style="background-color:{{$item.col_51}};">
       <a href="{{$BASE_URL}}quote_tracking_report.date_popup/qt_id/{{$item.qt_id}}/cn/Asbestos Removal" class="various">{{$item.qt_asb_removal}}</a> </td>
       <td style="background-color:{{$item.col_52}};">
       <a href="{{$BASE_URL}}quote_tracking_report.date_popup/qt_id/{{$item.qt_id}}/cn/Scaffold" class="various">{{$item.qt_scaffold}}</a></td>
   	   <td style="background-color:{{$item.col_53}};">
       <a href="{{$BASE_URL}}quote_tracking_report.date_popup/qt_id/{{$item.qt_id}}/cn/Hot Water STC Rebate" class="various">{{$item.qt_hot_water}}</a> </td>     
      
             <td> 
    
       <a href="{{$BASE_URL}}{{$XFA.detail}}/qt_id/{{$item.qt_id}}" class="various" title="Edit"> 
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
             <a href="{{$BASE_URL}}quote_tracking_report.delete/qt_id/{{$item.qt_id}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete">
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>&nbsp;&nbsp
     
       </td>
      
      </tr>
      {{assign var=countn value=$countn+1}}
      {{/foreach}}
      </tbody>
      
    </form>
    {{/if}}
  </table>
  </div>
  {{if $last > 1}}
  <table width="90%" border="0" cellpadding="0" cellspacing="0">
    <tr> {{if $list}}
      <td align="center"><div class='pagination'> {{if $pagenum == 1}} <span class='disabled'>« previous</span> {{else}} <a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{math equation="x - y" x=$pagenum y=1}}" title="Previous">« previous</a> {{/if}}
          
          {{if $pagenum != 1}} <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/1" title="{{$page_num}} Page">1</a></span> {{else}}<span class='current'>1</span> {{/if}}{{if $pagenum != 2}} <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/2" title="{{$page_num}} Page">2</a></span> {{else}}<span class='current'>2</span> {{/if}}
          {{if $paginateprev.0 > 3}}
          ...
          {{/if}}
          {{foreach from=$paginateprev key="page_key" item="page_num"}}
          {{if $page_num == $pagenum OR $page_num <= 2}}
          {{elseif $page_num == $lastone}}
          
          {{else}} <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$page_num}}" title="{{$page_num}} Page">{{$page_num}}</a></span> {{/if}}
          {{/foreach}}
          
          {{foreach from=$paginatenext key="page_key" item="page_num2"}}
          {{if $page_num2 < $last AND $page_num2 != $lastone}}
          {{if $page_num2 == 1}}
          {{elseif $page_num2 == 2}}
          {{else}}
          {{if $page_num2 == $pagenum OR $page_num2 <= 0}} <span class='current'> {{$page_num2}}</span> {{else}} <a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$page_num2}}" title="{{$page_num2}} Page">{{$page_num2}}</a> {{/if}}
          {{/if}}     
          {{/if}}
          {{/foreach}}
          {{if $page_num2 < $lasttow}}
          ...
          {{/if}}
          {{if $lastone == 1}}
          {{elseif $lastone == 2}}
          {{else}}
          {{if $pagenum == $lastone }} <span class='current'>{{$lastone}}</span> {{else}} <a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$lastone}}" title="{{$lastone}} Page">{{$lastone}}</a> {{/if}}
          {{/if}}
          {{if $last == 1}}
          {{elseif $last == 2}}
          {{else}}
          {{if $pagenum == $last}} <span class='current'>{{$last}}</span> {{else}} <a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$last}}" title="{{$last}} Page">{{$last}}</a> {{/if}}
          {{/if}}
          {{if $pagenum == $last}} <span class='disabled'>next »</span> {{else}} <a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{math equation="x + y" x=$pagenum y=1}}" title="Next">next »</a></div>
        {{/if}} </td>
      {{else}}
      <td align="center" height="300">Record Not found... </td>
      {{/if}} </tr>
  </table>
  {{/if}} <br />
  <br />
  
</div>

