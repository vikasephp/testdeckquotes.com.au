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
	var viewurl = "{{$BASE_URL}}design_interface.view_procedure"+ "/random/" + Math.random();	

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
<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
    <td>
    
    &nbsp; &nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> 
    &nbsp;&nbsp;<strong>Design Booklet : </strong><input type="text" name="proc" value="{{$proc_detail.tl_link}}" style="width:700px" /> 
   <input type="submit" value="Update Link" name="update_link"  />
   <br />
    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Search By Design Type:</strong>&nbsp;&nbsp;</span>
    <input type="text" name="{{$TABLE}}[keyword]" value="{{$keyword}}" style="width:300px;"/>
    &nbsp;&nbsp;
    <input type="submit" value="Search" name="search"  />&nbsp;
     <input type="submit" value="Show Active/InActive" name="active_in"/> &nbsp;
     <input type="submit" value="Show Active Only" name="all"/> &nbsp; <br />
     <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Search By Design Number:</strong>&nbsp;&nbsp;</span>
    <input type="text" name="ser_dn" value="" style="width:280px;"/>&nbsp;&nbsp;&nbsp;
    <input type="submit" value="Search" name="search"  />
    <input type="submit" value="Clear Search" name="clear"  /> <br />
    
     <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Search By Checklist Number:</strong>&nbsp;&nbsp;</span>
    <input type="text" name="ser_checklist" value="" style="width:280px;"/>&nbsp;&nbsp;&nbsp;
    <input type="submit" value="Search" name="search"  />
    <input type="submit" value="Clear Search" name="clear"  /> <br />
    
    
    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Search By Project Address:</strong>&nbsp;&nbsp;</span>
    <input type="text" name="ser_project" value="" style="width:280px;"/>&nbsp;&nbsp;&nbsp;
    <input type="submit" value="Search" name="search"  />
    <input type="submit" value="Clear Search" name="clear"  />
    
	&nbsp; &nbsp; <span style="border:1px solid #0CF; padding:3px;"> 7 Days Design Uploaded on website  : {{if $designnumbers_data_weekly}}{{$designnumbers_data_weekly.weekly_total}}{{/if}} </span>
	&nbsp; &nbsp; <span style="border:1px solid #0CF; padding:3px;"> YTD Design Uploaded on website : {{if $designnumbers_data_ytd}}{{$designnumbers_data_ytd.ytd_total}}{{/if}} </span>
    </td>
    <td>
    <div style="float:right;">
    <input type="Submit"  name="merge_report" value="QR Code Merge Report"  /> &nbsp;
    <input type="button" value="Export To XLS" onclick="document.location.href='{{$BASE_URL}}{{$XFA.home}}/export/1'" /> &nbsp;
    <input type="button" name="Email " value="Email" onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.email}}');" />
    <input type="button" name="Add New " value="Add New" onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.detail}}');" />
    </div>
    </td>
    </form>
</tr>

</table>
<div id="">
    <table id="list-table" class="nav-back" width="100%" >
        <thead>
            <tr>
                <th class="topmenu" align="center" valign="middle" width="2%">Id</th>   
                <th class="topmenu" align="center" valign="middle" width="4%">Design Number</th> 
                <th class="topmenu" align="center" valign="middle" width="5%">Design Type</th>
                <th class="topmenu" align="center" valign="middle" width="4%">Active</th>
                <th class="topmenu" align="center" valign="middle" width="3%">Live WWW</th>
                <th class="topmenu" align="center" valign="middle" width="3%">Project Link</th>
                <th class="topmenu" align="center" valign="middle" width="3%">MS Team Link</th> 
                <th class="topmenu" align="center" valign="middle" width="3%">In Booklet</th>
                <th class="topmenu" align="center" valign="middle" width="3%">Online</th>
                <th class="topmenu" align="center" valign="middle" width="3%">Date Audited</th>
                <th class="topmenu" align="center" valign="middle" width="5%">Brochure Correct</th>
                <th class="topmenu" align="center" valign="middle" width="5%">Online Correct</th>
                <th class="topmenu" align="center" valign="middle" width="5%">Total Price</th>
                <th class="topmenu" align="center" valign="middle" width="5%">Build Price</th>
                <th class="topmenu" align="center" valign="middle" width="5%">Sitework Price</th>
                <th class="topmenu" align="center" valign="middle" width="5%">Planning Price</th>
                <th class="topmenu" align="center" valign="middle" width="5%">Connector Value</th>
                <th class="topmenu" align="center" valign="middle" width="5%">GP Value</th>
                <th class="topmenu" align="center" valign="middle" width="2%">Audited</th>
                <th class="topmenu" align="center" valign="middle" width="2%">Checklist<br />Number</th>
                <th class="topmenu" align="center" valign="middle" width="2%">Project Address</th>
                <th class="topmenu" align="center" valign="middle" width="10%">Master Calc</th>
                <th class="topmenu" align="center" valign="middle" width="8%">Proposal</th>
                <th class="topmenu" align="center" valign="middle" width="8%">Brochure </th>
                <th class="topmenu" align="center" valign="middle" width="8%">Full Brochure </th>
                <th class="topmenu" align="center" valign="middle" width="8%">Design<br />Summary </th>
                <th class="topmenu" align="center" valign="middle" width="8%">Operation Calculator</th>
                <th class="topmenu" align="center" valign="middle" width="5%">Ms Team </th>
                <th class="topmenu" align="center" valign="middle" width="5%">Print</th> 
                <th class="topmenu" align="center" valign="middle" width="2%">Action</th>   
            </tr>
        </thead>
