<h3 class="page-title">Auto Email Text Task</h3>
<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
               	    <th class="topmenu" align="center" valign="middle" width="7%">Sr No</th>
                    <th class="topmenu" align="center" valign="middle" width="8%">Task Id</th>    
                    <th class="topmenu" align="center" valign="middle" width="75%">Subject</th>  
                    <th class="topmenu" align="center" valign="middle" width="10%">Action</th>   
            </tr>
        </thead>
       
        <tbody>
        {{foreach from=$list key="key" item="item"}}
            <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
             <td>{{counter}}</td>
             <td>{{$item.au_task_uid}}</td>    
             <td>{{$item.au_subject}}</td>          
             <td>
                    <a href="{{$BASE_URL}}business_status_taskAdmin.auto_email_text_task/au_id/{{$item.au_id}}"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>
                    &nbsp;&nbsp;<a href="{{$BASE_URL}}business_status_taskAdmin.delete_auto_email/au_id/{{$item.au_id}}" onclick="javascript:if(!confirm('Are you sure you want to delete?')) return false;"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>
             </td>
            </tr>
            
        {{/foreach}}
        </tbody>
    </table>
</div>
