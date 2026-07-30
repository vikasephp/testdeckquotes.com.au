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


.slidecontainer { width: 225px; }

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

.slider:hover { opacity: 1; }

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
	var viewurl = "{{$BASE_URL}}post_hia_design_report.view_procedure"+ "/random/" + Math.random();	

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

 function add_urgency()
{
	var viewurl = "{{$BASE_URL}}post_hia_design_report.view_urgency"+ "/random/" + Math.random();	

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
	var viewurl = "{{$BASE_URL}}post_hia_design_report.view_type"+ "/random/" + Math.random();	

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
&nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> 
&nbsp; &nbsp;<input type="button" name="urgency_options" value="Urgency Admin" onclick="javascript:add_urgency();" /> 
&nbsp; &nbsp;<input type="button" name="type_options" value="Type Admin" onclick="javascript:add_type();" /> 
<br />
&nbsp;<strong> Project Search : </strong> 
<datalist id='project'>
           {{foreach from=$projdetail key="key3" item="item3"}}
            <option value="{{$item3.bsn_name}}" {{if $bsnid eq $item3.bsn_id}} selected="selected" {{/if}}>
            {{$item3.bsn_name}}
            </option>
            {{/foreach}}
 </datalist>
<input type="text" list = 'project' name="project_name" style ="width:350px" value="{{$detail.cp_project_name}}" /> 
<input type="submit" name="search" value = "Search" /> 
<input type="submit" name="clear" value = "Clear Search" /> <br />
&nbsp;<strong> Filter By Type : </strong>
<select name="type_search">
            <option value="0">Please Select</option>
            {{foreach from=$typedetail key="key3" item="item3"}}
            <option value="{{$item3.et_id}}"  {{if $item.ph_type eq $item3.et_id}} selected="selected" {{/if}} >{{$item3.et_option}}</option>
            {{/foreach}}
</select>
<input type="submit" name="filter_type" value = "Filter" /> 

&nbsp;<strong> Filter By Urgency : </strong>
<select name="urgency_search"  onChange="update_urgency({{$item.ph_id}}, this.value)">
            <option value="0">Please Select</option>
            {{foreach from=$urgencydetail key="key2" item="item2"}}
            <option value="{{$item2.pu_id}}"  {{if $item.ph_urgency eq $item2.pu_id}} selected="selected" {{/if}} >{{$item2.pu_option}}</option>
            {{/foreach}}
            </select>
<input type="submit" name="filter_urgency" value = "Filter" />             
<input type="submit" name="clear" value = "Clear Filter" />
</div>

<div style="float:right;"> 
<input type="button" name="Add New " value="Add New" onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.detail}}');" />
</div>
</form>

