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


function add_procedure()
{
	var viewurl = "{{$BASE_URL}}design_report_renovation.view_procedure"+ "/random/" + Math.random();	

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
	var viewurl = "{{$BASE_URL}}design_report_renovation.addfeedback"+ "/bsn_id/" + bsn_id;	
	
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
function add_letter()
{
	var viewurl = "{{$BASE_URL}}design_report_renovation.viewletter"+ "/random/" + Math.random();	
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
	var viewurl = "{{$BASE_URL}}design_report_renovation.viewfeedback"+ "/bsn_id/" + bsn_id;	
	
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
	   
.wrapper1, .wrapper2{width: 100%; border: none 0px RED; overflow-x: scroll; overflow-y:hidden; scrollbar-color: yellow blue; }	   


.wrapper1{height: 20px; }
.wrapper2{ }
.div1 {width:5290px; height: 20px; }
.div2 {width:5290px;  overflow: auto;}   
.tableFixHead          { overflow-y: auto; height: 1200px; }
.tableFixHead thead th { position: sticky; top: 0; text-align:left; }
table  { border-collapse: collapse; width: 100%; }
th     { z-index:9999; }
 #fancybox-wrap {z-index:9999999;}   
</style>

<h3 class="page-title">Renovation Design Report - INACTIVE</h3>
<br />

<form name="sort" method="post">
<div style="float:left; text-align: left; margin-left:10px; text-align:left">

&nbsp; &nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> 
<input type="button" name="Add New" value="Letter Text Admin" onclick="javascript:add_letter();" /> <br />

<div style="float:left;"> &nbsp; <strong>Search:</strong>&nbsp;&nbsp;
<input type="text" name="searchkey" value="{{$searchkey}}" style="width:200px;" placeholder="Search By Checklist Number"/>
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" value="Search" name="searchaddr"  />
<input type="submit" value="Clear Search" name="clear"  /> 
</div>
<br />

<div style="float:left;padding-left:10px;">
<strong>Sort Order</strong>
<select name="sortorder">
<option value="1" {{if $ascdsc eq 1 }} selected="selected" {{/if}} > Ascending </option>
<option value="2" {{if $ascdsc eq 2 }} selected="selected" {{/if}} > Descending </option>
</select>
<strong>Sort By :</strong>
<input type="submit" value="Design Agreement Signed Date " name="dasd"  />
<input type="submit" value="Sort By Designer" name="sortbydesigner"  />
</div>
<br />
<div style="float:left;padding-left:10px;">

<strong>Select Designer</strong>
<select name="design">
     {{foreach from=$des_data key="keyd" item="itemd"}}
         <option value="{{$itemd.prd_name}}" {{if $ascdsc eq 1 }} selected="selected" {{/if}} > {{$itemd.prd_name}} </option>
    {{/foreach}}
</select>
<input type="submit" value="Search" name="searchdesigner"  />
<input type="submit" value="Show Reno Only" name="reno_only"  />
<input type="submit" value="Clear Search" name="clear"  />
</div>

</form>

<form name="mlist" method="post">
<div style="float:right;"> 
<input type="button" value="Export To XLS" onclick="document.location.href='{{$BASE_URL}}design_report_renovation.home_inactive/export/1'" /> &nbsp;
<input type="submit" value="Save Move to Active" name="hideupdate"  />

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
        <th class="topmenu" align="center" valign="middle" width="2%">Rating</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Relevant Checklist Numbers</th>
        <!--<th class="topmenu" align="center" valign="middle" width="3%">Renovation Checklist Numbers</th>-->
        <th class="topmenu" align="center" valign="middle" width="11%">Customer Details</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Project Address <br />Same As<br /> Customer Address</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Contacts</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Link</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Design <br />Agreement $$</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Building File</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Survey Status</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Survey Details</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Survey Uploaded</th>
        <th class="topmenu" align="center" valign="middle" width="3%">DWG Uploaded</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Survey Implemented</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Aerial Inspection Completed</th>
        <th class="topmenu" align="center" valign="middle" width="3%">RR</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Scan</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Reno Only</th>
      	<th class="topmenu" align="center" valign="middle" width="4%">Type</th>
        <th class="topmenu" align="center" valign="middle" width="4%">What</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Design <br />Agreement<br /> Signed Date </th>
        <th class="topmenu" align="center" valign="middle" width="8%">First Meeting Date</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Day Count</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Designer</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Overseas Architect</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Commencement Plans</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Latest Merge Meeting Notes</th>
        <th class="topmenu" align="center" valign="middle" width="10%">Where are we at?</th> 
        <th class="topmenu" align="center" valign="middle" width="7%">% Completed</th> 
        <th class="topmenu" align="center" valign="middle" width="7%">Letter Text</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Plans Attached to Letter</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Customer<br />Budget</th>
        <th class="topmenu" align="center" valign="middle" width="5%">SQM</th>
        <th class="topmenu" align="center" valign="middle" width="14%">Estimate Build Cost</th>
        <th class="topmenu" align="center" valign="middle" width="14%">Likely site scope value</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Estimated Renovation Cost</th> 
        <th class="topmenu" align="center" valign="middle" width="7%">Reno + Extn</th> 
        <th class="topmenu" align="center" valign="middle" width="12%">Last Meeting</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Number Of Days</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Alerts</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Target Design Sign Off</th> 
        <th class="topmenu" align="center" valign="middle" width="7%">Customer Designer Hours</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Overseas Architect Hours</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Total Hours</th>
	<th class="topmenu" align="center" valign="middle" width="7%">Sign off sent date</th>
         <th class="topmenu" align="center" valign="middle" width="7%">Pricing Red Light</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Proposal<br />Checklist</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Latest<br />Mrged Plans</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Latest<br />Client Letter</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Sales Follow Up</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Customer Details </th>
        <th class="topmenu" align="center" valign="middle" width="4%">Last Audit </th>
        <th class="topmenu" align="center" valign="middle" width="12%">Move to Active </th>
        <th class="topmenu" align="center" valign="middle" width="12%">Add To Construction Pipeline Report</th>
        
      </tr>
    </thead>
    {{if $list}}
    <tbody>
    
      <!--{{assign var=countn value= $numstartvounter}}-->
       {{assign var=countn value= $total}}
      
      {{foreach from=$list key="key" item="item"}}
      
    
      <tr {{if $item.dpn_dr_per_complete eq 100}} bgcolor="#99CC99" {{else}} bgcolor="{{cycle values="#dceff5,WHITE" advance=true}} {{/if}}">
        <td> 
       
       <select name="rating[{{$item.chknoData}}]" Onchange = "update_rating({{$item.chknoData|ltrim:'0'}},this.value)" >
       <option value="1" {{if $item.dpn_dr_rating eq 1}} selected="selected" {{/if}}> 1 </option>
       <option value="2" {{if $item.dpn_dr_rating eq 2}} selected="selected" {{/if}}> 2 </option>
       <option value="3" {{if $item.dpn_dr_rating eq 3}} selected="selected" {{/if}}> 3 </option>
       <option value="4" {{if $item.dpn_dr_rating eq 4}} selected="selected" {{/if}}> 4 </option>
       <option value="5" {{if $item.dpn_dr_rating eq 5}} selected="selected" {{/if}}> 5 </option>
       <option value="6" {{if $item.dpn_dr_rating eq 6}} selected="selected" {{/if}}> 6 </option>
       <option value="7" {{if $item.dpn_dr_rating eq 7}} selected="selected" {{/if}}> 7 </option>
       <option value="8" {{if $item.dpn_dr_rating eq 8}} selected="selected" {{/if}}> 8 </option>
       <option value="9" {{if $item.dpn_dr_rating eq 9}} selected="selected" {{/if}}> 9 </option>
       <option value="10" {{if $item.dpn_dr_rating eq 10}} selected="selected" {{/if}}> 10 </option>
       </select>  
       
       <script language="javascript">
       	
	function update_rating(id,value)
		{
			
		 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}design_report.update_rating/dpn_unique_id/"+id+"/value/"+value,
						   success: function(result){
					   }
					 });
		
		}
       
       </script>
          
        </td>
        
        <td> {{$item.chknoData}} </td>
     <!--   <td> {{$item.reno_checklist_no}} </td>  -->   
        <td> <strong>{{$item.bcust_fname}} &nbsp; {{$item.bcust_lname}}</strong> <br />{{$item.bsn_address}}</td>
      
        <td><input type="checkbox"  {{if $item.bsn_address_same eq 1}} checked="checked" {{/if}} /> </td>
        <td> <a href="{{$BASE_URL}}js/vcard/index.php?fname={{$item.bcust_fname}}&lname={{$item.bcust_lname}}&email1={{$item.bcust_misc_email1}}&email2={{$item.bcust_misc_email2}}&mobile={{$item.bcust_misc_moble}}&business={{$item.bcust_misc_business}}&home={{$item.bcust_misc_home}}" class="action_new" title="Download Vcard"><img style="height: 17px; width:22px" src="{{$BASE_URL}}images/vcard.png"/></a> </td>
      
       <td style="text-align:center;" ><a href = "{{$item.link}}" target="blank">Link</a></td>
       <td> 
     <!--  <input type="text" name="desagr[{{$item.bsn_id}}]" value="{{$item.bsn_design_agreement}}" onkeyup = "update_da_currency({{$item.bsn_id}},this.value)" style="width:50px;"/>

