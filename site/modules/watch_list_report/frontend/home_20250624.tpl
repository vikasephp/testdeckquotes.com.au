
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/default.js"></script>
<!--<script type="text/javascript" src="{{$BASE_URL}}js/tree/simpletreemenu.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tree/simpletree.css" />-->
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


function sendemail(email_id, fname,address)
{
	var viewurl = "{{$BASE_URL}}watch_list_report.email"+ "/email_id/" + email_id + "/fname/" + fname + "/address/" + address;	

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
	var viewurl = "{{$BASE_URL}}planning_assesment_quickreport.addfeedback"+ "/bsn_id/" + bsn_id;	
	
	
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
	var viewurl = "{{$BASE_URL}}planning_assesment_quickreport.viewfeedback"+ "/bsn_id/" + bsn_id;	
	
	
 	$(document).ready(function () {

        $.fancybox({

				'width': '80%',
				'height': '90%',
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
	var viewurl = "{{$BASE_URL}}watch_list_report.view_procedure"+ "/random/" + Math.random();	

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

function print_pdf()
{
	var viewurl = "{{$BASE_URL}}watch_list_report.print_pdf"+ "/random/" + Math.random();	

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
	var viewurl = "{{$BASE_URL}}watch_list_report.view_type"+ "/random/" + Math.random();	

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

.tableFixHead          { overflow-y: auto; height: 700px; }
.tableFixHead thead th { position: sticky; top: 0; text-align:left; }
table  { border-collapse: collapse; width: 100%; }
th     { z-index:9999; }
#fancybox-wrap {z-index:9999999;} 
</style>

<h3 class="page-title">{{$title}}</h3>
<br />

<form name="mlist" method="post">

<div style="float:left; text-align:left;"> 
&nbsp; &nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> 
&nbsp; &nbsp;<input type="submit" name="sortby_ranking" value="Sort By Ranking" />
<input type="button" name="type_options" value="Type Admin" onclick="javascript:add_type();" /> 
<br />
&nbsp; &nbsp; <strong>Search:</strong>&nbsp;&nbsp;
<input type="text" name="searchkey" value="{{$searchkey}}" style="width:400px;" placeholder="Enter address"/>
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" value="Search" name="searchaddr"  /> &nbsp;
<input type="submit" value="Clear Search" name="clearsearch"  />

</div> 


<div style="float:right;"> 
<input type="button" name="print_panel" value="Print" onclick="javascript:print_pdf();" /> 
 <!--&nbsp; &nbsp;<input type="submit" name="watchlist" value="Remove From Report" />&nbsp;&nbsp;-->
</div>
<div style="margin-top:35px;"> &nbsp; </div>

<br />
    <div class = "div2 tableFixHead">

  <table id="doclist-table" class="nav-back" width="100%">
    <thead>
      <tr>
        <th class="topmenu" align="center" valign="middle" width="2%">SrNo</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Rating</th>
        <th class="topmenu" align="center" valign="middle" width="10%">Address</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Link</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Vcard</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Status</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Day Count</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Last Followup Date</th>
        
        <th class="topmenu" align="center" valign="middle" width="4%">Budget</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Type</th>
        
        <th class="topmenu" align="center" valign="middle" width="4%">Feedback</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Par Recording</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Planning Assessment Client Minutes</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Docsign Sent</th>
        
        <th class="topmenu" align="center" valign="middle" width="4%">Design Agreement Signed Date</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Last CSS spoke to Customer</th>
      <!--  <th class="topmenu" align="center" valign="middle" width="4%">Sunday Appoint to be booked</th>-->
        <th class="topmenu" align="center" valign="middle" width="4%">Sunday Booked</th>
        <th class="topmenu" align="center" valign="middle" width="6%">PAR Paperwork Couriered</th>
        <th class="topmenu" align="center" valign="middle" width="4%">30 Day Letter</th>
        <th class="topmenu" align="center" valign="middle" width="4%">30 Day Phone Call </th>
 	    <th class="topmenu" align="center" valign="middle" width="4%">90 Day Letter</th>
        <th class="topmenu" align="center" valign="middle" width="4%">90 Day Phone Call </th>
        
        <th class="topmenu" align="center" valign="middle" width="4%">Planning Assessment Report Date</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Email</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Remove From Report</th>
        
      </tr>
      </thead>
    {{if $list}}
    <tbody>
    

       {{assign var=countn value= $total}}
      
      {{foreach from=$list key="key" item="item"}}
      
       
      <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
        <td> {{$countn}} </td>
       <td>
        <select name="rating[{{$item.bsn_id}}]" Onchange = "update_rating({{$item.bsn_id}},this.value)" >
       <option value="1" {{if $item.bsn_rating eq 1}} selected="selected" {{/if}}> 1 </option>
       <option value="2" {{if $item.bsn_rating eq 2}} selected="selected" {{/if}}> 2 </option>
       <option value="3" {{if $item.bsn_rating eq 3}} selected="selected" {{/if}}> 3 </option>
       <option value="4" {{if $item.bsn_rating eq 4}} selected="selected" {{/if}}> 4 </option>
       <option value="5" {{if $item.bsn_rating eq 5}} selected="selected" {{/if}}> 5 </option>
       <option value="6" {{if $item.bsn_rating eq 6}} selected="selected" {{/if}}> 6 </option>
       <option value="7" {{if $item.bsn_rating eq 7}} selected="selected" {{/if}}> 7 </option>
       <option value="8" {{if $item.bsn_rating eq 8}} selected="selected" {{/if}}> 8 </option>
       <option value="9" {{if $item.bsn_rating eq 9}} selected="selected" {{/if}}> 9 </option>
       <option value="10" {{if $item.bsn_rating eq 10}} selected="selected" {{/if}}> 10 </option>
       </select> 
       
       <script>
       
       function update_rating(id,value)
	{

	 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}/watch_list_report.update_rating/bsn_id/"+id+"/value/"+value,
					   success: function(result){
				   }
				 });
	
	}
	
       </script>
       
       </td>  
        <td><strong>{{$item.bcust_fname}} &nbsp; {{$item.bcust_lname}}</strong> <br />{{$item.bsn_address}}</td>
        <td style="text-align:center;" ><a href = "{{$item.link}}" target="blank">Link</a></td>
        <td><a href="{{$BASE_URL}}js/vcard/index.php?fname={{$item.bcust_fname}}&lname={{$item.bcust_lname}}&email1={{$item.bcust_misc_email1}}&email2={{$item.bcust_misc_email2}}&mobile={{$item.bcust_misc_moble}}&business={{$item.bcust_misc_business}}&home={{$item.bcust_misc_home}}" class="action_new" title="Download Vcard"><img style="height: 17px; width:22px" src="{{$BASE_URL}}images/vcard.png"/></a> </td>
        <td style="text-align:center;" >{{$item.bsn_sub_status}}</td>
        <td style="text-align:center;" >{{$item.dayscount}}</td>
        <td>{{$item.lastfoldt}}</td>
        <td style="text-align:center;" >{{$item.budget}}</td>
       
        <td>
        <select name="type[{{$item.bsn_id}}]" Onchange = "update_type({{$item.bsn_id}},this.value)" >
        <option value="0">Please Select</option>
         {{foreach from=$type key="key6" item="item6"}}
         <option value="{{$item6.wt_id}}" {{if $item6.wt_id eq $item.bsn_wlr_type}} selected="selected" {{/if}} >{{$item6.wt_type}}</option>
	 {{/foreach}}
	 </select>
      
       
        <script>
       
       function update_type(id,value)
	{
         $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}watch_list_report.update_type/bsn_id/"+id+"/value/"+value,
					   success: function(result){
				   }
				 });
	
	}
	
       </script>
        
        </td>
        
        <td>
        <input type="button" name="Alert" value="Add Feedback" onclick="javascript:addfeedback({{$item.bsn_id}});" style="width:90px; height:20px; font-size:11px; line-height:17px !important; padding:0px !important" /><br />
        <input type="button" name="Alert" value="View Feedback" onclick="javascript:viewfeedback({{$item.bsn_id}});" style="width:90px; height:20px; font-size:11px; line-height:17px !important; padding:0px !important" />
        {{$item.sf_date}}
        </td>
        <td>{{if $item.datarm}}
        {{foreach from=$item.datarm key="key1" item="item1"}}
       	<!--<a href = "https://deckquote.s3.amazonaws.com/files/recorded_meetings/{{$item1.rm_original_file}}" target="_blank">{{$item1.rm_meeting_file}} <br>-->
        <a href="{{$item1.rm_file_location}}" target="">Link</a> <br />
       {{/foreach}}
       {{/if}}
       </td>
        <td>{{ if $item.checklist485}}  
