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

<div align="center" style="min-height:350px; margin-top:20px;">
    <h3 class="page-title">Upload Letter</h3>    
   
   <br /><br />
<form name="detail" method="post" action="{{$XFA.detail}}"  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="lettercode[lc_id]" value="{{$detail.lc_id}}" />
 
   

      
      <tr>
        <th> Letter Code</th>
        <td><input type="text" name="lettercode[lc_letter_code]" value="{{$detail.lc_letter_code}}" style="width:400px;" readonly="readonly" /></td>
      </tr>
      
     <tr>
        <th>Owner</th>
        <td> <input type="text" name="lettercode[lc_owner]" value="{{$detail.lc_owner}}" style="width:400px;" /></td>
      </tr>
 
     <tr>
        <th>Reason</th>
        <td> <input type="text" name="lettercode[lc_reason]" value="{{$detail.lc_reason}}" style="width:400px;" /></td>
      </tr>
       <tr>
        <th>Download</th>
        <td> <input type="text" name="lettercode[lc_download]" value="{{$detail.lc_download}}" style="width:400px;" /></td>
      </tr>
      
       <tr>
 	 <th> Upload letter </th> 
  	 <td> <input type="file" name="letter" /></td>      
	</tr>
  
   <tr>
     <th>Last Updated</th>
     <td><input  type="text" name="lettercode[lc_last_updated]"  value="{{$detail.lc_last_updated}}" class="w16em dateformat-d-ds-m-ds-Y dtpic" /> </td>
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
	frmvalidator.addValidation("lettercode[lc_letter_code]","req", "Please specify item.");
			
    </script>
</div>