--> <input type="text" name="desagr[{{$item.chknoData}}]" value="{{$item.dpn_dr_deagree}}" onkeyup = "update_da_currency({{$item.chknoData|ltrim:'0'}},this.value)" style="width:50px;"/>
            
       <script>
	   
	   function update_da_currency(id,value)
		{
			
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}design_report.update_design_agree_curr/dpn_unique_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
	
       </script>
       </td>
              <td> 
        <select name="bsn_building_file[{{$item.chknoData}}]" Onchange = "update_building_file({{$item.chknoData|ltrim:'0'}},this.value)" >
       <option value="Yes" {{if $item.dpn_dr_building_file eq 'Yes'}} selected="selected" {{/if}}> Yes </option>
       <option value="NA" {{if $item.dpn_dr_building_file eq 'NA'}} selected="selected" {{/if}}> NA </option>
           </select>
       
       <script>
	   
        function update_building_file(id,value)
		{
			
		 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}design_report.update_building_file/dpn_unique_id/"+id+"/value/"+value,
						   success: function(result){
					   }
					 });
		
		}
	
       </script>
       
       </td>
       
       
       <td> 
  <select name="survey[{{$item.chknoData}}]" Onchange = "update_survey({{$item.chknoData|ltrim:'0'}},this.value)" >
        <option value="Requested" {{if $item.dpn_dr_survey eq 'Requested'}} selected="selected" {{/if}}>Requested</option>
       <option value="TBC" {{if $item.dpn_dr_survey eq 'TBC'}} selected="selected" {{/if}}>TBC</option>
       <option value="Client" {{if $item.dpn_dr_survey eq 'Client'}} selected="selected" {{/if}}>Client</option>
       <option value="CGFB" {{if $item.dpn_dr_survey eq 'CGFB'}} selected="selected" {{/if}}>CGFB</option>
       <option value="Uploaded" {{if $item.dpn_dr_survey eq 'Uploaded'}} selected="selected" {{/if}}>Received/Uploaded </option>
       <option value="Refused" {{if $item.dpn_dr_survey eq 'Refused'}} selected="selected" {{/if}}>Refused</option>
       <option value="Not required" {{if $item.dpn_dr_survey eq 'Not required'}} selected="selected" {{/if}}>Not required</option>
       </select><br />

       
