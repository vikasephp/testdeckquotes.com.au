<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
{{include file=$jdata}}
{{include file=$tiny_basic}}		

<script>
		!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
	</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />

<h3 class="page-title">New Report Table</h3>
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
	var viewurl = "{{$BASE_URL}}da_builder.view_procedure"+ "/random/" + Math.random();	

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

function add_proj_detail(id)
{
	var viewurl = "{{$BASE_URL}}da_builder.add_project_detail"+ "/rt_id/" + id;	

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
<div style="float:left; text-align:left;">
&nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> 
<input type="button" name="Add New" value="Add New Report" onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.detail}}');" /><br />
&nbsp;&nbsp; <strong>Search : </strong>
<input type="text" name="keyword" value="{{$keyword}}" style="width:400px;" placeholder="Search for Address"/>
<input type="submit" value="Search" name="search"  />
<input type="submit" value="Clear Search" name="clear"  />
</div>

<input type="submit" name="sort_by_projects" value="Sort by Projects" />
<input type="submit" name="sort_by_designer" value="Sort by Designer" />
<input type="submit" name="reset" value="Clear Sort" />
</form>

<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
                   <th class="topmenu" align="center" valign="middle" width="3%">Report Id</th>  
                   <th class="topmenu" align="center" valign="middle" width="20%">Project Address</th> 
                   <th class="topmenu" align="center" valign="middle" width="5%">Project Detail</th> 
                   <th class="topmenu" align="center" valign="middle" width="12%">Report Type</th> 
                   <th class="topmenu" align="center" valign="middle" width="5%">Report Link</th> 
                   <th class="topmenu" align="center" valign="middle" width="7%">Last Change</th>
                   <th class="topmenu" align="center" valign="middle" width="7%">Last Modified By</th>
                   <th class="topmenu" align="center" valign="middle" width="8%">Customer Designer</th>
                   <th class="topmenu" align="center" valign="middle" width="5%">Status</th>
                   <th class="topmenu" align="center" valign="middle" width="5%">Print</th>
                   <th class="topmenu" align="center" valign="middle" width="15%">Notes</th>
                   <th class="topmenu" align="center" valign="middle" width="5%">Action</th>   
            </tr>
        </thead>
    <tbody>

  {{assign var=countn value= $total}}
  {{foreach from=$list key="key" item="item"}}

    <tr bgcolor="#FFFFFF">

        <td>{{$item.rt_id}}</td>
        <td>{{$item.rt_project_address}}</td> 
        <td><input type="button" name="build" value="Add Project Detail" onclick="javascript:add_proj_detail({{$item.rt_id}});" /> </td> 
        <td>{{$item.report_type}}</td> 
        <td><a href="{{$BASE_URL}}da_builder.new_report/rt_id/{{$item.rt_id}}" target="_blank">Link</a></td>
        <td>{{$item.rt_last_change}}</td>
        <td>{{$item.rt_modified_by}}</td>
        <td>{{$item.rt_cust_designer}}</td>
        <td>{{$item.rt_status}}</td>
        <td><a href="{{$BASE_URL}}{{$XFA.home}}/word/{{$item.rt_bsn_id}}/rt_id/{{$item.rt_id}}" title="Generate Word Report"> 
             <img  src="{{$BASE_URL}}css/admin/images/word.png"/></a></td>
        
        <td>{{$item.rt_notes}}</td>
       
        
        
        <td> <a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" class="various" title="Edit"> 
        <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
        <a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete">
        <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>&nbsp;&nbsp
       <!-- <a href="{{$BASE_URL}}da_builder.sync/rt_id/{{$item.rt_id}}/bsn_id/{{$item.rt_bsn_id}}"  title="Synchronize Report Admin Options">Sync</a>-->
             
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