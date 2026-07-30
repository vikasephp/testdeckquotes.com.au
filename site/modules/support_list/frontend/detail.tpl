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
    <h3 class="page-title">{{$title}}</h3>    
   
   
<form name="detail" method="post" action="{{$XFA.detail}}"  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
    <tr>
     <th>Name</th>
     <td>
         <input type="text"  name="{{$TABLE}}[su_name]" style ="width:700px" value="{{$detail.su_name}}" />
      </td>
    </tr>
   
    <tr>
     <th>Date</th>
     <td>
     <input type="text" name="{{$TABLE}}[su_date]"  value="{{$detail.su_date}}" class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo3_{{$item.bsn_id}}" /> </td>
    </tr>
   
   
   <tr>
     <th>Report</th>
     <td>
         <input type="text"  name="{{$TABLE}}[su_report]" style ="width:700px" value="{{$detail.su_report}}" />
      </td>
    </tr>
   
     <tr>
     <th>Hours Per Week</th>
     <td>
         <input type="text"  name="{{$TABLE}}[su_hour_per_week]" style ="width:700px" value="{{$detail.su_hour_per_week}}" />
      </td>
    </tr>
   
    <tr>
     <th>Primary Tasks</th>
     <td>
         <select name="{{$TABLE}}[su_primary_task]" >
         <option value="">Please Select </option>
        {{foreach from = $taskdetail key = "key1" item = "item1"}}
        <option value="{{$item1.st_task_name}}" {{if $detail.su_primary_task eq $item1.st_task_name}} selected="selected" {{/if}}>{{$item1.st_task_name}}</option>
        {{/foreach}}
       </select>
      </td>
    </tr>
   
    <tr>
     <th>Secondary Tasks</th>
     <td>
         <select name="{{$TABLE}}[su_secondary_task]" >
         <option value="">Please Select</option>
         {{foreach from=$taskdetail key="key2" item="item2"}}
        <option value="{{$item2.st_task_name}}" {{if $detail.su_secondary_task eq $item2.st_task_name}} selected="selected" {{/if}}>{{$item2.st_task_name}}</option>
       {{/foreach}}
       </select>
      </td>
    </tr>
 
   <tr>
        <th>Supplement Task </th>
        <td>
         <select name="{{$TABLE}}[su_supplement_task_1]" >
         <option value="">Please Select </option>
        {{foreach from = $taskdetail key = "key3" item = "item3"}}
        <option value="{{$item3.st_task_name}}" {{if $detail.su_supplement_task_1 eq $item3.st_task_name}} selected="selected" {{/if}}>{{$item3.st_task_name}}</option>
        {{/foreach}}
       </select>
        </td>
     </tr>
 
   <tr>
        <th>Supplement Task </th>
        <td>
      <select name="{{$TABLE}}[su_supplement_task_2]" >
         <option value="">Please Select </option>
        {{foreach from = $taskdetail key = "key4" item = "item4"}}
        <option value="{{$item4.st_task_name}}" {{if $detail.su_supplement_task_2 eq $item4.st_task_name}} selected="selected" {{/if}}>{{$item4.st_task_name}}</option>
        {{/foreach}}
       </select>
        </td>
     </tr>
  
    <tr>
     <th>Skypee</th>
     <td>
         <input type="text"  name="{{$TABLE}}[su_skype]" style ="width:700px" value="{{$detail.su_skype}}" />
      </td>
    </tr>
   
   <tr>
     <th>Main Email</th>
     <td>
         <input type="text"  name="{{$TABLE}}[su_main_email]" style ="width:700px" value="{{$detail.su_main_email}}" />
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
			frmvalidator.addValidation("{{$TABLE}}[al_item]","req", "Please specify item.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_company_name]","req", "Please specify company name.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_contact_name]","req", "Please specify contact name.");
    </script>
</div>