<!--<input type="text" name="bs_dr_survey_date[{{$item.bsn_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo33_{{$item.bsn_id}}" value="{{$item.bs_dr_survey_date}}" onfocus ="update_two({{$item.bsn_id}}, this.value);"  /> 
--> 
 <input type="text" name="dpn_dr_surveydt[{{$item.chknoData}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo33_{{$item.chknoData}}" value="{{$item.dpn_dr_surveydt}}" onfocus ="update_two({{$item.chknoData|ltrim:'0'}}, this.value);"  /> 

            <!-- <input type="submit" value="Set" name="survey" class="set" />-->
      
         <script>
	   
		function update_survey(id,value)
		{
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}design_report.update_survey/cs_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
		
		function update_two(id,value)
		{
			$.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}design_report.update_survey/cs_id2/"+id+"/value2/"+value,
					   success: function(result){
					}
				});
					
		}
		
	</script>
       
        </td>
        <td>  
        <form name ="surdet" method="post" action="">
        Surveyor :<input type="text" name="surveyor[{{$item.chknoData}}]" value="{{$item.dpn_dr_surveyor}}"  style="width:70px;" onkeyup = "update_surveyor({{$item.chknoData|ltrim:'0'}},this.value)"/>
        Who :<input type="text" name="who[{{$item.chknoData}}]" value="{{$item.dpn_dr_who_provided}}"  style="width:70px;" onkeyup = "update_who({{$item.chknoData|ltrim:'0'}},this.value)"/>
	Date :<input type="text" name="cdate[{{$item.chknoData}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo44_{{$item.chknoData}}{{$item.bsn_id}}" value="{{$item.dpn_dr_sur_comp_date}}"  onfocus = "update_three({{$item.chknoData|ltrim:'0'}}, this.value);" /> 
       <!-- <input type="submit" value="Save" name="survey_details" class="set" />-->
        </form>
        
          <script>
        function update_three(id,value)
		{
			
			$.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}design_report.update_survey/cno/"+id+"/dt/"+value,
					   success: function(result){
					}
				});
		}
        
	 function update_surveyor(id,value)
		{
			
			$.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}design_report.update_survey/cnos/"+id+"/sur/"+value,
					   success: function(result){
					}
				});
		}
		
	function update_who(id,value)
		{
			$.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}design_report.update_survey/cnow/"+id+"/who/"+value,
					   success: function(result){
					}
				});
		}	
        
        </script>
        
        
        </td>
       <td>{{if $item.survey_uploaded}}
     <!-- <a href="{{$BASE_URL}}files/document_check_list_files/{{$item.survey_uploaded}}" target="_blank">Link</a>-->
       <a href="/design_report_renovation.download_content_in_dc?file_name={{$item.survey_uploaded}}&module_name=design_report_renovation.home_inactive" target="_blank">Link</a>
      {{/if}}</td>
      <td>  
      {{if $item.checklist179_file}}
      <!--<a href="{{$BASE_URL}}files/document_check_list_files/{{$item.checklist179_file}}" target="_blank">Link</a>-->
       <a href="/design_report_renovation.download_content_in_dc?file_name={{$item.checklist179_file}}&module_name=design_report_renovation.home_inactive" target="_blank">Link</a>
      {{/if}}
      </td>

      
       {{if $item.dpn_dr_survey_imple eq 'No'}}
       		<td style="background:#F00"> 
       {{else}}
    	   <td>
       {{/if}}  
       <a href="{{$BASE_URL}}design_report.txtmsg/dpn_unique_id/{{$item.chknoData|ltrim:'0'}}" class="various">
       <img src="{{$BASE_URL}}images/textmsg.png" /></a> &nbsp;       
        <select name="sur_imp" onchange="update_sur_imp({{$item.chknoData|ltrim:'0'}},this.value)">
        <option value="No"  {{if $item.dpn_dr_survey_imple eq 'No' }} selected="selected" {{/if}} >No</option>
        <option value="Yes" {{if $item.dpn_dr_survey_imple eq 'Yes' }} selected="selected" {{/if}}>Yes</option>
        </select>  <br />
        {{if $item.dpn_dr_survey_imple eq 'Yes' }}{{$item.dpn_dr_survey_imp_user}} <br /> {{$item.dpn_dr_survey_date}}
        {{/if}}
         <script>
	   
		function update_sur_imp(id,value)
		{
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}design_report.update_sur_imp/dpn_unique_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	</script>
             
       </td>
      
       <td>{{$item.tasklist303}}</td>
       <td> 
       
        <select name="renovation_report[{{$item.chknoData}}]" Onchange = "rr_update({{$item.chknoData|ltrim:'0'}},this.value)" >
       <option value="NO" {{if $item.dpn_dr_rr eq 'NO'}} selected="selected" {{/if}}> NO </option>
       <option value="YES" {{if $item.dpn_dr_rr eq 'YES'}} selected="selected" {{/if}}> YES </option>
       </select>
       
       <script>
	   
		function rr_update(id,value)
		{
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}design_report.update_renovation_report/dpn_unique_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	</script>
       </td>
       
       <td> 
       <form name ="recmet30" method="post" action="">
     	<input type="hidden" name="scan[{{$item.chknoData}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="scan[{{$item.chknoData}}]" value="1"  onclick="this.form.submit();" {{if $item.dpn_dr_scan  eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form>  
      </td>
       
       <td>
       <form name ="recmet3" method="post" action="">
     	<input type="hidden" name="renoonly[{{$item.chknoData}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="renoonly[{{$item.chknoData}}]" value="1"  onclick="this.form.submit();" {{if $item.dpn_dr_renoonly  eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form>  
      </td>
       
   
        
       <td> 
       
       <select name="bsn_project_type[{{$item.chknoData}}]" Onchange = "update_project_type({{$item.chknoData|ltrim:'0'}},this.value)" >
       <option value="CD" {{if $item.dpn_dr_type eq 'CD'}} selected="selected" {{/if}}> CD </option>
       <option value="MD" {{if $item.dpn_dr_type eq 'MD'}} selected="selected" {{/if}}> MD </option>
       <option value="PR" {{if $item.dpn_dr_type eq 'PR'}} selected="selected" {{/if}}> PR </option>
       <option value="CR" {{if $item.dpn_dr_type eq 'CR'}} selected="selected" {{/if}}> CR </option>
       <option value="Redesign" {{if $item.dpn_dr_type eq 'Redesign'}} selected="selected" {{/if}}>Redesign </option>
       <option value="Other" {{if $item.dpn_dr_type eq 'Other'}} selected="selected" {{/if}}> Other </option>
       </select>
       
       <script>
	   
        function update_project_type(id,value)
		{
		
		 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}design_report.update_project_type/dpn_unique_id/"+id+"/value/"+value,
						   success: function(result){
					   }
					 });
		
		}
	
       </script>
       
       </td>
      
      <td> 
    
       <select name="design_type[{{$item.chknoData}}]" Onchange = "udt({{$item.chknoData|ltrim:'0'}},this.value)" >
       <option value="SR"    {{if $item.dpn_dr_what eq 'SR'}} selected="selected" {{/if}}> SR </option>
       <option value="FPE"   {{if $item.dpn_dr_what eq 'FPE'}} selected="selected" {{/if}}> FPE </option>
       <option value="Other" {{if $item.dpn_dr_what eq 'Other'}} selected="selected" {{/if}}> Other </option>
       </select>
       
       <script>
 	   
        function udt(id,value)
		{
		
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}design_report.update_design_type/dpn_unique_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
	
       </script>
        
        </td> 
         <td>{{$item.checklist45}}  </td>
       <td> 
       <input type="text" name="dpn_dr_first_meeting_date[{{$item.chknoData}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo1_{{$item.chknoData}}" value="{{$item.dpn_dr_first_meeting_date}}" onfocus = "update_fmd({{$item.chknoData|ltrim:'0'}}, this.value);" /> 
           
           <script>
 	   
        function update_fmd(id,value)
		{
		
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}design_report.update_survey/fmd_id/"+id+"/fmd_value/"+value,
				   success: function(result){
			   }
			 });
		}
	
       </script>     
             <!--<input type="submit" value="Set" name="myob" class="set" />-->
       </td>
      
   
       <td>{{$item.dayscount}} </td>
       <td> {{$item.designer}}</td> 
       <td>{{$item.osarchi}} </td>
       <td>
       {{if $item.checklist53}}
      		{{$item.checklist53|date_format:"%e-%m-%Y"}}
       {{/if}}