<tbody>
 {{foreach from=$list key="key" item="item"}}
 <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">

    <td>{{counter}}</td>
    <td>{{$item.di_design_number}}</td> 
    <td>{{$item.di_design_type}} </td>
    
    <td>
       
    <form name ="recmet3" method="post" action="">
    <input type="hidden" name="active[{{$item.di_id}}]" value="No" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="active[{{$item.di_id}}]" value="Yes"  onclick="this.form.submit();" {{if $item.di_active eq 'Yes' }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form>
    
    </td>
    
    <td>{{if $item.di_cgfb_design_link}}<a href = '{{$item.di_cgfb_design_link}}' target="_blank">Link</a>{{/if}} </td>
    <td>{{if $item.di_project_link}}<a href = '{{$item.di_project_link}}' target="_blank">Link</a>{{/if}} </td>
      <td>{{if $item.di_msteam_link}} <a href="{{$item.di_msteam_link}}" target="_blank">Link</a>{{/if}}</td>
    
    <td {{if $item.di_in_booklet eq 'No'}} style="background:#F00" {{/if}}>

      
    <form name ="recmet3" method="post" action="">
    <input type="hidden" name="booklet[{{$item.di_id}}]" value="No" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="booklet[{{$item.di_id}}]" value="Yes"  onclick="this.form.submit();" {{if $item.di_in_booklet eq 'Yes' }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form>
   {{$item.di_in_booklet_user}}<br />{{$item.di_in_booklet_date}} 

    
     </td>
     
     <td>
      <form name ="recmet3" method="post" action="">
     	<input type="hidden" name="online[{{$item.di_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="online[{{$item.di_id}}]" value="1"  onclick="this.form.submit();" {{if $item.di_online eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form> 
       {{$item.di_online_user}}<br />{{$item.di_online_date}} 
     </td>
    <td> 
    <form name ="recmet" method="post" action="">
        <input type="text" name="date_added[{{$item.di_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo1_{{$item.di_id}}" value="{{$item.di_date_added}}" style="width:68px"  /> 
        <input type="submit" value="Set" name="myob" class="set" /><br />
      {{if $item.di_date_added}}{{$item.di_date_added_user}}<br />{{$item.di_date_added_date}} {{/if}}       
    </form>         
    </td>
    
    <td {{if $item.di_brochure_online eq 'Yes'}} style="background:#FF0" {{elseif $item.di_brochure_online eq 'No'}} style="background:#F00" {{/if}} >
     <select name="brochure" Onchange = "update_brochure({{$item.di_id}},this.value)">
     <option value="">TBC</option> 
     <option value="Yes" {{if $item.di_brochure_online eq 'Yes'}} selected="selected" {{/if}}>Yes</option> 
     <option value="No"  {{if $item.di_brochure_online eq 'No'}} selected="selected"  {{/if}}>No</option> 
    </select>
     <div id="pu{{$item.di_id}}">
     {{if $item.di_brochure_online}}{{$item.di_brochure_online_user}}<br />
     {{$item.di_brochure_online_date}}
     {{/if}}
     </div>
     <script>
	   
        function update_brochure(id,value)
		{
		var tana16 = "#pu"+id;
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}design_interface.update_brochure/di_id/"+id+"/value/"+value,
				   success: function(result){
					   $(tana16).html(result);
			   }
			 });
		
		}
	
       </script>
     </td>
   
   <td {{if $item.di_online_correct eq 'Yes'}} style="background:#FF0" {{elseif $item.di_online_correct eq 'No'}} style="background:#F00" {{/if}} >
     <select name="brochure" Onchange = "update_online_correct({{$item.di_id}},this.value)">
     <option value="">TBC</option> 
     <option value="Yes" {{if $item.di_online_correct eq 'Yes'}} selected="selected" {{/if}}>Yes</option> 
     <option value="No"  {{if $item.di_online_correct eq 'No'}} selected="selected"  {{/if}}>No</option> 
    </select>
     <div id="oc{{$item.di_id}}">
     {{if $item.di_online_correct}}{{$item.di_online_correct_user}}<br />
     {{$item.di_online_correct_date}}
     {{/if}}
     </div>
     <script>
	   
        function update_online_correct(id,value)
		{
		var tana17 = "#oc"+id;
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}design_interface.update_online_correct/di_id/"+id+"/value/"+value,
				   success: function(result){
					   $(tana17).html(result);
			   }
			 });
		
		}
	
       </script>
     </td>
   
    
    <td>{{$item.total_price}} <br /> {{$item.last_priced}}</td>
    <td>{{$item.build_price}}<br />{{$item.build_price_date}} </td>
    <td>{{$item.siteworks_price}}<br />{{$item.sitework_date}} </td>
    <td>{{$item.planning_price}}<br />{{$item.planning_date}} </td>
    <td>{{$item.rounded_connector_value}}<br />{{$item.rouconvalue_date}} </td>
    <td>{{$item.gp_value}} <br /> {{$item.gp_date}}</td> 
    <td>{{$item.di_audited}}</td>
    <td>{{$item.di_checklist_number|replace:',':',<br />'}}</td>
    <td>{{$item.di_project_address}}</td>
    <td>{{if $item.di_master_project_calculator}}
