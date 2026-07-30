<h3 class="page-title">{{$title}}</h3>
<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
            		<th class="topmenu" align="center" valign="middle" width="4%">Sr No</th>  
               		<th class="topmenu" align="center" valign="middle" width="20%">Business Name</th>    
            		<th class="topmenu" align="center" valign="middle" width="20%"> Website Listed In </th>  
                    <th class="topmenu" align="center" valign="middle" width="45%"> Adv Link </th>           
                    <th class="topmenu" align="center" valign="middle" width="7%">Action</th>   
            </tr>
        </thead>       
        <tbody>
        {{foreach from=$list key="key" item="item"}}
            <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
             <td>{{counter}}</td>
             <td>{{$item.bsn_name}}</td>
             <td>{{$item.soe_name}}</td>
             <td>{{$item.sl_link|strip}}</td>   
                
                <td><a href="{{$BASE_URL}}{{$XFA.detail}}/sl_id/{{$item.sl_id}}">
                <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
                <a href="{{$BASE_URL}}{{$XFA.delete}}/sl_id/{{$item.sl_id}}" onclick="javascript:if(!confirm('Are you sure you want to delete this Listing?')) return false;"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>
                </td>
            </tr>
 
        {{/foreach}}
        </tbody>
    </table>
</div>
