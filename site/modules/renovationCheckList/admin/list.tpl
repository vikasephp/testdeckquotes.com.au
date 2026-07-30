<script>
 function submit_form() { document.send_form.submit(); }
</script>

<h3 class="page-title">{{$title}}</h3>
<div id="">
  <div align="left">
    <div style="font-weight:bold; color:#FF6600;">{{$msg}}</div>
  </div>
  <table id="list-table" class="nav-back" width="100%">
    <form action="" name="search" method="post">
    <thead>
    <tr bgcolor="#FFFFFF"><th>Select Type</th>
        <td colspan="7"><select name="data[admin_doc_type]" onchange="submit();" >
                	<option value="0">-- Select All --</option>
                	{{foreach from=$project_type item=item key=key}}
					<option value="{{$item.pt_id}}" {{if $detail.admin_doc_type == $item.pt_id}} selected="selected" {{/if}}>{{$item.pt_name}}</option>
                    {{/foreach}} 
                </select>
        </td></tr>
      <tr>
       <th class="topmenu" align="center" valign="middle" width="4%">Sr. No.</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Unique Id</th>
        <th class="topmenu" align="center" valign="middle" width="40%">Name</th>
        <th class="topmenu" align="center" valign="middle" width="10%">Documents</th>
		<th class="topmenu" align="center" valign="middle" width="15%">Type</th>
        <th class="topmenu" align="center" valign="middle" width="10%">Status</th>
        <th class="topmenu" align="center" valign="middle" width="10%">Order</th>
        <th class="topmenu" align="center" valign="middle" width="10%">Action</th>
      </tr>
    </thead>
   </form> 
    <tbody>
    {{foreach from=$doc item="item" key="key"}}
    <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
    <td>{{counter}}</td>
      <td>{{$item.admin_doc_id}}</td>
      <td>{{$item.admin_doc_name}}</td>
      <td>{{if !empty($item.admin_doc_manual)}}<a href="{{$BASE_URL}}{{$FILE_PATH}}files/document_check_list_files/{{$item.admin_doc_manual}}" target="_blank">View Document</a>{{/if}}</td>
      <td>{{$item.pt_name}}</td>
      <td>{{if $item.admin_doc_status==1}} Active {{else}} Inactive {{/if}}</td>
      <td>{{$item.admin_doc_order}}</td>
      <td><a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.admin_doc_id}}"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;<a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.admin_doc_id}}" onclick="javascript:if(!confirm('Are you sure you want to delete the doc?')) return false;"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a> </td>
    </tr>
    {{/foreach}}
    </tbody>
    
  </table>
</div>