
<h3 class="page-title">{{$title}}</h3>

<div class="left"><input type="button" value="Add Image" class="button" onclick="document.location.href='{{$BASE_URL}}{{$XFA.detail}}';" class="sml" /></div><br />


<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
            		<th class="topmenu" align="center" valign="middle">Id</th>
                    <th class="topmenu" align="center" valign="middle">Title</th> 
                     <th class="topmenu" align="center" valign="middle">Page</th>                   
                    <th class="topmenu" align="center" valign="middle">Action</th>
                   
               
            </tr>
        </thead>
       
        <tbody>
        {{foreach from=$list key="key" item="item"}}
      
			
				
            <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
                <td><span>{{$item.img_id}}</span></td>
                <td><img src="{{$BASE_URL}}upload/{{$item.img_path}}" height="150" width="200" /></td>
                {{if $item.img_set_id == 1 }}
                 <td>Home</td>
                 {{elseif $item.img_set_id == 2}}
                 <td>Staff</td>
                 {{/if}}
                <td>
                    <a href="{{$BASE_URL}}{{$XFA.detail}}/img_id/{{$item.img_id}}"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="{{$BASE_URL}}{{$XFA.delete}}/img_id/{{$item.img_id}}" onclick="javascript:if(!confirm('Are you sure you want to delete the Page?')) return false;"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>
                </td>
            </tr>
            
        {{/foreach}}
        </tbody>
    </table>
</div>