<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
                   <th class="topmenu" align="center" valign="middle" width="3%">ID</th> 
                   <th class="topmenu" align="center" valign="middle" width="8%">Type</th>
                   <th class="topmenu" align="center" valign="middle" width="8%">Urgency</th>
                   <th class="topmenu" align="center" valign="middle" width="18%">Customer Details</th> 
                   <th class="topmenu" align="center" valign="middle" width="4%">Link</th> 
                   <th class="topmenu" align="center" valign="middle" width="7%">Latest Merged Plans Operations </th> 
                   <th class="topmenu" align="center" valign="middle" width="7%">Operational Plans Implemented</th> 
                   <th class="topmenu" align="center" valign="middle" width="7%">Repricing Required</th> 
                   <th class="topmenu" align="center" valign="middle" width="7%">Client Notified?</th> 
                   <th class="topmenu" align="center" valign="middle" width="7%">Client Signed?</th> 
                   <th class="topmenu" align="center" valign="middle" width="7%">Change Pdf </th>
                   <th class="topmenu" align="center" valign="middle" width="7%">Project Status </th>
                   <th class="topmenu" align="center" valign="middle" width="5%">Overseas Architect</th>
                   <th class="topmenu" align="center" valign="middle" width="3%">Days </th>
                   <th class="topmenu" align="center" valign="middle" width="5%">Slider </th>
                   <th class="topmenu" align="center" valign="middle" width="5%">Design Task<br /> Track Count </th>
                   <th class="topmenu" align="center" valign="middle" width="15%">Where are we at</th>
                   <th class="topmenu" align="center" valign="middle" width="8%">Traffic Light</th>
                   <th class="topmenu" align="center" valign="middle" width="8%">Request</th>
                   <th class="topmenu" align="center" valign="middle" width="7%">Action</th>   
            </tr>
        </thead>
    <tbody>

  {{assign var=countn value= $total}}
 {{foreach from=$list key="key" item="item"}}

    <tr bgcolor="#FFFFFF">
        <td>{{counter}}</td>
        
         <td>
            <select name="{{$TABLE}}[vd_type]"  onChange="update_type({{$item.ph_id}}, this.value)">
            <option value="0">Please Select</option>
            {{foreach from=$typedetail key="key3" item="item3"}}
            <option value="{{$item3.et_id}}"  {{if $item.ph_type eq $item3.et_id}} selected="selected" {{/if}} >{{$item3.et_option}}</option>
            {{/foreach}}
            </select>
            <script>
			function update_type(id,value)
			{
					   $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}post_hia_design_report.update_type/ph_id/"+id+"/value/"+value,
						     success: function(result){
							
						}
						
					});
			}
	        </script>
         </td>
         
         <td><select name="{{$TABLE}}[ph_urgency]"  onChange="update_urgency({{$item.ph_id}}, this.value)">
            <option value="0">Please Select</option>
            {{foreach from=$urgencydetail key="key2" item="item2"}}
            <option value="{{$item2.pu_id}}"  {{if $item.ph_urgency eq $item2.pu_id}} selected="selected" {{/if}} >{{$item2.pu_option}}</option>
            {{/foreach}}
            </select>
            <script>
			function update_urgency(id,value)
			{
					   $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}post_hia_design_report.update_urgency/ph_id/"+id+"/value/"+value,
						     success: function(result){
							
						}
						
					});
			}
	        </script></td>   
         
         
          <td><strong>{{$item.bcust_fname}} &nbsp; {{$item.bcust_lname}}</strong> <br />{{$item.ph_bsn_name}}</td>  
          
        <td><a href="{{$item.link}}" target="_blank">Link</td>  
        <td>  
       
       {{if $item.doc_file_name}}<br />
   
       <a href = "/post_hia_design_report.download_content?file_name={{$item.doc_file_name}}&module_name=post_hia_design_report.home" target="_blank">Download</a>  <br />
       {{$item.doc_date_uploaded}}         
       {{/if}}  
       </td>
       
       <td>
       <form name ="recmet3" method="post" action="">
     	<input type="hidden" name="opi[{{$item.bsn_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="opi[{{$item.bsn_id}}]" value="1"  onclick="update_opi({{$item.bsn_id}},this.checked)" {{if $item.bsn_ptt_opi  eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form> 
       <div id="gh{{$item.bsn_id}}">{{if  $item.bsn_ptt_opi eq 1}} {{$item.bsn_ptt_opi_date}}<br />{{$item.bsn_ptt_opi_user}}{{/if}}</div> 
       
       <script>
	   function update_opi(id,value)
		{
	    var tana = "#gh"+id;
		var val;
		if(value==false) { val = 0; } else { val = 1; }
		
		 $.ajax({
					type: "GET",
					url: "{{$BASE_URL}}post_hia_design_report.update_opi/bsn_id/"+id+"/value/"+val,
						   success: function(result){
							   $(tana).html(result);  
					   }
			    });
		}
	   </script>
       
       </td>
        
       <td> <form name ="recmet3" method="post" action="">
     	<input type="hidden" name="repricing[{{$item.ph_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="repricing[{{$item.ph_id}}]" value="1"  onclick="this.form.submit();" {{if $item.ph_repricing_req eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       {{if $item.ph_repricing_req eq 1}} {{$item.ph_repricing_date eq 1}} <br /> {{$item.ph_repricing_user eq 1}} {{/if}}
       </td> 
      
      <td> <form name ="recmet3" method="post" action="">
     	<input type="hidden" name="notified[{{$item.ph_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="notified[{{$item.ph_id}}]" value="1"  onclick="this.form.submit();" {{if $item.ph_client_notified eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       {{if $item.ph_client_notified eq 1}} {{$item.ph_client_noti_date eq 1}} <br /> {{$item.ph_client_noti_user eq 1}} {{/if}}
       </td> 
       
       <td><form name ="recmet3" method="post" action="">
     	<input type="hidden" name="signed[{{$item.ph_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="signed[{{$item.ph_id}}]" value="1"  onclick="this.form.submit();" {{if $item.ph_client_signed eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       {{if $item.ph_client_signed eq 1}} {{$item.ph_client_sig_date eq 1}} <br /> {{$item.ph_client_sig_user eq 1}} {{/if}}</td>
      
        
       <td>
       
       {{if $item.doc_file_name_639}}
        <a href = "/post_hia_design_report.download_content?file_name={{$item.doc_file_name_639}}&module_name=post_hia_design_report.home" target="_blank">Download</a> <br />
        {{$item.doc_date_uploaded_639}}
        {{/if}}  
       
       <!--{{if $item.ph_change_pdf}}<br />
   
       <a href = "/post_hia_design_report.download_content_cp?file_name={{$item.ph_change_pdf}}&module_name=post_hia_design_report.home" target="_blank">Download</a>  {{/if}}-->
       </td>
            
        <td>{{$item.status}}</td>
        <td>{{$item.osarchi}}</td>
        <td>{{$item.dayscount}} </td>
        <td> 
      
   <div class="slidecontainer">
  <input type="range" min="0" max="100" value="{{$item.ph_slider}}" class="slider" id="myRange_{{$countn}}" Onchange = "update({{$item.ph_id}},this.value)" >
   <p>%: <span id="demo_{{$item.ph_id}}"></span></p>
   <sapn id="gh{{$item.ph_id}}">{{$item.ph_slider_user}}<br />{{$item.ph_slider_date}} </span>
  </div>
   </td>
