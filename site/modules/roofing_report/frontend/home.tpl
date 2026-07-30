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
	  
.set3 { font-size:10px !important; 
       width:120px !important; display:inline-block; 
	  padding-top:1px !important;
	  padding-bottom: 1px !important;
	  padding-left:1px !important;
	  height:25px !important; 
	  margin-top:7px;}	  
	  
#fancybox-wrap {z-index:9999999;} 
	  
</style>

<script language="javascript">
function add_procedure()
{
	var viewurl = "{{$BASE_URL}}roofing_report.view_procedure"+ "/random/" + Math.random();	

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

function add_occupancy()
{
	var viewurl = "{{$BASE_URL}}roofing_report.view_occupancy"+ "/random/" + Math.random();	

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



function add_they_want()
{
	var viewurl = "{{$BASE_URL}}roofing_report.view_they_want"+ "/random/" + Math.random();	

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


function send_email(id)
{
	var viewurl = "{{$BASE_URL}}roofing_report.email"+ "/rr_id/" + id;	

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
<input type="button" name="occupancy" value="Occupancy Admin" onclick="javascript:add_occupancy();" /> 
<input type="button" name="whatthey"  value="What they want Admin" onclick="javascript:add_they_want();" /> 

<!--<br />
<strong> Project Name  : </strong> 
<input type="text" list = 'project' name="project_name" style ="width:300px" value="{{$search_project}}" />
<input type="submit" name="search" value = "Search" /> 
<input type="submit" name="clear" value = "Clear Search" />-->
</div>


<div style="float:right; text-align:right;"> 
<input type="button" name="Add New " value="Add New" onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.detail}}');" />
</div>
</form>
</td></tr></table>

<div id="">
    <table id="list-table" class="nav-back" width="120%">
        <thead>
            <tr>
                   <th class="topmenu" align="center" valign="middle" width="3%">URN.</th>  
                   <th class="topmenu" align="center" valign="middle" width="15%">Project </th> 
                   <th class="topmenu" align="center" valign="middle" width="10%">Occupancy</th> 
                   <th class="topmenu" align="center" valign="middle" width="10%">Client's Name</th>  
                   <th class="topmenu" align="center" valign="middle" width="5%">Email</th> 
                   <th class="topmenu" align="center" valign="middle" width="5%">Phone</th> 
                   <th class="topmenu" align="center" valign="middle" width="10%">Survey Result</th>
                   <th class="topmenu" align="center" valign="middle" width="10%">Introduction Letter</th>
                   <th class="topmenu" align="center" valign="middle" width="10%">Budget</th> 
                   <th class="topmenu" align="center" valign="middle" width="8%">What They Want</th>
                   <th class="topmenu" align="center" valign="middle" width="8%">Are we booinkg In?</th>
                   <th class="topmenu" align="center" valign="middle" width="8%">Onsite Booked</th>
                   <th class="topmenu" align="center" valign="middle" width="8%">Onsite Video</th>
                   <th class="topmenu" align="center" valign="middle" width="10%">Price</th> 
                   <th class="topmenu" align="center" valign="middle" width="10%">Inspection Report PDF</th> 
                   <th class="topmenu" align="center" valign="middle" width="10%">Works Proposal Word</th>
                   <th class="topmenu" align="center" valign="middle" width="10%">Works Proposal PDF</th>
                   <th class="topmenu" align="center" valign="middle" width="10%">DocuSign Agreement</th>
                 <!--  <th class="topmenu" align="center" valign="middle" width="10%">Introduction Letter</th>-->
                   <th class="topmenu" align="center" valign="middle" width="9%">Print</th> 
                   <th class="topmenu" align="center" valign="middle" width="9%">Action</th>   
            </tr>
        </thead>
        <tr style="background-color:#FFC;">
                   <th><a href="{{$BASE_URL}}roofing_report.add_header_link/rh_id/1" class="various">Link</a></th>  
                   <th><a href="{{$BASE_URL}}roofing_report.add_header_link/rh_id/2" class="various">Link</a></th>  
                   <th><a href="{{$BASE_URL}}roofing_report.add_header_link/rh_id/3" class="various">Link</a></th>  
                   <th><a href="{{$BASE_URL}}roofing_report.add_header_link/rh_id/4" class="various">Link</a></th>   
                   <th><a href="{{$BASE_URL}}roofing_report.add_header_link/rh_id/5" class="various">Link</a></th>  
                   <th><a href="{{$BASE_URL}}roofing_report.add_header_link/rh_id/6" class="various">Link</a></th>  
                   <th><a href="{{$BASE_URL}}roofing_report.add_header_link/rh_id/7" class="various">Link</a></th> 
                      <th><a href="{{$BASE_URL}}roofing_report.add_header_link/rh_id/19" class="various">Link</a></th> 
                   <th><a href="{{$BASE_URL}}roofing_report.add_header_link/rh_id/8" class="various">Link</a></th> 
                   <th><a href="{{$BASE_URL}}roofing_report.add_header_link/rh_id/9" class="various">Link</a></th>  
                   <th><a href="{{$BASE_URL}}roofing_report.add_header_link/rh_id/10" class="various">Link</a></th>  
                   <th><a href="{{$BASE_URL}}roofing_report.add_header_link/rh_id/11" class="various">Link</a></th>  
                   <th><a href="{{$BASE_URL}}roofing_report.add_header_link/rh_id/12" class="various">Link</a></th>   
                   <th><a href="{{$BASE_URL}}roofing_report.add_header_link/rh_id/13" class="various">Link</a></th>  
                   <th><a href="{{$BASE_URL}}roofing_report.add_header_link/rh_id/14" class="various">Link</a></th>  
                   <th><a href="{{$BASE_URL}}roofing_report.add_header_link/rh_id/15" class="various">Link</a></th>  
                   <th><a href="{{$BASE_URL}}roofing_report.add_header_link/rh_id/16" class="various">Link</a></th> 
                   <th><a href="{{$BASE_URL}}roofing_report.add_header_link/rh_id/17" class="various">Link</a></th>  
                 
                   <th><a href="{{$BASE_URL}}roofing_report.add_header_link/rh_id/18" class="various">Link</a></th> 
                   
                   <th></th> 
           
            </tr>
        
    <tbody>

 {{foreach from=$list key="key" item="item"}}

    <tr bgcolor="#FFFFFF">

        <td>{{$item.rr_id}}</td>
        <td>{{$item.rr_project}}</td> 
        <td>
          <select name="{{$TABLE}}[rr_occupancy]"  Onchange = "update_occupancy({{$item.rr_id}},this.value)">
                <option value="-1" {{if $item.dc_status eq -1}} selected="selected" {{/if}}>Please Select </option>
                {{foreach from = $occdetail key="key4" item="item4"}}
                <option value="{{$item4.ro_id}}" {{if $item4.ro_id eq $item.rr_occupancy}} selected="selected" {{/if}}>{{$item4.ro_occupancy}}</option>
                {{/foreach}}
        </select>
        
        <script>
		function update_occupancy(id,value)
		{
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}roofing_report.update_occupancy/rr_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	</script>
        
        </td> 
        <td>{{$item.rr_client_name}}</td>
        <td>{{$item.rr_email}}</td>
        <td>{{$item.rr_phone}}</td>
        <td>{{if $item.rr_survery_result}} <br />
       <!-- <a href="https://deckquote.s3.amazonaws.com/files/roofing_report/{{$item.rr_survery_result}}" target="_blank">Download</a>-->
        <a href="/roofing_report.download_content?file_name={{$item.rr_survery_result}}&module_name=roofing_report.home" target="_blank">Download</a>
        {{/if}}
        </td>
       
       <td>
        <form name="cal4" method="post" enctype="multipart/form-data"> 
        <input type="hidden" name="rr_id" value="{{$item.rr_id}}"  />
        <input type="file" name="intro_letter" /><br />
        {{if $item.rr_intro_letter}}
        <div style="text-align:center;"> 
        <!--<a href="https://deckquote.s3.amazonaws.com/files/roofing_report/{{$item.rr_intro_letter}}" target="_blank">Download</a>-->
        <a href="/roofing_report.download_content?file_name={{$item.rr_intro_letter}}&module_name=roofing_report.home" target="_blank">Download</a>
        
        <a href="{{$BASE_URL}}roofing_report.delete_il/rr_id/{{$item.rr_id}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img src="{{$BASE_URL}}/images/delete_icon.png" width="20" /></a>
         <br /> {{$item.rr_intro_letter_user}} - {{$item.rr_intro_letter_date}}
        </div> {{/if}}
        
        <input type= "submit" name="save_intro" title="Save" value="Upload" class="set2"> &nbsp;
        {{if $item.rr_intro_letter_link}} <a href="{{$item.rr_intro_letter_link}}" target="_blank">View Link</a><br />
        {{$item.rr_intro_letter_link_date}}<br />{{$item.rr_intro_letter_link_user}}
        {{/if}} 
        </form>
        </td>
     
     
	<td>{{$item.rr_budget}}</td>
       <td><select name="{{$TABLE}}[rr_what_they_want]" Onchange = "update_whatthey({{$item.rr_id}},this.value)"/>
      		 {{foreach from = $rtwdetail key="key3" item="item3"}}
                <option value="{{$item3.rt_id}}" {{if $item3.rt_id eq $item.rr_what_they_want}} selected="selected" {{/if}}>{{$item3.rt_they_want}}</option>
                {{/foreach}}        
              </select>  
              
       <script>
		function update_whatthey(id,value)
		{
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}roofing_report.update_whatthey/rr_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	</script>       
              
    </td>
        <td>
        <form name ="recmet3" method="post" action="">
     	<input type="hidden" name="looking[{{$item.rr_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="looking[{{$item.rr_id}}]" value="1"  onclick="this.form.submit();" {{if $item.rr_are_we eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form>
       {{if $item.rr_are_we eq 1}} {{$item.rr_are_we_date}}<br />{{$item.rr_are_we_user}} {{/if}}
       </td>
        
        <td>{{$item.rr_onsite_booked}}<br />
        {{$item.rr_onsite_booked_time}}
        </td>
        <td>{{if $item.rr_onsite_video}}<a href="{{$item.rr_onsite_video}}" target="_blank">Link {{/if}}</td>
        <td>{{$item.rr_price}} </td>
         
        <td>
        <form name="cal" method="post" enctype="multipart/form-data"> 
        <input type="hidden" name="rr_id" value="{{$item.rr_id}}"  />
        <input type="file" name="inspection_report" /><br />
        {{if $item.rr_inspection_report}}
        <div style="text-align:center;"> 
        
        <!--<a href="https://deckquote.s3.amazonaws.com/files/roofing_report/{{$item.rr_inspection_report}}" target="_blank">Download</a>-->
        <a href="/roofing_report.download_content?file_name={{$item.rr_inspection_report}}&module_name=roofing_report.home" target="_blank">Download</a>
        
        <a href="{{$BASE_URL}}roofing_report.delete_ir/rr_id/{{$item.rr_id}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img src="{{$BASE_URL}}/images/delete_icon.png" width="20" /></a>
         <br /> {{$item.rr_insp_report_user}} - {{$item.rr_insp_report_date}}
         </div> {{/if}}
        <input type= "submit" name="save_insprepo" title="Save" value="Upload" class="set2"> &nbsp; 
         {{if $item.rr_inspection_report_link}} <a href="{{$item.rr_inspection_report_link}}" target="_blank">View Link</a><br />
          {{$item.rr_insp_report_link_date}}<br />{{$item.rr_insp_report_link_user}}
         {{/if}} 
        </form>
        </td>
        
        <td>
        <form name="cal" method="post" enctype="multipart/form-data"> 
        <input type="hidden" name="rr_id" value="{{$item.rr_id}}"  />
        <input type="file" name="work_word" /><br />
        {{if $item.rr_work_prop_word}}
        <div style="text-align:center;">
         <!--<a href="https://deckquote.s3.amazonaws.com/files/roofing_report/{{$item.rr_work_prop_word}}" target="_blank">Download</a>-->
         <a href="/roofing_report.download_content?file_name={{$item.rr_work_prop_word}}&module_name=roofing_report.home" target="_blank">Download</a>
         
        <a href="{{$BASE_URL}}roofing_report.delete_ww/rr_id/{{$item.rr_id}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img src="{{$BASE_URL}}/images/delete_icon.png" width="20" /></a>
         <br /> {{$item.rr_work_prop_word_user}} - {{$item.rr_work_prop_word_date}}
        </div> {{/if}}
       <input type= "submit" name="save_workword" title="Save" value="Upload" class="set2"> &nbsp; 
        {{if $item.rr_work_prop_word_link}} <a href="{{$item.rr_work_prop_word_link}}" target="_blank">View Link</a><br />
        {{$item.rr_work_word_link_date}}<br />{{$item.rr_work_word_link_user}}
        {{/if}} 
        </form>
        </td>
        
        <td>
        <form name="cal" method="post" enctype="multipart/form-data"> 
        <input type="hidden" name="rr_id" value="{{$item.rr_id}}"  />
        <input type="file" name="work_pdf" /><br />
        {{if $item.rr_work_prop_pdf}}
        <div style="text-align:center;"> 
        
        <!--<a href="https://deckquote.s3.amazonaws.com/files/roofing_report/{{$item.rr_work_prop_pdf}}" target="_blank">Download</a>-->
        <a href="/roofing_report.download_content?file_name={{$item.rr_work_prop_pdf}}&module_name=roofing_report.home" target="_blank">Download</a>
        
        <a href="{{$BASE_URL}}roofing_report.delete_wp/rr_id/{{$item.rr_id}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img src="{{$BASE_URL}}/images/delete_icon.png" width="20" /></a>
         <br /> {{$item.rr_work_prop_pdf_user}} - {{$item.rr_work_prop_pdf_date}}
        </div> {{/if}}
        <input type= "submit" name="save_workpdf" title="Save" value="Upload" class="set2"> &nbsp; 
        {{if $item.rr_work_prop_pdf_link}} <a href="{{$item.rr_work_prop_pdf_link}}" target="_blank">View Link</a><br />
         {{$item.rr_work_pdf_link_date}}<br />{{$item.rr_work_pdf_link_user}}
        {{/if}}
        </form>
        </td>
        
        
        <td>
        <form name="cal3" method="post" enctype="multipart/form-data"> 
        <input type="hidden" name="rr_id" value="{{$item.rr_id}}"  />
        <input type="file" name="docusign" /><br />
        {{if $item.rr_docusign_agr}}
        <div style="text-align:center;"> 
        <!--<a href="https://deckquote.s3.amazonaws.com/files/roofing_report/{{$item.rr_docusign_agr}}" target="_blank">Download</a>-->
        <a href="/roofing_report.download_content?file_name={{$item.rr_docusign_agr}}&module_name=roofing_report.home" target="_blank">Download</a>
        
        <a href="{{$BASE_URL}}roofing_report.delete_ds/rr_id/{{$item.rr_id}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img src="{{$BASE_URL}}/images/delete_icon.png" width="20" /></a>
         <br /> {{$item.rr_docusign_agr_user}} - {{$item.rr_docusign_agr_date}}
        </div> {{/if}}
       <input type= "submit" name="save_docusign" title="Save" value="Upload" class="set2"> &nbsp; 
        {{if $item.rr_docusign_agr_link}} <a href="{{$item.rr_docusign_agr_link}}" target="_blank">View Link</a><br />
        {{$item.rr_ds_agr_link_date}}<br />{{$item.rr_ds_agr_link_user}}
        {{/if}}
        </form>
        </td>
        
        
        
        <td>
         <form name="prin" method="post" enctype="multipart/form-data"> 
        <input type="hidden" name="print_rr_id" value="{{$item.rr_id}}"  />
        <!--<input type="button" value="Print" onclick="document.location.href='{{$BASE_URL}}{{$XFA.home}}/print/{{$item.rr_id}}'" /><br />-->
        <input type="submit" name="print" value="Print" /><br />
        <input type="button" name="email"  value="Email" onclick="javascript:send_email({{$item.rr_id}});" /> 
       </form>
        </td>
         
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