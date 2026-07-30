<h3 class="page-title">{{$title}}</h3>
<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
               		<th class="topmenu" align="center" valign="middle" width="5%">Id</th>  
                    <th class="topmenu" align="center" valign="middle" width="10%">Image</th>   
            		<th class="topmenu" align="center" valign="middle" width="30%">Title</th>  
                    <th class="topmenu" align="center" valign="middle" width="20%">Weblink</th>  
                    <th class="topmenu" align="center" valign="middle" width="10%">Supplier</th> 
                    <th class="topmenu" align="center" valign="middle" width="10%">Brand</th>
                    <th class="topmenu" align="center" valign="middle" width="5%">Status</th> 
                    <th class="topmenu" align="center" valign="middle" width="15%">Date</th>           
                    <th class="topmenu" align="center" valign="middle" width="5%">Action</th>   
            </tr>
        </thead>
        <tbody>
        {{foreach from=$list key="key" item="item"}}
            <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
             <td>{{counter}}</td>
                <td>{{if $item.ms_image}}<img src="{{$BASE_URL}}files/suppliers/materials/thumb/{{$item.ms_image}}" width="80">{{/if}}</td>
                <td>{{$item.mr_name}}</td>
                <td><a href="{{$item.ms_link}}" target="_blank">{{$item.ms_link}}</a></td>
                <td>{{if $item.sp_logo}}<img src="{{$BASE_URL}}files/suppliers/logo/{{$item.sp_logo}}" width="100">{{/if}}<br />{{$item.sp_name}}</td>
                <td>{{if $item.br_logo}}<img src="{{$BASE_URL}}files/suppliers/brandslogo/{{$item.br_logo}}" width="100">{{/if}}<br />{{$item.br_name}}</td>
                <td>{{$item.ms_status}}</td>
                <td>{{$item.ms_timestamp|date_format:"%m-%d-%Y"}}</td>
                <td>
                    <a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;<a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}" onclick="javascript:if(!confirm('Are you sure you want to delete the Category?')) return false;"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>
                </td>
            </tr>  
        {{/foreach}}
        </tbody>
    </table>
</div>