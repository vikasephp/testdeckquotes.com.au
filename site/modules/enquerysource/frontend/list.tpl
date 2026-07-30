<script type="text/javascript" > 
	!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
	</script>
	
	<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
	<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />

<script type="text/javascript" >  

		$(document).ready(function() {
			/*
			*   Examples - images
			*/
			$(".various").fancybox({
				'width': '78%',
				'height': '47%',
				'autoScale': false,
				 'transitionIn' : 'elastic',
				 'transitionOut' : 'elastic',
				 'speedIn' : 300,
				 'speedOut' : 300,
				 'overlayShow' : true,
				 'hideOnOverlayClick':false,
				 'hideOnContentClick':false,
				 'type': 'iframe',
				 'scrolling': 'no' 
			});

		
		});
		
	function view_enquiry(busid, custid, buse_id)
				{
				var viewurl ="{{$BASE_URL}}business.businessenquiry_detail/buse_id/" +busid+"/cust_id/"+custid+"/buse_id/"+buse_id;
						$(document).ready(function () {
						$.fancybox({
								'width': '88%',
								'height': '100%',
								'autoScale': false,
								 'transitionIn' : 'elastic',
								 'transitionOut' : 'elastic',
								 'speedIn' : 300,
								 'speedOut' : 300,
								 'overlayShow' : true,
								 'hideOnOverlayClick':false,
								 'hideOnContentClick':false,
								 'type': 'iframe',
								  'href': viewurl,
								 'scrolling': 'yes' 
							});
				
						
						});
				}		
function clearform()
{
var frm_elements = document.search.elements;

for(i=0; i<frm_elements.length; i++)
{   
    if(frm_elements[i].type=="text")
	{    frm_elements[i].value="";}
	if(frm_elements[i].type=="radio")
	{    frm_elements[i].checked=false;}
	document.getElementById("selectionDD").selectedIndex = 0;}
}
		
