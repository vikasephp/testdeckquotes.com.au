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



function close_win()
	{
	$.fancybox.close();
	window.location.reload();
	}
</script>


<script type="text/javascript" > 
function addfeedback(bsn_id)
{
	var viewurl = "{{$BASE_URL}}new_south_wales_leads_report.addfeedback"+ "/bsn_id/" + bsn_id;	
	
	
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
	var viewurl = "{{$BASE_URL}}new_south_wales_leads_report.viewfeedback"+ "/bsn_id/" + bsn_id;	
	
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
.set { font-size:10px !important; 
       width:25px !important; display:inline-block; 
	   padding-top:1px !important;
	   padding-bottom: 1px !important;
	   padding-left:1px !important;
	   height:25px !important; }


.wrapper1, .wrapper2{width: 1900px; border: none 0px RED;
overflow-x: scroll; overflow-y:hidden; scrollbar-color: yellow blue;}
.wrapper1{height: 20px; }
.wrapper2{ }
.div1 {width:2880px; height: 20px; }
.div2 {width:2880px;  overflow: auto;} 

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

</style>

<h3 class="page-title">New Sounth Walse Leads Report</h3>
<br />
<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
    
   <div style="float:left; padding-top:8px;"> &nbsp;&nbsp;&nbsp;
   	<span><strong>Planning Reports Not Created :</strong> </span>&nbsp;&nbsp;&nbsp;
   </div>
   <div style="float:left;"> &nbsp;
   <input type="hidden" name="hide[{{$item.bsn_id}}]" value="0" />
   <label class="switch" style="margin-top:-10px;">
   <input class="switch-input" type="checkbox"  name="plreport_not" value="1" {{if $pnot eq 1 }} checked="checked" {{/if}}  />
         	<span class="switch-label" data-on="ON" data-off="OFF"></span> 
        	<span class="switch-handle"></span> <br />
   </label>
   </div>  
   
   <div style="float:left; margin-right:10px;"> <input type="submit" value="Submit" name="planning"  />   </div>
   
   <div style="float:left; margin-right:15px;">
    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Status:</strong>&nbsp;&nbsp;</span>
    
    <select name="keyword">
    <option value="Open" {{if $keyword eq 'Open' }} selected="selected" {{/if}} >Open </option>
    <option value="Hold" {{if $keyword eq 'Hold' }} selected="selected" {{/if}} >Hold </option>
    <option value="Lost" {{if $keyword eq 'Lost' }} selected="selected" {{/if}} >Lost </option>
    </select>
    &nbsp;&nbsp;&nbsp
    <input type="submit" value="Search" name="search"  />
   </div> 
   
   <div style="float:left;"> <input type="submit" value="Clear All" name="clear"  /> &nbsp;&nbsp;</div>  
   
   
 </form>

<form name="mlist" method="post">
<div style="float:right;">
<input type="button" value="Export To XLS" onclick="document.location.href='{{$BASE_URL}}new_south_wales_leads_report.home/export/1'" /> &nbsp;
 <input type="submit" name="meetinoffice" value="Update Sales Pathway" /> &nbsp;&nbsp;
 <input type="submit" name="watchlist" value="Update Watch List" />
<input type="submit" name="download" value="Download Pdf" /> 
<input type="submit" name="moveto" value="Move To Old" /> 
</div>
<br />
<div style="float:left;"> &nbsp; &nbsp; <strong>Search:</strong>&nbsp;&nbsp;
<input type="text" name="searchkey" value="{{$searchkey}}" style="width:400px;" placeholder="Enter address"/>
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" value="Search" name="searchaddr"  />
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
        <th class="topmenu" align="center" valign="middle" width="10%">Address</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Link</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Vcard</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Status</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Day Count</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Budget</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Project Type</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Project Customer Type</th>
        	
        <th class="topmenu" align="center" valign="middle" width="4%">Sales Pathway </th>
         <th class="topmenu" align="center" valign="middle" width="4%">Delivery Method </th>
        <th class="topmenu" align="center" valign="middle" width="5%">Planning Assessment Report</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Watch List </th>
        <th class="topmenu" align="center" valign="middle" width="6%">Star Rating</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Phone Follow Ups</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Last Followup Date</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Signed Design Agreement</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Needs Analysis Survey</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Add Feedback</th>
        <th class="topmenu" align="center" valign="middle" width="6%">Box Sent</th>
        <th class="topmenu" align="center" valign="middle" width="6%">Face to Face Booked</th>
        <th class="topmenu" align="center" valign="middle" width="6%">Planning Assement Report Delivered </th>
        <th class="topmenu" align="center" valign="middle" width="6%">Design Agreement Posted</th>
        <th class="topmenu" align="center" valign="middle" width="6%">Third Pary Designs</th>
         <th class="topmenu" align="center" valign="middle" width="6%">CCS Spoken</th>
        <th class="topmenu" align="center" valign="middle" width="6%">PAR Paperwork Couriered</th>
        <th class="topmenu" align="center" valign="middle" width="6%">Address</th>
        <th class="topmenu" align="center" valign="middle" width="6%">Add to Report</th>
         <th class="topmenu" align="center" valign="middle" width="6%">Move to Old</th>
        
      </tr>
      </thead>
    {{if $list}}
    <tbody>
    
      <!--{{assign var=countn value= $numstartvounter}}-->
       {{assign var=countn value= $total}}
      
      {{foreach from=$list key="key" item="item"}}
      
       
      <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
        <td> {{$countn}} </td>
        <td><strong>{{$item.bcust_fname}} {{$item.bcust_lname}} </strong><br />
        {{$item.bsn_address}}</td>
        <td style="text-align:center;" ><a href = "{{$item.link}}" target="blank">Link</a></td>
        <td><a href="{{$BASE_URL}}js/vcard/index.php?fname={{$item.bcust_fname}}&lname={{$item.bcust_lname}}&email1={{$item.bcust_misc_email1}}&email2={{$item.bcust_misc_email2}}&mobile={{$item.bcust_misc_moble}}&business={{$item.bcust_misc_business}}&home={{$item.bcust_misc_home}}" class="action_new" title="Download Vcard"><img style="height: 17px; width:22px" src="{{$BASE_URL}}images/vcard.png"/></a> </td>
        <td style="text-align:center;" >{{$item.status}}</td>
        <td style="text-align:center;" >{{$item.dayscount}}</td>
        <td style="text-align:center;" >{{$item.budget}}</td>
	<td> 
       <select name="project_type[{{$item.bsn_id}}]" Onchange = "updatetype({{$item.bsn_id}},this.value)" >
       <option value="17" {{if $item.project_type eq 17}} selected="selected" {{/if}}> Fixed Price Extentension   </option>
       <option value="15" {{if $item.project_type eq 15}} selected="selected" {{/if}}> Customer Granny Flat </option>
       <option value="19" {{if $item.project_type eq 19}} selected="selected" {{/if}}> Canberra Custom Homes </option>
       <option value="21" {{if $item.project_type eq 21}} selected="selected" {{/if}}> Renovation Only </option>
      </select>
       
       <script>
	
	function updatetype(id,value)
	{
	 //alert(id);
	 $.ajax({
		   type: "GET",
		   url: "{{$BASE_URL}}/new_south_wales_leads_report.update_project_type/bsn_id/"+id+"/value/"+value,
			   success: function(result){
		   }
		 });

	}
	
        </script>
       
        
       </td>
       <td> 
       
       <select name="project_cust_type[{{$item.bsn_id}}]" Onchange = "updatecusttype({{$item.bsn_id}},this.value)" >
       <option value="2" {{if $item.bsn_proj_cust_type eq 2}} selected="selected" {{/if}}>Real Estate Buyer</option>
       <option value="3" {{if $item.bsn_proj_cust_type eq 3}} selected="selected" {{/if}}>Real Estate Agent</option>
       <option value="4" {{if $item.bsn_proj_cust_type eq 4}} selected="selected" {{/if}}>Financial Advisor</option>
       <option value="5" {{if $item.bsn_proj_cust_type eq 5}} selected="selected" {{/if}}>Undetermined</option>
       <option value="6" {{if $item.bsn_proj_cust_type eq 6}} selected="selected" {{/if}}>Standard Customer</option>
      </select>
       
       <script>
	
	function updatecusttype(id,value)
	{
	 //alert(id);
	 $.ajax({
		   type: "GET",
		   url: "{{$BASE_URL}}/new_south_wales_leads_report.update_customer_type/bsn_id/"+id+"/value/"+value,
			   success: function(result){
		   }
		 });

	}
	
        </script>
       
       </td>
       
        <td {{if $item.meet eq 1}} style="background:#FF6;" {{elseif $item.meet eq 2}} style="background:#0C0;"
        {{elseif $item.meet eq 3}} style="background:#09F;" {{elseif $item.meet eq 4}} style="background:#F00;" 
        {{elseif $item.meet eq 5}} style="background:#b6b6b6;" {{elseif $item.meet eq 6}} style="background:#F90;"
         {{/if}} > 
        <select name="meet[{{$item.bsn_id}}]" >
 
        {{foreach from = $pro_street_checklist item = "itempsc" key = "keypsc"}}
        <option value="{{$itempsc.pst_id}}" {{if $item.meet eq $itempsc.pst_id}} selected="selected" {{/if}}> 
        		{{$itempsc.pst_sales_pathway}}  
         </option>
          {{/foreach}}
       </select>  
  
         </td>
         
         {{if $item.bs_qr_delivery_method eq 'To Be Determined'}}
         <td  style="background: #F00;">
          {{else}}
         <td>
         {{/if}}
          
         
        <select name="dm[{{$item.bsn_id}}]" Onchange = "update_dm({{$item.bsn_id}},this.value)" >
        <option value="To Be Determined" {{if $item.bs_qr_delivery_method eq 'To Be Determined'}} selected="selected" {{/if}}>
        To Be Determined </option>
       <option value="Zoom Meeting" {{if $item.bs_qr_delivery_method eq 'Zoom Meeting' }} selected="selected" {{/if}}>Zoom Meeting </option>
       <option value="Phone Meeting" {{if $item.bs_qr_delivery_method eq 'Phone Meeting'}} selected="selected" {{/if}}>Phone Meeting</option>
       <option value="In the office" {{if $item.bs_qr_delivery_method eq 'In the office'}} selected="selected" {{/if}}>In the office</option>
       <option value="At their property" {{if $item.bs_qr_delivery_method eq 'At their property'}} selected="selected" {{/if}}>
       At their property</option>
       
      </select>
       
       <script>
	
	function update_dm(id,value)
	{
	
	 $.ajax({
		   type: "GET",
		   url: "{{$BASE_URL}}/new_south_wales_leads_report.update_delivery_method/bsn_id/"+id+"/value/"+value,
			   success: function(result){
		   }
		 });

	}
	
        </script>
       
       
       </td>
        {{if $item.checklist44}}
        <td style="text-align:center;" >
            <a href = "{{$BASE_URL}}files/document_check_list_files/{{$item.checklist44}}?dummy={{$ran}}" target="_blank">Download</a>
        </td>
        {{else}}
        <td style="background:#F00"> </td>
        {{/if}}
        
        
          <td> 
          <input type="hidden" name="watch[{{$item.bsn_id}}]" value="0" />
 <input type="checkbox" name="watch[{{$item.bsn_id}}]" class="myCheck" {{if $item.watch eq 1 }} checked="checked" {{/if}} onchange="show({{$item.bsn_id}},{{$item.watch}})" />
          
         
<script>
function show(bid,value)
{


 $.ajax({
		   type: "GET",
		   url: "{{$BASE_URL}}new_south_wales_leads_report.update_watchlist/bsn_id/"+bid+"/value/"+value,
			   success: function(result){
				   
		   }
		 });
		 
}

</script>
          
          
          </td>
        <td>
   	
                
        <div class="slidecontainer">
        <input type="range" min="0" max="10" value="{{$item.bsn_rating}}" class="slider" id="myRange_{{$countn}}" Onchange = "update({{$item.bsn_id}},this.value)" >
        <p> <span id="demo_{{$item.bsn_id}}"></span></p>
        </div>

<script>
var slider = document.getElementById("myRange_{{$countn}}");
var output{{$item.bsn_id}} = document.getElementById("demo_{{$item.bsn_id}}");
output{{$item.bsn_id}}.innerHTML = slider.value;

slider.oninput = function() {
  output{{$item.bsn_id}}.innerHTML = this.value;
}

	
	function update(id,value)
	{
	 //alert(id);
	 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}/new_south_wales_leads_report.update_rating/bsn_id/"+id+"/value/"+value,
					   success: function(result){
				   }
				 });
	
	}
	
	
	
