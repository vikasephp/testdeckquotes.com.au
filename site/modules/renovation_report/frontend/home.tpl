<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/default.js"></script>

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<link rel="stylesheet" type="text/css" href="https://www.deckquotes.com.au/js/tiny_mce/themes/advanced/skins/default/ui.css" />
<link rel="stylesheet" type="text/css" href="https://www.deckquotes.com.au/css/default/cis-styles.css" />
{{include file=$jdata}}
{{include file=$tiny_basic}}

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


function close_win()
	{
	$.fancybox.close();
	window.location.reload();
	}
</script>


<script type="text/javascript" > 
function addfeedback(bsn_id)
{
	var viewurl = "{{$BASE_URL}}renovation_report.addfeedback"+ "/bsn_id/" + bsn_id;	
	
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
	var viewurl = "{{$BASE_URL}}renovation_report.viewfeedback"+ "/bsn_id/" + bsn_id;	
	
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

function add_procedure()
{
	var viewurl = "{{$BASE_URL}}renovation_report.view_procedure"+ "/random/" + Math.random();	

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

.tableFixHead          { overflow-y: auto; height: 700px; }
.tableFixHead thead th { position: sticky; top: 0; text-align:left; }

table  { border-collapse: collapse; width: 100%; }
th     { z-index:9999; }


.wrapper1, .wrapper2{width: 100%; border: none 0px RED;
overflow-x: scroll; overflow-y:hidden; scrollbar-color: yellow blue;}
.wrapper1{height: 20px; }
.wrapper2{ }
.div1 {width:3080px; height: 20px; }
.div2 {width:3080px;  overflow: auto;}  
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
#fancybox-wrap {z-index:9999999;}
</style>

<h3 class="page-title">{{$title}}</h3>
<br />

<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
<div style="float:left; text-align:left;"> 
&nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> <br />
&nbsp; &nbsp; <strong>Search:</strong>&nbsp;&nbsp;
<input type="text" name="searchkey" value="{{$searchkey}}" style="width:300px;" placeholder="Enter Address"/>
&nbsp;&nbsp;
<input type="submit" value="Search" name="searchaddr"  />
<input type="submit" value="Clear Search" name="clear"  /> 
<br />
&nbsp;&nbsp;&nbsp;&nbsp;<strong>Sort Order</strong>
<select name="sortorder">
<option value="1" {{if $ascdsc eq 1 }} selected="selected" {{/if}} > Ascending </option>
<option value="2" {{if $ascdsc eq 2 }} selected="selected" {{/if}} > Descending </option>
</select>
&nbsp;&nbsp;
<strong>Sort By :</strong>
<input type="submit" value="Percentage Completed" name="pbd"  />
<input type="submit" value="Design Agreement Signed Date" name="fsp"  />
<input type="submit" value="Sort By Designer" name="des"  />
</div> 

<div style="float:right;">

<input type="button" value="Export To XLS" onclick="document.location.href='{{$BASE_URL}}renovation_report.home/export/1'" /> &nbsp;
<input type="submit" value="Show Hidden" name="unhide"  />
</div>
</form>

<div class="wrapper1">
    <div class="div1">
    </div>
</div>

<div class="wrapper2">
  <div class="div2 tableFixHead">


  <table id="list-table" class="nav-back tableFixHead" width="100%">
    <thead>
      <tr>
        <th class="topmenu" align="center" valign="middle" width="3%">SrNo</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Customer Detail</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Contacts</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Link</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Design Agreement$$</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Onsite Measure Completed</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Relevant Checklist Numbers</th>   
        <th class="topmenu" align="center" valign="middle" width="5%">Type</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Design Agreement Signed Date</th>
        <th class="topmenu" align="center" valign="middle" width="5%">First Meeting Date</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Initial Design Sent</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Day Count</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Designer</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Overseas Architect</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Latest Merge Meeting Notes</th> 
        <th class="topmenu" align="center" valign="middle" width="4%">% Completed</th>  
        <th class="topmenu" align="center" valign="middle" width="4%">Where are we at?</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Letter Text</th> 
        <th class="topmenu" align="center" valign="middle" width="4%">Last Meeting</th>   
        <th class="topmenu" align="center" valign="middle" width="4%">Number of Days</th> 
        <th class="topmenu" align="center" valign="middle" width="4%">Alerts</th> 
        <th class="topmenu" align="center" valign="middle" width="5%">Targert Design Sign Off</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Actual Design Approved Date</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Customer Designer Hours</th>
         <th class="topmenu" align="center" valign="middle" width="5%">Overseas Architect Hours</th>
         <th class="topmenu" align="center" valign="middle" width="5%">Next Plan Due Date</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Total Hours</th>
    	<th class="topmenu" align="center" valign="middle" width="5%">Sign off Sent date</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Customer Budget</th>
        <th class="topmenu" align="center" valign="middle" width="12%">SQM</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Estimate Cost</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Likely site scope value</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Project Proposal Meeting date</th>
       <th class="topmenu" align="center" valign="middle" width="8%"> Date Finalise Sent Request</th> 
       <th class="topmenu" align="center" valign="middle" width="8%">Building File</th>
       <th class="topmenu" align="center" valign="middle" width="8%">Proposal Checklist</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Latest Merged Plans</th>
	<th class="topmenu" align="center" valign="middle" width="8%">Sales Follow Up</th>
	<th class="topmenu" align="center" valign="middle" width="8%">Hide From Report</th>

      </tr>
    {{if $list}}
    <tbody>
    <form name="mlist" method="post">
      <!--{{assign var=countn value= $numstartvounter}}-->
       {{assign var=countn value= $total}}
      
      {{foreach from=$list key="key" item="item"}}
      <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
        <td> {{$countn}} </td>
        <td><strong>{{$item.bcust_fname}} &nbsp; {{$item.bcust_lname}}</strong> <br />
        {{$item.bsn_address}}</td>
        <td> 
        <a href="{{$BASE_URL}}js/vcard/index.php?fname={{$item.bcust_fname}}&lname={{$item.bcust_lname}}&email1={{$item.bcust_misc_email1}}&email2={{$item.bcust_misc_email2}}&mobile={{$item.bcust_misc_moble}}&business={{$item.bcust_misc_business}}&home={{$item.bcust_misc_home}}" class="action_new" title="Download Vcard"><img style="height: 17px; width:22px" src="{{$BASE_URL}}images/vcard.png"/></a> </td>
      </td>
        <td style="text-align:center;" ><a href = "{{$item.link}}" target="blank">Link</a></td>
        <td>
         <input type="text" name="de_agreement[{{$item.dpn_unique_id}}]" value="{{$item.dpn_rr_deagree}}" onkeyup = "update_de_ag({{$item.dpn_unique_id|ltrim:'0'}},this.value)" style="width:80px;"/>
       
        <script>
	   
	   function update_de_ag(id,value)
		{
			
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}renovation_report.update_design_agreement/dpn_unique_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
	
       </script>
         </td>
                   
        <td style="text-align:center;" > 
          <form name = "ons" method="post" action="">
        <input type="text" name="onsite[{{$item.dpn_unique_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo1_{{$item.dpn_unique_id}}" value="{{$item.dpn_rr_onsite}}"  /> 
       <input type="submit" value="Set" name="onsite_meas" class="set" />
       </form>   
        </td>
        
        <td style="text-align:center;" >{{$item.dpn_unique_id}}</td>
        <td>{{$item.type}}</td>
        <td>{{$item.data592}}</td>
        
        <td style="text-align:center;" >
        <form name = "fimdt" method="post" action="">
        <input type="text" name="first_met_dt[{{$item.dpn_unique_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo2_{{$item.dpn_unique_id}}" value="{{$item.dpn_rr_fm_date}}"  /> 
       <input type="submit" value="Set" name="fmd" class="set" />
       </form>
        </td>
      
   
        <td style="text-align:center;" >
         {{if $item.checklist37}}
      <!--   <a href = "https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.checklist37}}?dummy={{$ran}}" target="_blank">Download</a>-->
         <a href = "/renovation_report.download_content?file_name={{$item.checklist37}}&module_name=renovation_report.home" target="_blank">Download</a>   
            
             <br />{{$item.checklist37_date}}
              {{/if}}
        </td>
        <td style="text-align:center;" >{{$item.dayscount}}</td>
        <td>{{$item.dpn_customer_designer}}</td>
        <td>{{$item.dpn_architect}}</td>
       
       
        <td> {{if $item.checklist5}}
       <!--<a href = "https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.checklist5}}?dummy={{$ran}}" target="_blank">Download</a>-->
            <a href = "/renovation_report.download_content?file_name={{$item.checklist5}}&module_name=renovation_report.home" target="_blank">Download</a> 
             
             {{/if}}
        </td>
        
        
        <td>
        <input type="text" name="per_comp[{{$item.dpn_unique_id}}]" value="{{$item.dpn_rr_percentage}}" onkeyup = "update_per_comp({{$item.dpn_unique_id|ltrim:'0'}},this.value)" style="width:50px;"/>
      
        <script>
	   
	   function update_per_comp(id,value)
		{
		
			
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}renovation_report.update_percentage/dpn_unique_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
	
       </script>
        </td>
          <td>   <textarea rows="4" cols="40"  id="{{$item.dpn_unique_id}}" style="overflow-y: scroll;">{{$item.dpn_rr_where_are}}</textarea>       
   
       <script>
	   
	    $(document).ready(function(){
                     $("#{{$item.dpn_unique_id}}").keyup(function(){
                           update_where_we_are({{$item.dpn_unique_id|ltrim:'0'}},this.value);
                     });
             });
	     
	   
	   
	   function update_where_we_are(id,value)
		{
		//alert(id);	
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}renovation_report.update_where_we_are/dpn_unique_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
	
       </script>
        </td>   
         <td>
        
         <input type="text" name="letter_text[{{$item.dpn_unique_id}}]" value="{{$item.dpn_rr_letter_text}}" onkeyup = "update_letter_text({{$item.dpn_unique_id|ltrim:'0'}},this.value)" style="width:80px;"/>
       
        <script>
	   
	   function update_letter_text(id,value)
		{
			
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}renovation_report.update_letter_text/dpn_unique_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
	
       </script>
        
         </td>
             
        <td>{{$item.checklist54_date}}</td>
              
       <td style="text-align:center;" >{{$item.days}}</td>
     
    <td style="text-align:center;" >
           <input type="text" name="alerts[{{$item.dpn_unique_id}}]" value="{{$item.dpn_rr_alerts}}" onkeyup = "update_alert({{$item.dpn_unique_id|ltrim:'0'}},this.value)" style="width:80px;"/>
       
        <script>
	   
	   function update_alert(id,value)
		{
			
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}renovation_report.update_alert/dpn_unique_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
	
       </script>
        </td>
       
       
        <td style="text-align:center;" >
         <form name = "tar" method="post" action="">
        <input type="text" name="target[{{$item.dpn_unique_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo3_{{$item.dpn_unique_id}}" value="{{$item.dpn_rr_target_design}}"  /> 
       <input type="submit" value="Set" name="tar_sign" class="set" />
       </form> 
        </td>
     
  
        <td style="text-align:center;" >
       <form name = "act" method="post" action="">
       <input type="text" name="actual[{{$item.dpn_unique_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo4_{{$item.dpn_unique_id}}" value="{{$item.dpn_rr_actual_de_dt}}"  /> 
       <input type="submit" value="Set" name="actual_design" class="set" />
       </form>      
        </td>
       
        <td>
        
           <input type="text" name="cd_hour[{{$item.dpn_unique_id}}]" value="{{$item.dpn_rr_cust_de_hour}}" onkeyup = "update_cd_hour({{$item.dpn_unique_id|ltrim:'0'}},this.value)" style="width:40px;"/>
       
        <script>
	   
	   function update_cd_hour(id,value)
		{
			
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}renovation_report.update_cd_hours/dpn_unique_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
	
       </script>
        </td>
          <td style="text-align:center;" >
           <input type="text" name="oa_hour[{{$item.dpn_unique_id}}]" value="{{$item.dpn_rr_over_arch_hour}}" onkeyup = "update_oa_hour({{$item.dpn_unique_id|ltrim:'0'}},this.value)" style="width:40px;"/>
       
        <script>
	   
	   function update_oa_hour(id,value)
		{
			
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}renovation_report.update_oa_hours/dpn_unique_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
	
       </script>
        
        </td>
        <td> 
       <form name = "next" method="post" action="">
       <input type="text" name="next_plan[{{$item.dpn_unique_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo55_{{$item.dpn_unique_id}}" value="{{$item.dpn_rr_next_plan}}"  /> 
       <input type="submit" value="Set" name="nextplan_date" class="set" />
       </form>
        
        </td>
       
        <td style="text-align:center;" > 
        
        <input type="text" name="tot_hour[{{$item.dpn_unique_id}}]" value="{{$item.dpn_rr_total_hours}}" onkeyup = "update_tot_hour({{$item.dpn_unique_id|ltrim:'0'}},this.value)" style="width:40px;"/>
       
        <script>
	   
	   function update_tot_hour(id,value)
		{
			
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}renovation_report.update_tot_hours/dpn_unique_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
	
       </script>
        
        </td>
   
       <td style="text-align:center;" >
       <form name = "signoff" method="post" action="">
       <input type="text" name="sign_off[{{$item.dpn_unique_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo5_{{$item.dpn_unique_id}}" value="{{$item.dpn_rr_sign_off}}"  /> 
       <input type="submit" value="Set" name="signoff_date" class="set" />
       </form> 
        </td>
          
         <td>{{$item.dpn_budget}}</td> 
                  
        <td style="text-align:center;" > 
         <input type="text" name="sqm[{{$item.dpn_unique_id}}]" value="{{$item.dpn_rr_sqm}}" onkeyup = "update_sqm({{$item.dpn_unique_id|ltrim:'0'}},this.value)" style="width:40px;"/>
       
        <script>
	   
	   function update_sqm(id,value)
		{
			
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}renovation_report.update_sqm/dpn_unique_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
	
       </script>
             
        </td>
        
        <td>
        
        <input type="text" name="est[{{$item.dpn_unique_id}}]" value="{{$item.dpn_rr_est_cost}}" onkeyup = "update_est_cost({{$item.dpn_unique_id|ltrim:'0'}},this.value)" style="width:60px;"/>
       
        <script>
	   
	   function update_est_cost(id,value)
		{
			
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}renovation_report.update_est_cost/dpn_unique_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
	
       </script>
       </td>
        <td> 
        <input type="text" name="likely[{{$item.dpn_unique_id}}]" value="{{$item.dpn_rr_likely}}" onkeyup = "update_likely({{$item.dpn_unique_id|ltrim:'0'}},this.value)" style="width:60px;"/>
       
        <script>
	   
	   function update_likely(id,value)
		{
			
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}renovation_report.update_likely/dpn_unique_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
	
       </script>
        
        </td>
        
        <td> 
        <form name = "pp" method="post" action="">
       <input type="text" name="pp_meet[{{$item.dpn_unique_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo6_{{$item.dpn_unique_id}}" value="{{$item.dpn_rr_pp_meeting_dt}}"  /> 
       <input type="submit" value="Set" name="ppmeet_date" class="set" />
       </form> 
        </td>
        <td>
         <form name = "fin" method="post" action="">
       <input type="text" name="finadate[{{$item.dpn_unique_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo7_{{$item.dpn_unique_id}}" value="{{$item.dpn_rr_dt_finalise}}"  /> 
       <input type="submit" value="Set" name="finalize_date" class="set" />
       </form> 
        </td>
        
        <td> 
        <select name="buildingfile[{{$item.bsn_id}}]" Onchange = "update_bui_file({{$item.dpn_unique_id|ltrim:'0'}},this.value)" >
       <option value="Yes" {{if $item.dpn_rr_building_file eq 'Yes'}} selected="selected" {{/if}}> YES </option>
       <option value="NA"  {{if $item.dpn_rr_building_file eq 'NA'}} selected="selected" {{/if}}> NA </option>
       </select>
       
       <script>
	   
		function update_bui_file(id,value)
		{
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}renovation_report.update_building_file/dpn_unique_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	</script>
        </td>
        <td>{{$item.dcnt_counter}} </td>
        
        <td>
          {{if $item.checklist3}}
           <!-- <a href = "https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.checklist3}}?dummy={{$ran}}" target="_blank">Download</a>-->
            <a href = "/renovation_report.download_content?file_name={{$item.checklist3}}&module_name=renovation_report.home" target="_blank">Download</a> 
            
          {{/if}}
        </td>
        <td> 
         <input type="button" name="Alert" value="Add Feedback" onclick="javascript:addfeedback({{$item.bsn_id}});" style="width:90px; height:20px; font-size:11px; line-height:17px !important; padding:0px !important" /><br />
         <input type="button" name="Alert" value="View Feedback" onclick="javascript:viewfeedback({{$item.bsn_id}});" style="width:90px; height:20px; font-size:11px; line-height:17px !important; padding:0px !important" />
     
        
        </td>
        <td>
       
        <form name ="recmet" method="post" action="">
        <input type="hidden" name="hide[{{$item.dpn_unique_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="hide[{{$item.dpn_unique_id}}]" value="1"  onclick="this.form.submit();" {{if $item.dpn_rr_hide eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
            </label>
             
   	</form> 
        
        </td> 
        
      </tr>
      {{assign var=countn value=$countn-1}}
      {{/foreach}}
      </tbody>
      
    </form>
    {{/if}}
  </table>
  
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

</div>