<!--      {{if $item.checklist53}}
        {{foreach from=$item.checklist53 key="key5" item="item5"}}
        {{if $item5.doc_file_name}}
      
         {{$item5.doc_date_uploaded|date_format:"%e %m %Y"}}-{{$item5.dpn_unique_id}}
       
         <br>
    {{/if}} 
       {{/foreach}}
       {{/if}}-->  
       </td>
       
       <td>
       
        {{if $item.checklist54}}
      		{{$item.checklist54|date_format:"%e-%m-%Y"}}
       {{/if}}
       
<!--       {{if $item.checklist54}}
        {{foreach from=$item.checklist54 key="key4" item="item4"}}
        {{if $item4.doc_file_name}}
         <a href = "{{$BASE_URL}}files/document_check_list_files/{{$item4.doc_file_name}}" target="_blank">
         Link-{{$item4.dpn_unique_id}}</a>
         <br>
    {{/if}} 
       {{/foreach}}
       {{/if}} -->      
       
        </td>
       
      
 <td> <!--<input type="text" name="whereare[{{$item.bsn_id}}]" value="{{$item.bsn_where_are_we}}" onkeyup = "update_where_are({{$item.bsn_id}},this.value)"/>
   
 --> <input type="text" name="whereare[{{$item.chknoData}}]" value="{{$item.dpn_dr_wherewe}}" onkeyup = "update_where_are({{$item.chknoData|ltrim:'0'}},this.value)"/>
          
       <script>
	   
	   function update_where_are(id,value)
		{
			
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}design_report.update_where_we_are/dpn_unique_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
	
       </script>
       
        </td>
        
          <td>        

  <form name ="perc" method="post" action="">   
        <input type ="text" name ="percentage[{{$item.chknoData}}]" value="{{$item.dpn_dr_per_complete}}" Onchange = "update2({{$item.chknoData|ltrim:'0'}},this.value)" style="width:50px;" />              
  <!--<input type="submit" value="Save" name="saveper" class="set" />-->
  </form>

 <script>
	
		function update2(id,value)
		{
			
		 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}design_report.update_per2/dpn_unique_id/"+id+"/value/"+value,
						   success: function(result){
					   }
					 });
		
		}
	
	
