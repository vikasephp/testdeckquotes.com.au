<h3 class="page-title">{{$title}}</h3>
<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
               		<th class="topmenu" align="center" valign="middle" width="5%">Id</th>  
                    <th class="topmenu" align="center" valign="middle" width="15%">Customer Name</th>   
            		<th class="topmenu" align="center" valign="middle" width="20%">Project Name</th>   
                    <th class="topmenu" align="center" valign="middle" width="30%">Project Status</th> 
                    <th class="topmenu" align="center" valign="middle" width="10%">Question</th> 
                    <th class="topmenu" align="center" valign="middle" width="15%">Answer</th>           
                    <th class="topmenu" align="center" valign="middle" width="5%">Action</th>   
            </tr>
        </thead>
        <tbody>
        {{foreach from=$list key="key" item="item"}}
            <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
             <td>{{counter}}</td>
                <td>{{$item.cqa_customer_name}}</td>
                <td>{{$item.cqa_project_name}}</td>
                <td>{{$item.sp_website}}</td>
                <td>{{$item.sp_status}}</td>
                <td>{{$item.sp_timestamp|date_format:"%m-%d-%Y"}}</td>
                <td>
                    <a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;<a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}" onclick="javascript:if(!confirm('Are you sure you want to delete the Category?')) return false;"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>
                </td>
            </tr>  
        {{/foreach}}
        </tbody>
    </table>
</div>