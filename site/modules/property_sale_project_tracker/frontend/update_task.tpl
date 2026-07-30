<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
		
{{include file=$jdata}}
{{include file=$tiny_basic}}

<script>
		!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
	</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />
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


function add_custom_task(ps_id,st_id)
{
	
	var viewurl = "{{$BASE_URL}}property_sale_project_tracker.add_custom_task"+ "/ps_id/" + ps_id+ "/st_id/" + st_id;	
    
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
<style>

ul { list-style:disc !important; }

ol { list-style: decimal !important; }
</style>

{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}


<div align="center" style="padding-top:30px;">
<h3 class="page-title">Task Update</h3><br />

<div style="float:left; text-align:left; margin-left:30px;">
<strong>Project Name : {{$ps_project}}</strong><br />
<strong>Stage Name : {{$st_option}}</strong>
</div><br />
&nbsp; &nbsp;<input type="button" name="custom" value="Add Custom Task For This Project" onclick="javascript:add_custom_task({{$ps_id}},{{$st_id}});" /> 
<form name="detail" method="post" action="{{$BASE_URL}}property_sale_project_tracker.home"  enctype="multipart/form-data">
          
  <table id="list-table"  width="95%" cellpadding="0" cellspacing="0" style="border:1px solid #999;">
   <tr> <th>Step Number</th> <th>Task Name</th><th>Task Explained</th>
   <th>Position Responsible</th> <th>Status</th> 
   <th>Update By</th><th>Update Date</th><th>Procedure Link</th><th>Delete<br />Custom Task</th></tr>
    {{foreach from=$taskdata key="key" item="item"}}
     <tr>
     <td style="width:5%">{{$item.tm_step_number}}</td> 
     <td style="width:30%">{{$item.tm_task}}</td> 
     <td style="width:30%">{{$item.tm_task_summary}}</td>
     <td style="width:10%">{{$item.tm_position_resp}}</td>
     <td style="width:10%">
     <select name='status' onchange="update_status({{$item.td_id}},this.value)">
     <option value="Incomplete" {{if $item.td_status eq 'Incomplete'}} selected="selected" {{/if}}>Incomplete</option>
     <option value="Complete" {{if $item.td_status eq 'Complete'}} selected="selected" {{/if}}>Complete</option>
     <option value="Not Required" {{if $item.td_status eq 'Not Required'}} selected="selected" {{/if}}>Not Required</option>
     </select>
     
     <script language="javascript">
   		
		function update_status(id,value)
		{
			
			$.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}property_sale_project_tracker.update_status/td_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
					
		}    
    </script> 
     </td>
     <td>{{$item.td_user}}</td>

     <td>{{$item.td_date}}</td>
     <td>{{if $item.tm_proc_link}}<a href="{{$item.tm_proc_link}}" target="_blank">Link</a>{{/if}}</td>
     <td> {{if $item.tm_custom eq 1}}
     <a href="{{$BASE_URL}}property_sale_project_tracker.delete_ctask/tm_id/{{$item.tm_id}}/ps_id/{{$ps_id}}/st_id/{{$st_id}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete">
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>&nbsp;&nbsp
          {{/if}}   
     </td>
     </tr>
    {{/foreach}}
   
    </table> 
  	<div style="padding-top:20px;">
        <input type="submit" name="back" value="Update and Back" />
        <!--<input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />-->
      </div>
      
    </form>  
  </div> 
  
      <script type="text/javascript">
		function closepop()
		{
		setTimeout('parent.close_win();', 500);
		}
	</script>