<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />


{{include file=$jdata}}
{{include file=$tiny_basic}}		

<script type="text/javascript">
function show_detail(rm_id)
{
	var viewurl = "{{$BASE_URL}}recorded_meeting.show_detail"+ "/rm_id/" + rm_id;	

 	$(document).ready(function () {

        $.fancybox({

				'width': '80%',
				'height': '80%',
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
				 'scrolling': 'yes',
				 'onClosed': function() {   
     				parent.location.reload(true); } 
        });
      });
}

function add_procedure()
{
	var viewurl = "{{$BASE_URL}}recorded_meeting.view_procedure"+ "/random/" + Math.random();	

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

<h3 class="page-title">{{$title}}</h3>

<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
<div style="float:left; text-align:left;">

&nbsp;&nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> <br />
&nbsp;&nbsp;<strong>IDM Link </strong><input type="text" name="idm" value="{{$idm_detail.tl_link}}" style="width:700px" /> <br />
&nbsp;&nbsp;<strong>PAR Link </strong><input type="text" name="par" value="{{$par_detail.tl_link}}" style="width:700px" /> 
&nbsp;
<input type="submit" value="Update Link" name="update_link"  />
<br /> <br /> 
&nbsp;&nbsp;<strong>Search:</strong>&nbsp;&nbsp;
<input type="text" name="{{$TABLE}}[keyword]" value="{{$keyword}}" style="width:400px;" placeholder="Search for Project Name Or Meeting Date Or Owner"/>
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" value="Search" name="search"  />
 </div>


</form>


<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
                <th class="topmenu" align="center" valign="middle" width="2%">Sr</th>   
                   <th class="topmenu" align="center" valign="middle" width="20%">Project Name</th>   
            	   <th class="topmenu" align="center" valign="middle" width="6%">Date of Meeting</th>   
                  <!-- <th class="topmenu" align="center" valign="middle" width="22%">File Name</th> -->
                   <th class="topmenu" align="center" valign="middle" width="8%">File</th> 
                   <th class="topmenu" align="center" valign="middle" width="8%">Type</th>
                   <th class="topmenu" align="center" valign="middle" width="8%">Detail</th>
                   <th class="topmenu" align="center" valign="middle" width="10%">Owner</th> 
                   <th class="topmenu" align="center" valign="middle" width="8%">To Be Scribed</th> 
                   <th class="topmenu" align="center" valign="middle" width="8%">Scribed File</th> 
                   <th class="topmenu" align="center" valign="middle" width="10%">Detail</th>  
                    
             
            </tr>
        </thead>
<tbody>


 {{foreach from=$list key="key" item="item"}}

     <tr bgcolor="#FFFFFF">

    <td>{{counter}}</td>
    <td> <a href ="{{$BASE_URL}}business.detail/bsn_id/{{$item.rm_bus_id}}" target="_blank">{{$item.bsn_name}}</td> 
    <td>{{$item.rm_date}}</td>
   <!-- <td><a href = "{{$BASE_URL}}files/recorded_meetings/{{$item.rm_original_file}}" target="_blank">{{$item.rm_meeting_file}}</td>-->
    <td> {{if $item.rm_file_location}} <a href="{{$item.rm_file_location}}" target="_blank">Link</a>{{/if}} </td>
    <td>{{$item.rm_type}}</td>
    <td>{{$item.rm_detail}}</td>
    <td>{{$item.rm_owner}}</td>
    <td>
    <form name ="recmet" method="post" action="">
    <input type="hidden" name="savetorm[{{$item.rm_id}}]" value="0" />
     <label class="switch">
        <input class="switch-input" type="checkbox"  name="savetorm[{{$item.rm_id}}]" value="1"  onclick="this.form.submit();" {{if $item.rm_tobe_scribed eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span>
    </form> 
    </td>
    <td style="text-align:center;">
    
    {{if $item.rm_scribed_file}}
    <!--<a href = "https://deckquote.s3.amazonaws.com/files/recorded_meetings/{{$item.rm_scribed_file}}" target="_blank">-->
     <a href = "/recorded_meeting.download_content?file_name={{$item.rm_scribed_file}}&module_name=recorded_meeting.home" target="_blank">
    <img src="{{$BASE_URL}}images/download.png"  /></a> 
    {{else}}
    No File
    {{/if}}
    </td>
    <td align="center">
     <input type="button" name="View Detail" value="View & upload" onclick="javascript:show_detail({{$item.rm_id}});" style="width:90px; height:22px; font-size:11px; line-height:18px !important; padding:0px !important" />
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