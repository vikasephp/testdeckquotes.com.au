<h3 class="page-title">{{$title}}</h3>
<script>
function submit_state()
{
	document.interest_form.submit();
}
</script>


<div align="left">
<form action="{{$BASE_URL}}{{$XFA.list}}" method="post" name="interest_form">
    <select name="get_main_interest" onchange="submit_state();">
    {{foreach from=$main_interest item=item  key=key}}
        <option value="{{$item.bi_id}}"  {{if $bi_parent == $item.bi_id}} selected="selected"{{/if}}>
        {{$item.bi_title}}
        </option>
    {{/foreach}}
    </select>
  	<a href="{{$BASE_URL}}{{$XFA.detail}}/bi_id/{{$bi_parent}}" class="action">Edit</a>
   
</form>
</div>

<div align="center" style="color:#FF6633; font-weight:bold;">{{$msg}}</div>
<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
              <th class="topmenu" align="center" valign="middle" width="6%">Id</th>    
       		  <th class="topmenu" align="center" valign="middle"> Title </th> 
              <th class="topmenu" align="center" valign="middle" width="8%"> Action </th> 
          </tr>
        </thead>
       
        <tbody>
        {{foreach from=$list key="key" item="item"}}
            <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
             <td>{{counter}}</td>
                <td>{{$item.bi_title}}</td>
                <td><a href="{{$BASE_URL}}{{$XFA.detail}}/bi_id/{{$item.$ID}}"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;<a href="{{$BASE_URL}}{{$XFA.delete}}/bi_id/{{$item.$ID}}" onclick="javascript:if(!confirm('Are you sure you want to delete this entry??')) return false;"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a></td>
            </tr>
            
        {{/foreach}}
        </tbody>
    </table>
</div>
