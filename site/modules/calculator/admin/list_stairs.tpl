<h3 class="page-title">{{$title}}</h3>
<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
            		<th class="topmenu" align="center" valign="middle" width="15%">Id.</th>  
               		  
                    <th class="topmenu" align="center" valign="middle" width="30%">Status</th>  
                    <th class="topmenu" align="center" valign="middle" width="10%">Action</th>   
            </tr>
        </thead>       
        <tbody>
        {{foreach from=$list key="key" item="item"}}
            <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
             <td>{{$item.cst_id}}</td>
     
             <td>{{if $item.cst_status == 1}} Active {{else}} InActive {{/if}} </td>
      
                <td><a href="{{$BASE_URL}}{{$XFA.detail_stairs}}/cst_id/{{$item.cst_id}}">
                <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
                <a href="{{$BASE_URL}}{{$XFA.delete}}/cst_id/{{$item.cst_id}}" onclick="javascript:if(!confirm('Are you sure you want to delete this Listing?')) return false;"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>
                </td>
            </tr>
        {{/foreach}}
        </tbody>
    </table>
</div>