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
	var viewurl = "{{$BASE_URL}}debt_management_report.view_procedure"+ "/random/" + Math.random();	

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



<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
<div style="float:left;">
&nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> 
nbsp; &nbsp; &nbsp; &nbsp;<strong> Filter By : </strong> 
      <select name="status"/>
        <option value="">Please Select </option>
             <option value="Contacted" {{if $item.dm_status eq 'Contacted'}} selected="selected" {{/if}}>Contacted</option>
             <option value="ACAT Form Lodged" {{if $item.dm_status eq 'ACAT Form Lodged'}} selected="selected" {{/if}}>ACAT Form Lodged</option>
             <option value="ACAT In Progress" {{if $item.dm_status eq 'ACAT In Progress'}} selected="selected" {{/if}}>ACAT In Progress</option>
             <option value="Resolved" {{if $item.dm_status eq 'Resolved'}} selected="selected" {{/if}}>Resolved</option>
        </select> 
        &nbsp; &nbsp;<input type="submit" value="Filter" name="filter" />   
        &nbsp;<input type="submit" name="clear" value = "Clear Filter" /> 
</div>

<div style="float:right;"> 
<input type="button" name="Add New " value="Add New" onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.detail}}');" />
</div>
</form>

<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
                   <th class="topmenu" align="center" valign="middle" width="3%">Unique Id</th> 
                   <th class="topmenu" align="center" valign="middle" width="15%">Project </th> 
                   <th class="topmenu" align="center" valign="middle" width="7%">Total Value</th> 
                   <th class="topmenu" align="center" valign="middle" width="7%">Invoice</th>
                   <th class="topmenu" align="center" valign="middle" width="7%">Invoice Value</th>
                   <th class="topmenu" align="center" valign="middle" width="7%">Email First</th>
                   <th class="topmenu" align="center" valign="middle" width="7%">Email Second</th>
         		   <th class="topmenu" align="center" valign="middle" width="7%">Phone Call</th>
                   <th class="topmenu" align="center" valign="middle" width="7%">Last Contact Date</th>
                   <th class="topmenu" align="center" valign="middle" width="7%">Next Contact Date</th>
                   <th class="topmenu" align="center" valign="middle" width="10%">Status</th>
                   <th class="topmenu" align="center" valign="middle" width="5%">Notes</th>
                   <th class="topmenu" align="center" valign="middle" width="8%">Correspondence</th>
                   <th class="topmenu" align="center" valign="middle" width="8%">Supporting Document</th>
                   <th class="topmenu" align="center" valign="middle" width="8%">ACAT Document</th>
                   <th class="topmenu" align="center" valign="middle" width="8%">Action</th>   
            </tr>
        </thead>
    <tbody>

  {{assign var=countn value= $total}}
 {{foreach from=$list key="key" item="item"}}

    <tr bgcolor="#FFFFFF">


        <td>{{counter}}</td>
        <td>{{$item.dm_bsn_name}}</td> 
        <td><!--${{$item.dm_total_value|number_format:2:".":","}}-->
        {{$item.dm_total_value}}</td>
        
        <td>
        {{if $item.dm_invoice}}
        <a href="/debt_management_report.download_content?file_name={{$item.dm_invoice}}&module_name=debt_management_report.home
" target="_blank">Download</a>
       {{/if}}
        </td>
        
        <td>{{$item.dm_invoice_value}}</td>
       
       <td> 
        <form name ="recmet3" method="post" action="">
     	<input type="hidden" name="first_email[{{$item.dm_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="first_email[{{$item.dm_id}}]" value="1"  onclick="this.form.submit();" {{if $item.dm_first_email  eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form>  
      
       
        </td> 
        
        <td>
        <form name ="recmet4" method="post" action="">
     	<input type="hidden" name="second_email[{{$item.dm_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="second_email[{{$item.dm_id}}]" value="1"  onclick="this.form.submit();" {{if $item.dm_second_email  eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form>  

        </td>
        
        <td>
        
         <form name ="recmet5" method="post" action="">
     	<input type="hidden" name="phone_call[{{$item.dm_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="phone_call[{{$item.dm_id}}]" value="1"  onclick="this.form.submit();" {{if $item.dm_phone_call  eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form>  
        </td> 
        
        <td><input type="text" name="last[{{$item.dm_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo_{{$item.dm_id}}" value="{{$item.dm_last_contact_date }}" onfocus ="update_last_contact({{$item.dm_id}}, this.value);"  />
       
       <script>
	   
				
		function update_last_contact(id,value)
		{
			
			$.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}debt_management_report.update_last_contact/dm_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
					
		}
		
	  </script>
      </td>
      
        <td>
        <input type="text" name="next[{{$item.dm_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo2_{{$item.dm_id}}" value="{{$item.dm_next_contact_date}}" onfocus = "update_next_contact({{$item.dm_id}}, this.value);"  />
       
       <script>
	   
				
		function update_next_contact(id,value)
		{
			
			$.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}debt_management_report.update_next_contact/dm_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
					
		}
		
	  </script>
        
        </td>
        
        <td> <select name="{{$TABLE}}[dm_status]" Onchange = "update_status({{$item.dm_id}},this.value)">
             <option value="">Please Select </option>
             <option value="Contacted" {{if $item.dm_status eq 'Contacted'}} selected="selected" {{/if}}>Contacted</option>
             <option value="ACAT Form Lodged" {{if $item.dm_status eq 'ACAT Form Lodged'}} selected="selected" {{/if}}>ACAT Form Lodged</option>
             <option value="ACAT In Progress" {{if $item.dm_status eq 'ACAT In Progress'}} selected="selected" {{/if}}>ACAT In Progress</option>
             <option value="Resolved" {{if $item.dm_status eq 'Resolved'}} selected="selected" {{/if}}>Resolved</option>
             </select>
             <script>
	   
		function update_status(id,value)
		{
		
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}debt_management_report.update_status/dm_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	  </script> 
             
     </td>
     
     <td><a href="{{$BASE_URL}}debt_management_report.notes/dm_id/{{$item.dm_id}}" class="various">Notes</a></td> 
        
         <td>
        {{if $item.dm_corresspondace}}
        <a href="/debt_management_report.download_content?file_name={{$item.dm_corresspondace}}&module_name=debt_management_report.home
" target="_blank">Download</a>
       {{/if}}
        </td> 
        
         <td>
        {{if $item.dm_support_doc}}
        <a href="/debt_management_report.download_content?file_name={{$item.dm_support_doc}}&module_name=debt_management_report.home
" target="_blank">Download</a>
       {{/if}}
        </td> 
       
         <td>
        {{if $item.dm_acat_doc_link}}
        <a href="{{$item.dm_acat_doc_link}}" target="_blank">Link</a>
       {{/if}}
        </td> 
        
        <td> <a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" class="various" title="Edit"> 
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
             <a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete">
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>&nbsp;&nbsp
             
        </td>
        
        
    </tr>  
    {{assign var=countn value=$countn-1}}
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