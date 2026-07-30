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
	   
.wrapper1, .wrapper2{width: 100%; border: none 0px RED; overflow-x: scroll; overflow-y:hidden; scrollbar-color: yellow blue; }	   


.wrapper1{height: 20px; }
.wrapper2{ }
.div1 {width:2980px; height: 20px; }
.div2 {width:2980px;  overflow: auto;}   
.tableFixHead          { overflow-y: auto; height: 1200px; }
.tableFixHead thead th { position: sticky; top: 0; text-align:left; }
table  { border-collapse: collapse; width: 100%; }
th     { z-index:9999; }
   
</style>

<h3 class="page-title">Design Report </h3>
<br />

<form name="sort" method="post">
<div style="float:left;"> &nbsp; &nbsp; <strong>Search:</strong>&nbsp;&nbsp;
<input type="text" name="searchkey" value="{{$searchkey}}" style="width:400px;" placeholder="Search Address , Client Name"/>
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

</div>

</form>

<form name="mlist" method="post">
<div style="float:right;"> 
<input type="button" value="Export To XLS" onclick="document.location.href='{{$BASE_URL}}design_report.home/export/1'" /> &nbsp;
<!--<input type="submit" value="Save Move to Inactive" name="hideupdate"  />-->

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
        <th class="topmenu" align="center" valign="middle" width="10%">Customer Details</th>
        <th class="topmenu" align="center" valign="middle" width="6%">Design <br />Agreement $$</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Survey Status</th>
     	<th class="topmenu" align="center" valign="middle" width="3%">Relevant Checklist Numbers</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Renovation Checklist Numbers</th>
      	<th class="topmenu" align="center" valign="middle" width="4%">Type</th>
        <th class="topmenu" align="center" valign="middle" width="4%">What</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Design <br />Agreement<br /> Signed Date </th>
        <th class="topmenu" align="center" valign="middle" width="7%">Designer</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Overseas Architect</th>
        <th class="topmenu" align="center" valign="middle" width="4%">% Completed</th>
        <th class="topmenu" align="center" valign="middle" width="10%">Where are we at?</th>  
        <th class="topmenu" align="center" valign="middle" width="7%">Letter Text</th> 
	<th class="topmenu" align="center" valign="middle" width="7%">Customer<br />Budget</th>
        <th class="topmenu" align="center" valign="middle" width="5%">SQM</th>
        <th class="topmenu" align="center" valign="middle" width="10%">Estimate Build Cost</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Estimated Renovation Cost</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Customer Details </th>
      
         
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
        <td> <strong>{{$item.bcust_fname}} &nbsp; {{$item.bcust_lname}}</strong> <br />{{$item.bsn_address}}</td>
      
        <td> 
  <!--     <input type="text" name="desagr[{{$item.bsn_id}}]" value="{{$item.bsn_design_agreement}}" onkeyup = "update_da_currency({{$item.bsn_id}},this.value)" style="width:100px;"/>
 -->      <input type="text" name="desagr[{{$item.chknoData}}]" value="{{$item.dpn_dr_deagree}}" onkeyup = "update_da_currency({{$item.chknoData|ltrim:'0'}},this.value)" style="width:50px;"/>
   
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
       
       
       <td> {{$item.chknoData}} </td>
       <td> {{$item.reno_checklist_no}} </td>  
       <td> 
       
       <select name="bsn_project_type[{{$item.bsn_id}}]" Onchange = "update_project_type({{$item.chknoData|ltrim:'0'}},this.value)" >
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
    
       <select name="design_type[{{$item.bsn_id}}]" Onchange = "udt({{$item.chknoData|ltrim:'0'}},this.value)" >
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
       <td>{{$item.checklist45}}</td>
       <td>{{$item.designer}}</td> 
       <td>{{$item.osarchi}}</td>

       
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
     <!-- <input type="text" name="whereare[{{$item.bsn_id}}]" value="{{$item.bsn_where_are_we}}" onkeyup = "update_where_are({{$item.bsn_id}},this.value)"/>
  -->     <input type="text" name="whereare[{{$item.chknoData}}]" value="{{$item.dpn_dr_wherewe}}" onkeyup = "update_where_are({{$item.chknoData|ltrim:'0'}},this.value)"/>
     
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
       
       
     
       <td><!--{{$item.dpn_budget}}-->
       <form name ="esti" method="post" action="">
        <input type="text" name="cust_budget[{{$item.chknoData}}]" value="{{$item.dpn_dr_cust_budget}}"  style="width:80px"/>
        <input type="submit" value="Save" name="savebudget" class="set" />
        {{ if $item.dpn_dr_cust_budget}} {{$item.dpn_dr_budg_user}}<br />{{$item.dpn_dr_budg_date}} {{/if}}
      </form>
 
 
       </td>
       <td> 
       
<!-- <input type="text" name="sqm[{{$item.bsn_id}}]" value="{{$item.bsn_dr_sqm}}" onkeyup = "update_sqm({{$item.bsn_id}},this.value)" style="width:50px"/>
 --><input type="text" name="sqm[{{$item.chknoData}}]" value="{{$item.dpn_dr_sqm}}" onkeyup = "update_sqm2({{$item.chknoData|ltrim:'0'}},this.value)" style="width:50px"/>
      
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
       
       </td>
       <td> 
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
       
<!--        <form name ="renocost" method="post" action="">
         <input type ="text" name ="renovation_cost[{{$item.bsn_id}}]" value="{{$item.bsn_esti_reno_cost}}" style="width:150px;" />  
        <input type="submit" value="Save" name="esrenocost" class="set" />
        </form>-->
       
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
      

         
     <td> <strong>{{$item.bcust_fname}} &nbsp; {{$item.bcust_lname}}</strong> <br />
        {{$item.bsn_address}}</td>
           
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