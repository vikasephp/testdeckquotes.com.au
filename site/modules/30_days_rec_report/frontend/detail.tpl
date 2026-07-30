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
           {{foreach from=$projdetail key="key3" item="item3"}}
            <option value="{{$item3.bsn_name}}" {{if $bsnid eq $item3.bsn_id}} selected="selected" {{/if}}>
            {{$item3.bsn_name}}
            </option>
            {{/foreach}}
  	 </datalist>
         <input type="text" list = 'project' name="{{$TABLE}}[td_project_name]" style ="width:700px" value="{{$detail.td_project_name}}" />
      </td>
    </tr>
   
    <tr>
     <th>Value $</th>
     <td><input  type="text" name="{{$TABLE}}[td_value]"  value="{{$detail.td_value}}" /> </td>
    </tr>
   
     <tr>
     <th>Due Date</th>
     <td><input  type="text" name="{{$TABLE}}[td_due_date]"  value="{{$detail.td_due_date}}" class="w16em dateformat-d-ds-m-ds-Y dtpic" /> </td>
    </tr>
   
    <tr>
     <th>Last Spoken</th>
     <td><input  type="text" name="{{$TABLE}}[td_last_spoken]"  value="{{$detail.td_last_spoken}}" class="w16em dateformat-d-ds-m-ds-Y dtpic" /> </td>
    </tr>
   
   <tr>
     <th>Type </th>
     <td><select name="{{$TABLE}}[td_invoice_type]" style="width:300px;"/>
      	 {{foreach from=$typeoptions key="key" item="item"}}
            <option value="{{$item.it_type}}" {{if $detail.td_invoice_type eq $item.it_type}} selected="selected" {{/if}}>
            {{$item.it_type}}
            </option>
         {{/foreach}}   
    </td>
    </tr>  
   
     <tr>
     <th>Invoice Number</th>
     <td><input  type="text" name="{{$TABLE}}[td_invoice_number]"  value="{{$detail.td_invoice_number}}"  /> </td>
     </tr>
   
     <tr>
     <th> Document </th> 
     <td> <input type="file" name="doc" /></td>      
    </tr>
   
   
    <tr>
     <th> Correspondance </th> 
     <td> <input type="file" name="corr" /></td>      
    </tr>
     <tr>
        <th>Reason:</th>
        <td><textarea rows="6" cols="125" name="{{$TABLE}}[td_reason]" >{{$detail.td_reason|stripslashes}}</textarea></td>
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