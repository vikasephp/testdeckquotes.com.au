<h3 class="page-title">Project Status Task Delete Log</h3> <br />
<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
               		<th class="topmenu" align="center" valign="middle" width="4%">Sr No</th>
                    <th class="topmenu" align="center" valign="middle" width="8%">Task Id</th>     
            		<th class="topmenu" align="center" valign="middle" width="40%">Task Name</th> 
                    <th class="topmenu" align="center" valign="middle" width="25%">Delete By (User)</th>  
                    <th class="topmenu" align="center" valign="middle" width="15%">Date</th>             
                   <!-- <th class="topmenu" align="center" valign="middle" width="8%">Action</th> -->  
            </tr>
        </thead>
       
        <tbody>
        {{foreach from=$list key="key" item="item"}}
            <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
             <td>{{counter}}</td>
             <td>{{$item.tdl_bst_id}}</td>
             <td>{{$item.tdl_task_name}}</td>
             <td>{{$item.tdl_user}}</td>
             <td>{{$item.tdl_date}}</td>
             <!--<td>
                    <a href="{{$BASE_URL}}business_status_taskAdmin.qa_add/ps_id/{{$item.ps_id}}"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>
                    &nbsp;&nbsp;<a href="{{$BASE_URL}}{{$XFA.delete_psqa}}/ps_id/{{$item.ps_id}}" onclick="javascript:if(!confirm('Are you sure you want to delete?')) return false;"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>
             </td>-->
            </tr>
            
        {{/foreach}}
        </tbody>
    </table>
</div>
