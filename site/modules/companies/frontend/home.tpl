<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

{{include file=$jdata}}
{{include file=$tiny_basic}}		
<h3 class="page-title">{{$title}}</h3>

<style>
#fancybox-wrap {z-index:9999999;} 

</style>


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

function add_procedure()
{
	var viewurl = "{{$BASE_URL}}companies.view_procedure"+ "/random/" + Math.random();	

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

function add_category()
{
	var viewurl = "{{$BASE_URL}}companies.view_category"+ "/random/" + Math.random();	

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
<div style="float:left; text-align:left;">
&nbsp; &nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> 
&nbsp;<input type="button" name="catg_panel" value="Category Options" onclick="javascript:add_category();" /> 
<br />
<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Search:</strong>&nbsp;&nbsp;</span>
<input type="text" name="{{$TABLE}}[keyword]" value="{{$keyword}}" style="width:400px;" placeholder="Search for any fields"/>
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" value="Search" name="search"  />
 </div>

<script type="text/javascript">

function close_win()
	{
	$.fancybox.close();
	window.location.reload();
	}
	
</script>

<div style="float:right; margin-right:20px;"> 
<input type="submit" name="showinactive" value ="Show Inactive" />
 <input type="button" value="Export To XLS" onclick="document.location.href='{{$BASE_URL}}{{$XFA.home}}/export/1'" /> &nbsp;
<input type="button" name="Add New " value="Add New" onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.detail}}');" />
</div>
</form>

<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
                 
                   <th class="topmenu" align="center" valign="middle" width="10%">Category</th>   
            	   <th class="topmenu" align="center" valign="middle" width="18%">Company Name</th>   
                   <th class="topmenu" align="center" valign="middle" width="5%">Contacts</th> 
                   <th class="topmenu" align="center" valign="middle" width="5%">Rating</th> 
                   <th class="topmenu" align="center" valign="middle" width="6%">Active</th>  
                   <th class="topmenu" align="center" valign="middle" width="15%">Address</th>
                   <th class="topmenu" align="center" valign="middle" width="15%">Website</th> 
                   <th class="topmenu" align="center" valign="middle" width="10%">Responsible Department</th>
                   <th class="topmenu" align="center" valign="middle" width="5%">Notes</th>    
                   <th class="topmenu" align="center" valign="middle" width="6%">Action</th>   
            </tr>
        </thead>
<tbody>
 {{foreach from=$list key="key" item="item"}}

     <tr bgcolor="#FFFFFF">

  
    <td>{{$item.co_categry}}</td> 
    <td>{{$item.co_company_name|stripslashes}}</td>
    <td><a href="{{$BASE_URL}}companies.show-contacts/co_id/{{$item.co_id}}" class="various">Show</a></td>
    
    <td>
    <select name="{{$TABLE}}[co_rating]" Onchange = "update_rating({{$item.co_id}},this.value)">
     <option value="">Please Select</option>
      <option value="0" {{if $item.co_rating eq '0' }} selected="selected" {{/if}}>0</option>
     <option value="1" {{if $item.co_rating eq '1' }} selected="selected" {{/if}}>1</option>
     <option value="2" {{if $item.co_rating eq '2' }} selected="selected" {{/if}}>2</option>
     <option value="3" {{if $item.co_rating eq '3' }} selected="selected" {{/if}}>3</option>
     <option value="4" {{if $item.co_rating eq '4' }} selected="selected" {{/if}}>4</option>
     <option value="5" {{if $item.co_rating eq '5' }} selected="selected" {{/if}}>5</option>
     <option value="Do Not Use" {{if $item.co_rating eq 'Do Not Use' }} selected="selected" {{/if}}>Do Not Use</option>
     <option value="NA"  {{if $item.co_rating eq 'NA' }} selected="selected" {{/if}}>N/A</option>
     <option value="New" {{if $item.co_rating eq 'New' }} selected="selected" {{/if}}>New</option>
    </select>
    
      <script>
	   
		function update_rating(id,value)
		{
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}companies.update_rating/co_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	</script>
    
    
    </td>
    
    
    <td><form name ="recmet32" method="post" action="">
     	<input type="hidden" name="active[{{$item.co_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="active[{{$item.co_id}}]" value="1"  onclick="this.form.submit();" {{if $item.co_active eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form>
    
    </td>
    <td>{{$item.co_address}}</td>

    <td>{{if {{$item.co_website}}<a href="{{$item.co_website}}" target="_blank">{{$item.co_website}}</a>{{/if}}</td> 
    <td>
    <select name="{{$TABLE}}[co_resp_status]" Onchange = "update_responsible({{$item.co_id}},this.value)">
     <option value="Please Select">Please Select</option>
     {{foreach from = $rddata key="key" item="item2"}}
     <option value="{{$item2.to_option}}" {{if $item.co_resp_status eq $item2.to_option }} selected="selected" {{/if}}>{{$item2.to_option}}</option>
     {{/foreach}}
  </select>
    
      <script>
	   
		function update_responsible(id,value)
		{
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}companies.update_res_status/co_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	</script>
    
     </td>
    <td><input type="button" name="View Notes" value="View  Notes" onclick="javascript:show_notes({{$item.co_id}});" style="width:90px; height:20px; font-size:11px; line-height:17px !important; padding:0px !important" /></td> 
  
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