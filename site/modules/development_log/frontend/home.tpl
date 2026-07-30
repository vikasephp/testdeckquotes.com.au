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



.slidecontainer {
  width: 225px;
}

.slider {
  -webkit-appearance: none;
  width: 100%;
  height: 5px;
  background: #06F ;
  outline: none;
  opacity: 0.7;
  -webkit-transition: .2s;
  transition: opacity .2s;
}

.slider:hover {
  opacity: 1;
}

.slider::-webkit-slider-thumb {
  -webkit-appearance: none;
  appearance: none;
  width: 5px;
  height: 25px;
  background: #F00 ;
  cursor: pointer;
}

.slider::-moz-range-thumb {
  width: 15px;
  height: 15px;
  background: #F00;
  cursor: pointer;
}

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
	var viewurl = "{{$BASE_URL}}development_log.view_procedure"+ "/random/" + Math.random();	

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
	var viewurl = "{{$BASE_URL}}development_log.view_type"+ "/random/" + Math.random();	

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


<div style="float:left; margin-left:3px; text-align:left;">
<form name="filt" action="{{$BASE_URL}}{{$XFA.home}}" method="post">    
</div>

<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
<div style="float:left;">
&nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> 
&nbsp;<strong>Active {{$data.total}}</strong>
</div>
<div style="float:right;"> 
<input type="submit" value="Print" name="print"  />
<input type="submit" name="hidden" value ="Show Hidden" />
<input type="button" name="type_options" value="Type Options" onclick="javascript:add_type();" /> 
<input type="button" name="Add New " value="Add New" onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.detail}}');" />
</div>
</form>

<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
                   <th class="topmenu" align="center" valign="middle" width="3%">Priority</th>  
                   <th class="topmenu" align="center" valign="middle" width="20%">What</th> 
                   <th class="topmenu" align="center" valign="middle" width="5%">Links To Specs</th> 
                   <th class="topmenu" align="center" valign="middle" width="5%">Completed</th> 
                   <th class="topmenu" align="center" valign="middle" width="15%">Progress</th>
                   <th class="topmenu" align="center" valign="middle" width="10%">Type</th>
                   <th class="topmenu" align="center" valign="middle" width="5%">Estimate Hours</th>
                   <th class="topmenu" align="center" valign="middle" width="5%">Hours So For</th>
                   <th class="topmenu" align="center" valign="middle" width="5%">Q/A Testing</th>
                   <th class="topmenu" align="center" valign="middle" width="5%">Developer Comment</th>
                   <th class="topmenu" align="center" valign="middle" width="5%">Date To Review</th>
                   <th class="topmenu" align="center" valign="middle" width="5%">Hide From Report</th>
                   <th class="topmenu" align="center" valign="middle" width="5%">Action</th>   
            </tr>
        </thead>
    <tbody>

  {{assign var=countn value= $total}}
 {{foreach from=$list key="key" item="item"}}

    <tr bgcolor="#FFFFFF">

        <td>
        <input type="text" name="de_order" value="{{$item.de_order}}" onkeyup="update_order({{$item.de_id}},this.value)" style="width:30px;" />
       <script>
        function update_order(id,value)
		{
		 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}development_log.update_order/de_id/"+id+"/value/"+value,
						   success: function(result){
					   }
					 });
		
		}
	   </script>	
        </td>
        <td>{{$item.de_what}}</td> 
        <td>{{if $item.de_link_to_spec}}<a href ="{{$item.de_link_to_spec}}" target="_blank">Link</a>{{/if}}</td> 
        <td>
        
        <select name="complete" onchange="update_completed({{$item.de_id}},this.value)" >
                <option value="0">Please Select </option>
                <option value="1" {{if $item.de_completed eq 1}} selected="selected" {{/if}}>Active</option>
                <option value="2" {{if $item.de_completed eq 2}} selected="selected" {{/if}}>Not Started</option>
                <option value="3" {{if $item.de_completed eq 3}} selected="selected" {{/if}}>On Hold</option>
                <option value="4" {{if $item.de_completed eq 4}} selected="selected" {{/if}}>Complete</option>
        </select>
        <script type="text/javascript">
	
			function update_completed(id,value)
			{
		    	 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}development_log.update_completed/de_id/"+id+"/value/"+value,
						   success: function(result){
					   }
					 });
			}
		</script>
        

        </td>
       
        <td> 
      
   <div class="slidecontainer">
  <input type="range" min="0" max="100" value="{{$item.de_percentage}}" class="slider" id="myRange_{{$countn}}" Onchange = "update({{$item.de_id}},this.value)" >
   <p>%: <span id="demo_{{$item.de_id}}"></span></p>
  </div>
   </td>
