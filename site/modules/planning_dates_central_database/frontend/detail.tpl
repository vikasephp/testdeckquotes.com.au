<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<div align="center" style="min-height:350px;">
    <h3 class="page-title">{{$title}}</h3>    
   
   
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="{{$TABLE}}[tt_id]" value="{{$detail.tt_id}}" />
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
     
    <tr>
     <th>Event</th>
     <td><input type="text" name="{{$TABLE}}[tt_event]" value="{{$detail.tt_event}}" style="width:700px;" /> </td>
    </tr>
   
      
    <tr>
    <th>Working Days</th> 
    <td> <input  type="text" name="{{$TABLE}}[tt_working_days]"  value="{{$detail.tt_working_days}}" style="width:700px;" /></td>      
    </tr>
   
    <tr>
     <th>Date Submitted</th>
     <td><input type="text" name="{{$TABLE}}[tt_date_submitted]" value="{{$detail.tt_date_submitted}}" id="demo1" class="w16em dateformat-d-ds-m-ds-Y dtpic"/> </td>
    </tr>
   
     
    
    <tr>
     <th>Due Date</th>
     <td><input  type="text" name="{{$TABLE}}[tt_due_date]"  value="{{$detail.tt_due_date}}" id="demo2" class="w16em dateformat-d-ds-m-ds-Y dtpic" /> </td>
    </tr>
  
  
  
      <tr>
        <td colspan="2" style="text-align:center;">
          <input type="submit" name="subAddDetail" value="Save" class="vsml" />
          <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
        </td>
    </tr>
</table>
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
			frmvalidator.addValidation("{{$TABLE}}[os_project]","req", "Please specify project.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_company_name]","req", "Please specify company name.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_contact_name]","req", "Please specify contact name.");
    </script>
</div>
