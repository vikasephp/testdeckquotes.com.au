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

<div align="center" style="min-height:350px;"><br />
    <h3 class="page-title">{{$title}}</h3>  <br />  
   
   
<form name="detail" method="post" action="{{$XFA.detail}}"  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
    <tr>
     <th>Project</th>
     <td>
   	<datalist id='project'>
           {{foreach from=$projdetail key="key" item="item"}}
            <option value="{{$item.bsn_name}}" {{if $bsnid eq $item.bsn_id}} selected="selected" {{/if}}>
            {{$item.bsn_name}}
            </option>
            {{/foreach}}
  	 </datalist>
         <input type="text" list = 'project' name="{{$TABLE}}[wp_project]" style ="width:700px" value="{{$detail.wp_project}}" placeholder="Type in and select the project"/>
      </td>
    </tr>
   
   
    <tr>
        <th>Invoice state:</th>
          <td>
            <select name="{{$TABLE}}[wp_invoice_stage]" class="input" />
          {{foreach from=$stagedata key="key" item="item"}}	
                 <option value="{{$item.so_id}}" {{if $detail.wp_invoice_stage eq $item.so_id}} selected="selected"{{/if}} >
                 {{$item.so_name}}
                 </option> 
          {{/foreach}}
         </select>
    </td>

    </tr>  
    <tr>
     <th>Invoice Value</th>
     <td><input  type="text" name="{{$TABLE}}[wp_invoice_value]"  value="{{$detail.wp_invoice_value}}" /> </td>
    </tr>
   
  
   
     <tr>
     <th>Reason</th>
     <td><textarea rows = "5" cols = "100" name="{{$TABLE}}[wp_reason]">{{$detail.wp_reason}}</textarea></td>
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
			frmvalidator.addValidation("{{$TABLE}}[tc_project]","req", "Please specify project.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_company_name]","req", "Please specify company name.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_contact_name]","req", "Please specify contact name.");
    </script>
</div>