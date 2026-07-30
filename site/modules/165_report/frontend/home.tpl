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
#fancybox-wrap { z-index:999999 !important; }


.tableFixHead          { overflow-y: auto; height: 100px; }
.tableFixHead thead th { position: sticky; top: 0; text-align:left; }

table  { border-collapse: collapse; width: 100%; }

th     { z-index:9999; }

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

function add_change_needed()
{
	var viewurl = "{{$BASE_URL}}165_report.view_change_needed"+ "/random/" + Math.random();	

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
	var viewurl = "{{$BASE_URL}}165_report.view_procedure"+ "/random/" + Math.random();	

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
<div style="float:left; margin-left:5px; text-align:left;">
 &nbsp;&nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> 
&nbsp; &nbsp;
<input type="button" name="change_needed" value="Change Needed" onclick="javascript:add_change_needed();" /> <br /> 
		 &nbsp; &nbsp;<strong> Filter By : Completeness Check Pass? </strong> 
         <select name="checkpass"/>
         <option value="">Show All</option>
         <option value="Not Selected" {{if $item.os_comp_chk_pass eq 'Not Selected' }} selected="selected" {{/if}}>Not Selected</option> 
         <option value="Yes" {{if $item.os_comp_chk_pass eq 'Yes' }} selected="selected" {{/if}} >Yes</option>
         <option value="No" {{if $item.os_comp_chk_pass eq 'No' }} selected="selected" {{/if}} >No</option>
         </select>
        &nbsp; &nbsp;<input type="submit" value="Filter" name="filter" />   
        &nbsp;<input type="submit" name="clear" value = "Clear Filter" />   
        
        &nbsp; &nbsp;<strong> Was there a request for  </strong> 
         <select name="wasrequest"/>
         <option value="">Show All</option>
         <option value="-1">Not Selected</option> 
         <option value="1">Yes</option>
         <option value="2">No</option>
         </select>
        &nbsp; &nbsp;<input type="submit" value="Filter" name="wasrequ" />   
        &nbsp;<input type="submit" name="clear" value = "Clear Filter" /> 
        
         &nbsp; &nbsp;<strong> DA Passed  </strong> 
         <select name="dapassed"/>
         	<option value="Yes" >Yes</option>
             <option value="No" >No</option>
             <option value="Not Selected" >Not Selected</option>
         </select>
        &nbsp; &nbsp;<input type="submit" value="Filter" name="dap" />   
        &nbsp;<input type="submit" name="clear" value = "Clear Filter" />  
</div>

<div style="float:right;"> 
<input type="button" name="Add New " value="Add New" onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.detail}}');" />
</div>
</form>

