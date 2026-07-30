<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
{{include file=$jdata}}
{{include file=$tiny_basic}}		
<h3 class="page-title">{{$title}}</h3>
<style>
.set { font-size:10px !important; 
       width:25px !important; display:inline-block; 
       padding-top:1px !important;
       padding-bottom: 1px !important;
       padding-left:1px !important;
       height:25px !important; }
       
       
#fancybox-wrap {z-index:9999999;} 
</style>

<script language="javascript">

function add_procedure()
{
	var viewurl = "{{$BASE_URL}}design_pricing_update_report.view_procedure"+ "/random/" + Math.random();	

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


<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">

     <div style="float:left; text-align:left;">
    &nbsp; &nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> <br />
    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Search:</strong>&nbsp;&nbsp;</span>
    <input type="text" name="{{$TABLE}}[keyword]" value="{{$keyword}}" style="width:300px;"/>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <input type="submit" value="Search" name="search"  />&nbsp;
    <input type="submit" value="Clear Search" name="clear"  />&nbsp;
    </div>
    <div style="float:right;">
    <input type="submit" value="Show Hidden" name="unhide"  />
    </div>
 </form>

<div id="">
    <table id="list-table" class="nav-back" width="100%" >
        <thead>
            <tr>
                <th class="topmenu" align="center" valign="middle" width="2%">Id</th>   
                <th class="topmenu" align="center" valign="middle" width="4%">Design Number</th> 
        	<th class="topmenu" align="center" valign="middle" width="3%">Active</th>
                <th class="topmenu" align="center" valign="middle" width="3%">Web Link</th>
                <th class="topmenu" align="center" valign="middle" width="5%">Current Site</th>
                <th class="topmenu" align="center" valign="middle" width="3%">Current Build</th>
             
                <th class="topmenu" align="center" valign="middle" width="5%">Current Planning</th>
                <th class="topmenu" align="center" valign="middle" width="5%">Current Total</th>
                <th class="topmenu" align="center" valign="middle" width="5%">Link to Audit</th>
                <th class="topmenu" align="center" valign="middle" width="5%">New Build</th>
                <th class="topmenu" align="center" valign="middle" width="2%">Difference</th>
        	<th class="topmenu" align="center" valign="middle" width="5%">Stage 1 Price</th>
                <th class="topmenu" align="center" valign="middle" width="5%">Stage 1 Total Price</th>
                <th class="topmenu" align="center" valign="middle" width="5%">Price Update</th>
                <!--<th class="topmenu" align="center" valign="middle" width="5%">Hide</th>-->
                <th class="topmenu" align="center" valign="middle" width="2%">Link</th>   
            </tr>
        </thead>
<tbody>
 {{foreach from=$list key="key" item="item"}}
 <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">

    <td>{{counter}}</td>
    <td>{{$item.di_design_number}}</td> 
  
     
     <td>
      <form name ="recmet3" method="post" action="">
     	<input type="hidden" name="online[{{$item.di_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="online[{{$item.di_id}}]" value="1"  onclick="this.form.submit();" {{if $item.di_online eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form> 
       {{if $item.di_online eq 1 }} {{$item.di_online_date}} {{/if}} 
     </td>
     
      <td>{{if $item.di_cgfb_design_link}}<a href = '{{$item.di_cgfb_design_link}}' target="_blank">Link</a>{{/if}} </td>
     
         <td>
    <form name ="recmet" method="post" action="">
     $ <input type="text" name="current_site[{{$item.di_id}}]"  value="{{$item.di_current_site}}" style="width:90px" onkeyup = "update_current_site({{$item.di_id}},this.value)"  /> 
     </form> 
     
    <div id="cs{{$item.di_id}}">{{if $item.di_current_site}}{{$item.di_current_site_date}}{{/if}}</div>
     <script>
       
         function update_current_site(id,value)
		{
		var tana11 = "#cs"+id;
		
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}design_pricing_update_report.update_current_site/di_id/"+id+"/value/"+value,
				   success: function(result){
					 $(tana11).html(result);  
					  
			   }
			 });
		}
	
       </script>
    
    </td>
     
     
    <td>
    <form name ="recmet" method="post" action="">
     $ <input type="text" name="current_build[{{$item.di_id}}]"  value="{{$item.di_current_build}}" id="cb{{$item.di_id}}" style="width:90px" onkeyup = "update_current_build({{$item.di_id}},this.value)"  /> 
     </form> 
     
   <div id="gh{{$item.di_id}}">{{if $item.di_current_build}} {{$item.di_curr_build_date}} <br /> {{$item.di_curr_build_user}}{{/if}}</div>
     <script>
       
         function update_current_build(id,value)
		{
			
	        var cb = "#cb"+id;	
		var nb = "#nb"+id;	
		var diff = "#diff"+id;
		var  t =($(nb).val() * 1) - ($(cb).val() * 1) ;
		$(diff).val(t);
		
		
		var tana10 = "#gh"+id;
		
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}design_pricing_update_report.update_current_build/di_id/"+id+"/value/"+value,
				   success: function(result){
					 $(tana10).html(result);  
					  
			   }
			 });
		}
	
       </script>
             
    </td>
    


    <td>
    <form name ="recmet" method="post" action="">
     $ <input type="text" name="current_plan[{{$item.di_id}}]"  value="{{$item.di_current_planning}}" style="width:90px" onkeyup = "update_current_planning({{$item.di_id}},this.value)"  /> 
     </form> 
     
    <div id="cp{{$item.di_id}}">{{if $item.di_current_planning}}{{$item.di_curr_plann_date}}{{/if}}</div>
     <script>
       
         function update_current_planning(id,value)
		{
		var tana12 = "#cp"+id;
		
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}design_pricing_update_report.update_current_planning/di_id/"+id+"/value/"+value,
				   success: function(result){
					 $(tana12).html(result);  
					  
			   }
			 });
		}
	
       </script>
    </td>
    <td>
     <form name ="recmet" method="post" action="">
     $ <input type="text" name="current_total[{{$item.di_id}}]"  value="{{$item.di_current_total}}" style="width:90px" onkeyup = "update_current_total({{$item.di_id}},this.value)"  /> 
     </form> 
     
    <div id="ct{{$item.di_id}}">{{if $item.di_current_total}}{{$item.di_current_total_date}}{{/if}}</div>
     <script>
       
         function update_current_total(id,value)
		{
		var tana13 = "#ct"+id;
		
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}design_pricing_update_report.update_current_total/di_id/"+id+"/value/"+value,
				   success: function(result){
					 $(tana13).html(result);  
					  
			   }
			 });
		}
	
       </script>
    </td>
   
    <td>
     {{if $item.di_pricing_audit_link}}
        <a href="{{$BASE_URL}}design_pricing_update_report.audit_link/di_id/{{$item.di_id}}" class="various">Edit Link</a>
        <br /> <a href="{{$item.di_pricing_audit_link}}" target="_blank">View Link </a> 
        {{else}}
        <a href="{{$BASE_URL}}design_pricing_update_report.audit_link/di_id/{{$item.di_id}}" class="various">Add Link</a>
        {{/if}}
    </td>
    
    <td>
     <form name ="recmet" method="post" action="">
     $ <input type="text" name="new_build[{{$item.di_id}}]"  value="{{$item.di_new_build}}" id="nb{{$item.di_id}}" style="width:90px" onkeyup = "update_new_build({{$item.di_id}},this.value)"  /> 
     </form> 
     
    <div id="nb{{$item.di_id}}">{{if $item.di_new_build}}{{$item.di_new_build_date}}{{/if}}</div>
     <script>
       
         function update_new_build(id,value)
		{
			
		 var cb = "#cb"+id;	
		var nb = "#nb"+id;	
		var diff = "#diff"+id;
		var  t =($(nb).val() * 1) - ($(cb).val() * 1) ;
		$(diff).val(t);
			
		var tana14 = "#nb"+id;
		
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}design_pricing_update_report.update_new_build/di_id/"+id+"/value/"+value,
				   success: function(result){
					 $(tana14).html(result);  
					  
			   }
			 });
		}
	
       </script>
    </td> 
    
    <td>
     $<input type="text" name="difference[{{$item.di_id}}]" id="diff{{$item.di_id}}" value="{{$item.difference}}" style="width:80px"/>
    </td>
      

    <td> 
     <form name ="recmet" method="post" action="">
     $ <input type="text" name="stage1[{{$item.di_id}}]"  value="{{$item.di_stage1_price}}" style="width:90px" onkeyup = "update_stage1_price({{$item.di_id}},this.value)"  /> 
     </form> 
     
    <div id="st{{$item.di_id}}">{{if $item.di_stage1_price}}{{$item.di_stage1_price_date}}<br />{{$item.di_stage1_price_user}}{{/if}}</div>
     <script>
       
         function update_stage1_price(id,value)
		{
		var tana15 = "#st"+id;
		
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}design_pricing_update_report.update_stage1_price/di_id/"+id+"/value/"+value,
				   success: function(result){
					 $(tana15).html(result);  
					  
			   }
			 });
		}
	
       </script>
    </td>    
     
      <td> 
     <form name ="recmet" method="post" action="">
     $ <input type="text" name="stage1[{{$item.di_id}}]"  value="{{$item.di_stage1_tot_price}}" style="width:90px" onkeyup = "update_stage1_tot_price({{$item.di_id}},this.value)"  /> 
     </form> 
     
    <div id="stp{{$item.di_id}}">{{if $item.di_stage1_tot_price}}{{$item.di_stage1_tot_price_date}}<br />{{$item.di_stage1_tot_price_user}}{{/if}}</div>
     <script>
       
         function update_stage1_tot_price(id,value)
		{
		var tana16 = "#stp"+id;
		
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}design_pricing_update_report.update_stage1_tot_price/di_id/"+id+"/value/"+value,
				   success: function(result){
					 $(tana16).html(result);  
					  
			   }
			 });
		}
	
       </script>
    </td>    
     
          
    <td>
     <select name="inbooklet[{{$item.di_id}}]" Onchange = "update_price_update({{$item.di_id}},this.value)" >
       <option value=" ">Please Select</option>
       <option value="Yes" {{if $item.di_price_update eq 'Yes'}} selected="selected" {{/if}}> Yes </option>
       <option value="No" {{if $item.di_price_update eq 'No'}} selected="selected" {{/if}}> No </option>
      </select>
    <div id="pu{{$item.di_id}}">{{if $item.di_price_update}}{{$item.di_price_update_user}}{{/if}}</div>
     <script>
	   
        function update_price_update(id,value)
		{
		var tana16 = "#pu"+id;
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}design_pricing_update_report.update_price_update/di_id/"+id+"/value/"+value,
				   success: function(result){
					   $(tana16).html(result);
			   }
			 });
		
		}
	
       </script>
    
     </td>
    <!-- <td>
      <form name ="recmet3" method="post" action="">
     	<input type="hidden" name="hide[{{$item.di_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="hide[{{$item.di_id}}]" value="1"  onclick="this.form.submit();" {{if $item.di_pricing_hide eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form> 
      
     </td>-->
    
    
    <td><a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" title="Edit" >
    <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/>
    </a>
   <!-- &nbsp;&nbsp;<a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>
 -->   
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