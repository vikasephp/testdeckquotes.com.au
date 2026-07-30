<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

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
				'width': '75%',
				'height': '75%',
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


function show_alert(bsn_id)
{
	var viewurl = "{{$BASE_URL}}inclusions_report.alerts"+ "/bsn_id/" + bsn_id;	
	
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


function add_new()
 {
var viewurl = "{{$BASE_URL}}street_sign.detail"+ "/random/" + Math.random();	
 $(document).ready(function () {
        $.fancybox({
				'width': '78%',
				'height': '80%',
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
	var viewurl = "{{$BASE_URL}}management_report.view_procedure"+ "/random/" + Math.random();	

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

function add_type()
{
	var viewurl = "{{$BASE_URL}}management_report.view_type"+ "/random/" + Math.random();	

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


<script type="text/javascript" > 
function addfeedback(bsn_id)
{
	var viewurl = "{{$BASE_URL}}design_report.addfeedback"+ "/bsn_id/" + bsn_id;	
	
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
</script>


<script type="text/javascript" > 
function viewfeedback(bsn_id)
{
	var viewurl = "{{$BASE_URL}}design_report.viewfeedback"+ "/bsn_id/" + bsn_id;	
	
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
</script>

<script type="text/javascript">
$(function(){
    $(".wrapper1").scroll(function(){
        $(".wrapper2")
            .scrollLeft($(".wrapper1").scrollLeft());
    });
    $(".wrapper2").scroll(function(){
        $(".wrapper1")
            .scrollLeft($(".wrapper2").scrollLeft());
    });
});
</script>
<style>

body{style="border:1px solid #F00;"}
 
.tooltip:hover .tooltiptext {
    visibility: visible;
}

.dtpic {
	width:65px !important;
	padding-top:1px !important;
	padding-bottom:1px !important;	
}

.set { font-size:10px !important; 
       width:25px !important; display:inline-block; 
	   padding-top:1px !important;
	   padding-bottom: 1px !important;
	   padding-left:1px !important;
	   height:25px !important; }
	   
	   
.wrapper1, .wrapper2{width: 2500px; border: none 0px RED; overflow-x: scroll; overflow-y:hidden; scrollbar-color: yellow blue; }
.wrapper1{height: 20px; }
.wrapper2{ }
.div1 {width:3520px; height: 20px; }
.div2 {width:3520px;  overflow: auto;}   
.tableFixHead          { overflow-y: auto; height: 700px; }
.tableFixHead thead th { position: sticky; top: 0; text-align:left; }
table  { border-collapse: collapse; width: 100%; }
th     { z-index:9999; }
#fancybox-wrap {z-index:9999999;}   
</style>

<h3 class="page-title">Planning Management Report</h3>
<br />

<form name="sort" method="post">
<div style="float:left; text-align:left;"> 
&nbsp; &nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> 
<input type="button" name="type_options" value="Type Options" onclick="javascript:add_type();" />
<br />
&nbsp; &nbsp; <strong>Search:</strong>&nbsp;&nbsp;
<input type="text" name="searchkey" value="{{$searchkey}}" style="width:400px;" placeholder="Search Address , Client Name"/>
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" value="Search" name="searchaddr"  />
<input type="submit" value="Clear Search" name="clear"  /> 
</div>
</form>

<form name="mlist" method="post">
<div style="float:right;"> 

 <input type="submit" value="Print" name="print"  />


</div> &nbsp; &nbsp;
<br />
<div class="wrapper1">
    <div class="div1">
    </div>
</div>

<div class="wrapper2">
    <div class="div2 tableFixHead" >
  <table id="doclist-table" class="nav-back" width="100%">
    <thead>
      <tr>

        <th class="topmenu" align="center" valign="middle" width="8%">Project Details</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Traffic Light</th>
        <th class="topmenu" align="center" valign="middle" width="3%">HIA Signed Date</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Planning Manager</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Hia Days In It</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Days at Status</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Planning Type</th>
    	<th class="topmenu" align="center" valign="middle" width="4%">Survey Received</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Survey Implemented</th>
    
        <th class="topmenu" align="center" valign="middle" width="4%">Architect</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Ready for Nick to Check</th>
        <th class="topmenu" align="center" valign="middle" width="4%">PP Ready for customer sign off?</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Project Plans checked by Nick?</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Project Plans signed off by Client</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Entities lodged</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Goal Date for DA to be lodged</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Da lodged</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Likley DA Approval Date</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Ba lodged</th>
        <th class="topmenu" align="center" valign="middle" width="4%">CSBD (Day of BA)</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Is CSBD accurate? </th>
        <th class="topmenu" align="center" valign="middle" width="8%">Project Details</th>
         
          
      </tr>
    </thead>
    {{if $list}}
    <tbody>
    
      <tr>
      <td><input type="text" name="title_1"  value = "{{$titles.mr_title_1}}"  onkeyup = "update_mr_title(1,this.value)"/></td>
      <td><input type="text" name="title_2"  value = "{{$titles.mr_title_2}}"  onkeyup = "update_mr_title(2,this.value)"/></td>
      <td><input type="text" name="title_3"  value = "{{$titles.mr_title_3}}"  onkeyup = "update_mr_title(3,this.value)"/></td>
      <td><input type="text" name="title_4"  value = "{{$titles.mr_title_4}}"  onkeyup = "update_mr_title(4,this.value)"/></td>
      <td><input type="text" name="title_5"  value = "{{$titles.mr_title_5}}"  onkeyup = "update_mr_title(5,this.value)"/></td>
      <td><input type="text" name="title_6"  value = "{{$titles.mr_title_6}}"  onkeyup = "update_mr_title(6,this.value)"/></td>
      <td><input type="text" name="title_7"  value = "{{$titles.mr_title_7}}"  onkeyup = "update_mr_title(7,this.value)"/></td>
      <td><input type="text" name="title_8"  value = "{{$titles.mr_title_8}}"  onkeyup = "update_mr_title(8,this.value)"/></td>
      <td><input type="text" name="title_9"  value = "{{$titles.mr_title_9}}"  onkeyup = "update_mr_title(9,this.value)"/></td>
      <td><input type="text" name="title_10" value = "{{$titles.mr_title_10}}" onkeyup = "update_mr_title(10,this.value)"/></td>
      <td><input type="text" name="title_11" value = "{{$titles.mr_title_11}}" onkeyup = "update_mr_title(11,this.value)"/></td>
      <td><input type="text" name="title_12" value = "{{$titles.mr_title_12}}" onkeyup = "update_mr_title(12,this.value)"/></td>
      <td><input type="text" name="title_13" value = "{{$titles.mr_title_13}}" onkeyup = "update_mr_title(13,this.value)"/></td>
      <td><input type="text" name="title_14" value = "{{$titles.mr_title_14}}" onkeyup = "update_mr_title(14,this.value)"/></td>
      <td><input type="text" name="title_15" value = "{{$titles.mr_title_15}}" onkeyup = "update_mr_title(15,this.value)"/></td>
      <td><input type="text" name="title_16" value = "{{$titles.mr_title_16}}" onkeyup = "update_mr_title(16,this.value)"/></td>
      <td><input type="text" name="title_17" value = "{{$titles.mr_title_17}}" onkeyup = "update_mr_title(17,this.value)"/></td>
      <td><input type="text" name="title_18" value = "{{$titles.mr_title_18}}" onkeyup = "update_mr_title(18,this.value)"/></td>
      <td><input type="text" name="title_19" value = "{{$titles.mr_title_19}}" onkeyup = "update_mr_title(19,this.value)"/></td>
      <td><input type="text" name="title_20" value = "{{$titles.mr_title_20}}" onkeyup = "update_mr_title(20,this.value)"/></td>
      <td><input type="text" name="title_21" value = "{{$titles.mr_title_21}}" onkeyup = "update_mr_title(21,this.value)"/></td>
      <td><input type="text" name="title_1"  value = "{{$titles.mr_title_1}}"  onkeyup = "update_mr_title(1,this.value)"/></td>
      
       <script>
	   
		function update_mr_title(id,value)
		{
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}management_report.update_title/id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
		
	    </script>  
      
      </tr>
    
    
      <!--{{assign var=countn value= $numstartvounter}}-->
      {{assign var=countn value= $total}}
      
      {{foreach from=$list key="key" item="item"}}
      

      
      
     
      <tr {{if $item.dpn_dr_per_complete eq 100}} bgcolor="#99CC99" {{else}} bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}} {{/if}}">
       
        <td><strong>{{$item.bcust_fname}} &nbsp; {{$item.bcust_lname}}</strong><br />{{$item.bsn_address}}</td>
         
       {{ if $item.bs_traffic_light eq 1}}
       <td style="background:#00CC33";>
       <a href="{{$BASE_URL}}management_report.colorbox/bsn_id/{{$item.bsn_id}}" class="various">Color</a>
       <br /><br />{{$item.bs_tl_user}}<br />{{$item.bs_tl_date}}<br />
        <a href="{{$BASE_URL}}management_report.reason/bsn_id/{{$item.bsn_id}}" class="various">Read</a>
       </td>
       {{ elseif  $item.bs_traffic_light eq 2}}
       <td style="background: #ff7f27";>
       <a href="{{$BASE_URL}}management_report.colorbox/bsn_id/{{$item.bsn_id}}" class="various">Color</a>
       <br /><br />{{$item.bs_tl_user}}<br />{{$item.bs_tl_date}}<br />
       <a href="{{$BASE_URL}}management_report.reason/bsn_id/{{$item.bsn_id}}" class="various">Read</a>
       </td>
       {{ elseif  $item.bs_traffic_light eq 3}}
       <td style="background: #F00";>
       <a href="{{$BASE_URL}}management_report.colorbox/bsn_id/{{$item.bsn_id}}" class="various">Color</a>
      <br /><br />{{$item.bs_tl_user}}<br />{{$item.bs_tl_date}}<br />
      <a href="{{$BASE_URL}}management_report.reason/bsn_id/{{$item.bsn_id}}" class="various">Read</a>
       </td>
       {{else }}
       <td>
       <a href="{{$BASE_URL}}management_report.colorbox/bsn_id/{{$item.bsn_id}}" class="various">Color</a></td>
       {{/if}}
       
        {{if $item.hia_signed_date}}
            <td>{{$item.hia_signed_date}}</td>
        {{else}}
            <td style="background:#F00"></td>
        {{/if}}
    	<td>

     {{$item.prd_name}}
       <!-- <input type="text" name="pm[{{$item.bcust_id}}]"  value="{{$item.bcust_mr_pl_manager}}" onkeyup="update_pm({{$item.bcust_id}},this.value)"  />  
     
    
         <script>
	   
		function update_pm(id,value)
		{
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}management_report.update_data/cust_id_pm/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	</script>-->
             
       </td>
      <td>{{$item.hiadayscount}}</td>
       <td> {{$item.dayscount}}</td>
       <td> {{$item.bsn_ptt_d_type}}
       
       <!-- <select name="pt" Onchange = "update_pt({{$item.bcust_id}},this.value)" >
        {{foreach from=$typeData key="keyt" item="itemt"}}
        <option value="{{$itemt.pt_option}}" {{if $item.bcust_mr_pl_type eq $itemt.pt_option}} selected="selected" {{/if}}>{{$itemt.pt_option}}</option>
        {{/foreach}}
        </select>
        
       <script>
	   
		function update_pt(id,value)
		{
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}management_report.update_data/cust_id_pt/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	</script>-->
       </td>
      
       {{if $item.bcust_mr_surv_rev eq 'No'}}
       		<td style="background: #F00;">
       {{else}}
       		<td>
       {{/if}} 
       
       <select name="sur_rec[{{$item.bcust_id}}]" Onchange = "update_surv_rec({{$item.bcust_id}},this.value)" >
       <option value="Yes" {{if $item.bcust_mr_surv_rev eq 'Yes'}} selected="selected" {{/if}}> Yes </option>
       <option value="No"  {{if $item.bcust_mr_surv_rev eq 'No'}} selected="selected" {{/if}}> No </option>
       </select>
       
       <script>
	   
       function update_surv_rec(id,value)
		{
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}management_report.update_data/cust_id_sr/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	
       </script>
       
       </td>
      
       {{if $item.bcust_mr_surv_impl eq 'No'}}
       		<td style="background: #F00;">
       {{else}}
       		<td>
       {{/if}} 
       <select name="sur_impl[{{$item.bcust_id}}]" Onchange = "update_surv_impl({{$item.bcust_id}},this.value)" >
       <option value="No"  {{if $item.bcust_mr_surv_impl eq 'No'}} selected="selected" {{/if}}> No </option>
       <option value="Yes" {{if $item.bcust_mr_surv_impl eq 'Yes'}} selected="selected" {{/if}}> Yes </option>
       </select>
       
       <script>
 	   
         function update_surv_impl(id,value)
		{
		
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}management_report.update_data/cust_id_si/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	</script>
        
        </td> 
        
       <!--{{if $item.bcust_mr_pp_req eq 'No'}}
       		<td style="background: #F00;">
       {{else}}
       		<td>
       {{/if}} 
       m
       <select name="sur_pprs[{{$item.bcust_id}}]" Onchange = "update_pp_rs({{$item.bcust_id}},this.value)" >
       <option value="No"  {{if $item.bcust_mr_pp_req eq 'No'}} selected="selected" {{/if}}> No </option>
       <option value="Yes" {{if $item.bcust_mr_pp_req eq 'Yes'}} selected="selected" {{/if}}> Yes </option>
       </select>
       
       <script>
 	   
         function update_pp_rs(id,value)
		{
		
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}management_report.update_data/cust_id_pprs/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	
       </script>
        
        </td> -->
        
     
       <td> {{$item.overarchi}}
       <!--<input type="text" name="arch_pp[{{$item.bcust_id}}]"  value="{{$item.bcust_mr_arch_pp}}" onkeyup="update_arch_pp({{$item.bcust_id}},this.value)"  />  
     
       
       <script>
 	   
         function update_arch_pp(id,value)
		{
		
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}management_report.update_data/cust_id_archpp/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	
       </script>-->
        
       </td>
      
       {{if $item.bcust_mr_reday_nick eq 'No'}}
       		<td style="background: #F00;">
       {{else}}
       		<td>
       {{/if}} 
       
       <select name="ready[{{$item.bcust_id}}]" Onchange = "update_ready({{$item.bcust_id}},this.value)" >
       <option value="No"  {{if $item.bcust_mr_reday_nick eq 'No'}} selected="selected" {{/if}}> No </option>
       <option value="Yes" {{if $item.bcust_mr_reday_nick eq 'Yes'}} selected="selected" {{/if}}> Yes </option>
       <option value="Done" {{if $item.bcust_mr_reday_nick eq 'Done'}} selected="selected" {{/if}}> Done </option>
       </select>
       
       <script>
 	   
         function update_ready(id,value)
		{
		
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}management_report.update_data/cust_id_ready/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	
       </script>
        
       
       {{if $item.bcust_mr_pr_readyfor eq 'No'}}
       		<td style="background: #F00;">
       {{else}}
       		<td>
       {{/if}} 
        
       <select name="pr_ready[{{$item.bcust_id}}]" Onchange = "update_pr_ready({{$item.bcust_id}},this.value)" >
       <option value="Yes" {{if $item.bcust_mr_pr_readyfor eq 'Yes'}} selected="selected" {{/if}}> Yes </option>
       <option value="No"  {{if $item.bcust_mr_pr_readyfor eq 'No'}} selected="selected" {{/if}}> No </option>
       </select>
       
       <script>
	   
       function update_pr_ready(id,value)
		{
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}management_report.update_data/cust_id_readyfor/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	
       </script>
       
       </td>
       
        <td>
        {{$item.bt_completed_date_663}}
       <!-- <form name="pp" method="post" action="">
          <input type="text" name="pp_by_nick[{{$item.bcust_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo1_{{$item.bcust_id}}" value="{{$item.bcust_mr_pp_nick}}"  /> 
          <input type="submit" value="Set" name="ppnic" class="set" />
          </form>-->
        </td> 
        
       <td>
       <select name="pp_signed[{{$item.bcust_id}}]" Onchange = "update_pp_signed({{$item.bcust_id}},this.value)" >
       <option value="Not Signed" {{if $item.bcust_mr_ppsigned eq 'Not Signed'}} selected="selected" {{/if}}>Customer Hasn't signed</option>
       <option value="Completed"  {{if $item.bcust_mr_ppsigned eq 'Completed'}} selected="selected" {{/if}}>Completed</option>
       </select>
       
       <script>
	   
       function update_pp_signed(id,value)
		{
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}management_report.update_data/cust_id_ppsigned/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	
       </script>
       
       </td>
       
       {{if $item.bcust_mr_ent_lodg eq 'No'}}
       		<td style="background: #F00;">
       {{else}}
       		<td>
       {{/if}}
       
       <select name="ent_lod[{{$item.bcust_id}}]" Onchange = "update_el({{$item.bcust_id}},this.value)" >
       <option value="Yes" {{if $item.bcust_mr_ent_lodg eq 'Yes'}} selected="selected" {{/if}}> Yes </option>
       <option value="No"  {{if $item.bcust_mr_ent_lodg eq 'No'}} selected="selected" {{/if}}> No </option>
       </select>
       
       <script>
	   
       function update_el(id,value)
		{
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}management_report.update_data/cust_id_el/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	
       </script>
       </td>
        
         <td> 
       
         <form name="goal" method="post" action="">
          <input type="text" name="goal_date_da[{{$item.bcust_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo2_{{$item.bcust_id}}" value="{{$item.bcust_mr_goal_date}}"  /> 
          <input type="submit" value="Set" name="goal_date" class="set" />
          </form>
         
         </td>
         
          
       {{if $item.bcust_mr_da_lodged eq 'No'}}
       		<td style="background: #F00;">
       {{else}}
       		<td>
       {{/if}}
       
     
       <select name="da_lod[{{$item.bcust_id}}]" Onchange = "update_dl({{$item.bcust_id}},this.value)" >
       <option value="Yes" {{if $item.bcust_mr_da_lodged eq 'Yes'}} selected="selected" {{/if}}> Yes </option>
       <option value="No"  {{if $item.bcust_mr_da_lodged eq 'No'}} selected="selected" {{/if}}> Not Yet </option>
       <option value="NA"  {{if $item.bcust_mr_da_lodged eq 'NA'}} selected="selected" {{/if}}> N/A </option>
       </select>
       
       <script>
	   
       function update_dl(id,value)
		{
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}management_report.update_data/cust_id_dl/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	
       </script>
       
       </td> 
       
         <td>
          <form name="goal" method="post" action="">
          <input type="text" name="likely_da[{{$item.bcust_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo3_{{$item.bcust_id}}" value="{{$item.bcust_mr_likely_da_dt}}"  /> 
          <input type="submit" value="Set" name="likely_date" class="set" />
          </form>
         </td> 
      
      
        <td> 
         
       <select name="ba_log[{{$item.bcust_id}}]" Onchange = "update_ba_lod({{$item.bcust_id}},this.value)" >
       <option value="Cant Lodge" {{if $item.bcust_mr_ba_lodged eq 'Cant Lodge'}} selected="selected" {{/if}}>Can't Lodge</option>
       <option value="Yes"  {{if $item.bcust_mr_ba_lodged eq 'Yes'}} selected="selected" {{/if}}> Yes </option>
       </select>
       
       <script>
	   
       function update_ba_lod(id,value)
		{
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}management_report.update_data/cust_id_ba_l/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	
       </script>
       </td> 
      
      
       <td>
       <form name="csbdba" method="post" action="">
          <input type="text" name="csbd_ba[{{$item.bsn_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo4_{{$item.bsn_id}}" value="{{$item.bsn_latest_csbd}}"  /> 
          <input type="submit" value="Set" name="csbd_day" class="set" />
       </form>
       
       </td>
       
       
       {{if $item.bcust_mr_csbd_accu eq 'No'}}
       		<td style="background: #F00;">
       {{else}}
       		<td>
       {{/if}}
       
       <select name="csbd_accu[{{$item.bcust_id}}]" Onchange = "update_cs_accu({{$item.bcust_id}},this.value)" >
       <option value="Yes" {{if $item.bcust_mr_csbd_accu eq 'Yes'}} selected="selected" {{/if}}> Yes </option>
       <option value="No"  {{if $item.bcust_mr_csbd_accu eq 'No'}} selected="selected" {{/if}}> No </option>
       </select>
       
       <script>
	   
       function update_cs_accu(id,value)
		{
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}management_report.update_data/cust_id_cac/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	
       </script>
       
       </td>
       
        <td><strong>{{$item.bcust_fname}} &nbsp; {{$item.bcust_lname}}</strong><br />{{$item.bsn_address}}</td>
       
      </tr>
     
      
      {{assign var=countn value=$countn-1}}
      {{/foreach}}
      </tbody>
      
  
    {{/if}}
  </table>
    </form>

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
  {{/if}} 

</div>
</div>