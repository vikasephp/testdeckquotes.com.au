{{if $div_id}}{{$div_id}}||{{/if}}
{{if $folowups_list_data}}
<table cellpadding="3" cellspacing="3" width="98%" id="list-table" border="0">
  {{if $list}}  
<tr bgcolor="#CCCCCC"><th>Action</th><th>Cerate Date</th><th>Done</th><th>Done User</th><th>Comments</th><th>Approved</th></tr>
         {{foreach from=$list key="key" item="item"}}
		<tr> 
       <td width="10%">
         <a href="javascript:parent.call_followup_window_edit('/cust_id/{{$cust_id}}/bef_fups_id/{{$item.bef_fups_id}}');"  title="Edit">
         <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
         <a href="javascript:requesDelete('deletebyerfollowup', {{$item.bef_fups_id}})" onclick="javascript:if(!confirm('Are you sure you want to delete.?')) return false;"  title="Delete"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a></td>        
         <td>{{$item.bef_create_date|date_format:"%d-%m-%Y"}}</td>
         <td>{{if $item.bef_done_date !== '0000-00-00'}}{{$item.bef_done_date|date_format:"%d-%m-%Y"}}{{/if}}</td>
         <td>{{$item.user_name}}</td>
         <td width="50%">{{$item.bef_comments}}</td>
         <td><input type="checkbox" disabled="disabled" {{ if $item.bef_approved == 1}} checked="checked" {{/if}} /></td> 
</tr>
         {{/foreach}}	
	</table>
{{/if}}
{{/if}}

{{if $last > 1}} 
     <table width="90%" border="0" cellpadding="0" cellspacing="0">   
    <tr>  
  {{if $list}}   
<td align="center">

 <div class='pagination'>
 {{if $pagenum == 1}}
 <span class='disabled'>« previous</span>
 {{else}}
<a class="pagination" href="javascript:requestbyerInfo('{{$requester}}', {{math equation="x - y" x=$pagenum y=1}}, '{{$div_id}}')" title="Previous">« previous</a>
 {{/if}}
        
{{if $pagenum != 1}}
 <span class="paginate"><a class="pagination"  href="javascript:requestbyerInfo('{{$requester}}', 1, '{{$div_id}}');" title="{{$page_num}} Page">1</a></span>
 {{else}}<span class='current'>1</span>
 {{/if}}{{if $pagenum != 2}}
   <span class="paginate"><a class="pagination"  href="javascript:requestbyerInfo('{{$requester}}', 2, '{{$div_id}}');" title="{{$page_num}} Page">2</a></span>
{{else}}<span class='current'>2</span>
 {{/if}}
{{if $paginateprev.0 > 3}}
...
{{/if}}
{{foreach from=$paginateprev key="page_key" item="page_num"}}
	{{if $page_num == $pagenum OR $page_num <= 2}}
   		{{elseif $page_num == $lastone}}
    	{{else}} <span class="paginate"><a class="pagination"  href="javascript:requestbyerInfo('{{$requester}}', {{$page_num}}, '{{$div_id}}')" title="{{$page_num}} Page">{{$page_num}}</a></span>
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
                        <a class="pagination"  href="javascript:requestbyerInfo('{{$requester}}', {{$page_num2}}, '{{$div_id}}')" title="{{$page_num2}} Page">{{$page_num2}}</a>
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
<a class="pagination"  href="javascript:requestbyerInfo('{{$requester}}', {{$lastone}}, '{{$div_id}}')" title="{{$lastone}} Page">{{$lastone}}</a>
{{/if}}
{{/if}}
{{if $last == 1}}
{{elseif $last == 2}}
{{else}}
{{if $pagenum == $last}}
<span class='current'>{{$last}}</span>
{{else}}
 <a class="pagination"  href="javascript:requestbyerInfo('{{$requester}}', {{$last}}, '{{$div_id}}')" title="{{$last}} Page">{{$last}}</a>
{{/if}}
{{/if}}
{{if $pagenum == $last}}
<span class='disabled'>next »</span>
 {{else}}
<a class="pagination" href="javascript:requestbyerInfo('{{$requester}}', {{math equation="x + y" x=$pagenum y=1}}, '{{$div_id}}')" title="Next">next »</a></div>
 {{/if}}
</td>
{{/if}}
 </tr>
</table>
{{/if}}

{{if $buyer_business_for_sale_list}}
<table cellpadding="3" cellspacing="3" width="99%" id="list-table" border="0">
<tr bgcolor="#CCCCCC">
	<th width="10%">Action</th>
    <th width="50%">Project Name</th>
    <th>Comments</th>
