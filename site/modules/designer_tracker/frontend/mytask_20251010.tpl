<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

<script>
	!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
<script type="text/javascript" >  
		$(document).ready(function() {
			
			//*   Examples - images
			
			$(".various").fancybox({
				'width': '95%',
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
		
		});


function view_task(id)
{
	var viewurl = "{{$BASE_URL}}designer_tracker.view_task"+ "/dt_id/" + id;	
	
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


function add_new()
 {
var viewurl = "{{$BASE_URL}}designer_tracker.new_task"+ "/random/" + Math.random();	



 $(document).ready(function () {
        $.fancybox({
				'width': '95%',
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



function close_win()
	{
	$.fancybox.close();
	window.location.reload();
	}
</script>




<style>

body{style="border:1px solid #F00;"}
 
.tooltip:hover .tooltiptext {
    visibility: visible;
}

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
	   
	   
.wrapper1, .wrapper2{width: 1400px; border: none 0px RED;
overflow-x: scroll; overflow-y:hidden; scrollbar-color: yellow blue;}
.wrapper1{height: 20px; }
.wrapper2{ }
.div1 {width:1610px; height: 20px; }
.div2 {width:1610px;  overflow: auto;}   

.tableFixHead          { overflow-y: auto; height: 700px; }
.tableFixHead thead th { position: sticky; top: 0; text-align:left; }

table  { border-collapse: collapse; width: 100%; }
th     { z-index:9999; }
   
</style>

<script type="text/javascript">
$(function(){
    $(".wrapper1").scroll(function(){
        $(".wrapper2")
            .scrollLeft($(".wrapper1").scrollLeft());
    });
    $(".wrapper2").scroll(function(){
        $(".wrapper1")
            .scrollLeft($(".wrapper2").scrollLeft());
    });
});
</script>

<h3 class="page-title">My Tasks</h3>
<br />

<form name="sort" method="post" action="">
<div style="float:left; text-align:left;">
<span>&nbsp;&nbsp;&nbsp;<strong>Search:</strong>&nbsp;&nbsp;</span>
<input type="text" name="{{$TABLE}}[keyword]" value="{{$keyword}}" style="width:400px;" placeholder="Search
 for Task Description, Or Assigner Or Task Type"/>
&nbsp; 
<input type="submit" value="Search" name="search"  /><br />

&nbsp;&nbsp;<strong>Search By Checklist No:   </strong>&nbsp;&nbsp;
<input type="text" name="{{$TABLE}}[keyword2]" value="{{$keyword2}}" style="width:400px;" placeholder="Enter Checklist Number"/>
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" value="Search" name="searchchk"  /> <br />

&nbsp;&nbsp;<strong>Search By Project Name:</strong>&nbsp;&nbsp;
<input type="text" name="{{$TABLE}}[keyword3]" value="{{$keyword3}}" style="width:400px;" placeholder="Enter project name after dash(-)"/>
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" value="Search" name="searchproj"  /> 
&nbsp;&nbsp;&nbsp;&nbsp;<strong>Sort By</strong>
 <select name="sortoption" />
             
                 <option value="1" {{if  $ord == '1'}}selected{{/if}}>Assigner</option>
                 <option value="2" {{if  $ord == '2'}}selected{{/if}}>Checklist #</option>
                 <option value="3" {{if  $ord == '3'}}selected{{/if}}>Due Date</option>
                 <option value="4" {{if  $ord == '4'}}selected{{/if}}>Task Type</option>
 </select> 
 &nbsp; 
<input type="submit" value="Sort" name="sort"  /> 
&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; <strong>Hide Complete</strong> <input type="checkbox" name="hidecomplete"   onchange="this.form.submit();" {{if $val eq 1 }} checked="checked" {{/if}} />
<br />

</div>
</form>

<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
<div style="float:right;"> <input type="button" name="Add New" value="Add New Task" onclick="javascript:add_new();" /> </div>


</form>
<form name="mlist" method="post">
    
  <div>
    <div>  
    
  <table id="doclist-table" class="nav-back" width="100%">
    <thead>
      <tr>
        
		<th class="topmenu" align="center" valign="middle" width="3%">Task ID</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Checklist Id</th>
        <th class="topmenu" align="center" valign="middle" width="15%">Project Name</th>
        <th class="topmenu" align="center" valign="middle" width="15%">Task Description</th>
	<th class="topmenu" align="center" valign="middle" width="10%">Assignee</th>
   	<th class="topmenu" align="center" valign="middle" width="10%">Assigner</th>
    	<th class="topmenu" align="center" valign="middle" width="4%">Submitted Date</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Due Date</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Priority</th>
        <th class="topmenu" align="center" valign="middle" width="6%">Status</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Task Type</th>
        <th class="topmenu" align="center" valign="middle" width="6%">View / Add Comments</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Action</th>  
        
      </tr>
    </thead>
    {{if $list}}
    <tbody>
    
      <!--{{assign var=countn value= $numstartvounter}}-->
       {{assign var=countn value= $total}}
      
      {{foreach from=$list key="key" item="item"}}
      
    
      <tr {{if $item.bsn_per_complete ge 90}} bgcolor="#66FF66" {{else}} bgcolor='{{cycle values="#D3E8D6,WHITE" advance=true}}' {{/if}}>
       
		<td>{{$item.tdt_id}}</td>
		<td>{{$item.dt_checklist_no}}</td>
         <td>{{$item.dt_project_name}}</td>
         <td>{{$item.tdt_task_desc}}</td>
         <td>{{$item.tdt_task_assignee}}</td>
         <td>{{$item.tdt_task_assigner}}</td>
         <td>{{$item.tdt_submitted_date}}</td>
         <td>{{$item.tdt_due_date}}</td>
         <td>
           <select name="{{$TABLE}}[dt_priority]"  Onchange = "update_priority({{$item.tdt_id}},this.value)">
                <option value="-1" {{if $item.tdt_priority eq -1}} selected="selected" {{/if}}>Please Select </option>
                {{foreach from = $prdetail key="key4" item="item4"}}
                <option value="{{$item4.pr_id}}" {{if $item4.pr_id eq $item.tdt_priority}} selected="selected" {{/if}}>{{$item4.pr_priority}}</option>
                {{/foreach}}
        </select>
     
       <script>
	   
		function update_priority(id,value)
		{
			
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}designer_tracker.update_task_priority/dt_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	</script>
         
         </td>
         <td>
         
    		<select name="task[tdt_status]" Onchange = "update_status({{$item.tdt_id}},this.value)" />
                 <option value="OPEN"   {{if  $item.tdt_status == 'OPEN'}}selected{{/if}}>OPEN</option>
                 <option value="IN PROGRESS"   {{if  $item.tdt_status == 'IN PROGRESS'}}selected{{/if}}>IN PROGRESS</option>
                 <option value="AWAITING" {{if  $item.tdt_status == 'AWAITING'}}selected{{/if}}>AWAITING</option>
                 <option value="FEEDBACK" {{if  $item.tdt_status == 'FEEDBACK'}}selected{{/if}}>FEEDBACK</option>
                 <option value="COMPLETE" {{if  $item.tdt_status == 'COMPLETE'}}selected{{/if}}>COMPLETE</option>
        </select>  
        
         <script>
	   
		function update_status(id,value)
		{
			
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}designer_tracker.update_mytask_status/dt_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	</script>
        
    </td>
         </td>
         <td>{{$item.tdt_task_type}}</td>
        
       <td>
        <a href="{{$BASE_URL}}designer_tracker.view_comment/tc_task_id/{{$item.tdt_id}}/tdt_dt_id/{{$item.tdt_dt_id}}" class="various" title="View" >View</a>
       </td>
      
          
        <td> <a href="{{$BASE_URL}}designer_tracker.new_task/tdt_id/{{$item.tdt_id}}" class="various" title="Edit"> 
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
             <!--<a href="{{$BASE_URL}}designer_tracker.delete_task/tdt_id/{{$item.tdt_id}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete">
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>&nbsp;&nbsp-->
        </td>
      
      </tr>
     
      
      {{assign var=countn value=$countn-1}}
      {{/foreach}}
      </tbody>
      
  
    {{/if}}
  </table>
    </form>

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
  {{/if}} 

</div>
</div>

{{if $notask }} <div style="margin-top:20px; font-size:20px;">{{$notask}}</div> {{/if}}