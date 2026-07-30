<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<!--<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />-->
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>

<script>
	!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />


<script src="{{$BASE_URL}}ckeditor2/ckeditor.js"></script>
	<script src="{{$BASE_URL}}ckeditor2/samples/js/sample.js"></script>
	<script type="text/javascript">
           CKEDITOR.replace( 'editor1' );
           CKEDITOR.add  
        </script>

{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<script type="application/javascript">

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



function add_new(url)
 {
//var viewurl = "{{$BASE_URL}}designer_tracker.detail"+ "/random/" + Math.random();	
var viewurl = url;
 $(document).ready(function () {
        $.fancybox({
				'width': '99%',
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



<div align="center" style="min-height:350px; z-index:999;">
    <h3 class="page-title"><br />Task List</h3>  
      
 <div style="text-align:center; margin-left:10px; font-size:16px;">Project Name : {{$bsn_name}}</div> <br />
 
<form name="sort" method="post" action="">
<div style="float:left;"><span>&nbsp;&nbsp;&nbsp;<strong>Search:</strong>&nbsp;&nbsp;</span>
<input type="text" name="{{$TABLE}}[keyword]" value="{{$keyword}}" style="width:400px;" placeholder="Search
 for Task Description, Or Assigner Or Assignee  Or Task Type"/>
&nbsp; 
<input type="submit" value="Search" name="search"  />&nbsp;&nbsp;
<strong>Sort By</strong>
 <select name="sortoption" />
                 <option value="1" {{if  $ord == '1'}}selected{{/if}}>Assignee</option>
                 <option value="2" {{if  $ord == '2'}}selected{{/if}}>Assigner</option>
                 <option value="3" {{if  $ord == '3'}}selected{{/if}}>Task Type</option>
                 <option value="4" {{if  $ord == '4'}}selected{{/if}}>Status</option>
 </select> 
 &nbsp; 
<input type="submit" value="Sort" name="sort"  />
</div>
</form>
   
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<div style="float:right; margin-right:10px; background: #09F; color:#FFF !important; padding:6px; margin-bottom:5px;"> 
<a href="{{$BASE_URL}}designer_tracker.add_task/dt_id/{{$dt_id}}" class="various" title="Edit" style="color:#FFF; text-decoration:none; font-size:14px;"> Add New Task </a>
</div>
</form>

<!--<div id="tana">T</div>-->
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<table id="list-table" width="99%">
<tr> 
<th width="3%">Task ID</th><th>Task Description</th><th>Assignee</th><th>Assigner</th><th>Submitted Date</th>
<th>Due Date </th><th>Priority</th><th>Status</th><th>Task Type</th><th width="8%">View / Add Comments</th><th>Action</th>
       {{foreach from=$taskdata key="key" item="item"}}
       <tr>
      	 
        <td>{{$item.tdt_id}}</td>
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
        <select name="task[tdt_status]"  Onchange = "status_update({{$item.tdt_id}},this.value)"/>
                 <option value="OPEN"   {{if  $item.tdt_status == 'OPEN'}}selected{{/if}}>OPEN</option>
                 <option value="IN PROGRESS"   {{if  $item.tdt_status == 'IN PROGRESS'}}selected{{/if}}>IN PROGRESS</option>
                 <option value="AWAITING" {{if  $item.tdt_status == 'AWAITING'}}selected{{/if}}>AWAITING</option>
                 <option value="FEEDBACK" {{if  $item.tdt_status == 'FEEDBACK'}}selected{{/if}}>FEEDBACK</option>
                 <option value="COMPLETE" {{if  $item.tdt_status == 'COMPLETE'}}selected{{/if}}>COMPLETE</option>
        </select>  
        
         <script>
	   
		function status_update(id,value)
		{	
				
				 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}designer_tracker.update_status/tdt_id/"+id+"/value/"+value,
					   success: function(result){
						   // $(tana).html(result);
					}
				});
		}
	</script>
        
        
        </td>
        <td>{{$item.tdt_task_type}}</td>
        <td><a href="{{$BASE_URL}}designer_tracker.view_comment/tc_task_id/{{$item.tdt_id}}/dt_id/{{$dt_id}}/tdt_dt_id/{{$dt_id}}" class="various" title="View" >View</a></td>
        
        
        <th> <a href="{{$BASE_URL}}designer_tracker.add_task/tdt_id/{{$item.tdt_id}}/dt_id/{{$dt_id}}" class="various" title="Edit"> 
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
             
         <a href="{{$BASE_URL}}designer_tracker.delete_task/tdt_id/{{$item.tdt_id}}/tdt_dt_id/{{$dt_id}}" onclick="javascript:if(!confirm('Are you sure want to delete the Task?')) return false;" title="Delete">     <img style="height: 16px;; width:16px" src="{{$BASE_URL}}css/admin/images/deletecross.png"/></a>
         </th>    
       </tr> 
      {{/foreach}}

</table><br /><br />
<input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
</form>
    
    <script type="text/javascript">
		function closepop()
		{
		setTimeout('parent.close_win();', 500);
		}
	</script>
    
	<script type="text/javascript" language="javascript" >
        var frmvalidator  = new Validator("detail");
			frmvalidator.EnableMsgsTogether();
			frmvalidator.addValidation("{{$TABLE}}[al_item]","req", "Please specify item.");
			
    </script>
</div>

<script>
	initSample();
</script>