</tr>
     {{foreach from=$buyer_business_for_sale_list key="key" item="item"}}
		<tr> 
        <td >
         <a href="javascript:iframe_section('byersaleenquiry','/cust_id/{{$cust_id}}/bs_id/{{$item.bs_id}}');"  title="Edit">
         <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
         {{if $USER_GROUP == 'Administrators'}} 
         <a href="javascript:requesDelete('deletebyersaleenquiry', {{$item.bs_id}})" onclick="javascript:if(!confirm('Are you sure you want to delete.?')) return false;"  title="Delete"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>
         {{/if}}
        </td>        
        <td><a href="{{$BASE_URL}}business.detail/bsn_id/{{$item.bsn_id}}" target="_blank">{{$item.bsn_name}}</a></td>
        <td>{{$item.bs_comments}}</td> 
	 </tr>
     {{/foreach}}	
	</table>
</div>
 
<!--Buyer Business For Sales End-->

{{/if}}

{{if $last > 1}} 
     <table width="90%" border="0" cellpadding="0" cellspacing="0">   
    <tr>  
  {{if $buyer_business_for_sale_list}}   
<td align="center">

 <div class='pagination'>
 {{if $pagenum == 1}}
 <span class='disabled'>« previous</span>
 {{else}}
<a class="pagination" href="javascript:requestbyerInfo('{{$requester}}', {{math equation="x - y" x=$pagenum y=1}}, '{{$div_id}}')" title="Previous">« previous</a>
 {{/if}}
        
{{if $pagenum != 1}}
 <span class="paginate"><a class="pagination"  href="javascript:requestbyerInfo('{{$requester}}', 1, '{{$div_id}}');" title="{{$page_num}} Page">1</a></span>
 {{else}}<span class='current'>1</span>
 {{/if}}{{if $pagenum != 2}}
   <span class="paginate"><a class="pagination"  href="javascript:requestbyerInfo('{{$requester}}', 2, '{{$div_id}}');" title="{{$page_num}} Page">2</a></span>
{{else}}<span class='current'>2</span>
 {{/if}}
{{if $paginateprev.0 > 3}}
...
{{/if}}
{{foreach from=$paginateprev key="page_key" item="page_num"}}
	{{if $page_num == $pagenum OR $page_num <= 2}}
   		{{elseif $page_num == $lastone}}
    	{{else}} <span class="paginate"><a class="pagination"  href="javascript:requestbyerInfo('{{$requester}}', {{$page_num}}, '{{$div_id}}')" title="{{$page_num}} Page">{{$page_num}}</a></span>
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
                        <a class="pagination"  href="javascript:requestbyerInfo('{{$requester}}', {{$page_num2}}, '{{$div_id}}')" title="{{$page_num2}} Page">{{$page_num2}}</a>
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
<a class="pagination"  href="javascript:requestbyerInfo('{{$requester}}', {{$lastone}}, '{{$div_id}}')" title="{{$lastone}} Page">{{$lastone}}</a>
{{/if}}
{{/if}}
{{if $last == 1}}
{{elseif $last == 2}}
{{else}}
{{if $pagenum == $last}}
<span class='current'>{{$last}}</span>
{{else}}
 <a class="pagination"  href="javascript:requestbyerInfo('{{$requester}}', {{$last}}, '{{$div_id}}')" title="{{$last}} Page">{{$last}}</a>
{{/if}}
{{/if}}
{{if $pagenum == $last}}
<span class='disabled'>next »</span>
 {{else}}
<a class="pagination" href="javascript:requestbyerInfo('{{$requester}}', {{math equation="x + y" x=$pagenum y=1}}, '{{$div_id}}')" title="Next">next »</a></div>
 {{/if}}
</td>
{{/if}}
 </tr>
