<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<script type="text/javascript" src="{{$BASE_URL}}js/default.js"></script>
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
				'width': '75%',
				'height': '75%',
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



function close_win()
	{
	$.fancybox.close();
	window.location.reload();
	}
</script>


<script type="text/javascript" > 
function addfeedback(bsn_id)
{
	var viewurl = "{{$BASE_URL}}presented_but_not_signed_report.addfeedback"+ "/bsn_id/" + bsn_id;	
	
	
 	$(document).ready(function () {

        $.fancybox({

				'width': '90%',
				'height': '85%',
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

<script type="text/javascript" > 
function add_new(url)
{
		
 	$(document).ready(function () {

        $.fancybox({

				'width': '90%',
				'height': '85%',
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
				 'href': url,
				 'scrolling': 'yes' 
        });
      });
}
</script>

<script type="text/javascript" > 
function viewfeedback(bsn_id)
{
	var viewurl = "{{$BASE_URL}}presented_but_not_signed_report.viewfeedback"+ "/bsn_id/" + bsn_id;	
	
	$(document).ready(function () {

        $.fancybox({

				'width': '90%',
				'height': '85%',
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


<script type="text/javascript">
$(function(){
    $(".wrapper1").scroll(function(){
        $(".wrapper2")
            .scrollLeft($(".wrapper1").scrollLeft());
    });
    $(".wrapper2").scroll(function(){
        $(".wrapper1")
            .scrollLeft($(".wrapper2").scrollLeft());
    });
});
</script>

<script type="application/javascript">
var expanded = false;
function showCheckboxes2() {
  var checkboxes = document.getElementById("checkboxes2");
  if (!expanded) {
    checkboxes.style.display = "block";
    expanded = true;
  } else {
    checkboxes.style.display = "none";
    expanded = false;
  }
}
</script>

<style>


.tableFixHead          { overflow-y: auto; height: auto; }
.tableFixHead thead th { position: sticky; top: 0; text-align:left; }

table  { border-collapse: collapse; width: 100%; }
th     { z-index:9999; }

.wrapper1, .wrapper2{width: 100%; border: none 0px RED;
overflow-x: scroll; overflow-y:hidden; scrollbar-color: yellow blue;}
.wrapper1{height: 20px; }
.wrapper2{ }
.div1 {width:2180px; height: 20px; }
.div2 {width:2180px;  overflow: auto;}  
.dtpic {
	width:65px !important;
	padding-top:1px !important;
	padding-bottom:1px !important;	
}

.set { font-size:10px !important; 
       width:25px !important; display:inline-block; 
	   padding-top:1px !important;
	   padding-bottom: 1px !important;
	   padding-left:1px !important;
	   height:25px !important; }



.slidecontainer {
  width: 125px;
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
  width: 15px;
  height: 25px;
  background: #F00 ;
  cursor: pointer;
}

.slider::-moz-range-thumb {
  width: 10px;
  height: 15px;
  background: #F00;
  cursor: pointer;
}

#fancybox-wrap {z-index:9999999;} 
</style>

<h3 class="page-title">{{$title}}</h3>
<br />


<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
<div style="float:left;">
<input type="button" name="add_task" value="Add New Task" onclick="javascript:add_new('{{$BASE_URL}}support_list.add_task');" />  &nbsp;
<input type="button" name="edit_cat" value="Edit Task" onclick="javascript:add_new('{{$BASE_URL}}support_list.edit_task');" />&nbsp;
</div>
<div style="float:right;"> 
<input type="button" name="Add New " value="Add New" onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.detail}}');" />
</div>
</form>


<div class="wrapper1">
    <div class="div1">
    </div>
</div>

<div class="wrapper2">
  <div class="div2 tableFixHead">


  <table id="doclist-table" class="nav-back tableFixHead" width="100%">
    <thead>
            <tr>
                   <th class="topmenu" align="center" valign="middle" width="7%"></th>  
                   <th class="topmenu" align="center" valign="middle" width="12%">Name</th>   
            	   <th class="topmenu" align="center" valign="middle" width="6%">Date</th>
                   <th class="topmenu" align="center" valign="middle" width="6%">Report</th>
                   <th class="topmenu" align="center" valign="middle" width="6%">Hour Per Week</th>
                   <th class="topmenu" align="center" valign="middle" width="10%">Capacity</th>
                   <th class="topmenu" align="center" valign="middle" width="14%">Primary Task</th> 
                   <th class="topmenu" align="center" valign="middle" width="14%">Secodary Tasks</th> 
                   <th class="topmenu" align="center" valign="middle" width="14%">Supplement Task</th> 
                    <th class="topmenu" align="center" valign="middle" width="14%">Supplement Task</th> 
                    <th class="topmenu" align="center" valign="middle" width="6%">Skype</th>
                    <th class="topmenu" align="center" valign="middle" width="8%">Main Email</th>
                   <th class="topmenu" align="center" valign="middle" width="5%">Action</th>   
            </tr>
        </thead>
    <tbody>
{{assign var=countn value= $total}}
 {{foreach from=$list key="key" item="item"}}

    <tr bgcolor="#FFFFFF">

        <td>Support - {{counter}}</td>
        <td>{{$item.su_name}}</td> 
        <td>{{$item.su_date}}</td>
        <td>
         <input type="text" name="report[{{$item.su_id}}]" value="{{$item.su_report}}" onkeyup = "update_report({{$item.su_id}},this.value)" style="width:150px;" title="{{$item.su_report}}"/>
       
         <script>
	   
	   function update_report(id,value)
		{
			
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}support_list.update_report/su_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
	
         </script>
        
        </td>
        <td>
        
         <input type="text" name="hour[{{$item.su_id}}]" value="{{$item.su_hour_per_week}}" onkeyup = "update_hour({{$item.su_id}},this.value)" style="width:50px;"/>
       
         <script>
	   
	   function update_hour(id,value)
		{
			
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}support_list.update_hour/su_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
	
         </script>
        
        </td>
        <td>
                 
        <div class="slidecontainer">
        <input type="range" min="1" max="100" value="{{$item.su_capicity}}" class="slider" id="myRange_{{$countn}}" Onchange = "update({{$item.su_id}},this.value)" >
        <p> <span id="demo_{{$item.su_id}}"></span></p>
        </div>

	<script>
        var slider = document.getElementById("myRange_{{$countn}}");
        var output{{$item.su_id}} = document.getElementById("demo_{{$item.su_id}}");
        output{{$item.su_id}}.innerHTML = slider.value;
        
        slider.oninput = function() {
          output{{$item.su_id}}.innerHTML = this.value;
        }
        
                
                function update(id,value)
                {
                 
                 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}support_list.update_rating/su_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
                
                }
                
                
                
        </script>
      
        
        
        </td>
        
        <td>
        <select name="primary" Onchange = "update_primary({{$item.su_id}},this.value)" >
         <option value="">Please Select </option>
         {{foreach from = $taskdetail key = "key1" item = "item1"}}
         <option value="{{$item1.st_task_name}}" {{if $item.su_primary_task eq $item1.st_task_name}} selected="selected" {{/if}}>{{$item1.st_task_name}}</option>
         {{/foreach}}
       </select>
       
       <script>
	   
             function update_primary(id,value)
		{
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}support_list.update_primary/su_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
	
       </script>
        
        </td>
        <td>
         <select name="secondary" Onchange = "update_secondary({{$item.su_id}},this.value)" >
         <option value="">Please Select </option>
         {{foreach from = $taskdetail key = "key2" item = "item2"}}
         <option value="{{$item2.st_task_name}}" {{if $item.su_secondary_task eq $item2.st_task_name}} selected="selected" {{/if}}>{{$item2.st_task_name}}</option>
        {{/foreach}}
          </select>
       
       <script>
	   
             function update_secondary(id,value)
		{
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}support_list.update_secondary/su_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
	
       </script>
        
        </td>
        <td>
        <select name="suppliment1" Onchange = "update_suppliment1({{$item.su_id}},this.value)" >
         <option value="" >Please Select </option>
          {{foreach from = $taskdetail key = "key3" item = "item3"}}
         <option value="{{$item3.st_task_name}}" {{if $item.su_supplement_task_1 eq $item3.st_task_name}} selected="selected" {{/if}}>{{$item3.st_task_name}}</option>
         {{/foreach}}
          </select>
       
       <script>
	   
             function update_suppliment1(id,value)
		{
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}support_list.update_suppliment1/su_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
	
       </script>
        
        
        </td>
        <td>
        <select name="suppliment2" Onchange = "update_suppliment2({{$item.su_id}},this.value)" >
         <option value="" >Please Select </option>
          {{foreach from = $taskdetail key = "key4" item = "item4"}}
         <option value="{{$item4.st_task_name}}" {{if $item.su_supplement_task_2 eq $item4.st_task_name}} selected="selected" {{/if}}>{{$item4.st_task_name}}</option>
         {{/foreach}}
          </select>
       
       <script>
	   
             function update_suppliment2(id,value)
		{
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}support_list.update_suppliment2/su_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
	
       </script>
        
        </td>
        <td>{{$item.su_skype}}</td>
        <td>{{$item.su_main_email}}</td>
    
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

</div>