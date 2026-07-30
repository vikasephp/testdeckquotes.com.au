<h3 class="page-title">{{$title}}</h3>
<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
            		<th class="topmenu" align="center" valign="middle" width="5%">Sr No.</th>  
               		<th class="topmenu" align="center" valign="middle" width="15%">Decking Option Type</th>    
                    <th class="topmenu" align="center" valign="middle" width="20%">Cost Per SQM/Lineal Meter - Material</th>  
                    <th class="topmenu" align="center" valign="middle" width="20%">Cost Per SQM/Lineal Meter - Labour - Team</th>  
                    <th class="topmenu" align="center" valign="middle" width="20%">Cost Per SQM/Lineal Meter - Labour - Indvidual</th>  
                    <th class="topmenu" align="center" valign="middle" width="6%">Status</th>  
                    <th class="topmenu" align="center" valign="middle" width="8%">Action</th>   
            </tr>
        </thead>       
        <tbody>
        {{foreach from=$list key="key" item="item"}}
            <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
             <td>{{counter}}</td>
             
             <td> {{if $item.cd_type_id==1}} 84mm - 90mm {{elseif $item.cd_type_id==2}} 135mm {{elseif $item.cd_type_id==3}} 65mm {{/if}}</td>
      		 <td>{{$item.cd_cost_per_sqm_lm_material}} </td>
             <td>{{$item.cd_cost_per_sqm_lm_labour_team}} </td>
             <td>{{$item.cd_cost_per_sqm_lm_labour_indvidual}} </td>
      		 <td>{{$item.cd_status}} </td>
                <td><a href="{{$BASE_URL}}{{$XFA.detail}}/cd_id/{{$item.cd_id}}">
                <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
                <a href="{{$BASE_URL}}{{$XFA.delete}}/cd_id/{{$item.cd_id}}" onclick="javascript:if(!confirm('Are you sure you want to delete this Listing?')) return false;"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>
                </td>
            </tr>
        {{/foreach}}
        </tbody>
    </table>
</div>