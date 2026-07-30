<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />

<style>
td {font-size:13px; }
</style>

<div style="padding:20px; border:1px solid #CCC;">
<table cellpadding="0" cellspacing="0" style="border:0px solid #339999; width:100%">
  <tr>
    <td><table cellpadding="0" cellspacing="0">
        <tr>
          <td> {{if $taskData.st_name}}<strong>Status:</strong> {{$taskData.st_name}} {{/if}}
          	   {{if $taskData.pt_name}}<strong>Types:</strong> {{$taskData.pt_name}} {{/if}}	
          </td>
          <td>&nbsp;</td>
          <td><strong>Task Name:</strong> {{$taskData.bst_task_name}}</td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td>
    <br /><br />
    <table cellpadding="0" cellspacing="0" >
        <tr>
          <td><strong>Complete: &nbsp;</strong></td>
          <td><form name="task" method="post" action="">
            <input type="checkbox" {{if $taskData.bt_complete == 1}} checked="checked" {{/if}}  id="bt_complete" name="bt_complete" />
          </td>
          <td style="width:90px;">&nbsp;</td>
          <td><strong>Complete Date:</strong>
            <input type="text" name="bsn_status_date" value="{{$taskData.date}}" class="w16em dateformat-d-ds-m-ds-Y" id="editTaskDate" maxlength="25" />
            &nbsp;
<!--            <input type="text" name="{{$TABLE}}[bsn_status_time]" value="{{$taskData.time}}" class="vvsml" id="editTaskTime" readonly="readonly"/>
  &nbsp;<a href="javascript:setcur_date('curdate','editTaskDate','editTaskTime');" title="System Date/Time">
  <img src="{{$BASE_URL}}images/clock.png" alt="System Date" /></a> --></td>
          
          <td style="width:50px;">&nbsp;</td>
          <td><strong>Completed By:</strong>{{$taskData.customer_name|default:"Administrator"}}</td>
        </tr>
      </table> <br /></td>
  </tr>
  <tr>
    <td><table cellpadding="0" cellspacing="0" >
        <tr>
          <td><strong>Comments:</strong> &nbsp; &nbsp;</td>
          <td><textarea cols="55" rows="5" name = "bt_comment" >{{$taskData.bt_comment}}</textarea></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td><strong>Instruction:</strong>{{$taskData.bst_instruction}}
    	<input type="hidden" name="bst_id" value="{{$taskData.bst_id}}" />
     </td>
  </tr>
  <tr>
    <td>
    <br />
    <input type="submit" value="Update Task" name="updatetask" />
     <input type="button" value="Close" onclick='javascript:refresh_close();' />
   
      </td>
  </tr>
</table>
</form>
<script type="text/javascript">
function refresh_close()
{

	parent.requestAllTasksRenovation(0, {{$tn}});
	parent.$.fancybox.close();
}

</script>

