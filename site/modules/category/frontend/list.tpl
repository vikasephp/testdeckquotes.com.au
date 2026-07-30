<h3 class="page-title">{{$title}}</h3>


<div id="">
    <table id="list-table" class="nav-back" width="90%">
        <thead>
            <tr>
               		<th class="topmenu" align="center" valign="middle" width="10%">Id</th>    
            		<th class="topmenu" align="center" valign="middle" width="25%">Name</th>           
                    <th class="topmenu" align="center" valign="middle" width="10%">Action</th>   
            </tr>
        </thead>
       
        <tbody>
        {{foreach from=$list key="key" item="item"}}
            <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
             <td>{{counter}}</td>
                <td><span class="level-{{$item.cat_level}}">{{$item.cat_name}}</span></td>
                <td>
                    <a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.cat_id}}"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;<a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.cat_id}}" onclick="javascript:if(!confirm('Are you sure want to delete this Post?')) return false;"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>
                </td>
            </tr>
            
        {{/foreach}}
        </tbody>
    </table>
</div>
