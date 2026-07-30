
<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/default.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/tree/simpletreemenu.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tree/simpletree.css" />
<script>
		!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
	</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
<script type="text/javascript" >  
		$(document).ready(function() {
			/*
			*   Examples - images
			*/
			$(".various").fancybox({
				'width': '98%',
				'height': '95%',
				'autoScale': false,
				 'transitionIn' : 'elastic',
				 'transitionOut' : 'elastic',
				 'speedIn' : 300,
				 'speedOut' : 300,
				 'overlayShow' : true,
				 'hideOnOverlayClick':false,
				 'hideOnContentClick':false,
				 'type': 'iframe',
				 'scrolling': 'yes' 
			});

		
		});




function add_new()
 {
var viewurl = "{{$BASE_URL}}quote_tracking_report.detail"+ "/random/" + Math.random();	
 $(document).ready(function () {
        $.fancybox({
				'width': '90%',
				'height': '85%',
				'autoScale': false,
				 'transitionIn' : 'elastic',
				 'transitionOut' : 'elastic',
				 'speedIn' : 300,
				 'speedOut' : 300,
				 'overlayShow' : true,
				 'overlayColor' : '#000',
				 'hideOnOverlayClick':false,
				 'hideOnContentClick':false,
				 'type': 'iframe',
				 'href': viewurl,
				 'scrolling': 'yes' 
			
        });
});
}

 function add_procedure()
{
	var viewurl = "{{$BASE_URL}}quote_tracking_report.view_procedure"+ "/random/" + Math.random();	

 	$(document).ready(function () {

        $.fancybox({

				'width': '90%',
				'height': '99%',
				'autoScale': false,
				 'transitionIn' : 'elastic',
				 'transitionOut' : 'elastic',
				 'speedIn' : 300,
				 'speedOut' : 300,
				 'overlayShow' : true,
				 'overlayColor' : '#000',
				 'hideOnOverlayClick':false,
				 'hideOnContentClick':false,
				 'type': 'iframe',
				 'href': viewurl,
				 'scrolling': 'yes' 
        });
      });
}  

 function add_status()
{
	var viewurl = "{{$BASE_URL}}quote_tracking_report.view_status_delivery"+ "/random/" + Math.random();	

 	$(document).ready(function () {

        $.fancybox({

				'width': '90%',
				'height': '99%',
				'autoScale': false,
				 'transitionIn' : 'elastic',
				 'transitionOut' : 'elastic',
				 'speedIn' : 300,
				 'speedOut' : 300,
				 'overlayShow' : true,
				 'overlayColor' : '#000',
				 'hideOnOverlayClick':false,
				 'hideOnContentClick':false,
				 'type': 'iframe',
				 'href': viewurl,
				 'scrolling': 'yes' 
        });
      });
}


function close_win()
	{
	$.fancybox.close();
	window.location.reload();
	}
</script>

<style>

#fancybox-wrap {z-index:9999999;} 
.dtpic {
	width:65px !important;
	padding-top:1px !important;
	padding-bottom:1px !important;	
}

.wrapper1, .wrapper2{width: 100%; border: none 0px RED; overflow-x: scroll; overflow-y:hidden; scrollbar-color: yellow blue; }	   
.wrapper1{height: 20px; }
.wrapper2{ }
.div1 {width:7990px; height: 20px; }
.div2 {width:7990px;  overflow: auto;}   
.tableFixHead          { overflow-y: auto; height: 1200px; }
.tableFixHead thead th { position: sticky; top: 0; text-align:left; }
table  { border-collapse: collapse; width: 100%; }
th     { z-index:9999; }
#fancybox-wrap {z-index:9999999;} 
#doclist-table a {color: #000!important; font-size:12px !important; font-weight:bold; }


</style>

<h3 class="page-title">{{$title}}</h3>
<br />

<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
<div style="float:left; text-align:left;">
 


&nbsp;&nbsp; <strong>Search : </strong>
<input type="text" name="keyword" value="{{$keyword}}" style="width:400px;" placeholder="Search for Address"/>
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" value="Search" name="search"  />
<input type="submit" value="Clear Search" name="clear"  />
<input type="button" name="status_panel" value="Status Options" onclick="javascript:add_status();" />

<input type="button" name="back_qtr" value="Quote" onclick="javascript:back();"/> 
<input type="button" name="back_qtr" value="Purchase Order" onclick="javascript:po();"/>
</div>

      <script type="text/javascript">
		function back()
		{
			window.location.href = "{{$BASE_URL}}quote_tracking_report.home";
		}
		
		function po()
		{
			window.location.href = "{{$BASE_URL}}quote_tracking_report.purchase_order";
		}
	</script>



<div class="wrapper1">
    <div class="div1">
    </div>
</div>

