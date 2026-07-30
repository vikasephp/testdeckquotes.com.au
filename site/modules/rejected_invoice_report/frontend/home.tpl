<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

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
				'width': '95%',
				'height': '90%',
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
	var viewurl = "{{$BASE_URL}}rejected_invoice_report.view_procedure"+ "/random/" + Math.random();	

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
var viewurl = "{{$BASE_URL}}rejected_invoice_report.detail"+ "/random/" + Math.random();	
 $(document).ready(function () {
        $.fancybox({
				'width': '95%',
				'height': '95%',
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

.dtpic {
	width:65px !important;
	padding-top:1px !important;
	padding-bottom:1px !important;	
}

.set { font-size:10px !important; 
       width:25px !important; display:inline-block; 
	   padding-top:1px !important;
	   padding-bottom: 1px !important;
	   padding-left:1px !important;
	   height:25px !important; }
	   
	   
.wrapper1, .wrapper2{width: 100%; border: none 0px RED; overflow-x: scroll; overflow-y:hidden; scrollbar-color: yellow blue;}
.wrapper1{height: 20px; }
.wrapper2{ }
.div1 {width:2280px; height: 20px; }
.div2 {width:2280px; height: 700px; overflow: auto;}   


</style>

<h3 class="page-title">{{$title}}</h3>

<br />

<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
<div style="float:left;text-align:left; margin-left:10px;">

<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" />
<br />
{{if !empty($sql) }}<input type="hidden" name="sql" value="{{$sql}}"  /> {{/if}}



<br />
<strong>Search By Invoice Number :</strong>
<input type="text" name="inv_no" style="width:150px;" />
<input type="submit" value="Search" name="search_all"  /> 
<br />
<strong>Search By Supplier :</strong>
<input type="text" name="supplier" style="width:150px;" />
<input type="submit" value="Search" name="search_all"  />


<br />

<strong> Filter By Status : </strong> 

        <select name="inv_status"/>
        <option value="">Please Select</option>
        <option value="Emailed">Emailed</option>
        <option value="Resolved">Resolved</option>
        <option value="Under Review">Under Review</option>
        <option value="Not Resolved">Not Resolved</option>
        </select> 
        &nbsp; &nbsp;<input type="submit" value="Filter" name="filter" /> 
  &nbsp; &nbsp;<input type="submit" value="Clear Search/Filter" name="clearall"  {{$class9}} />       
</div>

<div style="float:right"   > 
<input type="button" value="Export To XLS" onclick="document.location.href='{{$BASE_URL}}rejected_invoice_report.home/export/1'" />
<input type="button" name="Add New " value="Add New" onclick="javascript:add_new();" />
</div>

</form>

<div class="wrapper1">
    <div class="div1">
    </div>
</div>

<div class="wrapper2">
  <div class="div2 tableFixHead">
  <table id="doclist-table" class="nav-back" width="100%" >
    <thead>
      <tr>
        <th class="topmenu" align="center" valign="middle" width="2%">RID</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Type</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Email Date</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Invoice No</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Supplier</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Invoice</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Invoice Date</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Invoice Due Date</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Invoice Value</th>
        <th class="topmenu" align="center" valign="middle" width="4%">US Invoice Value</th>
        <th class="topmenu" align="center" valign="middle" width="4%">AUD Invoice Value</th>
        <th class="topmenu" align="center" valign="middle" width="10%">Reason for Rejection </th>
        <th class="topmenu" align="center" valign="middle" width="4%">Status</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Project Address if Found </th>
        <th class="topmenu" align="center" valign="middle" width="5%">PO Number</th>
        <th class="topmenu" align="center" valign="middle" width="6%">Value of PO</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Linked Purchase Order</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Notes</th>
       
       
        <th class="topmenu" align="center" valign="middle" width="2%">Action</th>
      </tr>
     </thead> 
    {{if $list}}
    <tbody>
    <form name="mlist" method="post">
      {{assign var=countn value= $numstartvounter}}
      {{foreach from=$list key="key" item="item"}}
      <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
        <td>{{$item.ri_rid}}</td>
        <td>{{$item.ri_type}}</td>
        <td>{{$item.ri_email_date}}</td>
        <td>{{$item.ri_invoice_num}}</td>
        <td>{{$item.ri_supplier}}</td>
        <td>{{if $item.ri_invoice}}<a href="{{$item.ri_invoice}}" target="_blank">Link</a>{{/if}}</td>
        <td>{{$item.ri_invoice_date}}</td>
        <td>{{$item.ri_invoice_due_date}}</td>
 		<td>{{$item.ri_invoice_value}}</td>
        <td>{{$item.ri_us_inv_value}}</td>
        <td>{{$item.ri_aud_inv_value}}</td>
        <td>{{$item.ri_reason_rejection}}</td>
        <td>{{$item.ri_status}}</td> 
        <td>{{$item.ri_project_address}} </td>
        <td> {{$item.ri_po_number}}</td>
        <td> {{$item.ri_value_of_po}}</td>
        <td>{{ $item.ri_linked_po}} </td>
         
          <td>{{$item.ri_notes}}</td>
        <td><a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" class="various" title="Edit"> <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>
          <!-- {{if $USER_GROUP == 'Administrators'}} -->
          <a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}" onclick="javascript:if(!confirm('Are you sure want to delete the listing? Because it will delete all the document related to this listing.')) return false;" title="Delete"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>
          <!--   {{/if}}-->
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
      <td align="center"><div class='pagination'> {{if $pagenum == 1}} <span class='disabled'><< previous</span> {{else}} <a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{math equation="x - y" x=$pagenum y=1}}" title="Previous"><< previous</a> {{/if}}
          
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
          {{if $pagenum == $last}} <span class='disabled'>next >></span> {{else}} <a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{math equation="x + y" x=$pagenum y=1}}" title="Next">next >></a></div>
        {{/if}} </td>
      {{else}}
      <td align="center" height="300">Record Not found... </td>
      {{/if}} </tr>
  </table>
  {{/if}} <br />
  <br />

</div>
</div>