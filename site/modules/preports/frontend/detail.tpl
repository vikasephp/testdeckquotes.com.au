<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript">
function DoCustomValidation()
{
  var frm = document.forms["mlist"];
  
  if(frm.report_type.value == 2)
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
<table id="viewtodoc-table" width="80%" cellpadding="0" cellspacing="0" height="300">
{{if $message}}
<tr><td colspan="4"><div style="color:#339900; font-size:20px; text-align:center; padding-top:150px;">{{$message}}</div></td></tr>

{{else}}
	
  <tr>
  <th>Sales Agent:</th>
  <td>	
  {{if !$usergroup}}
  <select name="gen_user_id" style="width:150px;">
        	<option value="all">-- All Sales Agent--</option>
        	{{foreach from=$users item="item" key="key"}}
    		<option value="{{$item.user_id}}">{{$item.user_name}}</option>
            {{/foreach}}
    	</select>
        	{{else}} {{$_SESSION.user.user_name}} {{/if}}
        </td>
        <th>Project Type:</th>    
    <td>
    <select name="project_type" style="width:150px;">
        <option value="0"> --All-- </option>
    	{{foreach from=$ptypes item="item" key="key"}}
    		<option value="{{$item.pt_id}}">{{$item.pt_name}}</option>
            {{/foreach}}
    </select>
    </td>
   <th>Project Status:</th> 
 <td>
    <select name="project_status" style="width:150px;">
        <option value="0"> --All-- </option>
    	{{foreach from=$pstatus item="item" key="key"}}
    		<option value="{{$item.st_id}}">{{$item.st_name}}</option>
            {{/foreach}}
    </select>
    </td>
  </tr>
    <tr>
                <th>Report Type:</th>    
    <td>
    <select name="ur_type" style="width:150px;">
     <option value="1">--All--</option>
     <option value="2">Selected Date</option>   
    </select>
    </td>
    <th>From:</th>
    <td>
      <input type="text" name="from_date" class="w16em dateformat-d-ds-m-ds-Y" readonly="readonly"/>&nbsp;&nbsp;
      </td>
      <th>To: </th>
     <td> 
        <input type="text" name="to_date" class="w16em dateformat-d-ds-m-ds-Y" readonly="readonly"/>&nbsp;&nbsp;
     </td>
      </tr>

   
      <tr>
     
     <th colspan="6"> <div align="center" style="padding-top:10px;">  
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
</script>
{{/if}}