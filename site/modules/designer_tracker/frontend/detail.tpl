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
    <h3 class="page-title">Add/Edit New Design</h3>    <br />
   
   
<form name="detail" method="post" action="{{$XFA.detail}}"  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
     <!--<input type="hidden" name="{{$TABLE}}[dt_project_id]" value="{{$detail.dt_project_id}}" />-->
   {{if $error}} <tr><th colspan="2" style="color:#FF0000; font-size:18px;">{{$error}}</th></tr>{{/if}}
   {{if $msg}} <tr><th colspan="2" style="color:#FF0000; font-size:18px;">{{$msg}}</th></tr>{{/if}}
    <tr>
     <th>Checklist Number</th>
     <td>
   	<datalist id='project'>
           {{foreach from=$chk_bsn key="key3" item="item3"}}
            <option value="{{$item3.dpn_unique_id}}|{{$item3.bsn_name}}" {{if $bsnid eq $item3.bsn_id}} selected="selected" {{/if}}>
            {{$item3.dpn_unique_id}} | {{$item3.bsn_name}}
            </option>
            {{/foreach}}
  	 </datalist>
         <input type="text" list = 'project' name="{{$TABLE}}[dt_checklist_no]" style ="width:700px" value="{{$detail.dt_checklist_no}}" />
      </td>
    </tr>
   
<!--    <tr>
     <th>Checklist Number</th>
     <td><input  type="text" name="{{$TABLE}}[dt_checklist_no]"  value="{{$detail.dt_checklist_no}}" style="width:700px;" /> </td>
    </tr>-->

   
    <tr>
     <th>Due Date</th>
     <td>
     <input  type="text" name="{{$TABLE}}[dt_due_date]"  value="{{$detail.dt_due_date}}" class="w16em dateformat-d-ds-m-ds-Y dtpic" /> 
     </td>
    </tr>

    <tr>
     <th>Customer Designer</th>
     <td>
     <select name="{{$TABLE}}[dt_cust_designer]">
          <option value="">Please Select</option>
         {{foreach from=$teamData key="keyc" item="itemc"}}
          <option value="{{$itemc.de_name}}" {{if $itemc.de_name  eq $detail.dt_cust_designer}} selected="selected" {{/if}}> 
             {{$itemc.de_name}}
            </option>
	 {{/foreach}}
       </select>
   
     
     </td>
      </tr>
      
       
    <tr>
     <th>Assignee</th>
     <td>
      <select name="{{$TABLE}}[dt_assignee]">
          <option value="">Please Select</option>
         {{foreach from=$teamData key="keyi" item="itemi"}}
            <option value="{{$itemi.de_name}}" {{if $itemi.de_name  eq $detail.dt_assignee}} selected="selected" {{/if}}> 
             {{$itemi.de_name}}
            </option>
 	 {{/foreach}}
        </select>
   
     
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
			frmvalidator.addValidation("{{$TABLE}}[dt_checklist_no]","req", "Please specify checklist number.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_company_name]","req", "Please specify company name.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_contact_name]","req", "Please specify contact name.");
    </script>
</div>