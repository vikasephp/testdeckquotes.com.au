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
    <h3 class="page-title">Staff List Form</h3>    
   
   
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="staff[f_id]" value="{{$detail.f_id}}" />
   {{if $opr}} <tr><th colspan="2" style="color:#0C6; font-size:14px;">Record has been added in staff</th></tr>{{/if}}
   
    <tr>
     <th>Name</th>
     <td><input type="text" name="staff[f_name]" style ="width:700px" value="{{$detail.f_name}}" />
      </td>
    </tr>
   
   <tr>
     <th>Positioon Responsible</th>
     <td><input  type="text" name="staff[f_position]"  value="{{$detail.f_position}}" style="width:700px;" /> </td>
    </tr>
   
   
   <tr>
     <th>Email Responsible</th>
     <td><input  type="text" name="staff[f_email]"  value="{{$detail.f_email}}" style="width:700px;" /> </td>
    </tr>
    
    
    <tr>
     <th>What they do</th>
     <td><input  type="text" name="staff[f_what_do]"  value="{{$detail.f_what_do}}" style="width:700px;" /> </td>
    </tr>
   
    <tr>
     <th>Workload Capacity</th>
     <td><input  type="text" name="staff[f_work_load]"  value="{{$detail.f_work_load}}" style="width:700px;" /> </td>
    </tr>
     
   <tr>
     <th>Report To</th>
     <td><input  type="text" name="staff[f_report_to]"  value="{{$detail.f_report_to}}" style="width:700px;" /> </td>
    </tr>
     <tr>
     <th>Work With</th>
     <td><input  type="text" name="staff[f_work_with]"  value="{{$detail.f_work_with}}" style="width:700px;" /> </td>
    </tr>

    <tr>
     <th>Work With</th>
     <td><textarea name="staff[f_where_dsr]" cols="128" rows="6"> {{$detail.f_where_dsr}} </textarea> </td>
    </tr>	
    
     <tr>
        <td colspan="2" style="text-align:center;">
          <input type="submit" name="subAddDetail" value="Save" class="vsml" />
          <input type="button" name="btnCancelDetail" value="Close" onclick="location.href='{{$BASE_URL}}site.stafflist'" />
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
			frmvalidator.addValidation("staff[ph_name]","req", "Please specify name.");
			//frmvalidator.addValidation("staff[cl_company_name]","req", "Please specify company name.");
			//frmvalidator.addValidation("staff[cl_contact_name]","req", "Please specify contact name.");
    </script>
</div>
