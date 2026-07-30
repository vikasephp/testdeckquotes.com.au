<div class="newdiv">
<h3 class="page-title">{{$title}}</h3>
<table id="product-table" align="center" width="100%">
	<form name="section" action="{{$BASE_URL}}{{$XFA.list}}" method="post">
  	<tr><th class="labelhead" width="10%">Section:</th><td><select name="{{$TABLE}}[et_section]" onchange="submit();" style="width:540px;">
    							<option value=""> -- Select section --</option>
                                {{foreach from=$section key="key" item="item"}}
   								 <option value="{{$item.emt_id}}" {{if $sec_id == $item.emt_id}} selected="selected" {{/if}}>{{$item.emt_name}}</option>
                                {{/foreach}}
  </select></td></tr>
  </form>
</table>
<table id="list-table" width="100%" >
     	<tr>
               <th class="topmenu" align="center" valign="middle" width="2%"> No.</th>
                <th class="topmenu" align="center" valign="middle" width="20%"> Name</th>
                 <th class="topmenu" align="center" valign="middle" width="35%"> Title</th>
               <!-- <th class="topmenu" align="center" valign="middle" width="20%"> Section</th>-->
                 <th class="topmenu" align="center" valign="middle" width="5%"> Status</th>
                <th class="topmenu" align="center" valign="middle" width="5%">Action</th>
        </tr>
    {{foreach from=$list key="key" item="item"}}
    {{if $item.user_id!='1'}}
    <tr>
    	<td class="text2" align="left">{{counter}}</td>
        <td class="text2" align="left">{{if $sec_id == 2}}{{$item.st_name}} <br />- {{$item.bst_task_name}} {{else}} {{$item.et_name|truncate:"200"}}{{/if}}</td>
          <td class="text2" align="left">{{$item.et_subject}}</td>
        <!-- <td class="text2" align="left">{{$item.emt_name}}</td>-->
         <td class="text2" align="left">{{if $item.et_status == 1}}<span style="color:#009900;">Active</span>{{else}}<span style="color: #FF0000;">Inactive</span>{{/if}}</td>
        <td align="left">
        			<a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" title="View"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a> &nbsp;
         
            		<a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}" title="Delete" onclick="javascript:if(!confirm('Are you sure you want to delete?')) return false;"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>
		</td>
    </tr>
    {{/if}}
    {{/foreach}}
</table>
{{if $last > 1}} 
    <table width="90%" border="0" cellpadding="0" cellspacing="0">   
    <tr>  
  {{if $list}}   
<td align="center">

 <div class='pagination'>
 {{if $pagenum == 1}}
 <span class='disabled'>&#171; previous</span>
 {{else}}
<a class="pagination" href="{{$BASE_URL}}{{$XFA.list}}/pagenum/{{math equation="x - y" x=$pagenum y=1}}" title="Previous">&#171; previous</a>
 {{/if}}
        
{{if $pagenum != 1}}
 <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.list}}/pagenum/1" title="{{$page_num}} Page">1</a></span>
 {{else}}<span class='current'>1</span>
 {{/if}}{{if $pagenum != 2}}
   <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.list}}/pagenum/2" title="{{$page_num}} Page">2</a></span>
{{else}}<span class='current'>2</span>
 {{/if}}
{{if $paginateprev.0 > 3}}
...
{{/if}}
{{foreach from=$paginateprev key="page_key" item="page_num"}}
	{{if $page_num == $pagenum OR $page_num <= 2}}
   		{{elseif $page_num == $lastone}}
    
    	{{else}} <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.list}}/pagenum/{{$page_num}}" title="{{$page_num}} Page">{{$page_num}}</a></span>
        {{/if}}
        {{/foreach}}

{{foreach from=$paginatenext key="page_key" item="page_num2"}}
  	{{if $page_num2 < $last AND $page_num2 != $lastone}}
    			{{if $page_num2 == 1}}
                {{elseif $page_num2 == 2}}
                {{else}}
                    {{if $page_num2 == $pagenum OR $page_num2 <= 0}}
                            <span class='current'> {{$page_num2}}</span>
                    {{else}}
                        <a class="pagination"  href="{{$BASE_URL}}{{$XFA.list}}/pagenum/{{$page_num2}}" title="{{$page_num2}} Page">{{$page_num2}}</a>
                     {{/if}}
                {{/if}}     
    {{/if}}
{{/foreach}}
{{if $page_num2 < $lasttow}}
...
{{/if}}
{{if $lastone == 1}}
{{elseif $lastone == 2}}
{{else}}
{{if $pagenum == $lastone }}
<span class='current'>{{$lastone}}</span>
{{else}}
<a class="pagination"  href="{{$BASE_URL}}{{$XFA.list}}/pagenum/{{$lastone}}" title="{{$lastone}} Page">{{$lastone}}</a>
{{/if}}
{{/if}}
{{if $last == 1}}
{{elseif $last == 2}}
{{else}}
{{if $pagenum == $last}}
<span class='current'>{{$last}}</span>
{{else}}
 <a class="pagination"  href="{{$BASE_URL}}{{$XFA.list}}/pagenum/{{$last}}" title="{{$last}} Page">{{$last}}</a>
{{/if}}
{{/if}}
{{if $pagenum == $last}}
<span class='disabled'>next &#187;</span>
 {{else}}
<a class="pagination" href="{{$BASE_URL}}{{$XFA.list}}/pagenum/{{math equation="x + y" x=$pagenum y=1}}" title="Next">next &#187;</a></div>
 {{/if}}
</td>
{{else}}
<td align="center" height="300">Record Not found... </td>

{{/if}}
 </tr>
</table> 
{{/if}}
</div>
