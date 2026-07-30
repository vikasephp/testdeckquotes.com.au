<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />		
<h3 class="page-title">{{$title}}</h3>
<script type="text/javascript" src="{{$BASE_URL}}js/jquery-1.7.2.js"></script>

<script> 

		!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
	</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
<script type="text/javascript" >  

		$(document).ready(function() {
			$(".various").fancybox({
				'width': '90%',
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
$(document).ready(function() {
		$(".fancybox").fancybox();
	});
	
function add_new(URL)
 {
var viewurl = URL+ "/random/" + Math.random();	
 $(document).ready(function () {
        $.fancybox({
				'width': '90%',
				'height': '90%',
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

function open_url(type, data = '') {
	let viewurl = '';
	if(type == 'add_procedure') {	
		viewurl = "{{$BASE_URL}}mistake_log.view_procedure"+ "/random/" + Math.random();
	}
	else if(type == 'add_priority') {	
		viewurl = "{{$BASE_URL}}mistake_log.view_priority"+ "/random/" + Math.random();
	}
	else if(type == 'view_category') {
		viewurl = "{{$BASE_URL}}mistake_log.view_category"+ "/random/" + Math.random();	
	}
	else if(type == 'view_process_stage') {
		viewurl = "{{$BASE_URL}}mistake_log.view_process_stage"+ "/random/" + Math.random();
	}
	else if(type == 'view_repeat') {
		viewurl = "{{$BASE_URL}}mistake_log.view_repeat"+ "/random/" + Math.random();	
	}
	else if(type == 'view_stream') {
		viewurl = "{{$BASE_URL}}mistake_log.view_stream"+ "/random/" + Math.random();	
	}
	else if(type == 'view_status') {
		viewurl = "{{$BASE_URL}}mistake_log.view_status"+ "/random/" + Math.random();	
	}
	
	$(document).ready(function () {
		$.fancybox({
			'width': '90%',
			'height': '99%',
			'autoScale': false,
			'transitionIn': 'elastic',
			'transitionOut': 'elastic',
			'speedIn': 300,
			'speedOut': 300,
			'overlayShow': true,
			'overlayColor': '#000',
			'hideOnOverlayClick': false,
			'hideOnContentClick': false,
			'type': 'iframe',
			'href': viewurl,
			'scrolling': 'yes'
		});
	});
}

function close_win()
	{
	$.fancybox.close();
	window.location.href = window.location.href;
	}
</script>


<script type="text/javascript" >  

$(document).ready(function(){
	var maxLength = 200;
	$(".show-read-more").each(function(){
		var myStr = $(this).text();
		if($.trim(myStr).length > maxLength){
			var newStr = myStr.substring(0, maxLength);
			var removedStr = myStr.substring(maxLength, $.trim(myStr).length);
			$(this).empty().html(newStr);
			$(this).append( ' &nbsp; &nbsp;<a href="javascript:void(0);" class="read-more">Read More...</a>');
			$(this).append('<span class="more-text">' + removedStr + '</span>');
		} 
	});
	$(".read-more").click(function(){
		$(this).siblings(".more-text").contents().unwrap();
		$(this).remove();
	});
});
</script>

<style>
    .show-read-more .more-text{display: none; }
	
	.read-more {font-weight:bold;}
	.mistake_log_c {
		table-layout: fixed;
	}
	.mistake_log_c select, .mistake_log_c input, .mistake_log_c textarea {
		width: 100%;
		width: -webkit-fill-available;
	}
	.msdoclink {
		width: 75px;
		display: inline-block;
		text-align: center !important;
	}
</style>

<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
 <div style="float:left; text-align:left;">
    &nbsp; &nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:open_url('add_procedure');" /> 
    <input type="button" name="Add New" value="Priority Admin" onclick="javascript:open_url('add_priority');" /> 
	&nbsp;<input type="button" name="stream" value="Stream Admin" onclick="javascript:open_url('view_stream');" />
	&nbsp;<input type="button" name="stream" value="Status Admin" onclick="javascript:open_url('view_status');" />
	<!-- &nbsp;<input type="button" name="category" value="Category Admin" onclick="javascript:open_url('view_category');" /> 
	&nbsp;<input type="button" name="process" value="Process Stage Admin" onclick="javascript:open_url('view_process_stage');" /> 
	&nbsp;<input type="button" name="repeat" value="Repeat Admin" onclick="javascript:open_url('view_repeat');" /> -->
    <br />
    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Search:</strong>&nbsp;&nbsp;</span>
<input type="text" name="mistake[keyword]" value="{{$keyword}}" style="width:400px;" placeholder="Search for Mistake OR Person Created OR Priority OR Owner Or Date"/>
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" value="Search" name="search"  />
<input type="submit" value="Collapse All" name="collapse"  /> <br />

&nbsp; &nbsp;<strong> Filter By : </strong> 

        <select name="priority_filter"/>
        <option value="0">Please Select</option>
        {{foreach from=$prioritydata key="key1" item="item1"}}
        <option value="{{$item1.mp_id}}" {{if $item1.mp_id eq $item.ml_priority}} selected="selected" {{/if}}>{{$item1.mp_option}}</option>
        {{/foreach}}
        </select>
		&nbsp; <select name="stream_filter"/>
        <option value="0">Please Select</option>
        {{foreach from=$streamdata key="keyst1" item="itemst1"}}
		<option value="{{$itemst1.mls_id}}" {{if $itemst1.mls_id eq $item.ml_stream_option}} selected="selected" {{/if}}>{{$itemst1.mls_option}}</option>
		{{/foreach}}
        </select>
        &nbsp; &nbsp;<input type="submit" value="Filter" name="filter" /> 
        <input type="submit" value="Clear Filter" name="clearfilter" /> 
 </div>

<div style="float:right;text-align: left;"> 
<input type="submit" value="Show All" name="showall"  />
<input type="submit" value="Show Hidden" name="showhidden"  />
<input type="button" name="Add New " value="Add New" onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.detail}}');" />
<br/>
<input type="button" value="AI Run Report - TBD" name=""  />
</div>
</form>



<div id="">
    <table id="list-table" class="nav-back mistake_log_c">
        <thead>
            <tr>
				<th class="topmenu" align="center" valign="middle" width="3%">Id</th>  	            
				<th class="topmenu" align="center" valign="middle" width="21%">Mistake</th>
				<th class="topmenu" align="center" valign="middle" width="18%">Root Cause</th>				
				<th class="topmenu" align="center" valign="middle" width="20%">Solution</th>
				<th class="topmenu" align="center" valign="middle" width="14%">AI History Result</th>
				<th class="topmenu" align="center" valign="middle" width="18%">AI History Result</th>
				<th class="topmenu" align="center" valign="middle" width="18%">AI Root Cause Insight</th>
				<th class="topmenu" align="center" valign="middle" width="14%">Stream</th>
				<th class="topmenu" align="center" valign="middle" width="5%">Hours</th>
				<th class="topmenu" align="center" valign="middle" width="5%">Bonus</th>
				<!--<th class="topmenu" align="center" valign="middle" width="5%">Category</th>
				<th class="topmenu" align="center" valign="middle" width="5%">Process Stage</th>-->
				<th class="topmenu" align="center" valign="middle" width="7%">Person Created</th> 
				<!--<th class="topmenu" align="center" valign="middle" width="3%">Repeat</th>-->
				<!--<th class="topmenu" align="center" valign="middle" width="5%">Date</th>-->
				<!--<th class="topmenu" align="center" valign="middle" width="10%">Owner</th>-->
				<th class="topmenu" align="center" valign="middle" width="10%">Priority</th>  
				<th class="topmenu" align="center" valign="middle" width="9%">MS Teams<br/>Document</th>
				<!--<th class="topmenu" align="center" valign="middle" width="9%">Stream</th>-->
				<th class="topmenu" align="center" valign="middle" width="9%">Status</th>
				<!-- <th class="topmenu" align="center" valign="middle" width="5%">Comment</th>-->
				<th class="topmenu" align="center" valign="middle" width="8%">Hide</th> 
				<th class="topmenu" align="center" valign="middle" width="10%">Action</th>   
            </tr>
        </thead>
    <tbody>

 {{foreach from=$list key="key" item="item"}}

    <tr bgcolor="#FFFFFF">

		<td>{{$item.ml_id}}</td> 
        <td><div class="show-read-more">{{$item.ml_mistake}}</div></td>
		<td data-col="root_cause">
			<textarea name="mistake_log_root_cause[{{$item.ml_id}}]" rows="3" oninput="update_mistake_root_cause({{$item.ml_id}}, this.value)">{{$item.ml_root_cause}}</textarea>
			<script>
			function update_mistake_root_cause(id, value) {
				$.ajax({
					type: 'POST',
					url: "{{$BASE_URL}}mistake_log.update_mistake_root_cause/ml_id/" + id + "/value/" + value,
					success: function(response) {
						console.log("Saved successfully:", response);
						//window.location.reload();
					},
					error: function(xhr) {
						console.error("Error saving:", xhr.responseText);
					}
				});
			}
			</script>
		</td>
		<td data-col="solution">
			<textarea id="mistake_log_solution_{{$item.ml_id}}" name="mistake_log_solution[{{$item.ml_id}}]" rows="3" oninput="update_mistake_solution({{$item.ml_id}}, this.value)">{{$item.ml_solution}}</textarea>
			<script>
			function update_mistake_solution(id, value) {
				$.ajax({
					type: 'POST',
					url: "{{$BASE_URL}}mistake_log.update_mistake_solution/ml_id/" + id + "/value/" + value,
					success: function(response) {
						console.log("Saved successfully:", response);
						//window.location.reload();
					},
					error: function(xhr) {
						console.error("Error saving:", xhr.responseText);
					}
				});
			}
			</script>
		</td>
		<td data-col="ai_history_result">
			<input type="button" value="AI ANALYSE" name="" id="ai_history_result_{{$item.ml_id}}">
		</td>
		<td data-col="ai_history_result">
			<textarea id="history_result_{{$item.ml_id}}" name="mistake_log_ai_history_result[{{$item.ml_id}}]" rows="3" oninput="update_history_result({{$item.ml_id}}, this.value)">{{$item.ml_ai_history_result}}</textarea>
			<script>
			function update_history_result(id, value) {
				$.ajax({
					type: 'POST',
					url: "{{$BASE_URL}}mistake_log.update_history_result/ml_id/" + id,
					data: { value: value },
					success: function(response) {
						console.log("Saved successfully:", response);
						//window.location.reload();
					},
					error: function(xhr) {
						console.error("Error saving:", xhr.responseText);
					}
				});
			}
			</script>
		</td>
		<td data-col="ai_root_cause_insight">
			<textarea id="cause_insight_{{$item.ml_id}}" name="mistake_log_ai_root_cause_insight[{{$item.ml_id}}]" rows="3" oninput="update_cause_insight({{$item.ml_id}}, this.value)">{{$item.ml_ai_root_cause_insight}}</textarea>
			<script>
			function update_cause_insight(id, value) {
			console.log("ID:", id);
    console.log("Value:", value);
				$.ajax({
					type: 'POST',
					//url: "{{$BASE_URL}}mistake_log.update_cause_insight/ml_id/" + id + "/value/" + encodeURIComponent(value),
					url: "{{$BASE_URL}}mistake_log.update_cause_insight/ml_id/" + id,
					data: { value: value },
					success: function(response) {
						console.log("Saved successfully:", response);
						//window.location.reload();
					},
					error: function(xhr) {
						console.error("Error saving:", xhr.responseText);
					}
				});
			}
			</script>
		</td>
		<td data-col="stream">
			<select name="{{$TABLE}}[mistake_log_stream_option]" Onchange="update_stream_option({{$item.ml_id}},this.value)">
			<option value="-1">Please Select</option>
			{{foreach from=$streamdata key="keyst" item="itemst"}}
			<option value="{{$itemst.mls_id}}" {{if $itemst.mls_id eq $item.ml_stream_option}} selected="selected" {{/if}}>{{$itemst.mls_option}}</option>
			{{/foreach}}
			</select>
			
			{{$item.ml_stream_option_by}}<br/>
			{{$item.ml_stream_option_date}}
			
			<script>
			function update_stream_option(id,value)
			{
				$.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}mistake_log.update_stream_option/ml_id/"+id+"/value/"+value,
						   success: function(result){
						}
					});
			}
			</script>
		</td>
		<td data-col="hours">
			<input type="text" name="mistake_log_hours[{{$item.ml_id}}]" oninput="update_mistake_hours({{$item.ml_id}}, this.value)" value="{{$item.ml_hours}}" style="width: 100px;"/>
			<script>
			function update_mistake_hours(id, value) {
				$.ajax({
					type: 'POST',
					url: "{{$BASE_URL}}mistake_log.update_mistake_hours/ml_id/" + id + "/value/" + value,
					success: function(response) {
						console.log("Saved successfully:", response);
						//window.location.reload();
					},
					error: function(xhr) {
						console.error("Error saving:", xhr.responseText);
					}
				});
			}
			</script>
		</td>
		<td data-col="bonus">
			<input type="text" name="mistake_log_bonus[{{$item.ml_id}}]" oninput="update_mistake_bonus({{$item.ml_id}}, this.value)" value="{{$item.ml_bonus}}" style="width: 100px;"/>
			<script>
			function update_mistake_bonus(id, value) {
				$.ajax({
					type: 'POST',
					url: "{{$BASE_URL}}mistake_log.update_mistake_bonus/ml_id/" + id + "/value/" + value,
					success: function(response) {
						console.log("Saved successfully:", response);
						//window.location.reload();
					},
					error: function(xhr) {
						console.error("Error saving:", xhr.responseText);
					}
				});
			}
			</script>
		</td>
		<!--<td data-col="category">
			<select name="{{$TABLE}}[mistake_log_category]" Onchange="update_category({{$item.ml_id}},this.value)">
			<option value="-1">Please Select</option>
			{{foreach from=$categorydata key="keyc" item="itemc"}}
			<option value="{{$itemc.mlc_id}}" {{if $itemc.mlc_id eq $item.ml_category}} selected="selected" {{/if}}>{{$itemc.mlc_option}}</option>
			{{/foreach}}
			</select>
			
			<script>
			
			function update_category(id,value)
			{
				
				$.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}mistake_log.update_category/ml_id/"+id+"/value/"+value,
						   success: function(result){
							  
						}
					});
			}
			
			</script>
		</td>-->
		<!--<td data-col="processStage">
			<select name="{{$TABLE}}[mistake_log_process_stage]" Onchange="update_process_stage({{$item.ml_id}},this.value)">
			<option value="-1">Please Select</option>
			{{foreach from=$processstagedata key="keyps" item="itemps"}}
			<option value="{{$itemps.mlps_id}}" {{if $itemps.mlps_id eq $item.ml_process_stage}} selected="selected" {{/if}}>{{$itemps.mlps_option}}</option>
			{{/foreach}}
			</select>
			
			<script>
			
			function update_process_stage(id,value)
			{
				
				$.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}mistake_log.update_process_stage/ml_id/"+id+"/value/"+value,
						   success: function(result){
							  
						}
					});
			}
			
			</script>
		</td>-->
        <td>
			{{$item.ml_person_created}}
			<br/>{{$item.ml_date}}
		</td>
		<!--<td data-col="repeat">
			<select name="{{$TABLE}}[mistake_log_repeat]" Onchange="update_repeat({{$item.ml_id}},this.value)">
			<option value="-1">Please Select</option>
			{{foreach from=$repeatdata key="keyps" item="itemr"}}
			<option value="{{$itemr.mlr_id}}" {{if $itemr.mlr_id eq $item.ml_repeat}} selected="selected" {{/if}}>{{$itemr.mlr_option}}</option>
			{{/foreach}}
			</select>
			
			<script>
			
			function update_repeat(id,value)
			{
				
				$.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}mistake_log.update_repeat/ml_id/"+id+"/value/"+value,
						   success: function(result){
							  
						}
					});
			}
			
			</script>
		</td>-->
        <!--<td>{{$item.ml_date}}</td>-->
        <!--<td>{{$item.ml_owner}}</td>-->
        <td>
        <select name="{{$TABLE}}[ml_priority]"  Onchange = "update_priority({{$item.ml_id}},this.value)">
        <option value="-1">Please Select</option>
        {{foreach from=$prioritydata key="key1" item="item1"}}
        <option value="{{$item1.mp_id}}" {{if $item1.mp_id eq $item.ml_priority}} selected="selected" {{/if}}>{{$item1.mp_option}}</option>
        {{/foreach}}
        </select>
        
        <script>
		
		function update_priority(id,value)
		{
			
			$.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}mistake_log.update_priority/ml_id/"+id+"/value/"+value,
					   success: function(result){
						  
					}
				});
		}
		
	     </script>
        </td>
        <td>
        {{if $item.ml_link_1 }}<a href="{{$item.ml_link_1}}" class="msdoclink" target="_blank" title="{{$item.ml_link_1}}"/> MSTEAMS 1 </a><br />{{/if}}
        {{if $item.ml_link_2 }}<a href="{{$item.ml_link_2}}" class="msdoclink" target="_blank" title="{{$item.ml_link_2}}"/> MSTEAMS 2 </a><br />{{/if}}
        {{if $item.ml_link_3 }}<a href="{{$item.ml_link_3}}" class="msdoclink" target="_blank" title="{{$item.ml_link_3}}"/> MSTEAMS 3 </a>{{/if}}
        </td>
     <!--   <td>{{$item.ml_stream}}</td>-->
		{{assign var="bg_color" value=""}}
		{{foreach from=$statusdata item="itemst"}}
			{{if $itemst.mls_id eq $item.ml_status}}
				{{assign var="bg_color" value=$itemst.mls_color}}
			{{/if}}
		{{/foreach}}
        <td data-cell="status-bg" style="background-color: {{$bg_color}};color: black;">
			<!-- <form name ="recmet8" method="post" action="">
				<select name="status[{{$item.ml_id}}]"  Onchange = "this.form.submit();">
					<option value="">Please Select </option>
					<option value="Resolved" {{if $item.ml_status eq 'Resolved'}} selected="selected" {{/if}}>Resolved</option>
					<option value="Unresolved" {{if $item.ml_status eq 'Unresolved'}} selected="selected" {{/if}}>Unresolved</option>
					<option value="Actioned" {{if $item.ml_status eq 'Actioned'}} selected="selected" {{/if}}>Actioned</option>
					<option value="To be actioned" {{if $item.ml_status eq 'To be actioned'}} selected="selected" {{/if}}>To be actioned</option>
				</select>
			</form>  -->
			<select name="{{$TABLE}}[mistake_log_status]" Onchange="update_mistake_status({{$item.ml_id}},this.value, this)">
			<option value="-1">Please Select</option>
			{{foreach from=$statusdata key="keypst" item="itemst"}}
			<option value="{{$itemst.mls_id}}" data-color="{{$itemst.mls_color}}" {{if $itemst.mls_id eq $item.ml_status}} selected="selected" {{/if}}>{{$itemst.mls_option}}</option>
			{{/foreach}}
			</select>
			{{$item.ml_status_by}}<br/>
			{{$item.ml_status_date}}
			
			<script>
			function update_mistake_status(id,value,selectEl) {
					var selectedOption = selectEl.options[selectEl.selectedIndex];
					var color = selectedOption.getAttribute('data-color');
					selectEl.closest('td').style.backgroundColor = color;
	
					$.ajax({
						   type: "GET",
						   url: "{{$BASE_URL}}mistake_log.update_mistake_status/ml_id/"+id+"/value/"+value,
							   success: function(result){	  
							}
						});
				}
			</script>
        </td>
        
