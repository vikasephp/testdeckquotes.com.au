<style>

body{
	margin:0;
	color:#6a6f8c;
	font:600 16px/18px 'Open Sans',sans-serif;
}
*,:after,:before{box-sizing:border-box}
.clearfix:after,.clearfix:before{content:'';display:table}
.clearfix:after{clear:both;display:block}
a{color:inherit;text-decoration:none}

.hr{
	height:2px;
	margin:60px 0 50px 0;
	background:rgba(255,255,255,.2);
}
.foot-lnk{
	text-align:center;
}

.title {
 	text-align:center;
	font-size:24px;
	color:#FF3;
	margin-bottom:10px;
}
.set2 { font-size:10px !important; 
       width:60px !important; display:inline-block; 
	  padding-top:1px !important;
	  padding-bottom: 1px !important;
	  padding-left:1px !important;
	  height:25px !important; 
	  margin-top:7px;}
	  
#fancybox-wrap {z-index:9999999;} 

</style>

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
{{include file=$jdata}}
{{include file=$tiny_basic}}
<br />
<h3 class="page-title">{{$title}}</h3>
<br />

<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
				<th class="topmenu" align="center" valign="middle" width="5%">Sr. No.</th>  
				<th class="topmenu" align="center" valign="middle" width="15%">Project Address</th> 
				<th class="topmenu" align="center" valign="middle" width="10%">Multiple Projects</th>
				<th class="topmenu" align="center" valign="middle" width="5%">Status</th>
				<th class="topmenu" align="center" valign="middle" width="8%">Ref</th>
				<th class="topmenu" align="center" valign="middle" width="10%">Policy Number</th> 
				<th class="topmenu" align="center" valign="middle" width="7%">Value</th> 
				<th class="topmenu" align="center" valign="middle" width="7%">Open Date</th> 
				<th class="topmenu" align="center" valign="middle" width="7%">Close Date</th> 
				<th class="topmenu" align="center" valign="middle" width="10%">Certificate of Occupancy</th> 
				<th class="topmenu" align="center" valign="middle" width="10%">Home Warranty Certificate</th> 
				<th class="topmenu" align="center" valign="middle" width="5%">Public Status</th>
            </tr>
        </thead>
    <tbody>

 {{foreach from=$list key="key" item="item"}}

    <tr bgcolor="#FFFFFF">

		<td>{{$item.hw_id}}</td>
		<td>{{$item.hw_project_address|stripslashes}}</td> 
		<td>{{$item.hw_multiple_proj}}</td>
		<td>
			{{if $item.hw_status eq 1 }}Open{{else}}Close{{/if}}
		</td>
		<td>{{$item.hw_ref}}</td>
		<td>{{$item.hw_policy_num}}</td>
		<td>{{$item.hw_value}}</td>
		<td>{{$item.hw_open_date}}</td>
		<td>{{$item.hw_close_date}}</td>
		<td>
			{{if $item.document173}} 
			<!--<a href="/home_warranty_database.download_content?file_name={{$item.document173}}&module_name=home_warranty_database.home" >Download</a>-->
			<a href="/home_warranty_policy.download_content?file_name={{$item.document173}}&module_name=home_warranty_policy.home" >Download</a>
			{{/if}}
		</td>
		<td>
			{{if $item.document121}}
			<!--<a href="/home_warranty_database.download_content?file_name={{$item.document121}}&module_name=home_warranty_database.home" >Download</a><br/>-->
			<a href="/home_warranty_policy.download_content?file_name={{$item.document121}}&module_name=home_warranty_policy.home" >Download</a>
			{{/if}}
		</td>
		<td>
			<form name="recmet3" method="post" action="">
				<input type="hidden" name="public_status[{{$item.hw_id}}]" value="0" />
				<label class="switch">
					<input class="switch-input" type="checkbox" name="public_status[{{$item.hw_id}}]" value="1" onclick="this.form.submit();" {{if $item.hw_public_status eq 1 }} checked="checked" {{/if}}>
					<span class="switch-label" data-on="Open" data-off="Close"></span>
					<span class="switch-handle"></span> <br />
				</label>
			</form>
			{{if $item.hw_public_status eq 1 }}
				{{if $item.hw_public_status_user}}{{$item.hw_public_status_user}}<br/>{{/if}}
				{{if $item.hw_public_status_date}}{{$item.hw_public_status_date}}<br/>{{/if}}
			{{/if}}
		</td>
		
    </tr>  
  {{/foreach}}
  </tbody>
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
<a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{math equation='x - y' x=$pagenum y=1}}" title="Previous">&#171; previous</a>
 {{/if}}
        
{{if $pagenum != 1}}
 <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/1" title="{{$page_num}} Page">1</a></span>
 {{else}}<span class='current'>1</span>
 {{/if}}{{if $pagenum != 2}}
   <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/2" title="{{$page_num}} Page">2</a></span>
{{else}}<span class='current'>2</span>
 {{/if}}
{{if $paginateprev.0 > 3}}
...
{{/if}}
{{foreach from=$paginateprev key="page_key" item="page_num"}}
	{{if $page_num == $pagenum OR $page_num <= 2}}
   		{{elseif $page_num == $lastone}}
    
    	{{else}} <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$page_num}}" title="{{$page_num}} Page">{{$page_num}}</a></span>
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
                        <a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$page_num2}}" title="{{$page_num2}} Page">{{$page_num2}}</a>
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
<a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$lastone}}" title="{{$lastone}} Page">{{$lastone}}</a>
{{/if}}
{{/if}}
{{if $last == 1}}
{{elseif $last == 2}}
{{else}}
{{if $pagenum == $last}}
<span class='current'>{{$last}}</span>
{{else}}
 <a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$last}}" title="{{$last}} Page">{{$last}}</a>
{{/if}}
{{/if}}
{{if $pagenum == $last}}
<span class='disabled'>next &#187;</span>
 {{else}}
<a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{math equation="x + y" x=$pagenum y=1}}" title="Next">next &#187;</a></div>
 {{/if}}
</td>
{{else}}
<td align="center" height="300">Record Not found... </td>
{{/if}}
 </tr>
</table> 
{{/if}}
</div>