<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<base href="{{$BASE_URL}}" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<title>.:: {{$SITE_NAME}} - {{$title}} ::.</title>

</head>
<body bgcolor="#63C1DB">
<div id="divbyerInfoToReturn">
<table cellpadding="3" cellspacing="3" border="1" width="90%" id="list-table" >
		<tr><th>Created Date</th><th>Status</th><th>Business</th><th>Initial Phone Call</th><th>Sent Dossier</th><th>Email Advice To Seller</th><th>Answer Required</th><th>Action</th></tr>
         {{foreach from=$list key="key" item="item"}}
         <tr><th>{{$item.bsn_name}}</th><th>{{$item.bsn_name}}</th><th>{{$item.bsn_name}}</th><th>{{$item.bsn_name}}</th><th>{{$item.bsn_name}}</th><th>{{$item.bsn_name}}</th><th>{{$item.bsn_name}}</th><th><a href="javascript:requestbyerDetail({{$item.be_id}})">
                <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
                <a href="javascript:requestbyerDelete({{$item.be_id}})" onclick="javascript:if(!confirm('Are you sure you want to delete the Enquiry?')) return false;"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a></th></tr>
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
<a class="pagination" href="javascript:requestbyerInfo({{math equation="x - y" x=$pagenum y=1}})" title="Previous">« previous</a>
 {{/if}}
        
{{if $pagenum != 1}}
 <span class="paginate"><a class="pagination"  href="javascript:requestbyerInfo(1)" title="{{$page_num}} Page">1</a></span>
 {{else}}<span class='current'>1</span>
 {{/if}}{{if $pagenum != 2}}
   <span class="paginate"><a class="pagination"  href="javascript:requestbyerInfo(2)" title="{{$page_num}} Page">2</a></span>
{{else}}<span class='current'>2</span>
 {{/if}}
{{if $paginateprev.0 > 3}}
...
{{/if}}
{{foreach from=$paginateprev key="page_key" item="page_num"}}
	{{if $page_num == $pagenum OR $page_num <= 2}}
   		{{elseif $page_num == $lastone}}
    
    	{{else}} <span class="paginate"><a class="pagination"  href="javascript:requestbyerInfo({{$page_num}})" title="{{$page_num}} Page">{{$page_num}}</a></span>
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
                        <a class="pagination"  href="javascript:requestbyerInfo({{$page_num2}})" title="{{$page_num2}} Page">{{$page_num2}}</a>
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
<a class="pagination"  href="javascript:requestbyerInfo({{$lastone}})" title="{{$lastone}} Page">{{$lastone}}</a>
{{/if}}
{{/if}}
{{if $last == 1}}
{{elseif $last == 2}}
{{else}}
{{if $pagenum == $last}}
<span class='current'>{{$last}}</span>
{{else}}
 <a class="pagination"  href="javascript:requestbyerInfo({{$last}})" title="{{$last}} Page">{{$last}}</a>
{{/if}}
{{/if}}
{{if $pagenum == $last}}
<span class='disabled'>next »</span>
 {{else}}
<a class="pagination" href="javascript:requestbyerInfo({{math equation="x + y" x=$pagenum y=1}})" title="Next">next »</a></div>
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