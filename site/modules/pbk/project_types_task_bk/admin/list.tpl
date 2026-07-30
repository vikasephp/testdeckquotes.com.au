<script>
 function submit_form()
 {
 	document.send_form.submit();
 }
</script>

<h3 class="page-title">{{$title}}</h3>
<div id="">
<div align="left">
<div style="font-weight:bold; color:#FF6600;">{{$msg}}</div>
<form action="{{$BASE_URL}}{{$XFA.list}}" method="post" name="send_form">
	<select name="cbs" onchange="javascript:submit_form();" >
    	{{foreach from=$allbusiness_status item=item key=key}}
        	<option value="{{$item.pt_id}}" {{if $cbs_id == $item.pt_id}} selected="selected" {{/if}}>{{$item.pt_name}}</option>
        {{/foreach}}
    </select>
</form>
</div>
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
              <th class="topmenu_list" align="center" valign="middle" width="15%"><div align="center">Action</div></th> 
           	  <th class="topmenu_list"  valign="middle" width="11%"><div align="center">Project Type</div></th>   
       		  <th class="topmenu_list" align="center" valign="middle" width="35%"><div align="center">Task Name</div></th>     
              <th class="topmenu_list" align="center" valign="middle" width="12%"><div align="center">Required Documents</div></th> 
              <th class="topmenu_list" align="center" valign="middle" width="11%"><div align="center">Required Image Type</div></th>     
              <th class="topmenu_list" align="center" valign="middle" width="11%"><div align="center">Required Data Field</div></th>   
              <th class="topmenu_list" align="center" valign="middle" width="11%"><div align="center">Authorization Area</div></th>
              <th class="topmenu_list" align="center" valign="middle" width="11%"><div align="center">Assign Status</div></th>
              <th class="topmenu_list" align="center" valign="middle" width="5%"><div align="center">Sequence</div></th>                          
          </tr>
        </thead>
       
        <tbody>
        {{foreach from=$task item="item" key="key"}}
            <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
                  <td><a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.bst_id}}" title="Edit"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;<a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.bst_id}}" title="Delete" onclick="javascript:if(!confirm('Are you sure you want to delete the Task?')) return false;"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>
    &nbsp;<a href="{{$BASE_URL}}{{$XFA.list}}/cbs/{{$cbs_id}}/up/{{$item.bst_order}}" title="Move Up"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/arrowup.png"/></a>
    &nbsp;<a href="{{$BASE_URL}}{{$XFA.list}}/cbs/{{$cbs_id}}/down/{{$item.bst_order}}" title="Move Down"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/arrowdown.png"/></a>
             </td>
             <td>{{$item.pt_name}}</td>
             <td>{{$item.bst_task_name}}</td>
             <td>{{if !empty($item.bst_document)}}<a href="{{$BASE_URL}}{{$FILE_PATH}}files/task_files/{{$item.bst_document}}" target="_blank">View Document</a>{{/if}}</td>
             <td>{{if $item.bst_rit == 1}}Main Image {{elseif $item.bst_rit == 2}} Other Image{{else}} {{/if}}</td>
             <td>{{$item.df_name}}</td>
             <td>{{$item.autha_name}}</td>
             <td>{{if $item.bst_status == 1}}Yes{{else}}No{{/if}}</td>
             <td>{{$item.bst_order}}</td>
       
            </tr>
            
        {{/foreach}}
        </tbody>
    </table>
</div>
