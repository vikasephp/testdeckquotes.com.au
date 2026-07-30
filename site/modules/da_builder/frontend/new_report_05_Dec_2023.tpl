<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

{{include file=$jdata}}
{{include file=$tiny_basic}}		
<h3 class="page-title">{{$title}}</h3>
{{if $msg}} <h3 style="font-size:18px; color:#639; padding-bottom:15px;"> {{$msg}} </h3> {{/if}}

<!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>-->



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
</script>		


<form name="detail" method="post" action="" enctype="multipart/form-data">
<input type="hidden" name="element[id]" value="{{$pid}}" />
<input type="hidden" name="element[proj]" value="{{$project}}" >

<br>

<table id="list-table" class="nav-back" width="100%">
<tbody id="myTable">
<tr>
<th style="width:4%">Order</th>
<th style="width:20%">Speficication</th>
<th style="width:7%">Status</th>
<th style="width:10%">Criteria</th>
<th style="width:15%">Statement</th>
<th style="width:5%">Populate Text</th>
<th style="width:5%">Rules Explained</th>
<th style="width:5%">User</th>
<th style="width:5%">Q/A</th>
</tr>

{{foreach from=$data key="key4" item="item4"}}
<tr>
<td>{{$item4.mr_order}}</td>
<td>{{$item4.mr_specification}}</td>
<td>{{$item4.mr_status}}</td>
<td>{{$item4.mr_criteria}}</td>
<td>

 <!-- <textarea rows="4" cols="70" id="{{$item4.mr_id}}" style="overflow-y: scroll;">{{$item4.mr_statement}}</textarea>   -->  
    
      <textarea rows="4" cols="40" id="{{$item4.mr_id}}" style="overflow-y: scroll;">{{$item4.mr_statement}}</textarea>       
       
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
    

</td>
<td><a href="{{$BASE_URL}}da_builder.view_populate_text/mr_id/{{$item4.mr_id}}" class="various">Link</a></td>
<td><a href="{{$BASE_URL}}da_builder.home_rules/mr_id/{{$item4.mr_id}}" target="_blank">Link</a></td>
<td></td>
<td> 

<input type="hidden" name="element_data[{{$item4.mr_id}}]" value="0" />
  	 <label class="switch">
     <input class="switch-input" type="checkbox"  name="element_data[{{$item4.mr_id}}][yesno]" {{if $item4.mr_qa eq 1}} checked="checked" {{/if}}   onclick="update_same({{$item4.mr_id}},this.checked)"  />
     <span class="switch-label" data-on="Yes" data-off="No"></span> 
     <span class="switch-handle"></span> <br />
     </label></td>

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


