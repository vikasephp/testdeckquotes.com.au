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
		
	function view_enquiry(busid, custid)
				{
				var viewurl ="{{$BASE_URL}}business.businessenquiry_detail/bsns_id/" +busid+"/cust_id/"+custid;
				
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
								{    frm_elements[i].value="";  }
							}
				}	
</script> 
<h3 class="page-title">{{$title}}</h3>
<div align="center">
<table id="search-table" width="90%" >
<form name="search" action="{{$XFA.list}}" method="post">
        <thead>
            <tr>	<th align="center" valign="middle" width="15%">First Name:&nbsp;</th><td><input type="text" class="lrg" name="{{$TABLE}}[bcust_fname]" value="{{$detail.bcust_fname}}" /> </td>    
            		<th align="center" valign="middle" width="10%"> Last Name:&nbsp;</th><td><input type="text" class="lrg" name="{{$TABLE}}[bcust_lname]" value="{{$detail.bcust_lname}}"/> </td>  
            </tr>
            <tr>	<th align="center" valign="middle" width="15%">Email:&nbsp;</th><td><input type="text" class="lrg" name="{{$TABLE}}[bcust_misc_email1]" value="{{$detail.bcust_misc_email1}}"/> </td>    
            		<th align="center" valign="middle" width="10%">Sort Results:&nbsp;</th><td>
       	<select name="{{$TABLE}}[short_type]" class="lrg" >
          		<option value="1">Most Recent Initial Phone Call Date</option>
                <option value="2">Most Recent Added</option>
                <option value="3">Business For Sale Name</option>
                <option value="4">Customer Name then Most Recent</option>
                <option value="5">Source Of Enquiry</option>
		</select> </td> 
            </tr>
             <tr>	<th align="center" valign="middle" width="10%">Logged Date From:&nbsp;</th><td><input type="text" class="w16em dateformat-Y-ds-m-ds-d" name="{{$TABLE}}[bcust_misc_logged_date_date_from]" value="{{$detail.bcust_misc_logged_date_date_from}}" id="demo13" maxlength="25" readonly="readonly"/></td>    
            		<th align="center" valign="middle" width="10%"> To:&nbsp;</th><td><input type="text" class="w16em dateformat-Y-ds-m-ds-d" name="{{$TABLE}}[bcust_misc_logged_date_date_to]" value="{{$detail.bcust_misc_logged_date_date_to}}" id="demo14" maxlength="25"  readonly="readonly"/></td>  
            </tr>
            <tr><td colspan="4">
            <table cellpadding="0" cellspacing="0" width="100%" id="none-table">
        <tr>
        <td><input type="radio" name="{{$TABLE}}[disclamer_type]" value="1" />&nbsp;Disclaimer Sent but Not Signed.</td>
        <td><input type="radio" name="{{$TABLE}}[disclamer_type]" value="2" />&nbsp;Not Initial Phone Call.</td>
        <td><input type="radio" name="{{$TABLE}}[disclamer_type]" value="3" />&nbsp;Signed Disclaimer but not sent Dossier.</td>
        <td><input type="radio" name="{{$TABLE}}[disclamer_type]" value="4" />&nbsp;No Followup.</td>
        <td><input type="radio" name="{{$TABLE}}[disclamer_type]" value="5" />&nbsp;Followup Not Done.</td>
        <td><input type="radio" name="{{$TABLE}}[disclamer_type]" value="6" />&nbsp;Answer Required.</td>
        </tr>
            </table>
            </td></tr>  
            <tr> <td colspan="4"><input type="submit" name="search" value="Search" />&nbsp;
            			<input type="button" value="Print Call Sheet" onclick="document.location.href='{{$BASE_URL}}{{$XFA.list}}/print/list'"/>&nbsp;
                        <input type="button" value="Export To XLS" onclick="document.location.href='{{$BASE_URL}}{{$XFA.list}}/export/list'"/>	
                        <input type="button" value="Reset" name="Reset" onclick="clearform();"/></td>	  
            </tr>
        </thead>
        </form>    
</table>
 {{if $list}}
    <table id="list-table" class="nav-back" width="100%">
        <tbody>
            <tr>
		            <th class="topmenu" align="center" valign="middle" width="5%">Action</th>  
            		<th class="topmenu" align="center" valign="middle" width="10%">Business For Sale</th>
                    <th class="topmenu" align="center" valign="middle" width="10%">Customer Name</th>    
                    <th class="topmenu" align="center" valign="middle" width="7%">Date</th>
                    <th class="topmenu" align="center" valign="middle" width="8%">Source Of Enquiry</th> 
                    <th class="topmenu" align="center" valign="middle" width="3%">InitialPhoneCall</th> 
                    <th class="topmenu" align="center" valign="middle" width="3%">General Disclaimer</th> 
        
                    <th class="topmenu" align="center" valign="middle" width="3%">Status</th> 
                    <th class="topmenu" align="center" valign="middle" width="5%">Requested Info</th> 
                    <th class="topmenu" align="center" valign="middle" width="8%">RequestedInformation</th>   
                    <th class="topmenu" align="center" valign="middle" width="8%">Sent To Seller</th>  
                    <th class="topmenu" align="center" valign="middle" width="4%">Answer Required</th>              
                     
            </tr>
        {{foreach from=$list key="key" item="item"}}
            <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
             <td> <a  href="javascript:view_enquiry('{{$item.bsn_id}}','{{$item.bcust_id}}');" title="Edit"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>
<a class="various" href="{{$BASE_URL}}customer.custview/bcust_id/{{$item.bcust_id}}" title="View" ><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/view.png"/></a>      
               </td>
                <td>{{$item.bsn_name}}</td>
                <td> {{$item.bcust_fname}} &nbsp;{{$item.bcust_lname}}</td>
                <td> {{if $item.be_created_date !== '0000-00-00'}}{{$item.be_created_date}}{{/if}}</td>
                <td> {{$item.soe_name}}</td>
                <td> {{$item.be_ipc_date}} </td>
                <td>{{$item.bcust_gendec_sent_date}} </td>
         
                <td>{{$item.cs_name}}</td>
                <td>{{$item.be_request_info}}</td>
                <td></td>
                <td>{{$item.be_easts_date}}</td>
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
<a class="pagination" href="{{$BASE_URL}} {{$XFA.list}}/pagenum/{{math equation="x - y" x=$pagenum y=1}}" title="Previous">« previous </a>
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