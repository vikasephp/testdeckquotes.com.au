<div id="divbusinesscustomreInfoToReturn">

{{if $list}}

<input type="button" value="View Closed" onclick="requestddtimetrackerInfo(1,1);" />  
 
<table cellpadding="3" cellspacing="3" width="98%" id="list-table" >
	    <tr bgcolor="#CCCCCC">
            <th width="10%">Event</th>
            <th width="7%">Date Submitted</th>
            <th width="4%">Working Days</th>
            <th width="8%">Due Date</th>
            <th width="15%">Rule</th>
            <th width="5%">Alert</th>
            <th width="10%">Close</th>
            <th width="6%">Action</th>
         </tr>
         {{foreach from=$list key="key" item="item"}}
         <tr>
            
	    <td>{{$item.tt_event}}</td>
            <td>{{$item.tt_date_submitted|date_format:"%d-%m-%Y"}}</td>
            <td>{{$item.tt_working_days}}</td>
            <td>{{$item.tt_due_date}} </td>
           
            <td>{{$item.tt_rule}}</td>
            <td>{{$item.tt_alert}}</td>
            <td>
        <form name ="recmet" method="post" action="">
        <input type="hidden" name="close[{{$item.tt_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="close[{{$item.tt_id}}]" value="1"  onclick="this.form.submit();" {{if $item.tt_hide eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
        </label>
    	</form> 
            </td>
            
            
   <th><div align="left" style="width:100%;">
            <a href="javascript:iframe9('businessenquiers','{{$item.tt_id}}')" title="Edit">
                <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;
              
                <a href="javascript:parent.requesttimetrackerDelete({{$item.tt_id}});" onclick="javascript:if(!confirm('Are you sure you want to delete the Alert?')) return false;" title="Delete"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>
               
                </div>
            </th>
         </tr>
         {{/foreach}}	
	</table>
</div>
{{if $last > 1}} 
    <table width="90%" border="0" cellpadding="0" cellspacing="0">   
    <tr>  
  {{if $list}}   
<td align="center">

<div class='pagination'>
 {{if $pagenum == 1}}
 <span class='disabled'>&laquo; previous</span>
 {{else}}
<a class="pagination" href="javascript:requestproposalalertInfo({{math equation="x - y" x=$pagenum y=1}})" title="Previous">&laquo; previous</a>
 {{/if}}
        
{{if $pagenum != 1}}
 <span class="paginate"><a class="pagination"  href="javascript:requestproposalalertInfo(1{{if $opt}},'{{$opt}}' {{/if}})" title="{{$page_num}} Page">1</a></span>
 {{else}}<span class='current'>1</span>
 {{/if}}{{if $pagenum != 2}}
   <span class="paginate"><a class="pagination"  href="javascript:requestproposalalertInfo(2{{if $opt}},'{{$opt}}' {{/if}})" title="{{$page_num}} Page">2</a></span>
{{else}}<span class='current'>2</span>
 {{/if}}
{{if $paginateprev.0 > 3}}
...
{{/if}}
{{foreach from=$paginateprev key="page_key" item="page_num"}}
	{{if $page_num == $pagenum OR $page_num <= 2}}
   		{{elseif $page_num == $lastone}}
    
    	{{else}} <span class="paginate"><a class="pagination"  href="javascript:requestproposalalertInfo({{$page_num}}{{if $opt}},'{{$opt}}' {{/if}})" title="{{$page_num}} Page">{{$page_num}}</a></span>
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
                        <a class="pagination"  href="javascript:requestproposalalertInfo({{$page_num2}}{{if $opt}},'{{$opt}}' {{/if}})" title="{{$page_num2}} Page">{{$page_num2}}</a>
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
<a class="pagination"  href="javascript:requestproposalalertInfo({{$lastone}}{{if $opt}},'{{$opt}}' {{/if}})" title="{{$lastone}} Page">{{$lastone}}</a>
{{/if}}
{{/if}}
{{if $last == 1}}
{{elseif $last == 2}}
{{else}}
{{if $pagenum == $last}}
<span class='current'>{{$last}}</span>
{{else}}
 <a class="pagination"  href="javascript:requestproposalalertInfo({{$last}}{{if $opt}},'{{$opt}}' {{/if}})" title="{{$last}} Page">{{$last}}</a>
{{/if}}
{{/if}}
{{if $pagenum == $last}}
<span class='disabled'>next &raquo;</span>
 {{else}}
<a class="pagination" href="javascript:requestproposalalertInfo({{math equation="x + y" x=$pagenum y=1}}{{if $opt}},'{{$opt}}' {{/if}})" title="Next">next &raquo;</a></div>
 {{/if}}
</td>
{{else}}
<td align="center" height="300">Record Not found... </td>

{{/if}}
 </tr>
</table> 
{{/if}}
{{/if}}
</div>
</body>