<!--    <a href = 'https://deckquote.s3.amazonaws.com/files/design_interface/{{$item.di_master_project_calculator}}'>Download</a><br />{{$item.di_master_project_calculator_date}}-->
  
      <a href = '/design_interface.download_content?file_name={{$item.di_master_project_calculator}}&module_name=design_interface.home'>Download</a><br />{{$item.di_master_project_calculator_date}}{{/if}}  
    
    </td>     
    <td>{{if $item.di_proposal}}
    <!--<a href = 'https://deckquote.s3.amazonaws.com/files/design_interface/{{$item.di_proposal}}'>Download</a>-->
    <a href = '/design_interface.download_content?file_name={{$item.di_proposal}}&module_name=design_interface.home'>Download</a>
    
    <br />{{$item.di_proposal_date}}
    {{/if}}</td>
     
    <td>{{if $item.di_brochure}}
  <!--  <a href = 'https://deckquote.s3.amazonaws.com/files/design_interface/{{$item.di_brochure}}'>Download</a>-->
    <a href = '/design_interface.download_content?file_name={{$item.di_brochure}}&module_name=design_interface.home'>Download</a>
    
    <br />{{$item.di_brochure_date}}
    {{/if}}</td> 
    
    <td>{{if $item.di_full_brochure}}
    <!--<a href = 'https://deckquote.s3.amazonaws.com/files/design_interface/{{$item.di_full_brochure}}'>Download</a>-->
    <a href = '/design_interface.download_content?file_name={{$item.di_full_brochure}}&module_name=design_interface.home'>Download</a>
    
     <br />{{$item.di_full_brochure_date}}
    {{/if}}</td> 


     <td>{{if $item.di_design_summary}}
<!--     <a href = 'https://deckquote.s3.amazonaws.com/files/design_interface/{{$item.di_design_summary}}'>Download</a>-->
     <a href = '/design_interface.download_content?file_name={{$item.di_design_summary}}&module_name=design_interface.home'>Download</a>
     
     <br />{{$item.di_design_summary_date}}
    {{/if}}</td> 

        
   <td>{{if $item.di_operations_calculator}}
  <!-- <a href = 'https://deckquote.s3.amazonaws.com/files/design_interface/{{$item.di_operations_calculator}}'>Download</a>-->
   <a href = '/design_interface.download_content?file_name={{$item.di_operations_calculator}}&module_name=design_interface.home'>Download</a> 
   
   <br />{{$item.di_operations_calculator_date}}
   {{/if}}</td> 
    <td>{{if $item.di_msteam_link}}<a href = '{{$item.di_msteam_link}}' target="_blank">Link</a>{{/if}} </td>    
     
    <td><input type="button" value="Print" onclick="document.location.href='{{$BASE_URL}}{{$XFA.home}}/print/{{$item.di_id}}'" /></td>    
    <td><a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" title="Edit" >
    <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;<a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>
    
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