<div id="">
    <!--<table id="list-table" class="nav-back" width="100%">-->
    <table id="doclist-table" class="nav-back tableFixHead" width="100%">
        <thead>
            <tr>
               <th class="topmenu" align="center" valign="middle" width="3%">Rec. No.</th>  
               <th class="topmenu" align="center" valign="middle" width="15%">Project Addreess</th> 
               <th class="topmenu" align="center" valign="middle" width="6%">DA Number</th> 
               <th class="topmenu" align="center" valign="middle" width="6%">Date DA Was Submitted</th>
               <th class="topmenu" align="center" valign="middle" width="5%">Completeness Check Pass?</th>
               <th class="topmenu" align="center" valign="middle" width="5%">Why did the completeness check fail?</th>
               <th class="topmenu" align="center" valign="middle" width="7%">Reason for Failed Completeness</th>
               
               <th class="topmenu" align="center" valign="middle" width="8%">Details</th>
               <th class="topmenu" align="center" valign="middle" width="8%">Change Needed</th>
               <th class="topmenu" align="center" valign="middle" width="8%">Utilities</th>
               <th class="topmenu" align="center" valign="middle" width="8%">What was resubmitted</th>
           <th class="topmenu" align="center" valign="middle" width="8%">Was there a request for further information after the completeness check</th>
               <th class="topmenu" align="center" valign="middle" width="5%">What information was requested</th> 
           
               <th class="topmenu" align="center" valign="middle" width="5%">DA Passed?</th> 
               <th class="topmenu" align="center" valign="middle" width="5%">DA approved with conditions</th> 
               <th class="topmenu" align="center" valign="middle" width="12%">Reason for Failed</th> 
               <th class="topmenu" align="center" valign="middle" width="5%">Action Taken To Improve System</th>
               <th class="topmenu" align="center" valign="middle" width="5%">Document Link</th> 
               <th class="topmenu" align="center" valign="middle" width="6%">Action</th>   
            </tr>
        </thead>
    <tbody>

 {{foreach from=$list key="key" item="item"}}

    <tr bgcolor="#FFFFFF">

        <td>{{counter}}</td>
        <td><a href = "{{$BASE_URL}}business.detail/bsn_id/{{$item.bsn_id}}" target="_blank">{{$item.os_project|stripslashes}}</a></td> 
        <td>{{$item.os_da_number}}</td> 
        <td>{{$item.bt_completed_date}}</td> 
        <!--<td>m{{$item.os_date_lodged}}</td>-->
       
        <td  {{if $item.os_comp_chk_pass eq 'Yes' }} style="background:#0C3;" {{elseif $item.os_comp_chk_pass eq 'No'}} style="background:#F00;" {{/if}}>
        <select name="{{$TABLE}}[os_comp_chk_pass]" Onchange = "compchk_update({{$item.os_id}},this.value)" />
         <option value="Not Selected" {{if $item.os_comp_chk_pass eq 'Not Selected' }} selected="selected" {{/if}}>Not Selected </option> 
         <option value="Yes" {{if $item.os_comp_chk_pass eq 'Yes' }} selected="selected" {{/if}} >Yes</option>
         <option value="No" {{if $item.os_comp_chk_pass eq 'No' }} selected="selected" {{/if}} >No</option>
         </select>
     <script>
	   
		function compchk_update(id,value)
		{
			
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}165_report.update_ccp/os_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	</script>
       </td>
       
       <td>
       
       <select name="why_did" Onchange = "update_why_did({{$item.os_id}},this.value)" />
       <option value="Authorisation From Errors" {{if $item.os_complete_check eq 'Authorisation From Errors'}} selected="selected" {{/if}}>Authorisation From Errors</option>
       <option value="Application Errors" {{if $item.os_complete_check eq 'Application Errors'}} selected="selected" {{/if}}>Application Errors</option>
       <option value="Details Missing From Plans" {{if $item.os_complete_check eq 'Details Missing From Plans'}} selected="selected" {{/if}}>Details Missing From Plans</option>
      <option value="Department Conditions" {{if $item.os_complete_check eq 'Department Conditions'}} selected="selected" {{/if}}>Department Conditions</option>
      <option value="NA" {{if $item.os_complete_check eq 'NA'}} selected="selected" {{/if}}>N/A</option>
      
      <option value="Legislation Compliance" {{if $item.os_complete_check eq 'Legislation Compliance'}} selected="selected" {{/if}}>Legislation Compliance</option>
      <option value="Missing plans" {{if $item.os_complete_check eq 'Missing plans'}} selected="selected" {{/if}}>Missing plans</option>
      <option value="Incorrect Plan Details" {{if $item.os_complete_check eq 'Incorrect Plan Details'}} selected="selected" {{/if}}>Incorrect Plan Details</option>
   <option value="Outdated Legislation Reference" {{if $item.os_complete_check eq 'Outdated Legislation Reference'}} selected="selected" {{/if}}>Outdated Legislation Reference</option>    
          
      </select>
     <script>
	   
		function update_why_did(id,value)
		{
			
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}165_report.update_why_did/os_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	</script>
       
       </td>
         
        <td>
         <textarea rows="4" cols="40" id="{{$item.os_id}}" style="overflow-y: scroll;">{{$item.os_reason_fail_comp}}</textarea>       
        <script>
	   
	    $(document).ready(function(){
                     $("#{{$item.os_id}}").keyup(function(){
                           reason_fail_comp({{$item.os_id}},this.value);
                     });
             });
	     
		   
	   function reason_fail_comp(id,value)
		{
	
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}165_report.reason_fail_comp/os_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
	
       </script>
         
        </td>
        
        <td>
        {{if $item.doc_file_name_228}}
      <!--<a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name_228}}" target="_blank">Notice Of Desicion</a>-->
      <a href="/165_report.download_content?file_name={{$item.doc_file_name_228}}&module_name=165_report.home" target="_blank">Notice Of Desicion</a> 
      
      <br /> {{$item.doc_date_uploaded_228}}
      {{/if}}
        
        </td>
        
        <td>
         <select name="cn" Onchange = "update_change_needed({{$item.os_id}},this.value)" />
         <option value="">Please Select</option>
         {{foreach from=$cndata key="key1" item="item1"}}

         <option value="{{$item1.cn_id}}" {{if $item.os_change_needed eq $item1.cn_id }} selected="selected" {{/if}}>{{$item1.cn_option}}</option>
         {{/foreach}}
         
        </select>
        
        <script>
	   
		function update_change_needed(id,value)
		{
			
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}165_report.update_change_needed/os_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	</script>
        
        </td>
        <td> <a href="{{$BASE_URL}}165_report.utilities/os_id/{{$item.os_id}}/bsn_id/{{$item.bsn_id}}" class="various">Utilities</a></td>
           
           <td>
 
        
         <textarea rows="4" cols="40" id="what{{$item.os_id}}" style="overflow-y: scroll;">{{$item.os_what_was}}</textarea>       
        <script>
	   
	    $(document).ready(function(){
                     $("#what{{$item.os_id}}").keyup(function(){
                           update_what_was({{$item.os_id}},this.value);
                     });
             });
	     
		   
	  function update_what_was(id,value)
		{
			
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}165_report.update_what_was/os_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	    </script>
	
      
        
           
           </td>
           
       <td>
       
       <select name="os_was_there" Onchange = "update_os_was_there({{$item.os_id}},this.value)" />
         <option value="0" {{if $item.os_was_there_request eq '0' }} selected="selected" {{/if}}>Not Selected</option> 
         <option value="1" {{if $item.os_was_there_request eq '1' }} selected="selected" {{/if}}>Yes</option>
         <option value="2" {{if $item.os_was_there_request eq '2' }} selected="selected" {{/if}}>No</option>
        </select>
        
        <script>
	   
		function update_os_was_there(id,value)
		{
			
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}165_report.update_os_was_there/os_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	   </script>
       
       </td>    
           
       <td>
        <textarea rows="4" cols="40" id="info{{$item.os_id}}" style="overflow-y: scroll;">{{$item.os_what_info_req}}</textarea>       
        <script>
	   
	    $(document).ready(function(){
                     $("#info{{$item.os_id}}").keyup(function(){
                           update_what_info({{$item.os_id}},this.value);
                     });
             });
	     
		   
	  function update_what_info(id,value)
		{
			
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}165_report.update_what_info/os_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	    </script>
       
       </td> 
     
        <td> 
         <select name="os_da_passed"  Onchange = "dapassed_update({{$item.os_id}},this.value)"/>
             <option value="Yes" {{if $item.os_da_passed eq 'Yes' }} selected="selected" {{/if}}>Yes</option>
             <option value="No" {{if $item.os_da_passed eq 'No' }} selected="selected" {{/if}}>No</option>
             <option value="Not Selected" {{if $item.os_da_passed eq 'Not Selected' }} selected="selected" {{/if}}>Not Selected</option>
         </select>
         
         <script>
	   
		function dapassed_update(id,value)
		{
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}165_report.update_dapassed/os_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	     </script>
        </td>
        
        <td>
        <select name="da_approved"  Onchange = "update_da_approved({{$item.os_id}},this.value)"/>
             <option value="Yes" {{if $item.os_da_approved eq 'Yes' }} selected="selected" {{/if}}>Yes</option>
             <option value="No"  {{if $item.os_da_approved eq 'No' }} selected="selected" {{/if}}>No</option>
             <option value="NA"  {{if $item.os_da_approved eq 'NA' }} selected="selected" {{/if}}>N/A</option>
             <option value="Not Selected" {{if $item.os_da_approved eq 'Not Selected' }} selected="selected" {{/if}}>Not Selected</option>
         </select>
         
         <script>
	   
		function update_da_approved(id,value)
		{
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}165_report.update_da_approved/os_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	     </script>
        
        </td>
        <td>

        
        
        
         <textarea rows="4" cols="40" id="rfup{{$item.os_id}}" style="overflow-y: scroll;">{{$item.os_reason_failed}}</textarea>       
        <script>
	   
	    $(document).ready(function(){
                     $("#rfup{{$item.os_id}}").keyup(function(){
                           resfailed_update({{$item.os_id}},this.value);
                     });
             });
	     
		   
        
        
	   
		function resfailed_update(id,value)
		{
			
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}165_report.update_resfailed/os_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	    </script>
       </td>  
         
       <td>
       <textarea rows="4" cols="40" id="act_tak{{$item.os_id}}" style="overflow-y: scroll;">{{$item.so_action_taken}}</textarea>       
        <script>
	   
	    $(document).ready(function(){
                     $("#act_tak{{$item.os_id}}").keyup(function(){
                           update_action_taken({{$item.os_id}},this.value);
                     });
             });
	     
	   
		function update_action_taken(id,value)
		{
			
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}165_report.update_action_taken/os_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	    </script>
       
       </td>  
         
        <td>
        
         <form name="cal" method="post" enctype="multipart/form-data"> 
        <input type="hidden" name="os_id" value="{{$item.os_id}}"  />
        <input type="file" name="document" /><br />
        
        {{if $item.os_doc_link}}
        <div style="text-align:center;"> 
     <!--   <a href="https://deckquote.s3.amazonaws.com/files/uploads/{{$item.os_doc_link}}" target="_blank">Download</a>-->
        <a href="/165_report.download_content_up?file_name={{$item.os_doc_link}}&module_name=165_report.home" target="_blank">Download</a> 
        
        
        <a href="{{$BASE_URL}}165_report.delete_doc/os_id/{{$item.os_id}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img src="{{$BASE_URL}}/images/delete_icon.png" width="20" /></a>
        </div> {{/if}}
        
       <input type= "submit" name="save_doc" title="Save" value="Upload" class="set2"> &nbsp; 
        </form>
        
        </td>  
        <td> <a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" class="various" title="Edit"> 
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