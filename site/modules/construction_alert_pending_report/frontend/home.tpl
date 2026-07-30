 
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
{{include file=$jdata}}
{{include file=$tiny_basic}}		

<script>
		!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
	</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />

<h3 class="page-title">{{$title}}</h3>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

<style>
.dtpic {
	width:65px !important;
	padding-top:1px !important;
	padding-bottom:1px !important;
	margin-bottom:10px !important;	
}
.dt {border:1px solid #CCC; padding:8px; margin-top:15px !important; }	
#fancybox-wrap {z-index:9999999;} 
</style>

<script type="text/javascript" >  
		$(document).ready(function() {
			/*
			*   Examples - images
			*/
			$(".various").fancybox({
				'width': '95%',
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


function add_procedure()
{
	var viewurl = "{{$BASE_URL}}construction_alert_report.view_procedure"+ "/random/" + Math.random();	

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


function add_priority()
{
	var viewurl = "{{$BASE_URL}}construction_alert_report.viewpriority"+ "/random/" + Math.random();	

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

function supplier_report()
{
	var viewurl = "{{$BASE_URL}}construction_alert_report.view_scar"+ "/random/" + Math.random();	

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

function customer_included()
{
	var viewurl = "{{$BASE_URL}}construction_alert_report.view_cust_included"+ "/random/" + Math.random();	

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

function staff_included()
{
	var viewurl = "{{$BASE_URL}}construction_alert_report.view_staff_included"+ "/random/" + Math.random();	

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
	var viewurl = "{{$BASE_URL}}construction_alert_report.view_type"+ "/random/" + Math.random();	

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


<div style="float:left; margin-left:3px; text-align:left;">
<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" />
<input type="button" name="proc_panel" value="Supplier Construction Alert Report" onclick="javascript:supplier_report();" />
<input type="button" name="type_options" value="Type Options" onclick="javascript:add_type();" /> 
<br />
<input type="button" name="proc_panel" value="Customer Included Alerts" onclick="javascript:customer_included();" />  
<input type="button" name="proc_panel" value="Responsible Staff Panel" onclick="javascript:staff_included();" /> 
<form name="filt" action="" method="post">
<span>
Project   : 
<datalist id='project'>
           {{foreach from=$projdetail key="key" item="item"}}
            <option value="{{$item.bsn_name}}" {{if $bsnid eq $item.bsn_id}} selected="selected" {{/if}}>
            {{$item.bsn_name}}
            </option>
            {{/foreach}}
  	 </datalist>
         <input type="text" list = 'project' name="pf" style ="width:300px" value="{{$detail.car_project}}" />
<br />


Suppliers : 
	<datalist id='supplierlist'>
           {{foreach from=$supdetail key="key2" item="item2"}}
            <option value="{{$item2.co_company_name}}" {{if $bsnid eq $item2.bsn_id}} selected="selected" {{/if}}>
            {{$item2.co_company_name}}
            </option>
            {{/foreach}}
  	 </datalist>
         <input type="text" list = 'supplierlist' name="supplier" style ="width:300px" value="{{$detail.car_supplier}}" />
         
<br />  

Type : <select name="type" style="width:150px;" >
         <option value="">Please Select</option>
         {{foreach from=$typedetail key="key6" item="item6"}}
         <option value="{{$item6.cp_type}}">{{$item6.cp_type}}</option>
	 {{/foreach}}
	 </select> 
 
 <br />

Urgency : <select name="urgency" style="width:150px;" >
         <option value="">Please Select</option>
         {{foreach from=$todetail key="key4" item="item4"}}
         <option value="{{$item4.pr_id}}" >{{$item4.pr_priority}}</option>
	 {{/foreach}}
	 </select> 
 
 <br />
 Responsible Staff : <select name="res_staff" style="width:150px;" >
         <option value="" selected="selected">Please Select</option>
         {{foreach from=$who key="key6" item="item6"}}
         <option value="{{$item6.cs_position}}" >{{$item6.cs_position}}</option>
	 {{/foreach}}
	 </select>
 <br />              
    
<input type="submit" name="filter" value = "Search" /> &nbsp; &nbsp;&nbsp;&nbsp;
<input type="submit" name="clear" value = "Clear Search" /> &nbsp;&nbsp;&nbsp;&nbsp;
<!--<input type="submit" name="print" value = "Merge Print" /> &nbsp;&nbsp; -->
</form>  

<br />
<form name="filt2" method="post">
  <input type="submit" value="Clear database for Merge Print files" name="clear_database_for_print_all_files" id="clear_database_for_print_all_files">
  <br>
  <div class="show_remainingCredits">
    <input type="submit" value="Merge Print Reports" name="print"  />
    <span class="show_info">Total files ::  {{$total_records_of_print_reports }}/ </span>
    <span class="show_info">Total Printed files :: {{$total_printed_records }}  </span>
  </div>
 
  <!--<input type="submit" value="Merge Match PO PDF" name="merge__po_number_pdf"    id ="submitBtn"/><br /><br /> -->
  <input type="submit" value="Download Merge Print" name="download_all_files_report" id="dafaz_submitBtn">
  <br>
</form>
<!--<span style="border:1px solid #0CF; padding:4px;"><strong>Open : {{$openData.tot_open}}<strong></span>&nbsp;&nbsp;
<span style="border:1px solid #0CF; padding:4px;"><strong>24 Hours : {{$tot_tf.tf}}<strong></span>&nbsp;&nbsp;
<span style="border:1px solid #0CF; padding:4px;"><strong>7 Days : {{$tot_seven.seven}}<strong></span>&nbsp;&nbsp;-->
<!--<span style="border:1px solid #0CF; padding:4px;"><strong>24 Close : {{$tot_tf_close.tf_close}}<strong></span>&nbsp;&nbsp;-->
<br />
          
</div>

<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
<div style="float:right; text-align:right;"> 
 <select name="sortby" >
         <option value="">Please Select</option>
         <option value="1" {{if $sortby eq 1}} selected="selected" {{/if}}>Record Number</option>
	 <option value="2" {{if $sortby eq 2}} selected="selected" {{/if}}>Project</option>
         <option value="3" {{if $sortby eq 3}} selected="selected" {{/if}}>Date</option>
         <option value="4" {{if $sortby eq 4}} selected="selected" {{/if}}>Supplier</option>
         <option value="5" {{if $sortby eq 5}} selected="selected" {{/if}}>Urgency</option>
</select>
<input type="submit" name="sort" value = "Sort" />
<!--<input type="button" name="Add New " value="Add New" onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.detail}}');" />-->

<input type="button" name="priority" value="Edit Priority" onclick="javascript:add_priority();" /> 
</div>
</form>

<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
                   <th class="topmenu" align="center" valign="middle" width="3%">Rec. No.</th>  
                   <th class="topmenu" align="center" valign="middle" width="15%">Project</th> 
                   <th class="topmenu" align="center" valign="middle" width="9%">Contact Info</th> 
                   <th class="topmenu" align="center" valign="middle" width="5%">Date</th> 
                   <th class="topmenu" align="center" valign="middle" width="9%">Alert</th>
                   <th class="topmenu" align="center" valign="middle" width="5%">Include Supplier</th>
            	   <th class="topmenu" align="center" valign="middle" width="5%">Photos</th>
   		   <th class="topmenu" align="center" valign="middle" width="8%">Type</th>
                   <th class="topmenu" align="center" valign="middle" width="8%">Update From Supplier</th>
                   <th class="topmenu" align="center" valign="middle" width="5%">Urgency</th> 
           
                   <th class="topmenu" align="center" valign="middle" width="8%">Due Date</th>
                   <th class="topmenu" align="center" valign="middle" width="8%">Include Customer</th>
                   <th class="topmenu" align="center" valign="middle" width="8%">All Responsible Staff</th>
                   <th class="topmenu" align="center" valign="middle" width="8%">Created By</th>
                   <th class="topmenu" align="center" valign="middle" width="4%">Status</th> 
                   <th class="topmenu" align="center" valign="middle" width="9%">Action</th>   
            </tr>
        </thead>
    <tbody>

 {{foreach from=$list key="key" item="item"}}

     {{if $item.car_row_color eq 1 }}
     <tr style="background:#FF0;">
     {{else}}
     <tr bgcolor="#FFFFFF">
     {{/if}}	
    

        <td>{{$item.car_id}}</td>
        <td>{{$item.car_project|stripslashes}}</td> 
        <td>{{$item.bcust_fname}}&nbsp;{{$item.bcust_lname}}<br />{{$item.bcust_misc_moble}}</td> 
        <td>{{$item.car_date}}</td>
        <td>{{$item.car_alert}}</td>
        <td>
        <form name ="recmet2" method="post" action="">
        <input type="hidden" name="car_project" value="{{$item.car_project}}" />
        <input type="hidden" name="car_alert" value="{{$item.car_alert}}" />
     
        {{$item.car_include_supplier}} <br /><br />
        <a href ="{{$BASE_URL}}construction_alert_report.include_suppliers/car_id/{{$item.car_id}}" class="various">Include Supplier</a><br /><br />
        </td>
        
        <td>
        {{if $item.car_image1}}
        <div style="text-align:center;"> 
        Photo 1 :  <a href="{{$BASE_URL}}files/uploads/{{$item.car_image1}}" target="_blank">Download</a>
        </div>
        {{/if}}
        
        
        
        {{if $item.car_image2}}
        <div style="text-align:center;"> 
        Photo 2 :  <a href="{{$BASE_URL}}files/uploads/{{$item.car_image2}}" target="_blank">Download</a>
        </div>
        {{/if}}
        
        {{if $item.car_image3}}
        <div style="text-align:center;"> 
        Photo 3 :  <a href="{{$BASE_URL}}files/uploads/{{$item.car_image3}}" target="_blank">Download</a>
        </div>
        {{/if}}
        
        {{if $item.car_image4}}
        <div style="text-align:center;"> 
        Photo 4 :  <a href="{{$BASE_URL}}files/uploads/{{$item.car_image4}}" target="_blank">Download</a>
        </div>
        {{/if}}
        
        {{if $item.car_image5}}
        <div style="text-align:center;"> 
        Photo 5 :  <a href="{{$BASE_URL}}files/uploads/{{$item.car_image5}}" target="_blank">Download</a>
        </div>
        {{/if}}
        
         </td>

        <td>{{$item.car_type}}</td>
        <td>{{if $item.car_comment || $item.supplier_upadate}}
         <a href ="{{$BASE_URL}}construction_alert_report.view_update/car_id/{{$item.car_id}}" class="various">Show</a>
         {{/if}}
        </td>
        
        <td>
        <select name="{{$TABLE}}[car_urgency]" Onchange = "update_urgency({{$item.car_id}},this.value)"/>
          <option value="150"   {{if  $detail.car_urgency == ''}}selected{{/if}}>Please Select</option>
          {{foreach from=$todetail key="key3" item="item3"}}
          <option value="{{$item3.pr_id}}"  {{if $item.car_urgency == $item3.pr_id}}selected{{/if}}> {{$item3.pr_priority}}</option>
          {{/foreach}}
        </select>  
        
         <script language="javascript">
       	
	function update_urgency(id,value)
		{
			
		 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}construction_alert_report.update_urgency/car_id/"+id+"/value/"+value,
						   success: function(result){
					   }
					 });
		}
       
       </script>
        
        </td>
        <td>
        <input type="text" name="car_new_date[{{$item.car_id}}]" class="w16em dateformat-d-ds-m-ds-Y" id="demo_{{$item.car_id}}" value="{{$item.car_new_date}}" onfocus ="update_two({{$item.car_id}}, this.value);"  /> 
	
        
         <script>
	  	function update_two(id,value)
		{
			
			$.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}construction_alert_report.update_due_date/car_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
					
		}
		
	</script>
        
        </td>
        <td> 
        <form name ="recmet3" method="post" action="">
     	<input type="hidden" name="include[{{$item.car_id}}]" value="No" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="include[{{$item.car_id}}]" value="Yes"  onclick="this.form.submit();" {{if $item.car_include_cust eq 'Yes' }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form>  
       </td>
        <td> 
        {{$item.car_resp_staff}}
         <a href ="{{$BASE_URL}}construction_alert_report.select_staff/car_id/{{$item.car_id}}" class="various">Select Staff</a>
        
        </td>
        
        <td> {{$item.car_created_by}}</td>
        <td> {{if $item.resolved eq 1 }} Pending {{else}} {{$item.car_status}}{{/if}}</td>
        
        <td>   
        <form name="app" method="post" action="">
        <input type="hidden" name="car_id" value="{{$item.car_id}}"  />
        <select name="car_approve"  required="required"/>
          <option value=""   {{if  $item.car_approve == ''}}selected{{/if}}>Please Select</option>
          <option value="Approve"   {{if  $item.car_approve == 'Approve'}}selected{{/if}}>Approve</option>
          <option value="Not Approve"   {{if  $item.car_approve == 'Not Approve'}}selected{{/if}}>Not Approve</option>
        </select>  
        <input type="submit" name="app_save" value="Save" />
        </form>
        
          
        </td>
    </tr>  
  {{/foreach}}
  </tbody>
  </table>
    
     {{if $last > 1}} 
    <table width="90%" border="0" cellpadding="0" cellspacing="0">   
    <tr>  
  {{if $list}}   
<td align="center">
 <div class='pagination'>
 {{if $pagenum == 1}}
 <span class='disabled'>&#171; previous</span>
 {{else}}
<a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{math equation="x - y" x=$pagenum y=1}}" title="Previous">&#171; previous</a>
 {{/if}}
        
{{if $pagenum != 1}}
 <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/1" title="{{$page_num}} Page">1</a></span>
 {{else}}<span class='current'>1</span>
 {{/if}}{{if $pagenum != 2}}
   <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/2" title="{{$page_num}} Page">2</a></span>
{{else}}<span class='current'>2</span>
 {{/if}}
{{if $paginateprev.0 > 3}}
...
{{/if}}
{{foreach from=$paginateprev key="page_key" item="page_num"}}
	{{if $page_num == $pagenum OR $page_num <= 2}}
   		{{elseif $page_num == $lastone}}
    
    	{{else}} <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$page_num}}" title="{{$page_num}} Page">{{$page_num}}</a></span>
        {{/if}}
        {{/foreach}}

{{foreach from=$paginatenext key="page_key" item="page_num2"}}
  	{{if $page_num2 < $last AND $page_num2 != $lastone}}
    			{{if $page_num2 == 1}}
                {{elseif $page_num2 == 2}}
                {{else}}
                    {{if $page_num2 == $pagenum OR $page_num2 <= 0}}
                            <span class='current'> {{$page_num2}}</span>
                    {{else}}
                        <a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$page_num2}}" title="{{$page_num2}} Page">{{$page_num2}}</a>
                     {{/if}}
                {{/if}}     
    {{/if}}
{{/foreach}}
{{if $page_num2 < $lasttow}}
...
{{/if}}
{{if $lastone == 1}}
{{elseif $lastone == 2}}
{{else}}
{{if $pagenum == $lastone }}
<span class='current'>{{$lastone}}</span>
{{else}}
<a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$lastone}}" title="{{$lastone}} Page">{{$lastone}}</a>
{{/if}}
{{/if}}
{{if $last == 1}}
{{elseif $last == 2}}
{{else}}
{{if $pagenum == $last}}
<span class='current'>{{$last}}</span>
{{else}}
 <a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$last}}" title="{{$last}} Page">{{$last}}</a>
{{/if}}
{{/if}}
{{if $pagenum == $last}}
<span class='disabled'>next &#187;</span>
 {{else}}
<a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{math equation="x + y" x=$pagenum y=1}}" title="Next">next &#187;</a></div>
 {{/if}}
</td>
{{else}}
<td align="center" height="300">Record Not found... </td>
{{/if}}
 </tr>
</table> 
{{/if}}
</div>