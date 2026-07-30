
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/w3.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
{{include file=$jdata}}
{{include file=$tiny_basic}}		
<h3 class="page-title">{{$title}}</h3>

<script>
function add_procedure()
{
	var viewurl = "{{$BASE_URL}}letter_database.view_procedure"+ "/random/" + Math.random();	

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
<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
<div style="float:left; text-align:left;">
&nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> 
</div>
<br />
&nbsp; &nbsp; <strong>Search:</strong>&nbsp;&nbsp;
<input type="text" name="searchkey" value="{{$searchkey}}" style="width:400px;" placeholder="Search Sent From, Sent To, Who To Action"/>
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" value="Search" name="searchaddr"  />
<input type="submit" value="Clear Search" name="clear"  /> <br />


<div style="float:left;"> 
&nbsp;&nbsp;
 <select name="ptype"  >
         <option value="">Select Project Type </option>
         <option value="Project-related">Project-related</option>
	 <option value="Project-unrelated">Project-unrelated</option>
</select>
 <input type="submit" value="Filter" name="project_filter"  />
 
 &nbsp;&nbsp;&nbsp;&nbsp;
 <select name="actioned"  >
         <option value="">Select Actioned Or Not </option>
         <option value="Actioned">Actioned</option>
	 <option value="Unactioned">Unactioned</option>
</select>
 <input type="submit" value="Filter" name="actionedornot"  />

 <input type="submit" value="Clear Filter" name="clear"  />
 
</div>
<div style="float:right;"> 
<input type="submit" name="showall" value="Show Hidden" />
<input type="submit" value="Hide Actioned" name="hide_act"  />
<input type="button" name="Add New " value="Add New" onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.detail}}');" />

</div>
</form>
</td></tr></table>

<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
                   <th class="topmenu" align="center" valign="middle" width="5%">Sr No</th>  
                   <th class="topmenu" align="center" valign="middle" width="8%">Hide</th>
                   <th class="topmenu" align="center" valign="middle" width="10%">Letter</th>   
            	   <th class="topmenu" align="center" valign="middle" width="10%">Project Type</th>
                   <th class="topmenu" align="center" valign="middle" width="10%">Actioned Or Not</th>
                   <th class="topmenu" align="center" valign="middle" width="12%">Sent From</th> 
                   <th class="topmenu" align="center" valign="middle" width="12%">Sent To</th> 
                   <th class="topmenu" align="center" valign="middle" width="10%">Who to action</th>
                   <th class="topmenu" align="center" valign="middle" width="10%">Date of Mail</th>
                   <th class="topmenu" align="center" valign="middle" width="8%">Action</th>   
            </tr>
        </thead>
    <tbody>

 {{foreach from=$list key="key" item="item"}}

    <tr bgcolor="#FFFFFF">

        <td>{{counter}}</td>
          <td>
        <form name ="recmet" method="post" action="">
     	<input type="hidden" name="hide[{{$item.ld_id}}]" value="0" />
  	<label class="switch">
        <input class="switch-input" type="checkbox"  name="hide[{{$item.ld_id}}]" value="1"  onclick="this.form.submit();" {{if $item.ld_hide eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
        </label>
        </form>
        
        </td>
      
        <td style="text-align:center;">{{if $item.ld_letter}}
      <!--  <a href = "https://deckquote.s3.amazonaws.com/files/scanned_letters/{{$item.ld_letter}}" target="_blank">Download</a>-->
        <a href = "/letter_database.download_content?file_name={{$item.ld_letter}}&module_name=letter_database.home" target="_blank">Download</a>
        
        {{/if}}</td>
        <td>{{$item.ld_project_type}}</td>
        <td> 
        <form name ="act_unact" method="post" action="">
         <input type="hidden" name = "ld_id" value="{{$item.ld_id}}" />
         <select name="actunact" style="width:300px;" onchange="this.form.submit()"/>
           
            <option value="Actioned"   {{if  $item.ld_action == 'Actioned'}}selected{{/if}}>Actioned</option>
            <option value="Unactioned" {{if  $item.ld_action == 'Unactioned'}}selected{{/if}}>Unactioned</option>
         </select>
         </form>
        </td>
        <td>{{$item.ld_from}}</td>
        <td>{{$item.ld_to}}</td>
        <td>{{$item.ld_who_to_action}}</td>
        <td>{{$item.ld_date}}</td>
    
        <td> <a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" class="various" title="Edit"> 
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
             <a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete">
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>&nbsp;&nbsp
        </td>
    </tr>  
  {{/foreach}}
  </tbody>
  </table>
 
  </div>

    
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