<!--        <a href = "https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_485}}?dummy={{$ran}}" target="_blank">Download</a><br />{{$item.checklist485}}  -->
     
            <a href = "/business.download_content?file_name={{$item.doc_485}}&module_name=business.home" target="_blank">Download</a><br />{{$item.checklist485}} {{/if}}    
        
        </td> 
        <td>
        <form name ="recmetT" method="post" action="">
     	<input type="hidden" name="docsign_sent[{{$item.bsn_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="docsign_sent[{{$item.bsn_id}}]"   onclick="update_doc_sent({{$item.bsn_id}},this.checked)" {{if $item.bsn_wlr_docsign_sent eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form>
          {{if $item.bsn_wlr_docsign_sent eq 1}} {{$item.bsn_wlr_docsign_date}}<br />{{$item.bsn_wlr_docsign_user}} {{/if}}
          
        <script>
       
       function update_doc_sent(id,value)
	   {
		  
		 var val = 0;
		if(value==true) { val = 1; } 
		if(value==false) { val = 0; } 
         $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}watch_list_report.update_docsent/bsn_id/"+id+"/value/"+value,
					   success: function(result){
						   location.reload();
				   }
				 });
	
	   }
	
       </script>   
        </td>
        
        
        <td>{{$item.checklist45}} </td>
        
        <td>        <form name = "pbd" method="post" action="">
        <input type="text" name="bs_wlr_latest_css[{{$item.bsn_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo2_{{$item.bsn_id}}" value="{{$item.bs_wlr_latest_css}}"  /> 
       <input type="submit" value="Set" name="hia" class="set" /> <br /> {{if $item.bs_wlr_latest_css}}{{$item.bs_wlr_latest_css_user}} {{/if}}
       </form></td>
      