<script>
	var slider = document.getElementById("myRange_{{$countn}}");
	var output{{$item.ph_id}} = document.getElementById("demo_{{$item.ph_id}}");
	output{{$item.ph_id}}.innerHTML = slider.value;
	
	slider.oninput = function() {
	  output{{$item.ph_id}}.innerHTML = this.value;
	}
	
		
		function update(id,value)
		{
	    var tana = "#gh"+id;
		 $.ajax({
					type: "GET",
					url: "{{$BASE_URL}}post_hia_design_report.update_slider/ph_id/"+id+"/value/"+value,
						   success: function(result){
							   $(tana).html(result);  
					   }
			    });
		}
		
</script>
        <td>{{$item.o_task}} </td>
        
      <td>
      <input type="text" name="wherewe" value="{{$item.ph_where_we_are}}" onkeyup="update_where_we({{$item.ph_id}},this.value)" style="width:200px" /></td>  
         <script>
			function update_where_we(id,value)
			{
					   $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}post_hia_design_report.update_where_we/ph_id/"+id+"/value/"+value,
						     success: function(result){
							
						}
						
					});
			}
	        </script>       
        
       {{ if $item.ph_traffic_light eq 1}}
       <td style="background:#00CC33";>
       <a href="{{$BASE_URL}}post_hia_design_report.colorbox/ph_id/{{$item.ph_id}}" class="various">Color</a>
       <br /><br />{{$item.ph_tl_user}}<br />{{$item.ph_tl_date}}<br />
        <a href="{{$BASE_URL}}post_hia_design_report.reason/ph_id/{{$item.ph_id}}" class="various">Read</a>
       </td>
       {{ elseif  $item.ph_traffic_light eq 2}}
       <td style="background: #ff7f27";>
       <a href="{{$BASE_URL}}post_hia_design_report.colorbox/ph_id/{{$item.ph_id}}" class="various">Color</a>
       <br /><br />{{$item.ph_tl_user}}<br />{{$item.ph_tl_date}}<br />
       <a href="{{$BASE_URL}}post_hia_design_report.reason/ph_id/{{$item.ph_id}}" class="various">Read</a>
       </td>
       {{ elseif  $item.ph_traffic_light eq 3}}
       <td style="background: #F00";>
       <a href="{{$BASE_URL}}post_hia_design_report.colorbox/ph_id/{{$item.ph_id}}" class="various">Color</a>
       <br /><br />{{$item.ph_tl_user}}<br />{{$item.ph_tl_date}}<br />
       <a href="{{$BASE_URL}}post_hia_design_report.reason/ph_id/{{$item.ph_id}}" class="various">Read</a>
       </td>
       {{else }}
       <td>
       <a href="{{$BASE_URL}}post_hia_design_report.colorbox/ph_id/{{$item.ph_id}}" class="various">Color</a></td>
       {{/if}}
        
       <td> {{$item.ph_request}}<br />{{$item.ph_addto_user}}<br />{{$item.ph_addto_date}}
       
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