


<!--<div class="left"><input type="button" value="Add Page" class="button" onclick="document.location.href='{{$BASE_URL}}{{$XFA.detail}}';" class="sml" /></div><br />-->


<div class="newdiv">
<h3 class="page-title">{{$title}}</h3>
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
            		<th class="topmenu" align="center" valign="middle">Title</th>
                    <th class="topmenu" align="center" valign="middle">Id</th>                   
                    <th class="topmenu" align="center" valign="middle">Action</th>
                   
               
            </tr>
        </thead>
       
        <tbody>
        {{foreach from=$list key="key" item="item"}}
      
			
				
            <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
                <td><span class="level-{{$item.page_level}}">{{$item.page_title}}</span></td>
                <td>{{$item.page_id}}</td>
                <td>
                    <a href="{{$BASE_URL}}{{$XFA.detail}}/page_id/{{$item.page_id}}"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;<a href="{{$BASE_URL}}{{$XFA.delete}}/page_id/{{$item.page_id}}" onclick="javascript:if(!confirm('Are you sure you want to delete the Page?')) return false;"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>
                </td>
            </tr>
            
        {{/foreach}}
        </tbody>
    </table>
</div>


