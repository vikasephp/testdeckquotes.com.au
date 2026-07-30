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
				'width': '98%',
				'height': '98%',
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
</script>

<script>

function close_win()
	{
	$.fancybox.close();
	window.location.reload();
	}

 function submit_form()
 {
 	document.send_form.submit();
 }
 
 
function add_type()
{
	
	var viewurl = "{{$BASE_URL}}project_planning_checklistAdmin.view_type"+ "/random/" + Math.random();	

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
 
 function add_ppt()
{
	
	var viewurl = "{{$BASE_URL}}project_planning_checklistAdmin.view_ppt"+ "/random/" + Math.random();	

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
	
	var viewurl = "{{$BASE_URL}}project_planning_checklistAdmin.view_procedure"+ "/random/" + Math.random();	

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

<h3 class="page-title">{{$title}}</h3>
<div id="">
    <div align="left">
    <div style="font-weight:bold; color:#FF6600;">{{$msg}}</div>
    </div>

<div style="text-align:left;">
 <input type="button" name="proce" value="Procedure Panel" onclick="javascript:add_procedure();" />
 <input type="button" name="type_admin" value="Type Admin" onclick="javascript:add_type();" />
 <input type="button" name="ppt_admin" value="Planning Project Type" onclick="javascript:add_ppt();" />
<!--<form name="ptype" method="post" action="">

<select name="ckecklisttype">
                <option value="0"> Show All </option>
                {{foreach from=$custom_dcl item=item key=key}}
                <option value="{{$key}}" {{if $clt == $key}} selected="selected" {{/if}}>{{$item}} </option>
                {{/foreach}}
            </select>
<input type="Submit" value="Show" name="psub" />
</form>-->
</div>
    <table id="list-table" class="nav-back" width="100%">

       <thead>
            <tr>
              <th class="topmenu" align="center" valign="middle" width="5%">Order</th>  
              <th class="topmenu" align="center" valign="middle" width="34%">Document/Plan</th>   
              <th class="topmenu" align="center" valign="middle" width="7%">Main Document Checklist Link </th>   
              <th class="topmenu" align="center" valign="middle" width="10%">Project Document Checklist </th>  
              <th class="topmenu" align="center" valign="middle" width="7%">Type</th>
              <th class="topmenu" align="center" valign="middle" width="7%">Mpd - Type</th>
              <th class="topmenu" align="center" valign="middle" width="8%">Required Option</th> 
              <th class="topmenu" align="center" valign="middle" width="10%">Link (DC UID)</th>
              <th class="topmenu" align="center" valign="middle" width="7%">Procedure</th> 
              <th class="topmenu" align="center" valign="middle" width="6%">Rule Link</th>     
              <th class="topmenu" align="center" valign="middle" width="8%">Action</th>   
          </tr>
        </thead>

        <tbody>

        {{foreach from=$doc item="item" key="key"}}

            <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">

             <td>{{$item.ppc_order}}</td>
             <td>{{$item.ppc_document}}</td>
             <td>{{if $item.ppc_md_checklist_link}} <a href="{{$item.ppc_md_checklist_link}}" target="_blank">Link</a>{{/if}}</td>
             <td>TBD</td>
             <td>{{$item.ppc_type}}</td>
             <td data-col="mpd_type">{{$item.ppc_mpd_type}}</td>
             <td><select name="reop" onChange="update_required({{$item.ppc_id}},this.value)">
             	  <option value="" {{if $item.ppc_required eq ''}} selected="selected" {{/if}}>Select</option>
                  <option value="DA" {{if $item.ppc_required eq 'DA'}} selected="selected" {{/if}}>DA </option>
                  <option value="BA" {{if $item.ppc_required eq 'BA'}} selected="selected" {{/if}}>BA </option>
                 </select>
                 
          <script>
			function update_required(id,value)
			{
					 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}project_planning_checklistAdmin.update_required/ppc_id/"+id+"/value/"+value,
						   success: function(result){
							
						}
						
					});
			}
	     </script>  
             </td>
             
             
             <td>{{$item.ppc_dc_uid}}</td>
             <td>{{if !empty($item.ppc_procedure)}}<a href="{{$item.ppc_procedure}}" target="_blank">View Link</a>{{/if}}</td>
             
			  <td><a href="{{$BASE_URL}}project_planning_checklistAdmin.add_rule/ppc_id/{{$item.ppc_id}}" class="various" >Rule Link</a></td>
			
             <td>
                    <a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.ppc_id}}"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;<a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.ppc_id}}" onclick="javascript:if(!confirm('Are you sure you want to delete the doc?')) return false;"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>
               </td>
            </tr>
        {{/foreach}}
        </tbody>
    </table>
</div>