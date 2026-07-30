<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />


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
     <th>Order</th>
     <td><input type="text" name="{{$TABLE}}[de_order]" style ="width:700px" value="{{$detail.de_order}}" />
      </td>
    </tr>
   
   <tr>
     <th>What</th>
     <td><input  type="text" name="{{$TABLE}}[de_what]"  value="{{$detail.de_what}}" style="width:700px;" /> </td>
    </tr>
   
       
     <tr>
     <th>Link to Spec</th>
     <td> <input  type="text" name="{{$TABLE}}[de_link_to_spec]"  value="{{$detail.de_link_to_spec}}" style="width:700px;" /> </td>
     </tr>
    
     <tr>
     <th>Completed</th>
     <td> 
     <select name = "{{$TABLE}}[de_completed]">
        <option value="0" {{if $detail.de_completed eq 0}} selected="selected" {{/if}}>No</option>
        <option value="1" {{if $detail.de_completed eq 1}} selected="selected" {{/if}}>Yes</option>
     </select>
     </td>
    </tr>
   
    <tr>
     <th>Total Hours</th>
     <td> <input  type="text" name="{{$TABLE}}[de_total_hours]"  value="{{$detail.de_total_hours}}" style="width:700px;" /> </td>
    </tr>

     <tr>
     <th>Q/A Testing</th>
     <td><input type="file" name="qa_test" /></td>
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

<script>
	initSample();
</script>