<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />		
<h3 class="page-title">{{$title}}</h3>
<script type="text/javascript" src="{{$BASE_URL}}js/jquery-1.7.2.js"></script>

<script> 

		!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
	</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
<script type="text/javascript" >  

		$(document).ready(function() {
			$(".various").fancybox({
				'width': '90%',
				'height': '90%',
				'autoScale': false,
				 'transitionIn' : 'elastic',
				 'transitionOut' : 'elastic',
				 'speedIn' : 300,
				 'speedOut' : 300,
				 'overlayShow' : true,
				 'hideOnOverlayClick':false,
				 'hideOnContentClick':false,
				 'type': 'iframe',
				 'scrolling': 'yes' 
			});
							
		});
$(document).ready(function() {
		$(".fancybox").fancybox();
	});
	
function add_new(URL)
 {
var viewurl = URL+ "/random/" + Math.random();	
 $(document).ready(function () {
        $.fancybox({
				'width': '90%',
				'height': '90%',
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
	var viewurl = "{{$BASE_URL}}mistake_log.view_procedure"+ "/random/" + Math.random();	

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

function add_priority()
{
	var viewurl = "{{$BASE_URL}}mistake_log.view_priority"+ "/random/" + Math.random();	

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


function close_win()
	{
	$.fancybox.close();
	window.location.href = window.location.href;
	}
</script>


<script type="text/javascript" >  

$(document).ready(function(){
	var maxLength = 200;
	$(".show-read-more").each(function(){
		var myStr = $(this).text();
		if($.trim(myStr).length > maxLength){
			var newStr = myStr.substring(0, maxLength);
			var removedStr = myStr.substring(maxLength, $.trim(myStr).length);
			$(this).empty().html(newStr);
			$(this).append( ' &nbsp; &nbsp;<a href="javascript:void(0);" class="read-more">Read More...</a>');
			$(this).append('<span class="more-text">' + removedStr + '</span>');
		} 
	});
	$(".read-more").click(function(){
		$(this).siblings(".more-text").contents().unwrap();
		$(this).remove();
	});
});
</script>

<style>
    .show-read-more .more-text{display: none; }
	
	.read-more {font-weight:bold;}
</style>

<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
 <div style="float:left; text-align:left;">
    &nbsp; &nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> 
    <input type="button" name="Add New" value="Priority Admin" onclick="javascript:add_priority();" /> 
    <br />
    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Search:</strong>&nbsp;&nbsp;</span>
<input type="text" name="mistake[keyword]" value="{{$keyword}}" style="width:400px;" placeholder="Search for Mistake OR Person Created OR Priority OR Owner Or Date"/>
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" value="Search" name="search"  />
<input type="submit" value="Collapse All" name="collapse"  /> <br />

&nbsp; &nbsp;<strong> Filter By : </strong> 

        <select name="priority_filter"/>
        <option value="0">Please Select</option>
        {{foreach from=$prioritydata key="key1" item="item1"}}
        <option value="{{$item1.mp_id}}" {{if $item1.mp_id eq $item.ml_priority}} selected="selected" {{/if}}>{{$item1.mp_option}}</option>
        {{/foreach}}
        </select>
        &nbsp; &nbsp;<input type="submit" value="Filter" name="filter" /> 
        <input type="submit" value="Clear Filter" name="clearfilter" /> 
 </div>

<div style="float:right;"> 
<input type="submit" value="Show All" name="showall"  />
<input type="submit" value="Show Hidden" name="showhidden"  />
<input type="button" name="Add New " value="Add New" onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.detail}}');" />
</div>
</form>



<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
		   <th class="topmenu" align="center" valign="middle" width="3%">Id</th>  	            
                   <th class="topmenu" align="center" valign="middle" width="42%">Mistake</th>   
            	   <th class="topmenu" align="center" valign="middle" width="8%">Person Created</th>   
                   <th class="topmenu" align="center" valign="middle" width="5%">Date</th> 
                   <th class="topmenu" align="center" valign="middle" width="10%">Owner</th> 
                   <th class="topmenu" align="center" valign="middle" width="8%">Priority</th>  
                   <th class="topmenu" align="center" valign="middle" width="5%">Document</th>
                   <!--<th class="topmenu" align="center" valign="middle" width="9%">Stream</th>-->
                   <th class="topmenu" align="center" valign="middle" width="5%">Status</th>
                  <!-- <th class="topmenu" align="center" valign="middle" width="5%">Comment</th>-->
                    <th class="topmenu" align="center" valign="middle" width="6%">Hide</th> 
                   <th class="topmenu" align="center" valign="middle" width="7%">Action</th>   
            </tr>
        </thead>
    <tbody>

 {{foreach from=$list key="key" item="item"}}

    <tr bgcolor="#FFFFFF">

	<td>{{$item.ml_id}}</td> 
        <td><div class="show-read-more">{{$item.ml_mistake}}</div></td> 
        <td style="vertical-align:top;">{{$item.ml_person_created}}</td>
        <td>{{$item.ml_date}}</td>
        <td>{{$item.ml_owner}}</td>
        <td>
        <select name="{{$TABLE}}[ml_priority]"  Onchange = "update_priority({{$item.ml_id}},this.value)">
        <option value="0">Please Select</option>
        {{foreach from=$prioritydata key="key1" item="item1"}}
        <option value="{{$item1.mp_id}}" {{if $item1.mp_id eq $item.ml_priority}} selected="selected" {{/if}}>{{$item1.mp_option}}</option>
        {{/foreach}}
        </select>
        
        <script>
		
		function update_priority(id,value)
		{
			
			$.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}mistake_log.update_priority/ml_id/"+id+"/value/"+value,
					   success: function(result){
						  
					}
				});
		}
		
	     </script>
        </td>
        <td>
        {{if $item.ml_link_1 }}<a href="{{$item.ml_link_1}}"  target="_blank" title="{{$item.ml_link_1}}"/> Link 1 </a><br />{{/if}}
        {{if $item.ml_link_2 }}<a href="{{$item.ml_link_2}}"  target="_blank" title="{{$item.ml_link_2}}"/> Link 2 </a><br />{{/if}}
        {{if $item.ml_link_3 }}<a href="{{$item.ml_link_3}}"  target="_blank" title="{{$item.ml_link_3}}"/> Link 3 </a>{{/if}}
        </td>
     <!--   <td>{{$item.ml_stream}}</td>-->
        <td>
         <form name ="recmet8" method="post" action="">
         <select name="status[{{$item.ml_id}}]"  Onchange = "this.form.submit();">
          <option value="">Please Select </option>
                
          <option value="Resolved"   {{if $item.ml_status eq 'Resolved'}} selected="selected" {{/if}}>Resolved</option>
          <option value="Actioned" {{if $item.ml_status eq 'Actioned'}} selected="selected" {{/if}}>Actioned</option>
          <option value="To be actioned" {{if $item.ml_status eq 'To be actioned'}} selected="selected" {{/if}}>To be actioned</option>
               
        </select>
        </form>
        
        </td>
        
<!--        <td> <input type="text" name="comment" value="{{$item.ml_comment}}" onkeyup="update_comment({{$item.ml_id}},this.value)" />
         <script>
		
		function update_comment(id,value)
		{
			
			$.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}mistake_log.update_comment/ml_id/"+id+"/value/"+value,
					   success: function(result){
						  
					}
				});
		}
		
	     </script>
        
        </td>-->
		 <td> 
        <form name ="recmet4" method="post" action="">
     	<input type="hidden" name="hide[{{$item.ml_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="hide[{{$item.ml_id}}]" value="1"  onclick="this.form.submit();" {{if $item.ml_hide eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form> 
              
        </td>

        <td> <a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" class="various" title="Edit"> 
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
             <a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete">
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>&nbsp;&nbsp
             <a href="{{$BASE_URL}}{{$XFA.replay}}/{{$ID}}/{{$item.$ID}}" class="various" title="Replay">
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/sub.png"/></a>&nbsp;&nbsp
             
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