<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/w3manoj.css" />
{{include file=$jdata}}
{{include file=$tiny_basic}}		

<script>!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />

<h3 class="page-title">{{$title}} - Accounts</h3>
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
	var viewurl = "{{$BASE_URL}}email_response_tracker.view_procedure"+ "/random/" + Math.random();	

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
	var viewurl = "{{$BASE_URL}}email_response_tracker.view_status"+ "/random/" + Math.random();	

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

function add_type()
{
	var viewurl = "{{$BASE_URL}}email_response_tracker.view_type"+ "/random/" + Math.random();	

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
&nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> 
&nbsp; &nbsp;<input type="button" name="status_options" value="Status Admin" onclick="javascript:add_status();" />
&nbsp; &nbsp;<input type="button" name="type_options" value="Type Admin" onclick="javascript:add_type();" />
 <br />
&nbsp;<strong>Search : </strong>
<input type="text" name="keyword"  style="width:300px;" placeholder="Search for Sender Name OR Email OR Subject"/>
<input type="submit" value="Search" name="search"  /> &nbsp;<input type="submit" name="clear_search" value = "Clear Search" />
 <br />
&nbsp;<strong> Filter By Responsible Status: </strong> 
      <select name="status_search"/>
        <option value="0">Please Select</option>
        {{foreach from = $statusdetail key="key3" item="item3"}}
        <option value="{{$item3.st_id}}" >{{$item3.st_option}}</option>
        {{/foreach}}
        </select> 
        &nbsp; &nbsp;<input type="submit" value="Filter" name="filter" />   
        &nbsp;<input type="submit" name="clear" value = "Clear Filter" />    

&nbsp;<strong> Filter By Priority: </strong> 
     <select name="priority">
     <option value="0">Please Select</option>
     <option value="High" >High</option>
	 <option value="Medium" >Medium</option>
     <option value="Low" >Low</option>  
     </select>
        &nbsp; &nbsp;<input type="submit" value="Filter" name="filter" />   
        &nbsp;<input type="submit" name="clear" value = "Clear Filter" />
 <br />
&nbsp;<strong> Filter By Type: </strong> 
      <select name="type_search"/>
        <option value="0">Please Select</option>
        {{foreach from = $typedetail key="key4" item="item4"}}
        <option value="{{$item4.et_id}}" >{{$item4.et_option}}</option>
        {{/foreach}}
        </select> 
        &nbsp; &nbsp;<input type="submit" value="Filter" name="filter" />   
        &nbsp;<input type="submit" name="clear" value = "Clear Filter" />        
        
</div>

<div style="float:right;">  
<input type="submit" value="Print" name="print"  /> &nbsp;
<!--<input type="submit" name="hidden" value="Show All" /> &nbsp;-->
<input type="button" name="Add New " value="Add New" onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.detail}}');" />&nbsp; &nbsp; <br />
<input type="submit" name="show_hidden" value="Show Hidden With All Records" /> &nbsp;
</div>
</form>

