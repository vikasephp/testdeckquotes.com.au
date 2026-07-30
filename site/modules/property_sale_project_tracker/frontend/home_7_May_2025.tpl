<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
{{include file=$jdata}}
{{include file=$tiny_basic}}		

<script>
		!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
	</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
<!--<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>-->

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

<h3 class="page-title">{{$title}}</h3>

  <script type="text/javascript">
    function toggleDiv(divId) {
       $("#"+divId).toggle();
    }
  </script>

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
	var viewurl = "{{$BASE_URL}}property_sale_project_tracker.view_procedure"+ "/random/" + Math.random();	

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


function add_stage()
{
	var viewurl = "{{$BASE_URL}}property_sale_project_tracker.view_stage"+ "/random/" + Math.random();	

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
&nbsp;&nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> 
&nbsp; &nbsp;<input type="button" name="component" value="Stage Admin" onclick="javascript:add_stage();" /> <br />
&nbsp; &nbsp;<input type="text" name="address"  style="width:350px;" placeholder="Search for Address"/>
<input type="submit" value="Search" name="search"  /> &nbsp;<br />
&nbsp; &nbsp;<input type="text" name="position"  style="width:350px;" placeholder="Search for Filter"/>
<input type="submit" value="Search" name="search"  /> &nbsp; 
<input type="submit" name="clear" value = "Clear Search" /><br />
&nbsp; &nbsp;
<input type="Submit" name="project_view" value="Project View" /> &nbsp; &nbsp;
<input type="submit" name="task_table" value="Task Table"  /> 

</div>

<div style="float:right; margin-right:20px;"> 
<input type="button" name="Add New " value="Add New" onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.detail}}');" />
</div>
</form>

<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
         
                   <th class="topmenu" align="center" valign="middle" width="3%">SrNo</th> 
                   <th class="topmenu" align="center" valign="middle" width="25%">Project (Property Address)</th> 
                   <th class="topmenu" align="center" valign="middle" width="25%">Stage</th> 
                 <!--  <th class="topmenu" align="center" valign="middle" width="5%">% Complete</th>-->
                   <th class="topmenu" align="center" valign="middle" width="6%">Porject Hide</th> 
                   <th class="topmenu" align="center" valign="middle" width="5%">Action</th>   
            </tr>
        </thead>
    <tbody>

  {{assign var=countn value= $total}}
 {{foreach from=$list key="key" item="item"}}

    <tr bgcolor="#FFFFFF">


        <td>{{$item.ps_id}}</td>
        <td><a href="{{$item.link}}" target="_blank">{{$item.ps_project}}</a></td>
     
     <td  id="chk_{{$item.ps_id}}">
       <form name="cu" method="post" action="">
       <a href="javascript:appendRowLink({{$item.ps_id}})"  value="Add New Link" title="Add Link">
       <img style="margin-top:5px;" src="{{$BASE_URL}}css/admin/images/addnew.png"/></a>
        <p id="myElem" style="display:none; color:#F00; font-style:italic; margin:5px;">First save the link name and link .... </p>    
	   
        <script type="text/javascript">
		var x=0;
		function appendRowLink(id)
		{
		 x=x+1;
		 var sid = "#chk_" +id;
		 var e = "#em";
		 v = $("#em").val();
		
		 if( v !== "")
		 {
			 row = '<form name="cu" method="post" action="">';
			 row =  row + '<br><input type="hidden" name="ps_id"  value='+id+'>';
	         row =  row + '<select name="stage">';
        			
             row =  row + '<option value="0" >Please Select </option>';
             row =  row + '{{foreach from = $stagedetail key="key2" item="item2"}}';
             row =  row + '<option value="{{$item2.st_id}}" >{{$item2.st_option}}</option>';
             row =  row + '{{/foreach}}';
                     
             row =  row + '</select>';
         
			 row =  row + '<input type="submit" value="Save" name="save_link" size="50"  />';
			 row =  row + '</form>';
			 $(sid).append(row);
		 }
		 else {
			$("#myElem").show();
			setTimeout(function() { $("#myElem").hide(); }, 2000); 
		 }
		}
		</script>  
        <br />
      <table id="list-table"  width="100%"> 
       
      {{foreach from=$item.stage key="key2" item="item2"}}
      <tr>
      <td style="width:40%">{{$item2.st_option}}</td>
      <td><a href="{{$BASE_URL}}property_sale_project_tracker.notes" class="various">Update Task</a></td>
      
      <td>% Completed</td>
      <td> <a href="{{$BASE_URL}}property_sale_project_tracker.delete_stage/sd_id/{{$item2.sd_id}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img src="{{$BASE_URL}}/images/delete_icon.png" width="20" /></a></td>
      </tr>
      {{/foreach}}
      </table> 
       </td>
        
          
        
       <!-- <td>m1</td>-->
        
        <td>m2</td>
        
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