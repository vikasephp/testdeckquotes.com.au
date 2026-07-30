<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<base href="{{$BASE_URL}}" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<title>.:: {{$SITE_NAME}} - {{$title}} ::.</title>
</head>
<body>
<div id="divbusinesscustomreInfoToReturn">
<table cellpadding="3" cellspacing="3" width="100%" id="list-table" >
		<tr bgcolor="#CCCCCC"><th width="10%">Document Type</th><th width="10%">Status</th><th width="40%">FileName</th><th width="10%">Uploaded</th><th width="10%">User Name</th><th width="10%">Comment</th>	
        <th width="20%">Action</th></tr>
         {{foreach from=$list key="key" item="item"}}
         <tr>
         <td>{{$item.bd_type_name}}</td>
         <td>{{if $item.bd_status == 1}}Completed{{elseif $item.bd_status == 2}}Outstanding {{else}}Uploaded{{/if}}</td>
		 <td><a href="{{$BASE_URL}}files/business_docs/{{$item.bd_doc_name}}"  title="{{$item.bd_doc_name}}" target="_blank"><!--<img src="{{$BASE_URL}}files/business_docs/{{$item.bd_doc_name}}" width="30" alt="{{$item.bd_doc_name}}" />-->{{$item.bd_doc_name|default:"document must be saved before being displayed"}}</a></td>
         <th>{{$item.bd_uploaded_date|date_format}}</th>
         <th>{{$item.user_name}}</th>
         <td>{{$item.bd_comment}}</td>
            <th><a href="javascript:iframe4('docupload','{{$item.bd_id}}')" title="Edit">
                <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
                <a href="javascript:requestdocsDelete({{$item.bd_id}})" onclick="javascript:if(!confirm('Are you sure you want to delete the Document?')) return false;"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>
            </th></tr>
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
 <span class='disabled'>« previous</span>
 {{else}}
<a class="pagination" href="javascript:requestbusdocsInfo({{math equation="x - y" x=$pagenum y=1}})" title="Previous">« previous</a>
 {{/if}}
        
{{if $pagenum != 1}}
 <span class="paginate"><a class="pagination"  href="javascript:requestbusdocsInfo(1)" title="{{$page_num}} Page">1</a></span>
 {{else}}<span class='current'>1</span>
 {{/if}}{{if $pagenum != 2}}
   <span class="paginate"><a class="pagination"  href="javascript:requestbusdocsInfo(2)" title="{{$page_num}} Page">2</a></span>
{{else}}<span class='current'>2</span>
 {{/if}}
{{if $paginateprev.0 > 3}}
...
{{/if}}
{{foreach from=$paginateprev key="page_key" item="page_num"}}
	{{if $page_num == $pagenum OR $page_num <= 2}}
   		{{elseif $page_num == $lastone}}
    
    	{{else}} <span class="paginate"><a class="pagination"  href="javascript:requestbusdocsInfo({{$page_num}})" title="{{$page_num}} Page">{{$page_num}}</a></span>
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
                        <a class="pagination"  href="javascript:requestbusdocsInfo({{$page_num2}})" title="{{$page_num2}} Page">{{$page_num2}}</a>
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
<a class="pagination"  href="javascript:requestbusdocsInfo({{$lastone}})" title="{{$lastone}} Page">{{$lastone}}</a>
{{/if}}
{{/if}}
{{if $last == 1}}
{{elseif $last == 2}}
{{else}}
{{if $pagenum == $last}}
<span class='current'>{{$last}}</span>
{{else}}
 <a class="pagination"  href="javascript:requestbusdocsInfo({{$last}})" title="{{$last}} Page">{{$last}}</a>
{{/if}}
{{/if}}
{{if $pagenum == $last}}
<span class='disabled'>next »</span>
 {{else}}
<a class="pagination" href="javascript:requestbusdocsInfo({{math equation="x + y" x=$pagenum y=1}})" title="Next">next »</a></div>
 {{/if}}
</td>
{{else}}
<td align="center" height="300">Record Not found... </td>

{{/if}}
 </tr>
</table> 
{{/if}}
</div>
</body>