<div class="wrapper2">
    <div class="div2 tableFixHead" >


  <table id="doclist-table" class="nav-back" width="100%">
    <thead>
      <tr>
        <th class="topmenu"  width="2%">SrNo</th>
        <th class="topmenu"  width:"10%">Project Address</th>
        <th class="topmenu"  width="5%">Type</th>
        <th class="topmenu"  width="3%">Startig Onsite Date</th>
        <th class="topmenu"  width="3%">Wall & Roof Frames</th>
        <th class="topmenu" align="center" valign="middle" width="3%">First-floor Floor Frame</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Ground-floor Floor Frame</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Windows & Doors</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Water and Gas Upgrades</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Electrical Upgrades</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Engineer's Design</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Exterior Colours and Materials</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Entry Doors</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Skylights</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Close Up</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Retaining Wall</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Steel Roof</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Roof Tiles</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Cupolex Domes</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Footings Steel</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Slab Steel</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Construction Package</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Wall & Roof Frames Detailing</th>
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
        
        <td style="background-color:{{$item.col_1}};" id = "qt_wall_roof{{$item.bsn_id}}">
        
       <select name="po[qp_status]" onchange = "update_status({{$item.bsn_id}}, this.value, 'qt_wall_roof' );" >
       <option value="">Please Select</option>
        {{foreach from=$pustdetail key="key1" item="item1"}}
           <option  {{if $item1.qs_name eq $item.qt_wall_roof}} selected="selected" {{/if}}>{{$item1.qs_name}}</option>
        {{/foreach}}
      </select>  
        
        <input type="text" name="date[{{$item.qt_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo2_{{$item.qt_id}}" value="{{$item.qt_wall_roof_dt}}" onfocus = "update_date({{$item.bsn_id}}, this.value,'qt_wall_roof_dt');" /> 
        
         <script>
 	   
        function update_status(id,value,colname)
		{
		     var bk = "#"+colname+id;
			
			 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}quote_tracking_report.update_delivery_status/bsn_id/"+id+"/value/"+value+"/col/"+colname,
				   success: function(result){
					 
					   $(bk).css("background",result);
			   }
			 });
		}
	
	    function update_date(id,value,colname)
		{
		
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}quote_tracking_report.update_date/bsn_id/"+id+"/value/"+value+"/col/"+colname,
				   success: function(result){
			   }
			 });
		}
	
       </script>  
        
        </td>
        <td  style="background-color:{{$item.col_2}}" id = "qt_ff_floor_frame{{$item.bsn_id}}"> 
        <select name="po[qp_status]" onchange = "update_status({{$item.bsn_id}}, this.value, 'qt_ff_floor_frame' );" >
        <option value="">Please Select</option>
        {{foreach from=$pustdetail key="key2" item="item2"}}
           <option  {{if $item2.qs_name eq $item.qt_ff_floor_frame}} selected="selected" {{/if}}>{{$item2.qs_name}}</option>
        {{/foreach}}
        </select> 
        
         <input type="text" name="date[{{$item.qt_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo3_{{$item.qt_id}}" value="{{$item.qt_ff_floor_frame_dt}}" onfocus = "update_date({{$item.bsn_id}}, this.value,'qt_ff_floor_frame_dt');" /> 
        </td>
        
         <td style="background-color:{{$item.col_3}}" id = "qt_gf_floor_frame{{$item.bsn_id}}">
        <select name="po[qp_status]" onchange = "update_status({{$item.bsn_id}}, this.value, 'qt_gf_floor_frame' );" >
           <option value="">Please Select</option>
          {{foreach from=$pustdetail key="key3" item="item3"}}
           <option  {{if $item3.qs_name eq $item.qt_gf_floor_frame}} selected="selected" {{/if}}>{{$item3.qs_name}}</option>
          {{/foreach}}
        </select>
        
