<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
{{include file=$jdata}}
{{include file=$tiny_basic}}		

<script>
		!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
	</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />

<h3 class="page-title">{{$title}}</h3>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

<style>
.dtpic {
	width:65px !important;
	padding-top:1px !important;
	padding-bottom:1px !important;
	margin-bottom:10px !important;	
}
.dt {border:1px solid #CCC; padding:8px; margin-top:15px !important; }	
#fancybox-wrap {z-index:9999999;}
</style>

<script type="text/javascript" >  
		$(document).ready(function() {
			/*
			*   Examples - images
			*/
			$(".various").fancybox({
				'width': '95%',
				'height': '95%',
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

function add_procedure()
{
	var viewurl = "{{$BASE_URL}}phone_log.view_procedure"+ "/random/" + Math.random();	

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


function add_calltype()
{
	var viewurl = "{{$BASE_URL}}phone_log.view_type"+ "/random/" + Math.random();	

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

function add_actioned()
{
	var viewurl = "{{$BASE_URL}}phone_log.view_actioned"+ "/random/" + Math.random();	

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

function add_whofor()
{
	var viewurl = "{{$BASE_URL}}phone_log.view_who_for"+ "/random/" + Math.random();	

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


<div style="float:left; margin-left:3px; text-align:left;">
&nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> 
&nbsp;<input type="button" name="type" value="Call Types" onclick="javascript:add_calltype();" />
&nbsp;<input type="button" name="actioned" value="Actioned Admin" onclick="javascript:add_actioned();" />
&nbsp;<input type="button" name="whoforadmin" value="Who For Admin" onclick="javascript:add_whofor();" />
<br />
</div>

<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
<div style="float:right;"> 
<input type="submit" name="showall" value = "Show Hidden" /> 
<input type="submit" name="showopen" value = "Show Open" /> 
<input type="button" name="Add New " value="Add New" onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.detail}}');" />
</div>
</form>

<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
                   <th class="topmenu" align="center" valign="middle" width="3%">Unique Id.</th>  
                   <th class="topmenu" align="center" valign="middle" width="6%">When</th> 
                   <th class="topmenu" align="center" valign="middle" width="6%">User</th> 
                   <th class="topmenu" align="center" valign="middle" width="6%">Number</th> 
                   <th class="topmenu" align="center" valign="middle" width="10%">Name</th> 
                   <th class="topmenu" align="center" valign="middle" width="8%">Company</th> 
                   <th class="topmenu" align="center" valign="middle" width="9%">Email</th>
                   <th class="topmenu" align="center" valign="middle" width="11%">Message</th>
            	   <th class="topmenu" align="center" valign="middle" width="4%">Actioned</th> 
                   <th class="topmenu" align="center" valign="middle" width="4%">Minute Count</th>
                   <th class="topmenu" align="center" valign="middle" width="6%">Who For</th>
                   <th class="topmenu" align="center" valign="middle" width="6%">Open</th>
                   <th class="topmenu" align="center" valign="middle" width="6%">Email</th>
                   <th class="topmenu" align="center" valign="middle" width="5%">Action</th>   
            </tr>
        </thead>
    <tbody>

 {{foreach from=$list key="key" item="item"}}

    <tr bgcolor="#FFFFFF">

        <td>{{$item.ph_id}}</td>
        <td>{{$item.ph_date_time}}</td>
         <td>{{$item.ph_user}}</td>
        <td>{{$item.ph_phone}}</td>
       
        <td>{{$item.ph_name}}</td> 
        <td>{{$item.ph_company}}</td> 
        <td>{{$item.ph_email}}</td>
        <td>

        <textarea rows="4" cols="40" class="tinymce2" id="{{$item.ph_id}}" style="overflow-y: scroll;">{{$item.ph_message}}</textarea>       
   
       <script>
	   
	    $(document).ready(function(){
		    
		    
                     $("#{{$item.ph_id}}").keyup(function(){
                           update_message({{$item.ph_id}},this.value);
                     });
             });
	     
	   
	   
	   function update_message(id,value)
		{
		
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}phone_log.update_message/ph_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
	
       </script>
        
        </td>
         
        <td> 
        
        <select name="{{$TABLE}}[ph_actioned]" Onchange = "update_action({{$item.ph_id}},this.value)">
    
        {{foreach from=$actioned key="key2" item="item2"}}
        <option value="{{$item2.pa_option}}" {{if $item.ph_actioned eq $item2.pa_option}} selected="selected" {{/if}} >{{$item2.pa_option}}</option>
        {{/foreach}}
        </select>
        
        <div id="act{{$item.ph_id}}">{{$item.ph_actioned_user}}<br />{{$item.ph_actioned_date}} </div>
                <script>
	   
		function update_action(id,value)
		{
			 var tana10 = "#act"+id;
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}phone_log.update_action/ph_id/"+id+"/value/"+value,
					   success: function(result){
						   $(tana10).html(result); 
					}
				});
		}
	        </script>
        
        
        </td>
        
        <td>To be developed</td>
        <td>
        
        <!--<input type="text" name="whofor" value="{{$item.ph_who_for}}" onkeyup="update_who_for({{$item.ph_id}},this.value)" />-->
        <select name="{{$TABLE}}[ph_who_for]" Onchange = "update_who_for({{$item.ph_id}},this.value)">
        <option value="">Please Select</option>
         {{foreach from=$whofor key="key3" item="item3"}}
        <option value="{{$item3.pw_option}}" {{if $item.ph_who_for eq $item3.pw_option}} selected="selected" {{/if}} >{{$item3.pw_option}}</option>
        {{/foreach}}
        </select>
        
        <script>
	
        function update_who_for(id,value)
		{
			
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}phone_log.update_who_for/ph_id/"+id+"/value/"+value,
					   success: function(result){
						   
					}
				});
		}
	        </script>
        
        </td>
        <td> 
      <form name ="recmet2" method="post" action="">
     	<input type="hidden" name="open[{{$item.ph_id}}]" value="No" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="open[{{$item.ph_id}}]" value="1"  onclick="this.form.submit();" {{if $item.ph_open eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form>  
      </td>
     
      <td><a href="{{$BASE_URL}}phone_log.send_email/ph_id/{{$item.ph_id}}" class="various">Email</a></td>  
        <td> <form name ="recmet9" method="post" action="">
        <input type="submit" name="message" value="Text Message" onclick="return confirm('Are you want to send text message to {{$item.ph_name}}?')" />
        <input type="hidden" name="phid" value="{{$item.ph_id}}" />
        </form>
        <a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" class="various" title="Edit"> 
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
             
       <!--      <a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete">
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>&nbsp;&nbsp-->
             
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