</script>
          
       
       </td>
       
        
        
        
           
       <td>
      <!--  <input type="text" name="letertext[{{$item.bsn_id}}]" value="{{$item.bsn_letter_text}}" onkeyup = "update_letter_text({{$item.bsn_id}},this.value)" style="width:50px;"/>
   -->        <input type ="text" name ="letertext[{{$item.chknoData}}]" value="{{$item.dpn_dr_letter_text}}" Onchange = "update_letter_text2({{$item.chknoData|ltrim:'0'}},this.value)" style="width:50px;" />              
 
       <script> 

	
	function update_letter_text2(id,value)
		{
			
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}design_report.update_letter_text2/dpn_unique_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
	
       </script>
       
        </td> 
        
        
         <td> 
       <form name ="recmet3" method="post" action="">
     	<input type="hidden" name="plan[{{$item.chknoData}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="plan[{{$item.chknoData}}]" value="1"  onclick="this.form.submit();" {{if $item.dpn_dr_plan_attached  eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form>  
      </td>
        
        <!-----Moving Start----->
               <td> 
       <form name ="esti" method="post" action="">
        <input type="text" name="cust_budget[{{$item.chknoData}}]" value="{{$item.dpn_dr_cust_budget}}"  style="width:80px"/>
        <input type="submit" value="Save" name="savebudget" class="set" />
        {{ if $item.dpn_dr_cust_budget}} {{$item.dpn_dr_budg_user}}<br />{{$item.dpn_dr_budg_date}} {{/if}}
       </form>
       </td>
       
       <td> 
   
