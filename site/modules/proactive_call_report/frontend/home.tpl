<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

{{include file=$jdata}}
{{include file=$tiny_basic}}		
<h3 class="page-title">{{$title}}</h3>

<style>
.set2 { font-size:10px !important; 
       width:60px !important; display:inline-block; 
	  padding-top:1px !important;
	  padding-bottom: 1px !important;
	  padding-left:1px !important;
	  height:25px !important; 
	  margin-top:7px;}
#fancybox-wrap {z-index:9999999;} 

.cnf {font-size:11px !important; padding:3px !important; }
  
</style>

<script language="javascript">

function add_procedure()
{
	var viewurl = "{{$BASE_URL}}proactive_call_report.view_procedure"+ "/random/" + Math.random();	

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

function add_status()
{
	var viewurl = "{{$BASE_URL}}proactive_call_report.view_status"+ "/random/" + Math.random();	

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

function add_call_result()
{
	var viewurl = "{{$BASE_URL}}proactive_call_report.view_call_result"+ "/random/" + Math.random();	

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


function add_outcome()
{
	var viewurl = "{{$BASE_URL}}proactive_call_report.view_outcome"+ "/random/" + Math.random();	

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

<div style="float:left;">
<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" />
<input type="button" name="status_panel" value="Status Admin" onclick="javascript:add_status();" />
<input type="button" name="call_result" value="Call Result Admin" onclick="javascript:add_call_result();" />
<input type="button" name="outcome" value="Outcome Admin" onclick="javascript:add_outcome();" />
 <br />
</div>


<div style="float:right; text-align:right;"> 
<input type="submit" name="showall" value="Show All" />
<input type="button" name="Add New " value="Add New" onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.detail}}');" />
</div>
</form>


<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
                
                   <th class="topmenu" align="center" valign="middle" width="5%">Date</th> 
                   <th class="topmenu" align="center" valign="middle" width="20%">Project Address</th> 
                   <th class="topmenu" align="center" valign="middle" width="12%">Call Result</th> 
                   <th class="topmenu" align="center" valign="middle" width="8%">Project Status</th>  
                   <th class="topmenu" align="center" valign="middle" width="6%">File</th> 
                   <th class="topmenu" align="center" valign="middle" width="7%">Survey Result</th> 
                   <th class="topmenu" align="center" valign="middle" width="10%">User</th>
                   <th class="topmenu" align="center" valign="middle" width="10%">Outcome</th>
                   <th class="topmenu" align="center" valign="middle" width="14%">Email Details</th> 
                   <th class="topmenu" align="center" valign="middle" width="6%">Hide</th>  
                   <th class="topmenu" align="center" valign="middle" width="6%">Action</th>   
            </tr>
        </thead>
    <tbody>
<form name="mlist" method="post">
{{assign var=countn value= $total}}
 {{foreach from=$list key="key" item="item"}}

    <tr bgcolor="#FFFFFF">

        
        <td>{{$item.pr_date}}<br />{{$item.pr_time}}</td>
        <td>{{$item.pr_project_address}}</td> 
        <td>
         <form name="cr" method="post" action="">
         <select name="pr_call_result]"  Onchange = "update_cr({{$item.pr_id}},this.value)">
         <option value="-1" {{if $detail.pr_call_result eq 0}} selected="selected" {{/if}}>Please Select </option>
         {{foreach from=$crdetail  key="key2" item="item2"}}
            <option value="{{$item2.cr_id}}" {{if $item.pr_call_result  eq $item2.cr_id}} selected="selected" {{/if}}>
            {{$item2.cr_name}}
            </option>
            {{/foreach}}
         </select>
         </form>
            
        <script>
	   
		function update_cr(id,value)
		{
			 $.ajax({
				 
				   type: "GET",
				   url: "{{$BASE_URL}}proactive_call_report.update_call_result/pr_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	    </script>
    
        </td>
        <td>
        <form name="cr" method="post" action="">
         <select name="{{$TABLE}}[pr_call_result]"  Onchange = "update_status({{$item.pr_id}},this.value)">
         <option value="-1" {{if $detail.qb_component eq -1}} selected="selected" {{/if}}>Please Select </option>
         {{foreach from=$stdetail  key="key1" item="item1"}}
            <option value="{{$item1.pcr_id}}" {{if $item.pr_status  eq $item1.pcr_id}} selected="selected" {{/if}}>
            {{$item1.pcr_status}}
            </option>
            {{/foreach}}
         </select>
         </form>   
        <script>
	   
		function update_status(id,value)
		{
			
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}proactive_call_report.update_status/pr_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	    </script>
        
        </td> 
        <td> 
        {{if $item.pr_file}}
       <!-- <a href="https://deckquote.s3.amazonaws.com/files/uploads_2023/{{$item.pr_file}}" target="_blank">Download</a><br />-->
         <a href="/proactive_call_report.download_content?file_name={{$item.pr_file}}&module_name=proactive_call_report.home" >Download</a><br />
        
        {{/if}}
        </td>
        <td> 
         {{if $item.pr_survey_result}}
        <!-- <a href="https://deckquote.s3.amazonaws.com/files/uploads_2023/{{$item.pr_survey_result}}" target="_blank">Download</a><br />-->
         <a href="/proactive_call_report.download_content?file_name={{$item.pr_survey_result}}&module_name=proactive_call_report.home" >Download</a><br />
         {{/if}}
       
        </td> 
        <td> {{$item.pr_user}}</td>
    
         <td>
        <form name="outcome" method="post" action="">
         <select name="{{$TABLE}}[oc_outcome]"  Onchange = "update_outcome({{$item.pr_id}},this.value)">
         <option value="0" >Please Select </option>
         {{foreach from=$ocdetail  key="key3" item="item3"}}
            <option value="{{$item3.oc_id}}" {{if $item.pr_outcome  eq $item3.oc_id}} selected="selected" {{/if}}>
            {{$item3.oc_outcome}}
            </option>
          {{/foreach}}
         </select>
         </form>   
        <script>
	   
		function update_outcome(id,value)
		{
			
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}proactive_call_report.update_outcome/pr_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	    </script>
        
        </td> 
    
        
       <td>{{$item.pr_email_details}}</td>
         <td>
         <form name ="recmet3" method="post" action="">
     	<input type="hidden" name="hide[{{$item.pr_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="hide[{{$item.pr_id}}]" value="1"  onclick="this.form.submit();" {{if $item.pr_hide eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form>  
         
         </td>
        
        <td> <a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" class="various" title="Edit"> 
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;
             <a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete">
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>&nbsp;
             
        </td>
    </tr>  
      {{assign var=countn value=$countn-1}}
  {{/foreach}}
</form>
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