</script> 
<h3 class="page-title">{{$title}}</h3>
<div id="">
<table id="search-table" width="98%">
<form name="search" action="{{$XFA.list}}" method="post">
        <thead>
            <tr>	<th align="center" valign="middle" width="15%">First Name:&nbsp;</th><td><input type="text" class="lrg" name="{{$TABLE}}[bcust_fname]" value="{{$detail.bcust_fname}}" /> </td>    
            		<th align="center" valign="middle" width="10%"> Last Name:&nbsp;</th><td><input type="text" class="lrg" name="{{$TABLE}}[bcust_lname]" value="{{$detail.bcust_lname}}"/> </td>  
            </tr>
            <tr>	<th align="center" valign="middle" width="15%">Email:&nbsp;</th><td><input type="text" class="lrg" name="{{$TABLE}}[bcust_misc_email1]" value="{{$detail.bcust_misc_email1}}"/> </td>    
            		<th align="center" valign="middle" width="10%">Sort Results:&nbsp;</th><td>
       	<select name="{{$TABLE}}[sorting]" class="lrg" id="selectionDD" >
          		<option value="1" {{if $detail.sorting == 1}} selected="selected" {{/if}}>Most Recent Initial Phone Call Date</option>
                <option value="2" {{if $detail.sorting == 2}} selected="selected" {{/if}}>Most Recent Added</option>
                <option value="3" {{if $detail.sorting == 3}} selected="selected" {{/if}}>Business For Sale Name</option>
                <option value="4" {{if $detail.sorting == 4}} selected="selected" {{/if}}>Customer Name then Most Recent</option>
                <option value="5" {{if $detail.sorting == 5}} selected="selected" {{/if}}>Source Of Enquiry</option>
		</select> </td> 
            </tr>
             <tr>	<th align="center" valign="middle" width="10%">Logged Date From:&nbsp;</th><td><input type="text" class="w16em dateformat-Y-ds-m-ds-d" name="{{$TABLE}}[bcust_misc_logged_date_date_from]" value="{{$detail.bcust_misc_logged_date_date_from}}" id="demo13" maxlength="25" readonly="readonly"/></td>    
            		<th align="center" valign="middle" width="10%"> To:&nbsp;</th><td><input type="text" class="w16em dateformat-Y-ds-m-ds-d" name="{{$TABLE}}[bcust_misc_logged_date_date_to]" value="{{$detail.bcust_misc_logged_date_date_to}}" id="demo14" maxlength="25"  readonly="readonly"/></td>  
            </tr>
            <tr><td colspan="4">
            <table cellpadding="0" cellspacing="0" width="100%" id="none-table">
        <tr>
        <td><input type="radio" name="{{$TABLE}}[disclamer_type]" value="1" {{if $detail.disclamer_type == 1}} checked="checked" {{/if}} />&nbsp;Disclaimer Sent but Not Signed.</td>
        <td><input type="radio" name="{{$TABLE}}[disclamer_type]" value="2" {{if $detail.disclamer_type == 2}} checked="checked" {{/if}}/>&nbsp;Not Initial Phone Call.</td>
        <td><input type="radio" name="{{$TABLE}}[disclamer_type]" value="3" {{if $detail.disclamer_type == 3}} checked="checked" {{/if}}/>&nbsp;Signed Disclaimer but not sent Dossier.</td>
        <td><input type="radio" name="{{$TABLE}}[disclamer_type]" value="4" {{if $detail.disclamer_type == 4}} checked="checked" {{/if}}/>&nbsp;No Followup.</td>
        <td><input type="radio" name="{{$TABLE}}[disclamer_type]" value="5" {{if $detail.disclamer_type == 5}} checked="checked" {{/if}}/>&nbsp;Followup Not Done.</td>
        <td><input type="radio" name="{{$TABLE}}[disclamer_type]" value="6" {{if $detail.disclamer_type == 6}} checked="checked" {{/if}}/>&nbsp;Answer Required.</td>
        </tr>
            </table>
            </td></tr>  
            <tr> <td colspan="4"><input type="submit" name="search" value="Search" />&nbsp;
            			<input type="button" value="Print Call Sheet" onclick="document.location.href='{{$BASE_URL}}{{$XFA.list}}/print/list'"/>&nbsp;
                        <input type="button" value="Export To XLS" onclick="document.location.href='{{$BASE_URL}}{{$XFA.list}}/export/list'"/>	
                        <input type="button" value="Reset" name="{{$TABLE}}[Reset]" onclick="clearform();"/></td>	  
            </tr>
        </thead>
        </form>    
</table>
 {{if $list}}
    <table id="list-table" class="nav-back" width="98%" id="list-table">
        <thead>
            <tr>
		            <th class="topmenu" align="center" valign="middle" width="6%">Action</th>  
            		<th class="topmenu" align="center" valign="middle" width="14%">Business For Sale</th>
                    <th class="topmenu" align="center" valign="middle" width="12%">Customer Name</th>    
                    <th class="topmenu" align="center" valign="middle" width="10%">Logged Date</th>
                    <th class="topmenu" align="center" valign="middle" width="10%">Source Of Enquiry</th> 
                    <th class="topmenu" align="center" valign="middle" width="5%">Initial Phone&nbsp;Call</th> 
                    <th class="topmenu" align="center" valign="middle" width="7%">General Disclaimer</th> 
                    <th class="topmenu" align="center" valign="middle" width="8%">Sent Dossier&nbsp;Date</th> 
                    <th class="topmenu" align="center" valign="middle" width="5%">Status</th> 
                    <th class="topmenu" align="center" valign="middle" width="8%">Requested Info</th>   
                    <th class="topmenu" align="center" valign="middle" width="8%">Sent To Seller</th>  
                    <th class="topmenu" align="center" valign="middle" width="2%">Answer Required</th>                     
            </tr>
        </thead>       
        <tbody>
        {{foreach from=$list key="key" item="item"}}
            <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
             <td> <a  href="javascript:view_enquiry('{{$item.bsn_id}}','{{$item.bcust_id}}','{{$item.be_id}}');" title="Edit"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>
