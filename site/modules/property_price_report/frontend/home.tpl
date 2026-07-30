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
	var viewurl = "{{$BASE_URL}}property_price_report.view_procedure"+ "/random/" + Math.random();	

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
	var viewurl = "{{$BASE_URL}}property_price_report.add_type"+ "/random/" + Math.random();	

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
&nbsp; &nbsp;<input type="button" name="report_type" value="Report Type Admin" onclick="javascript:add_type();" /> 
<!--&nbsp; &nbsp; &nbsp; &nbsp;<strong> Filter By : </strong> 
      <select name="status"/>
        <option value="0">Show All</option>
        {{foreach from = $statusData key="key3" item="item3"}}
        <option value="{{$item3.st_id}}" {{if $item3.st_id eq $status}} selected="selected" {{/if}}>{{$item3.st_option}}</option>
        {{/foreach}}
        </select> 
        &nbsp; &nbsp;<input type="submit" value="Filter" name="filter" />   
        &nbsp;<input type="submit" name="clear" value = "Clear Filter" />-->    

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
                   <th class="topmenu" align="center" valign="middle" width="18%">Project Address </th> 
                   <th class="topmenu" align="center" valign="middle" width="8%">Customer Name </th> 
                   <th class="topmenu" align="center" valign="middle" width="12%">Report Type</th> 
                   <th class="topmenu" align="center" valign="middle" width="10%">Who</th>
                   <th class="topmenu" align="center" valign="middle" width="5%">Proposal Checklist</th>
                   <th class="topmenu" align="center" valign="middle" width="5%">LMP</th>
                   <th class="topmenu" align="center" valign="middle" width="5%">Building File</th>
                   <th class="topmenu" align="center" valign="middle" width="7%">CMA Data</th>
                   <th class="topmenu" align="center" valign="middle" width="7%">REPORT FINNSIHED</th>
                   <th class="topmenu" align="center" valign="middle" width="7%">Property Report</th>
         		   <th class="topmenu" align="center" valign="middle" width="5%">Upload to checklist </th>
                   <th class="topmenu" align="center" valign="middle" width="6%">Action</th>   
            </tr>
        </thead>
    <tbody>

  {{assign var=countn value= $total}}
 {{foreach from=$list key="key" item="item"}}

    <tr bgcolor="#FFFFFF">


        <td>{{$item.pp_id}}</td>
        <td><a href="{{$item.link}}" target="_blank">{{$item.pp_project}}</a></td>
        <td>{{$item.customer}}</td>
        <td>
        <form name ="recmet2" method="post" action="">
          <select name="typedata[{{$item.pp_id}}]" onChange="update_type({{$item.pp_id}}, this.value)"/>
        			
                <option value="0" {{if $item.pp_report_type eq 0}} selected="selected" {{/if}}>Please Select </option>
                {{foreach from = $typedetail key="key2" item="item2"}}
                <option value="{{$item2.rt_id}}" {{if $item2.rt_id eq $item.pp_report_type}} selected="selected" {{/if}}>{{$item2.rt_option}}</option>
                {{/foreach}}
                     
          </select>
        </form>
          
          <script>
			function update_type(id,value)
			{
					 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}property_price_report.update_type/pp_id/"+id+"/value/"+value,
						   success: function(result){
							
						}
						
					});
			}
	    </script>
           
        </td>  
 
       
        <td>{{$item.pp_who}}</td>
        <td>
        {{foreach from=$item.checklist key="key1" item="item1"}}
             {{$item1.dpn_unique_id}}<br />
        {{/foreach}}
        </td>
        <td>
        {{if $item.doc_file_name_20}}
                 <a href="/property_price_report.download_content?file_name={{$item.doc_file_name_20}}&module_name=property_price_report.home" >Download</a> 
        {{/if}}                 
        </td>  
        
        <td>
        {{if $item.doc_file_name_64}}
                 <a href="/property_price_report.download_content?file_name={{$item.doc_file_name_64}}&module_name=property_price_report.home" >Download</a> 
        {{/if}}                 
        </td> 
        
       <td> {{if $item.pp_cma_data}}<a href="{{$item.pp_cma_data}}" target="_blank">Link</a> {{/if}}
               
                      
        </td> 
        
        <td> <form name ="recmet3" method="post" action="">
     	<input type="hidden" name="repo_finished[{{$item.pp_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="repo_finished[{{$item.pp_id}}]" value="1"  onclick="this.form.submit();" {{if $item.pp_report_finished eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form>  
       {{if $item.pp_report_finished eq 1}} {{$item.pp_report_finish_date}}<br />{{$item.pp_report_finish_user}} {{/if}}
       </td>

        
        <td> {{if $item.pp_property_report}}<a href="{{$item.pp_property_report}}" target="_blank">Link</a> {{/if}}
        
        <td>
        <form name ="recmet4" method="post" action="">
     	<input type="hidden" name="upload_checklist[{{$item.pp_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="upload_checklist[{{$item.pp_id}}]" value="1"  onclick="this.form.submit();" {{if $item.pp_upload_checklist eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form>  
      {{if $item.pp_upload_checklist eq 1 }} {{$item.pp_up_chk_date}}<br />{{$item.pp_up_chk_user}} {{/if}}  
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