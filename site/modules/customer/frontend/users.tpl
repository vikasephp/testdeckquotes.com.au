<h3 class="page-title">{{$title}}</h3>
<div id="">
<table id="search-table" width="90%" >
<form name="search" action="{{$XFA.list}}" method="post">
        <thead>
            <tr>	<th align="center" valign="middle" width="15%">First Name:&nbsp;</th><td><input type="text" class="lrg" name="{{$TABLE}}[bcust_fname]" value="{{$detail.bcust_fname}}" /> </td>    
            		<th align="center" valign="middle" width="10%"> Last Name:&nbsp;</th><td><input type="text" class="lrg" name="{{$TABLE}}[bcust_lname]" value="{{$detail.bcust_lname}}"/> </td>  
            </tr>
            <tr>	<th align="center" valign="middle" width="15%">Email:&nbsp;</th><td><input type="text" class="lrg" name="{{$TABLE}}[bcust_misc_email1]" value="{{$detail.bcust_misc_email1}}"/> </td>    
            		<th align="center" valign="middle" width="10%"> Phone:&nbsp;</th><td><input type="text" class="lrg" name="{{$TABLE}}[phones]" value="{{$detail.phones}}"/> </td>  
            </tr>
            <tr>	<th align="center" valign="middle" width="15%">Status:&nbsp;</th><td>
            		<select name="{{$TABLE}}[bcust_status]" class="lrg" >
        	<option value="0" selected="selected"> -- select --</option>
            {{foreach from=$customers_status key="key" item="item"}}
            <option value="{{$item.cs_id}}" {{if $item.cs_id == $detail.bcust_status}} selected="selected" {{/if}}> {{$item.cs_name}}</option>
            {{/foreach}}
		</select> 
             </td>    
            		<td align="center" valign="middle" width="50%" colspan="2"> <input type="checkbox" name="{{$TABLE}}[bcust_isbuyer]" {{if $detail.bcust_isbuyer}} checked="checked" {{/if}}/>&nbsp;<b>Is Buyer</b>&nbsp;  <input type="checkbox" name="{{$TABLE}}[bcust_isseller]" {{if $detail.bcust_isseller}} checked="checked" {{/if}}/>&nbsp;<b>Is Seller</b>&nbsp; <input type="checkbox" name="{{$TABLE}}[bcust_isbuyer_isseller]" {{if $detail.bcust_isbuyer_isseller}} checked="checked" {{/if}}/>&nbsp;<b>No Buyer Match</b>&nbsp;</td>  
            </tr>
            <tr>	<th align="center" valign="middle" width="10%">Type:&nbsp;</th><td><select name="{{$TABLE}}[bcust_type]" class="lrg" >
        	<option value="0" selected="selected"> -- select --</option>
            {{foreach from=$customers_type key="key" item="item"}}
            <option value="{{$item.ct_id}}" {{if $item.ct_id == $detail.bcust_type}} selected="selected" {{/if}}> {{$item.ct_name}}</option>
            {{/foreach}}
		</select> </td>    
            		<th align="center" valign="middle" width="10%" colspan="2"></th>  
            </tr>
             <tr>	<th align="center" valign="middle" width="10%">Logged Date From:&nbsp;</th>
             <td><input type="text" name="{{$TABLE}}[bcust_misc_logged_date_date_from]" value="{{$detail.bcust_misc_logged_date_date_from}}" class="w16em dateformat-d-ds-m-ds-Y"  readonly="readonly"/>
             
             
             </td>    
<th align="center" valign="middle" width="10%"> To:&nbsp;</th>
<td><input type="text" name="{{$TABLE}}[bcust_misc_logged_date_date_to]" value="{{$detail.bcust_misc_logged_date_date_to}}" class="w16em dateformat-d-ds-m-ds-Y"  readonly="readonly"/></td>  
            </tr>
            <tr> <td colspan="4"><input type="submit" name="search" value="Search" />&nbsp;<input type="button" value="Add New" onclick="document.location.href='{{$BASE_URL}}{{$XFA.detail}}'" />
            &nbsp;<input type="button" value="Export To XLS" onclick="document.location.href='{{$BASE_URL}}{{$XFA.list}}/export/1'" />
            &nbsp;<input type="button" value="reset" name="reset" onclick="document.location.href='{{$BASE_URL}}{{$XFA.list}}'"/></td>   
            		  
            </tr>
        </thead>
        </form>    
