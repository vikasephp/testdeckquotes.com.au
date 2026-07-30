<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/w3.css" />
{{include file=$jdata}}
{{include file=$tiny_basic}}		
<h3 class="page-title">{{$title}}</h3>

<style>
	   
.wrapper1, .wrapper2{width:100%; border: none 0px RED;
overflow-x: scroll; overflow-y:hidden; scrollbar-color: yellow blue;}
.wrapper1{height: 20px; }
.wrapper2{ }
.div1 {width:2050px; height: 20px; }
.div2 {width:2050px;  overflow: auto;}

.tableFixHead          { overflow-y: auto; height: 700px; }
.tableFixHead thead th { position: sticky; top: 0; text-align:left; }

table  { border-collapse: collapse; width: 100%; }
th     { z-index:9999; }
.topmenu {border:1px solid #FFF !important; }  
   
</style>

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
   <table id="doclist-table" class="nav-back" width="100%">
        <thead>
            <tr>
                   <th class="topmenu" align="center" valign="middle" width="7%"></th>  
                   <th class="topmenu" align="center" valign="middle" width="12%">Name</th>   
            	   <th class="topmenu" align="center" valign="middle" width="6%">Date</th>
                   <th class="topmenu" align="center" valign="middle" width="6%">Report</th>
                   <th class="topmenu" align="center" valign="middle" width="6%">Hour Per Week</th>
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

 {{foreach from=$list key="key" item="item"}}

    <tr bgcolor="#FFFFFF">

        <td>Support - {{counter}}</td>
        <td>{{$item.su_name}}</td> 
        <td>{{$item.su_date}}</td>
        <td>{{$item.su_report}}</td>
        <td>{{$item.su_hour_per_week}}</td>
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
