{{include file=$jdata}}
{{include file=$tiny_basic}}		
<h3 class="page-title">{{$title}}</h3>

<style>


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

#fancybox-wrap {z-index:9999999;}

.tableFixHead          { overflow-y: auto; height: 1200px; }
.tableFixHead thead th { position: sticky; top: 0; text-align:left; }
table  { border-collapse: collapse; width: 100%; }
th     { z-index:9999; }

</style>

<script language="javascript">

function add_procedure()
{
	var viewurl = "{{$BASE_URL}}work_in_progress_report.view_procedure"+ "/random/" + Math.random();	

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

function add_stage()
{
	var viewurl = "{{$BASE_URL}}work_in_progress_report.view_stage"+ "/random/" + Math.random();	

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

<table width="100%">
<tr> 
<td> </td>
<td style="border:1px solid #CCC; padding:8px; line-height:25px;"><strong>Total value completed including GST : ${{$tot_val_computed|number_format:2:".":","}} <br />
Total WIP COG including GST : ${{$tot_wip_cog|number_format:2:".":","}}</strong></td>
<td>  </td>
</tr>
<tr>
<td style="width:50%">
<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
&nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> 
&nbsp;<input type="button" name="inv_stage" value="Add Invoice Stage" onclick="javascript:add_stage();" /> 
 &nbsp; &nbsp;&nbsp; &nbsp;<input type="submit" value="Last Audited" name="last_audited" /> &nbsp; &nbsp; {{$last_audited}}
</td>
<td style="width:35%;text-align:right;">

&nbsp;<input type="submit" name="update_values" value="Update WIP COG Values"  /> 
</form>
</td>
<td style="width:25%; text-align:right;">
<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
<input type="button" value="Export To XLS" onclick="document.location.href='{{$BASE_URL}}work_in_progress_report.home/export/1'" /> &nbsp;
<input type="button" name="Add New " value="Add New" onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.detail}}');" />
</form>
</td>
</tr>
</table>

<div style="float:left; width:100%;" class="tableFixHead">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
                   <th class="topmenu" align="center" valign="middle" width="3%">Rec. No.</th>  
                   <th class="topmenu" align="center" valign="middle" width="15%">Project</th> 
                   <th class="topmenu" align="center" valign="middle" width="8%">Project Status</th> 
                   <th class="topmenu" align="center" valign="middle" width="10%">Invoice Stage</th> 
                   <th class="topmenu" align="center" valign="middle" width="5%">Invoice Value</th> 
                   <th class="topmenu" align="center" valign="middle" width="5%">% Completed</th>
            	   <th class="topmenu" align="center" valign="middle" width="6%">Value Completed</th>
                   <th class="topmenu" align="center" valign="middle" width="6%">COG %</th> 
                   <th class="topmenu" align="center" valign="middle" width="9%">WIP COG</th> 
                   <th class="topmenu" align="center" valign="middle" width="10%">Reason</th> 
                   <th class="topmenu" align="center" valign="middle" width="5%">Action</th>   
            </tr>
        </thead>
    <tbody>
{{assign var=countn value= $total}}
 {{foreach from=$list key="key" item="item"}}

    <tr bgcolor="#FFFFFF">

        <td>{{counter}}</td>
        <td><a href="{{$item.link}}" target="_blank">{{$item.wp_project}}</a></td> 
        <td>{{$item.status}}</td>
        <td> <select name="{{$TABLE}}[wp_invoice_stage]" class="input" />
          {{foreach from=$stagedata key="key2" item="item2"}}	
                 <option value="{{$item2.so_id}}" {{if $item.wp_invoice_stage eq $item2.so_id}} selected="selected"{{/if}} >
                 {{$item2.so_name}}
                 </option> 
          {{/foreach}}
         </select>
        
        </td> 
        <td>{{$item.wp_invoice_value}}</td>
        <td> <div class="slidecontainer">
      
  <input type="range" min="0" max="100" value="{{$item.wp_per_completed}}" class="slider" id="myRange_{{$countn}}" Onchange = "update({{$item.wp_id}},this.value)" >
   <p>%: <span id="demo_{{$item.wp_id}}"></span></p></div>
      <div id="gh{{$item.wp_id}}">{{$item.wp_per_comp_user}}<br />{{$item.wp_per_comp_date}} </div>
<script>
	var slider = document.getElementById("myRange_{{$countn}}");
	var output{{$item.wp_id}} = document.getElementById("demo_{{$item.wp_id}}");
	output{{$item.wp_id}}.innerHTML = slider.value;
	slider.oninput = function() {
		output{{$item.wp_id}}.innerHTML = this.value;

		var x = {{$item.inv2}} * this.value / 100;
		var y = x.toFixed(2);
		var z = y.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
			 
		demo2_{{$item.wp_id}}.innerHTML =  z;
		//demo3_{{$item.wp_id}}.innerHTML = x * s2 / 100 ;	
	}
	
		function update(id,value)
		{
			var tana10 = "#gh" + id;
			 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}work_in_progress_report.update_per/wp_id/"+id+"/value/"+value,
						   success: function(result){
							   $(tana10).html(result);
					   }
					 });
		}
		
	
</script>
     
        </td>
        <td>  <p>$<span id="demo2_{{$item.wp_id}}">{{$item.val_computed|number_format:2:".":","}}</span></p></td>
        <td>
        <div class="slidecontainer">
  <input type="range" min="0" max="100" value="{{$item.wp_cog_percented}}" class="slider" id="myRange2_{{$countn}}" Onchange = "update_cog({{$item.wp_id}},this.value)" >
   <p>%: <span id="democ_{{$item.wp_id}}"></span></p></div>
   <div id="vc{{$item.wp_id}}">{{$item.wp_value_comp_user}}<br />{{$item.wp_value_comp_date}} </div>
<script>
	var slider2 = document.getElementById("myRange2_{{$countn}}");
	var output2{{$item.wp_id}} = document.getElementById("democ_{{$item.wp_id}}");
	output2{{$item.wp_id}}.innerHTML = slider2.value;
	
	var s1 = document.getElementById("demo_{{$item.wp_id}}");
	var s2 = document.getElementById("democ_{{$item.wp_id}}");
	
	slider2.oninput = function() {
	  	output2{{$item.wp_id}}.innerHTML = this.value;
	  	//demo3_{{$item.wp_id}}.innerHTML = {{$item.inv2}} * slider.value / 100 *  slider2.value / 100 ;
		var x1 = {{$item.inv2}} * s1 / 100 *  this.value / 100 ;
		var y1 = x1.toFixed(2);
		var z1 = y1.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
		//demo3_{{$item.wp_id}}.innerHTML = z1;
	}
	
		
		function update_cog(id,value)
		{
		var tana11 = "#vc" + id;
		 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}work_in_progress_report.update_cog_per/wp_id/"+id+"/value/"+value,
						   success: function(result){
							   $(tana11).html(result);
					   }
					 });
		}
</script>

        </td>
        <td><p>$<span id="demo3_{{$item.wp_id}}">{{$item.wip_cog|number_format:2:".":","}}</span></p></td>
        <td><a href="{{$BASE_URL}}work_in_progress_report.reason/wp_id/{{$item.wp_id}}" class="various" style="color: #0C6;">Read</a></td>
        
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