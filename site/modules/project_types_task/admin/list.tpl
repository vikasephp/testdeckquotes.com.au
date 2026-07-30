<script src="{{$BASE_URL}}js/jquery.js" type="text/javascript"></script>
<script> 
  function mySubmit() {
     document.getElementById('opr').value = "search";
     document.getElementById("send_form").submit();
   }
</script>
<h3 class="page-title">{{$title}}</h3>
<div align="left">
<div style="font-weight:bold; color:#FF6600;">{{$msg}}</div>
<form action="{{$BASE_URL}}{{$XFA.list}}" method="post" name="send_form" id="send_form">
 <input type='hidden' id= 'opr' name='opr' value='' />
	<b>Select Type:</b> 
    <select name="types" onchange="javascript:mySubmit();">
    	{{foreach from=$allbusiness_types item=item key=key}}
        	<option value="{{$item.pt_id}}" {{if $types == $item.pt_id}} selected="selected" {{/if}}>{{$item.pt_name}}</option>
        {{/foreach}}
    </select>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Select Status:</b>&nbsp;
    <select name="cbs" onchange="javascript:mySubmit();">
    	<option value="0">-- Select--</option>
    	{{foreach from=$allbusiness_status item=item key=key}}
        	<option value="{{$item.st_id}}" {{if $cbs_id == $item.st_id}} selected="selected" {{/if}}>{{$item.st_name}}</option>
        {{/foreach}}
    </select>
    <input type="hidden" name="setids" id="setids" value="{{$dids}}" />
     <input type="hidden" name="saveorder"  value="Save Tasks Order1" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<!--    <input type="submit" value="Save Tasks Order" name="saveorder" class="lrg" />
-->
<div id="setids2"></div>
</div>
    <table id="list-table" class="nav-back" width="100%">
            <tr height="40" class="nodrag nodrop">
              <th class="topmenu_list" align="center" valign="middle" width="10%"><div align="center">Action</div></th> 
       		  <th class="topmenu_list" align="center" valign="middle" width="45%"><div align="center">Task Name</div></th>
              <th class="topmenu_list" align="center" valign="middle" width="10%"><div align="center">Task UID</div></th>
              <th class="topmenu_list"  valign="middle" width="21%"><div align="center">Status</div></th>        
              <th class="topmenu_list" align="center" valign="middle" width="12%"><div align="center">Required Documents</div></th>    
              <th class="topmenu_list" align="center" valign="middle" width="5%"><div align="center">Sequence</div></th>                          
          </tr>
          
        	{{foreach from=$task item="item" key="key"}}
            <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}" id="{{$item.bst_id}}" class="MoveableRow">
             <td>
                 &nbsp;<span class="up_button" title="Up"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/arrowup.png"/></span>
                 &nbsp;&nbsp;<span class="down_button" title="Down"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/arrowdown.png"/></span>
             </td>
             <td>{{$item.bst_task_name}}</td>
             <td>{{if $item.bst_task_id > 0}}{{$item.bst_task_id}}{{else}}{{$item.bst_id}}{{/if}}</td>
             <td>{{$item.st_name}}</td>
             <td>{{if !empty($item.bst_document)}}<a href="{{$BASE_URL}}{{$FILE_PATH}}files/task_files/{{$item.bst_document}}" target="_blank">View Document</a>{{/if}}</td>
             <td>{{$item.business_status_task_orders_tasks_oid}}<input type="hidden" name="taskid[]" id="taskid" class="taskid" value="{{$item.bst_id}}" style="width:20px;" /></td>
            </tr>
        	{{/foreach}}
    </table>
   </form> 
</div>
<script type="text/javascript" charset="utf-8">
$('.down_button').click(function () {
    var rowToMove = $(this).parents('tr.MoveableRow:first');
    var next = rowToMove.next('tr.MoveableRow')
    if (next.length == 1) { next.after(rowToMove); }
	var debugStr = '';
	var test_arr = $(".taskid");
	$.each(test_arr, function(i, item) {
	 debugStr += $(item).val()+"|";
	});
$("#setids").val(debugStr);
 $('#send_form').submit();
});

$('.up_button').click(function () {
    var rowToMove = $(this).parents('tr.MoveableRow:first');
    var prev = rowToMove.prev('tr.MoveableRow')
    if (prev.length == 1) { prev.before(rowToMove); }
	var debugStr = '';
	var test_arr = $(".taskid");
	$.each(test_arr, function(i, item) {
	 debugStr += $(item).val()+"|";
	});
$("#setids").val(debugStr);
 $('#send_form').submit();
});
</script>