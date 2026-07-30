<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/jquery-1.7.2.js"></script>
<script> 
	!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
<script type="text/javascript" >  
	$(document).ready(function() {
		$(".various").fancybox({
			'width': '90%',
			'height': '90%',
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
		
		
		$(".view").fancybox({
			'autoScale': true,
			 'transitionIn' : 'elastic',
			 'transitionOut' : 'elastic',
			 'speedIn' : 300,
			 'speedOut' : 300,
			 'overlayShow' : true,
			 'hideOnOverlayClick':false,
			 'hideOnContentClick':false,
			 'scrolling': 'yes' 
		});			
	});
	$(document).ready(function() {
		$(".fancybox").fancybox();
	});
	
function add_new(URL)
 {
var viewurl = URL+ "/random/" + Math.random();	
 $(document).ready(function () {
	$.fancybox({
			'width': '90%',
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
	var viewurl = "{{$BASE_URL}}{{$BASEFOLDER}}.view_procedure"+ "/random/" + Math.random();	

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
	window.location.href = window.location.href;
	}
</script>

<style>
	#fancybox-inner{
		 overflow:scroll;
		-webkit-overflow-scrolling: touch;
	}
	#TheFancybox {
		overflow:auto;
		-webkit-overflow-scrolling:touch;
		width: 100%;
		height: 100%;  
	}
	#fancybox-content {
		overflow:auto;
		-webkit-overflow-scrolling:touch;
		width: 100%;
		height: 100%; 
	}
	#fancybox-wrap {
		z-index:9999999;
	} 
	#list-table tr td {
		color: #000;
	}
</style>

<h3 class="page-title">{{$title}}</h3>

<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">

 <div style="float:left; text-align:left;">
&nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /><br />    
 </div>

<div style="float:right;">
    <input type="button" name="Add New " value="Add New" onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.detail}}');" />
 </div>
</form>


<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
                <th class="topmenu" align="center" valign="middle" width="5%">Record No.</th>   
                <th class="topmenu" align="center" valign="middle" width="8%">Enquiry Date</th> 
                <th class="topmenu" align="center" valign="middle" width="8%">Source</th>
				<th class="topmenu" align="center" valign="middle" width="10%">Customer Email</th>
                <th class="topmenu" align="center" valign="middle" width="10%">Customer</th>
				<th class="topmenu" align="center" valign="middle" width="20%">Project Address</th>
				<th class="topmenu" align="center" valign="middle" width="10%">Phone Number</th>
				<th class="topmenu" align="center" valign="middle" width="5%">Block Size(m²)</th>
                <th class="topmenu" align="center" valign="middle" width="8%">Zoning</th> 
				<th class="topmenu" align="center" valign="middle" width="5%">Portal Created</th>
				<th class="topmenu" align="center" valign="middle" width="8%">Subdivision Report Created</th>
				<th class="topmenu" align="center" valign="middle" width="5%">Action</th>
            </tr>
        </thead>
<tbody>
 {{foreach from=$list key="key" item="item"}}
  
 	 <tr bgcolor='{{cycle values="#D3E8D6,WHITE" advance=true}}'>
		<td>ENQ-{{$item.$ID}}</td>    
		<td>{{$item.dolr_enquiry_date|date_format:"%d-%m-%Y"}}</td>
		<td>
			{{$item.dolr_source}}
			{{if $item.dolr_source eq 'Website' and !empty($item.dolr_webpage)}}{{$item.dolr_webpage}}{{/if}}
		</td>
		<td>{{$item.dolr_customer_email}}</td>
		<td>{{$item.dolr_customer_name}}</td>
		<td>{{$item.dolr_project_address}}</td>
		<td>{{$item.dolr_phone_number}}</td>
		<td>{{$item.dolr_block_size}}</td>
		<td>{{$item.dolr_zoning}}</td>
		<td>TBD</td>
		<td>TBD</td>
		<td style="color:#000;">
			<a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" class="various" title="Edit">
			<img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
			<a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete">
			<img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>
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
</form>