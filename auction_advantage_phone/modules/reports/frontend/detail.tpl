<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript">
function DoCustomValidation()
{
  var frm = document.forms["mlist"];
  
  if(frm.report_type.value == 3)
  {
  if(frm.from_date.value == '' || frm.to_date.value == '')
  {
    alert('Please select dates.');
    return false;
  }
  else
  {
    return true;
  }
  }else{ return true;}
}
{{if $message}}
setTimeout('parent.close_win();', 500);
{{/if}}
</script>
<div align="center" style="padding-top:20px;">
  <h3 class="page-title">{{$title}}</h3>

      <form name="mlist" method="post" action="{{$BASE_URL}}{{$XFA.detail}}">
<input type="hidden" name="reportgen" value="reportgen" />
<table id="viewtodoc-table" width="80%" cellpadding="0" cellspacing="0" height="200">
{{if $message}}
<tr><td colspan="4"><div style="color:#339900; font-size:20px; text-align:center; padding-top:150px;">{{$message}}</div></td></tr>

{{else}}
	
  <tr>
  <th>User:</th>
  <td>	
  {{if !$usergroup}}
  <select name="gen_user_id" style="width:150px;">
        	<option value="all">-- All Users --</option>
        	{{foreach from=$users item="item" key="key"}}
    		<option value="{{$item.user_id}}">{{$item.user_name}}</option>
            {{/foreach}}
    	</select>
        	{{else}} {{$_SESSION.user.user_name}} {{/if}}
        </td>
        <th>Report Type:</th>    
    <td>
    <select name="report_type" >
    	<option value="3">Selected Date</option>
    	<option value="1">24 Hour</option>
    	<option value="2">7 Day's</option>
    </select>
    </td>
  </tr>
    

    <tr><th>From:</th>
    <td>
      <input type="text" name="from_date" class="w16em dateformat-d-ds-m-ds-Y" readonly="readonly"/>&nbsp;&nbsp;
      </td>
      <th>To: </th>
     <td> 
        <input type="text" name="to_date" class="w16em dateformat-d-ds-m-ds-Y" readonly="readonly"/>&nbsp;&nbsp;
     </td>
      </tr>

     <tr>
     <th>Report Filter:</th>
    <td colspan="3">
       <select name="report_filter" >
       {{foreach from = $report_filters key="id" item="name"}}
    	<option value="{{$id}}">{{$name}}</option>
       {{/foreach}}
       </select>
      </td>
      </tr>
      <tr>
     
     <th colspan="4"> <div align="center" style="padding-top:10px;">  
        <input type="submit" name="Generate-Report" value="Generate Report" /></div>
        </th></tr>
   {{/if}}
</table>
</form>
</div>
{{if !$message}}
<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("mlist");
    frmvalidator.EnableMsgsTogether();
	frmvalidator.setAddnlValidationFunction("DoCustomValidation");
    frmvalidator.addValidation("bm_listing[btdl_title]","req", "Please specify title.");
</script>
{{/if}}