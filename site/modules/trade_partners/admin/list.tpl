<h3 class="page-title">{{$title}}</h3>
<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
               		<th class="topmenu" align="center" valign="middle" width="3%">Id</th>    
            		<th class="topmenu" align="center" valign="middle" width="20%">Partner Name</th> 
                    	<th class="topmenu" align="center" valign="middle" width="10%">Mobile</th> 
                        <th class="topmenu" align="center" valign="middle" width="10%">Email</th> 
                        <th class="topmenu" align="center" valign="middle" width="35%">Calendar Link</th> 
                        <th class="topmenu" align="center" valign="middle" width="15%">Calendar Reference</th> 
               		<th class="topmenu" align="center" valign="middle" width="7%">Action</th>   
            </tr>
        </thead>
       
        <tbody>
        {{foreach from=$list key="key" item="item"}}
            <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
             <td>{{counter}}</td>
                <td>{{$item.tp_name}}</td>
                <td>{{$item.tp_mobile}}</td>
                <td>{{$item.tp_email}}</td>
                <td>{{$item.tp_calendar}}</td>
		<td>{{$item.tp_cal_reference}}</td>
                <td>
                    <a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>
                    &nbsp;&nbsp;<a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}" onclick="javascript:if(!confirm('Are you sure you want to delete?')) return false;"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>
                </td>
            </tr>
            
        {{/foreach}}
        </tbody>
    </table>
</div>
