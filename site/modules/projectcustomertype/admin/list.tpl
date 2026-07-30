<div class="newdiv">
<h3 class="page-title">{{$title}}</h3>
<table id="list-table" width="100%" >
     <tr>
     	        <th class="topmenu" align="center" valign="middle" width="2%"> No.</th>
                <th class="topmenu" align="center" valign="middle"> Project Customer Type</th>
               <th class="topmenu" align="center" valign="middle" width="10%">Action</th>
    </tr>
    {{foreach from=$list key="key" item="item"}}
    {{if $item.user_id!='1'}}
    <tr>
    	<td class="text2" align="left">{{counter}}</td>
        <td class="text2" align="left">{{$item.pct_title}}</td>
             <td align="left">
        			<a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" title="View"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a> &nbsp;
         
            		<a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}" title="Delete" onclick="javascript:if(!confirm('Are you sure you want to delete?')) return false;"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>
		</td>
    </tr>
    {{/if}}
    {{/foreach}}
</table>
</div>
