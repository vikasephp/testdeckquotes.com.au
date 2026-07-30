<h3 class="page-title">{{$title}}</h3>
<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
            		<th class="topmenu" align="center" valign="middle" width="15%">Sr No.</th>  
               		<th class="topmenu" align="center" valign="middle" width="30%">Treated pine cost per sqm</th>    
                    <th class="topmenu" align="center" valign="middle" width="30%">Height catergory</th>  
                    <th class="topmenu" align="center" valign="middle" width="10%">Action</th>   
            </tr>
        </thead>       
        <tbody>
        {{foreach from=$list key="key" item="item"}}
            <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
             <td>{{counter}}</td>
             <td>{{$item.csf_tp_cost_per_sqm}}</td>
             <td>{{$item.csf_height_category}}</td>
      
                <td><a href="{{$BASE_URL}}{{$XFA.detail_subframe}}/csf_id/{{$item.csf_id}}">
                <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
                <a href="{{$BASE_URL}}{{$XFA.delete}}/csf_id/{{$item.csf_id}}" onclick="javascript:if(!confirm('Are you sure you want to delete this Listing?')) return false;"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>
                </td>
            </tr>
        {{/foreach}}
        </tbody>
    </table>
</div>