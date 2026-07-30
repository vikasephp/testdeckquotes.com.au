<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/w3manoj.css" />
{{include file=$jdata}}
{{include file=$tiny_basic}}		

<script>!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');</script>
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
	var viewurl = "{{$BASE_URL}}missing_variation_invoice_report.view_procedure"+ "/random/" + Math.random();	

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



function add_action()
{
	var viewurl = "{{$BASE_URL}}missing_variation_invoice_report.view_action"+ "/random/" + Math.random();	

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
	var viewurl = "{{$BASE_URL}}missing_variation_invoice_report.view_status"+ "/random/" + Math.random();	

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
<div style="float:left; text-align:left; display:grid; grid-template-columns: 1fr 1fr;">
<div>
&nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> 
&nbsp;<input type="button" name="action" value="Action Admin" onclick="javascript:add_action();" /> 
&nbsp;<input type="button" name="status" value="Status Admin" onclick="javascript:add_status();" /> 

 <br />
&nbsp;<strong>Search : </strong>
<input type="text" name="keyword" value="{{$keyword}}" style="width:300px;" placeholder="Search for Project Name OR Invoice Number"/>
<input type="submit" value="Search" name="search"  /> &nbsp;<input type="submit" name="clear_search" value = "Clear Search" />
</div>
 <div style="margin-left:20px;">
<table border="1" style="font-weight:bold;" cellpadding="3" width="200">
<tr>
<th style="text-align:center">Total Variations</th>
<th style="text-align:center">Send</th>
</tr>
<tr>
<td style="text-align:center">{{$total}}</td>
<td style="text-align:center">{{$sendtotal}}</td>
</tr>


</table>                  
</div>
</div>
<div style="float:right;">
<input type="submit" value="Show Hidden" name="unhide_mvir">&nbsp; &nbsp;
<input type="button" name="Add New " value="Add New" onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.detail}}');" />&nbsp; &nbsp;
<input type="button" value="Export To XLS" onclick="document.location.href='{{$BASE_URL}}missing_variation_invoice_report.home/export/1'" /> &nbsp;
</div>
</form>

<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
                   <th class="topmenu" align="center" valign="middle" width="3%">SrNo</th> 
                   <th class="topmenu" align="center" valign="middle" width="21%">Project Name</th> 
                   <th class="topmenu" align="center" valign="middle" width="5%">Variations Per Project</th> 
                   <th class="topmenu" align="center" valign="middle" width="7%">Variation Name</th> 
                   <th class="topmenu" align="center" valign="middle" width="7%">Variation Link</th> 
                   <th class="topmenu" align="center" valign="middle" width="7%">Signed Variation Date</th> 
                   <th class="topmenu" align="center" valign="middle" width="7%">Days</th> 
                   <th class="topmenu" align="center" valign="middle" width="7%">Value of Variations</th> 
                   <th class="topmenu" align="center" valign="middle" width="12%">Invoice Number with File</th> 
                   <th class="topmenu" align="center" valign="middle" width="7%">Invoice Creation Date</th>
                   <th class="topmenu" align="center" valign="middle" width="7%">Invoice Sent Date</th>
                   <th class="topmenu" align="center" valign="middle" width="7%">Actions</th>
                   <th class="topmenu" align="center" valign="middle" width="7%">Status</th>
                   <th class="topmenu" align="center" valign="middle" width="18%">Notes</th>
                   <th class="topmenu" align="center" valign="middle" width="7%">Action</th>
                   <th class="topmenu" align="center" valign="middle" width="7%">Hide</th>
            </tr>
        </thead>
    <tbody>

  {{assign var=countn value= $total}}
 {{foreach from=$list key="key" item="item"}}

    <tr bgcolor="#FFFFFF">

        <td>{{$item.mv_id}}</td>
        <td><a href="{{$item.link}}" target="_blank">{{$item.mv_project }}</a></td>
        <td>{{$item.vpp}}</td>
        <td>{{$item.mv_variation_name }}</td> 
         
        <td>{{if $item.va_signed}}
        <a href="/missing_variation_invoice_report.download_content_vd?file_name={{$item.va_signed}}&module_name=missing_variation_invoice_report.home
