{{include file=$jdata}}
{{include file=$tiny_basic}}		
<h3 class="page-title">{{$title}}</h3>

<style>
.set2 { font-size:10px !important; 
       width:60px !important; display:inline-block; 
	  padding-top:1px !important;
	  padding-bottom: 1px !important;
	  padding-left:1px !important;
	  height:25px !important; 
	  margin-top:7px;}
#fancybox-wrap {z-index:9999999;} 
	  
</style>

<script language="javascript">

function proj_management()
{
	var viewurl = "{{$BASE_URL}}warranty_log.proj_management"+ "/random/" + Math.random();	

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
	var viewurl = "{{$BASE_URL}}trade_responsibility.view_procedure"+ "/random/" + Math.random();	

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


<table  width="100%"><tr><td>

<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">

<div style="float:left;">
 &nbsp;&nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> 
</div>


<div style="float:right; text-align:right;"> 

<!--<input type="button" name="priority" value="Edit Priority" onclick="javascript:add_priority();" /> <br />

<strong> Select Priority : </strong> 
<select name="search_by_priority"  Onchange = "update_priority({{$item.wa_id}},this.value)">
                <option value="">Please Select </option>
                {{foreach from = $prdetail key="key4" item="item4"}}
                <option value="{{$item4.pr_id}}" {{if $item4.pr_id eq $pr}} selected="selected" {{/if}}>{{$item4.pr_priority}}</option>
                {{/foreach}}
</select>
<input type="submit" name="filter_priority" value = "Filter By Priority" /> 

<input type="submit" name="sort_proj" value ="Sort By Project" />
<input type="submit" name="sort_date" value ="Sort By Date" />
<!--<input type="submit" name="sort_priority" value ="Sort By Priority" />
<input type="button" name="Add New" value="Task List" onclick="javascript:add_task();" /> 
<input type="submit" name="openclose" value ="Open and Closed Logs" />

<input type="button" name="Add New " value="Add New" onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.detail}}');" />-->
</div>
</form>
</td></tr></table>

