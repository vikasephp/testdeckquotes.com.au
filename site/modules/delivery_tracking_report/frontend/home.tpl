
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
	width:61px !important;
	padding-top:1px !important;
	padding-bottom:1px !important;
	margin-bottom:10px !important;	
}
.dt {border:1px solid #CCC; padding:8px; margin-top:15px !important; }

.set { font-size:10px !important; 
       width:25px !important; display:inline-block; 
	   padding-top:1px !important;
	   padding-bottom: 1px !important;
	   padding-left:1px !important;
	   height:25px !important; }
.btn2 {background:#ee1010 !important}	   	
.legend { list-style: none; font-weight:bold; margin-bottom:40px; }
.legend li { float: left; margin-right: 15px; font-size:14px; }
.legend span { border: 1px solid #ccc; float: left; width: 12px; height: 12px; margin: 2px; }
/* your colors */
.legend .tobeactioned { background-color: #fff; }
.legend .complete { background-color: green; }
.legend .requirefollowup { background-color: orange; }
.legend .notapplicable { background-color: grey; }
.legend .alert { background-color: red; }
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
</script>


<div style="float:left; margin-left:3px; text-align:left;">

<form name="s1" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
Project : <input type="text" name="search_project" style="width:300px;" />
<input type="submit" name="search1" value = "Search" /> 
</form>
<ul class="legend">
    <li><span class="tobeactioned"></span> To Be Actioned</li>
    <li><span class="complete"></span> Complete</li>
    <li><span class="requirefollowup"></span> Require Follow Up</li>
    <li><span class="notapplicable"></span> Not Applicable</li>
    <li><span class="alert"></span>Alert</li>
</ul>
 </span>           
</div>

<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
<div style="float:right;"> 

<input type="button" name="Add New " value="Add New" onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.detail}}');" />
</div>
</form>
 <form name = "ons" method="post" action="">
 <input type="submit" name="saveall" value = "Save All Dates" class="btn2" />
<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
                   <th class="topmenu" align="center" valign="middle" width="3%">Rec. No.</th>  
                   <th class="topmenu" align="center" valign="middle" width="15%">Project</th> 
                   <th class="topmenu" align="center" valign="middle" width="6%">Windows & Doors</th> 
                   <th class="topmenu" align="center" valign="middle" width="6%">Wall & Roof Frames</th> 
                   <th class="topmenu" align="center" valign="middle" width="6%">Floor System</th>
                   <th class="topmenu" align="center" valign="middle" width="6%">Bricks</th>
            	   <th class="topmenu" align="center" valign="middle" width="6%">Brick Accessories</th>
                   <th class="topmenu" align="center" valign="middle" width="6%">Close Up</th> 
                   <th class="topmenu" align="center" valign="middle" width="6%">Project Inclusions</th> 
                   <th class="topmenu" align="center" valign="middle" width="6%">Project Addition</th> 
                   <th class="topmenu" align="center" valign="middle" width="6%">Garage Door</th> 
                   <th class="topmenu" align="center" valign="middle" width="6%">Interior Fit Out</th>
                   <th class="topmenu" align="center" valign="middle" width="6%">Wall and Floor Tiles</th>
                   <th class="topmenu" align="center" valign="middle" width="6%">Water Tank</th> 
                   <th class="topmenu" align="center" valign="middle" width="6%">Window Coverings</th> 
                   <th class="topmenu" align="center" valign="middle" width="6%">Floor Coverings</th> 
                   
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
    

        <td>{{$item.dtr_id}}</td>
        <td>{{$item.dtr_project_name|stripslashes}}</td> 
        
        
        <td style="background:{{$color[$item.dtr_windows_doors_opt]}}">
         <input type="text" name="delivery[dtr_windows_doors_date][{{$item.dtr_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo1_{{$item.dtr_id}}" value="{{$item.dtr_windows_doors_date}}"  /> 
        </td> 
        <td style="background:{{$color[$item.dtr_wall_roof_frame_opt]}}">
        <input type="text" name="delivery[dtr_wall_roof_frame_date][{{$item.dtr_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo2_{{$item.dtr_id}}" value="{{$item.dtr_wall_roof_frame_date}}"  /> 
        </td>
        <td style="background:{{$color[$item.dtr_floor_system_opt]}}">
        <input type="text" name="delivery[dtr_floor_system_date][{{$item.dtr_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo3_{{$item.dtr_id}}" value="{{$item.dtr_floor_system_date}}"  /> 
        </td>
        <td style="background:{{$color[$item.dtr_bricks_opt]}}">
        <input type="text" name="delivery[dtr_bricks_date][{{$item.dtr_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo4_{{$item.dtr_id}}" value="{{$item.dtr_bricks_date}}"  /> 
        </td>
        <td style="background:{{$color[$item.dtr_bricks_acc_opt]}}">
        <input type="text" name="delivery[dtr_bricks_acc_date][{{$item.dtr_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo5_{{$item.dtr_id}}" value="{{$item.dtr_bricks_acc_date}}"  /> 
         </td>
         
         <td style="background:{{$color[$item.dtr_close_up_opt]}}">
         <input type="text" name="delivery[dtr_close_up_date][{{$item.dtr_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo6_{{$item.dtr_id}}" value="{{$item.dtr_close_up_date}}"  /> 
        </td>
        <td style="background:{{$color[$item.dtr_proj_incl_opt]}}">
         <input type="text" name="delivery[dtr_proj_incl_date][{{$item.dtr_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo7_{{$item.dtr_id}}" value="{{$item.dtr_proj_incl_date}}"  /> 
      </td>
        <td style="background:{{$color[$item.dtr_proj_add_opt]}}">
     <input type="text" name="delivery[dtr_proj_add_date][{{$item.dtr_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo8_{{$item.dtr_id}}" value="{{$item.dtr_proj_add_date}}"  /> 
         </td>
        <td style="background:{{$color[$item.dtr_garage_door_opt]}}">
         <input type="text" name="delivery[dtr_garage_door_date][{{$item.dtr_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo9_{{$item.dtr_id}}" value="{{$item.dtr_garage_door_date}}"  /> 
        </td>
        <td style="background:{{$color[$item.dtr_interior_fit_opt]}}">
        <input type="text" name="delivery[dtr_interior_fit_date][{{$item.dtr_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo10_{{$item.dtr_id}}" value="{{$item.dtr_interior_fit_date}}"  /> 
        </td>
        <td style="background:{{$color[$item.dtr_wall_floor_tile_opt]}}">
        <input type="text" name="delivery[dtr_wall_floor_tile_date][{{$item.dtr_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo11_{{$item.dtr_id}}" value="{{$item.dtr_wall_floor_tile_date}}"  /> 
        </td>
         
        <td style="background:{{$color[$item.dtr_water_tank_opt]}}">
        <input type="text" name="delivery[dtr_water_tank_date][{{$item.dtr_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo12_{{$item.dtr_id}}" value="{{$item.dtr_water_tank_date}}"  /> 
        </td>
        <td style="background:{{$color[$item.dtr_window_cov_opt]}}">
        <input type="text" name="delivery[dtr_window_cov_date][{{$item.dtr_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo13_{{$item.dtr_id}}" value="{{$item.dtr_window_cov_date}}"  /> 
        </td>
        <td style="background:{{$color[$item.dtr_floor_cov_opt]}}">
        <input type="text" name="delivery[dtr_floor_cov_date][{{$item.dtr_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo14_{{$item.dtr_id}}" value="{{$item.dtr_floor_cov_date}}"  /> 
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
   </form> 
    
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