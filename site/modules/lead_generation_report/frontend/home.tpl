<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/default.js"></script>
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
	var viewurl = "{{$BASE_URL}}lead_generation_report.view_procedure"+ "/random/" + Math.random();	

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
.set { font-size:10px !important; 
       width:25px !important; display:inline-block; 
	   padding-top:1px !important;
	   padding-bottom: 1px !important;
	   padding-left:1px !important;
	   height:25px !important; }


.wrapper1, .wrapper2{width: 100%; border: none 0px RED; overflow-x: scroll; overflow-y:hidden; scrollbar-color: yellow blue;}
.wrapper1{height: 20px; }
.wrapper2{ }
.div1 {width:1940px; height: 20px; }
.div2 {width:1940px;  overflow: auto;} 

.slidecontainer {
  width: 125px;
}

.slider {
  -webkit-appearance: none;
  width: 100%;
  height: 5px;
  background: #06F ;
  outline: none;
  opacity: 0.7;
  -webkit-transition: .2s;
  transition: opacity .2s;
}

.slider:hover {
  opacity: 1;
}

.slider::-webkit-slider-thumb {
  -webkit-appearance: none;
  appearance: none;
  width: 15px;
  height: 25px;
  background: #F00 ;
  cursor: pointer;
}

.slider::-moz-range-thumb {
  width: 10px;
  height: 15px;
  background: #F00;
  cursor: pointer;
}

.tableFixHead          { overflow-y: auto; height: 700px; }
.tableFixHead thead th { position: sticky; top: 0; text-align:left; }
table  { border-collapse: collapse; width: 100%; }
th     { z-index:9999; }
#fancybox-wrap {z-index:9999999;} 
.mini-table-info {
	width: 400px;
}
table.mini-table-info td {
    text-align: center;
}
</style>

<h3 class="page-title">Lead Generation Report</h3>
<br />

<table class="mini-table-info" border="1">
	<tr>
		<th class="topmenu" align="center" valign="middle"></th>
		<th class="topmenu" align="center" valign="middle">7 Days</th>
		<th class="topmenu" align="center" valign="middle">YTD's</th>
	</tr>
	<tr bgcolor='WHITE'>
		<td>Leads</td>
		<td>{{$lead_data_weekly.weekly_total}}</td>
		<td>{{$lead_data_ytd.ytd_total}}</td>
	</tr>
	<tr bgcolor='WHITE'>
		<td>ON HOLD</td>
		<td>{{$onhold_data_weekly.weekly_total}}</td>
		<td>{{$onhold_data_ytd.ytd_total}}</td>
	</tr>
	<tr bgcolor='WHITE'>
		<td>LOST</td>
		<td>{{$lost_data_weekly.weekly_total}}</td>
		<td>{{$lost_data_ytd.ytd_total}}</td>
	</tr>
</table>

<br />
   
   <div style="float:left; margin-right:15px;">

   </div> 
  
<form name="mlist" method="post">
<div style="float:left; text-align:left;">
&nbsp; &nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> 
&nbsp; &nbsp; &nbsp; &nbsp;<strong> Filter By Created Date : </strong> 
        <select name="st_date"/>
        <option value="0">Show All</option>
        <option value="7">Last Week</option>
        <option value="30">Last Month</option>
        <option value="365">Last Year</option>
        </select>
         
        &nbsp; &nbsp;<input type="submit" value="Filter" name="filter" />   
        &nbsp;<input type="submit" name="clear" value = "Clear Filter" />
        
       &nbsp; &nbsp; &nbsp; &nbsp;<strong> Filter By Project Enquiry: </strong> 
     
        <select name="proj_enquiry">
        <option value="">Please Select</option>
         {{foreach from=$allenquirysource key="key5" item="item5"}}
           <option value="{{$item5.soe_id}}">{{$item5.soe_name}}</option> 
         {{/foreach}}
        </select>
        &nbsp; &nbsp;<input type="submit" value="Filter" name="filter" />   
        &nbsp;<input type="submit" name="clear" value = "Clear Filter" />        
        