<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
                   <th class="topmenu" align="center" valign="middle" width="3%">Warrany Log No.</th>  
                   <th class="topmenu" align="center" valign="middle" width="10%">Project</th> 
                   <th class="topmenu" align="center" valign="middle" width="12%">Contact Info</th> 
          	       <th class="topmenu" align="center" valign="middle" width="18%">Problem</th> 
                   <th class="topmenu" align="center" valign="middle" width="9%">Problem Photo</th>
                   <th class="topmenu" align="center" valign="middle" width="9%">Video Files</th>  
                   <th class="topmenu" align="center" valign="middle" width="20%">Notes</th> 
                   <th class="topmenu" align="center" valign="middle" width="7%">Date Inspected On site</th> 
  		           <th class="topmenu" align="center" valign="middle" width="10%">Trades</th>  
                   <th class="topmenu" align="center" valign="middle" width="4%">Status</th> 
                   <th class="topmenu" align="center" valign="middle" width="10%">Who</th>
                   <th class="topmenu" align="center" valign="middle" width="10%">Accepted Responsibility</th>
                   <th class="topmenu" align="center" valign="middle" width="10%">Value</th>
                   <th class="topmenu" align="center" valign="middle" width="10%">Who will do it</th>
                   <th class="topmenu" align="center" valign="middle" width="10%">Credit Note</th>
                   
                   <th class="topmenu" align="center" valign="middle" width="9%">Action</th>   
            </tr>
        </thead>
    <tbody>

 {{foreach from=$list key="key" item="item"}}

    <tr bgcolor="#FFFFFF">

        <td>{{$item.wa_id}}</td>
        <td>{{$item.wa_project}}</td> 
        <td>{{$item.bcust_fname}}&nbsp;{{$item.bcust_lname}}<br />{{$item.bcust_misc_moble}}</td> 

        <td>{{$item.wa_problem|stripslashes}}</td>
        <td>
        {{if $item.wa_image_1}}
        <div style="text-align:center;"> 
        <!--Photo 1 :  <a href="https://deckquote.s3.amazonaws.com/files/warranty_log/{{$item.wa_image_1}}" target="_blank">Download</a>-->
        Photo 1 :  <a href="/trade_responsibility.download_content?file_name={{$item.wa_image_1}}&module_name=trade_responsibility.home" target="_blank">Download</a>
        </div>
        {{/if}}
        
        {{if $item.wa_image_2}}
        <div style="text-align:center;"> 
       <!-- Photo 2 :  <a href="https://deckquote.s3.amazonaws.com/files/warranty_log/{{$item.wa_image_2}}" target="_blank">Download</a>-->
        Photo 2 :  <a href="/trade_responsibility.download_content?file_name={{$item.wa_image_2}}&module_name=trade_responsibility.home" target="_blank">Download</a>
       
        </div>
        {{/if}}
        
        {{if $item.wa_image_3}}
        <div style="text-align:center;"> 
       <!-- Photo 3 :  <a href="https://deckquote.s3.amazonaws.com/files/warranty_log/{{$item.wa_image_3}}" target="_blank">Download</a>-->
        Photo 3 :  <a href="/trade_responsibility.download_content?file_name={{$item.wa_image_3}}&module_name=trade_responsibility.home" target="_blank">Download</a>
        
        </div>
        {{/if}}
        
        {{if $item.wa_image_4}}
        <div style="text-align:center;"> 
      <!--  Photo 4 :  <a href="https://deckquote.s3.amazonaws.com/files/warranty_log/{{$item.wa_image_4}}" target="_blank">Download</a>-->
        Photo 4 :  <a href="/trade_responsibility.download_content?file_name={{$item.wa_image_4}}&module_name=trade_responsibility.home" target="_blank">Download</a>
        
        </div>
        {{/if}}
        
        {{if $item.wa_image_5}}
        <div style="text-align:center;"> 
    <!--    Photo 5 :  <a href="https://deckquote.s3.amazonaws.com/files/warranty_log/{{$item.wa_image_5}}" target="_blank">Download</a>-->
        Photo 5 :  <a href="/trade_responsibility.download_content?file_name={{$item.wa_image_5}}&module_name=trade_responsibility.home" target="_blank">Download</a>
       
        </div>
        {{/if}}
        
         </td>
         
         <td> 
          {{if $item.wa_video}}
         <!--   <a href="https://deckquote.s3.amazonaws.com/files/warranty_log/{{$item.wa_video}}" target="_blank">Download</a>-->
           <a href="/trade_responsibility.download_content?file_name={{$item.wa_video}}&module_name=trade_responsibility.home" target="_blank">Download</a 
            
          {{/if}}
         ></td>
         
         <td> {{$item.wa_notes}}</td>
         
         <td>{{$item.wa_date_inspected}} </td>
    
        <td>
        
        {{$item.wa_trades}}</td>
     
        <td> {{$item.wa_status}}</td>
        <td> {{$item.wa_who}} 
        <!--<input type="text" name="{{$TABLE}}[wa_who]" value="{{$item.wa_who}}"   onkeyup="update_who({{$item.wa_id}},this.value)" style="width:150px;">
        <script>
	   
		function update_who(id,value)
		{
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}trade_responsibility.update_who/wa_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	</script>-->
        
        </td>

        
         <td>  <input type="text" name="{{$TABLE}}[sa_tr_accepted_res]" value="{{$item.sa_tr_accepted_res}}"   onkeyup="update_ar({{$item.sa_id}},this.value)" style="width:150px;">
        <script>
	   
		function update_ar(id,value)
		{
			
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}trade_responsibility.update_ar/sa_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	</script>
        
        </td>

        
         <td>  <input type="text" name="{{$TABLE}}[sa_tr_value]" value="{{$item.sa_tr_value}}"   onkeyup="update_value({{$item.sa_id}},this.value)" style="width:110px;">
        <script>
	   
		function update_value(id,value)
		{
			
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}trade_responsibility.update_value/sa_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	</script>
        
        </td>
        
        
        <td>  <input type="text" name="{{$TABLE}}[sa_tr_who_will]" value="{{$item.sa_tr_who_will}}"   onkeyup="update_who_will({{$item.sa_id}},this.value)" style="width:150px;">
        <script>
	   
		function update_who_will(id,value)
		{
			
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}trade_responsibility.update_who_will/sa_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	</script>
        
        </td>
        
        
        <td> 
          {{if $item.wa_credit_note}}
            <a href="https://deckquote.s3.amazonaws.com/files/warranty_log/{{$item.wa_credit_note}}" target="_blank">Download</a>
          {{/if}}
         </td> 
        
        
        
        
        
        
        
        <td> <a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" class="various" title="Edit"> 
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
             <a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete">
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>&nbsp;&nbsp
             <a href="{{$BASE_URL}}{{$XFA.replay}}/{{$ID}}/{{$item.$ID}}" class="various" title="Replay">
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/sub.png"/></a>
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