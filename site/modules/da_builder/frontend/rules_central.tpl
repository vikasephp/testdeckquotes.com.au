<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
{{include file=$jdata}}
{{include file=$tiny_basic}}		

<script>
		!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
	</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />

<h3 class="page-title">Central Rules List</h3>
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
	var viewurl = "{{$BASE_URL}}da_builder.view_procedure"+ "/random/" + Math.random();	

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

function add_report()
{
	var viewurl = "{{$BASE_URL}}da_builder.add_report"+ "/random/" + Math.random();	

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


<form name="mshort" action="" method="post">
<div style="float:left; text-align:left;">
<!--&nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> -->
&nbsp;&nbsp;<input type="button" name="Add New" value="Add New " onclick="javascript:add_new('{{$BASE_URL}}da_builder.detail_rules/mr_id/{{$mr_id}}');" /><br />
<span>&nbsp;&nbsp;&nbsp;<strong>Search:</strong>&nbsp;&nbsp;</span>
<input type="text" name="keyword" value="{{$keyword}}" style="width:400px;" placeholder="Search Text/name, Question, Answer"/>
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" value="Search" name="search"  />
<input type="submit" value="Clear Search" name="clearall"  />
<input type="submit" value="Show Hidden" name="showall"  />
</div>
<div style="float:right; margin-right:10px;">
<input type="submit" value="print" name="printpdf"  />
</div>
</form>

<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
                   <th class="topmenu" align="center" valign="middle" width="4%">Rule Id</th>  
                   <th class="topmenu" align="center" valign="middle" width="10%">Text/Name</th> 
                   <th class="topmenu" align="center" valign="middle" width="15%">Question</th> 
                   <th class="topmenu" align="center" valign="middle" width="10%">Requester</th> 
                   <th class="topmenu" align="center" valign="middle" width="22%">Answer</th>
                   <th class="topmenu" align="center" valign="middle" width="10%">Responder</th> 
                   <th class="topmenu" align="center" valign="middle" width="12%">Images</th>
                   <th class="topmenu" align="center" valign="middle" width="15%">Links</th>
                   <th class="topmenu" align="center" valign="middle" width="7%">QA</th>
                   <th class="topmenu" align="center" valign="middle" width="7%">Actions</th>
                   <th class="topmenu" align="center" valign="middle" width="6%">Edit/Hide</th>   
            </tr>
        </thead>
    <tbody>

  {{assign var=countn value= $total}}
  {{foreach from=$list key="key" item="item"}}

    <tr bgcolor="#FFFFFF">

        <td>{{$item.rr_id}}</td>
        <td>{{$item.rr_text}}</td> 
        <td>{{$item.rr_question}}</td> 
        <td>{{$item.rr_requester}}</td> 
        <td>{{$item.rr_answer}}</td> 
        <td>{{$item.rr_responder}}</td> 
        <td><form name="imgupload" action="" method="post" enctype="multipart/form-data">
            <input type="hidden" name="rr_id" value="{{$item.rr_id}}" />
            <input type="file" name="newimg" required="required" />
            <input type="submit" name="upload" value="Upload" />
            </form> 
            
        {{foreach from=$item.image_data key="key2" item="item2"}} 
         <!-- <a href = "{{$BASE_URL}}files/da_builder/{{$item2.ri_image}}" target="_blank">View</a>-->
          <a href="/da_builder.download_content?file_name={{$item2.ri_image}}&module_name=da_builder.rules_central" target="_blank"/>View</a>
          
           <a href="{{$BASE_URL}}da_builder.delete_img_lnk/ri_id/{{$item2.ri_id}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img src="{{$BASE_URL}}css/admin/images/deletecross.png" width="16" /></a>
           <br />
        {{/foreach}}   
        </td>
        
        <td>
        <form name="linkupload" action="" method="post" enctype="multipart/form-data">
            <input type="hidden" name="rr_id" value="{{$item.rr_id}}" />
            <input type="text" name="newlink" required="required" style="width:200px;" />
            <input type="submit" name="save" value="Save" />
            </form> 
            
        {{foreach from=$item.link_data key="key3" item="item3"}} 
          <a href = "{{$item3.rl_link}}" target="_blank">View</a> <a href="{{$BASE_URL}}da_builder.delete_img_lnk/rl_id/{{$item3.rl_id}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img src="{{$BASE_URL}}css/admin/images/deletecross.png" width="16" /></a><br />
        {{/foreach}}   
        
        </td>
        
        <td>
       <form name ="recmet3" method="post" action="">
     	<input type="hidden" name="qa[{{$item.rr_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="qa[{{$item.rr_id}}]" value="1"  onclick="this.form.submit();" {{if $item.rr_qa  eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form>
     {{if $item.rr_qa  eq 1 }} {{$item.rr_qa_user}}<br />{{$item.rr_qa_date}} {{/if}}   
        </td>
        
       <td>
          <form name="myform" id="f_{{$item.rr_id}}" action="{{$BASE_URL}}da_builder.rules_central" method="post" enctype="multipart/form-data">
          <input type="hidden" name="print_id" value="{{$item.rr_id}}" />
           <a href="{{$BASE_URL}}da_builder.view_qa/rr_id/{{$item.rr_id}}" class="various">View</a><br />
          
           <a href="javascript:{}" onclick="document.getElementById('f_{{$item.rr_id}}').submit()">Print</a>
           
           <br />
           <a href="{{$BASE_URL}}da_builder.email_qa/rr_id/{{$item.rr_id}}" class="various">Share</a>;
        </form>   
        
        </td>  
           
           
        <td> <a href="{{$BASE_URL}}da_builder.detail_rules_central/rr_id/{{$item.rr_id}}" class="various" title="Edit"> 
        <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
<!--        <a href="{{$BASE_URL}}da_builder.delete_rule_central/rr_id/{{$item.rr_id}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"> <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>-->
        
          <form name ="recmet3" method="post" action="">
     	<input type="hidden" name="hide[{{$item.rr_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="hide[{{$item.rr_id}}]" value="1"  onclick="this.form.submit();" {{if $item.rr_hide  eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form>
                    
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