<!--        <td> m
        <form name ="recmetT" method="post" action="">
     	<input type="hidden" name="sundayappt[{{$item.bsn_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="sundayappt[{{$item.bsn_id}}]" value="1"  onclick="this.form.submit();" {{if $item.bsn_wlr_sunday_appt eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form>
          {{if $item.bsn_wlr_sunday_appt eq 1}} {{$item.bsn_wlr_sunappt_user}}<br />{{$item.bsn_wlr_sunappt_date}} {{/if}}
       </td>-->
       <td>
        <form name ="recmetT2" method="post" action="">
     	<input type="hidden" name="sunbooked[{{$item.bsn_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="sunbooked[{{$item.bsn_id}}]" value="1"  onclick="this.form.submit();" {{if $item.bsn_wlr_sunbook eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form>
          {{if $item.bsn_wlr_sunbook eq 1}} {{$item.bsn_wlr_sunbook_user}}<br />{{$item.bsn_wlr_sunbook_date}} {{/if}}
       
       </td>
       
       
       <td>
        <form name ="recmet32" method="post" action="">
     	<input type="hidden" name="couriered[{{$item.bsn_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="couriered[{{$item.bsn_id}}]" value="1"  onclick="this.form.submit();" {{if $item.bs_wlr_par_couriered eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form>
          {{if $item.bs_wlr_par_couriered eq 1}} {{$item.bs_wlr_par_cour_date}}<br />{{$item.bs_wlr_par_cour_user}} {{/if}}
       </td>
       
        <td>{{if $item.doc_384}}  
     <!--   <a href = "https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_384}}?dummy={{$ran}}" target="_blank">Download</a>
  -->     <a href="/watch_list_report.download_content?file_name={{$item.doc_384}}&module_name=watch_list_report.home" >Download</a><br /> 
        
        {{$item.checklist384}} 
        {{/if}} </td>
             <td> </td>
        <td>{{if $item.doc_614}}  
    <!-- <a href = "https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_614}}?dummy={{$ran}}" target="_blank">Download</a>
-->    
     <a href="/watch_list_report.download_content?file_name={{$item.doc_614}}&module_name=watch_list_report.home" >Download</a>
    
     <br />{{$item.checklist614}} 
     
     
     {{/if}} </td>
  
        <td> </td>
        <td>{{$item.checklist44}} </td>
          <td><input type="button" name="email" value="Email" onclick='javascript:sendemail("{{$item.bcust_misc_email1}}","{{$item.bcust_fname}}","{{$item.bsn_address}}");' style="width:54px; height:20px; font-size:11px; line-height:17px !important; padding:0px !important" /> </td>
        <td> <!--<input type="checkbox" name="watch[{{$item.bsn_id}}]" value="2" />-->
        
        <form name ="recmetT" method="post" action="">
     	<input type="hidden" name="watch[{{$item.bsn_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="watch[{{$item.bsn_id}}]" value="2"  onclick="this.form.submit();" {{if $item.bsn_watch_list eq 1 }} checked="checked" {{/if}} />
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
  
</div>
