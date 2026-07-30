<h3 class="page-title">{{$title}}</h3>
<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
            		<th class="topmenu" align="center" valign="middle" width="15%">Sr No.</th>  
               		<th class="topmenu" align="center" valign="middle" width="50%">Total Lineral Meter</th>    
                    <th class="topmenu" align="center" valign="middle" width="10%">Action</th>   
            </tr>
        </thead>       
        <tbody>
        {{foreach from=$list key="key" item="item"}}
            <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
             <td>{{counter}}</td>
             
             <td> {{$item.cw_total_lineal_meters}}</td>
      
                <td><a href="{{$BASE_URL}}{{$XFA.detail_wrapping}}/cw_id/{{$item.cw_id}}">
                <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
                <a href="{{$BASE_URL}}{{$XFA.delete}}/cw_id/{{$item.cw_id}}" onclick="javascript:if(!confirm('Are you sure you want to delete this Listing?')) return false;"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>
                </td>
            </tr>
        {{/foreach}}
        </tbody>
    </table>
</div>