" target="_blank">Link</a>{{/if}}</td> 
         <td>m{{$item.va_variation_date }}</td> 
          <td>{{$item.dayscount}}</td> 
        <td>{{$item.mv_variation_value}}</td>
        <td><a href="/missing_variation_invoice_report.download_content?file_name={{$item.mv_invoice}}&module_name=missing_variation_invoice_report.home
" target="_blank">{{$item.mv_invoice_num}}</a><br />{{$item.mv_inv_upload_date}}<br />{{$item.mv_inv_upload_user}}
        </td>
       
        
        <td>{{$item.mv_inv_create_date}}<br />{{$item.mv_inv_create_user}}</td>
        
        <td>{{$item.mv_inv_sent_date }}<br />{{$item.mv_inv_sent_user}}</td>
        <td>
         <form name ="recmet4" method="post" action="">
          <select name="action[{{$item.mv_id}}]" onChange="update_action({{$item.mv_id}}, this.value)"/>
                <option value="0" {{if $item.mv_action eq 0}} selected="selected" {{/if}}>Please Select </option>
                {{foreach from = $actionData key="key5" item="item5"}}
                <option value="{{$item5.ma_id}}" {{if $item5.ma_id eq $item.mv_action}} selected="selected" {{/if}}>{{$item5.ma_option}}</option>
                {{/foreach}}
                     
          </select>
        </form>
          <div id="cond{{$item.mv_id}}">{{$item.mv_action_user}} </div> 
          <script>
			function update_action(id,value)
			{
					 var cond = '#cond'+id;
					 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}missing_variation_invoice_report.update_action/mv_id/"+id+"/value/"+value,
						     success: function(result){
							 $(cond).html(result);	 
						}
					});
			}
	    </script>
        </td>
        
        
          <td>
         <form name ="recmet4" method="post" action="">
          <select name="status[{{$item.mv_id}}]" onChange="update_status({{$item.mv_id}}, this.value)"/>
                <option value="0" {{if $item.mv_status eq 0}} selected="selected" {{/if}}>Please Select </option>
                {{foreach from = $statusData key="key4" item="item4"}}
                <option value="{{$item4.st_id}}" {{if $item4.st_id eq $item.mv_status}} selected="selected" {{/if}}>{{$item4.st_option}}</option>
                {{/foreach}}
                     
          </select>
        </form>
          <div id="stu{{$item.mv_id}}">{{$item.mv_status_user}} </div> 
          <script>
			function update_status(id,value)
			{
					 var stu = '#stu'+id;
					 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}missing_variation_invoice_report.update_status/mv_id/"+id+"/value/"+value,
						     success: function(result){
							 $(stu).html(result);	 
						}
					});
			}
	    </script>
        </td>
        
        
        
        <td>{{$item.mv_notes}}</td>
    
       
        <td> <a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" class="various" title="Edit"> 
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
             <a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete">
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>&nbsp;&nbsp
             
        </td>
        <td>
			<form name="mvirHide" method="post" action="">
                <label class="switch" for="mvir_hide_{{ $item.mv_id }}" data-value="{{ $item.mv_hide }}">
                    <input id="mvir_hide_{{ $item.mv_id }}" class="switch-input" {{ if $item.mv_hide eq 1 }} checked {{ /if }} onclick="mvDisplayToggle('{{$item.mv_id}}', this.checked)"
                        type="checkbox" />
                    <span class="switch-label" data-on="Yes" data-off="No"></span>
                    <span class="switch-handle"></span> <br />
                </label>
            </form>
            <script>
			function mvDisplayToggle(id,value)
			{
			    var val;
		        if(value == false) { val = 0; } else { val = 1; }
		
				$.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}missing_variation_invoice_report.update_mvir_toggle/mv_id/"+id+"/value/"+val,
				   success: function(result){
						if (val == 1){
						    //alert("Status is changed to Hide");
                            //location.reload();
                            //window.location.reload(true);
                            $('input[name="clear_search"]').trigger('click');
						} else {
						   //alert("Status is changed to Unhide");
						}
					}
				});
			}
	        </script> 
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
