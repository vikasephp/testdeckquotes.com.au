<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/default.js"></script>
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
	var viewurl = "{{$BASE_URL}}design_agreement_invoice_report.view_procedure"+ "/random/" + Math.random();	

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


function add_status()
{
	var viewurl = "{{$BASE_URL}}design_agreement_invoice_report.view_status"+ "/random/" + Math.random();	

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


function add_type()
{
	var viewurl = "{{$BASE_URL}}design_agreement_invoice_report.view_type"+ "/random/" + Math.random();	

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


function add_payment()
{
	var viewurl = "{{$BASE_URL}}design_agreement_invoice_report.view_payment"+ "/random/" + Math.random();	

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
	   
#fancybox-wrap {z-index:9999999;} 	   
</style>

<h3 class="page-title">{{$title}}</h3>
<br />
<form name="mlist" method="post" enctype="multipart/form-data">

<div style="float:left; text-align:left;">
&nbsp; &nbsp; <input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> 
&nbsp; &nbsp;<input type="button" name="status_options" value="Status Admin" onclick="javascript:add_status();" /> 
&nbsp; &nbsp;<input type="button" name="type_options" value="Type Admin" onclick="javascript:add_type();" /> 
&nbsp; &nbsp;<input type="button" name="payment_options" value="Payment Admin" onclick="javascript:add_payment();" /> 
<br />

&nbsp; &nbsp; <strong>Search Address: </strong>
<input type="text" name="keyword" value="{{$keyword}}" style="width:250px;" placeholder="Search for Address"/>
<input type="submit" value="Search" name="search"  /> &nbsp;<input type="submit" name="clear_search" value = "Clear Search" /> <br />


&nbsp; &nbsp; <strong>Search Customer: </strong>
<input type="text" name="client"  style="width:250px;" placeholder="Search for First Name"/>
<input type="submit" value="Search" name="search"  /> &nbsp;<input type="submit" name="clear_search" value = "Clear Search" />
<br />

<!--&nbsp; &nbsp;<strong> Filter By Project Status: </strong> 

        <select name="project_status"/>
        <option value="">Show All</option>
        <option value="OPEN">OPEN</option>
        <option value="HOLD">HOLD</option>
        <option value="LOST">LOST</option>
        </select> 
        &nbsp; &nbsp;<input type="submit" value="Filter" name="filter" /> 
        <input type="submit" value="Clear Filter" name="clear" /> 
 <br />   -->
 
&nbsp; &nbsp;<strong> Filter By Invoice Status: </strong> 
<select name="invoice_status"/>
    <option value="0" >Please Select </option>
    {{foreach from = $stdata key="key2" item="item2"}}
    <option value="{{$item2.st_id}}">{{$item2.st_option}}</option>
    {{/foreach}}
</select> 
        &nbsp; &nbsp;<input type="submit" value="Filter" name="filter" /> 
        <input type="submit" value="Clear Filter" name="clear" /> 
 <br /> 
  
  &nbsp; &nbsp;<strong> Filter By Payment Status: </strong> 

        <select name="paytment_status"/>
        <option value="0" >Please Select </option>
                {{foreach from = $paydata key="key4" item="item4"}}
                <option value="{{$item4.dp_id}}">{{$item4.dp_option}}</option>
                {{/foreach}}
        </select> 
        &nbsp; &nbsp;<input type="submit" value="Filter" name="filter" /> 
        <input type="submit" value="Clear Filter" name="clear" /> 
        
</div>
<div style="float:right;"> 
<input type="submit" value="Show Hidden" name="showhidden" />
<input type="button" value="Export To XLS" onclick="document.location.href='{{$BASE_URL}}design_agreement_invoice_report.home/export/1'" />
</div>

</div>
<div style="float:left; width:100%;">
  <table id="doclist-table" class="nav-back" width="100%">
    <thead>
      <tr>
        <th class="topmenu" align="center" valign="middle" width="3%">SrNo</th>
        <th class="topmenu" align="center" valign="middle" width="14%">Project Address</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Project Status</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Design <br />Agreement Sent </th>
        <th class="topmenu" align="center" valign="middle" width="8%">Sent Date</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Signed Design <br />Agreement Link </th>
        <th class="topmenu" align="center" valign="middle" width="8%">Date Uploaded </th>
        
        <th class="topmenu" align="center" valign="middle" width="8%">Design Agreement Signed Date </th>
        <th class="topmenu" align="center" valign="middle" width="8%">Proposal Document Date </th>
        <th class="topmenu" align="center" valign="middle" width="8%">Type </th>
        <th class="topmenu" align="center" valign="middle" width="8%">Invoice Status </th>
        <th class="topmenu" align="center" valign="middle" width="8%">Invoice Number </th>
        <th class="topmenu" align="center" valign="middle" width="8%">Invoice Date </th>
        <th class="topmenu" align="center" valign="middle" width="8%">Amount </th>
        <th class="topmenu" align="center" valign="middle" width="8%">Payment Date </th>
        <th class="topmenu" align="center" valign="middle" width="8%">Payment Status </th>
        <th class="topmenu" align="center" valign="middle" width="8%">Notes</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Hide From Report</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Action</th>
                   
      </tr>
    {{if $list}}
    <tbody>

      <!--{{assign var=countn value= $numstartvounter}}-->
       {{assign var=countn value= $total}}
      
       {{foreach from=$list key="key" item="item"}}
        <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
        <td> {{counter}} </td>
        <td><strong>{{$item.bcust_fname}} {{$item.bcust_lname}}</strong><br />
        <a href="{{$item.link}}" target="_blank">{{$item.bsn_address}}</a></td>
        <td>{{$item.bsn_sub_status}}</td>
        <td>
        {{if $item.doc_file_name_214}}
        <a href="/design_agreement_invoice_report.download_content?file_name={{$item.doc_file_name_214}}&module_name=design_agreement_invoice_report.home" target="_blank">Download</a>
        {{/if}}
        </td>
        <td><input type="text" name="da_sent_date" value="{{$item.bsn_dair_agree_sent}}"  onfocus="update_sent_date({{$item.bsn_id}},this.value)"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo1_{{$item.bsn_id}}" style="width:60px;"/>
        
         <script>
			function update_sent_date(id,value)
			{
					
					 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}design_agreement_invoice_report.update_sent_date/bsn_id/"+id+"/value/"+value,
						   success: function(result){
							
						}
						
					});
			}
	    </script></td>
        
        <td>
        <a href="/design_agreement_invoice_report.download_content?file_name={{$item.doc_file_name}}&module_name=design_agreement_invoice_report.home" target="_blank">Download</a> 
        </td>
       
       <td>{{$item.doc_date_uploaded|date_format:"%d-%m-%Y"}}</td>
       
        <td>
        <input type="text" name="dt_of_dasd" value="{{$item.bsn_dair_dasd}}"  onfocus="update_date_dasd({{$item.bsn_id}},this.value)"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo11_{{$item.bsn_id}}" style="width:60px;"/>
        
         <script>
			function update_date_dasd(id,value)
			{
					
					 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}design_agreement_invoice_report.update_date_dasd/bsn_id/"+id+"/value/"+value,
						   success: function(result){
							
						}
						
					});
			}
	    </script>
        
        </td>
        
        <td><input type="text" name="dt_of_pdd" value="{{$item.bsn_dair_pdd}}"  onfocus="update_date_pdd({{$item.bsn_id}},this.value)"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo2_{{$item.bsn_id}}" style="width:60px;"/>
        
         <script>
			function update_date_pdd(id,value)
			{
					
					 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}design_agreement_invoice_report.update_date_pdd/bsn_id/"+id+"/value/"+value,
						   success: function(result){
							
						}
						
					});
			}
	    </script></td> 
        
        <td>
          <form name ="recmet2" method="post" action="">
          <select name="status" onChange="update_type({{$item.bsn_id}}, this.value)"/>
               <option value="0" {{if $item.sp_www eq -1}} selected="selected" {{/if}}>Please Select </option>
                {{foreach from = $typedata key="key3" item="item3"}}
                <option value="{{$item3.dt_id}}" {{if $item3.dt_id eq $item.bsn_dair_type}} selected="selected" {{/if}}>{{$item3.dt_option}}</option>
                {{/foreach}}
          </select>
          </form>
          
          <script>
			function update_type(id,value)
			{
					 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}design_agreement_invoice_report.update_type/bsn_id/"+id+"/value/"+value,
						   success: function(result){
							
						}
						
					});
			}
	    </script></td>
        
        <td>  <form name ="recmet2" method="post" action="">
          <select name="status" onChange="update_status({{$item.bsn_id}}, this.value)"/>
        			
                <option value="0" {{if $item.sp_www eq -1}} selected="selected" {{/if}}>Please Select </option>
                {{foreach from = $stdata key="key2" item="item2"}}
                <option value="{{$item2.st_id}}" {{if $item2.st_id eq $item.bsn_dair_inv_status}} selected="selected" {{/if}}>{{$item2.st_option}}</option>
                {{/foreach}}
                     
          </select>
        </form>
          
          <script>
			function update_status(id,value)
			{
					 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}design_agreement_invoice_report.update_status/bsn_id/"+id+"/value/"+value,
						   success: function(result){
							
						}
						
					});
			}
	    </script>
        </td>
        
        <td>{{ if $item.bsn_dair_invoice}}<br />
             <a href="/design_agreement_invoice_report.download_content_inv?file_name={{$item.bsn_dair_invoice}}&module_name=design_agreement_invoice_report.home" target="_blank">{{$item.bsn_dair_invoice_num}}</a>
              {{else}} {{$item.bsn_dair_invoice_num}}
                {{/if}}
        </td>
        <td>{{$item.bsn_dair_invoice_date}}</td>
         
         <td>
          <form name = "amt" method="post" action="">
        <input type="text" name="amount[{{$item.bsn_id}}]"   value="{{$item.bsn_dair_amount}}" onkeyup="update_amount({{$item.bsn_id}},this.value)" style="width:80px;" /> 
        
      <script>
			function update_amount(id,value)
			{
					$.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}design_agreement_invoice_report.update_amount/bsn_id/"+id+"/value/"+value,
						   success: function(result){
						}
						
					});
			}
	    </script>
     
       </form>
         </td>
         <td>
         
          <form name = "pay_date" method="post" action="">
      <input type="text" name="payment[{{$item.bsn_id}}]" value="{{$item.bsn_dair_pay_date}}" id="demo3_{{$item.bsn_id}}"  class="w16em dateformat-d-ds-m-ds-Y dtpic" onfocus="update_pay_date({{$item.bsn_id}},this.value)" /> 
      
       </form>
        <script>
			function update_pay_date(id,value)
			{
					
					 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}design_agreement_invoice_report.update_payment/bsn_id/"+id+"/value/"+value,
						   success: function(result){
						}
					});
			}
	    </script>
       
       </td>
            
         <td>
         <form name ="recmet2" method="post" action="">
          <select name="status" onChange="update_payment_status({{$item.bsn_id}}, this.value)"/>
        			
                <option value="0" >Please Select </option>
                {{foreach from = $paydata key="key3" item="item3"}}
                <option value="{{$item3.dp_id}}" {{if $item3.dp_id eq $item.bsn_dair_pay_status}} selected="selected" {{/if}}>{{$item3.dp_option}}</option>
                {{/foreach}}
                     
          </select>
        </form>
          
          <script>
			function update_payment_status(id,value)
			{        
			    
					 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}design_agreement_invoice_report.update_payment_status/bsn_id/"+id+"/value/"+value,
						   success: function(result){
							
						}
						
					});
			}
	    </script>
         
         </td>
         
              
        
         <td {{if $item.bsn_dair_notes}} style="background:#F00;" {{/if}}><a href="{{$BASE_URL}}design_agreement_invoice_report.notes/bsn_id/{{$item.bsn_id}}" class="various">Notes</a></td> 
        
        <td>
         <form name ="recmet3" method="post" action="">
     	<input type="hidden" name="hide[{{$item.bsn_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="hide[{{$item.bsn_id}}]" value="1"  onclick="this.form.submit();" {{if $item.bsn_dair_hide eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form>   

         </td>
        
        <td> <a href="{{$BASE_URL}}{{$XFA.detail}}/bsn_id/{{$item.bsn_id}}" class="various" title="Edit"> 
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a></td>
      </tr>
      {{assign var=countn value=$countn-1}}
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
  <table id="doclist-table"  width="100%" bgcolor="#d3e8d6">
    <thead>
  
      <tr>
        <td colspan="2">&nbsp;</td>
      </tr>
    </thead>
  </table>
</div>