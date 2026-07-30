<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

{{include file=$jdata}}
{{include file=$tiny_basic}}		
<h3 class="page-title">{{$title}}</h3>
{{if $msg}} <h3 style="font-size:18px; color:#639; padding-bottom:15px;"> {{$msg}} </h3> {{/if}}


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
				'width': '90%',
				'height': '85%',
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
		
		
function add_status_nr()
{
	var viewurl = "{{$BASE_URL}}da_builder.view_status_nr"+ "/random/" + Math.random();	

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


<div style="float:left; margin-left:10px; margin-bottom:10px; text-align:left;font-size:14px;">
<strong>Address</strong> : {{$rt_project_address}}<br>
<strong>Report </strong> : {{$rb_report_name}}<br />
&nbsp; &nbsp;<input type="button" name="status_nr" value="Status Admin" onclick="javascript:add_status_nr();" /> 
</div>

<form name="detail" method="post" action="" enctype="multipart/form-data">
<input type="hidden" name="element[id]" value="{{$pid}}" />
<input type="hidden" name="element[proj]" value="{{$project}}" >

<br>

<table id="list-table" class="nav-back" width="100%">
<tbody id="myTable">
<tr>
<th style="width:4%">Order</th>
<th style="width:6%">Name</th>
<th style="width:20%">Specification</th>
<th style="width:6%">Status</th>
<th style="width:10%">Criteria</th>
<th style="width:15%">Statement</th>
<th style="width:5%">Compliance</th>
<th style="width:5%">Populate Text</th>
<th style="width:5%">Rules Explained</th>
<th style="width:5%">Exclude From Print</th>
<th style="width:5%">Q/A</th>
</tr>

{{foreach from=$data key="key4" item="item4"}}
<tr>
<td>{{$item4.mr_order}}</td>
<td>{{$item4.mr_name}}</td>
<td>{{$item4.mr_specification}}</td>
<td>

<select name="" onchange="update_status({{$item4.mr_id}},this.value)" id="st{{$item4.mr_id}}" style="background:{{$item4.color_code}}" >
<option value="0"style="background: #FFF">Please Select</option>
{{foreach from=$statisdata key="key" item="item"}}
<option value="{{$item.ns_option}}" {{if $item.ns_option eq $item4.mr_status}} selected="selected"{{/if}} style="background:{{$item.ns_color}}">{{$item.ns_option}}</option>
{{/foreach}}
</select>

<script>
function update_status(id,value)
		{
	     var st = '#st'+id;
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}da_builder.update_status_nr/mr_id/"+id+"/value/"+value,
				   success: function(result){
					   $(st).css("background",result);
			   }
			 });
		}
</script>
		
</td>
<td>{{$item4.mr_criteria}}</td>
<td>

<table  width="440" id="none-table22"><tr><td>
     <form name="detail2" method="post" action="" enctype="multipart/form-data">
      <textarea name="statement[mr_statement]" rows="4" cols="70" id="{{$item4.mr_id}}" style="overflow-y: scroll;"  class="tinymce">{{$item4.mr_statement}}</textarea>       
       
        <script>
	   
	    $(document).ready(function(){
                     $("#{{$item4.mr_id}}").keyup(function(){
                           update_statement({{$item4.mr_id}},this.value);
                     });
             });
	     
		   
	   function update_statement(id,value)
		{
	  
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}da_builder.update_statement/mr_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
	
       </script>
       <input type="hidden" name="statement[mr_id]" value="{{$item4.mr_id}}" />
      <input type="submit" value="Save" name="st_save" />
   </form>   
  </td></tr></table>
</td>
<td style="text-align:center;">
<strong>{{if $item4.mr_status eq 'Not Compliant'}} X {{elseif $item4.mr_status eq 'Compliant'}} &radic; {{elseif $item4.mr_status eq 'NA'}} N/A {{else}} !{{/if}}</strong>
</td>

<td><a href="{{$BASE_URL}}da_builder.view_populate_text/mr_id/{{$item4.mr_id}}/rb_id/{{$rb_id}}/mr_admin_id/{{$item4.mr_admin_id}}" class="various">Link</a></td>
<td><a href="{{$BASE_URL}}da_builder.home_rules/mr_id/{{$item4.mr_id}}" target="_blank">Link</a></td>
<td>
<input type="hidden" name="exclude[{{$item4.mr_id}}]" value="0" />
  	 <label class="switch">
     <input class="switch-input" type="checkbox"  name="exclude[{{$item4.mr_id}}][yesno]" {{if $item4.mr_exclude_print eq 1}} checked="checked" {{/if}}   onclick="update_exclude({{$item4.mr_id}},this.checked)"  />
     <span class="switch-label" data-on="Yes" data-off="No"></span> 
     <span class="switch-handle"></span> <br />
     </label>
 <script>
	   
		function update_exclude(id,value)
		{
		
		var val = 0;
		if(value==true) { val = 1; } 
		if(value==false) { val = 2; } 
		
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}da_builder.update_exclude/mr_id/"+id+"/value/"+val,
				   success: function(result){
			   }
			 });
		}
	</script>

</td>
<td> 

<input type="hidden" name="element_data[{{$item4.mr_id}}]" value="0" />
  	 <label class="switch">
     <input class="switch-input" type="checkbox"  name="element_data[{{$item4.mr_id}}][yesno]" {{if $item4.mr_qa eq 1}} checked="checked" {{/if}} onclick="update_same({{$item4.mr_id}},this.checked)"  />
     <span class="switch-label" data-on="Yes" data-off="No"></span> 
     <span class="switch-handle"></span> <br />
     </label>
     
     </td>

   <script>
	   
		function update_same(id,value)
		{
		
		var val = 0;
		if(value==true) { val = 1; } 
		if(value==false) { val = 2; } 
		
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}da_builder.update_same/mr_id/"+id+"/value/"+val,
				   success: function(result){
			   }
			 });
		}
	</script>

</td>


</tr>
{{/foreach}}
</tbody>
</table>
<!--<input type="submit" name="generate" value="Submit" />-->
</form>


