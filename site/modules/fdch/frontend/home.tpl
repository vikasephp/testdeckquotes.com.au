    {{include file=$jdata}}
{{include file=$tiny_basic}}		
<h3 class="page-title">{{$title}}</h3>

<script language="javascript">
function add_procedure()
{
	var viewurl = "{{$BASE_URL}}fdch.view_procedure"+ "/random/" + Math.random();	

 	$(document).ready(function () {

        $.fancybox({

				'width': '90%',
				'height': '99%',
				'autoScale': false,
				 'transitionIn' : 'elastic',
				 'transitionOut' : 'elastic',
				 'speedIn' : 300,
				 'speedOut' : 300,
				 'overlayShow' : true,
				 'overlayColor' : '#000',
				 'hideOnOverlayClick':false,
				 'hideOnContentClick':false,
				 'type': 'iframe',
				 'href': viewurl,
				 'scrolling': 'yes' 
        });
      });
}
</script>
<style>
#fancybox-wrap {z-index:9999999;} 
</style>



<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
<div style="float:left; text-align: left;">
<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> <br />
<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Search:</strong>&nbsp;&nbsp;</span>
<input type="text" name="{{$TABLE}}[keyword]" value="{{$keyword}}" style="width:400px;" placeholder="Search for Project Name Or Document Name"/>
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" value="Search" name="search"  />
 </div>
<div style="float:right">
<strong>Sort Order</strong>
<select name="sortorder">
<option value="1"> Ascending </option>
<option value="2"> Descending </option>
</select>
<strong>Sort By :</strong>
<input type="submit" value="Uploaded Date" name="upd"  />
<input type="submit" value="Cover Letter Attached" name="cla"  />
<input type="submit" value="Email To Client" name="etc"  />
<input type="submit" value="Posted To Client" name="ptc"  />
</div>

</form>
 </div>

<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
                <th class="topmenu" align="center" valign="middle" width="2%">Sr</th>   
                   <th class="topmenu" align="center" valign="middle" width="18%">Project Name</th>   
            	   <th class="topmenu" align="center" valign="middle" width="20%">Document Name</th>   
                   <th class="topmenu" align="center" valign="middle" width="10%">File Name</th> 
                   <th class="topmenu" align="center" valign="middle" width="8%">When Uploaded</th> 
                   <th class="topmenu" align="center" valign="middle" width="8%">Who Uploaded</th>  
                   <th class="topmenu" align="center" valign="middle" width="7%">Cover Letter Attached</th>
                   <th class="topmenu" align="center" valign="middle" width="6%">Email To Client</th>     
                   <th class="topmenu" align="center" valign="middle" width="6%">Posted To Client</th> 
                   <th class="topmenu" align="center" valign="middle" width="6%">Upload To WWW</th>    
                   <th class="topmenu" align="center" valign="middle" width="6%">Q/ED</th>           
            </tr>
        </thead>
<tbody>
 {{foreach from=$list key="key" item="item"}}

     <tr bgcolor="#FFFFFF">

    <td>{{counter}}</td>
    <td>{{$item.bsn_name}}</td> 
    <td>{{$item.bd_type}}</td>
    <td>{{if $item.bd_doc_name}}
       <a href="/fdch.download_content?file_name={{$item.bd_doc_name}}&module_name=fdch.home" >Download</a>
       <!--  <a href= "{{$BASE_URL}}files/business_documents/{{$item.bd_doc_name}}" target="_blank">Download</a> -->
         {{/if}}
    </td>
    <td>{{$item.bd_uploaded_date}}</td>
    <td>{{$item.user_name}}</td>
    <td>{{if $item.bd_cover_letter  eq 1 }} Yes : {{$item.bd_cover_letter_date}}  <br /> 
         {{$item.bd_cover_user}} {{else}} No {{/if}}
    </td>
    <td>{{if $item.bd_emailed_client  eq 1 }} Yes : {{$item.bd_emailed_client_date}} <br />
    {{$item.bd_emailed_user}} {{else}} No {{/if}} </td>

    <td>{{if $item.bd_posted_client  eq 1 }} Yes : {{$item.bd_posted_client_date}} <br /> {{$item.bd_posted_user}} {{else}} No {{/if}}</td>
    <td>{{if $item.bd_www  eq 1 }} Yes {{else}} No {{/if}}</td> 
    <td>{{if $item.bd_qed  eq 1 }} Yes {{else}} No {{/if}}</td> 
    
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
<a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{math equation="x - y" x=$pagenum y=1}}" title="Previous">&#171; previous</a>
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