<script>
	var slider = document.getElementById("myRange_{{$countn}}");
	var output{{$item.de_id}} = document.getElementById("demo_{{$item.de_id}}");
	output{{$item.de_id}}.innerHTML = slider.value;
	
	slider.oninput = function() {
	  output{{$item.de_id}}.innerHTML = this.value;
	}
	
		
		function update(id,value)
		{
	
		 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}development_log.update_per/de_id/"+id+"/value/"+value,
						   success: function(result){
					   }
					 });
		}
		
</script>
       
       
       
        <td>
        <select name="type" onchange="update_type({{$item.de_id}},this.value)" >
                <option value="">Please Select </option>
                {{foreach from = $typeData key="key3" item="item3"}}
                <option value="{{$item3.dlt_id}}" {{if $item3.dlt_id eq $item.de_type}} selected="selected" {{/if}}>{{$item3.dlt_option}}</option>
                {{/foreach}}
        </select>
        <script type="text/javascript">
	
	function update_type(id,value)
		{
	
		 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}development_log.update_type/de_id/"+id+"/value/"+value,
						   success: function(result){
					   }
					 });
		
		}
	</script>
        
        </td>
        
        <td>
        <input type="text" name="de_total_hours" value="{{$item.de_total_hours}}" onkeyup="update_hours({{$item.de_id}},this.value)" style="width:30px;" />
        <script>
        function update_hours(id,value)
		{
		 //alert(id);
		 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}development_log.update_hours/de_id/"+id+"/value/"+value,
						   success: function(result){
					   }
					 });
		
		}
	</script>
        </td>
        
         <td>
        <input type="text" name="de_hours_sofor" value="{{$item.de_hours_sofor}}" onkeyup="update_hours_sofor({{$item.de_id}},this.value)" style="width:30px;" />
        <script>
        function update_hours_sofor(id,value)
		{
		 //alert(id);
		 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}development_log.update_hours_sofor/de_id/"+id+"/value/"+value,
						   success: function(result){
					   }
					 });
		
		}
	</script>
        </td>
        
        <td>{{if $item.de_qa_testing}}
         <!--<a href="https://accessbucketnew.s3.amazonaws.com/files/development_log/{{$item.de_qa_testing}}" target="_blank">Download</a>-->
         <a href="/development_log.download_content?file_name={{$item.de_qa_testing}}&module_name=development_log.home" target="_blank"/>Download</a> 
           
         {{/if}}
        </td>
        <td>{{if $item.de_dev_comment}}
        <a href="{{$BASE_URL}}development_log.dev_comment/de_id/{{$item.de_id}}" class="various" style="color: #0C6;">View Comment</a></td>
         {{else}}
          <a href="{{$BASE_URL}}development_log.dev_comment/de_id/{{$item.de_id}}" class="various">Add Comment</a></td>
         {{/if}}
         
        <td> 
        <input type="text" name="review[{{$item.de_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo10_{{$item.de_id}}" value="{{$item.de_date_review}}" onfocus ="update_review({{$item.de_id}}, this.value);"  />
       
       <script>
	   
				
		function update_review(id,value)
		{
			
			$.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}development_log.update_review/de_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
					
		}
		
	  </script>
        
        </td> 
        <td>
         <form name ="recmet3" method="post" action="">
     	<input type="hidden" name="hide[{{$item.de_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="hide[{{$item.de_id}}]" value="1"  onclick="this.form.submit();" {{if $item.de_hide eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form>  
         
         </td>
        
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