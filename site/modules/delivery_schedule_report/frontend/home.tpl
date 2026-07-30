<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/tree/simpletreemenu.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tree/simpletree.css" />
{{include file=$jdata}}
{{include file=$tiny_basic}}

<script type="text/javascript" >  

function add_status()
{
	var viewurl = "{{$BASE_URL}}delivery_schedule_report.view_status"+ "/random/" + Math.random();	

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
var viewurl = "{{$BASE_URL}}delivery_schedule_report.detail"+ "/random/" + Math.random();	
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
	var viewurl = "{{$BASE_URL}}delivery_schedule_report.view_procedure"+ "/random/" + Math.random();	

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

function insert_po()
{
	var viewurl = "{{$BASE_URL}}delivery_schedule_report.insert_po"+ "/random/" + Math.random();	
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


<script type="text/javascript" > 
function addfeedback(ds_id)
{
	
	var viewurl = "{{$BASE_URL}}delivery_schedule_report.addfeedback"+ "/ds_id/" + ds_id;	
	
		
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


<script type="text/javascript" > 
function viewfeedback(ds_id)
{
	var viewurl = "{{$BASE_URL}}delivery_schedule_report.viewfeedback"+ "/ds_id/" + ds_id;	
	
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

<style>

     .content-5911 { 
            position: fixed; 
            top: 50%; 
            left: 50%; 
            transform: translate(-50%, -50%); 
            max-width: 700px; 
            width:100%;
            word-break: break-word;
            height: 200px; 
            text-align: center; 
            background-color: #fff; 
            box-sizing: border-box; 
            padding: 20px; 
            z-index: 10000000; 
            display: none;
            border: 2px solid #333;
  border-radius: 5px;
            /*to hide popup initially*/ 
        } 
        
        .content-5911 h2 {
          font-size: 22px;
          font-weight: 600;
        }
        .content-5911 p {
              margin-top: 40px;
              font-size: 14px;
              font-weight: 600;
            }
            
            #shadow--me {
              z-index: 9999999;
              position: fixed;
              background: #000;
              width: 100%;
              height: 100%;
              top: 0;
              bottom: 0;
              opacity: 0.7;
            }
          
        .close-btn-5911 { 
            position: absolute; 
            right: 20px; 
            top: 15px; 
            background-color: black; 
            color: white; 
            border-radius: 50%; 
            padding: 3px 6px; 
            cursor: pointer;
        } 

#fancybox-wrap {z-index:9999999;} 
.generate_link_5213 {
	display: inline-block;
	margin-bottom: 0;
	font-weight: 400;
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	-ms-touch-action: manipulation;
	touch-action: manipulation;
	cursor: pointer;
	background: #323232;
	border: 1px solid transparent;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 1.42857143;
	border-radius: 4px;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	color: #fff;
	margin-top: 7px;
}
</style>

<h3 class="page-title">{{$title}}</h3>
<br />

<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
<div style="float:left; text-align:left;">
&nbsp;&nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> 
<input type="button" name="priority" value="Edit Delivery Event" onclick="javascript:add_component();" /> 
&nbsp; <input type="button" name="status" value="Status" onclick="javascript:add_status();" /> 
</div>

<div style="float:right">
<input type="button" value="Export To XLS" onclick="document.location.href='{{$BASE_URL}}{{$XFA.home}}/export/1'" /> &nbsp;
<input type="button" name="inertpo" value="Insert PO to existing delivery" onclick="javascript:insert_po();" /> 
<input type="submit" name="show_hidden" value = "Show Hidden" />
<input type="button" name="Add New " value="Add New" onclick="javascript:add_new();" />
</div> <br />
<div style="text-align:left; margin-left:10px;">
<strong>Status :&nbsp; </strong> 
 <select name="status_search">
      
        {{foreach from = $stdetail key="key2" item="item2"}}
        <option value="{{$item2.st_id}}">{{$item2.st_status}}</option>
        {{/foreach}}
       </select>
<input type="submit" name="search_st" value = "Search" /> 
<input type="submit" name="clear" value = "Clear Search" /> <br />

<strong>Delivery Component :&nbsp; </strong> 
<select name="dc_search">
         {{foreach from = $cdetail key="key3" item="item3"}}
        <option value="{{$item3.qb_id}}">{{$item3.qb_component}}</option>
        {{/foreach}}
</select>
<input type="submit" name="search_dc" value = "Search" /> 
<input type="submit" name="clear" value = "Clear Search" /> <br />


<span><strong>Search :</strong>&nbsp;</span>
<input type="text" name="keyword" value="{{$keyword}}" style="width:400px;" placeholder="Search By UIDD OR Project Address OR Suppliers"/>
&nbsp;&nbsp;
<input type="submit" value="Search" name="search"  />
</div>
<div style="float:left; width:100%;">
  <table id="doclist-table" class="nav-back" width="100%">
    <thead>
      <tr>
        <th class="topmenu" align="center" valign="middle" width="3%">UIDD</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Sub Number</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Status</th>
        <th class="topmenu" align="center" valign="middle" width="15%">Project Address</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Delivery Component</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Include Trades</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Purchase Order Number</th>
        <th class="topmenu" align="center" valign="middle" width="7%">PO Pdf File</th>
        <th class="topmenu" align="center" valign="middle" width="7%">DCF Pdf File</th>
        <th class="topmenu" align="center" valign="middle" width="7%">DCF Word File</th>
        <th class="topmenu" align="center" valign="middle" width="10%">Supplier</th>
        <th class="topmenu" align="center" valign="middle" width="10%">Supplier Date</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Calendar Date</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Add Feedback</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Action</th>
         
      </tr>
    {{if $list}}
    <tbody>
    <form name="mlist" method="post">
      <!--{{assign var=countn value= $numstartvounter}}-->
       {{assign var=countn value= 1}}
      
      {{foreach from=$list key="key" item="item"}}
      <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
        <td>{{$item.ds_uidd}} </td>
        <td>{{$item.ds_sub_number}}</td>
        
        <td {{if $item.st_color eq 1}} style="background:#00CC33;" {{elseif $item.st_color eq 2}} style="background:#ff7f27;" {{elseif $item.st_color eq 3}} style="background:#F00;" {{/if}} >
        <select name="status"  Onchange = "update_status({{$item.ds_id}},this.value)">
        <option value="-1" {{if $item.st_status eq -1}} selected="selected" {{/if}}>Please Select </option>
        {{foreach from = $stdetail key="key2" item="item2"}}
        <option value="{{$item2.st_id}}" {{if $item2.st_id eq $item.ds_status}} selected="selected" {{/if}}>{{$item2.st_status}}</option>
        {{/foreach}}
       </select>
        
        <script>
	   
		function update_status(id,value)
		{
			
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}delivery_schedule_report.update_status/ds_id/"+id+"/value/"+value, 
					   success: function(result){
					}
				});
		}
	</script>
        
        </td>
        
        
        <td>{{$item.ds_project}}</td>
           
        <td>
      <select name="{{$TABLE}}[po_delivery_event]"  Onchange = "update_delivery_event({{$item.ds_id}},this.value)">
        <option value="-1" {{if $item.po_delivery_event eq -1}} selected="selected" {{/if}}>Please Select </option>
        {{foreach from = $cdetail key="key3" item="item3"}}
        <option value="{{$item3.qb_id}}" {{if $item3.qb_id eq $item.ds_delivery_event }} selected="selected" {{/if}}>{{$item3.qb_component}}</option>
        {{/foreach}}
    </select>
        
        <script>
	   
		function update_delivery_event(id,value)
		{
			
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}delivery_schedule_report.update_delivery_event/ds_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	</script>
        
        </td>
        
       <td>
       <form name ="recmet2" method="post" action="">
        <input type="hidden" name="car_project" value="{{$item.car_project}}" />
        <input type="hidden" name="car_alert" value="{{$item.car_alert}}" />
     
        {{$item.ds_include_trades}} <br /><br />
        <a href ="{{$BASE_URL}}delivery_schedule_report.include_suppliers/ds_id/{{$item.ds_id}}" class="various">Include Trades</a><br /><br />
       
       </td>
        <td>
       
        
         <select name="po" Onchange = "update_po({{$item.ds_id}},this.value)">
              <option value="-1" {{if $item.ds_po_number eq -1}} selected="selected" {{/if}}>Please Select </option>
             {{foreach from=$podetail key="key4" item="item4"}}
             <option value="{{$item4.po_po_number}}" {{if $item.ds_po_number eq $item4.po_po_number }} selected="selected" {{/if}}>{{$item4.po_po_number}}</option>
             {{/foreach}}
        </select>
        
        <script>
	
	function update_po(id,value)
	{
		
		
		var t = "#tana_"+id;
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}delivery_schedule_report.update_po/ds_id/"+id+"/value/"+value,
				   success: function(result){
					<!--result2 = "<a href='https://deckquote.s3.amazonaws.com/files/purchase_order_quote/"+result+"' target='_blank'>View</a>";-->
					result2 = "<a href='/delivery_schedule_report.download_content_po?file_name="+result+"&module_name=delivery_schedule_report.home target='_blank'>View</a>";
					
					   $(t).html(result2);
				}
			});
		
	}
	</script>
        
        </td>
        
        <td> 
        <div id = "tana_{{$item.ds_id}}">
        {{if $item.ds_pdf_file}} 
       <!-- <a href="https://deckquote.s3.amazonaws.com/files/purchase_order_quote/{{$item.ds_pdf_file}}" target="_blank">View</a>-->
        <a href="/delivery_schedule_report.download_content_po?file_name={{$item.ds_pdf_file}}&module_name=delivery_schedule_report.home">View</a>
        <span class="generate_link_5213" data-file-name="{{$item.ds_pdf_file}}" data-module-name="delivery_schedule_report.home.purchase_order_quote">Generate link</span>
        {{/if}}
        </div>
        </td>
        
        <td>
         {{if $item.ds_dcf_pdf_file}} 
        <!--<a href="https://deckquote.s3.amazonaws.com/files/uploads_2023/{{$item.ds_dcf_pdf_file}}" target="_blank">View</a>-->
        <a href="/delivery_schedule_report.download_content?file_name={{$item.ds_dcf_pdf_file}}&module_name=delivery_schedule_report.home" target="_blank">View</a>
         <span class="generate_link_5213" data-file-name="{{$item.ds_dcf_pdf_file}}" data-module-name="delivery_schedule_report.home">Generate link</span>
        {{/if}}
        </td>
        
        <td>{{if $item.ds_delivery_request}} 
        <!--<a href="https://deckquote.s3.amazonaws.com/files/uploads_2023/{{$item.ds_delivery_request}}" target="_blank">View</a>-->
        <a href="/delivery_schedule_report.download_content?file_name={{$item.ds_delivery_request}}&module_name=delivery_schedule_report.home" target="_blank">View</a>
         <span class="generate_link_5213" data-file-name="{{$item.ds_delivery_request}}" data-module-name="delivery_schedule_report.home">Generate link</span>
        {{/if}}</td>
        
        <td>
        
         <select name="delivery[ds_supplier]" Onchange = "update_supplier({{$item.ds_id}},this.value)">
              <option value="-1" {{if $item.ds_supplier eq -1}} selected="selected" {{/if}}>Please Select </option>
             {{foreach from=$supdetail key="key4" item="item4"}}
             <option value="{{$item4.co_company_name}}" {{if $item.ds_supplier eq $item4.co_company_name }} selected="selected" {{/if}}>{{$item4.co_company_name}}</option>
             {{/foreach}}
        </select>
        
          <script>
	   
		function update_supplier(id,value)
		{
		
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}delivery_schedule_report.update_supplier/ds_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	  </script>
        
        
        </td>
     
     <td {{if $item.ds_date_of_delivery ne $item.ds_supplier_date}} style="background:#F00;" {{/if}}>
     <input type="text" name="dd" value="{{$item.ds_supplier_date}}" id="demo_{{$item.ds_id}}" class="w16em dateformat-d-ds-m-ds-Y" onfocus="update_sd({{$item.ds_id}},this.value)" style="width:80px;"  /> </td>
     
      <script>
	   
		function update_sd(id,value)
		{
		
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}delivery_schedule_report.update_supplier_date/ds_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	  </script>
          
      <td {{if $item.ds_date_of_delivery ne $item.ds_supplier_date}} style="background:#F00;" {{/if}} >
        {{$item.ds_date_of_delivery}}
        </td>    
     
     <td>
     <input type="button" name="Alert" value="Add Feedback" onclick="javascript:addfeedback({{$item.ds_id}});" style="width:90px; height:20px; font-size:11px; line-height:17px !important; padding:0px !important" /><br />
     <input type="button" name="Alert" value="View Feedback" onclick="javascript:viewfeedback({{$item.ds_id}});" style="width:90px; height:20px; font-size:11px; line-height:17px !important; padding:0px !important" />
        
     </td>
          
       <td> 
       
       <a href="{{$BASE_URL}}{{$XFA.detail}}/ds_id/{{$item.ds_id}}" class="various" title="Edit"> 
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
             <a href="{{$BASE_URL}}delivery_schedule_report.delete/ds_id/{{$item.ds_id}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete">
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>&nbsp;&nbsp
          
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
          
          {{if $pagenum != 1}} <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/1" title="{{$pagenum}} Page">1</a></span> {{else}}<span class='current'>1</span> {{/if}}{{if $pagenum != 2}} <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/2" title="{{$pagenum}} Page">2</a></span> {{else}}<span class='current'>2</span> {{/if}}
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
<div id="shadow--me" style="display:none;"></div>
 <div class="content-5911"> 
        <div  class="close-btn-5911"> 
            × 
        </div> 
        <h2>Please copy the link</h2> 
  
        <p>   Please wait...  </p> 
    </div> 
<script>

     $(document).ready(function(){
         
          $(".content-5911 .close-btn-5911").click(function(){
               $("#shadow--me").hide(); $(".content-5911").hide();
               $(".content-5911 p").html('Please wait...');
          })
         
          $("#doclist-table .generate_link_5213").click(function(){
              $("#shadow--me").show(); $(".content-5911").show();
              var fileName = $(this).attr("data-file-name"); var moduleName = $(this).attr("data-module-name");
              
               $.ajax({
                      type: "POST",
                      url: "/delivery_schedule_report.generate_file_link",
                      data: {"fileName":fileName,"moduleName":moduleName },
                      dataType: "json",
                      success: function (response) {
                        if(response.status == "true" || response.status == true){ 
                           
                           var filePath =  response.data.file_path;
                            $(".content-5911 p").html(filePath);
                            
                        } 
                        else {  }
                     }
                     
               })
                   
         })
     })
</script>

