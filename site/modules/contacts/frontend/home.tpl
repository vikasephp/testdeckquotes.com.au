<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

{{include file=$jdata}}
{{include file=$tiny_basic}}		
<h3 class="page-title">Contacts</h3>

<script type="application/javascript">
function show_notes(csid)
{
	var viewurl = "{{$BASE_URL}}contacts.show-notes-content"+ "/cs_id/" + csid;	
	
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

function add_procedure()
{
	var viewurl = "{{$BASE_URL}}contacts.view_procedure"+ "/random/" + Math.random();	

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

function view_position()
{
	var viewurl = "{{$BASE_URL}}contacts.view_position"+ "/random/" + Math.random();	

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
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" />&nbsp;&nbsp;<input type="button" name="position_panel" value="Position Admin" onclick="javascript:view_position();" /> <br />
<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Search:</strong>&nbsp;&nbsp;</span>
<input type="text" name="keyword" value="{{$keyword}}" style="width:400px;" placeholder="Search for Cagegory, Company, Position, Name, Surname, Mobile, Address"/>
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" value="Search" name="search"  />
 </div>


<div style="float:right; margin-right:20px;"> 
 &nbsp;
 
 <select name="partners_training" >
     <option value="">Select Partner Training</option>
     <option value="Trained" {{if $pt eq 'Trained'}} selected="selected" {{/if}}>Trained</option>
     <option value="Not Trained" {{if $pt eq 'Not Trained'}} selected="selected" {{/if}}>Not Trained</option>
     <option value="Training In Progress" {{if $pt eq 'Training In Progress'}} selected="selected" {{/if}}>Training In Progress</option>
 
 </select>
  <input type="submit" value="Filter" name="pt_filter"  />    
<select name="co_resp_status" >
     <option value="">Select Responsible Status</option>
     {{foreach from = $bsdata key="key" item="item2"}}
     <option value="{{$item2.st_name}}" {{if $item2.st_name eq $costatus}} selected="selected" {{/if}}>{{$item2.st_name}}</option>
     {{/foreach}}
    </select>
 <input type="submit" value="Filter" name="rstatus"  />
 <input type="button" value="Export To XLS" onclick="document.location.href='{{$BASE_URL}}{{$XFA.home}}/export/1'" /> 
<input type="button" name="Add New " value="Add New" onclick="javascript:add_new('{{$BASE_URL}}contacts.detail');" />
</div>
</form>

<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
                   <th class="topmenu" align="center" valign="middle" width="7%">Contact ID</th> 
                   <th class="topmenu" align="center" valign="middle" width="7%">Category</th> 
                   <th class="topmenu" align="center" valign="middle" width="7%">Company</th>   
                   <th class="topmenu" align="center" valign="middle" width="7%">Positions</th>   
            	   <th class="topmenu" align="center" valign="middle" width="7%">First Name</th>   
                   <th class="topmenu" align="center" valign="middle" width="7%">Surname</th> 
                   <th class="topmenu" align="center" valign="middle" width="6%">Landline</th>  
                   <th class="topmenu" align="center" valign="middle" width="6%">Mobile</th> 
                <!--   <th class="topmenu" align="center" valign="middle" width="5%">Emergency</th>-->
                   <th class="topmenu" align="center" valign="middle" width="6%">Primary Email</th> 
                   <th class="topmenu" align="center" valign="middle" width="6%">Last Update</th> 
                   <!--<th class="topmenu" align="center" valign="middle" width="5%">Secondary Email</th>  -->
      <!--             <th class="topmenu" align="center" valign="middle" width="5%">Notes</th> 
                   <th class="topmenu" align="center" valign="middle" width="5%">Cal. Link</th> --> 
                   <th class="topmenu" align="center" valign="middle" width="5%">Partner Training</th>  
<!--                   <th class="topmenu" align="center" valign="middle" width="5%">Address</th>  
                   <th class="topmenu" align="center" valign="middle" width="5%">Responsible Status</th>-->
                   <th class="topmenu" align="center" valign="middle" width="5%">Other Info</th>
                   <th class="topmenu" align="center" valign="middle" width="5%">Active</th>
                   <th class="topmenu" align="center" valign="middle" width="6%">Action</th>   
            </tr>
        </thead>
<tbody>
 {{foreach from=$list key="key" item="item"}}

     <tr bgcolor="#FFFFFF">

    <td>{{$item.cs_id}}</td>
    <td>{{$item.co_categry}}</td>	
    <td><a href = "{{$BASE_URL}}companies.detail/co_id/{{$item.co_id}}" class="various">{{$item.co_company_name}}</a></td>
    <td>
		<select name="cs_partner_training"  Onchange = "update_contacts_position({{$item.cs_id}}, this.value)">
			<option value="">Please Select Position</option>
			{{foreach from=$contacts_position key="keycpos" item="itemcpos"}}
			<option value="{{$itemcpos.cp_id}}" {{if $item.cs_position_code eq $itemcpos.cp_id}} selected="selected"{{/if}} >{{$itemcpos.cp_name}}</option>
			{{/foreach}}
		</select>
		<script>	   
			function update_contacts_position(id,value)
			{
				$.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}contacts.update_position/cs_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
			}
		</script>
	</td> 
    <td>{{$item.cs_first_name}} </td>
    <td>{{$item.cs_surname}}</td>
    <td>{{$item.cs_landline}}</td>
    <td>{{$item.cs_mobile}}</td>
  <!--  <td>{{$item.cs_emergency}}</td>-->
    <td>{{$item.cs_primary_email}}</td> 
    <td>{{$item.cs_last_update_date}}<br />{{$item.cs_last_update_user}}</td> 
    <!--<td>{{$item.cs_secondary_email}}</td> -->
   <!-- <td><input type="button" name="View Notes" value="View  Notes" onclick="javascript:show_notes({{$item.cs_id}});" style="width:90px; height:20px; font-size:11px; line-height:17px !important; padding:0px !important" /></td> 
    <td>{{if $item.cs_calendar_link}} <a href="{{$item.cs_calendar_link}}" target="_blank">Link </a>{{/if}}</td> 
 -->   <td>
    
    <select name="cs_partner_training"  Onchange = "update_partners_training({{$item.cs_id}},this.value)">
     	<option value="">Please Select</option>
     	<option value="Trained" {{if $item.cs_partner_training eq 'Trained'}} selected="selected" {{/if}}>Trained</option>
        <option value="Not Trained" {{if $item.cs_partner_training eq 'Not Trained'}} selected="selected" {{/if}}>Not Trained</option>
        <option value="Training In Progress" {{if $item.cs_partner_training eq 'Training In Progress'}} selected="selected" {{/if}}>Training In Progress</option>
    </select> 
    
     <script>
	   
		function update_partners_training(id,value)
		{
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}contacts.update_partners_training/cs_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	</script>
    
    </td>
<!--    <td>{{$item.cs_address}}</td> 
    <td>{{$item.co_resp_status}}</td> -->
    <td><a href="{{$BASE_URL}}contacts.other_info/cs_id/{{$item.cs_id}}" class="various">Show</a></td>
    
     <td><form name ="recmet32" method="post" action="">
     	<input type="hidden" name="active[{{$item.cs_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="active[{{$item.cs_id}}]" value="1"  onclick="this.form.submit();" {{if $item.co_active eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form>
    
    </td>

    
    
    <td style="color:#000;"><a href="{{$BASE_URL}}contacts.detail/cs_id/{{$item.cs_id}}" class="various" title="Edit">
    <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
    <a href="{{$BASE_URL}}contacts.delete_contact/cs_id/{{$item.cs_id}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete">
    <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>&nbsp;&nbsp
   
    </td>
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