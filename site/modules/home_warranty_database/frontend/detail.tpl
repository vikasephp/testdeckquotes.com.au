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
     <th>Project Address</th>
     <td>
   	<datalist id='project'>
           {{foreach from=$projdetail key="key3" item="item3"}}
            <option value="{{$item3.bsn_name}}" {{if $bsnid eq $item3.bsn_id}} selected="selected" {{/if}}>
            {{$item3.bsn_name}}
            </option>
            {{/foreach}}
  	 </datalist>
         <input type="text" list = 'project' name="{{$TABLE}}[hw_project_address]" style ="width:700px" value="{{$detail.hw_project_address}}" />
      </td>
    </tr>
   
    <tr>
     <th>Multiple Projects</th>
     <td><select  name="{{$TABLE}}[hw_multiple_proj]"/>
          <option value="No"  {{if $detail.hw_multiple_proj eq 'No' }} selected="selected" {{/if}}>No</option>
          <option value="Yes" {{if $detail.hw_multiple_proj eq 'Yes' }} selected="selected" {{/if}}>Yes</option>
         </select>
      </td>
    </tr>  
       
   
    <tr>
     <th>Recerence Number</th>
     <td><input  type="text" name="{{$TABLE}}[hw_ref]"  value="{{$detail.hw_ref}}" /> </td>
    </tr>
   
     <tr>
        <th>Policy Number</th>
        <td><input  type="text" name="{{$TABLE}}[hw_policy_num]"  value="{{$detail.hw_policy_num}}" /></td>
     </tr>
  <tr>
 
    <tr>
     <th>Value</th>
     <td><input  type="text" name="{{$TABLE}}[hw_value]"  value="{{$detail.hw_value}}" /> </td>
    </tr>
  
   <tr>
        <th>Open Date:</th>
        <td><input  type="text" name="{{$TABLE}}[hw_open_date]"  value="{{$detail.hw_open_date}}" class="w16em dateformat-d-ds-m-ds-Y dtpic" /></td>
     </tr>
    
    <tr>
        <th>Close Date:</th>
        <td><input  type="text" name="{{$TABLE}}[hw_close_date]"  value="{{$detail.hw_close_date}}" class="w16em dateformat-d-ds-m-ds-Y dtpic" /></td>
     </tr>  
    
     
<!--    
    <tr>
     <th>Status </th>
     <td> <select name="{{$TABLE}}[ph_resp_staff]" >
                <option value="">Please Select </option>
                {{foreach from = $insu_status key="key4" item="item4"}}
                <option value="{{$item4.to_option}}" {{if $item4.to_option eq $detail.ph_resp_staff}} selected="selected" {{/if}}>{{$item4.to_option}}</option>
                {{/foreach}}
        </select>  
    </td>
    </tr> --> 
  
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


{{if $wa_id}}
<h2 style="text-align:center; font-size:24px;"> View Tasks </h2>

<table id="doclist-table" class="nav-back" width="99%">

    <thead>

      <tr>
        <th class="topmenu" align="center" valign="middle" width="50%">Task</th>
        <th class="topmenu" align="center" valign="middle" width="15%">Complete</th>
        <th class="topmenu" align="center" valign="middle" width="10%">Date</th>
        
       </tr>
     </thead> 
     <tbody> 
      {{foreach from=$taskData key="key" item="item"}}
       <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
      <td>{{$item.wt_task_name}} </td>
      <td>
       <form name ="recmet" method="post" action="">
     	<input type="hidden" name="yesno[{{$item.wt_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="yesno[{{$item.wt_id}}]" value="1"  onclick="this.form.submit();" {{if $item.wd_yes_no  eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
        </label>
       </form>
        
      </td>
      <td>{{if $item.wd_yes_no eq 1 }} {{$item.wd_date}} {{/if}} </td>
      

      </tr> 
      {{/foreach}}
     </tbody>
  </table>   
</div>
<br />
{{/if}}