<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

<script src="{{$BASE_URL}}ckeditor2/ckeditor.js"></script>
	<script src="{{$BASE_URL}}ckeditor2/samples/js/sample.js"></script>

	<script type="text/javascript">
           CKEDITOR.replace( 'editor1' );
           CKEDITOR.add  
        </script>

<script>
		!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>


{{if $opr}}
<script type="text/javascript">
//setTimeout('parent.close_win();', 500);

window.location.href = "{{$BASE_URL}}quote_management_report.view_component";
</script>
{{/if}}

<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
    <h3 class="page-title">Add/Edit New component</h3>    
   
   
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="component[qb_id]" value="{{$detail.qb_id}}" />
   
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
    <tr>
     <th>Component Name</th>
     <td>
          <input type="text"  name="component[qb_component]" style ="width:700px" value="{{$detail.qb_component}}" />
      </td>
    </tr>
	
	<tr>
     <th>Component Procedure</th>
     <td>
          <input type="text" name="component[qb_component_procedure_link]" style ="width:700px" value="{{$detail.qb_component_procedure_link}}" />
      </td>
    </tr>
   
   <tr>
     <th>Due Date</th>
     <td>
          <input type="text"  name="component[qb_due_date_week]" style ="width:70px" value="{{$detail.qb_due_date_week}}" /> &nbsp;Weeks &nbsp;
          <select  name="component[qb_due_date_sod]"/> 
          <option value="1" {{if $detail.qb_due_date_sod eq 1}} selected="selected"{{/if}}>Before</option>
          <option value="2" {{if $detail.qb_due_date_sod eq 2}} selected="selected"{{/if}}>After</option>
          </select>&nbsp;SOD
      </td>
    </tr>
	
	<tr>
		<th>Email Link</th>
		<td>
			<select  name="component[qb_email_code]"/>
				<option value="">Please Select Email Code</option>
			{{foreach from=$data_email_code key="key_ec" item="item_ec"}} 
				<option value="{{$item_ec.eml_id}}" {{if $detail.qb_email_code eq $item_ec.eml_id}}selected="selected"{{/if}}>
				{{$item_ec.eml_code}}
				</option>
			{{/foreach}}
			</select>
      </td>
	</tr>
     
     <tr>
     <th>Responsible Staff</th>
     <td>
		  {{assign var="full_val" value=$detail.qb_sup_position|cat:' - '|cat:$detail.qb_sup_name}}
          <select  name="component[qb_res_staff]"/> 
          {{foreach from=$datacon key="key" item="item"}} 
		  {{assign var="data_val2" value=$item.cs_position|cat:' - '|cat:$item.cs_primary_email}}
          <option value="{{$item.cs_position}} - {{$item.cs_primary_email}}" {{if $full_val eq $data_val2}} selected="selected"{{/if}}>
          {{$item.cs_position}} - {{$item.cs_primary_email}}</option>
          {{/foreach}}
          </select>
      </td>
    </tr>  
        
    <tr>
   <th>Default Message</th>
   <td> 
     <textarea rows="5" cols="100" name="component[qb_default_message]" id="editor1" class="ckeditor">{{$detail.qb_default_message}}</textarea>
   
   
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
		//setTimeout('parent.close_win();', 500);
		window.location.href = "{{$BASE_URL}}quote_management_report.view_component";
		}
	</script>
    
	<script type="text/javascript" language="javascript" >
        var frmvalidator  = new Validator("detail");
			frmvalidator.EnableMsgsTogether();
			frmvalidator.addValidation("task[wt_task_name]","req", "Please specify task.");
			
    </script>
</div>