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
	var viewurl = "{{$BASE_URL}}franks_recording_report.view_procedure"+ "/random/" + Math.random();	

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
&nbsp;&nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> 
 <br />
&nbsp; &nbsp;<input type="text" name="address"  style="width:350px;" placeholder="Search for Business Name"/>
<input type="submit" value="Search" name="search"  /> &nbsp;<br />
&nbsp; &nbsp;<input type="text" name="date"  style="width:150px;" placeholder="Search for Date" class="w16em dateformat-d-ds-m-ds-Y"/>
<input type="submit" value="Search" name="search"  /> &nbsp; <br />

&nbsp; &nbsp;<input type="text" name="proj_topic"  style="width:350px;" placeholder="Search for Project Type"/>
<input type="submit" value="Search" name="search"  />
<input type="submit" name="clear" value = "Clear Search" />   

</div>

<div style="float:right; margin-right:20px;"> 
<input type="button" name="Add New " value="Add New" onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.detail}}');" />
</div>
</form>

<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
         
                   <th class="topmenu" align="center" valign="middle" width="3%">SrNo</th> 
                   <th class="topmenu" align="center" valign="middle" width="5%">Date</th> 
                   <th class="topmenu" align="center" valign="middle" width="10%">Business Name</th> 
                   <th class="topmenu" align="center" valign="middle" width="5%">Meeting Type</th>
                   <th class="topmenu" align="center" valign="middle" width="10%">Project/Topic</th> 
                   <th class="topmenu" align="center" valign="middle" width="10%">Recording Link</th>
                   <th class="topmenu" align="center" valign="middle" width="10%">Transcript Link</th>
                   <th class="topmenu" align="center" valign="middle" width="10%">Meeting Minutes</th>
                   <th class="topmenu" align="center" valign="middle" width="20%">Notes</th>
                   <th class="topmenu" align="center" valign="middle" width="10%">Meeting Summary Emailed</th>
                   <th class="topmenu" align="center" valign="middle" width="5%">Action</th>   
            </tr>
        </thead>
    <tbody>

  {{assign var=countn value= $total}}
 {{foreach from=$list key="key" item="item"}}

    <tr bgcolor="#FFFFFF">


        <td>{{$item.fr_id}}</td>
        <td>{{$item.fr_date}}</td>
        <td>{{$item.fr_business_name}}</td>
        <td>{{$item.fr_meeting_type}} </td>
        <td>{{$item.fr_project_topic}}</td>  
        <td>{{if $item.fr_recording_link}} <a href="{{$item.fr_recording_link}}" target="_blank">View Recording</a>
        <br />
        {{$item.fr_upload_user}} <br />{{$item.fr_upload_date}} 
        {{/if}}</td>
  
        <td> 
        {{if $item.fr_transcript_link}} <a href="{{$item.fr_transcript_link}}" target="_blank">View Transcript<br /></a> {{/if}}
        {{if $item.fr_transcript_file}}
         <a href="/franks_recording_report.download_content?file_name={{$item.fr_transcript_file}}&module_name=franks_recording_report.home" >Download Transcript</a>
         <a href="{{$BASE_URL}}franks_recording_report.delete_tr/fr_id/{{$item.fr_id}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img src="{{$BASE_URL}}/images/delete_icon.png" width="20" /></a>
        <br />
        {{$item.fr_upload_user}} <br />{{$item.fr_upload_date}} 
        {{/if}}
        
        </td>
        
        <td>{{if $item.fr_meeting_minutes}}
         <a href="/franks_recording_report.download_content?file_name={{$item.fr_meeting_minutes}}&module_name=franks_recording_report.home" >Download Transcript</a>
         <a href="{{$BASE_URL}}franks_recording_report.delete_mm/fr_id/{{$item.fr_id}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img src="{{$BASE_URL}}/images/delete_icon.png" width="20" /></a>
         <br />
        {{$item.fr_upload_user}} <br />{{$item.fr_upload_date}} {{/if}}
         </td>
        <td>{{$item.fr_notes}}</td>
        
        <td>
         <form name ="recmet3" method="post" action="">
     	<input type="hidden" name="emailed[{{$item.fr_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="emailed[{{$item.fr_id}}]" value="1"  onclick="this.form.submit();" {{if $item.fr_ms_emailed  eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       
       {{if $item.fr_ms_emailed  eq 1 }} {{$item.fr_ms_emailed_user}}<br />{{$item.fr_ms_emailed_date}}{{/if}}
       </form>  
       
         </td>
        
        <td> <a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" class="various" title="Edit"> 
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
             <a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete">
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>&nbsp;&nbsp
             
        </td>
    </tr>  
    {{assign var=countn value=$countn-1}}
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