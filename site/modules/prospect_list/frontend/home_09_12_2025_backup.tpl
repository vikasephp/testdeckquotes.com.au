{{include file=$jdata}}
{{include file=$tiny_basic}}		
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

<h3 class="page-title">{{$title}}</h3>

<script type="application/javascript">
function add()
{
	var viewurl = "{{$BASE_URL}}prospect_list.detail";	
	
 	$(document).ready(function () {

        $.fancybox({

				'width': '90%',
				'height': '85%',
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
function add_procedure()
{
	var viewurl = "{{$BASE_URL}}prospect_list.view_procedure"+ "/random/" + Math.random();	

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
<div style="float:left; text-align:left;">
&nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> <br />
<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Search:</strong>&nbsp;&nbsp;</span>
<input type="text" name="{{$TABLE}}[keyword]" value="{{$keyword}}" style="width:400px;" placeholder="Search for Address Or Suburb Or Owner Name Or Email Address "/>
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" value="Search" name="search"  />
 </div>

<div style="float:right;"> 
<!--<input type="button" name="Add New " value="Add New" onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.detail}}');" />-->
<input type="submit" name="showall" value="Show Hidden" /> 
<input type="button" name="Add New " value="Add New" onclick="javascript:add();" />

</form>
 </div>

<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
                <th class="topmenu" align="center" valign="middle" width="2%">Id</th>   
                   <th class="topmenu" align="center" valign="middle" width="12%">Address</th>   
            	   <th class="topmenu" align="center" valign="middle" width="4%">Block</th>   
                   <th class="topmenu" align="center" valign="middle" width="4%">Section</th> 
                   <th class="topmenu" align="center" valign="middle" width="5%">Suburb</th> 
                   <th class="topmenu" align="center" valign="middle" width="10%">Owner Name</th>  
                   <th class="topmenu" align="center" valign="middle" width="5%">Contact Number</th>
                   <th class="topmenu" align="center" valign="middle" width="7%">Email Address</th>
				   <th class="topmenu" align="center" valign="middle" width="7%">MSTeams Link</th>
                   <!--<th class="topmenu" align="center" valign="middle" width="7%">Sales Introduction</th>--> 
                   <th class="topmenu" align="center" valign="middle" width="5%">Inspection Report</th> 
                   <th class="topmenu" align="center" valign="middle" width="7%">Management Agreement </th> 
                   <th class="topmenu" align="center" valign="middle" width="20">Air BNB Link</th> 
                   <th class="topmenu" align="center" valign="middle" width="8">Extra Doc</th> 
                   
                   <th class="topmenu" align="center" valign="middle" width="6">Hide Record</th>
                    <th class="topmenu" align="center" valign="middle" width="5%">Action</th>   
            </tr>
        </thead>
<tbody>
 {{foreach from=$list key="key" item="item"}}

     <tr bgcolor="#FFFFFF">

    <td>{{$item.pl_id}}</td>
    <td>{{$item.pl_address}}</td> 
    <td>{{$item.pl_block}}</td>
    <td>{{$item.pl_section}}</td>
    <td>{{$item.pl_subrub}}</td>
    <td>{{$item.pl_owner_name}}</td>
    <td>{{$item.pl_contact_number}}</td>
    <td>{{$item.pl_email_address}}</td>
	
	<td style="text-align:center;">
		{{if $item.pl_msteams_link}}
		<a href="{{$item.pl_msteams_link}}" target="_blank">Link</a>
		{{/if}}
	</td>
    
    <!--<td>{{if $item.pl_sales_intro}}
    <a href="/prospect_list.download_content?file_name={{$item.pl_sales_intro}}&module_name=prospect_list.home" >Download</a>
    {{/if}}</td>-->
	
    <td>{{if $item.pl_sales_prop}}
    <a href="/prospect_list.download_content?file_name={{$item.pl_sales_prop}}&module_name=prospect_list.home" >Download</a>
    <!--<a href="https://deckquote.s3.amazonaws.com/files/prospect_list/{{$item.pl_sales_prop}}" target="_blank">Download</a> -->
    {{/if}}</td>
    <td>{{if $item.pl_mana_agree}}
    <a href="/prospect_list.download_content?file_name={{$item.pl_mana_agree}}&module_name=prospect_list.home" >Download</a>
   <!-- <a href="https://deckquote.s3.amazonaws.com/files/prospect_list/{{$item.pl_mana_agree}}" target="_blank">Download</a> -->
    {{/if}}</td>
    <td>{{$item.pl_air_bnb_link}}</td>
    <td> 
    {{if $item.pl_extra_doc_1}} 
         <a href="/prospect_list.download_content?file_name={{$item.pl_extra_doc_1}}&module_name=prospect_list.home" >Download</a>
         <!-- <a href="https://deckquote.s3.amazonaws.com/files/prospect_list/{{$item.pl_extra_doc_1}}" target="_blank">Download</a> -->
    {{/if}}
    {{if $item.pl_extra_doc_2}}
         <a href="/prospect_list.download_content?file_name={{$item.pl_extra_doc_2}}&module_name=prospect_list.home" >Download</a>
         <!-- <a href="https://deckquote.s3.amazonaws.com/files/prospect_list/{{$item.pl_extra_doc_2}}" target="_blank">Download</a> -->
    {{/if}}
    {{if $item.pl_extra_doc_3}}
         <a href="/prospect_list.download_content?file_name={{$item.pl_extra_doc_3}}&module_name=prospect_list.home" >Download</a>
         <!-- <a href="https://deckquote.s3.amazonaws.com/files/prospect_list/{{$item.pl_extra_doc_3}}" target="_blank">Download</a> -->
    {{/if}}
    {{if $item.pl_extra_doc_4}}
         <a href="/prospect_list.download_content?file_name={{$item.pl_extra_doc_4}}&module_name=prospect_list.home" >Download</a>
         <!-- <a href="https://deckquote.s3.amazonaws.com/files/prospect_list/{{$item.pl_extra_doc_4}}" target="_blank">Download</a> -->
    {{/if}}
    {{if $item.pl_extra_doc_5}}
         <a href="/prospect_list.download_content?file_name={{$item.pl_extra_doc_5}}&module_name=prospect_list.home" >Download</a>
         <!-- <a href="https://deckquote.s3.amazonaws.com/files/prospect_list/{{$item.pl_extra_doc_5}}" target="_blank">Download</a> -->
    {{/if}}
    {{if $item.pl_extra_doc_6}}
         <a href="/prospect_list.download_content?file_name={{$item.pl_extra_doc_6}}&module_name=prospect_list.home" >Download</a>
         <!-- <a href="https://deckquote.s3.amazonaws.com/files/prospect_list/{{$item.pl_extra_doc_6}}" target="_blank">Download</a> -->
    {{/if}}
    {{if $item.pl_extra_doc_7}}
         <a href="/prospect_list.download_content?file_name={{$item.pl_extra_doc_7}}&module_name=prospect_list.home" >Download</a>
         <!-- <a href="https://deckquote.s3.amazonaws.com/files/prospect_list/{{$item.pl_extra_doc_7}}" target="_blank">Download</a> -->
    {{/if}}
    </td>
    <td>
      <form name ="recmet2" method="post" action="">
     	<input type="hidden" name="hide[{{$item.pl_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="hide[{{$item.pl_id}}]" value="1"  onclick="this.form.submit();" {{if $item.pl_hide eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       
        </label> 
      </form>  
        </td>

    <td style="color:#000;"><a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" class="various" title="Edit">
    <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
    <a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete">
    <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>&nbsp;&nbsp
    <!--<a href="{{$BASE_URL}}queans.viewqa/{{$ID}}/{{$item.$ID}}" class="various" title="View">
    <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/viewqa.png"/></a>-->
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