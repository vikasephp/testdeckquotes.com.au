<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
{{include file=$jdata}}
{{include file=$tiny_basic}}		
<h3 class="page-title">{{$title}}</h3><br />
<br />
<style>
.set { font-size:10px !important; 
       width:25px !important; display:inline-block; 
       padding-top:1px !important;
       padding-bottom: 1px !important;
       padding-left:1px !important;
       height:25px !important; }
             
#fancybox-wrap {z-index:9999999;} 
</style>

<script language="javascript">

function add_procedure()
{
	var viewurl = "{{$BASE_URL}}customer_details_report.view_procedure"+ "/random/" + Math.random();	

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

function add_cal_linked()
 {
 var viewurl = "{{$BASE_URL}}customer_details_report.view_cal_linked"+ "/random/" + Math.random();	
 $(document).ready(function () {
        $.fancybox({
				'width': '95%',
				'height': '90%',
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
    &nbsp;&nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" />
    &nbsp;<input type="button" name="cal_admin" value="Calendar Linked Admin" onclick="javascript:add_cal_linked();" /> 
    &nbsp;<strong> Total Number of Projects in Construction : {{$totalC}}&nbsp; &nbsp;  | </strong>
    &nbsp;&nbsp;<strong> Number of a Linked to website : {{$totalweb}} </strong>
    <br />

    &nbsp; &nbsp; <strong>Search:</strong>&nbsp;&nbsp;
    <input type="text" name="searchkey" value="{{$searchkey}}" style="width:400px;" placeholder=""/>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <input type="submit" value="Search" name="searchaddr"  />
    <input type="submit" value="Clear Search" name="clearsearch"  />

&nbsp; &nbsp; &nbsp; &nbsp;<strong> Filter By : </strong> 

 
        <select name="callinked"/>
        <option value="0">Show All</option>
        {{foreach from = $cal_linked key="key3" item="item3"}}
        <option value="{{$item3.cl_id}}" {{if $item3.cl_id eq $callinked}} selected="selected" {{/if}}>{{$item3.cl_option}}</option>
        {{/foreach}}
        </select> 
        &nbsp; &nbsp;<input type="submit" value="Filter" name="filter" />   
        &nbsp;<input type="submit" name="clear" value = "Clear Filter" />    
</div> 
</div>
  
<div style="float:right;">
<input type="submit" value="Show Hidden" name="hidden"  />
</div>
    
 </form>


    <table id="list-table" class="nav-back" width="100%" >
        <thead>
            <tr>
                <th class="topmenu" align="center" valign="middle" width="4%">SrNo</th>   
                <th class="topmenu" align="center" valign="middle" width="20%">Project Address</th> 
                <th class="topmenu" align="center" valign="middle" width="7%">Status</th>
                <th class="topmenu" align="center" valign="middle" width="14%">Customer Name</th>
                <th class="topmenu" align="center" valign="middle" width="8%">Phone</th>
                <th class="topmenu" align="center" valign="middle" width="10%">Email</th>
                <th class="topmenu" align="center" valign="middle" width="10%">Smartsheet Link</th>
                <th class="topmenu" align="center" valign="middle" width="10%">Construction Calendar Link</th>
                <th class="topmenu" align="center" valign="middle" width="10%">Calendar Linked to Website </th> 
                <th class="topmenu" align="center" valign="middle" width="8%">Hide </th>
                <th class="topmenu" align="center" valign="middle" width="5%">Edit</th>
            </tr>
        </thead>
<tbody>
 {{foreach from=$list key="key" item="item"}}
 <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">

    <td>{{counter}}</td>
    <td><a href="{{$item.link}}" target="_blank">{{$item.bsn_name}}</a></td> 
    <td>{{$item.status}}</td>
    <td>{{$item.bcust_fname}} {{$item.bcust_lname}}</td>
    <td>{{$item.bcust_misc_moble}}</td>
    <td>{{$item.bcust_misc_email1}}</td>
  
   <td>{{if $item.bs_cdr_ss_link}}<a href="{{$item.bs_cdr_ss_link}}" target="_blank">Link{{/if}}</td>
   <td>{{if $item.bs_cdr_cc_link}}<a href="{{$item.bs_cdr_cc_link}}" target="_blank">Link{{/if}}</td>
   
    <td>
    
    {{$item.ready_email_status}}
    <select name="linked" onchange="update_cal_linked({{$item.bs_business_id}}, this.value)">
   		 <option value="0">Please Select</option>
         {{foreach from=$cal_linked key="key2" item="item2"}}
   		   <option value="{{$item2.cl_id}}" {{if $item2.cl_id eq $item.bs_cdr_cal_linked}} selected="selected" {{/if}} >{{$item2.cl_option}}</option>
         {{/foreach}}
   	 </select>
        <div id="cal_link{{$item.bs_business_id}}">{{$item.bs_cdr_cal_lin_user }}<br />{{$item.bs_cdr_cal_lin_date}} </div>
     <script>
 	   
        function update_cal_linked(id,value)
		{
		var cond = "#cal_link"+id;
		
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}customer_details_report.update_cal_linked/bs_business_id/"+id+"/value/"+value,
				   success: function(result){
					    $(cond).html(result); 
			   }
			 });
		}
	
       </script>
    </td>
    
    <td>
     <form name ="recmet3" method="post" action="">
     	<input type="hidden" name="hide[{{$item.bs_business_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="hide[{{$item.bs_business_id}}]" value="1"  onclick="this.form.submit();" {{if $item.bs_cdr_hide eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form>  
    </td>   
       
     <td><a href="{{$BASE_URL}}{{$XFA.detail}}/bs_business_id/{{$item.bs_business_id}}" class="various" title="Edit"> 
     <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;</td>
     
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