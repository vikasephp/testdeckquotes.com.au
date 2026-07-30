<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

<script>
	!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
<script>
 function submit_form() { document.send_form.submit(); }
</script>

<script language="javascript">
function add_section()
{
	var viewurl = "{{$BASE_URL}}documentCheckListAdmin.view_sections"+ "/random/" + Math.random();	

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


<h3 class="page-title">{{$title}}</h3>
<div id="">
  <div align="left">
    <div style="font-weight:bold; color:#FF6600;">{{$msg}}</div>
  </div>
  <table id="list-table" class="nav-back" width="100%">
    <form action="" name="search" method="post">
    <thead>
    <tr bgcolor="#FFFFFF"><th>Select Type</th>
        <td colspan="2"><select name="data[admin_doc_type]" onchange="submit();" >
                	<option value="0">-- Select All --</option>
                 	{{foreach from=$project_type item=item key=key}}
					<option value="{{$item.pt_id}}" {{if $detail.admin_doc_type == $item.pt_id}} selected="selected" {{/if}}>{{$item.pt_name}}</option>
                     {{/foreach}} 
                </select>
        </td>
        <td colspan="3">        
        <input type="submit" value="Sort By Order" name="sortorder"  />
        <input type="submit" value="Sort By Section and Document Click" name="sortsecdoc"  />
        </td>
        <td> <input type="button" name="section_panel" value="Edit Section" onclick="javascript:add_section();" /></td>
        <td colspan="2"><input type="submit" name="dockclick" value="Update Documentclick" /> </td>
        </tr>
      <tr>
       <th class="topmenu" align="center" valign="middle" width="4%">Sr. No.</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Unique Id</th>
        <th class="topmenu" align="center" valign="middle" width="40%">Name</th>
        <th class="topmenu" align="center" valign="middle" width="25%">Section</th>

        <th class="topmenu" align="center" valign="middle" width="6%">Status</th>
        <th class="topmenu" align="center" valign="middle" width="6%">Order</th>
        <th class="topmenu" align="center" valign="middle" width="6%">Order On DocumentClick</th>
         <th class="topmenu" align="center" valign="middle" width="8%">DocumentClick</th>
       <th class="topmenu" align="center" valign="middle" width="8%">Construction Calendar</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Action</th>
      </tr>
    </thead>
   
    <tbody>
    {{foreach from=$doc item="item" key="key"}}
    <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
    <td>{{counter}}</td>
      <td>{{$item.admin_doc_id}}</td>
      <td>{{$item.admin_doc_name}}</td>
      <td>{{$item.section}}
 <!--     {{if $item.admin_dc_section eq 1}}Important Documents {{/if}}
          {{if $item.admin_dc_section eq 2}}Customer Approved Agreements{{/if}} 
          {{if $item.admin_dc_section eq 3}}Planning Approval Documents{{/if}} 
          {{if $item.admin_dc_section eq 4}}Approved Quotes and Orders{{/if}} 
      	  {{if $item.admin_dc_section eq 5}}Inspections{{/if}}
          {{if $item.admin_dc_section eq 6}}Certificates{{/if}}   	
          {{if $item.admin_dc_section eq 7}}Additional Documents{{/if}} -->
      </td>
    <!--  <td>m1{{if !empty($item.admin_doc_manual)}}<a href="{{$BASE_URL}}{{$FILE_PATH}}files/document_check_list_files/{{$item.admin_doc_manual}}" target="_blank">View Document</a>{{/if}}</td>
      <td>m2{{$item.pt_name}}</td>-->
      <td>{{if $item.admin_doc_status==1}} Active {{else}} Inactive {{/if}}</td>
      <td>{{$item.admin_doc_order}}</td>
      <td>{{$item.admin_order_on_dc}}</td>
      <td> 
      
      <input type="hidden" name="doc_click[{{$item.admin_doc_id}}]" value="0" />
  	   <label class="switch">
       <input class="switch-input" type="checkbox"  name="doc_click[{{$item.admin_doc_id}}]"  {{if $item.admin_documentclick eq 1 }} checked="checked" {{/if}}/>
         	<span class="switch-label" data-on="Yes" data-off="No"></span> 
        	<span class="switch-handle"></span> <br />
       </label>
      </td>
      <td>
      <input type="hidden" name="cons_calendar[{{$item.admin_doc_id}}]" value="0" />
  	   <label class="switch">
       <input class="switch-input" type="checkbox"  name="cons_calendar[{{$item.admin_doc_id}}]" {{if $item.admin_cons_calendar eq 1}} checked="checked" {{/if}}  onclick="update_cons_calendar({{$item.admin_doc_id}},this.checked)"/>
       <script>
	   
		function update_cons_calendar(id,value)
		{
		
		var val = 0;
		if(value==true) { val = 1; } 
		if(value==false) { val = 2; } 
		
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}documentCheckListAdmin.update_cons_calendar/admin_doc_id/"+id+"/value/"+val,
				   success: function(result){
			   }
			 });
		}
	</script>
       
         	<span class="switch-label" data-on="Yes" data-off="No"></span> 
        	<span class="switch-handle"></span> <br />
       </label>
      </td>
      
      <td><a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.admin_doc_id}}"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;<a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.admin_doc_id}}" onclick="javascript:if(!confirm('Are you sure you want to delete the doc?')) return false;"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a> </td>
    </tr>
    {{/foreach}}
    </tbody>
     </form>
  </table>
</div>