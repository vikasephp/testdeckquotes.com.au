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

function add_component()
{
	var viewurl = "{{$BASE_URL}}quote_builder.view_component"+ "/random/" + Math.random();	

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

function defa_document()
{
	var viewurl = "{{$BASE_URL}}quote_builder.default_documents"+ "/random/" + Math.random();	

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


function add_procedure()
{
	var viewurl = "{{$BASE_URL}}quote_builder.view_procedure"+ "/random/" + Math.random();	

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


<table  width="100%"><tr><td>
<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">

<div style="float:left;">
<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> <br />
<strong> Project Name  : </strong> 
<input type="text" list = 'project' name="project_name" style ="width:300px" value="{{$search_project}}" />
<input type="submit" name="search" value = "Search" /> 
<input type="submit" name="clear" value = "Clear Search" /> <br />

<strong> Supplier Name  : </strong> 
<input type="text"  name="supplier_name" style ="width:300px" value="{{$search_supplier}}" />
<input type="submit" name="search_supplier" value = "Search" /> 
<input type="submit" name="clear" value = "Clear Search" /> <br />

<strong> Responsible Staff : </strong> 
<select name="resstaf" >
{{foreach from=$rsdetail key="key1" item="item1"}}
<option value="{{$item1.cs_position}}">{{$item1.cs_position}}</option>
{{/foreach}}
</select>
<input type="submit" name="search_rs" value = "Search" /> 
<input type="submit" name="clear" value = "Clear Search" /> <br />
</div>


<div style="float:right; text-align:right;"> 
<input type="button" name="priority" value="Default Documents" onclick="javascript:defa_document();" /> 
<input type="submit" name="showall" value="Show Hidden" />
<input type="button" name="priority" value="Edit Component" onclick="javascript:add_component();" /> 
<input type="button" name="Add New " value="Add New" onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.detail}}');" />
<input type="button" name="Add New " value="Add New 2" onclick="javascript:add_new('{{$BASE_URL}}quote_builder.add_supplier');" />
</div>
</form>
</td></tr></table>

<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
                   <th class="topmenu" align="center" valign="middle" width="3%">Sr. No.</th>  
                   <th class="topmenu" align="center" valign="middle" width="15%">Supplier</th> 
                    <th class="topmenu" align="center" valign="middle" width="5%">Contacts</th> 
                   <th class="topmenu" align="center" valign="middle" width="15%">Project</th> 
                   <th class="topmenu" align="center" valign="middle" width="5%">Component</th> 
                   <th class="topmenu" align="center" valign="middle" width="5%">Due Date</th>
        	       <th class="topmenu" align="center" valign="middle" width="18%">Quote Detail From Supplier</th> 
                   <th class="topmenu" align="center" valign="middle" width="9%">Attachments From Suppliers</th>
 		           <th class="topmenu" align="center" valign="middle" width="4%">Status</th> 
                   <th class="topmenu" align="center" valign="middle" width="8%">Q & A</th>
                   <th class="topmenu" align="center" valign="middle" width="8%">Responsible Staff</th>  
                   <th class="topmenu" align="center" valign="middle" width="8%">Approval</th> 
                   <th class="topmenu" align="center" valign="middle" width="9%">Hide</th>  
                   <th class="topmenu" align="center" valign="middle" width="9%">Action</th>   
            </tr>
        </thead>
    <tbody>


 {{foreach from=$list key="key" item="item"}}

    <tr bgcolor="#FFFFFF">

        <td>{{counter}}</td>
        <td>{{$item.qb_supplier}}</td>
        <td><a href="{{$BASE_URL}}quote_builder.show-contacts/co_id/{{$item.co_id}}/qb_id/{{$item.qb_id}}" class="various">Show</a> </td>
        <td>{{$item.qb_project }}</td> 
        <td>{{$item.qb_component}}

        </td>
        <td>{{$item.due_date}}</td>  
      
        <td>{{$item.quote_detail}}</td>
        <td>
        {{if $item.attach_1}}
        <!--<a href="https://deckquote.s3.amazonaws.com/files/quote_builder/{{$item.attach_1}}" target="_blank">Attachment 1</a>-->
        <a href="/quote_builder.download_content?file_name={{$item.attach_1}}&module_name=quote_builder.home">Attachment 1</a>
        <br />{{/if}}
        {{if $item.attach_2}}
        <!--<a href="https://deckquote.s3.amazonaws.com/files/quote_builder/{{$item.attach_2}}" target="_blank">Attachment 2</a>-->
        <a href="/quote_builder.download_content?file_name={{$item.attach_2}}&module_name=quote_builder.home">Attachment 2</a>
        <br />{{/if}}
        {{if $item.attach_3}}
        <!--<a href="https://deckquote.s3.amazonaws.com/files/quote_builder/{{$item.attach_3}}" target="_blank">Attachment 3</a>-->
        <a href="/quote_builder.download_content?file_name={{$item.attach_3}}&module_name=quote_builder.home">Attachment 3</a>
        <br />{{/if}}
        {{if $item.attach_4}}
        <!--<a href="https://deckquote.s3.amazonaws.com/files/quote_builder/{{$item.attach_4}}" target="_blank">Attachment 4</a>-->
        <a href="/quote_builder.download_content?file_name={{$item.attach_4}}&module_name=quote_builder.home">Attachment 4</a>
        <br />{{/if}}
        {{if $item.attach_5}}
       <!-- <a href="https://deckquote.s3.amazonaws.com/files/quote_builder/{{$item.attach_5}}" target="_blank">Attachment 5</a>-->
        <a href="/quote_builder.download_content?file_name={{$item.attach_5}}&module_name=quote_builder.home">Attachment 5</a>
        <br />{{/if}}
         </td>
         

         <td {{if $item.qb_approval eq 1}} style="background:#0C3" {{elseif $item.qb_approval eq 2}} style="background: #F00;"
         {{elseif $item.qu_quote_builder_id}} style="background:#FFBF00;" {{/if}}>  
         {{if $item.qb_approval eq 1}} Approved
         {{elseif $item.qb_approval eq 2}} Closed
         {{elseif $item.qu_quote_builder_id}} Quoted 
         
         {{else}}
         <select name="{{$TABLE}}[qb_status]"  Onchange = "update_status({{$item.qb_id}},this.value)">
         {{foreach from = $qstatus key="key3" item="item3"}}
        <option value="{{$item3.to_option}}" {{if $item3.to_option eq $item.qb_status }} selected="selected" {{/if}}>{{$item3.to_option}}</option>
        {{/foreach}}
        </select>
        
         <script>
	   
		function update_status(id,value)
		{
			
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}quote_builder.update_status/qb_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	</script>
        {{/if}}
        
        </td>
       
        <td {{if $item.que gt 0}} {{$item.colr}} {{/if}}> {{if $item.que gt 0}}
        <a href="{{$BASE_URL}}quote_builder.view_questions/qb_id/{{$item.qb_id}}" class="various">View Questions</a>
        {{/if}}
        </td>
     	<td>{{$item.qb_sup_position}}</td>
        <td> <form name='qb' method="post" action="">
        <input type="hidden" name="qb_id[{{$item.qb_id}}]" value="{{$item.qb_id}}"  />

        <select name="qb_approval[{{$item.qb_id}}]">
        <option value="0"> Please Select </option>
        <option value="1" {{if $item.qb_approval eq 1}} selected="selected" {{/if}}> Approved </option>
        <option value="2" {{if $item.qb_approval eq 2}} selected="selected" {{/if}}> Rejected </option>
        </select>
          
        <input type="submit" name="test" value="Confirm" class="cnf" />
        </form>
         </td>
       
         <td>
         <form name ="recmet3" method="post" action="">
     	<input type="hidden" name="hide[{{$item.qb_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="hide[{{$item.qb_id}}]" value="1"  onclick="this.form.submit();" {{if $item.qb_hide eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form>  
         
         </td>
        
        <td> <a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" class="various" title="Edit"> 
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;
             <a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete">
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>&nbsp;
             {{if $item.qb_status eq 'Open'}}
              <a  href="{{$BASE_URL}}quote_builder.send_email/{{$ID}}/{{$item.$ID}}"  title="Send Email" style="cursor:pointer; " class="various">
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/email_logo.png"/></a>
          
             {{else}}
             
             
              <a  onclick="javascript:alert('Email alert can be sent only if the quote is open');" title="Delete" style="cursor:pointer;">
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/email_logo.png"/></a>
             {{/if}}	
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