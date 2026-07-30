<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />

{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
//window.location.href = "{{$BASE_URL}}da_builder.home";
</script>
{{/if}}

<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
    <h3 class="page-title">Report Builder</h3>    
   
   
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="task[rt_id]" value="{{$detail.rt_id}}" />
   
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
    <tr>
     <th>Project Address</th>
     <td>	
     <datalist id='project'>
           {{foreach from=$projdetail key="key3" item="item3"}}
            <option value="{{$item3.rt_project_address}}" {{if $bsnid eq $item3.bsn_id}} selected="selected" {{/if}}>
            {{$item3.rt_project_address}}
            </option>
            {{/foreach}}
  	 </datalist>
         <input type="text" list = 'project' name="task[rt_project_address]" style ="width:700px" value="{{$detail.rt_project_address}}" />
      </td>
      </td>
    </tr>
   
   <tr>
     <th>Order</th>
     <td>
          <input type="text"  name="task[rt_order]" style ="width:700px" value="{{$detail.rt_order}}" />
      </td>
    </tr>
   
   <tr>
     <th>Specifications</th>
     <td><textarea cols="150" rows="5" name="task[rt_specification]">{{$detail.rt_specification}}</textarea>  </td>
    </tr>
   
   <tr>
     <th>Status</th>
     <td>
          <input type="text"  name="task[rt_status_2]" style ="width:700px" value="{{$detail.rt_status_2}}" />
      </td>
    </tr>
   
   
    <tr>
     <th>Critria</th>
     <td>
          <input type="text"  name="task[rt_criteria]" style ="width:700px" value="{{$detail.rt_criteria}}" />
      </td>
    </tr>
     
     <tr>
     <th>Statement</th>
     <td>
          <input type="text"  name="task[st_statement]" style ="width:700px" value="{{$detail.st_statement}}" />
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
		//window.location.href = "{{$BASE_URL}}da_builder.home";
		}
	</script>
    
	<script type="text/javascript" language="javascript" >
      	var frmvalidator  = new Validator("detail");
		frmvalidator.EnableMsgsTogether();
		frmvalidator.addValidation("task[wt_task_name]","req", "Please specify task.");
	</script>
</div>