<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<div align="center" style="min-height:350px;">
<br />
    <h3 class="page-title">{{$title}}</h3>    
   
   
<form name="detail" method="post" action="{{$XFA.detail}}"  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
    <tr>
     <th>Mobile Number</th>
     <td>
         <input type="text"  name="{{$TABLE}}[mo_mobile_number]" style ="width:700px" value="{{$detail.mo_mobile_number}}" />
      </td>
    </tr>
   
    <tr>
     <th>What Stream</th>
     <td>
     <!--<input type="text" name="{{$TABLE}}[mo_stream]"  value="{{$detail.mo_stream}}"  /> -->
     <select name="{{$TABLE}}[mo_stream]"/>
        			
                <option value="0" {{if $item.mo_stream eq -1}} selected="selected" {{/if}}>Please Select </option>
                {{foreach from = $streamData key="key2" item="item2"}}
                <option value="{{$item2.ms_id}}" {{if $item2.ms_id eq $detail.mo_stream}} selected="selected" {{/if}}>{{$item2.ms_option}}</option>
                {{/foreach}}
                     
          </select>
     </td>
    </tr>
   
    <tr>
     <th>Network</th>
     <td>
         <input type="text"  name="{{$TABLE}}[mo_network]" style ="width:700px" value="{{$detail.mo_network}}" />
      </td>
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
			frmvalidator.addValidation("{{$TABLE}}[mo_mobile_number]","req", "Please specify item.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_company_name]","req", "Please specify company name.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_contact_name]","req", "Please specify contact name.");
    </script>
</div>