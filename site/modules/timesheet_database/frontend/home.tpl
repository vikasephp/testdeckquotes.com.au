<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
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
	width:75px !important;
	padding-top:1px !important;
	padding-bottom:1px !important;
	margin-bottom:10px !important;	
}
.dt {border:1px solid #CCC; padding:8px; margin-top:15px !important; }	
#fancybox-wrap {z-index:9999999;}

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


function add_procedure()
{
	var viewurl = "{{$BASE_URL}}timesheet_database.view_procedure"+ "/random/" + Math.random();	

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


 function add_reimbursements()
{
	var viewurl = "{{$BASE_URL}}timesheet_database.view_reimbursements"+ "/random/" + Math.random();	

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

function add_leave()
{
	var viewurl = "{{$BASE_URL}}timesheet_database.view_leave"+ "/random/" + Math.random();	

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

function add_employee(opdt)
{
	var viewurl = "{{$BASE_URL}}timesheet_database.detail"+ "/opdt/" +opdt;	
	
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
<div style="float:left; text-align:left;">
&nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> 
&nbsp;<input type="button" name="proc_panel" value="Reimbursements Admin" onclick="javascript:add_reimbursements();" /> 
&nbsp;<input type="button" name="proc_panel" value="Leave Admin" onclick="javascript:add_leave();" /> 

<table border="1" width="450" cellpadding="5">
<input type="hidden" name="show" value="1" />
<tr>
<td style="width:30%"><strong>Open</strong></td>
<td><input type="text" name="open_date"  value="{{$open_date}}" class="w16em dateformat-d-ds-m-ds-Y dtpic" /></td>
<td rowspan="2"><input type="submit" name="run_report"  value="Run Report" /></td>
</tr>
{{if $close_date}}
<tr>
<td style="width:30%"><strong>Close</strong></td>
<td>{{$close_date}}</td>
</tr>
<tr>
<td colspan="3">
<input type="hidden" value="{{$open_date}}" name="od" />
<input type="submit" name="archive"  value="Archive This Report" onclick="javascript:if(!confirm('Are you sure want to make Archive?')) return false;"/>
&nbsp; &nbsp;<input type="button" name="Add New " value="Add Extra Employee" onclick="javascript:add_employee('{{$open_date}}');" />
</td>
{{/if}}
</table>
<br />

</div>

</form>
{{if $show}}

{{if $msg}} <br /> <div style="padding-left:20px; font-size:18px; color:#F00;"> {{$msg}} </div>{{/if}}
<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
         
                   <th class="topmenu" align="center" valign="middle" width="3%">SrNo</th> 
                   <th class="topmenu" align="center" valign="middle" width="12%">Employee Name</th> 
                   <th class="topmenu" align="center" valign="middle" width="8%">PDF Timesheet</th> 
                   <th class="topmenu" align="center" valign="middle" width="10%">Discrepancies</th>
                   <th class="topmenu" align="center" valign="middle" width="7%">Total Hours</th>  
                   <th class="topmenu" align="center" valign="middle" width="7%">Total KM's</th>
                   <th class="topmenu" align="center" valign="middle" width="7%">Any Overtime</th>
                   <th class="topmenu" align="center" valign="middle" width="5%">Any  Reimbursements</th>
                   <th class="topmenu" align="center" valign="middle" width="7%">Any Leave</th>
                   <th class="topmenu" align="center" valign="middle" width="7%">Pay Slip</th>
                   <th class="topmenu" align="center" valign="middle" width="7%">User</th>
         	 
            </tr>
        </thead>
    <tbody>

  {{assign var=countn value= $total}}
 {{foreach from=$list key="key" item="item"}}

    <tr bgcolor="#FFFFFF">


        <td>{{counter}}</td>
        <td>{{$item.td_employee_name}}</td>
        <td>
            <form name="di" method="post" action="" enctype="multipart/form-data" >
            <input type="hidden" name="open_date" value="{{$open_date}}" />
            <input type="hidden" name="show" value="1" />
            <input type="hidden" name="td_id" value="{{$item.td_id}}" />
            <input type="file"  name="discre" />
            <input type="submit" name="upload_discre" value="upload" />
            </form>
        {{if $item.td_pdf_timesheet}}
         <a href="/timesheet_database.download_content?file_name={{$item.td_pdf_timesheet}}&module_name=timesheet_database.home" >Download</a> 
        {{/if}}
        </td>  
 
        <td>
        <select name="desc[$item.td_id]" onchange="update_desc({{$item.td_id}},this.value)" >
        <option value="">Please Select </option>
        <option value="Yes" {{if $item.td_discrepancies eq 'Yes'}} selected="selected" {{/if}}>Yes</option>
        <option value="No" {{if $item.td_discrepancies eq 'No'}} selected="selected" {{/if}}>No</option>
        </select><br />
        <a href="{{$BASE_URL}}timesheet_database.notes/td_id/{{$item.td_id}}" class="various">Notes</a>
        <script>
			function update_desc(id,value)
			{
					 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}timesheet_database.update_desc/td_id/"+id+"/value/"+value,
						     success: function(result){
						}
					});
			}
	    </script>
        
        </td>
        
        <td><input type="text" style="width:60px;" value="{{$item.td_total_hours}}" onkeyup="update_tot_hours({{$item.td_id}},this.value)" />
        <script>
			function update_tot_hours(id,value)
			{
					 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}timesheet_database.update_tot_hours/td_id/"+id+"/value/"+value,
						     success: function(result){
						}
					});
			}
	    </script>
        </td>
        
        <td><input type="text" style="width:60px;" value="{{$item.td_total_km}}" onkeyup="update_tot_km({{$item.td_id}},this.value)" />
        <script>
			function update_tot_km(id,value)
			{
					 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}timesheet_database.update_tot_km/td_id/"+id+"/value/"+value,
						     success: function(result){
						}
					});
			}
	    </script>
        
        </td>
        <td>
        <select name="any_ot[$item.td_id]" onchange="update_any_ot_opt({{$item.td_id}},this.value)" >
        <option value="">Please Select </option>
        <option value="Yes" {{if $item.td_any_op_option eq 'Yes'}} selected="selected" {{/if}}>Yes</option>
        <option value="No"  {{if $item.td_any_op_option eq 'No'}} selected="selected" {{/if}}>No</option>
        </select>
        
        {{if $item.td_any_op_option eq 'Yes'}}
         <input type="text" style="width:60px;"  value="{{$item.td_any_op_value}}" onkeyup="update_any_ot_val({{$item.td_id}},this.value)" />
         {{else}}
        <div style="display:none;" id="any{{$item.td_id}}" >
         <input type="text" name="any_val[$item.td_id]" style="width:60px;"  value="{{$item.td_any_op_value}}" onkeyup="update_any_ot_val({{$item.td_id}},this.value)" />
        </div>
        {{/if}}
        
        <script>
			function update_any_ot_opt(id,value)
			{
				     var anyot = "#any"+id;
					 if(value=='Yes') {
						 $(anyot).show();
					 } else {
					
						 $(anyot).css("display", "none");
					 }
					 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}timesheet_database.update_any/td_id_1/"+id+"/value/"+value,
						     success: function(result){
						}
					});
			}
			
			function update_any_ot_val(id,value)
			{
				     
					 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}timesheet_database.update_any/td_id_2/"+id+"/value/"+value,
						     success: function(result){
						}
					});
			}
	    </script>
        
        </td>
        <td>
        <form name ="recmet2" method="post" action="">
          <select name="reim[{{$item.td_id}}]" onChange="update_any_reim({{$item.td_id}}, this.value)"/>
        			
                <option value="" >Please Select </option>
                {{foreach from = $reiData key="key3" item="item3"}}
                <option value="{{$item3.tr_option}}" {{if $item3.tr_option eq $item.td_any_reim}} selected="selected" {{/if}}>{{$item3.tr_option}}</option>
                {{/foreach}}
                     
          </select>
        </form>
         
          <script>
			function update_any_reim(id,value)
			{
				 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}timesheet_database.update_any_reim/td_id/"+id+"/value/"+value,
						     success: function(result){
						}
					});
			}
	     </script>
           
        </td>  
        

       <td><form name ="recmet2" method="post" action="">
          <select name="leave[{{$item.td_id}}]" onChange="update_any_leave({{$item.td_id}}, this.value)"/>
        			
            <option value="0" >Please Select </option>
            {{foreach from = $leaveData key="key4" item="item4"}}
            <option value="{{$item4.tl_option}}" {{if $item4.tl_option eq $item.td_any_leave}} selected="selected" {{/if}}>{{$item4.tl_option}}</option>
            {{/foreach}}
                     
          </select>
        </form>
           
		   <script>
			function update_any_leave(id,value)
			{
				 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}timesheet_database.update_any_leave/td_id/"+id+"/value/"+value,
						     success: function(result){
						}
					});
			}
	     </script>
         </td> 
        
       <td><form name="di" method="post" action="" enctype="multipart/form-data" >
            <input type="hidden" name="open_date" value="{{$open_date}}" />
            <input type="hidden" name="show" value="1" />
            <input type="hidden" name="td_id" value="{{$item.td_id}}" />
            <input type="file"  name="payslip" />
            <input type="submit" name="upload_slip" value="upload" />
            </form>
        {{if $item.td_pay_slip}}
         <a href="/timesheet_database.download_content?file_name={{$item.td_pay_slip}}&module_name=timesheet_database.home" >Download</a> 
        {{/if}}</td>
        
        <td>{{$item.td_user}}</td> 
        
<!--        <td> <a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" class="various" title="Edit"> 
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
             <a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete">
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>&nbsp;&nbsp
             
        </td>-->
    </tr>  
    {{assign var=countn value=$countn-1}}
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
{{/if}}