</table>
{{/if}}
{{if $cust_list_data == 'show' && $list}}
<table cellpadding="3" cellspacing="3" width="97%" id="list-table" >
		<tr bgcolor="#CCCCCC"><th>Action</th><th>Created Date</th><th>Status</th><th>Business</th><th>Initial Phone Call</th><th>Email Advice</th><!--<th>Answer Required</th>--></tr>
         {{foreach from=$list key="key" item="item"}}
         <tr>
         <th><div align="right"><a href="javascript:iframe_section('buyerenquiriesinfo','/cust_id/{{$item.be_customer_id}}/be_id/{{$item.be_id}}');" title="Edit">
                <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
                 {{if $USER_GROUP == 'Administrators'}}
                <a href="javascript:requesDelete('deletebuyerenquiry', {{$item.be_id}})" onclick="javascript:if(!confirm('Are you sure you want to delete the Enquiry?')) return false;" title="Delete"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a> {{/if}}</div></th>
         <td>{{$item.be_created_date|date_format:"%d-%m-%Y"}}</td>
         <td>{{if $item.be_status == 1}}Active{{else}}Inactive{{/if}}</td><td>{{$item.bsn_name}}</td>
         <td>{{if $item.be_ipc_date !== '0000-00-00'}}{{$item.be_ipc_date|date_format:"%d-%m-%Y"}} {{/if}}</td>
         <td>{{if $item.be_easts_date !== '0000-00-00'}}{{$item.be_easts_date|date_format:"%d-%m-%Y"}}{{/if}}</th>
        <!-- <td><input type="checkbox" {{if $item.be_answer_required == 1}} checked="checked" {{/if}} disabled="disabled" /></td>-->
             </tr>
         {{/foreach}}	
	</table>

 <!--Buyer Business For Sales-->
{{/if}}
{{if $cust_bslist_data == 'show'}}
{{$div_id}}||
{{if $list}}
<table cellpadding="3" cellspacing="3" width="90%" 	id="list-table" border="1">
		<tr bgcolor="#CCCCCC"><th>Business Name</th><th>Comments</th><th>Action</th></tr>
         {{foreach from=$list key="key" item="item"}}
         <tr><td>{{$item.bbfs_business_name}}</td><td>{{$item.bbfs_comments}}</td><td>
         <a href="javascript:iframe_section('byersaleenquiry','/cust_id/{{$item.bbfs_cust_id}}/bbfs_id/{{$item.bbfs_id}}');"  title="Edit">
         <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
         <a href="javascript:requesDelete('deletebuyersaleenquiry', {{$item.bbfs_id}})" onclick="javascript:if(!confirm('Are you sure you want to delete the Business?')) return false;"  title="Delete"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a></td></tr>
         {{/foreach}}	
	</table>
</div>
 
<!--Buyer Business For Sales End-->
{{/if}}
{{if $last > 1}} 
     <table width="90%" border="0" cellpadding="0" cellspacing="0">   
    <tr>  
  {{if $list}}   
<td align="center">

 <div class='pagination'>
 {{if $pagenum == 1}}
 <span class='disabled'>« previous</span>
 {{else}}
<a class="pagination" href="javascript:requestbyerInfo('{{$requester}}', {{math equation="x - y" x=$pagenum y=1}}, '{{$div_id}}')" title="Previous">« previous</a>
 {{/if}}
        
{{if $pagenum != 1}}
 <span class="paginate"><a class="pagination"  href="javascript:requestbyerInfo('{{$requester}}', 1, '{{$div_id}}');" title="{{$page_num}} Page">1</a></span>
 {{else}}<span class='current'>1</span>
 {{/if}}{{if $pagenum != 2}}
   <span class="paginate"><a class="pagination"  href="javascript:requestbyerInfo('{{$requester}}', 2, '{{$div_id}}');" title="{{$page_num}} Page">2</a></span>
{{else}}<span class='current'>2</span>
 {{/if}}
{{if $paginateprev.0 > 3}}
...
{{/if}}
{{foreach from=$paginateprev key="page_key" item="page_num"}}
	{{if $page_num == $pagenum OR $page_num <= 2}}
   		{{elseif $page_num == $lastone}}
    	{{else}} <span class="paginate"><a class="pagination"  href="javascript:requestbyerInfo('{{$requester}}', {{$page_num}}, '{{$div_id}}')" title="{{$page_num}} Page">{{$page_num}}</a></span>
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
                        <a class="pagination"  href="javascript:requestbyerInfo('{{$requester}}', {{$page_num2}}, '{{$div_id}}')" title="{{$page_num2}} Page">{{$page_num2}}</a>
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
<a class="pagination"  href="javascript:requestbyerInfo('{{$requester}}', {{$lastone}}, '{{$div_id}}')" title="{{$lastone}} Page">{{$lastone}}</a>
{{/if}}
{{/if}}
{{if $last == 1}}
{{elseif $last == 2}}
{{else}}
{{if $pagenum == $last}}
<span class='current'>{{$last}}</span>
{{else}}
 <a class="pagination"  href="javascript:requestbyerInfo('{{$requester}}', {{$last}}, '{{$div_id}}')" title="{{$last}} Page">{{$last}}</a>
{{/if}}
{{/if}}
{{if $pagenum == $last}}
<span class='disabled'>next »</span>
 {{else}}
