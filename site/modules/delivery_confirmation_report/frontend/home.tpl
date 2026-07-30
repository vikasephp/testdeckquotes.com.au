<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

{{include file=$jdata}}
{{include file=$tiny_basic}}		
<h3 class="page-title">{{$title}}</h3>

<style>
.set2 { font-size:10px !important; 
       width:60px !important; display:inline-block; 
	  padding-top:1px !important;
	  padding-bottom: 1px !important;
	  padding-left:1px !important;
	  height:25px !important; 
	  margin-top:7px;}
	  
.set3 { font-size:10px !important; 
       width:120px !important; display:inline-block; 
	  padding-top:1px !important;
	  padding-bottom: 1px !important;
	  padding-left:1px !important;
	  height:25px !important; 
	  margin-top:7px;}	  
	  
#fancybox-wrap {z-index:9999999;} 
	  
</style>

<script language="javascript">
function add_procedure()
{
	var viewurl = "{{$BASE_URL}}delivery_confirmation_report.view_procedure"+ "/random/" + Math.random();	

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
	var viewurl = "{{$BASE_URL}}delivery_confirmation_report.view_status"+ "/random/" + Math.random();	

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


function add_task()
{
	var viewurl = "{{$BASE_URL}}delivery_confirmation_report.viewtask"+ "/random/" + Math.random();	

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
	var viewurl = "{{$BASE_URL}}delivery_confirmation_report.viewpriority"+ "/random/" + Math.random();	

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




function add_owner()
{
	var viewurl = "{{$BASE_URL}}delivery_confirmation_report.view_owner"+ "/random/" + Math.random();	

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

function add_event()
{
	var viewurl = "{{$BASE_URL}}delivery_confirmation_report.view_event"+ "/random/" + Math.random();	

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

function add_who()
{
	var viewurl = "{{$BASE_URL}}delivery_confirmation_report.view_who"+ "/random/" + Math.random();	

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


<table  width="100%"><tr><td>

<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">

<div style="float:left;">
<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> 
<input type="button" name="status" value="Status Admin" onclick="javascript:add_status();" /> 
<input type="button" name="owner"  value="Owner Admin" onclick="javascript:add_owner();" /> 
<input type="button" name="event"  value="Event Admin" onclick="javascript:add_event();" /> 
<input type="button" name="who"  value="Who Admin" onclick="javascript:add_who();" /> 
<br />
<strong> Project Name  : </strong> 
<input type="text" list = 'project' name="project_name" style ="width:300px" value="{{$search_project}}" />
<input type="submit" name="search" value = "Search" /> 
<input type="submit" name="clear" value = "Clear Search" />
&nbsp;&nbsp; <span style="border:1px solid #0CF; padding:3px; font-weight:bold;">Reports Added Seven Days : {{$tot_seven.seven}} </span>
 <br />
<strong> Status  : </strong> 
 <select name="dc_status" >
        <option value="-1" {{if $item.dc_status eq -1}} selected="selected" {{/if}}>Please Select </option>
        {{foreach from = $stdetail key="key4" item="item4"}}
        <option value="{{$item4.st_id}}" {{if $item4.st_id eq $item.dc_status}} selected="selected" {{/if}}>{{$item4.st_status}}</option>
        {{/foreach}}
 </select>
<input type="submit" name="status_search" value = "Search" /> 
</div>


<div style="float:right; text-align:right;"> 
<input type="button" value="Export To XLS" onclick="document.location.href='{{$BASE_URL}}{{$XFA.home}}/export/1'" /> &nbsp;
<input type="submit" name="hidden" value = "Show Hidden" /> 
<input type="button" name="Add New " value="Add New" onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.detail}}');" />
</div>
</form>
</td></tr></table>

<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
                   <th class="topmenu" align="center" valign="middle" width="3%">URN.</th>  
                   <th class="topmenu" align="center" valign="middle" width="15%">Project</th> 
                   <th class="topmenu" align="center" valign="middle" width="10%">Status</th> 
                  <!-- <th class="topmenu" align="center" valign="middle" width="10%">Traffic Light</th>   --> 
                   <th class="topmenu" align="center" valign="middle" width="10%">Supplier</th>  
                   <th class="topmenu" align="center" valign="middle" width="5%">Purchase Order</th> 
                   <th class="topmenu" align="center" valign="middle" width="5%">Item Included</th> 
                   <th class="topmenu" align="center" valign="middle" width="10%">Event</th>
                   <th class="topmenu" align="center" valign="middle" width="10%">Delivery PDF</th> 
                   <th class="topmenu" align="center" valign="middle" width="8%">Delivery Date</th>
                   <th class="topmenu" align="center" valign="middle" width="8%">Latest Update</th>
                   <th class="topmenu" align="center" valign="middle" width="10%">Who</th>  
                   <th class="topmenu" align="center" valign="middle" width="9%">Hide</th> 
                   <th class="topmenu" align="center" valign="middle" width="9%">Action</th>   
            </tr>
        </thead>
    <tbody>

 {{foreach from=$list key="key" item="item"}}

    <tr bgcolor="#FFFFFF">

        <td>{{$item.dc_id}}</td>
        <td>{{$item.dc_project}}</td> 
<td {{if $item.st_color eq 1}} style="background:#00CC33;" {{elseif $item.st_color eq 2}} style="background:#ff7f27;" {{elseif $item.st_color eq 3}} style="background:#F00;" {{/if}}>
          <select name="{{$TABLE}}[dc_status]"  Onchange = "update_status({{$item.dc_id}},this.value)">
                <option value="-1" {{if $item.dc_status eq -1}} selected="selected" {{/if}}>Please Select </option>
                {{foreach from = $stdetail key="key4" item="item4"}}
                <option value="{{$item4.st_id}}" {{if $item4.st_id eq $item.dc_status}} selected="selected" {{/if}}>{{$item4.st_status}}</option>
                {{/foreach}}
        </select>
        
        <script>
	   
		function update_status(id,value)
		{
			
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}delivery_confirmation_report.update_status/dc_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	</script>
        
        </td> 
        
       
<!--       {{ if $item.dc_traffic_light eq 1}}
       <td style="background:#00CC33";>
       <a href="{{$BASE_URL}}delivery_confirmation_report.colorbox/dc_id/{{$item.dc_id}}" class="various">Color</a>
       <br /><br />{{$item.dc_traffic_light_user}}<br />{{$item.dc_traffic_light_date}}<br />
        <a href="{{$BASE_URL}}delivery_confirmation_report.reason/dc_id/{{$item.dc_id}}" class="various">Read</a>
       </td>
       {{ elseif  $item.dc_traffic_light eq 2}}
       <td style="background: #ff7f27";>
       <a href="{{$BASE_URL}}delivery_confirmation_report.colorbox/dc_id/{{$item.dc_id}}" class="various">Color</a>
       <br /><br />{{$item.dc_traffic_light_user}}<br />{{$item.dc_traffic_light_date}}<br />
       <a href="{{$BASE_URL}}delivery_confirmation_report.reason/dc_id/{{$item.dc_id}}" class="various">Read</a>
       </td>
       {{ elseif  $item.dc_traffic_light eq 3}}
       <td style="background: #F00";>
       <a href="{{$BASE_URL}}delivery_confirmation_report.colorbox/dc_id/{{$item.dc_id}}" class="various">Color</a>
      <br /><br />{{$item.dc_traffic_light_user}}<br />{{$item.dc_traffic_light_date}}<br />
      <a href="{{$BASE_URL}}delivery_confirmation_report.reason/dc_id/{{$item.dc_id}}" class="various">Read</a>
       </td>
       {{else }}
       <td>
       <a href="{{$BASE_URL}}delivery_confirmation_report.colorbox/dc_id/{{$item.dc_id}}" class="various">Color</a></td>
       {{/if}}-->
       
        
       
        <td>
         <select name="{{$TABLE}}[ow_owner]"  Onchange = "update_owner({{$item.dc_id}},this.value)">
                <option value="-1" {{if $item.dc_owner eq -1}} selected="selected" {{/if}}>Please Select </option>
                {{foreach from = $owdetail key="key4" item="item4"}}
                <option value="{{$item4.ow_id}}" {{if $item4.ow_id eq $item.dc_owner}} selected="selected" {{/if}}>{{$item4.ow_owner}}</option>
                {{/foreach}}
        </select>
        
        <script>
	   
		function update_owner(id,value)
		{
			
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}delivery_confirmation_report.update_owner/dc_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	</script>
        
        
        </td>
        <td> {{$item.dc_purchase_order}} </td>
        <td><a href="{{$BASE_URL}}delivery_confirmation_report.view_item/po/{{$item.dc_purchase_order}}" class="various">Shows</a></td>
       
        </td>
        
        
        <td>
        <select name="{{$TABLE}}[ev_event]"  Onchange = "update_event({{$item.dc_id}},this.value)">
                <option value="-1" {{if $item.dc_event eq -1}} selected="selected" {{/if}}>Please Select </option>
                {{foreach from = $evdetail key="key5" item="item5"}}
                <option value="{{$item5.ev_id}}" {{if $item5.ev_id eq $item.dc_event}} selected="selected" {{/if}}>{{$item5.ev_event}}</option>
                {{/foreach}}
        </select>
        
        <script>
	   
		function update_event(id,value)
		{
			
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}delivery_confirmation_report.update_event/dc_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
        </script>
        </td>

        <td>{{if $item.dc_del_pdf}} 
        
      <!--  <a href="https://deckquote.s3.amazonaws.com/files/uploads_2023/{{$item.dc_del_pdf}}" target="_blank">Download</a>-->
        <a href="/delivery_confirmation_report.download_content?file_name={{$item.dc_del_pdf}}&module_name=delivery_confirmation_report.home" target="_blank">Download</a>
        
        
        {{/if}}</td>
        <td>{{$item.dc_date}}</td>
      <!--  <td>m{{$item.dc_schedule_date}}</td>-->
        <td>{{$item.dc_confirmation_date}}</td>
        <td>
         <select name="{{$TABLE}}[ev_who]"  Onchange = "update_who({{$item.dc_id}},this.value)">
                <option value="-1" {{if $item.dc_who eq -1}} selected="selected" {{/if}}>Please Select </option>
                {{foreach from = $wodetail key="key6" item="item6"}}
                <option value="{{$item6.wo_id}}" {{if $item6.wo_id eq $item.dc_who}} selected="selected" {{/if}}>{{$item6.wo_who}}</option>
                {{/foreach}}
        </select>
        
        <script>
	   
		function update_who(id,value)
		{
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}delivery_confirmation_report.update_who/dc_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
        </script>
        
         </td>
         
         <td> 
         
        <form name ="recmet3" method="post" action="">
     	<input type="hidden" name="hide[{{$item.dc_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="hide[{{$item.dc_id}}]" value="1"  onclick="this.form.submit();" {{if $item.dc_hide eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form>  
          
         </td>
         
	
        
        
        <td> <a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" class="various" title="Edit"> 
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
             <a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete">
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>&nbsp;&nbsp
            
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