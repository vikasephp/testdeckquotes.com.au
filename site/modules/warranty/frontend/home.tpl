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
</script>

 <h3 class="page-title">Warranty Log</h3>  <br />
<div style="float:left; margin-left:3px; text-align:left;">
<form name="filt" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
<span>
Project Name  : 
<datalist id='project'>
           {{foreach from=$projdetail key="key" item="item"}}
            <option value="{{$item.bsn_name}}" {{if $bsnid eq $item.bsn_id}} selected="selected" {{/if}}>
            {{$item.bsn_name}}
            </option>
            {{/foreach}}
</datalist>
         <input type="text" list = 'project' name="project_name" style ="width:300px" value="{{$search_project}}" />
&nbsp;

Contact Info : <input type="text" name="contact" style ="width:200px" value="{{$search_contact}}" />
         
<br />  

Type :  <input type="text" name="type" style ="width:200px" value="{{$search_type}}" /> &nbsp; &nbsp;
Warranty Issue Number : <input type="text" name="win" style ="width:200px" value="{{$win}}" />
 <br />              
 
 Date &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;: <span class="dt"> FROM <input type="text" name="date1"  value="{{$date1}}"  class="w16em dateformat-d-ds-m-ds-Y dtpic"  />
 TO <input type="text" name="date2"  value="{{$date2}}"  class="w16em dateformat-d-ds-m-ds-Y dtpic" />
 </span>

   &nbsp; &nbsp;      
<input type="submit" name="search" value = "Search" /> 
<input type="submit" name="clear" value = "Clear Search" /> 
</form>             
</div>

<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
<div style="float:right;"> 
<input type="button" value="Print All" onclick="document.location.href='{{$BASE_URL}}{{$XFA.home}}/export/1'" /> 
<input type="submit" name="hidden" value = "Show Closed" />
<input type="button" name="Add New " value="Add New" onclick="location.href='{{$BASE_URL}}{{$XFA.detail}}';" />
</div>
</form>


<div id="">

    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
                   <th class="topmenu" align="center" valign="middle" width="3%">Warranty No.</th>  
                   <th class="topmenu" align="center" valign="middle" width="25%">Project Name</th> 
                   <th class="topmenu" align="center" valign="middle" width="9%">Contact Info</th> 
                  <!-- <th class="topmenu" align="center" valign="middle" width="9%">Type</th> -->
                   <th class="topmenu" align="center" valign="middle" width="9%">Quality inspector contacted client</th> 
                   <th class="topmenu" align="center" valign="middle" width="5%">Date</th> 
                   <th class="topmenu" align="center" valign="middle" width="10%">Closed</th>
                  <!-- <th class="topmenu" align="center" valign="middle" width="10%">Complete and Close Letter</th>-->
                   <th class="topmenu" align="center" valign="middle" width="7%">Detail</th> 
                   <th class="topmenu" align="center" valign="middle" width="9%">Action</th>   
            </tr>
        </thead>
    <tbody>

 {{foreach from=$list key="key" item="item"}}
    
     <tr bgcolor="#FFFFFF">
    
        <td>{{$item.wa_id}}</td>
        <td>{{$item.wa_project|stripslashes}}</td> 
        <td>{{$item.wa_contact_info}}</td> 
      <!--  <td>{{$item.wa_type}}</td>-->
          
        <td>
        <input type="checkbox"  {{if $item.wa_qualiy_inspecter_con eq 1}} checked="checked" {{/if}} onchange="update_qic({{$item.wa_id}},this.checked)" />
       <script>
	   
	   function update_qic(id,value)
		{
		
		var val = 0;
		if(value==true) { val = 1; } 
		if(value==false) { val = 2; } 
		
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}warranty.update_qicc/wa_id/"+id+"/value/"+val,
				   success: function(result){
			   }
			 });
		}
	
       </script>
        
        
        </td>
        <td>{{$item.wa_date_lodged}}</td>
        <td> 
        <form name ="recmet3" method="post" action="">
     	<input type="hidden" name="closed[{{$item.wa_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="closed[{{$item.wa_id}}]" value="1"  onclick="this.form.submit();" {{if $item.wa_closed eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form>  
       </td>
      <!-- <td> {{if $item.wa_cc_letter}} <a href="https://deckquote.s3.amazonaws.com/files/warranty/{{$item.wa_cc_letter}}" target="_blank">Download</a>{{/if}}</td>
    -->   
        <td><a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" title="Show Warranty">Show Detail</a></td>
    
        <td> <a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" title="Edit"> 
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
             <a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete">
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