<input type="text" name="sqm[{{$item.chknoData}}]" value="{{$item.dpn_dr_sqm}}" onkeyup = "update_sqm2({{$item.chknoData|ltrim:'0'}},this.value)" style="width:50px"/>
       
       <script>
	
		
	function update_sqm2(id,value)
		{
			
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}design_report.update_sqm2/dpn_unique_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}	
	
       </script>
       
       </td>
    
       <td>
      
      <a href="{{$BASE_URL}}design_report.txtmsg_ec/dpn_unique_id/{{$item.chknoData|ltrim:'0'}}" class="various">
       {{if $item.dpn_dr_ebc_comm}}<img src="{{$BASE_URL}}images/textmsg.png" />{{else}}<img src="{{$BASE_URL}}images/textmsgred.png" />{{/if}}
       
       </a>
      
         <input type="text" name="estimate[{{$item.chknoData}}]" value="{{$item.dpn_dr_estimate_cost}}" onkeyup = "update_estimate_cost2({{$item.chknoData|ltrim:'0'}},this.value)" style="width:150px"/>
          
       <script>
	   

		
	function update_estimate_cost2(id,value)
		{
			
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}design_report.update_estimate_cost2/dpn_unique_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
	
       </script>
       
        </td>
       
        <td> 
        
          <a href="{{$BASE_URL}}design_report.txtmsg_lsv/dpn_unique_id/{{$item.chknoData|ltrim:'0'}}" class="various">
         {{if $item.dpn_dr_likey_comm}}<img src="{{$BASE_URL}}images/textmsg.png" />{{else}}<img src="{{$BASE_URL}}images/textmsgred.png" />{{/if}}
          
          </a>
 
 
 <!--       <input type="text" name="likelyvalue[{{$item.bsn_id}}]" value="{{$item.bsn_likely_value}}" onkeyup = "update_likely_value({{$item.bsn_id}},this.value)" style="width:150px !important;"/>
--> 
<input type="text" name="likelyvalue[{{$item.chknoData}}]" value="{{$item.dpn_dr_likely_value}}" onkeyup = "update_likely_value2({{$item.chknoData|ltrim:'0'}},this.value)" style="width:150px !important;"/>
      
 
       
       <script>
	   
	
	function update_likely_value2(id,value)
		{
			
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}design_report.update_likely_value2/dpn_unique_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
	
       </script>
       
       </td>
       
       <td>
       
       <a href="{{$BASE_URL}}design_report.txtmsg_erc/dpn_unique_id/{{$item.chknoData|ltrim:'0'}}" class="various">
          {{if $item.dpn_dr_erc_comm}}<img src="{{$BASE_URL}}images/textmsg.png" />{{else}}<img src="{{$BASE_URL}}images/textmsgred.png" />{{/if}}
      
          
          </a>

      
    <input type ="text" name ="reno_cost[{{$item.chknoData}}]" value="{{$item.dpn_dr_erc}}" onkeyup = "update_reno_cost({{$item.chknoData|ltrim:'0'}},this.value)" style="width:150px;" />  
   <script>
	   
	   function update_reno_cost(id,value)
		{
			
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}design_report.update_renovation_cost/dpn_unique_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
	
       </script>      

       </td>
        
       <td> 
 
  <a href="{{$BASE_URL}}design_report.txtmsg_re/dpn_unique_id/{{$item.chknoData|ltrim:'0'}}" class="various">
         {{if $item.dpn_dr_re_comm}}<img src="{{$BASE_URL}}images/textmsg.png" />{{else}}<img src="{{$BASE_URL}}images/textmsgred.png" />{{/if}}
      
          
          </a>
 <input type="text" name="reno_extn[{{$item.chknoData}}]" value="{{$item.dpn_dr_r_plus_e}}" onkeyup = "update_reno_extn2({{$item.chknoData|ltrim:'0'}},this.value)" style="width:150px"/>
         
       
       <script>
	   
	   function update_reno_extn2(id,value)
		{
			
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}design_report.update_reno_extn/dpn_unique_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
	
       </script>
       
        </td>
        
        <!-----Moving End----->
        
        <td>
        {{$item.checklist54}}
<!--        {{if $item.checklist54}}
                {{foreach from=$item.checklist54 key="key4" item="item4"}}
                {{if $item4.doc_file_name}}
                        {{$item4.doc_date_uploaded|date_format:"%e %m %Y"}}
                        <br>
                 {{/if}} 
               {{/foreach}}
       {{/if}} -->   
       </td>
        <td>
        
        {{$item.dayscount}}
<!--        {{if $item.checklist54}}
                {{foreach from=$item.checklist54 key="key4" item="item4"}}
                {{if $item4.doc_file_name}}
                        {{$item4.days}}
                        <br>
                 {{/if}} 
               {{/foreach}}
       {{/if}}-->    
         </td>
        
       <td> 
       
 <!--    <input type="text" name="alerts[{{$item.bsn_id}}]" value="{{$item.bsn_alerts}}" onkeyup = "update_alerts({{$item.bsn_id}},this.value)"/>
