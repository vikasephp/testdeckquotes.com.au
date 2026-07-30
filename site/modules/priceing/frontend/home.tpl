{{include file=$jdata}}
<h3 class="page-title">{{$title}}</h3>
<table  width="100%"><tr><td>
<div style="float:left">
    <form name="detail" method="post" action="">
<strong>Select Type:- </strong>&nbsp;
					<select name="{{$TABLE}}[jp_type]" class="lrg" onchange="submit();" />
                    <option value="0" {{if $detail.jbo_parent == 0}} selected {{/if}}>-- Select --</option> 
                    {{foreach from=$parents key="key" item="item"}}
                    <option value="{{$item.jbo_id}}" {{if $item.jbo_id == $detail.jp_type}} selected {{/if}}>{{$item.jbo_title}}</option>
                    {{/foreach}}
                    </select>     
            &nbsp;&nbsp;&nbsp;
       		<strong>Select Sub Type:- </strong>&nbsp;
       				<select name="{{$TABLE}}[jp_subtype]" class="lrg" onchange="submit();"/>
                    <option value="0" {{if $detail.jbo_subparent == 0}} selected {{/if}}>-- Select --</option> 
 					{{foreach from=$subparents key="key" item="item"}}
                    <option value="{{$item.jbo_id}}" {{if $item.jbo_id == $detail.jp_subtype}} selected {{/if}}>{{$item.jbo_title}}</option>
                    {{/foreach}}
                    </select>                 
</form>                    
</div>
<div style="float:right;"> <input type="button" name="Add New " value="Add New" onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.detail}}');" /> </div>
</td></tr></table>
<div id="">
  <table id="list-table" class="nav-back" width="100%">
  <tr>
{{foreach from=$options key="key" item="item"}}
<th class="topmenu" align="center" valign="middle">{{$item.jbo_title}}</th>
{{/foreach}}
<th class="topmenu" align="center" valign="middle">Project Cost</th>
<th class="topmenu" align="center" valign="middle" width="25%">Notes</th>
<th class="topmenu" align="center" valign="middle">Action</th>
</tr>
 {{foreach from=$lists key="key" item="item"}}
<tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">

        {{foreach from=$list key="key1" item="item1"}}
 		{{if $item.jp_id == $item1.jp_id}}	
                <td>{{$item1.jpd_opt_data}}</td>
		
   		{{/if}}
             {{/foreach}} 
           <td>{{$item.jp_id}}</td>    
           <td>{{$item.jp_notes}}</td>   
          <td><a href="{{$BASE_URL}}{{$XFA.detail}}/jp_id/{{$item1.jp_id}}" class="various" title="Edit"><img style="height: 20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;<a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;"><img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png"/></a></td>       
            </tr>  
        {{/foreach}}

    </table>
</div>