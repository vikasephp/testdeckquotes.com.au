<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />

<style>
td {font-size:13px; }
</style>

<div style="padding:20px; border:1px solid #CCC;">
<table cellpadding="10" cellspacing="0"  style="border:0px solid #339999; width:90%">
  <tr>
  <th align="right"> Project Name : </th>
  <td>{{$busdata.bsn_name}} </td>
  </tr>
  
  <tr>
  <th align="right"> Task Name : </th>
  <td>{{$taskdata.bst_task_name}} </td>
  </tr>
  <tr>
  <th align="right">Completed Date : </th>
  <td>{{$taskdata.bt_completed_date}} </td>
  </tr>
  <tr>
  <th align="right">Completed By : </th>
  <td>{{$taskdata.user_name}} </td>
  </tr>
  
</table>  

 
  
     <input type="button" value="Back To Inclusion Task Report" onclick="location.href='{{$BASE_URL}}/inclusions_task_tracker.home';" />
   
