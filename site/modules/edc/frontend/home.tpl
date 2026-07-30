{{include file=$jdata}}
<h3 class="page-title">{{$title}}</h3>

<script>
function add_procedure()
{
	var viewurl = "{{$BASE_URL}}edc.view_procedure"+ "/random/" + Math.random();	

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

<table  width="100%"><tr><td>



<form name="mshort" action="" method="post">
<div style="float:left; text-align:left;">
&nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> <br />

<select name="employees" onchange="submit();">
					<option value="0">--Select Employee--</option>
	 				{{foreach from=$userData key="key" item="item"}}
                    <option value="{{$item.user_id}}" {{if $item.user_id == $mid}}selected{{/if}}>{{$item.user_name}}</option>
                    {{/foreach}}
</select>

<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Search:</strong>&nbsp;&nbsp;</span>
<input type="text" name="edc[keyword]" value="{{$keyword}}" style="width:400px;" placeholder="Search for document name"/>
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" value="Search" name="search"  />


 </div>
</form>
<div style="float:right;"> <input type="button" name="Add New " value="Add New" onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.detail}}');" /> 
<!--<a href="{{$BASE_URL}}{{$XFA.detail}}" class="various">Add </a>-->
</div>
</td></tr></table>
<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
               		<th class="topmenu" align="center" valign="middle" width="4%">UEDN</th>  
                    <th class="topmenu" align="center" valign="middle" width="35%">Document</th>   
            		<th class="topmenu" align="center" valign="middle" width="15%">When</th>  
                    <th class="topmenu" align="center" valign="middle" width="15%">Who </th>  
                    <!--<th class="topmenu" align="center" valign="middle" width="5%">Action</th> -->  
            </tr>
        </thead>
        <tbody>
        {{foreach from=$list key="key" item="item"}}
            <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
                <td>{{$item.edc_id}}</td>
                <td>
               <!-- <a href="https://deckquote.s3.amazonaws.com/files/employee_documents/{{$item.edc_document}}" target="_blank">{{$item.edc_document}}</a>-->
             <a href="/edc.download_content?file_name={{$item.edc_document}}&module_name=edc.home" target="_blank">{{$item.edc_document}}</a>    
                </td>
                <td>{{$item.edc_when}}</td>
                <td>{{$item.user_name}}</td>
                <!--<td><a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" class="various" title="Edit"><img style="height: 20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;<a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;"><img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png"/></a></td>-->
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