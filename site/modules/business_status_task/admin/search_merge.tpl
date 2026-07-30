<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>

<div align="center">
   <h3 class="page-title">Print Task List - Project</h3><br /><br />    
    <form name="detail" method="post" action="" enctype="multipart/form-data">
        <table id="list-table" width="90%" >
            <input type="hidden" name="data[bst_id]" value="{{$detail.bst_id}}" />
          
           <tr>
         
           <th width="20%">Responsible Position:</th>
           <td width="80%">
              <select name="data[bst_posid]" class="lrg">
                	<option value="">-- Select --</option>
            {{foreach from=$positions item=item key=key}}
            <option value="{{$item.p_id}}" {{if $detail.bst_posid == $item.p_id}} selected="selected" {{/if}}>{{$item.p_name}}</option>
            {{/foreach}}</select>
            </td>
          </tr>
          
          
          
            <tr>
                <th width="20%">Project Status:</th>
                <td width="80%">
          <select name="data[bst_business_status_id]" class="lrg">
          <option value="">-- Select --</option>
          {{foreach from=$busness_status item=item key=key}}
		  <option value="{{$item.st_id}}" {{if $detail.bst_business_status_id == $item.st_id OR $current_bst_business_status_id == $item.st_id}} selected="selected" {{/if}}>{{$item.st_name}}</option>		          {{/foreach}}
          </select>
              </td>
          </tr>


            <tr>
                <th>Task UID:</th>
                <td><input type="text" name="data[bst_task_id]" value="{{if $detail.bst_task_id != 0}}{{$detail.bst_task_id}}{{else}}{{$detail.bst_id}}{{/if}}" class="lrg" />
                	<span>{{$bst_tasks_error}}</span>
                </td>
            </tr>

   
              
           <tr><td colspan="2" height="20px">&nbsp;</td></tr>
            <tr>
                <td colspan="2" style="text-align:center;">
                    <input type="submit" name="subAddDetail" value="Print Task List" style="width:200px;" />
    
                </td>
            </tr>
        </table>
    </form>
</div>

<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("detail");
    frmvalidator.EnableMsgsTogether();
   // frmvalidator.addValidation("data[bst_business_status_id]","req", "Please Select Business Status");
	// frmvalidator.addValidation("data[bst_task_name]","req", "Please specify Task Name");	
</script>