-->  <input type="text" name="alerts[{{$item.chknoData}}]" value="{{$item.dpn_dr_alerts}}" onkeyup = "update_alerts({{$item.chknoData|ltrim:'0'}},this.value)"/>
        
       <script>
	   
	   function update_alerts(id,value)
		{
			
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}design_report.update_alerts/dpn_unique_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
	
       </script>
       
       
       </td>
       <td>
   <!--    <input type="text" name="bsn_target_signoff_date[{{$item.bsn_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo2_{{$item.bsn_id}}" value="{{$item.bsn_target_signoff_date}}" onfocus = "update_tar_sign({{$item.bsn_id}}, this.value);" /> 
 -->    <input type="text" name="ssod[{{$item.chknoData}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo200_{{$item.chknoData}}" value="{{$item.dpn_dr_tdso_dt}}" onfocus = "update_tar_sign({{$item.chknoData|ltrim:'0'}}, this.value);" /> 
             
            <!-- <input type="submit" value="Set" name="myob" class="set" />-->
      
      <script>
	   
	   function update_tar_sign(id,value)
		{
			
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}design_report.update_survey/cno_t/"+id+"/value_t/"+value,
				   success: function(result){
			   }
			 });
		}
	
       </script>
      
       </td>

       <td> 
   <!--   <input type="text" name="cust_design_hours[{{$item.bsn_id}}]" value="{{$item.bsn_cust_designer_hours}}" onkeyup = "update_cdh({{$item.bsn_id}},this.value)" style="width:40px"/>
 -->   <input type="text" name="cust_design_hours[{{$item.chknoData}}]" value="{{$item.dpn_dr_cust_des_hour}}" onkeyup = "update_cdh({{$item.chknoData|ltrim:'0'}},this.value)" style="width:40px"/>
       
       <script>
	   
	   function update_cdh(id,value)
		{
			
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}design_report_renovation.update_cust_design_hours/dpn_unique_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
	
       </script>
       </td>
       <td>
       
   <!--    <input type="text" name="overseas_hours[{{$item.bsn_id}}]" value="{{$item.bsn_over_archi_hours}}" onkeyup = "update_oah({{$item.bsn_id}},this.value)" style="width:40px"/>
  -->  <input type="text" name="overseas_hours[{{$item.chknoData}}]" value="{{$item.dpn_dr_overhour}}" onkeyup = "update_oah({{$item.chknoData|ltrim:'0'}},this.value)" style="width:40px"/>
       
       <script>
	   
	   function update_oah(id,value)
		{
			
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}design_report_renovation.update_over_archi_hours/dpn_unique_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
	
       </script>
        </td>
       <td>
       
   <!--  <input type="text" name="total_hours[{{$item.bsn_id}}]" value="{{$item.bsn_total_hours}}" onkeyup = "update_tot_hours({{$item.bsn_id}},this.value)" style="width:40px"/>
  -->  
     <input type="text" name="total_hours[{{$item.chknoData}}]" value="{{$item.dpn_dr_total_hours}}" onkeyup = "update_tot_hours({{$item.chknoData|ltrim:'0'}},this.value)" style="width:40px"/>
      
       <script>
	   
	   function update_tot_hours(id,value)
		{
			
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}design_report_renovation.update_total_hours/dpn_unique_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
	
       </script>
       
       </td>
       
       <td> 
        <input type="text" name="bsn_sign_off_sent_date[{{$item.chknoData}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo5_{{$item.chknoData}}" value="{{$item.dpn_dr_sign_off_sent_date}}" onfocus = "update_sign_off_date({{$item.chknoData|ltrim:'0'}},this.value)"  /> 
             <!--<input type="submit" value="Set" name="signoff" class="set" />-->
        
         <script>
	   
	   function update_sign_off_date(id,value)
		{
			
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}design_report.update_survey/sign_off_id/"+id+"/value_so/"+value,
				   success: function(result){
			   }
			 });
		}
	
       </script>
        
       </td>

       
       {{ if $item.dpn_dr_traffic_light eq 1}}
       <td style="background:#00CC33";>
       <a href="{{$BASE_URL}}design_report.colorbox/chk_no/{{$item.chknoData}}" class="various">Color</a>
       <br /><br />{{$item.dpn_dr_tl_user}}<br />{{$item.dpn_dr_tl_date}}<br />
        <a href="{{$BASE_URL}}design_report.reason/chk_no/{{$item.chknoData}}" class="various">Read</a>
       </td>
       {{ elseif  $item.dpn_dr_traffic_light eq 2}}
       <td style="background: #ff7f27";>
       <a href="{{$BASE_URL}}design_report.colorbox/chk_no/{{$item.chknoData}}" class="various">Color</a>
       <br /><br />{{$item.dpn_dr_tl_user}}<br />{{$item.dpn_dr_tl_date}}<br />
       <a href="{{$BASE_URL}}design_report.reason/chk_no/{{$item.chknoData}}" class="various">Read</a>
       </td>
       {{ elseif  $item.dpn_dr_traffic_light eq 3}}
       <td style="background: #F00";>
       <a href="{{$BASE_URL}}design_report.colorbox/chk_no/{{$item.chknoData}}" class="various">Color</a>
       <br /><br />{{$item.dpn_dr_tl_user}}<br />{{$item.dpn_dr_tl_date}}<br />
       <a href="{{$BASE_URL}}design_report.reason/chk_no/{{$item.chknoData}}" class="various">Read</a>
       </td>
       {{else }}
       <td>
       <a href="{{$BASE_URL}}design_report.colorbox/chk_no/{{$item.chknoData}}" class="various">Color</a></td>
       {{/if}}
   

       
       <td>{{$item.prochklist}} </td>
       <td> 
       {{if $item.lmpData}}
        {{foreach from=$item.lmpData key="key3" item="item3"}}
       		 {{if $item3.doc_file_name}}
                      {{if $item.chknoData eq $item3.dpn_unique_id}}
        		 <a href = "{{$BASE_URL}}files/document_check_list_files/{{$item3.doc_file_name}}" target="_blank">
         		 Download-{{$item3.dpn_unique_id}}</a>
        		 <br>
                      {{/if}}   
       		 {{/if}} 
       {{/foreach}}
       {{/if}}       
       
       </td>
       <td>
      <!-- {{if $item.checklist458}}-->
    <!--   <a href = "{{$BASE_URL}}files/document_check_list_files/{{$item.checklist458}}" target="_blank">Download</a>{{/if}} -->
       
       
      <form name="pw" method="post" enctype="multipart/form-data"> 
        <input type="hidden" name="dpn_unique_id" value="{{$item.chknoData}}"  />
        <input type="file" name="letter" /><br />
        {{if $item.dpn_dr_latest_letter}}
        <div style="text-align:center;"> 
        <!--<a href="https://deckquote.s3.amazonaws.com/files/uploads/{{$item.dpn_dr_latest_letter}}" target="_blank">Download</a>-->
         <a href="/design_report_renovation.download_content_in?file_name={{$item.dpn_dr_latest_letter}}&module_name=design_report_renovation.home_inactive" target="_blank">Download</a>
       
        <a href="{{$BASE_URL}}design_report_renovation.delete_w_in/dpn_unique_id/{{$item.chknoData}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img src="{{$BASE_URL}}/images/delete_icon.png" width="20" /></a>
   
        </div> {{/if}}
        <input type= "submit" name="upload_letter" title="Save" value="Upload" class="set2"> &nbsp; 
        </form>
       </td>
       
       
       <td>
        <input type="button" name="Alert" value="Add Feedback" onclick="javascript:addfeedback({{$item.bsn_id}});" style="width:90px; height:20px; font-size:11px; line-height:17px !important; padding:0px !important" /><br />
        <input type="button" name="Alert" value="View Feedback" onclick="javascript:viewfeedback({{$item.bsn_id}});" style="width:90px; height:20px; font-size:11px; line-height:17px !important; padding:0px !important" />
       </td>

       
     <td> <strong>{{$item.bcust_fname}} &nbsp; {{$item.bcust_lname}}</strong> <br />
        {{$item.bsn_address}}</td>
     
     
     <td>
