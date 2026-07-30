<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/default.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/tree/simpletreemenu.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tree/simpletree.css" />
<script>
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
				'width': '90%',
				'height': '85%',
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

function showlert(po_id,po)
{
	var viewurl = "{{$BASE_URL}}purchase_order.alert"+ "/po_id/" + po_id + "/po/" + po;	
	
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



function add_new()
 {
var viewurl = "{{$BASE_URL}}purchase_order.detail"+ "/random/" + Math.random();	
 $(document).ready(function () {
        $.fancybox({
				'width': '90%',
				'height': '85%',
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
	var viewurl = "{{$BASE_URL}}purchase_order.view_procedure"+ "/random/" + Math.random();	

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


function close_win()
	{
	$.fancybox.close();
	window.location.reload();
	}
</script>

<style>

#fancybox-wrap {z-index:9999999;} 
</style>


<h3 class="page-title">{{$title}}</h3>
<br />

<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
<div style="float:left; text-align:left;">
&nbsp;&nbsp;<strong>Procedure Link : </strong><input type="text" name="proc" value="{{$proc_detail.tl_link}}" style="width:700px" /> 
<input type="submit" value="Update Link" name="update_link"  /><br /><br />
&nbsp;&nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> 
<input type="button" name="priority" value="Edit Delivery Event" onclick="javascript:add_component();" /> 
<br />

&nbsp;&nbsp; <strong>Search : </strong>
<input type="text" name="keyword" value="{{$keyword}}" style="width:400px;" placeholder="Search for Address Or Supplier Name "/>
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" value="Search" name="search"  />
<input type="submit" value="Clear Search" name="clear"  />
</div>

<div style="float:right">
<input type="button" name="Add New " value="Add New" onclick="javascript:add_new();" />
</div>

<div style="float:left; width:100%;">
  <table id="doclist-table" class="nav-back" width="100%">
    <thead>
      <tr>
        <th class="topmenu" align="center" valign="middle" width="3%">SrNo</th>
        <th class="topmenu" align="center" valign="middle" width="15%">Address</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Component</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Delivery Event</th>
        <th class="topmenu" align="center" valign="middle" width="10%">Supplier Name</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Linked Quote</th>
         <th class="topmenu" align="center" valign="middle" width="3%">Value ($)</th>
        <th class="topmenu" align="center" valign="middle" width="10%">Quote Number</th>
        <th class="topmenu" align="center" valign="middle" width="10%">PO Number</th>
        <th class="topmenu" align="center" valign="middle" width="10%">Purchase Order</th>
         <th class="topmenu" align="center" valign="middle" width="10%">Items</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Alert</th>
        <th class="topmenu" align="center" valign="middle" width="10%">PO Sent Date</th>
        <th class="topmenu" align="center" valign="middle" width="10%">PO Upload Date</th>
        <th class="topmenu" align="center" valign="middle" width="10%">Approval</th>
        <th class="topmenu" align="center" valign="middle" width="10%">Action</th>
         
      </tr>
    {{if $list}}
    <tbody>
    <form name="mlist" method="post">
      <!--{{assign var=countn value= $numstartvounter}}-->
       {{assign var=countn value= 1}}
      
      {{foreach from=$list key="key" item="item"}}
      <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
        <td> {{$item.po_id}} </td>
        <td>{{$item.bsn_address}}</td>
        <td>{{$item.pc_name}} {{$item.po_component_name}}</td>
        
        <td>
      <select name="{{$TABLE}}[po_delivery_event]"  Onchange = "update_delivery_event({{$item.po_id}},this.value)">
        <option value="-1" {{if $item.po_delivery_event eq -1}} selected="selected" {{/if}}>Please Select </option>
        {{foreach from = $cdetail key="key2" item="item2"}}
        <option value="{{$item2.qb_id}}" {{if $item2.qb_id eq $item.po_delivery_event }} selected="selected" {{/if}}>{{$item2.qb_component}}</option>
        {{/foreach}}
    </select>
        
        <script>
	   
	    
	   
		function update_delivery_event(id,value)
		{
			
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}purchase_order.update_delivery_event/po_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	</script>
        
        </td>
        
        <td>{{$item.po_supplier1}}</td>
        <td>
        {{if $item.po_quote_accepted eq 1}}
         	  <a href="{{$BASE_URL}}files/purchase_order_quote/{{$item.po_quote1}}">Link</a>
        {{elseif  $item.po_quote_accepted eq 2}}
      		  <a href="{{$BASE_URL}}files/purchase_order_quote/{{$item.po_quote2}}">Link</a>
        {{elseif  $item.po_quote_accepted eq 3}}
         	  <a href="{{$BASE_URL}}files/purchase_order_quote/{{$item.po_quote3}}">Link</a>
        {{/if}}
        {{if $item.po_linked_quote}} 
     <!--   <a href="https://deckquote.s3.amazonaws.com/files/purchase_order_quote/{{$item.po_linked_quote}}">Link</a>
  -->     <a href="/purchase_order.download_content?file_name={{$item.po_linked_quote}}&module_name=purchase_order.home" >Download</a> 
        {{/if}}
        </td>
        <td>{{$item.po_value1}} </td>
        <td>{{$item.po_quote_number}}</td>
        <td>{{$item.po_po_number}}</td>
        <td>{{if $item.po_purchase_order}} 
   <!--     <a href="https://deckquote.s3.amazonaws.com/files/purchase_order_quote/{{$item.po_purchase_order}}">Link</a>
-->       <a href="/purchase_order.download_content?file_name={{$item.po_purchase_order}}&module_name=purchase_order.home" >Download</a> 
        {{/if}}</td>
        <td><a href="{{$BASE_URL}}purchase_order.view_item/po_id/{{$item.po_id}}" class="various">Shows</a></td>
        <td><input type="button" name="Alert" value="Read Alert" onclick="javascript:showlert({{$item.po_id}}, {{$item.po}});" style="width:90px; height:20px; font-size:11px; line-height:17px !important; padding:0px !important" /></td>
      
        <td>{{$item.po_sent_date}}</td>
        <td>{{if $item.po_purchase_order}}{{$item.po_upload_date}}{{/if}}</td>
        <td>
         {{if $item.po_component_name}}
        <select name="{{$TABLE}}[po_approval]" Onchange = "update_approval({{$item.po_id}},this.value)">
 	     {{foreach from = $asdetail key="key" item="item2"}}
    		 <option value="{{$item2.to_option}}" {{if $item.po_approval eq $item2.to_option}} selected="selected" {{/if}}>{{$item2.to_option}}</option>
    	     {{/foreach}}
 	</select>
    
        <script>
	   
		function update_approval(id,value)
		{
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}purchase_order.update_approval/po_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	</script>
        {{/if}}
        
        </td>
       <td> 
       {{if $item.po_component_name}}
       <a href="{{$BASE_URL}}{{$XFA.detail}}/po_id/{{$item.po_id}}" class="various" title="Edit"> 
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
             <a href="{{$BASE_URL}}purchase_order.delete_po/po_id/{{$item.po_id}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete">
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>&nbsp;&nbsp
       {{/if}}      
       </td>
       
        
      </tr>
      {{assign var=countn value=$countn+1}}
      {{/foreach}}
      </tbody>
      
    </form>
    {{/if}}
  </table>
  
  {{if $last > 1}}
  <table width="90%" border="0" cellpadding="0" cellspacing="0">
    <tr> {{if $list}}
      <td align="center"><div class='pagination'> {{if $pagenum == 1}} <span class='disabled'>« previous</span> {{else}} <a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{math equation="x - y" x=$pagenum y=1}}" title="Previous">« previous</a> {{/if}}
          
          {{if $pagenum != 1}} <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/1" title="{{$page_num}} Page">1</a></span> {{else}}<span class='current'>1</span> {{/if}}{{if $pagenum != 2}} <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/2" title="{{$page_num}} Page">2</a></span> {{else}}<span class='current'>2</span> {{/if}}
          {{if $paginateprev.0 > 3}}
          ...
          {{/if}}
          {{foreach from=$paginateprev key="page_key" item="page_num"}}
          {{if $page_num == $pagenum OR $page_num <= 2}}
          {{elseif $page_num == $lastone}}
          
          {{else}} <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$page_num}}" title="{{$page_num}} Page">{{$page_num}}</a></span> {{/if}}
          {{/foreach}}
          
          {{foreach from=$paginatenext key="page_key" item="page_num2"}}
          {{if $page_num2 < $last AND $page_num2 != $lastone}}
          {{if $page_num2 == 1}}
          {{elseif $page_num2 == 2}}
          {{else}}
          {{if $page_num2 == $pagenum OR $page_num2 <= 0}} <span class='current'> {{$page_num2}}</span> {{else}} <a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$page_num2}}" title="{{$page_num2}} Page">{{$page_num2}}</a> {{/if}}
          {{/if}}     
          {{/if}}
          {{/foreach}}
          {{if $page_num2 < $lasttow}}
          ...
          {{/if}}
          {{if $lastone == 1}}
          {{elseif $lastone == 2}}
          {{else}}
          {{if $pagenum == $lastone }} <span class='current'>{{$lastone}}</span> {{else}} <a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$lastone}}" title="{{$lastone}} Page">{{$lastone}}</a> {{/if}}
          {{/if}}
          {{if $last == 1}}
          {{elseif $last == 2}}
          {{else}}
          {{if $pagenum == $last}} <span class='current'>{{$last}}</span> {{else}} <a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$last}}" title="{{$last}} Page">{{$last}}</a> {{/if}}
          {{/if}}
          {{if $pagenum == $last}} <span class='disabled'>next »</span> {{else}} <a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{math equation="x + y" x=$pagenum y=1}}" title="Next">next »</a></div>
        {{/if}} </td>
      {{else}}
      <td align="center" height="300">Record Not found... </td>
      {{/if}} </tr>
  </table>
  {{/if}} <br />
  <br />
  
</div>

