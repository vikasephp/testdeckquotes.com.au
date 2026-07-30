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
    <h3 class="page-title">Add New Report</h3>    
   
   
<form name="detail" method="post" action="{{$XFA.detail}}"  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
    <tr>
     <th>Project Address</th>
     <td>	
     <datalist id='project'>
           {{foreach from=$projdetail key="key3" item="item3"}}
            <option value="{{$item3.bsn_name}}" {{if $bsnid eq $item3.bsn_id}} selected="selected" {{/if}}>
            {{$item3.bsn_name}}
            </option>
            {{/foreach}}
  	 </datalist>
         <input type="text" list = 'project' name="{{$TABLE}}[rt_project_address]" style ="width:700px" value="{{$detail.rt_project_address}}" />
      </td>
      </td>
    </tr>
   
   <tr>
     <th>Report Type</th>
     <td>      
              {{if $detail.$ID gt 0}}
              		<select name="{{$TABLE}}[rt_report_type]" disabled="disabled" >
              {{foreach from = $typedetail key="key" item="item"}}
                  <option value="{{$item.rb_id}}" {{if $item.rb_id eq $detail.rt_report_type }} selected="selected" {{/if}}>{{$item.rb_report_name}}</option>
               {{/foreach}}
             </select>
             <span style="color:#F00">Report Type is locked. You can't edit the report type.</span>
              {{else}}
              <select name="{{$TABLE}}[rt_report_type]" >
               {{foreach from = $typedetail key="key" item="item"}}
                 <option value="{{$item.rb_id}}" {{if $item.rb_id eq $detail.rt_report_type }} selected="selected" {{/if}}>{{$item.rb_report_name}}</option>
               {{/foreach}}
             </select>
             {{/if}}
     </td>
    </tr>
   
     
     <tr>
     <th>Status</th>
     <td> 
     <select name = "{{$TABLE}}[rt_status]">
        <option value="Open"  {{if $detail.de_completed eq 'Open'}} selected="selected" {{/if}}>Open</option>
        <option value="Close" {{if $detail.de_completed eq 'Close'}} selected="selected" {{/if}}>Close</option>
     </select>
     </td>
    </tr>
   
    <tr>
     <th>Customer Designer</th>
     <td> 
     <select name = "{{$TABLE}}[rt_cust_designer]">
     {{foreach from=$des_data key="keyd" item="itemd"}}
        <option value="{{$itemd.prd_name}}" {{if $itemd.prd_name eq $detail.rt_cust_designer }} selected="selected" {{/if}} > {{$itemd.prd_name}} </option>
     {{/foreach}}
     </select>
     </td>
    </tr>
   
    <tr>
     <th>Notes</th>
     <td><textarea cols="150" rows="5" name="{{$TABLE}}[rt_notes]">{{$detail.rt_notes}}</textarea>  </td>
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