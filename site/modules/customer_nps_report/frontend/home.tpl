<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

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

.cnf {font-size:11px !important; padding:3px !important; }


.slidecontainer {
  width: 150px;
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

	  
</style>

<script language="javascript">

function add_procedure()
{
	var viewurl = "{{$BASE_URL}}customer_nps_report.view_procedure"+ "/random/" + Math.random();	

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

function add_status()
{
	var viewurl = "{{$BASE_URL}}customer_nps_report.view_status"+ "/random/" + Math.random();	

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


function add_spoke_to()
{
	var viewurl = "{{$BASE_URL}}customer_nps_report.view_spoke_to_customer"+ "/random/" + Math.random();	

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

function add_response_sent()
{
	var viewurl = "{{$BASE_URL}}customer_nps_report.view_response_sent"+ "/random/" + Math.random();	

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
<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> 
<input type="button" name="status_panel" value="Status Admin"  onclick="javascript:add_status();" />
<input type="button" name="spoke_to" value="Spoke To Customer Admin"  onclick="javascript:add_spoke_to();" />
<input type="button" name="response" value="Response Sent Admin"  onclick="javascript:add_response_sent();" />
&nbsp; &nbsp; <span style="border:1px solid #0CF; padding:3px;"> 7 Days NPS Survey received : {{if $surveys_data_weekly}}{{$surveys_data_weekly.weekly_total}}{{/if}} </span>
&nbsp; &nbsp; <span style="border:1px solid #0CF; padding:3px;"> YTD NPS Survey received : {{if $surveys_data_ytd}}{{$surveys_data_ytd.ytd_total}}{{/if}} </span>
&nbsp; &nbsp; <span style="border:1px solid #0CF; padding:3px;"> 7 Days Net Ranking : {{if $surveys_data_weekly}}{{$surveys_data_weekly.net_rating}}{{/if}} </span>
&nbsp; &nbsp; <span style="border:1px solid #0CF; padding:3px;"> YTD Net Ranking  : {{if $surveys_data_ytd}}{{$surveys_data_ytd.net_rating}}{{/if}} </span>
</div>


<div style="float:right; text-align:right;"> 
<input type="submit" name="download_all_surveys" value="Download All Surveys">
<input type="submit" name="showall" value="Show All" />
<!--<input type="button" name="priority" value="Edit Component" onclick="javascript:add_component();" /> -->
<input type="button" name="Add New " value="Add New" onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.detail}}');" />
</div>
</form>
</td></tr></table>

<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
                   <th class="topmenu" align="center" valign="middle" width="3%">UID</th>  
                   <th class="topmenu" align="center" valign="middle" width="6%">Date</th> 
                   <th class="topmenu" align="center" valign="middle" width="12%">Stage</th> 
                   <th class="topmenu" align="center" valign="middle" width="20%">Project</th> 
                   <th class="topmenu" align="center" valign="middle" width="8%">Survey PDF</th>
                   
                   <th class="topmenu" align="center" valign="middle" width="8%">Spoke to Customer</th>
                   <th class="topmenu" align="center" valign="middle" width="8%">Response Sent and Posted</th>
                   <th class="topmenu" align="center" valign="middle" width="8%">Notes</th>
                   <th class="topmenu" align="center" valign="middle" width="8%">Responsible Position</th> 
                   
                   <th class="topmenu" align="center" valign="middle" width="8%">Status</th>  
                   <th class="topmenu" align="center" valign="middle" width="8%">Written Response</th> 
                   <th class="topmenu" align="center" valign="middle" width="12%">Rating</th> 
                   <th class="topmenu" align="center" valign="middle" width="8%">Responded</th>
                   <th class="topmenu" align="center" valign="middle" width="8%">Final Written Response</th>
                   <th class="topmenu" align="center" valign="middle" width="10%">Actioned</th> 
                   <th class="topmenu" align="center" valign="middle" width="8%">Open Closed</th>  
                   <th class="topmenu" align="center" valign="middle" width="8%">Action</th>   
            </tr>
        </thead>
    <tbody>
<form name="mlist" method="post">
{{assign var=countn value= $total}}
 {{foreach from=$list key="key" item="item"}}

    <tr bgcolor="#FFFFFF">

        <td>{{$item.cn_id}}</td>
        <td>{{$item.cn_date}}</td>
        <td> <form name="stage" method="post" action="">
         <select name="{{$TABLE}}[cn_stage]"  Onchange = "update_stage({{$item.cn_id}},this.value)">
        <option value="-1" {{if $detail.qb_component eq -1}} selected="selected" {{/if}}>Please Select </option>
        {{foreach from = $stdetail key="key2" item="item2"}}
        <option value="{{$item2.st_id}}" {{if $item2.st_id eq $item.cn_stage }} selected="selected" {{/if}}>{{$item2.st_name}}</option>
        {{/foreach}}
    </select>
     </form>   
        <script>
	   
		function update_stage(id,value)
		{
			
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}quote_builder.update_stage/cn_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	</script>
    
        </td>
        <td>{{$item.cn_project}}</td> 
        <td>
       <!-- {{if $item.cn_survey_pdf}}<a href="https://deckquote.s3.amazonaws.com/files/uploads_2023/{{$item.cn_survey_pdf}}" target="_blank">Download</a><br />{{/if}} -->
        {{if $item.cn_survey_pdf}}<a href="/customer_nps_report.download_content?file_name={{$item.cn_survey_pdf}}&module_name=customer_nps_report.home" >Download</a><br />{{/if}}
          </td>
          
         <td>
          <form name="cr" method="post" action="">
          <select name="{{$TABLE}}[cn_spoke]"  Onchange = "update_spoke_to({{$item.cn_id}},this.value)">
          <option value="0" {{if $detail.cn_spoke_to_date eq 0}} selected="selected" {{/if}}>Please Select </option>
           {{foreach from=$spoketodata key="key2" item="item2"}}
            <option value="{{$item2.sc_id}}" {{if $item.cn_spoke_to_cust  eq $item2.sc_id}} selected="selected" {{/if}}>
            {{$item2.sc_option}}
            </option>
          {{/foreach}}
          </select>
         </form>   
         
          <div id="sc{{$item.cn_id}}">{{$item.cn_spoke_to_date}}<br />{{$item.cn_spoke_to_user}} </div>
        <script>
	   
		function update_spoke_to(id,value)
		{
			var tana10 = "#sc"+id;
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}customer_nps_report.update_spoke_to/cn_id/"+id+"/value/"+value,
					   success: function(result){
						    $(tana10).html(result);
					}
				});
		}
	    </script>
         
         </td> 
          
                  <td>
          <form name="cr" method="post" action="">
          <select name="{{$TABLE}}[cn_response]"  Onchange = "update_response_sent({{$item.cn_id}},this.value)">
          <option value="0" {{if $detail.cn_response_sent eq 0}} selected="selected" {{/if}}>Please Select </option>
           {{foreach from = $rsdata key="key3" item="item3"}}
            <option value="{{$item3.rs_id}}" {{if $item.cn_response_sent  eq $item3.rs_id}} selected="selected" {{/if}}>
            {{$item3.rs_option}}
            </option>
           {{/foreach}}
          </select>
         </form>   
         
          <div id="rs{{$item.cn_id}}">{{$item.cn_response_sent_date}}<br />{{$item.cn_response_sent_user}} </div>
        <script>
	   
		function update_response_sent(id,value)
		{
			var tana11 = "#rs"+id;
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}customer_nps_report.update_response_sent/cn_id/"+id+"/value/"+value,
					   success: function(result){
						    $(tana11).html(result);
					}
				});
		}
	    </script>
         
         </td>  
          
         <td> 
         <a href="{{$BASE_URL}}customer_nps_report.view_notes/cn_id/{{$item.cn_id}}" class="various">Notes</a>
         {{$item.notes_date}}
         </td>

        <td> 
        
        {{$item.cn_resp_staff}}
         <a href ="{{$BASE_URL}}customer_nps_report.select_staff/cn_id/{{$item.cn_id}}" class="various">Select Staff</a>
         
        </td>
        
          
          <td>
          <form name="cr" method="post" action="">
         <select name="{{$TABLE}}[cn_status]"  Onchange = "update_status({{$item.cn_id}},this.value)">
         <option value="0" {{if $detail.cn_status eq 0}} selected="selected" {{/if}}>Please Select </option>
         {{foreach from=$statusdata  key="key1" item="item1"}}
            <option value="{{$item1.cs_id}}" {{if $item.cn_status  eq $item1.cs_id}} selected="selected" {{/if}}>
            {{$item1.cs_status}}
            </option>
            {{/foreach}}
         </select>
         </form>   
        <script>
	   
		function update_status(id,value)
		{
			
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}customer_nps_report.update_status/cn_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	    </script>
          
          </td>
        <td>
 {{if $item.cn_written_resp}}
 
 <a href="/customer_nps_report.download_content?file_name={{$item.cn_written_resp}}&module_name=customer_nps_report.home" >{{ $item.cn_written_resp}}</a><br />
 <!--<a href="https://deckquote.s3.amazonaws.com/files/uploads_2023/{{$item.cn_written_resp}}" target="_blank">{{ $item.cn_written_resp}}</a><br /> -->
 {{$item.cn_date}}{{/if}}
 
 {{if $item.cn_written_resp_2}}
 <a href="/customer_nps_report.download_content?file_name={{$item.cn_written_resp_2}}&module_name=customer_nps_report.home" >{{$item.cn_written_resp_2}}</a><br />
 <!--<a href="https://deckquote.s3.amazonaws.com/files/uploads_2023/{{$item.cn_written_resp_2}}" target="_blank">{{$item.cn_written_resp_2}}</a><br />  -->
 {{/if}}
 
 {{if $item.cn_written_resp_3}}
 <a href="/customer_nps_report.download_content?file_name={{$item.cn_written_resp_3}}&module_name=customer_nps_report.home" >{{$item.cn_written_resp_3}}</a><br />
