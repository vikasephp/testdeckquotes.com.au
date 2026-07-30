<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

{{include file=$jdata}}
{{include file=$tiny_basic}}		
<h3 class="page-title">Contacts</h3>

<script type="application/javascript">
function show_notes(coid)
{
	var viewurl = "{{$BASE_URL}}companies.show-notes-content"+ "/co_id/" + coid;	
	
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

<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
<!--<div style="float:left;">

<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Search:</strong>&nbsp;&nbsp;</span>
<input type="text" name="{{$TABLE}}[keyword]" value="{{$keyword}}" style="width:400px;" placeholder="Search for any fields"/>
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" value="Search" name="search"  />
 </div>-->

<div style="float:right; margin-right:20px;"> 
<input type="button" name="Add New " value="Add New" onclick="javascript:add_new('{{$BASE_URL}}companies.contacts_detail');" />
</div>
</form>

<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
                   <th class="topmenu" align="center" valign="middle" width="7%">Category</th> 
                   <th class="topmenu" align="center" valign="middle" width="7%">Company</th>   
                   <th class="topmenu" align="center" valign="middle" width="7%">Positions</th>   
            	   <th class="topmenu" align="center" valign="middle" width="7%">First Name</th>   
                   <th class="topmenu" align="center" valign="middle" width="7%">Surname</th> 
                   <th class="topmenu" align="center" valign="middle" width="6%">Landline</th>  
                   <th class="topmenu" align="center" valign="middle" width="6%">Mobile</th> 
                   
                   <th class="topmenu" align="center" valign="middle" width="5%">Emergency</th>
                   <th class="topmenu" align="center" valign="middle" width="6%">Primary Email</th> 
                   <th class="topmenu" align="center" valign="middle" width="5%">Secondary Email</th>  
                   
                   <th class="topmenu" align="center" valign="middle" width="5%">Notes</th> 
                   <th class="topmenu" align="center" valign="middle" width="5%">Cal. Link</th>   
                   <th class="topmenu" align="center" valign="middle" width="5%">Address</th>  
                   <th class="topmenu" align="center" valign="middle" width="5%">Responsible Status</th>
                   <th class="topmenu" align="center" valign="middle" width="6%">Action</th>   
            </tr>
        </thead>
<tbody>
 {{foreach from=$list key="key" item="item"}}

     <tr bgcolor="#FFFFFF">

    <td>{{$item.co_categry}}</td>	
    <td>{{$item.co_company_name}}</td>
    <td>{{$item.to_option|default:'Others'}}</td> 
    <td>{{$item.cs_first_name}} </td>
    <td>{{$item.cs_surname}}</td>
    <td>{{$item.cs_landline}}</td>
    <td>{{$item.cs_mobile}}</td>
    
    <td>{{$item.cs_emergency}}</td>

    <td>{{$item.cs_primary_email}}</td> 
    <td>{{$item.cs_secondary_email}}</td> 
    <td><input type="button" name="View Notes" value="View  Notes" onclick="javascript:show_notes({{$item.co_id}});" style="width:90px; height:20px; font-size:11px; line-height:17px !important; padding:0px !important" /></td> 
    <td>{{$item.cs_calendar_link}}</td> 
    <td>{{$item.cs_address}}</td> 
    <td>{{$item.co_resp_status}}</td> 
    <td style="color:#000;"><a href="{{$BASE_URL}}companies.contacts_detail/cs_id/{{$item.cs_id}}" class="various" title="Edit">
    <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
    <a href="{{$BASE_URL}}companies.delete_contact/cs_id/{{$item.cs_id}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete">
    <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>&nbsp;&nbsp
   
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