<a class="pagination" href="javascript:requestbyerInfo('{{$requester}}', {{math equation="x + y" x=$pagenum y=1}}, '{{$div_id}}')" title="Next">next »</a></div>
 {{/if}}
</td>
{{else}}
<td align="center" height="300">Record Not found... </td>

{{/if}}
 </tr>
</table> 
{{/if}}{{/if}}
{{if $businessesshow}}
<div id="divInfosaleToReturn">
{{if $businesses}}
{{foreach from=$businesses key="key" item="item"}}
<a href="javascript:setsalevalue({{$item.bsn_id}},'{{$item.bsn_name}}')">{{$item.bsn_name}}</a><br />
{{/foreach}}     
 <a href="javascript:closediv()" class="close_span">[&#88;]</a>
 {{else}}
 <a href="javascript:closediv()" class="close_span">[&#88;]</a> 
 {{/if}}
</div>
{{/if}}
{{if !empty($iframe_data) AND $iframe_data==1}}

{{if $iframe_post_data ==1}}
<script type="text/javascript">
parent.RequestcheckListIframe('list_disclaimer','documentsIframelist');
</script>
{{/if}}
<!--------------- Begin iframe_data ------->
<link rel="stylesheet" href="{{$BASE_URL}}css/default/cis-styles.css" />
<div style="border:0px #CCCCCC solid; padding:0px;" id="checkListIframe"  >
  <form action="" method="post" enctype="multipart/form-data" name="iframe-form">
    <input type="hidden" name="cust_id" value="{{$disc_doc.bcust_id}}" />
    <input type="hidden" name="cust_name" value="{{$disc_doc.bcust_fname}}{{$disc_doc.bcust_lname}}" />
    <table cellpadding="0" cellspacing="0" class="table" width="80%" >
    <tr><td colspan="2"><span style="color:#FF0000; font-weight:bold;"> {{if $iframe_msg}}
				{{$iframe_msg}}
			{{/if}}</span></td></tr>
      <tr>
        <td>&nbsp;<strong>File:</strong></td>
        <td>
        {{if $disc_doc.bcust_gendec_file}}
        <a href="javascript:parent.viewimg('{{$BASE_URL}}{{$FILE_PATH}}files/disclaimers/{{$disc_doc.bcust_gendec_file|default:'no_image.gif'}}')" >View Documents</a>                        
        {{else}}
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        {{/if}}
        </td>
        <td><strong>Load:</strong>&nbsp;
        <input type="file" name="image" id="doc_file_name" />  
        </td>
         <td style="text-align:center;"><input type="submit"  value="Upload" name="submit_iframe" style="cursor:pointer;" /></td>
      </tr>
      <tr><td colspan="6">{{$disc_doc.bcust_gendec_file}}</td></tr>
    </table>
  </form>
</div>
<!--------------- End iframe_data ------->
<!-- End Create Document Checklist section -->
{{/if}}
{{if $list_doc}}
<!--------------- Begin iframe_data ------->
<link rel="stylesheet" href="{{$BASE_URL}}css/default/cis-styles.css" />
<div style="border:0px #CCCCCC solid; padding:0px;" id="checkListIframe" >
<script language="javascript">
function delete_doc(){document.iframe_form2.submit();}
</script>
 <form action="" method="post" name="iframe_form2">
    <input type="hidden" name="cust_id" value="{{$list_doc.bcust_id}}" />
     <input type="hidden" name="submit_iframe" value="submit_iframe" />
 <table cellpadding="3" cellspacing="3" width="52%" id="list-table" >
 {{if $list_doc.bcust_gendec_file}}
		<tr bgcolor="#CCCCCC"><th><div align="left">Action</div></th><th><div align="left">Document Name</div></th></tr>
   <tr><td width="15%"><a href="javascript:delete_doc();" onclick="javascript:if(!confirm('Are you sure you want to delete the Document?')) return false;"  title="Delete"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a> </td>
   <th><div align="left"><a href="javascript:parent.viewimg('{{$BASE_URL}}{{$FILE_PATH}}files/disclaimers/{{$list_doc.bcust_gendec_file|default:'no_image.gif'}}')"  title="View">{{$list_doc.bcust_gendec_file}}</a></div></th>
           </tr>
      {{else}}
      <tr><th colspan="2">No document yet uploaded.</th></tr>
      {{/if}}
	</table>
     </form>
</div>
<!--------------- End iframe_data ------->
<!-- End Create Document Checklist section -->
{{/if}}
{{if $byer_matches_list}}
<table cellpadding="3" cellspacing="3" width="99%" id="list-table" border="0">
<tr bgcolor="#CCCCCC"><th>Action</th><th width="300">Description</th><th>Price Range</th><th>Created Date</th><th>Interests</th><th>States</th><th>On Web</th></tr>
         {{foreach from=$byer_matches_list key="key" item="item"}}
         <tr><td><a href="javascript:iframe_section('BuyerMatchesInfo','/cust_id/{{$cust_id}}/bm_id/{{$item.bm_id}}');"  title="Edit">
         <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
         <a href="javascript:requesDelete('deleteBuyerMatches', {{$item.bm_id}})" onclick="javascript:if(!confirm('Are you sure you want to delete.?')) return false;" title="Delete"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a></td>
         <td align="left" width="300">{{$item.bm_description}}</td>
         <td>{{$item.price_ranges}}</td>
         <td>{{$item.bm_create_date}}</td>
         <td>{{$item.intrest_code}}</td>
         <td>{{$item.states_code}}</td>
          <td><input type="checkbox" {{if $item.bm_onweb == 1}} checked="checked" {{/if}} disabled="disabled" /></td>
        </tr>
         {{/foreach}}	
	</table>
</div>
 
<!--Buyer Business For Sales End-->

{{/if}}

{{if $last > 1}} 
     <table width="90%" border="0" cellpadding="0" cellspacing="0">   
    <tr>  
  {{if $byer_matches_list}}   
<td align="center">

 <div class='pagination'>
 {{if $pagenum == 1}}
 <span class='disabled'>« previous</span>
 {{else}}
<a class="pagination" href="javascript:requestbyerInfo('{{$requester}}', {{math equation="x - y" x=$pagenum y=1}}, '{{$div_id}}')" title="Previous">« previous</a>
 {{/if}}
        
{{if $pagenum != 1}}
 <span class="paginate"><a class="pagination"  href="javascript:requestbyerInfo('{{$requester}}', 1, '{{$div_id}}');" title="{{$page_num}} Page">1</a></span>
 {{else}}<span class='current'>1</span>
 {{/if}}{{if $pagenum != 2}}
   <span class="paginate"><a class="pagination"  href="javascript:requestbyerInfo('{{$requester}}', 2, '{{$div_id}}');" title="{{$page_num}} Page">2</a></span>
{{else}}<span class='current'>2</span>
 {{/if}}
{{if $paginateprev.0 > 3}}
...
{{/if}}
{{foreach from=$paginateprev key="page_key" item="page_num"}}
	{{if $page_num == $pagenum OR $page_num <= 2}}
   		{{elseif $page_num == $lastone}}
    	{{else}} <span class="paginate"><a class="pagination"  href="javascript:requestbyerInfo('{{$requester}}', {{$page_num}}, '{{$div_id}}')" title="{{$page_num}} Page">{{$page_num}}</a></span>
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
                        <a class="pagination"  href="javascript:requestbyerInfo('{{$requester}}', {{$page_num2}}, '{{$div_id}}')" title="{{$page_num2}} Page">{{$page_num2}}</a>
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
<a class="pagination"  href="javascript:requestbyerInfo('{{$requester}}', {{$lastone}}, '{{$div_id}}')" title="{{$lastone}} Page">{{$lastone}}</a>
{{/if}}
{{/if}}
{{if $last == 1}}
{{elseif $last == 2}}
{{else}}
{{if $pagenum == $last}}
<span class='current'>{{$last}}</span>
{{else}}
 <a class="pagination"  href="javascript:requestbyerInfo('{{$requester}}', {{$last}}, '{{$div_id}}')" title="{{$last}} Page">{{$last}}</a>
{{/if}}
{{/if}}
{{if $pagenum == $last}}
<span class='disabled'>next »</span>
 {{else}}
<a class="pagination" href="javascript:requestbyerInfo('{{$requester}}', {{math equation="x + y" x=$pagenum y=1}}, '{{$div_id}}')" title="Next">next »</a></div>
 {{/if}}
</td>
{{/if}}
 </tr>
</table> 
{{/if}}
<!--Buyer other Contact list start-->
{{if $byerothercontact_list}}
<link rel="stylesheet" href="{{$BASE_URL}}css/default/cis-styles.css" />
<table cellpadding="3" cellspacing="3" width="100%" id="list-table" border="0">
<tr bgcolor="#CCCCCC"><th>Action</th><th>Type</th><th>First Name</th><th>Last Name</th><th>Email</th><th>Mobile</th><th>Business</th><th>Create Date</th><th>Email Notification</th></tr>
         {{foreach from=$byerothercontact_list key="key" item="item"}}
         <tr><td>
         <a href="javascript:iframe_section('Othercontactinfo','/cust_id/{{$cust_id}}/oc_id/{{$item.oc_id}}');"  title="Edit">
         <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
         <a href="javascript:requesDelete('deleteothercontact', {{$item.oc_id}})" onclick="javascript:if(!confirm('Are you sure you want to delete.?')) return false;"  title="Delete"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a></td>
         <td align="left">{{$item.pt_name}}</td>
         <td>{{$item.oc_fname}}</td>
         <td>{{$item.oc_lname}}</td>
         <td>{{$item.oc_email}}</td>
         <td>{{$item.oc_mobile}}</td>
         <td>{{$item.oc_business}}</td>
          <td>{{$item.oc_date|date_format:"%d/%m/%Y"}}</td>
          <td>{{if $item.oc_noti_enable == 1}}<input type="checkbox" checked="checked" readonly="readonly" /> {{else}} <input type="checkbox"  readonly="readonly" />{{/if}}</td>
        </tr>
         {{/foreach}}	
	</table>
</div>
<!--Buyer Business For Sales End-->
{{/if}}
{{if $last > 1}} 
     <table width="90%" border="0" cellpadding="0" cellspacing="0">   
    <tr>  
  {{if $byerothercontact_list}}   
<td align="center">

 <div class='pagination'>
 {{if $pagenum == 1}}
 <span class='disabled'>« previous</span>
 {{else}}
<a class="pagination" href="javascript:requestbyerInfo('{{$requester}}', {{math equation="x - y" x=$pagenum y=1}}, '{{$div_id}}')" title="Previous">« previous</a>
 {{/if}}
        
{{if $pagenum != 1}}
 <span class="paginate"><a class="pagination"  href="javascript:requestbyerInfo('{{$requester}}', 1, '{{$div_id}}');" title="{{$page_num}} Page">1</a></span>
 {{else}}<span class='current'>1</span>
 {{/if}}{{if $pagenum != 2}}
   <span class="paginate"><a class="pagination"  href="javascript:requestbyerInfo('{{$requester}}', 2, '{{$div_id}}');" title="{{$page_num}} Page">2</a></span>
{{else}}<span class='current'>2</span>
 {{/if}}
{{if $paginateprev.0 > 3}}
...
{{/if}}
{{foreach from=$paginateprev key="page_key" item="page_num"}}
	{{if $page_num == $pagenum OR $page_num <= 2}}
   		{{elseif $page_num == $lastone}}
    	{{else}} <span class="paginate"><a class="pagination"  href="javascript:requestbyerInfo('{{$requester}}', {{$page_num}}, '{{$div_id}}')" title="{{$page_num}} Page">{{$page_num}}</a></span>
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
                        <a class="pagination"  href="javascript:requestbyerInfo('{{$requester}}', {{$page_num2}}, '{{$div_id}}')" title="{{$page_num2}} Page">{{$page_num2}}</a>
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
<a class="pagination"  href="javascript:requestbyerInfo('{{$requester}}', {{$lastone}}, '{{$div_id}}')" title="{{$lastone}} Page">{{$lastone}}</a>
{{/if}}
{{/if}}
{{if $last == 1}}
{{elseif $last == 2}}
{{else}}
{{if $pagenum == $last}}
<span class='current'>{{$last}}</span>
{{else}}
 <a class="pagination"  href="javascript:requestbyerInfo('{{$requester}}', {{$last}}, '{{$div_id}}')" title="{{$last}} Page">{{$last}}</a>
{{/if}}
{{/if}}
{{if $pagenum == $last}}
<span class='disabled'>next »</span>
 {{else}}
<a class="pagination" href="javascript:requestbyerInfo('{{$requester}}', {{math equation="x + y" x=$pagenum y=1}}, '{{$div_id}}')" title="Next">next »</a></div>
 {{/if}}
</td>
{{/if}}
 </tr>
</table> 
{{/if}}
<!--Buyer other Contact list end-->