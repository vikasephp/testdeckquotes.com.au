<h3 class="page-title">{{$title}}</h3>
<script>
function submit_state()
{
	document.state_form.submit();
}
</script>


<div align="left">
<form action="{{$BASE_URL}}{{$XFA.list}}" method="post" name="state_form">
    <select name="get_state" onchange="submit_state()">
    {{foreach from=$state item=item  key=key}}
        <option value="{{$item.s_shortcodes}}"  {{if $state_shortcodes == $item.s_shortcodes}} selected="selected" {{/if}}>
        {{$item.s_shortcodes}} - {{$item.s_name}}
        </option>
    {{/foreach}}
    </select>
    {{foreach from=$state item=item  key=key}}
    	{{if $state_shortcodes == $item.s_shortcodes}}
      	 	 <a href="{{$BASE_URL}}{{$XFA.detail}}/s_id/{{$item.s_id}}" class="action">Edit</a>
        {{/if}}
    {{/foreach}}
</form>

</div>

<div align="center" style="color:#FF6633; font-weight:bold;">{{$msg}}</div>
<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
               		<th class="topmenu" align="center" valign="middle" width="6%">Id</th>    
       		  <th class="topmenu" align="center" valign="middle" width="23%"> Subhurb </th> 
                <th class="topmenu" align="center" valign="middle" width="16%"> Postal Code </th>  
              <th class="topmenu" align="center" valign="middle" width="20%"> State </th> 
              <th class="topmenu" align="center" valign="middle" width="22%"> District </th>            
              <th class="topmenu" align="center" valign="middle" width="13%">Action</th>   
          </tr>
        </thead>
       
        <tbody>
        {{foreach from=$list key="key" item="item"}}
            <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
             <td>{{counter}}</td>
                <td>{{$item.s_name}}</td>
                <td>{{$item.s_postal_code}}</td>
                <td>{{$item.s_parent_state}}</td>
                <td>{{$item.s_district}}</td>
                
                 <td><a href="{{$BASE_URL}}{{$XFA.suburb}}/{{$ID}}/{{$item.$ID}}"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;<a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}" onclick="javascript:if(!confirm('Are you sure you want to delete this entry??')) return false;"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a></td>
                
            </tr>
            
        {{/foreach}}
        </tbody>
    </table>
</div>
