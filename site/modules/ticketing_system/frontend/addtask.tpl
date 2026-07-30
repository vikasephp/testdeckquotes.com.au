<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/default.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/tree/simpletreemenu.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tree/simpletree.css" />

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



function add_new(bs,ck)
 {
	 
var viewurl = "{{$BASE_URL}}ticketing_system.detail/bsn_id/"+bs+"/chk_no/"+ck+ "/random/" + Math.random();
	
 $(document).ready(function () {
        $.fancybox({
				'width': '78%',
				'height': '80%',
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


     

// We create the HTTP Object

function close_win()
	{
	$.fancybox.close();
	window.location.reload();
	}
</script>



<style>

table  { border-collapse: collapse; width: 100%; }
th     { z-index:9999; }

</style>

<h3 class="page-title">Task Detail</h3>
<br />

<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
<div style="float:right;"> 
<input type="button" value="Back To Dashboard" onclick="document.location.href='{{$BASE_URL}}ticketing_system.home'" /> &nbsp;
<input type="button" name="Add New " value="Add New Task" onclick="javascript:add_new({{$bsn_id}}, {{$chk_no}});" />
</div>
</form>
<div style="float:left; width:100%;">
  <table id="doclist-table" class="nav-back" width="100%">
    <thead>
      <tr>
        <th class="topmenu" align="center" valign="middle" width="3%">Job Id</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Status</th> 
        <th class="topmenu" align="center" valign="middle" width="5%">Checklist Number</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Project Name</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Client Name</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Date submitted</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Date Due</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Requestor</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Assigned To:</th>
        <th class="topmenu" align="center" valign="middle" width="7%"># of Day open</th>
        <th class="topmenu" align="center" valign="middle" width="7%"># of outstanding tasks</th>
         
      </tr>
    {{if $list}}
    <tbody>
    <form name="mlist" method="post">
      <!--{{assign var=countn value= $numstartvounter}}-->
       {{assign var=countn value= $total}}
      
      {{foreach from=$list key="key" item="item"}}
   <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}" onclick="window.open(href='{{$BASE_URL}}{{$XFA.detail}}/bsn_id/{{$item.bsn_id}}', '_self')">
        <td> </td>
        <td></td>
         <td style="text-align:center;" >{{$item.dpn_unique_id}}</td>
        <td>{{$item.bsn_address}}</td>
   
        <td>{{$item.bcust_fname}} &nbsp; {{$item.bcust_lname}}</td>
        <td></td>
        <td></td>
        <td></td>
        <td> </td>
        <td> </td>
        <td> </td>
        
      </tr>
      {{assign var=countn value=$countn-1}}
      {{/foreach}}
      </tbody>
      
    </form>
    {{/if}}
  </table>
<br />
 <hr style="color:#000; background-color:#000;" size="12" />
 <br />
<table id="doclist-table" class="nav-back" width="100%">
        <thead>
            <tr>
                   <th class="topmenu" align="center" valign="middle" width="3%">Task ID</th>  
                   <th class="topmenu" align="center" valign="middle" width="25%">Task Description</th>   
            	   <th class="topmenu" align="center" valign="middle" width="10%">Assigned to</th>
                   <th class="topmenu" align="center" valign="middle" width="10%">Assigned by</th> 
                   <th class="topmenu" align="center" valign="middle" width="10%">Submitted Date</th> 
                   <th class="topmenu" align="center" valign="middle" width="8%">Due Date</th> 
                   <th class="topmenu" align="center" valign="middle" width="8%">Status</th> 
                    <th class="topmenu" align="center" valign="middle" width="2%">Action</th>
                 
            </tr>
        </thead>
    <tbody>
    {{foreach from=$taskData key="key2" item="item2"}}
    <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
                   <td>{{$item2.td_task_id}}</td>  
                   <td>{{$item2.td_task_desc}}</td>   
            	   <td>{{$item2.td_assign_to}}</td>
                   <td>{{$item2.td_assign_by}}</td> 
                   <td>{{$item2.td_submitted_date}}</td> 
                   <td>{{$item2.td_due_date}}</td> 
                   <td>{{$item2.td_status}}</td> 
                    <td><a href="{{$BASE_URL}}{{$XFA.detail}}/td_id/{{$item2.td_id}}" class="various" title="Edit"> <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>
          <!-- {{if $USER_GROUP == 'Administrators'}} -->
          <a href="{{$BASE_URL}}{{$XFA.delete}}/td_id/{{$item2.td_id}}/bsn_id/{{$item2.td_bsn_id}}/chk_no/{{$item2.td_checklist_no}}" onclick="javascript:if(!confirm('Are you sure want to delete the listing? Because it will delete all the document related to this listing.')) return false;" title="Delete"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>
          <!--   {{/if}}-->
        </td>
    </tr>
    
    {{/foreach}}
    
 </tbody>
 </table>   




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
  {{/if}} <br />

  
 

</div>