</table>
</div>
<div style="border: 0px solid #FF0000;">
<script>
		!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
	</script>
	
	<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
	<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
	<script type="text/javascript">
		$(document).ready(function() {
			/*
			*   Examples - images
			*/
			$(".various").fancybox({
				'width'				: '75%',
				'height'			: '50%',
				'autoScale'			: false,
				  'transitionIn'          : 'elastic',
				 'transitionOut'         : 'elastic',
				'speedIn' : 300,
				 'speedOut' : 300,
				 'overlayShow' : true,
				 'hideOnOverlayClick':false,
				'hideOnContentClick':false,
				'type'				: 'iframe',
				 'scrolling'         : 'no' 
			});

		
		});
	</script>
    {{if $list}}
    
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
            		<th class="topmenu" align="center" valign="middle" width="6%">Action</th>   
            		<th class="topmenu" align="center" valign="middle" width="10%">First Name</th>
                    <th class="topmenu" align="center" valign="middle" width="10%">Last Name</th>    
                    <th class="topmenu" align="center" valign="middle" width="8%">Logged Date</th>
                    <th class="topmenu" align="center" valign="middle" width="3%">Status</th> 
                    <th class="topmenu" align="center" valign="middle" width="3%">IsBuyer</th> 
                    <th class="topmenu" align="center" valign="middle" width="3%">IsSeller</th> 
                    <th class="topmenu" align="center" valign="middle" width="10%">Email</th> 
                    <th class="topmenu" align="center" valign="middle" width="10%">Email</th> 
                    <th class="topmenu" align="center" valign="middle" width="8%">Mobile No</th> 
                    <th class="topmenu" align="center" valign="middle" width="8%">Business No</th>   
                    <th class="topmenu" align="center" valign="middle" width="8%">Home No</th> 
                    <th class="topmenu" align="center" valign="middle" width="8%">General Disclaimer</th>            
                       
            </tr>
        </thead>       
        <tbody>
        {{foreach from=$list key="key" item="item"}}
            <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
             <td><a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}">
                <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
                <a class="various" href="{{$BASE_URL}}{{$XFA.custview}}/{{$ID}}/{{$item.$ID}}" title="View"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/view.png"/></a>
                </td>
                <td>{{$item.bcust_fname}}</td>
                <td> {{$item.bcust_lname}}</td>
                <td> {{$item.bcust_misc_logged_date_date|date_format:"%d-%m-%Y"}}</td>
                <td> {{$item.cs_name}}</td>
                <td> <input type="checkbox" disabled="disabled" {{if $item.bcust_isbuyer == 1}} checked="checked" {{/if}}  /></td>
                <td> <input type="checkbox" disabled="disabled" {{if $item.bcust_isseller == 1}} checked="checked" {{/if}}  /></td>
                <td> {{$item.bcust_misc_email1}}</td>
                <td> {{$item.bcust_misc_email2}}</td>
                <td> {{$item.bcust_misc_moble}}</td>
                <td> {{$item.bcust_misc_business}}</td>
                <td> {{$item.bcust_misc_home}}</td>
                <td> {{if $item.bcust_gendec_signed_date !== '0000-00-00'}} {{ $item.bcust_gendec_signed_date|date_format:"%d-%m-%Y"}} {{else}} Not Signed{{/if}}</td>
               
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
 <span class='disabled'>« previous</span>
 {{else}}
<a class="pagination" href="{{$BASE_URL}}{{$XFA.list}}/pagenum/{{math equation="x - y" x=$pagenum y=1}}" title="Previous">« previous</a>
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
{{/if}}
{{if $error == 1}}
 <table id="list-table" class="nav-back" width="90%">
        <thead>
            <tr>
    			<th colspan="10">Customer not Found.</th>        
            </tr>
        </thead>
    </table>
{{/if}}