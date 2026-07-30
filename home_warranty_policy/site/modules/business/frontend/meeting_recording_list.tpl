
<div id="divbusinesscustomreInfoToReturn">
{{if $list}}
<table cellpadding="3" cellspacing="3" width="98%" id="list-table" >
	    <tr bgcolor="#CCCCCC">
            <th width="6%">Action</th>
            <th width="7%">Date of Meeting</th>
            <th width="30%">Recording</th>
            <th width="15%">Attendees</th>
            <th width="10%">Detail</th>
            <th width="10%">Download Notes</th>
            <th width="10%">File Link</th>
            <th width="10%">Type</th>
         </tr>
         {{foreach from=$list key="key" item="item"}}
         <tr>
            <th><div align="left" style="width:100%;">
            <a href="javascript:iframe7('businessenquiers','{{$item.rm_id}}')" title="Edit">
                <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;
                {{if $USER_GROUP == 'Administrators'}}
                <a href="javascript:parent.requestrmDelete({{$item.rm_id}});" onclick="javascript:if(!confirm('Are you sure you want to delete the recorded file?')) return false;" title="Delete"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>
                {{/if}}
                </div>
            </th>
			<td>{{$item.rm_date}}</td>
            <td><a href = "{{$BASE_URL}}files/recorded_meetings/{{$item.rm_original_file}}" target="_blank">{{$item.rm_meeting_file}}</td>
            <td>{{$item.rm_owner}}</td>
        <!-- <td><a href="javascript:parent.modelview_mr('{{$item.rm_id}}');" title="Quick View"> View Detail </a></td>-->
         <td>{{$item.rm_detail}} </td>
         <td>    {{if $item.rm_scribed_file}}
         
    <a href = "{{$BASE_URL}}files/recorded_meetings/{{$item.rm_scribed_file}}" target="_blank"><img src="{{$BASE_URL}}images/download.png"  /></a> 
    {{else}}
    No File
    {{/if}}</td>
    
    <td>{{if $item.rm_file_location}} <a href="{{$item.rm_file_location}}" target="_blank">Link</a>{{/if}} </td>
    <td> {{$item.rm_type}} </td>
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
<a class="pagination" href="javascript:requestrecordedmeetingInfo({{math equation="x - y" x=$pagenum y=1}})" title="Previous">&laquo; previous</a>
 {{/if}}
        
{{if $pagenum != 1}}
 <span class="paginate"><a class="pagination"  href="javascript:requestrecordedmeetingInfo(1{{if $opt}},'{{$opt}}' {{/if}})" title="{{$page_num}} Page">1</a></span>
 {{else}}<span class='current'>1</span>
 {{/if}}{{if $pagenum != 2}}
   <span class="paginate"><a class="pagination"  href="javascript:requestrecordedmeetingInfo(2{{if $opt}},'{{$opt}}' {{/if}})" title="{{$page_num}} Page">2</a></span>
{{else}}<span class='current'>2</span>
 {{/if}}
{{if $paginateprev.0 > 3}}
...
{{/if}}
{{foreach from=$paginateprev key="page_key" item="page_num"}}
	{{if $page_num == $pagenum OR $page_num <= 2}}
   		{{elseif $page_num == $lastone}}
    
    	{{else}} <span class="paginate"><a class="pagination"  href="javascript:requestrecordedmeetingInfo({{$page_num}}{{if $opt}},'{{$opt}}' {{/if}})" title="{{$page_num}} Page">{{$page_num}}</a></span>
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
                        <a class="pagination"  href="javascript:requestrecordedmeetingInfo({{$page_num2}}{{if $opt}},'{{$opt}}' {{/if}})" title="{{$page_num2}} Page">{{$page_num2}}</a>
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
<a class="pagination"  href="javascript:requestrecordedmeetingInfo({{$lastone}}{{if $opt}},'{{$opt}}' {{/if}})" title="{{$lastone}} Page">{{$lastone}}</a>
{{/if}}
{{/if}}
{{if $last == 1}}
{{elseif $last == 2}}
{{else}}
{{if $pagenum == $last}}
<span class='current'>{{$last}}</span>
{{else}}
 <a class="pagination"  href="javascript:requestrecordedmeetingInfo({{$last}}{{if $opt}},'{{$opt}}' {{/if}})" title="{{$last}} Page">{{$last}}</a>
{{/if}}
{{/if}}
{{if $pagenum == $last}}
<span class='disabled'>next &raquo;</span>
 {{else}}
<a class="pagination" href="javascript:requestrecordedmeetingInfo({{math equation="x + y" x=$pagenum y=1}}{{if $opt}},'{{$opt}}' {{/if}})" title="Next">next &raquo;</a></div>
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