<br />

&nbsp; &nbsp;<strong> Created Date From :</strong>
<input type="text" name="dt_date1" id="dt1" class="w16em dateformat-d-ds-m-ds-Y" style="width:70px;" /> TO     
<input type="text" name="dt_date2" id="dt2" class="w16em dateformat-d-ds-m-ds-Y" style="width:70px;" />
 &nbsp; &nbsp;<input type="submit" value="Search" name="date_search" />
 <input type="submit" name="clear" value = "Clear Search" />

</div>

<div style="float:right;">
<input type="button" value="Excel Download" onclick="document.location.href='{{$BASE_URL}}lead_generation_report.home/export2/1'" /> &nbsp;
<!--<input type="button" value="Export To XLS" onclick="document.location.href='{{$BASE_URL}}lead_generation_report.home/export/1'" /> &nbsp;-->
</div>

<div style="margin-top:35px;"> &nbsp; </div>
<div class="wrapper1">
    <div class="div1">
    </div>
</div>

<div class="wrapper2">
    <div class="div2 tableFixHead">

  <table id="doclist-table" class="nav-back" width="100%">
    <thead>
      <tr>
        <th class="topmenu" align="center" valign="middle" width="2%">SrNo</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Created Date</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Address</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Link</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Vcard</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Status</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Day Count</th>
      
        <th class="topmenu" align="center" valign="middle" width="4%">Project Enquiry</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Budget</th>
        
        <th class="topmenu" align="center" valign="middle" width="4%">Needs Analysis Survey</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Planning Assessment Report Meeting Completed</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Phone Survey Completed</th>
         <th class="topmenu" align="center" valign="middle" width="9%">Post planning assessment meeting feedback</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Verified By MManager</th>
       
      </tr>
      </thead>
    {{if $list}}
    <tbody>
    
       {{assign var=countn value= $total}}
      
      {{foreach from=$list key="key" item="item"}}
      
       
      <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
        <td> {{$countn}} </td>
        <td>{{$item.bsn_status_sys_date}} </td>
        <td><strong>{{$item.bcust_fname}} {{$item.bcust_lname}} </strong><br />
        {{$item.bsn_address}}</td>
        <td style="text-align:center;" ><a href = "{{$item.link}}" target="blank">Link</a></td>
        <td><a href="{{$BASE_URL}}js/vcard/index.php?fname={{$item.bcust_fname}}&lname={{$item.bcust_lname}}&email1={{$item.bcust_misc_email1}}&email2={{$item.bcust_misc_email2}}&mobile={{$item.bcust_misc_moble}}&business={{$item.bcust_misc_business}}&home={{$item.bcust_misc_home}}" class="action_new" title="Download Vcard"><img style="height: 17px; width:22px" src="{{$BASE_URL}}images/vcard.png"/></a> </td>
        <td style="text-align:center;" >{{$item.bsn_sub_status}}</td>
        <td style="text-align:center;" >{{$item.dayscount}}</td>

        
	   <td>
       {{$item.soe_name}}
        <form name="enq" method="post" action="">
        <select name="soe" onchange="update_enquiry_source({{$item.bsn_id}}, this.value)">
        <option value="">Please Select</option>
         {{foreach from=$allenquirysource key="key1" item="item1"}}
           <option value="{{$item1.soe_id}}" {{if $item1.soe_id == $item.bsn_cd_enquiry_source}} selected="selected" {{/if}}> {{$item1.soe_name}}</option>          {{/foreach}}
                 
        </select>
        <script type="text/javascript">
        function update_enquiry_source(id,value)
	    {

	     $.ajax({
		   type: "GET",
		   url: "{{$BASE_URL}}lead_generation_report.update_enquiry_source/bsn_id/"+id+"/value/"+value,
			   success: function(result){
		   }
		 });
	    }
	
        </script>
        
        </form>
        </td>
        <td>
        <input type="text" name="budget"  style="width:120px"  value="{{$item.bs_lgr_budget}}" onkeyup="update_budget({{$item.bs_business_id}},this.value)"  />
        <script type="text/javascript">
        function update_budget(id,value)
	    {

	     $.ajax({
		   type: "GET",
		   url: "{{$BASE_URL}}lead_generation_report.update_budget/bs_business_id/"+id+"/value/"+value,
			   success: function(result){
		   }
		 });
	    }
	
        </script>
        
        </td>
        
        <td> {{if $item.checklist2}}
   <a href="/lead_generation_report.download_content?file_name={{$item.checklist2}}&module_name=lead_generation_report.home">Download</a>
   {{/if}}
        </td>
        
       <td> 
       <form name="planning" method="post" action="" > 
       <select name ="parmc" onchange="planning_ass({{$item.bs_business_id}}, this.value)">
      	 <option value="-1">Please Select </option>
      	 <option value="1" {{if $item.bs_lgr_pl_ass eq 1 }} selected="selected" {{/if}}>Yes</option>
      	 <option value="0" {{if $item.bs_lgr_pl_ass eq 0 }} selected="selected" {{/if}}>No</option>
       </select>
       </form>
       
       <script type="text/javascript">
        function planning_ass(id,value)
	    {

	     $.ajax({
		   type: "GET",
		   url: "{{$BASE_URL}}lead_generation_report.planning_ass/bs_business_id/"+id+"/value/"+value,
			   success: function(result){
		   }
		 });
	    }
	
        </script>
       
       </td>
       
       
        <td>
         <form name ="recmet2" method="post" action="">
     	<input type="hidden" name="phone_survey[{{$item.bs_business_id}}]" value="2" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="phone_survey[{{$item.bs_business_id}}]" value="1"  onclick="this.form.submit();" {{if $item.bs_lgr_phone_ser eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> 
       
         {{if $item.bs_lgr_phone_ser eq 1 }} {{$item.bs_lgr_phone_user}} <br />{{$item.bs_lgr_phone_date}}{{/if}}
       </label> 
       </form>  
   
       </td>
       <td>
       <textarea rows="4" cols="40" id="{{$item.bs_business_id}}" style="overflow-y: scroll;">{{$item.bs_lgr_post_planning}}</textarea>       
        <script>
	   
	    $(document).ready(function(){
                     $("#{{$item.bs_business_id}}").keyup(function(){
                           update_post_planning({{$item.bs_business_id}},this.value);
                     });
             });
	     
		   
	   function update_post_planning(id,value)
		{
	   
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}lead_generation_report.update_post_planning/bs_business_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
	
       </script>
       </td>
       
       <td>
         <form name ="recmet2" method="post" action="">
     	<input type="hidden" name="varified[{{$item.bcust_id}}]" value="2" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="varified[{{$item.bcust_id}}]" value="1"  onclick="this.form.submit();" {{if $item.bcust_lg_varified eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> 
     {{if $item.bcust_lg_varified eq 1 }} {{$item.bcust_lg_varified_date}} {{/if}}
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
      <td align="center"><div class='pagination'> {{if $pagenum == 1}} <span class='disabled'>« previous</span> {{else}} <a class ="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{math equation="x - y" x=$pagenum y=1}}" title="Previous">« previous </a> {{/if}}
          
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
          {{if $pagenum == $last}} <span class='disabled'>next »</span> {{else}} <a class = "pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{math equation="x + y" x=$pagenum y=1}}" title="Next">next » </a></div>
        {{/if}} </td>
      {{else}}
      <td align="center" height="300">Record Not found... </td>
      {{/if}} </tr>
  </table>
  {{/if}} <br />
  <br />
  <table id="doclist-table"  width="100%" bgcolor="#d3e8d6">
    <thead>
  
      <tr>
        <td colspan="2">&nbsp;</td>
      </tr>
    </thead>
  </table>
</div>
</div>