<!--        <td> <input type="text" name="comment" value="{{$item.ml_comment}}" onkeyup="update_comment({{$item.ml_id}},this.value)" />
         <script>
		
		function update_comment(id,value)
		{
			
			$.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}mistake_log.update_comment/ml_id/"+id+"/value/"+value,
					   success: function(result){
						  
					}
				});
		}
		
	     </script>
        
        </td>-->
		<td> 
        <form name ="recmet4" method="post" action="">
     	<input type="hidden" name="hide[{{$item.ml_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="hide[{{$item.ml_id}}]" value="1"  onclick="this.form.submit();" {{if $item.ml_hide eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form> 
              
        </td>

        <td> <a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" class="various" title="Edit"> 
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
             <a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete">
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>&nbsp;&nbsp
             <a href="{{$BASE_URL}}{{$XFA.replay}}/{{$ID}}/{{$item.$ID}}" class="various" title="Replay">
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/sub.png"/></a>&nbsp;&nbsp
             
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

<script type="text/javascript">
document.addEventListener('click', function (e) {
    if (e.target && e.target.id.startsWith('ai_history_result_')) {

        var button = e.target;
        var ml_id = button.id.replace('ai_history_result_', '');

        var mistakeTextbox = document.getElementById('mistake_log_solution_' + ml_id);
        var historyTextbox = document.getElementById('history_result_' + ml_id);
        var causeTextbox = document.getElementById('cause_insight_' + ml_id);

        if (!mistakeTextbox || !historyTextbox || !causeTextbox) {
            alert('Required fields not found.');
            return;
        }

        var mistakeLogText = mistakeTextbox.value.trim();
        if (!mistakeLogText) {
            alert('Please enter mistake log text first.');
            mistakeTextbox.focus();
            return;
        }

        button.disabled = true;
        button.value = 'Analyzing...';

        fetch('{{$BASE_URL}}mistake_log.ai_analyze', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({
                mistake_log: mistakeLogText,
                stream: 'Operations',
                date: new Date().toISOString().split('T')[0]
            })
        })
        .then(res => res.json())
        .then(data => {
            if (data.status === 'success') {
                historyTextbox.value = data.analysis_output;
                causeTextbox.value = data.root_cause_insight;
				
				//Update history and insight textbox after success
				update_history_result(ml_id, historyTextbox.value);
				update_cause_insight(ml_id, causeTextbox.value);
            } else {
                alert('AI Analysis failed:\n\n' + (data.message || JSON.stringify(data.raw_response)));
            }
        })
        .catch(err => {
            alert('Error calling AI service:\n\n' + err);
        })
        .finally(() => {
            button.disabled = false;
            button.value = 'AI Analyze';
        });
    }
});
</script>

