<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

<script>
	!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
<script type="text/javascript" >  
		$(document).ready(function() {
			/*
			*   Examples - images
			*/
			$(".various").fancybox({
				'width': '75%',
				'height': '75%',
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
				'height': '82%',
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
	var viewurl = "{{$BASE_URL}}designer_tracker.view_procedure"+ "/random/" + Math.random();	

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
	var viewurl = "{{$BASE_URL}}designer_tracker.viewpriority"+ "/random/" + Math.random();	

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


function add_new(url)
 {
//var viewurl = "{{$BASE_URL}}designer_tracker.detail"+ "/random/" + Math.random();	
  var viewurl = url;


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
 #fancybox-wrap {z-index:9999999;}   
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

<h3 class="page-title">Design Tracker</h3>
<br />

<form name="sort" method="post" action="">

<div style="float:left; text-align:left;">
&nbsp;&nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> <br />

&nbsp;&nbsp;<strong>Search:</strong>&nbsp;&nbsp;
<input type="text" name="{{$TABLE}}[keyword]" value="{{$keyword}}" style="width:300px;" placeholder="Search for Checklist No. Or Customer Designer Or Assignee "/>
&nbsp;
<input type="submit" value="Search" name="search"  /><br />

&nbsp;&nbsp;<strong>Search By Project Name :</strong>&nbsp;&nbsp;
<input type="text" name="{{$TABLE}}[keyword2]" value="{{$keyword2}}" style="width:300px;" placeholder="Enter project name after dash(-)"/>
&nbsp;
<input type="submit" value="Search" name="searchproj"  />
<input type="submit" value="Clear Search" name="clear"  />
<input type="submit" value="Insert Renovation Checklists" name="updaterenovation"  />

</div>

</form>


<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
<div style="float:right;"> 
<input type="button" name="priority" value="Edit Priority" onclick="javascript:add_priority();" /> 
<input type="button" name="Add Person" value="Add Person" onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.design_team}}');" />
<input type="button" name="Edit Team" value="Edit Team" onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.edit_team}}');" />
<input type="button" name="Add Project" value="Add Project" onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.detail}}');" /> <br />
<input type="submit" value="Show Current Projects" name="current"  />
<input type="submit" value="Show Complete Only" name="complete"  />
<input type="submit" value="Show All Project" name="showall"  />
</div>
</form>
<form name="mlist" method="post">

<!--<div class="wrapper1">
    <div class="div1">
    </div>
</div>-->

<!--<div class="wrapper2">
    <div class="div2 tableFixHead">-->
    
  <div>
    <div>  
    
  <table id="doclist-table" class="nav-back" width="100%">
    <thead>
      <tr>
        
    
        <th class="topmenu" align="center" valign="middle" width="4%">Checklist Id</th>
        <th class="topmenu" align="center" valign="middle" width="20%">Project Name</th>
         <th class="topmenu" align="center" valign="middle" width="4%">View</th>
	<th class="topmenu" align="center" valign="middle" width="12%">Client Name</th>
   	<th class="topmenu" align="center" valign="middle" width="4%">Date Submitted</th>
    	<th class="topmenu" align="center" valign="middle" width="4%">Date Due</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Priority</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Assigner</th>
        <th class="topmenu" align="center" valign="middle" width="6%">Assignee</th>
      
        <th class="topmenu" align="center" valign="middle" width="6%">Days Open</th>
        <th class="topmenu" align="center" valign="middle" width="6%">Outstanding Tasks</th>
        <th class="topmenu" align="center" valign="middle" width="6%">Active</th>
         <th class="topmenu" align="center" valign="middle" width="5%">Action</th>  
        
      </tr>
    </thead>
    {{if $list}}
    <tbody>
    
      <!--{{assign var=countn value= $numstartvounter}}-->
       {{assign var=countn value= $total}}
      
      {{foreach from=$list key="key" item="item"}}
      
    
      <tr {{if $item.bsn_per_complete ge 90}} bgcolor="#66FF66" {{else}} bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}} {{/if}}">
       
     
         
       <td>{{$item.dt_checklist_no}}</td>
       <td>{{$item.dt_project_name}}</td>
       <td><input type="button" name="viewtask" value="View" onclick="javascript:view_task({{$item.dt_id}});" style="width:90px; height:20px; font-size:11px; line-height:17px !important; padding:0px !important" /></td>
       <td>{{$item.bcust_fname}} &nbsp; {{$item.bcust_lname}}</td>
       <td>{{$item.dt_date_submitted}}</td>
       <td>{{$item.dt_due_date}}</td>
       <td>
         <select name="{{$TABLE}}[dt_priority]"  Onchange = "update_priority({{$item.dt_id}},this.value)">
                <option value="-1" {{if $item.dt_priority eq -1}} selected="selected" {{/if}}>Please Select </option>
                {{foreach from = $prdetail key="key4" item="item4"}}
                <option value="{{$item4.pr_id}}" {{if $item4.pr_id eq $item.dt_priority}} selected="selected" {{/if}}>{{$item4.pr_priority}}</option>
                {{/foreach}}
        </select>
        
        <script>
	   
		function update_priority(id,value)
		{
			
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}designer_tracker.update_priority/dt_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	</script>
              
       
       </td>
       <td>{{$item.dt_cust_designer}}</td> 
       <td>{{$item.dt_assignee}} </td>
       
       <td>{{$item.day_open}}</td>
       <td>{{$item.o_task}}</td>
      <td>
        <form name ="recmet3" method="post" action="">
     	<input type="hidden" name="completed[{{$item.dt_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="completed[{{$item.dt_id}}]" value="1"  onclick="this.form.submit();" {{if $item.dt_complete eq 1 }} checked="checked" {{/if}} />
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