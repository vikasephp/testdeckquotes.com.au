<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />


<script>
	!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />



{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<script type="application/javascript">


function add_new(url)
 {
//var viewurl = "{{$BASE_URL}}designer_tracker.detail"+ "/random/" + Math.random();	
var viewurl = url;
 $(document).ready(function () {
        $.fancybox({
				'width': '99%',
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


<div align="center" style="min-height:350px; z-index:9999999;">
    <h3 class="page-title"><br />Site Progress Report Type</h3>    
   
   
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<div style="float:right; margin-right:10px; background: #09F; color:#FFF !important; padding:6px; margin-bottom:5px;"> 
<a href="{{$BASE_URL}}site_progress_report.add_task/tn_id/{{$tn_id}}" class="various" title="Edit" style="color:#FFF; text-decoration:none; font-size:14px;"> Add New Report Type </a>
</div>


<table id="list-table" width="99%">
<tr> 
	<th width="5%">SrNo</th>
	<th width="20%">Report Type</th>
	<th width="15%">Category</th>
	<th width="15%">Position</th>
	<th width="10%">Status</th>
	<th width="15%">Linked Event</th>
	<th width="10%">Linked Event Notes</th>
	<th width="10%">Action</th>
	</tr>
		{{assign var="sr_no" value=1}}
       {{foreach from=$typedata key="key" item="item"}}
       <tr>
        <td>{{$sr_no}}<!--{{$item.tn_id}}--></td>
        <td>{{$item.tn_name}}</td>
		<td>
			<select name="tn_category" onchange="update_tn_category({{$item.tn_id}}, this.value)">
			<option value="0">Please Select Category</option>
			{{foreach from=$data_companies key="key_cat" item="item_cat"}}
			<option value="{{$item_cat.co_id}}" {{if $item.tn_category eq $item_cat.co_id}} selected="selected" {{/if}} >{{$item_cat.co_categry}}</option>
			{{/foreach}}
			</select>
			<script>
			function update_tn_category(id, value){
				$.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}site_progress_report.update_sp_category/tn_id/"+id+"/value/"+value,
						success: function(result){	
					}
				});
			}
			</script>
		</td> 
		<td>
			<select name="tn_position" onchange="update_tn_position({{$item.tn_id}}, this.value)">
			<option value="0">Please Select Position</option>
			{{foreach from=$data_con_positions key="key_pos" item="item_pos"}}
			<option value="{{$item_pos.cp_id}}" {{if $item.tn_position eq $item_pos.cp_id}} selected="selected" {{/if}} >{{$item_pos.cp_name}}</option>
			{{/foreach}}
			</select>
			<script>
			function update_tn_position(id, value){
				$.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}site_progress_report.update_sp_position/tn_id/"+id+"/value/"+value,
						success: function(result){	
					}
				});
			}
			</script>
		</td>
		<td>
			<select name="tn_status" onchange="update_tn_status({{$item.tn_id}}, this.value)">
				<option value="">Please Select Status</option>
				<option value="Active" {{if $item.tn_status eq 'Active' }}selected="selected"{{/if}}>Active</option>
				<option value="Inactive" {{if $item.tn_status eq 'Inactive' }}selected="selected"{{/if}}>Inactive</option>
				<option value="In Progress" {{if $item.tn_status eq 'In Progress' }}selected="selected"{{/if}}>In Progress</option>
			</select>
			<script>
			function update_tn_status(id, value){
				$.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}site_progress_report.update_tn_status/tn_id/"+id+"/value/"+value,
						success: function(result){	
					}
				});
			}
			</script>
		</td>
		<td>
			<textarea name="linked_event_text[{{$item.tn_id}}]" rows="3" oninput="update_linked_event_text({{$item.tn_id}}, this.value)">{{$item.tn_linked_event}}</textarea>
			<script>
			function update_linked_event_text(id, value) {
				$.ajax({
					type: 'POST',
					url: "{{$BASE_URL}}site_progress_report.update_tn_linkedevent_text/tn_id/" + id + "/value/" + value,
					success: function(response) {
						console.log("Saved successfully:", response);
					},
					error: function(xhr) {
						console.error("Error saving:", xhr.responseText);
					}
				});
			}
			</script>
		</td>
		<td>
			<a href="{{$BASE_URL}}site_progress_report.view_task_notes/tn_id/{{$item.tn_id}}" class="various" title="Notes">
				<img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/add_notes.png"/>
			</a>
		</td>
        <td> <a href="{{$BASE_URL}}site_progress_report.add_task/tn_id/{{$item.tn_id}}" class="various" title="Edit"> 
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
             
         <a href="{{$BASE_URL}}site_progress_report.delete_task/tn_id/{{$item.tn_id}}" onclick="javascript:if(!confirm('Are you sure want to delete this Task?')) return false;" title="Delete">     <img style="height: 16px;; width:16px" src="{{$BASE_URL}}css/admin/images/deletecross.png"/></a>
         </td>    
       </tr> 
	   {{assign var="sr_no" value=$sr_no+1}}
      {{/foreach}}

</table><br /><br />
<input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
</form>
    
    <script type="text/javascript">
		function closepop()
		{
		setTimeout('parent.close_win();', 500);
		}
	</script>
    
	<script type="text/javascript" language="javascript" >
        var frmvalidator  = new Validator("detail");
			frmvalidator.EnableMsgsTogether();
			frmvalidator.addValidation("{{$TABLE}}[al_item]","req", "Please specify item.");
			
    </script>
</div>