<a class="various" href="{{$BASE_URL}}customer.custview/bcust_id/{{$item.bcust_id}}" title="View" ><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/view.png"/></a>      
               </td>
                <td><a href="{{$BASE_URL}}business.detail/bsn_id/{{$item.bsn_id}}/be_id/{{$item.be_id}}">{{$item.bsn_name}}</a></td>
                <td> <a href="{{$BASE_URL}}customer.detail/bcust_id/{{$item.bcust_id}}/be_id/{{$item.be_id}}">{{$item.bcust_fname}} &nbsp;{{$item.bcust_lname}}</a></td>
                <td> {{if $item.be_created_date !== '0000-00-00'}}{{$item.be_created_date|date_format:"%d-%m-%Y"}}{{/if}}</td>
                <td> {{$item.soe_name}}</td>
                <td> {{if $item.be_ipc_date !== '0000-00-00'}}{{$item.be_ipc_date|date_format:"%d-%m-%Y"}}{{/if}} </td>
                <td>{{if $item.bcust_gendec_sent_date !== '0000-00-00'}}{{$item.bcust_gendec_sent_date|date_format:"%d-%m-%Y"}}{{/if}} </td>
                <td>{{if $item.be_sed_date !== '0000-00-00'}}{{$item.be_sed_date|date_format:"%d-%m-%Y"}}{{/if}}</td>
                <td>{{$item.cs_name}}</td>
                <td>{{$item.be_request_info}}</td>
                <td>{{if $item.be_easts_date !== '0000-00-00'}}{{$item.be_easts_date|date_format:"%d-%m-%Y"}}{{/if}}</td>
                <td> <input type="checkbox" disabled="disabled" {{if $item.be_answer_required == 1}} checked="checked" {{/if}}  /></td>    
            </tr>
        {{/foreach}}
        </tbody>
    </table>
 {{/if }}   
     {{if $last > 1}} 
    <table width="90%" border="0" cellpadding="0" cellspacing="0">   
    <tr>  
  {{if $list}}   
<td align="center">

 <div class='pagination'>
 {{if $pagenum == 1}}
 <span class='disabled'>« previous</span>
 {{else}}
<a class="pagination" href="{{$BASE_URL}}{{$XFA.list}}/pagenum/{{math equation="x - y" x=$pagenum y=1}}" title="Previous">« previous </a>
 {{/if}}
        
{{if $pagenum != 1}}
 <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.list}}/pagenum/1" title="{{$page_num}} Page">1</a></span>
 {{else}}<span class='current'>1</span>
 {{/if}}{{if $pagenum != 2}}
   <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.list}}/pagenum/2" title="{{$page_num}} Page">2</a></span>
{{else}}<span class='current'>2</span>
 {{/if}}
{{if $paginateprev.0 > 3}}
...
{{/if}}
{{foreach from=$paginateprev key="page_key" item="page_num"}}
	{{if $page_num == $pagenum OR $page_num <= 2}}
   		{{elseif $page_num == $lastone}}
    
    	{{else}} <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.list}}/pagenum/{{$page_num}}" title="{{$page_num}} Page">{{$page_num}}</a></span>
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
                        <a class="pagination"  href="{{$BASE_URL}}{{$XFA.list}}/pagenum/{{$page_num2}}" title="{{$page_num2}} Page">{{$page_num2}}</a>
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
<a class="pagination"  href="{{$BASE_URL}}{{$XFA.list}}/pagenum/{{$lastone}}" title="{{$lastone}} Page">{{$lastone}}</a>
{{/if}}
{{/if}}
{{if $last == 1}}
{{elseif $last == 2}}
{{else}}
{{if $pagenum == $last}}
<span class='current'>{{$last}}</span>
{{else}}
 <a class="pagination"  href="{{$BASE_URL}}{{$XFA.list}}/pagenum/{{$last}}" title="{{$last}} Page">{{$last}}</a>
{{/if}}
{{/if}}
{{if $pagenum == $last}}
<span class='disabled'>next »</span>
 {{else}}
<a class="pagination" href="{{$BASE_URL}}{{$XFA.list}}/pagenum/{{math equation="x + y" x=$pagenum y=1}}" title="Next">next »</a></div>
 {{/if}}
</td>
{{else}}
<td align="center" height="300">Record Not found... </td>

{{/if}}
 </tr>
</table> 
{{/if}}
</div>