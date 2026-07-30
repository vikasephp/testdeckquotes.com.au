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
    </div>

<div>
<form name="ptype" method="post" action="">
<!--<select name="project">
<option value="0"> Show All </option>
{{foreach from = $projdata item="item" key="key" }}
<option value="{{$item.pt_id}}" {{if $item.pt_id == $pdt}} selected="selected" {{/if}}>{{$item.pt_name}}</option>
{{/foreach}}
</select>-->

<select name="ckecklisttype">
                <option value="0"> Show All </option>
                {{foreach from=$custom_dcl item=item key=key}}
                <option value="{{$key}}" {{if $clt == $key}} selected="selected" {{/if}}>{{$item}} </option>
                {{/foreach}}
            </select>
<input type="Submit" value="Show" name="psub" />
</form>
</div>
    <table id="list-table" class="nav-back" width="100%">

       <thead>
            <tr>
              <th class="topmenu" align="center" valign="middle" width="6%">Unique Id</th>  
              <th class="topmenu" align="center" valign="middle" width="40%">Name</th>     
              <th class="topmenu" align="center" valign="middle" width="10%">Documents</th> 
             <!-- <th class="topmenu" align="center" valign="middle" width="12%">Project Type</th> -->
              <th class="topmenu" align="center" valign="middle" width="18%">Check List Type</th> 
              <th class="topmenu" align="center" valign="middle" width="5%">Status</th>     
              <th class="topmenu" align="center" valign="middle" width="4%">Order</th>  
              <th class="topmenu" align="center" valign="middle" width="6%">Action</th>   
          </tr>
        </thead>

        <tbody>

        {{foreach from=$doc item="item" key="key"}}

            <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">

             <td>{{$item.admin_cdoc_id}}</td>
             <td>{{$item.admin_cdoc_name}}</td>
             <td>{{if !empty($item.admin_cdoc_manual)}}<a href="{{$BASE_URL}}{{$FILE_PATH}}files/document_check_list_files/{{$item.admin_cdoc_manual}}" target="_blank">View Document</a>{{/if}}</td>
			<!--<td>{{$item.pt_name}}</td>-->
            <td>{{$item.admin_cdoc_type}}</td>
             <td>{{if $item.admin_cdoc_status==1}} Activate {{else}} Deactivate {{/if}}</td>
             <td>{{$item.admin_cdoc_order}}</td>
			 <td>
                    <a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.admin_cdoc_id}}"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;<a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.admin_cdoc_id}}" onclick="javascript:if(!confirm('Are you sure you want to delete the doc?')) return false;"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>
               </td>
            </tr>
        {{/foreach}}
        </tbody>
    </table>
</div>