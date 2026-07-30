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
   
   
<form name="detail" method="post" action="{{$XFA.detail}}"  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" /> 
    
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
    <tr>
     <th>Project</th>
     <td>
   	<datalist id='project'>
           {{foreach from=$projdetail key="key1" item="item1"}}
            <option value="{{$item1.bsn_name}}" {{if $bsnid eq $item1.bsn_id}} selected="selected" {{/if}}>
            {{$item1.bsn_name}}
            </option>
            {{/foreach}}
  	 </datalist>
         <input type="text" list = 'project' name="{{$TABLE}}[cc_project]" style ="width:700px" value="{{$detail.cc_project}}" />
      </td>
    </tr>
   
    
   
    <tr>
     <th>Handover Date</th>
     <td><input  type="text" name="{{$TABLE}}[cc_handover_date]"  value="{{$detail.cc_handover_date}}"  style ="width:200px" class="w16em dateformat-d-ds-m-ds-Y" /> </td>
     </tr>
  
     <tr>
     <th>Appointment Date</th>
     <td><input  type="text" name="{{$TABLE}}[cc_app_date]"  value="{{$detail.cc_app_date}}"  style ="width:200px" class="w16em dateformat-d-ds-m-ds-Y"/> </td>
     </tr>
    
     <tr>
     <th>Meeting Result</th> 
     <td> <input type="file" name="meeting_result" /> </td>      
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
			frmvalidator.addValidation("{{$TABLE}}[wa_project]","req", "Please specify project.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_company_name]","req", "Please specify company name.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_contact_name]","req", "Please specify contact name.");
    </script>
</div>