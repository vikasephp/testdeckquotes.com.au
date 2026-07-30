
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
	var viewurl = "{{$BASE_URL}}camera_report.view_procedure"+ "/random/" + Math.random();	

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
<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> <br />

<span>
<form name="s1" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
<input type="text" name="keyword" style="width:400px;" placeholder="Search for Site Address" />
<input type="submit" name="search3" value = "Search" /> 
</form>
 </span>           
</div>

<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
<div style="float:right;"> 
<input type="button" name="Add New " value="Add New" onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.detail}}');" />
</div>
</form>

<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
                   <th class="topmenu" align="center" valign="middle" width="3%">SrNo.</th>  
                   <th class="topmenu" align="center" valign="middle" width="15%">Site Address</th> 
                   <th class="topmenu" align="center" valign="middle" width="12%">Employee Name</th> 
                   <th class="topmenu" align="center" valign="middle" width="5%">Camera Label Number</th> 
                   <th class="topmenu" align="center" valign="middle" width="12%">Last Update Date and Time</th>
                   <th class="topmenu" align="center" valign="middle" width="15%">Status</th>
               
           	  <!-- <th class="topmenu" align="center" valign="middle" width="8%">On Site But Not Updating</th> -->
                   <th class="topmenu" align="center" valign="middle" width="5%">Action</th>   
            </tr>
        </thead>
    <tbody>

 {{foreach from=$list key="key" item="item"}}

    <tr style="text-align:center;" id="row{{$item.cr_id}}" {{if $item.cr_status eq 'On Site - not updating for more than 12 hrs'}} bgcolor="#ee8a20" 
    {{elseif $item.cr_status eq 'On Site - not updating for more than 24 hrs'}} bgcolor="#F00" {{else}} bgcolor="#FFF" {{/if}} >

        <td>{{counter}}</td>
        <td>{{$item.cr_site_address}}</td> 
        <td>{{$item.cr_empl_name}}</td> 
        <td>{{$item.cr_camera_label_num}}</td>
        <td>{{$item.cr_last_update}}</td>
        <td>
        <select name="{{$TABLE}}[cr_status]"  Onchange = "update_status({{$item.cr_id}},this.value)">
                <option value="">Please Select </option>
                <option value="On Site"  {{if $item.cr_status eq 'On Site'}} selected="selected" {{/if}}>On Site</option>
                <option value="Returned" {{if $item.cr_status eq 'Returned'}} selected="selected" {{/if}}>Returned</option>
                <option value="Damaged"  {{if $item.cr_status eq 'Damaged'}} selected="selected" {{/if}}>Damaged</option>
                <option value="On Site - not updating for more than 12 hrs" {{if $item.cr_status eq 'On Site - not updating for more than 12 hrs'}} selected="selected" {{/if}}>On Site - not updating for more than 12 hrs</option>
                <option value="On Site - not updating for more than 24 hrs" {{if $item.cr_status eq 'On Site - not updating for more than 24 hrs'}} selected="selected" {{/if}}>On Site - not updating for more than 24 hrs</option>
         </select>
        
         <script>
		function update_status(id,value)
		{
			 var row = '#row'+id;
			 
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}camera_report.update_status/cr_id/"+id+"/value/"+value,
					   success: function(result){
					   
					   if(value == 'On Site - not updating for more than 12 hrs' ) {
							$(row).css("background","#ee8a20");
					   } else if(value == 'On Site - not updating for more than 24 hrs' ) {
							$(row).css("background","#F00"); 
					   } else  {
					                $(row).css("background","#FFF"); 
					   }	 
					}
					
				});
		}
	</script>
        
        
        </td>
        
        <!--<td  > 
         <form name ="recmet2" method="post" action="">
     	<input type="hidden" name="action[{{$item.cr_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="action[{{$item.cr_id}}]" value="1"  onclick="this.form.submit();" {{if $item.cr_on_site eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form>  
        
        </td>-->
        
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