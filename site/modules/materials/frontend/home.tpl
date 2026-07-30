{{include file=$jdata}}
<h3 class="page-title">{{$title}}</h3>
<table  width="100%"><tr><td>
<div style="float:right;"> <input type="button" name="Add New " value="Add New" onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.detail}}');" /> </div>
</td></tr></table>
<div id="">
    <table id="list-table" class="nav-back" width="100%">
               <thead>
            <tr>
               		<th class="topmenu" align="center" valign="middle" width="5%">Id</th>   
            		<th class="topmenu" align="center" valign="middle" width="70%">Title</th>   
                    <th class="topmenu" align="center" valign="middle" width="10%">Status</th> 
                    <th class="topmenu" align="center" valign="middle" width="10%">Created Date</th>           
                    <th class="topmenu" align="center" valign="middle" width="5%">Action</th>   
            </tr>
        </thead>
        <tbody>
        {{foreach from=$list key="key" item="item"}}
            <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
             <td>{{counter}}</td>
                <td>{{$item.mr_name}}</td>
                <td>{{$item.mr_status}}</td>
                <td>{{$item.mr_timestamp|date_format:"%m-%d-%Y"}}</td>
                <td><a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" class="various" title="Edit"><img style="height: 20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;<a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;"><img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png"/></a></td>
            </tr>  
        {{/foreach}}
        </tbody>
    </table>
</div>