<input type="text" name="dpn_dr_last_audit[{{$item.dbp_unique_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo442_{{$item.chknoData}}{{$item.bsn_id}}" value="{{$item.dpn_dr_last_audit}}" onfocus = "update_last_audit({{$item.chknoData|ltrim:'0'}}, this.value);"  /> 
{{if $item.dpn_dr_last_audit}} {{$item.dpn_dr_last_audit_user}} {{/if}}
<script>
	   
	   function update_last_audit(id,value)
		{
			
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}design_report.update_last_audit/dpn_unique_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
	
       </script>


     </td>  
       <td>
   
     <input type="hidden" name="hide[{{$item.chknoData}}_{{$item.bs_customers_id}}]" value="0" />
  	<label class="switch">

<input class="switch-input" type="checkbox"  name="hide[{{$item.chknoData}}_{{$item.bs_customers_id}}]"   />

        	<span class="switch-label" data-on="Yes" data-off="No"></span> 
        	<span class="switch-handle"></span> <br />
             </label>
            
        </td>
       <td>
        <form name ="showincpr" method="post" action="">
     	<input type="hidden" name="incpr[{{$item.bsn_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="incpr[{{$item.bsn_id}}]" value="1"  onclick="this.form.submit();" {{if $item.bsn_showin_cpr eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       
        </label> 
         </form>  
       
       </td> 
        
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