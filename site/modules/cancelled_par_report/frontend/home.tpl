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
	width:65px !important;
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
	var viewurl = "{{$BASE_URL}}cancelled_par_report.view_procedure"+ "/random/" + Math.random();	

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
&nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> <br />
&nbsp;<strong> Project Search : </strong> 
<datalist id='project'>
           {{foreach from=$projdetail key="key3" item="item3"}}
            <option value="{{$item3.bsn_name}}" {{if $bsnid eq $item3.bsn_id}} selected="selected" {{/if}}>
            {{$item3.bsn_name}}
            </option>
            {{/foreach}}
  	 </datalist>
         <input type="text" list = 'project' name="project_name" style ="width:350px" value="{{$detail.cp_project_name}}" />

 
<input type="submit" name="search" value = "Search" /> 
<input type="submit" name="clear" value = "Clear All Search" /> <br />
</div>

<div style="float:right;"> 
<input type="submit" name="showall" value="Show Hidden" />
<input type="button" name="Add New " value="Add New" onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.detail}}');" />
</div>
</form>

<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
         
                   <th class="topmenu" align="center" valign="middle" width="3%">Unique Id</th> 
                   
                   <th class="topmenu" align="center" valign="middle" width="12%">Project Address </th> 
                   <th class="topmenu" align="center" valign="middle" width="10%">Appointment Name</th> 
                   <th class="topmenu" align="center" valign="middle" width="5%">Appointment Date/ Time</th>
                   <th class="topmenu" align="center" valign="middle" width="6%">Location</th>
                   <th class="topmenu" align="center" valign="middle" width="12%">Reason for Cancellation</th>
                   <th class="topmenu" align="center" valign="middle" width="5%">Rebooking Status</th>
                   <th class="topmenu" align="center" valign="middle" width="7%">New Appointment Date</th>
                   <th class="topmenu" align="center" valign="middle" width="7%">Updated Location</th>
                   
                   <th class="topmenu" align="center" valign="middle" width="5%">Contact Status</th>
                   <th class="topmenu" align="center" valign="middle" width="5%">Next Follow-up Date</th>
                   <th class="topmenu" align="center" valign="middle" width="5%">Contact Attempts</th>
                   <th class="topmenu" align="center" valign="middle" width="5%">Reason Not Rebooked</th>
                   <th class="topmenu" align="center" valign="middle" width="5%">Escalation Required</th>
                   
         		   <th class="topmenu" align="center" valign="middle" width="10%">Notes</th>
                   <th class="topmenu" align="center" valign="middle" width="5%">Action</th>   
            </tr>
        </thead>
    <tbody>

  {{assign var=countn value= $total}}
 {{foreach from=$list key="key" item="item"}}

    <tr bgcolor="#FFFFFF">


        <td>{{$item.cp_id}}</td>
        <td><strong>{{$item.bcust_fname}} {{$item.bcust_lname}}</strong><br />{{$item.cp_project_name}}</td>  
        <td>{{$item.cp_app_name}}</td>
        
        <td>{{$item.cp_app_date}}<br />{{$item.cp_app_time}}</td>
        <td>{{$item.cp_location}}</td>
        <td>{{$item.cp_reason_cancel}}</td>  
        <td>
        <form name ="recmet2" method="post" action="">
          <select name="rebooking[{{$item.cp_id}}]" onChange="this.form.submit();"/>
                <option value="-1" >Select </option>
                <option value="1" {{if $item.cp_rebooking  eq 1}} selected="selected" {{/if}}>Yes </option>
                <option value="0" {{if $item.cp_rebooking  eq 0}} selected="selected" {{/if}}>No </option> 
                <option value="2" {{if $item.cp_rebooking  eq 2}} selected="selected" {{/if}}>Lost </option>
                <option value="3" {{if $item.cp_rebooking  eq 3}} selected="selected" {{/if}}>On Hold </option>      
          </select>
        </form>
        
        {{if $item.cp_rebooking eq 1}} {{$item.cp_rebooking_date}}<br />{{$item.cp_rebooking_user}} {{/if}}
        </td>
        
        
        <td>{{$item.cp_new_date}}<br />{{$item.cp_new_time}} </td> 
        
        <td>{{$item.cp_updated_location}}</td>
        
        <td> 
          <form name ="recmet3" method="post" action="">
          <select name="contact_status[{{$item.cp_id}}]" onChange="this.form.submit();"/>
                <option value="" >Select </option>
                <option value="OPEN"  {{if $item.cp_contact_status  eq 'OPEN'}}  selected="selected" {{/if}}>OPEN</option>
                <option value="CLOSE" {{if $item.cp_contact_status  eq 'CLOSE'}} selected="selected" {{/if}}>CLOSE</option> 
                 
          </select>
          </form>
        
          {{$item.cp_contact_status_dt}}<br />{{$item.cp_contact_status_usr}}
         		<script>
                        
					function update_status(id,value)
					{
						
						 $.ajax({
									   type: "GET",
									   url: "{{$BASE_URL}}cancelled_par_report.update_status/cp_id/"+id+"/value/"+value,
										   success: function(result){
									   }
								});
					
					}
                        
                </script>  
        </td>
        
        <td>
        			<input type="text" name="nexdate[{{$item.cp_id}}]" class="w16em dateformat-d-ds-m-ds-Y"
						id="demo_{{$item.cp_id}}" value="{{$item.cp_next_fdate}}"
						onfocus="update_next_date({{$item.cp_id}}, this.value);" style="width:70px;" />
		
       			 <div id="nextd{{$item.cp_id}}">
						{{if $item.cp_next_fdate_dt}}
						{{$item.cp_next_fdate_dt}}<br/>{{$item.cp_next_fdate_usr}}
						{{/if}}
					</div>

					<script>
						function update_next_date(id, value) {
							var nextd = "#nextd"+id;
							$.ajax({
								type: "GET",
								url: "{{$BASE_URL}}cancelled_par_report.update_next_date/cp_id/" + id + "/value/" + value,
								success: function (result) {
									$(nextd).html(result);
								}
							});

						}

					</script>

        </td>
        
        <td> 
              <form name ="recmet3" method="post" action="">
              <select name="att[{{$item.cp_id}}]" onChange="update_attempt({{$item.cp_id}},this.value)"/>
                    <option value="" >Select </option>
                    <option value="1" {{if $item.cp_contact_att  eq 1}} selected="selected" {{/if}}>1</option>
                    <option value="2" {{if $item.cp_contact_att  eq 2}} selected="selected" {{/if}}>2</option> 
                    <option value="3" {{if $item.cp_contact_att  eq 3}} selected="selected" {{/if}}>3</option>
                    <option value="4" {{if $item.cp_contact_att  eq 4}} selected="selected" {{/if}}>4</option> 
                    <option value="5" {{if $item.cp_contact_att  eq 5}} selected="selected" {{/if}}>5</option> 
              </select>
              </form>
              
               		<div id="attempt{{$item.cp_id}}">
						{{if $item.cp_contact_att_dt}}
						{{$item.cp_contact_att_dt}}<br/>{{$item.cp_contact_att_usr}}
						{{/if}}
					</div>
        
         		<script>
                        
					function update_attempt(id,value)
					{
						
						var attempt = "#attempt"+id;
						
						 $.ajax({
									   type: "GET",
									   url: "{{$BASE_URL}}cancelled_par_report.update_attempt/cp_id/"+id+"/value/"+value,
										   success: function(result){
											   $(attempt).html(result);
									   }
								});
					
					}
                        
                </script>  
        
        </td>

        
        <td> <a href="{{$BASE_URL}}cancelled_par_report.view_notes/cp_id/{{$item.cp_id}}" class="various">Notes</a> </td>
        
        <td>
        		<form name="recmet3" method="post" action="">
                    <input type="hidden" name="escalation[{{$item.cp_id}}]" value="0" />
                    <label class="switch">
                        <input class="switch-input" type="checkbox" name="escalation[{{$item.cp_id}}]" value="1"
                            onclick="this.form.submit();" {{if $item.cp_escalation_required eq 1 }} checked="checked" {{/if}}>
                        <span class="switch-label" data-on="Yes" data-off="No"></span>
                        <span class="switch-handle"></span> <br />
                    </label>
				</form>
           
           {{if $item.cp_escalation_required eq 1}}{{$item.cp_esc_req_dt}}<br />   {{$item.cp_esc_req_usr}} {{/if}}  
                
         </td>    
        
        <td>{{$item.cp_notes}}</td> 
        
        <td> <a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" class="various" title="Edit"> 
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
             <a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete">
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>&nbsp;&nbsp
             
        </td>
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