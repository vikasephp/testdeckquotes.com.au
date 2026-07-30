<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />

<style>
td {font-size:13px; }
</style>

<div style="padding:20px; border:1px solid #CCC;">

<form name="task" method="post" action="">
<table cellpadding="0" cellspacing="0" style="border:0px solid #339999; width:100%">
  
  <tr>
    <td>
    <br /><br />
    
    <table cellpadding="0" cellspacing="0" >
        <tr>
     
          <td style="width:90px;">&nbsp;</td>
          <td><strong>Action Date Date:</strong>
            <input type="text" name="be_action_date" value="{{$action_date}}" class="w16em dateformat-d-ds-m-ds-Y" id="editTaskDate" maxlength="25" />
            &nbsp;
         </td>
          
          <td style="width:50px;">&nbsp;</td>
          <!--<td><strong>Updated Completed By:</strong>{{$taskData.customer_name|default:"Administrator"}}</td>-->
        </tr>
      </table> <br /></td>
  </tr>
  
  
  <tr>
    <td>
    <br />
    <input type="submit" value="Update Date" name="updatetask" />
     
     <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
   
      </td>
  </tr>
</table>
</form>
<script type="text/javascript">
function refresh_close()
{
	parent.requestproposalalertInfo(1);
	parent.$.fancybox.close();
}

</script>

 <script type="text/javascript">
		function closepop()
		{
		//setTimeout('parent.close_win();', 500);
		window.location.href = "{{$BASE_URL}}presented_but_not_signed_report.view_alerts/bsn_id/{{$bsn_id}}";
		}
	</script>
    