<input type="text" name="date[{{$item.qt_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo4_{{$item.qt_id}}" value="{{$item.qt_gf_floor_frame_dt}}" onfocus = "update_date({{$item.bsn_id}}, this.value,'qt_gf_floor_frame_dt');" /> 

        </td>
        <td style="background-color:{{$item.col_4}}" id = "qt_window_door{{$item.bsn_id}}">
         <select name="po[qp_status]" onchange = "update_status({{$item.bsn_id}}, this.value, 'qt_window_door' );" >
           <option value="">Please Select</option>
          {{foreach from=$pustdetail key="key3" item="item3"}}
           <option  {{if $item3.qs_name eq $item.qt_window_door}} selected="selected" {{/if}}>{{$item3.qs_name}}</option>
          {{/foreach}}
        </select>
       
       <input type="text" name="date[{{$item.qt_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo5_{{$item.qt_id}}" value="{{$item.qt_window_door_dt}}" onfocus = "update_date({{$item.bsn_id}}, this.value,'qt_window_door_dt');" />
        </td>
        
        <td style="background-color:{{$item.col_5}};" id = "qt_water_gas{{$item.bsn_id}}">
         <select name="po[qp_status]" onchange = "update_status({{$item.bsn_id}}, this.value, 'qt_water_gas' );" >
           <option value="">Please Select</option>
          {{foreach from=$pustdetail key="key3" item="item3"}}
           <option  {{if $item3.qs_name eq $item.qt_water_gas}} selected="selected" {{/if}}>{{$item3.qs_name}}</option>
          {{/foreach}}
        </select>
        
        <input type="text" name="date[{{$item.qt_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo6_{{$item.qt_id}}" value="{{$item.qt_water_gas_dt}}" onfocus = "update_date({{$item.bsn_id}}, this.value,'qt_water_gas_dt');" />
         </td>
         
        <td style="background-color:{{$item.col_6}};" id = "qt_ele_upgrade{{$item.bsn_id}}">
        <select name="po[qp_status]" onchange = "update_status({{$item.bsn_id}}, this.value, 'qt_ele_upgrade' );" >
           <option value="">Please Select</option>
          {{foreach from=$pustdetail key="key3" item="item3"}}
           <option  {{if $item3.qs_name eq $item.qt_ele_upgrade}} selected="selected" {{/if}}>{{$item3.qs_name}}</option>
          {{/foreach}}
        </select> 
        
        <input type="text" name="date[{{$item.qt_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo7_{{$item.qt_id}}" value="{{$item.qt_ele_upgrade_dt}}" onfocus = "update_date({{$item.bsn_id}}, this.value,'qt_ele_upgrade_dt');" />

        </td>
        <td style="background-color:{{$item.col_7}};" id = "qt_eng_design{{$item.bsn_id}}">
        <select name="po[qp_status]" onchange = "update_status({{$item.bsn_id}}, this.value, 'qt_eng_design' );" >
           <option value="">Please Select</option>
          {{foreach from=$pustdetail key="key3" item="item3"}}
           <option  {{if $item3.qs_name eq $item.qt_eng_design}} selected="selected" {{/if}}>{{$item3.qs_name}}</option>
          {{/foreach}}
        </select> 
     
       <input type="text" name="date[{{$item.qt_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo8_{{$item.qt_id}}" value="{{$item.qt_eng_design_dt}}" onfocus = "update_date({{$item.bsn_id}}, this.value,'qt_eng_design_dt');" />
     
        </td>
        
        <td style="background-color:{{$item.col_8}};" id = "qt_ext_colour{{$item.bsn_id}}">
         <select name="po[qp_status]" onchange = "update_status({{$item.bsn_id}}, this.value, 'qt_ext_colour' );" >
           <option value="">Please Select</option>
          {{foreach from=$pustdetail key="key3" item="item3"}}
           <option  {{if $item3.qs_name eq $item.qt_ext_colour}} selected="selected" {{/if}}>{{$item3.qs_name}}</option>
          {{/foreach}}
        </select>

        <input type="text" name="date[{{$item.qt_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo9_{{$item.qt_id}}" value="{{$item.qt_ext_colour_dt}}" onfocus = "update_date({{$item.bsn_id}}, this.value,'qt_ext_colour_dt');" />
        </td>
        
        
         <td style="background-color:{{$item.col_88}};" id = "qt_entry_doors{{$item.bsn_id}}">
         <select name="po[qp_status]" onchange = "update_status({{$item.bsn_id}}, this.value, 'qt_entry_doors' );" >
           <option value="">Please Select</option>
          {{foreach from=$pustdetail key="key3" item="item3"}}
           <option  {{if $item3.qs_name eq $item.qt_entry_doors}} selected="selected" {{/if}}>{{$item3.qs_name}}</option>
          {{/foreach}}
        </select>

        <input type="text" name="date[{{$item.qt_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo99_{{$item.qt_id}}" value="{{$item.qt_entry_doors_dt}}" onfocus = "update_date({{$item.bsn_id}}, this.value,'qt_entry_doors_dt');" />
        </td>
        
         
        <td style="background-color:{{$item.col_9}};" id = "qt_skylight{{$item.bsn_id}}">
        <select name="po[qp_status]" onchange = "update_status({{$item.bsn_id}}, this.value, 'qt_skylight' );" >
           <option value="">Please Select</option>
          {{foreach from=$pustdetail key="key3" item="item3"}}
           <option  {{if $item3.qs_name eq $item.qt_skylight}} selected="selected" {{/if}}>{{$item3.qs_name}}</option>
          {{/foreach}}
        </select>
      
       <input type="text" name="date[{{$item.qt_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo10_{{$item.qt_id}}" value="{{$item.qt_skylight_dt}}" onfocus = "update_date({{$item.bsn_id}}, this.value,'qt_skylight_dt');" />
        
       </td>
        
        <td style="background-color:{{$item.col_10}};" id = "qt_close_up{{$item.bsn_id}}">
        <select name="po[qp_status]" onchange = "update_status({{$item.bsn_id}}, this.value, 'qt_close_up' );" >
           <option value="">Please Select</option>
          {{foreach from=$pustdetail key="key3" item="item3"}}
           <option  {{if $item3.qs_name eq $item.qt_close_up}} selected="selected" {{/if}}>{{$item3.qs_name}}</option>
          {{/foreach}}
        </select>
        
        <input type="text" name="date[{{$item.qt_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo11_{{$item.qt_id}}" value="{{$item.qt_close_up_dt}}" onfocus = "update_date({{$item.bsn_id}}, this.value,'qt_close_up_dt');" />
          
        </td>
        
        <td style="background-color:{{$item.col_11}};" id = "qt_ret_wall{{$item.bsn_id}}">
         <select name="po[qp_status]" onchange = "update_status({{$item.bsn_id}}, this.value, 'qt_ret_wall' );" >
           <option value="">Please Select</option>
          {{foreach from=$pustdetail key="key3" item="item3"}}
           <option  {{if $item3.qs_name eq $item.qt_ret_wall}} selected="selected" {{/if}}>{{$item3.qs_name}}</option>
          {{/foreach}}
        </select>
        
        <input type="text" name="date[{{$item.qt_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo12_{{$item.qt_id}}" value="{{$item.qt_ret_wall_dt}}" onfocus = "update_date({{$item.bsn_id}}, this.value,'qt_ret_wall_dt');" />   
          </td>
        
        <td style="background-color:{{$item.col_12}};" id = "qt_steel_roof{{$item.bsn_id}}">
        <select name="po[qp_status]" onchange = "update_status({{$item.bsn_id}}, this.value, 'qt_steel_roof' );" >
           <option value="">Please Select</option>
          {{foreach from=$pustdetail key="key3" item="item3"}}
           <option  {{if $item3.qs_name eq $item.qt_steel_roof}} selected="selected" {{/if}}>{{$item3.qs_name}}</option>
          {{/foreach}}
        </select>
        
        <input type="text" name="date[{{$item.qt_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo13_{{$item.qt_id}}" value="{{$item.qt_steel_roof_dt}}" onfocus = "update_date({{$item.bsn_id}}, this.value,'qt_steel_roof_dt');" />
         </td>
        
        <td style="background-color:{{$item.col_13}};" id = "qt_roof_tiles{{$item.bsn_id}}">
         <select name="po[qp_status]" onchange = "update_status({{$item.bsn_id}}, this.value, 'qt_roof_tiles' );" >
           <option value="">Please Select</option>
          {{foreach from=$pustdetail key="key3" item="item3"}}
           <option  {{if $item3.qs_name eq $item.qt_roof_tiles}} selected="selected" {{/if}}>{{$item3.qs_name}}</option>
          {{/foreach}}
        </select>
        
    <input type="text" name="date[{{$item.qt_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo14_{{$item.qt_id}}" value="{{$item.qt_roof_tiles_dt}}" onfocus = "update_date({{$item.bsn_id}}, this.value,'qt_roof_tiles_dt');" />
        
        </td>
        
        <td style="background-color:{{$item.col_14}};" id = "qt_cop_domes{{$item.bsn_id}}">
         <select name="po[qp_status]" onchange = "update_status({{$item.bsn_id}}, this.value, 'qt_cop_domes' );" >
           <option value="">Please Select</option>
          {{foreach from=$pustdetail key="key3" item="item3"}}
           <option  {{if $item3.qs_name eq $item.qt_cop_domes}} selected="selected" {{/if}}>{{$item3.qs_name}}</option>
          {{/foreach}}
        </select>
     
       <input type="text" name="date[{{$item.qt_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo15_{{$item.qt_id}}" value="{{$item.qt_cop_domes_dt}}" onfocus = "update_date({{$item.bsn_id}}, this.value,'qt_cop_domes_dt');" />
        </td>
        
        <td style="background-color:{{$item.col_15}};" id = "qt_foot_steel{{$item.bsn_id}}">
         <select name="po[qp_status]" onchange = "update_status({{$item.bsn_id}}, this.value, 'qt_foot_steel' );" >
           <option value="">Please Select</option>
          {{foreach from=$pustdetail key="key3" item="item3"}}
           <option  {{if $item3.qs_name eq $item.qt_foot_steel}} selected="selected" {{/if}}>{{$item3.qs_name}}</option>
          {{/foreach}}
        </select>
       
          <input type="text" name="date[{{$item.qt_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo16_{{$item.qt_id}}" value="{{$item.qt_foot_steel_dt}}" onfocus = "update_date({{$item.bsn_id}}, this.value,'qt_foot_steel_dt');" /> 

        </td>
        
        <td style="background-color:{{$item.col_16}};" id = "qt_slab_steel{{$item.bsn_id}}">
        <select name="po[qp_status]" onchange = "update_status({{$item.bsn_id}}, this.value, 'qt_slab_steel' );" >
           <option value="">Please Select</option>
          {{foreach from=$pustdetail key="key3" item="item3"}}
           <option  {{if $item3.qs_name eq $item.qt_slab_steel}} selected="selected" {{/if}}>{{$item3.qs_name}}</option>
          {{/foreach}}
        </select>
        
         <input type="text" name="date[{{$item.qt_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo17_{{$item.qt_id}}" value="{{$item.qt_slab_steel_dt}}" onfocus = "update_date({{$item.bsn_id}}, this.value,'qt_slab_steel_dt');" />
        
        </td>
        
        <td style="background-color:{{$item.col_17}};" id = "qt_cons_package{{$item.bsn_id}}">
         <select name="po[qp_status]" onchange = "update_status({{$item.bsn_id}}, this.value, 'qt_cons_package' );" >
           <option value="">Please Select</option>
          {{foreach from=$pustdetail key="key3" item="item3"}}
           <option  {{if $item3.qs_name eq $item.qt_cons_package}} selected="selected" {{/if}}>{{$item3.qs_name}}</option>
          {{/foreach}}
        </select>
       
       <input type="text" name="date[{{$item.qt_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo18_{{$item.qt_id}}" value="{{$item.qt_cons_package_dt}}" onfocus = "update_date({{$item.bsn_id}}, this.value,'qt_cons_package_dt');" />       
     
        </td>
      
        <td style="background-color:{{$item.col_18}};" id = "qt_job_comp{{$item.bsn_id}}">
        <select name="po[qp_status]" onchange = "update_status({{$item.bsn_id}}, this.value, 'qt_job_comp' );" >
           <option value="">Please Select</option>
          {{foreach from=$pustdetail key="key3" item="item3"}}
           <option  {{if $item3.qs_name eq $item.qt_job_comp}} selected="selected" {{/if}}>{{$item3.qs_name}}</option>
          {{/foreach}}
        </select>
    
      <input type="text" name="date[{{$item.qt_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo19_{{$item.qt_id}}" value="{{$item.qt_job_comp_dt}}" onfocus = "update_date({{$item.bsn_id}}, this.value,'qt_job_comp_dt');" /> 
    
        </td>
        
        <td style="background-color:{{$item.col_19}};"  id = "qt_glass_spl{{$item.bsn_id}}">
        <select name="po[qp_status]" onchange = "update_status({{$item.bsn_id}}, this.value, 'qt_glass_spl' );" >
           <option value="">Please Select</option>
          {{foreach from=$pustdetail key="key3" item="item3"}}
           <option  {{if $item3.qs_name eq $item.qt_glass_spl}} selected="selected" {{/if}}>{{$item3.qs_name}}</option>
          {{/foreach}}
        </select>
        
       <input type="text" name="date[{{$item.qt_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo20_{{$item.qt_id}}" value="{{$item.qt_glass_spl_dt}}" onfocus = "update_date({{$item.bsn_id}}, this.value,'qt_glass_spl_dt');" />    
  
        </td>
        
        <td style="background-color:{{$item.col_20}};" id = "qt_bb_access{{$item.bsn_id}}">
         <select name="po[qp_status]" onchange = "update_status({{$item.bsn_id}}, this.value, 'qt_bb_access' );" >
           <option value="">Please Select</option>
          {{foreach from=$pustdetail key="key3" item="item3"}}
           <option  {{if $item3.qs_name eq $item.qt_bb_access}} selected="selected" {{/if}}>{{$item3.qs_name}}</option>
          {{/foreach}}
        </select>

       <input type="text" name="date[{{$item.qt_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo21_{{$item.qt_id}}" value="{{$item.qt_bb_access_dt}}" onfocus = "update_date({{$item.bsn_id}}, this.value,'qt_bb_access_dt');" /> 

        </td>
      
        <td style="background-color:{{$item.col_21}};" id = "qt_base_bricks{{$item.bsn_id}}">
         <select name="po[qp_status]" onchange = "update_status({{$item.bsn_id}}, this.value, 'qt_base_bricks' );" >
           <option value="">Please Select</option>
          {{foreach from=$pustdetail key="key3" item="item3"}}
           <option  {{if $item3.qs_name eq $item.qt_base_bricks}} selected="selected" {{/if}}>{{$item3.qs_name}}</option>
          {{/foreach}}
        </select>
        
       <input type="text" name="date[{{$item.qt_id}}]" class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo22_{{$item.qt_id}}" value="{{$item.qt_base_bricks_dt}}" onfocus = "update_date({{$item.bsn_id}}, this.value,'qt_base_bricks_dt');" /> 
        
         </td>  
      
        <td style="background-color:{{$item.col_22}};" id = "qt_top_bri_acc{{$item.bsn_id}}">
        <select name="po[qp_status]" onchange = "update_status({{$item.bsn_id}}, this.value, 'qt_top_bri_acc' );" >
           <option value="">Please Select</option>
          {{foreach from=$pustdetail key="key3" item="item3"}}
           <option  {{if $item3.qs_name eq $item.qt_top_bri_acc}} selected="selected" {{/if}}>{{$item3.qs_name}}</option>
          {{/foreach}}
        </select>

       <input type="text" name="date[{{$item.qt_id}}]" class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo23_{{$item.qt_id}}" value="{{$item.qt_top_bri_acc_dt}}" onfocus = "update_date({{$item.bsn_id}}, this.value,'qt_top_bri_acc_dt');" />

       </td>
      
        <td style="background-color:{{$item.col_23}};" id = "qt_top_brick{{$item.bsn_id}}">
        <select name="po[qp_status]" onchange = "update_status({{$item.bsn_id}}, this.value, 'qt_top_brick' );" >
           <option value="">Please Select</option>
          {{foreach from=$pustdetail key="key3" item="item3"}}
           <option  {{if $item3.qs_name eq $item.qt_top_brick}} selected="selected" {{/if}}>{{$item3.qs_name}}</option>
          {{/foreach}}
        </select>
       
         <input type="text" name="date[{{$item.qt_id}}]" class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo24_{{$item.qt_id}}" value="{{$item.qt_top_brick_dt}}" onfocus = "update_date({{$item.bsn_id}}, this.value,'qt_top_brick_dt');" />
       
        </td>
      
        <td style="background-color:{{$item.col_24}};" id = "qt_int_stair{{$item.bsn_id}}">
        <select name="po[qp_status]" onchange = "update_status({{$item.bsn_id}}, this.value, 'qt_int_stair' );" >
           <option value="">Please Select</option>
          {{foreach from=$pustdetail key="key3" item="item3"}}
           <option  {{if $item3.qs_name eq $item.qt_int_stair}} selected="selected" {{/if}}>{{$item3.qs_name}}</option>
          {{/foreach}}
        </select>
     
     <input type="text" name="date[{{$item.qt_id}}]" class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo25_{{$item.qt_id}}" value="{{$item.qt_int_stair_dt}}" onfocus = "update_date({{$item.bsn_id}}, this.value,'qt_int_stair_dt');" />  
   
         </td>
      
        <td style="background-color:{{$item.col_25}};" id = "qt_sho_scrren{{$item.bsn_id}}">
        <select name="po[qp_status]" onchange = "update_status({{$item.bsn_id}}, this.value, 'qt_sho_scrren' );" >
           <option value="">Please Select</option>
          {{foreach from=$pustdetail key="key3" item="item3"}}
           <option  {{if $item3.qs_name eq $item.qt_sho_scrren}} selected="selected" {{/if}}>{{$item3.qs_name}}</option>
          {{/foreach}}
        </select>
        
       <input type="text" name="date[{{$item.qt_id}}]" class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo26_{{$item.qt_id}}" value="{{$item.qt_sho_scrren_dt}}" onfocus = "update_date({{$item.bsn_id}}, this.value,'qt_sho_scrren_dt');" />  
         </td>
      
        <td style="background-color:{{$item.col_26}};" id = "qt_light_ele{{$item.bsn_id}}">
         <select name="po[qp_status]" onchange = "update_status({{$item.bsn_id}}, this.value, 'qt_light_ele' );" >
           <option value="">Please Select</option>
          {{foreach from=$pustdetail key="key3" item="item3"}}
           <option  {{if $item3.qs_name eq $item.qt_light_ele}} selected="selected" {{/if}}>{{$item3.qs_name}}</option>
          {{/foreach}}
        </select>

   <input type="text" name="date[{{$item.qt_id}}]" class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo27_{{$item.qt_id}}" value="{{$item.qt_light_ele_dt}}" onfocus = "update_date({{$item.bsn_id}}, this.value,'qt_light_ele_dt');" />

        </td>
      
        <td style="background-color:{{$item.col_27}};"  id = "qt_deck{{$item.bsn_id}}">
          <select name="po[qp_status]" onchange = "update_status({{$item.bsn_id}}, this.value, 'qt_deck' );" >
           <option value="">Please Select</option>
          {{foreach from=$pustdetail key="key3" item="item3"}}
           <option  {{if $item3.qs_name eq $item.qt_deck}} selected="selected" {{/if}}>{{$item3.qs_name}}</option>
          {{/foreach}}
        </select>
        
           <input type="text" name="date[{{$item.qt_id}}]" class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo28_{{$item.qt_id}}" value="{{$item.qt_deck_dt}}" onfocus = "update_date({{$item.bsn_id}}, this.value,'qt_deck_dt');" />
        
        </td>
      
        <td style="background-color:{{$item.col_28}};" id = "qt_deck_hand{{$item.bsn_id}}">
         <select name="po[qp_status]" onchange = "update_status({{$item.bsn_id}}, this.value, 'qt_deck_hand' );" >
           <option value="">Please Select</option>
          {{foreach from=$pustdetail key="key3" item="item3"}}
           <option  {{if $item3.qs_name eq $item.qt_deck_hand}} selected="selected" {{/if}}>{{$item3.qs_name}}</option>
          {{/foreach}}
        </select>
  
    <input type="text" name="date[{{$item.qt_id}}]" class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo29_{{$item.qt_id}}" value="{{$item.qt_deck_hand_dt}}" onfocus = "update_date({{$item.bsn_id}}, this.value,'qt_deck_hand_dt');" />
        </td>
      
        <td style="background-color:{{$item.col_29}};" id = "qt_pergola{{$item.bsn_id}}">
        <select name="po[qp_status]" onchange = "update_status({{$item.bsn_id}}, this.value, 'qt_pergola' );" >
           <option value="">Please Select</option>
          {{foreach from=$pustdetail key="key3" item="item3"}}
           <option  {{if $item3.qs_name eq $item.qt_pergola}} selected="selected" {{/if}}>{{$item3.qs_name}}</option>
          {{/foreach}}
        </select>
     
      <input type="text" name="date[{{$item.qt_id}}]" class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo30_{{$item.qt_id}}" value="{{$item.qt_pergola_dt}}" onfocus = "update_date({{$item.bsn_id}}, this.value,'qt_pergola_dt');" /> 
     
         </td>
      
        <td style="background-color:{{$item.col_30}};" id = "qt_carport{{$item.bsn_id}}">
        <select name="po[qp_status]" onchange = "update_status({{$item.bsn_id}}, this.value, 'qt_carport' );" >
           <option value="">Please Select</option>
          {{foreach from=$pustdetail key="key3" item="item3"}}
           <option  {{if $item3.qs_name eq $item.qt_carport}} selected="selected" {{/if}}>{{$item3.qs_name}}</option>
          {{/foreach}}
        </select>
      
        <input type="text" name="date[{{$item.qt_id}}]" class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo31_{{$item.qt_id}}" value="{{$item.qt_carport_dt}}" onfocus = "update_date({{$item.bsn_id}}, this.value,'qt_carport_dt');" /> 
      
        </td>
      
        <td style="background-color:{{$item.col_31}};" id = "qt_scaffolding{{$item.bsn_id}}">
         <select name="po[qp_status]" onchange = "update_status({{$item.bsn_id}}, this.value, 'qt_scaffolding' );" >
           <option value="">Please Select</option>
          {{foreach from=$pustdetail key="key3" item="item3"}}
           <option  {{if $item3.qs_name eq $item.qt_scaffolding}} selected="selected" {{/if}}>{{$item3.qs_name}}</option>
          {{/foreach}}
        </select>
    
      <input type="text" name="date[{{$item.qt_id}}]" class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo32_{{$item.qt_id}}" value="{{$item.qt_scaffolding_dt}}" onfocus = "update_date({{$item.bsn_id}}, this.value,'qt_scaffolding_dt');" />
    
        </td>
      
        <td style="background-color:{{$item.col_32}};" id = "qt_wind_flash{{$item.bsn_id}}">
         <select name="po[qp_status]" onchange = "update_status({{$item.bsn_id}}, this.value, 'qt_wind_flash' );" >
           <option value="">Please Select</option>
          {{foreach from=$pustdetail key="key3" item="item3"}}
           <option  {{if $item3.qs_name eq $item.qt_wind_flash}} selected="selected" {{/if}}>{{$item3.qs_name}}</option>
          {{/foreach}}
        </select>
   
        <input type="text" name="date[{{$item.qt_id}}]" class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo33_{{$item.qt_id}}" value="{{$item.qt_wind_flash_dt}}" onfocus = "update_date({{$item.bsn_id}}, this.value,'qt_wind_flash_dt');" />
   
        </td>
      
        <td style="background-color:{{$item.col_33}};" id = "qt_inc_rou_quote{{$item.bsn_id}}">
         <select name="po[qp_status]" onchange = "update_status({{$item.bsn_id}}, this.value, 'qt_inc_rou_quote' );" >
           <option value="">Please Select</option>
          {{foreach from=$pustdetail key="key3" item="item3"}}
           <option  {{if $item3.qs_name eq $item.qt_inc_rou_quote}} selected="selected" {{/if}}>{{$item3.qs_name}}</option>
          {{/foreach}}
        </select>

    <input type="text" name="date[{{$item.qt_id}}]" class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo34_{{$item.qt_id}}" value="{{$item.qt_inc_rou_quote_dt}}" onfocus = "update_date({{$item.bsn_id}}, this.value,'qt_inc_rou_quote_dt');" />
        
        </td>
          
         <td style="background-color:{{$item.col_34}};" id = "qt_inc_join_quote{{$item.bsn_id}}">
         <select name="po[qp_status]" onchange = "update_status({{$item.bsn_id}}, this.value, 'qt_inc_join_quote' );" >
           <option value="">Please Select</option>
          {{foreach from=$pustdetail key="key3" item="item3"}}
           <option  {{if $item3.qs_name eq $item.qt_inc_join_quote}} selected="selected" {{/if}}>{{$item3.qs_name}}</option>
          {{/foreach}}
        </select>
 
      <input type="text" name="date[{{$item.qt_id}}]" class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo35_{{$item.qt_id}}" value="{{$item.qt_inc_join_quote_dt}}" onfocus = "update_date({{$item.bsn_id}}, this.value,'qt_inc_join_quote_dt');" />
        </td>
        
        
         <td style="background-color:{{$item.col_35}};" id = "qt_incl_fit_quote{{$item.bsn_id}}">
          <select name="po[qp_status]" onchange = "update_status({{$item.bsn_id}}, this.value, 'qt_incl_fit_quote' );" >
           <option value="">Please Select</option>
          {{foreach from=$pustdetail key="key3" item="item3"}}
           <option  {{if $item3.qs_name eq $item.qt_incl_fit_quote}} selected="selected" {{/if}}>{{$item3.qs_name}}</option>
          {{/foreach}}
        </select>
        
 <input type="text" name="date[{{$item.qt_id}}]" class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo36_{{$item.qt_id}}" value="{{$item.qt_incl_fit_quote_dt}}" onfocus = "update_date({{$item.bsn_id}}, this.value,'qt_incl_fit_quote_dt');" />
        
        </td>
        
         <td style="background-color:{{$item.col_36}};" id = "qt_un_order_1{{$item.bsn_id}}">
          <select name="po[qp_status]" onchange = "update_status({{$item.bsn_id}}, this.value, 'qt_un_order_1' );" >
           <option value="">Please Select</option>
          {{foreach from=$pustdetail key="key3" item="item3"}}
           <option  {{if $item3.qs_name eq $item.qt_un_order_1}} selected="selected" {{/if}}>{{$item3.qs_name}}</option>
          {{/foreach}}
        </select>

   <input type="text" name="date[{{$item.qt_id}}]" class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo37_{{$item.qt_id}}" value="{{$item.qt_un_order_1_dt}}" onfocus = "update_date({{$item.bsn_id}}, this.value,'qt_un_order_1_dt');" />

        </td>
        
         <td style="background-color:{{$item.col_37}};" id = "qt_un_order_2{{$item.bsn_id}}">
          <select name="po[qp_status]" onchange = "update_status({{$item.bsn_id}}, this.value, 'qt_un_order_2' );" >
           <option value="">Please Select</option>
          {{foreach from=$pustdetail key="key3" item="item3"}}
           <option  {{if $item3.qs_name eq $item.qt_un_order_2}} selected="selected" {{/if}}>{{$item3.qs_name}}</option>
          {{/foreach}}
          </select>
          
     <input type="text" name="date[{{$item.qt_id}}]" class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo38_{{$item.qt_id}}" value="{{$item.qt_un_order_2_dt}}" onfocus = "update_date({{$item.bsn_id}}, this.value,'qt_un_order_2_dt');" />   
         </td>
         
         <td style="background-color:{{$item.col_38}};" id = "qt_heat_cool{{$item.bsn_id}}">
         <select name="po[qp_status]" onchange = "update_status({{$item.bsn_id}}, this.value, 'qt_heat_cool' );" >
           <option value="">Please Select</option>
          {{foreach from=$pustdetail key="key3" item="item3"}}
           <option  {{if $item3.qs_name eq $item.qt_heat_cool}} selected="selected" {{/if}}>{{$item3.qs_name}}</option>
          {{/foreach}}
          </select>
          
    <input type="text" name="date[{{$item.qt_id}}]" class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo39_{{$item.qt_id}}" value="{{$item.qt_heat_cool_dt}}" onfocus = "update_date({{$item.bsn_id}}, this.value,'qt_heat_cool_dt');" />
         </td>
         
         <td style="background-color:{{$item.col_39}};" id = "qt_garage_door{{$item.bsn_id}}">
          <select name="po[qp_status]" onchange = "update_status({{$item.bsn_id}}, this.value, 'qt_garage_door' );" >
           <option value="">Please Select</option>
          {{foreach from=$pustdetail key="key3" item="item3"}}
           <option  {{if $item3.qs_name eq $item.qt_garage_door}} selected="selected" {{/if}}>{{$item3.qs_name}}</option>
          {{/foreach}}
          </select>
          
       <input type="text" name="date[{{$item.qt_id}}]" class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo40_{{$item.qt_id}}" value="{{$item.qt_garage_door_dt}}" onfocus = "update_date({{$item.bsn_id}}, this.value,'qt_garage_door_dt');" />    
         </td>
          
         <td style="background-color:{{$item.col_40}};" id = "qt_water_tank{{$item.bsn_id}}">
          <select name="po[qp_status]" onchange = "update_status({{$item.bsn_id}}, this.value, 'qt_water_tank' );" >
           <option value="">Please Select</option>
          {{foreach from=$pustdetail key="key3" item="item3"}}
           <option  {{if $item3.qs_name eq $item.qt_water_tank}} selected="selected" {{/if}}>{{$item3.qs_name}}</option>
          {{/foreach}}
          </select>
          
          <input type="text" name="date[{{$item.qt_id}}]" class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo41_{{$item.qt_id}}" value="{{$item.qt_water_tank_dt}}" onfocus = "update_date({{$item.bsn_id}}, this.value,'qt_water_tank_dt');" />  
         </td>
         
         <td style="background-color:{{$item.col_41}};" id = "qt_wall_fl_tiles{{$item.bsn_id}}">
         <select name="po[qp_status]" onchange = "update_status({{$item.bsn_id}}, this.value, 'qt_wall_fl_tiles' );" >
           <option value="">Please Select</option>
          {{foreach from=$pustdetail key="key3" item="item3"}}
           <option  {{if $item3.qs_name eq $item.qt_wall_fl_tiles}} selected="selected" {{/if}}>{{$item3.qs_name}}</option>
          {{/foreach}}
          </select>
          
    <input type="text" name="date[{{$item.qt_id}}]" class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo42_{{$item.qt_id}}" value="{{$item.qt_wall_fl_tiles_dt}}" onfocus = "update_date({{$item.bsn_id}}, this.value,'qt_wall_fl_tiles_dt');" />
       </td>
       
        <td style="background-color:{{$item.col_42}};" id = "qt_wind_cove{{$item.bsn_id}}">
         <select name="po[qp_status]" onchange = "update_status({{$item.bsn_id}}, this.value, 'qt_wind_cove' );" >
           <option value="">Please Select</option>
          {{foreach from=$pustdetail key="key3" item="item3"}}
           <option  {{if $item3.qs_name eq $item.qt_wind_cove}} selected="selected" {{/if}}>{{$item3.qs_name}}</option>
          {{/foreach}}
          </select>
        
  <input type="text" name="date[{{$item.qt_id}}]" class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo43_{{$item.qt_id}}" value="{{$item.qt_wind_cove_dt}}" onfocus = "update_date({{$item.bsn_id}}, this.value,'qt_wind_cove_dt');" /> 
      </td>
      
        <td style="background-color:{{$item.col_43}};" id = "qt_floor_cov{{$item.bsn_id}}">
        <select name="po[qp_status]" onchange = "update_status({{$item.bsn_id}}, this.value, 'qt_floor_cov' );" >
           <option value="">Please Select</option>
          {{foreach from=$pustdetail key="key3" item="item3"}}
           <option  {{if $item3.qs_name eq $item.qt_floor_cov}} selected="selected" {{/if}}>{{$item3.qs_name}}</option>
          {{/foreach}}
          </select>
    <input type="text" name="date[{{$item.qt_id}}]" class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo44_{{$item.qt_id}}" value="{{$item.qt_floor_cov_dt}}" onfocus = "update_date({{$item.bsn_id}}, this.value,'qt_floor_cov_dt');" />     

       </td>
       
       
        <td style="background-color:{{$item.col_44}};" id = "qt_mirror{{$item.bsn_id}}">
        <select name="po[qp_status]" onchange = "update_status({{$item.bsn_id}}, this.value, 'qt_mirror' );" >
           <option value="">Please Select</option>
          {{foreach from=$pustdetail key="key3" item="item3"}}
           <option  {{if $item3.qs_name eq $item.qt_mirror}} selected="selected" {{/if}}>{{$item3.qs_name}}</option>
          {{/foreach}}
          </select>
  <input type="text" name="date[{{$item.qt_id}}]" class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo45_{{$item.qt_id}}" value="{{$item.qt_mirror_dt}}" onfocus = "update_date({{$item.bsn_id}}, this.value,'qt_mirror_dt');" />  
        </td>
        
        <td style="background-color:{{$item.col_45}};" id = "qt_pric_calc{{$item.bsn_id}}">
         <select name="po[qp_status]" onchange = "update_status({{$item.bsn_id}}, this.value, 'qt_pric_calc' );" >
           <option value="">Please Select</option>
          {{foreach from=$pustdetail key="key3" item="item3"}}
           <option  {{if $item3.qs_name eq $item.qt_pric_calc}} selected="selected" {{/if}}>{{$item3.qs_name}}</option>
          {{/foreach}}
          </select>
   <input type="text" name="date[{{$item.qt_id}}]" class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo46_{{$item.qt_id}}" value="{{$item.qt_pric_calc_dt}}" onfocus = "update_date({{$item.bsn_id}}, this.value,'qt_pric_calc_dt');" /> 
        </td>
          
       <td style="background-color:{{$item.col_46}};" id = "qt_brick_sand{{$item.bsn_id}}">
       <select name="po[qp_status]" onchange = "update_status({{$item.bsn_id}}, this.value, 'qt_brick_sand' );" >
           <option value="">Please Select</option>
          {{foreach from=$pustdetail key="key3" item="item3"}}
           <option  {{if $item3.qs_name eq $item.qt_brick_sand}} selected="selected" {{/if}}>{{$item3.qs_name}}</option>
          {{/foreach}}
          </select>
      <input type="text" name="date[{{$item.qt_id}}]" class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo47_{{$item.qt_id}}" value="{{$item.qt_brick_sand_dt}}" onfocus = "update_date({{$item.bsn_id}}, this.value,'qt_brick_sand_dt');" />
      
       </td>
       
       <td style="background-color:{{$item.col_47}};" id = "qt_stru_steel{{$item.bsn_id}}">
          <select name="po[qp_status]" onchange = "update_status({{$item.bsn_id}}, this.value, 'qt_stru_steel' );" >
           <option value="">Please Select</option>
          {{foreach from=$pustdetail key="key3" item="item3"}}
           <option  {{if $item3.qs_name eq $item.qt_stru_steel}} selected="selected" {{/if}}>{{$item3.qs_name}}</option>
          {{/foreach}}
          </select>
    <input type="text" name="date[{{$item.qt_id}}]" class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo48_{{$item.qt_id}}" value="{{$item.qt_stru_steel_dt}}" onfocus = "update_date({{$item.bsn_id}}, this.value,'qt_stru_steel_dt');" />
      </td>
          
       <td style="background-color:{{$item.col_48}};" id = "qt_insulation{{$item.bsn_id}}">
          <select name="po[qp_status]" onchange = "update_status({{$item.bsn_id}}, this.value, 'qt_insulation' );" >
           <option value="">Please Select</option>
          {{foreach from=$pustdetail key="key3" item="item3"}}
           <option  {{if $item3.qs_name eq $item.qt_insulation}} selected="selected" {{/if}}>{{$item3.qs_name}}</option>
          {{/foreach}}
          </select>
       
         <input type="text" name="date[{{$item.qt_id}}]" class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo49_{{$item.qt_id}}" value="{{$item.qt_insulation_dt}}" onfocus = "update_date({{$item.bsn_id}}, this.value,'qt_insulation_dt');" />
       </td>
       
       <td style="background-color:{{$item.col_49}};" id = "qt_fit_out{{$item.bsn_id}}">
           <select name="po[qp_status]" onchange = "update_status({{$item.bsn_id}}, this.value, 'qt_fit_out' );" >
           <option value="">Please Select</option>
          {{foreach from=$pustdetail key="key3" item="item3"}}
           <option  {{if $item3.qs_name eq $item.qt_fit_out}} selected="selected" {{/if}}>{{$item3.qs_name}}</option>
          {{/foreach}}
          </select>
          
 <input type="text" name="date[{{$item.qt_id}}]" class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo50_{{$item.qt_id}}" value="{{$item.qt_fit_out_dt}}" onfocus = "update_date({{$item.bsn_id}}, this.value,'qt_fit_out_dt');" />
       </td>
       
       <td style="background-color:{{$item.col_50}};" id = "qt_fit_off{{$item.bsn_id}}">
          <select name="po[qp_status]" onchange = "update_status({{$item.bsn_id}}, this.value, 'qt_fit_off' );" >
           <option value="">Please Select</option>
          {{foreach from=$pustdetail key="key3" item="item3"}}
           <option  {{if $item3.qs_name eq $item.qt_fit_off}} selected="selected" {{/if}}>{{$item3.qs_name}}</option>
          {{/foreach}}
          </select>
 <input type="text" name="date[{{$item.qt_id}}]" class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo51_{{$item.qt_id}}" value="{{$item.qt_fit_off_dt}}" onfocus = "update_date({{$item.bsn_id}}, this.value,'qt_fit_off_dt');" />
       </td>
       
       <td style="background-color:{{$item.col_51}};" id = "qt_asb_removal{{$item.bsn_id}}">
        <select name="po[qp_status]" onchange = "update_status({{$item.bsn_id}}, this.value, 'qt_asb_removal' );" >
           <option value="">Please Select</option>
          {{foreach from=$pustdetail key="key3" item="item3"}}
           <option  {{if $item3.qs_name eq $item.qt_asb_removal}} selected="selected" {{/if}}>{{$item3.qs_name}}</option>
          {{/foreach}}
          </select>
 <input type="text" name="date[{{$item.qt_id}}]" class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo52_{{$item.qt_id}}" value="{{$item.qt_asb_removal_dt}}" onfocus = "update_date({{$item.bsn_id}}, this.value,'qt_asb_removal_dt');" />
        </td>
        
       <td style="background-color:{{$item.col_52}};" id = "qt_scaffold{{$item.bsn_id}}">
        <select name="po[qp_status]" onchange = "update_status({{$item.bsn_id}}, this.value, 'qt_scaffold' );" >
           <option value="">Please Select</option>
          {{foreach from=$pustdetail key="key3" item="item3"}}
           <option  {{if $item3.qs_name eq $item.qt_scaffold}} selected="selected" {{/if}}>{{$item3.qs_name}}</option>
          {{/foreach}}
          </select>
    <input type="text" name="date[{{$item.qt_id}}]" class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo53_{{$item.qt_id}}" value="{{$item.qt_scaffold_dt}}" onfocus = "update_date({{$item.bsn_id}}, this.value,'qt_scaffold_dt');" />   
       </td>
       
   	   <td style="background-color:{{$item.col_53}};" id = "qt_hot_water{{$item.bsn_id}}">
        <select name="po[qp_status]" onchange = "update_status({{$item.bsn_id}}, this.value, 'qt_hot_water' );" >
           <option value="">Please Select</option>
          {{foreach from=$pustdetail key="key3" item="item3"}}
           <option  {{if $item3.qs_name eq $item.qt_hot_water}} selected="selected" {{/if}}>{{$item3.qs_name}}</option>
          {{/foreach}}
          </select>
     <input type="text" name="date[{{$item.qt_id}}]" class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo54_{{$item.qt_id}}" value="{{$item.qt_hot_water_dt}}" onfocus = "update_date({{$item.bsn_id}}, this.value,'qt_hot_water_dt');" />
       </td>     
      
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

