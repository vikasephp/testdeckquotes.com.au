<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" language="javascript">
	function gen_report(opt)
			{
			alert(opt);
			document.report.submit();
			
			
			}
			
</script>
<div align="center">
<form id="report" name="report" action="{{$BASE_URL}}{{$XFA.report}}/bsn_id/{{$bsn_id}}/opt/2" method="post">
<input type="hidden" name="option" value="{{$opt}}" />
<table width="90%" border="0" cellpadding="0" cellspacing="0" style="background-color:#FFFFFF;" id="none-table">
<tr><td colspan="2">&nbsp;</td></tr>
<tr> <td colspan="4" width="100%" align="center"><div align="center" style="font-size:18px;">Customize -{{$title}}</div> </td></tr>

<tr><td colspan="2">&nbsp;</td></tr>
<tr><th colspan="4" width="100%" style="vertical-align:baseline; padding-top:100px; background-color:#999999; border: 1px solid #999999; padding-top:10px;">&nbsp;</td></tr>

{{if $send_msg}}
<tr><td colspan="4"><div align="center" style="color:#009900; padding-top:10px;">{{$send_msg}}</div></td></tr>
{{/if}}
{{if $opt == 2}}
<tr height="100"><td height="150"><div align="left">Display Buyer : 
<select name="dbs">
	<option value="1">First Name Only</option>
    <option value="2">Code Only</option>
    <option value="3">First Name with the code</option>
    <option value="4">First Name and Second Name with the code </option>
</select></div></td><td><div align="center">
<div align="left">Buyer Status: 
<select name="buyerstatus">
	<option value="1">All</option>
    <option value="2">Active</option>
    <option value="3">No longer active</option>
</select></div></div></td><td></td><td></td></tr>
<tr height="100"><td height="150"><div align="left">Outstanding Information: <br />
<select name="osti" style="width:200px;">
	<option value="1">Not Include</option>
    <option value="2">Include</option>
</select></div></td><td><div align="left">Report Uses: <br />
<select name="reportuse" style="width:200px;">
	<option value="0">External</option>
    <option value="1">Internal</option>
</select></div></td><td></td><td></td></tr>

{{else}}


{{/if}}	

<tr>
<td colspan="4"><table><tr>
<th><input type="submit" name="submit" value="Generate Report" /></th>
	<th colspan="2" ><input type="submit" name="submit_email" value="Generate Report & Email" onclick="javascript:if(!confirm('Are you sure you want to generate report & send email?')) return false;"/></th>
    <th ><input type="submit" name="submit_edit_email" value="Generate Report Edit email" /></th>
  </tr>
  </table>
  </td>  
</tr>
<tr><th colspan="4" width="100%" style="vertical-align:baseline; padding-top:100px; background-color:#999999; border: 1px solid #999999; padding-top:10px;">&nbsp;</td></tr>
</table>
</form>
</div>