</script>
                
                
                
        </td>
        
       
        
        <td style="text-align:center;" > {{$item.salesfolloup}} </td>
        <td style="text-align:center;" >{{$item.lastfoldt}}</td>
        
        {{if $item.checklist45}}
        <td style="text-align:center;" >
            <a href = "{{$BASE_URL}}files/document_check_list_files/{{$item.checklist45}}?dummy={{$ran}}" target="_blank">Download</a>
        </td>
        {{else}}
        	<td style="background:#F00"> </td>
        {{/if}}
        
       {{if $item.checklist2}}
        <td style="text-align:center;" >
            <a href = "{{$BASE_URL}}files/document_check_list_files/{{$item.checklist2}}?dummy={{$ran}}" target="_blank">Download</a>
        </td>
        {{else}}
        	<td style="background:#F00"> </td>
        {{/if}}
        
         <td style="text-align:center;" >
          <input type="button" name="Alert" value="Add Feedback" onclick="javascript:addfeedback({{$item.bsn_id}});" style="width:90px; height:20px; font-size:11px; line-height:17px !important; padding:0px !important" /><br />
          
          <input type="button" name="Alert" value="View Feedback" onclick="javascript:viewfeedback({{$item.bsn_id}});" style="width:90px; height:20px; font-size:11px; line-height:17px !important; padding:0px !important" />
         </td>
        
        {{if $item.boxsent}} 
        <td style="text-align:center;" >{{$item.boxsent}}</td> 
        {{else}}
        <td style="background:#F00"> </td>
        {{/if}}
        
      {{if $item.uid137complete eq 1 }}
        	<td style="text-align:center;" >{{$item.uid137}}</td>
        {{else}}
            <td style="background:#F00"></td>
        {{/if}}
       {{if $item.uid206complete eq 1 }}
        	<td style="text-align:center;" >{{$item.uid206}}</td>
        {{else}}
            <td style="background:#F00"></td>
        {{/if}}
        
        {{if $item.checklist412}}
        <td style="text-align:center;" >
            <a href = "{{$BASE_URL}}files/document_check_list_files/{{$item.checklist412}}?dummy={{$ran}}" target="_blank">Download</a>
        </td>
        {{else}}
        	<td style="background:#F00"> </td>
        {{/if}}
        
        
        <td> 
        
         <form name ="da_po" method="post" action=""> 
        <select name="dap[{{$item.bsn_id}}]">
        <option value="">Please Select</option>
        <option value="Yes To Be Sent" {{if $item.bs_da_posted eq 'Yes To Be Sent'}} selected="selected" {{/if}}>Yes To Be Sent </option>
       <option value="No" {{if $item.bs_da_posted eq 'No' }} selected="selected" {{/if}}>No</option>
       <option value="Yes Sent" {{if $item.bs_da_posted eq 'Yes Sent'}} selected="selected" {{/if}}>Yes Sent</option>
       </select>
         <input type="submit" value="Set" name="da_posted" class="set" />
         
         {{if $item.bs_da_posted}}{{$item.bs_da_posted_date}} <br />{{/if}}
         {{if $item.bs_da_posted}}{{$item.bs_da_posted_user}}{{/if}}
       </form>
        
        </td>
        <td><form name ="recmet22" method="post" action="">
     	<input type="hidden" name="ccsspoken[{{$item.bs_business_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="ccsspoken[{{$item.bs_business_id}}]" value="1"  onclick="this.form.submit();" {{if $item.bs_ccs_spoken eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form>  
       {{if $item.bs_ccs_spoken eq 1}} {{$item.bs_css_spoken_date}} {{/if}}
       </td>
        <td>
        
        <form name ="recmet32" method="post" action="">
     	<input type="hidden" name="couriered[{{$item.bs_business_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="couriered[{{$item.bs_business_id}}]" value="1"  onclick="this.form.submit();" {{if $item.bs_par_paper_couriered eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form>
          {{if $item.bs_par_paper_couriered eq 1}} {{$item.bs_par_couriered_date}} {{/if}}
         </td>
        
        
        <td>{{$item.bsn_address}}</td>
        <td style="text-align:center;" >
        <input type="hidden" name="hide[{{$item.bsn_id}}]" value="0" />
  	    <label class="switch">
            <input class="switch-input" type="checkbox"  name="pdf[{{$item.bsn_id}}]" value="1" />
         	<span class="switch-label" data-on="Yes" data-off="No"></span> 
        	<span class="switch-handle"></span> <br />
       </label>
        </td>
        <td> <input type="checkbox" name="old[{{$item.bsn_id}}]"  /> </td>
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