<!-- <a href="https://deckquote.s3.amazonaws.com/files/uploads_2023/{{$item.cn_written_resp_3}}" target="_blank">{{$item.cn_written_resp_3}}</a><br />  -->
 {{/if}}
       
        </td> 
        <td>
         <div class="slidecontainer">
        <input type="range" min="0" max="10" value="{{$item.cn_rating}}" class="slider" id="myRange_{{$countn}}" Onchange = "update({{$item.cn_id}},this.value)" >
        <p> <span id="demo_{{$item.cn_id}}"></span></p>
        </div>

	<script>
        var slider = document.getElementById("myRange_{{$countn}}");
        var output{{$item.cn_id}} = document.getElementById("demo_{{$item.cn_id}}");
        output{{$item.cn_id}}.innerHTML = slider.value;
        
        slider.oninput = function() {
          output{{$item.cn_id}}.innerHTML = this.value;
        }
                
                function update(id,value)
                {
                 
                 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}customer_nps_report.update_rating/cn_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
                }
                
                
        </script>
       </td>
    
        <td>
         <form name ="recmet3" method="post" action="">
     	<input type="hidden" name="responded[{{$item.cn_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="responded[{{$item.cn_id}}]" value="1"  onclick="this.form.submit();" {{if $item.cn_responded eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form>  
        </td>
       <td>
       <form name ="recmet4" method="post" action="">
     	<input type="hidden" name="response[{{$item.cn_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="response[{{$item.cn_id}}]" value="1"  onclick="this.form.submit();" {{if $item.cn_response eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form>  
       
       
       </td> 
        
       <td>{{$item.cn_user}}</td>
         <td>
         <form name ="recmet3" method="post" action="">
     	<input type="hidden" name="hide[{{$item.cn_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="hide[{{$item.cn_id}}]" value="1"  onclick="this.form.submit();" {{if $item.cn_openclose eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form>  
         
         </td>
        
        <td> <a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" class="various" title="Edit"> 
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;
             <a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete">
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>&nbsp;
             
        </td>
    </tr>  
      {{assign var=countn value=$countn-1}}
  {{/foreach}}
</form>
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