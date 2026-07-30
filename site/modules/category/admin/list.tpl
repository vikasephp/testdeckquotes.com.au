<h3 class="page-title">{{$title}}</h3>
<div align="right" class="cat-title">Total Main Categories :&nbsp;<span>{{$totalmaincat}}</span> &nbsp; Total Categories :&nbsp;<span>{{$totalcat}}</span></div>

<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
               		<th class="topmenu" align="center" valign="middle" width="10%">Id</th>    
            		<th class="topmenu" align="center" valign="middle" width="50%">Title</th>   
                    <th class="topmenu" align="center" valign="middle" width="20%">Created Date</th>           
                    <th class="topmenu" align="center" valign="middle" width="10%">Action</th>   
            </tr>
        </thead>
       
        <tbody>
        {{foreach from=$list key="key" item="item"}}
            <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
             <td>{{counter}}</td>
                <td><span class="level-{{$item.cat_level}}">{{$item.cat_title}}</span></td>
                <td>{{$item.cat_date_created}}</td>
                <td>
                    <a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.cat_id}}"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;<a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.cat_id}}" onclick="javascript:if(!confirm('Are you sure you want to delete the Category?')) return false;"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>
                </td>
            </tr>
            
        {{/foreach}}
        </tbody>
    </table>
</div>
