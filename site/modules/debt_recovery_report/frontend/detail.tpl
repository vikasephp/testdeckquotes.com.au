<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/ckeditor2/ckeditor.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/ckeditor2/samples/js/sample.js"></script>

{{include file=$jdata}}
{{include file=$tiny_basic}}

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
     <th>Call Date</th>
     <td><input type="text" name="{{$TABLE}}[dr_call_date]"  value="{{$detail.dr_call_date}}" class="w16em dateformat-d-ds-m-ds-Y" style="width:200px;" /></td>
     </tr>
     
      <tr>
     <th>Call Time</th>
     <td><input type="text" name="{{$TABLE}}[dr_call_time]"  value="{{$detail.dr_call_time}}" style="width:200px;" /> </td>
     </tr>
     
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
         <input type="text" list = 'project' name="{{$TABLE}}[dr_project_address]" style ="width:700px" value="{{$detail.dr_project_address}}" />
      </td>
    </tr>
   
    <tr>
     <th>Call Result</th>
     <td><select name="{{$TABLE}}[dr_call_result]" />
        			
                <option value="0" {{if $detail.dr_call_result eq 0}} selected="selected" {{/if}}>Please Select </option>
                {{foreach from = $resultdetail key="key2" item="item2"}}
                <option value="{{$item2.cr_id}}" {{if $item2.cr_id eq $detail.dr_call_result}} selected="selected" {{/if}}>{{$item2.cr_option}}</option>
                {{/foreach}}
                     
          </select> </td>
    </tr>
   
     <tr>
     <th>Notes</th>
     <td><textarea name="{{$TABLE}}[dr_notes]" id="editor"  cols="100" rows="15">{{$detail.dr_notes}}</textarea> </td>
     </tr>
   
     <tr>
     <th>Link</th>
     <td><input type="text" name="{{$TABLE}}[dr_link]"  value="{{$detail.dr_link}}" style="width:700px;" /> </td>
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