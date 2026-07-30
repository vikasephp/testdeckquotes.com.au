<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
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
	var viewurl = "{{$BASE_URL}}site_inspections_report.view_procedure"+ "/random/" + Math.random();	

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

function addfeedback(bsn_id)
{
	var viewurl = "{{$BASE_URL}}site_inspections_report.addfeedback"+ "/bsn_id/" + bsn_id;	
		
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

function viewfeedback(bsn_id)
{
	var viewurl = "{{$BASE_URL}}site_inspections_report.viewfeedback"+ "/bsn_id/" + bsn_id;	
	
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
<form name="mlist" method="post" enctype="multipart/form-data">

<div style="float:left; text-align:left;">
&nbsp; &nbsp; <input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> <br />

&nbsp; &nbsp; <strong>Search Address: </strong>
<input type="text" name="keyword" value="{{$keyword}}" style="width:250px;" placeholder="Search for Address"/>
<input type="submit" value="Search" name="search"  /> &nbsp;<input type="submit" name="clear_search" value = "Clear Search" /> <br />

&nbsp; &nbsp; <strong>Search Designer: </strong>
<input type="text" name="designer"  style="width:250px;" placeholder="Search for Designer"/>
<input type="submit" value="Search" name="search"  /> &nbsp;<input type="submit" name="clear_search" value = "Clear Search" /> <br />

&nbsp; &nbsp; <strong>Search Client: </strong>
<input type="text" name="client"  style="width:250px;" placeholder="Search for First Name"/>
<input type="submit" value="Search" name="search"  /> &nbsp;<input type="submit" name="clear_search" value = "Clear Search" />

&nbsp; &nbsp; Sort By : <!--<input type="submit" name="ddar" value = "Date Design Agreement Signed" />-->
 <input type="submit" name="sortbydesigner" value = "Designer" />
&nbsp; &nbsp;  <input type="submit" name="bookingdate" value = "Booking Date" />

<!--&nbsp; &nbsp;<strong> Filter By : </strong> 

        <select name="status_search"/>
        <option value="">Show All</option>
        <option value="2">Planning Approvals</option>
        <option value="5">Inclusions</option>
        <option value="6">Pre Construction</option>
        <option value="3">Construction</option>
        <option value="4">Complete</option>
        </select> 
        &nbsp; &nbsp;<input type="submit" value="Filter" name="filter" /> 
        <input type="submit" value="Clear Filter" name="clear" /> -->
        
        
</div>
<div style="float:right;"> 
<input type="submit" value="Show Hidden" name="showhidden" />
<input type="button" value="Export To XLS" onclick="document.location.href='{{$BASE_URL}}site_inspections_report.home/export/1'" /> &nbsp;
</div>

</div>
<div style="float:left; width:100%;">
  <table id="doclist-table" class="nav-back" width="100%">
    <thead>
      <tr>
        <th class="topmenu" align="center" valign="middle" width="3%">SrNo</th>
        <th class="topmenu" align="center" valign="middle" width="14%">Project Address</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Designer</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Priority</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Date of IDM</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Date Design Agreement Signed</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Suburb ONLY</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Contact Info</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Add Feedback</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Booking Date</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Booking Time</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Site Visit Booked</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Site Visit Completed</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Hide From Report</th>
                   
      </tr>
    {{if $list}}
    <tbody>

      <!--{{assign var=countn value= $numstartvounter}}-->
       {{assign var=countn value= $total}}
      
       {{foreach from=$list key="key" item="item"}}
        <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
        <td> {{counter}} </td>
        <td><strong>{{$item.bcust_fname}} {{$item.bcust_lname}}</strong><br />{{$item.bsn_address}}</td>
        <td>{{$item.designer}}</td>
        <td>
        <input type="text" name="priority" value="{{$item.bsn_sir_priority}}" onkeyup="update_priority({{$item.bsn_id}},this.value)" style="width:40px;"/>
        
        <script>
			function update_priority(id,value)
			{
					 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}site_inspections_report.update_priority/bsn_id/"+id+"/value/"+value,
						   success: function(result){
							
						}
						
					});
			}
	    </script>
        
        
        
        </td>
        <td><input type="text" name="dt_of_idm" value="{{$item.bsn_sir_idm_date}}"  onfocus="update_date_idm({{$item.bsn_id}},this.value)"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo1_{{$item.bsn_id}}" style="width:60px;"/>
        
         <script>
			function update_date_idm(id,value)
			{
					
					 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}site_inspections_report.update_date_idm/bsn_id/"+id+"/value/"+value,
						   success: function(result){
							
						}
						
					});
			}
	    </script>
        
        </td>
        
        <td>{{$item.uid205}}</td> 
        
        <td> {{$item.bsn_suburb}}</td>
        
        <td>{{$item.bcust_misc_moble}}</td>
        <td>
         <input type="button" name="Alert" value="Add Feedback" onclick="javascript:addfeedback({{$item.bsn_id}});" style="width:90px; height:20px; font-size:11px; line-height:17px !important; padding:0px !important" /><br />
          
          <input type="button" name="Alert" value="View Feedback" onclick="javascript:viewfeedback({{$item.bsn_id}});" style="width:90px; height:20px; font-size:11px; line-height:17px !important; padding:0px !important" />
        </td>
         
         <td>
          <form name = "spoken" method="post" action="">
        <input type="text" name="book_date[{{$item.bsn_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo2_{{$item.bsn_id}}" value="{{$item.bsn_sir_book_date}}" onfocus="update_book_date({{$item.bsn_id}},this.value)" /> 
      <script>
			function update_book_date(id,value)
			{
					
					 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}site_inspections_report.update_book_date/bsn_id/"+id+"/value/"+value,
						   success: function(result){
							
						}
						
					});
			}
	    </script>
     
       </form>
         </td>
         <td>
         
          <form name = "spoken" method="post" action="">
      <input type="text" name="book_time[{{$item.bsn_id}}]" value="{{$item.bsn_sir_book_time}}" onkeyup="update_book_time({{$item.bsn_id}},this.value)" /> 
      
       </form>
        <script>
			function update_book_time(id,value)
			{
					
					 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}site_inspections_report.update_book_time/bsn_id/"+id+"/value/"+value,
						   success: function(result){
							
						}
						
					});
			}
	    </script>
       
       </td>
            
         <td>
         {{$item.uid594}}<br />
     <form name ="recmet" method="post" action="">
     <input type="hidden" name="svb[{{$item.bsn_id}}]" value="0" />
  	<label class="switch">
   <input class="switch-input" type="checkbox"  name="svb[{{$item.bsn_id}}]" value="1"  onclick="this.form.submit();" {{if $item.uid594_com eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
        </label>
     </form>
         
         </td>
         
         <td>
         {{$item.uid303}}<br />
     <form name ="recmet" method="post" action="">
     <input type="hidden" name="svc[{{$item.bsn_id}}]" value="0" />
  	<label class="switch">
   <input class="switch-input" type="checkbox"  name="svc[{{$item.bsn_id}}]" value="1"  onclick="this.form.submit();" {{if $item.uid303_com eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
        </label>
     </form>
         
         
         </td>      
        
        <td>
         <form name ="recmet3" method="post" action="">
     	<input type="hidden" name="hide[{{$item.bsn_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="hide[{{$item.bsn_id}}]" value="1"  onclick="this.form.submit();" {{if $item.bsn_sir_hide eq 1 }} checked="checked" {{/if}} />
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
  <table id="doclist-table"  width="100%" bgcolor="#d3e8d6">
    <thead>
  
      <tr>
        <td colspan="2">&nbsp;</td>
      </tr>
    </thead>
  </table>
</div>