<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
                   <th class="topmenu" align="center" valign="middle" width="3%">Unique Id</th> 
                   <th class="topmenu" align="center" valign="middle" width="14%">Email Source </th> 
                   <th class="topmenu" align="center" valign="middle" width="8%">Sender Name</th> 
                   <th class="topmenu" align="center" valign="middle" width="8%">Sender Email</th> 
                   <th class="topmenu" align="center" valign="middle" width="8%">Project Link</th> 
                   <th class="topmenu" align="center" valign="middle" width="15%">Email Subject</th>
                   <th class="topmenu" align="center" valign="middle" width="8%">Type</th>
                   <th class="topmenu" align="center" valign="middle" width="6%">Date of Last Sender Email</th>
                   <th class="topmenu" align="center" valign="middle" width="8%">Responsible Status</th>
                   <th class="topmenu" align="center" valign="middle" width="8%">Response Date</th>
                   <th class="topmenu" align="center" valign="middle" width="5%">Priority Level</th>
                   <th class="topmenu" align="center" valign="middle" width="5%">Responsible Person</th>
                   <th class="topmenu" align="center" valign="middle" width="5%">Email Snapshot</th>
                   <th class="topmenu" align="center" valign="middle" width="5%">Response Snapshot</th>
                   <th class="topmenu" align="center" valign="middle" width="5%">Hide</th>
                   <th class="topmenu" align="center" valign="middle" width="6%">Action</th>   
            </tr>
        </thead>
    <tbody>

  {{assign var=countn value= $total}}
 {{foreach from=$list key="key" item="item"}}

    <tr bgcolor="#FFFFFF">

        <td>{{$item.er_id}}</td>
        <td>{{$item.er_email_source }}</td>
        <td>{{$item.er_customer_name}}</td>  
        <td>{{$item.er_customer_email}}</td>
        <td>{{if $item.er_project}}<a href="{{$item.link}}" target="_blank">Link</a>{{/if}}</td>
        <td>{{$item.er_email_subject}}</td>
        
        <td> 
        <form name="typ" method="post" action="">
       <select name="res_type[{{$item.er_id}}]"  onchange="update_type({{$item.er_id}},this.value);">
       <option value="0">Please Select</option>
       {{foreach from=$typedetail key="key3" item="item3"}}
        <option value="{{$item3.et_id}}" {{if $item3.et_id eq $item.er_response_type}} selected="selected" {{/if}}>{{$item3.et_option}}</option>
       {{/foreach}}
       </select>
        </form>
         <script language="javascript">
     	
		function update_type(id,value)
		{
			$.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}email_response_tracker.update_type/er_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
					
		}  
     </script>   
        </td>
        
        <td>{{$item.er_last_email_date}}</td>
        <td> 
        <form name="stu" method="post" action="">
       <select name="res_status[{{$item.er_id}}]"  onchange="this.form.submit();">
       <option value="0">Please Select</option>
       {{foreach from=$statusdetail key="key2" item="item2"}}
        <option value="{{$item2.st_id}}" {{if $item2.st_id eq $item.er_response_status}} selected="selected" {{/if}}>{{$item2.st_option}}</option>
       {{/foreach}}
       </select>
        </form>
       <span> {{$item.er_resp_status_date}}<br />{{$item.er_resp_status_user}}</span>
        </td>
        <td>{{$item.er_response_date}}</td>
        <td {{if $item.er_priority eq 'High'}} style="background: #F00;"
            {{elseif $item.er_priority eq 'Medium'}} style="background: #F6C;" 
            {{elseif $item.er_priority eq 'Low'}} style="background:#FF0;" {{/if}} >{{$item.er_priority}}</td>  
        
        <td> {{$item.er_responsible_person}}</td>
       <td>
       {{if $item.er_email_snapshot}}
    
        <img  data-img-name="{{$item.er_email_snapshot}}" data-img-id="{{$item.er_email_snapshot}}-{{ $item.er_id }}" src="/email_response_tracker.download_content?file_name={{$item.er_email_snapshot}}&module_name=email_response_tracker.home" style="width:100%;cursor:pointer; padding:2px;" 
    onclick="onClick(this)" class="w3-hover-opacity" />
        {{/if}}
       
       </td>
       
       
       <td>
       {{if $item.er_response_snapshot}}
    
        <img  data-img-name="{{$item.er_response_snapshot}}" data-img-id="{{$item.er_response_snapshot}}-{{ $item.er_id }}" src="/email_response_tracker.download_content?file_name={{$item.er_response_snapshot}}&module_name=email_response_tracker.home" style="width:100%;cursor:pointer; padding:2px;" 
    onclick="onClick(this)" class="w3-hover-opacity" />
        {{/if}}
       
       </td>
       <td>
         <form name ="recmet3" method="post" action="">
     	<input type="hidden" name="hide[{{$item.er_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="hide[{{$item.er_id}}]" value="1"  onclick="this.form.submit();" {{if $item.er_hide eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
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
   
   <div id="modal01" class="w3-modal" onclick="this.style.display='none'" style="z-index:999999">
  <span class="w3-button w3-hover-red w3-xlarge w3-display-topright">&times;</span>
  <div class="w3-modal-content w3-animate-zoom">
    <img id="img01" style="height:100%">
  </div>
</div>

<script>
function onClick(element) {
  document.getElementById("img01").src = element.src;
  document.getElementById("modal01").style.display = "block";
}
</script>
    
   
    
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


<script type="text/javascript">

   function get_img_raw_data(myKeyVals){
      $.ajax({
              type: 'POST',
              url: '/email_response_tracker.get_image_raw_data',
              data: myKeyVals,
              dataType: "json",
              success: function(resultData) 
              {
              	if(resultData.status == 'true')
              	{ 
              	    var img_raw_data = resultData.data.rawImgData;
              	    var file_name = resultData.data.fileName;
              	    var file_id = resultData.data.id;
              	    $('#doclist-table img[data-img-id="'+file_id+'"]').attr("src",img_raw_data);
              	}
              }
        });
    }
    $(document).ready(function(){
        $("#doclist-table tr img.w3-hover-opacity").each(function(){
            var file_name = $.trim( $(this).attr("data-img-name") )
            var id = $.trim( $(this).attr("data-img-id") );
            var myKeyVals = { "file_name":file_name ,"id":id } ;
            get_img_raw_data(myKeyVals);
        })
    })
</script> 