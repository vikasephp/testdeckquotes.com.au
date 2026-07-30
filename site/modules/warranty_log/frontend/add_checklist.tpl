<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

{{if $opr}}
<script type="text/javascript">
//setTimeout('parent.close_win();', 500);
window.location.href = "{{$BASE_URL}}warranty_log.view_checklist";
</script>
{{/if}}

<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
    <h3 class="page-title">Add/Edit New Task</h3>    
   
   
<form name="detail" method="post" action="{{$XFA.add_task}}"  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="task[wc_id]" value="{{$detail.wc_id}}" />
   
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
    <tr>
     <th>Task Name </th>
     <td>
          <input type="text"  name="task[wc_task_name]" style ="width:700px" value="{{$detail.wc_task_name}}" />
      </td>
    </tr>
   
    <tr>
     <th>Task Description </th>
     <td>
          <input type="text"  name="task[wc_task]" style ="width:700px" value="{{$detail.wc_task}}" />
      </td>
    </tr>
   
     <tr>
     <th>Email Code</th>
     <td>
          <datalist id='email'>
           {{foreach from=$emailcode key="key2" item="item2"}}
            <option value="{{$item2.eml_code}}">
            {{$item2.eml_code}}
            </option>
            {{/foreach}}
  	   </datalist>

<input type="text" list = 'email' name="task[wc_email]" style ="width:150px" value="{{$item.wc_email}}"  />
      </td>
    </tr>
   
   
    <tr>
     <th>Link To Procedure </th>
     <td>
          <input type="text"  name="task[wc_link]" style ="width:700px" value="{{$detail.wc_link}}" />
      </td>
    </tr>
  
   <tr>
     <th>Order</th>
     <td>
          <input type="text"  name="task[wc_order]" style ="width:700px" value="{{$detail.wc_order}}" />
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
		window.location.href = "{{$BASE_URL}}warranty_log.view_checklist";
		}
	</script>
    
	<script type="text/javascript" language="javascript" >
        var frmvalidator  = new Validator("detail");
			frmvalidator.EnableMsgsTogether();
			frmvalidator.addValidation("task[wt_task_name]","req", "Please specify task.");
			
    </script>
</div>