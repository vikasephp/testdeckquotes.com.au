<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />


{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<div align="center" style="min-height:350px; margin-top:20px;">
    <h3 class="page-title">Task List</h3>    
   <br /><br />
   
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<table id="list-table" width="80%">
<tr> 
<th width="80%">Task Name </th><th>Action</th>
       {{foreach from=$tasklist key="key" item="item"}}
       <tr>
      	 
        <th>{{$item.st_task_name }}</th>
        <th> <a href="{{$BASE_URL}}support_list.add_task/st_id/{{$item.st_id}}" class="various" title="Edit"> 
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
             
         <a href="{{$BASE_URL}}support_list.delete_task/st_id/{{$item.st_id}}" onclick="javascript:if(!confirm('Are you sure want to delete this task?')) return false;" title="Delete"><img style="height: 16px;; width:16px" src="{{$BASE_URL}}css/admin/images/deletecross.png"/></a>
         </th>    
       </tr> 
      {{/foreach}}

</table>
</form>
    <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />  
    <script type="text/javascript">
		function closepop()
		{
		setTimeout('parent.close_win();', 500);
		}
	</script>
    
	
</div>

<script>
	initSample();
</script>