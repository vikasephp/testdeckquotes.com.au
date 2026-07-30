<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/default.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/tree/simpletreemenu.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tree/simpletree.css" />
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
				'width': '95%',
				'height': '90%',
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

function add_new()
 {
var viewurl = "{{$BASE_URL}}partners_agreements.detail"+ "/random/" + Math.random();	
 $(document).ready(function () {
        $.fancybox({
				'width': '95%',
				'height': '90%',
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
	var viewurl = "{{$BASE_URL}}partners_agreements.viewtype"+ "/random/" + Math.random();	

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
	var viewurl = "{{$BASE_URL}}partners_agreements.view_procedure"+ "/random/" + Math.random();	

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


function close_win()
	{
	$.fancybox.close();
	window.location.reload();
	}
</script>

<style>

#fancybox-wrap {z-index:9999999;} 
</style>

<h3 class="page-title">{{$title}}</h3>
<br />

<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
<div style="float:left;">
&nbsp;&nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> 
&nbsp;&nbsp;<input type="button" name="Add New" value="Add Type Options" onclick="javascript:add_type();" /> 
<!--<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Search:</strong>&nbsp;&nbsp;</span>
<input type="text" name="{{$TABLE}}[keyword]" value="{{$keyword}}" style="width:400px;"/>
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" value="Search" name="search"  />-->
 </div>
</form>
<div style="float:right;"> <input type="button" name="Add New " value="Add New" onclick="javascript:add_new();" /> </div>


<div style="float:left; width:100%;">
  <table id="doclist-table" class="nav-back" width="100%">
    <thead>
      <tr>
      
        <th class="topmenu" align="center" valign="middle" width="12%">Company Name </th>
        <th class="topmenu" align="center" valign="middle" width="12%">Trading Name</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Position Open</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Quality and Tolerance</th>
        <th class="topmenu" align="center" valign="middle" width="9%">Type</th>
        <th class="topmenu" align="center" valign="middle" width="9%">Agreement</th>
        <th class="topmenu" align="center" valign="middle" width="9%">Price List </th>
        <th class="topmenu" align="center" valign="middle" width="9%">Quality assurance  </th>
        <th class="topmenu" align="center" valign="middle" width="9%">Licenses </th>
        <th class="topmenu" align="center" valign="middle" width="9%">Public Liability  </th>
        <th class="topmenu" align="center" valign="middle" width="9%">Workers Comp </th>
        <th class="topmenu" align="center" valign="middle" width="7%">Survey Links </th>     

        <th class="topmenu" align="center" valign="middle" width="5%">Action</th>
      </tr>
    {{if $list}}
    <tbody>
  
      {{assign var=countn value= $numstartvounter}}
      {{foreach from=$list key="key" item="item"}}
      <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}" >
      
        <td>{{$item.pa_comp_name}}</td>
        <td>{{$item.pa_trading_name}}</td>
        <td>{{if $item.pa_position_open eq 1 }} Yes {{else}} No {{/if}}</td>
        <td>{{if $item.pa_q_and_t}} 
      <!--  <a href="{{$BASE_URL}}files/air_bb_database/{{$item.pa_q_and_t}}" target="_blank">Download</a>-->
      <a href="/partners_agreements.download_content?file_name={{$item.pa_q_and_t}}&module_name=partners_agreements.home" target="_blank"/>Download</a>
        {{/if}}</td>
        <td>
          <form name="mlist" method="post">
        <select name="{{$TABLE}}[pa_type]" onchange="update_type({{$item.pa_id}},this.value)"/>
      	    <option value="-1">Please Select</option>
         {{foreach from=$typeoptions key="key2" item="item2"}}
            <option value="{{$item2.it_id}}" {{if $item.pa_type eq $item2.it_id}} selected="selected" {{/if}}>
            {{$item2.it_type}}
            </option>
         {{/foreach}}
           </form>
        <script language="javascript">
   		
		function update_type(id,value)
		{
			
			$.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}partners_agreements.update_type/pa_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
					
		}    
    </script>    
        
        </td>
        {{if $item.pa_agreement}}
        <td>
            <span>Signed</span><br />
            <span> {{$item.pa_agreement_date}} <br />
            {{$item.count_ad}} Days <br />
           <!-- <a href ="{{$BASE_DIR}}files/air_bb_database/{{$item.pa_agreement}}" target="_blank">{{$item.pa_agreement}}</a> -->
      <a href="/partners_agreements.download_content?file_name={{$item.pa_agreement}}&module_name=partners_agreements.home" target="_blank"/>Download</a>       
            <br /> 
        </td>    
	     {{else}}
        <td style='background:#F00'> </td>
        {{/if}}
                              
         {{if $item.pa_price_list}}
     	   <td> 
            <span>Signed</span><br />
            <span> {{$item.pa_price_list_date}} <br />
            {{$item.count_pl}} Days <br />
          <!--  <a href ="{{$BASE_URL}}files/air_bb_database/{{$item.pa_price_list}}" target="_blank">{{$item.pa_price_list}} </a> -->
     <a href="/partners_agreements.download_content?file_name={{$item.pa_price_list}}&module_name=partners_agreements.home" target="_blank"/>Download</a>         
            <br /> 
      
        </td>
       {{else}}
        <td style='background:#F00'> </td>
        {{/if}}
       
        {{if $item.pa_quality_assurance}}
        <td>
      
            <span>Signed</span><br />
            <span> {{$item.pa_quality_assurance_date}} <br />
            {{$item.count_qa}} Days <br />
            <!--<a href ="{{$BASE_URL}}files/air_bb_database/{{$item.pa_quality_assurance}}" target="_blank">{{$item.pa_quality_assurance}} </a> -->
    <a href="/partners_agreements.download_content?file_name={{$item.pa_quality_assurance}}&module_name=partners_agreements.home" target="_blank"/>Download</a>        
            <br /> 
         </td>
       {{else}}
        <td style='background:#F00'> </td>
        {{/if}}
        
      
       {{if $item.pa_licences_1 || $item.pa_licences_2 || $item.pa_licences_3}}
        <td>
       
        	 <span>Signed</span><br />
          	 <span> {{$item.pa_licences_1_date}} <br />
             {{$item.count_li_1}} Days <br />
       		 <!--<a href ="{{$BASE_URL}}files/air_bb_database/{{$item.pa_licences_1}}" target="_blank">{{$item.pa_licences_1}}</a> -->
           <a href="/partners_agreements.download_content?file_name={{$item.pa_licences_1}}&module_name=partners_agreements.home" target="_blank"/>Download</a>      
         <br />  
        
        
        {{if $item.pa_licences_2}}

        	<!--<a href ="{{$BASE_URL}}files/air_bb_database/{{$item.pa_licences_2}}" target="_blank">{{$item.pa_licences_2}}</a> -->
            <a href="/partners_agreements.download_content?file_name={{$item.pa_licences_2}}&module_name=partners_agreements.home" target="_blank"/>Download</a>    
           <br />  
        {{/if}}
     
        {{if $item.pa_licences_3}}

    <!--   <a href ="{{$BASE_URL}}files/air_bb_database/{{$item.pa_licences_3}}" target="_blank">{{$item.pa_licences_3}}</a>-->
      <a href="/partners_agreements.download_content?file_name={{$item.pa_licences_3}}&module_name=partners_agreements.home" target="_blank"/>Download</a>
  
        {{/if}}
        </td>
        {{else}}
        
        <td style='background:#F00'> </td>
        {{/if}}
 
 		{{if $item.pa_public_liability}}
        <td>
        
      		 <span>Signed</span><br />
             <span> {{$item.pa_public_liability_date}} <br />
             {{$item.count_puli}} Days <br />
        	 <!-- <a href ="{{$BASE_URL}}files/air_bb_database/{{$item.pa_public_liability}}" target="_blank">{{$item.pa_public_liability}}</a>-->
 <a href="/partners_agreements.download_content?file_name={{$item.pa_public_liability}}&module_name=partners_agreements.home" target="_blank"/>Download</a>
               
              
        {{else}}
        <td style='background:#F00'> </td>
        {{/if}}
        
        {{if $item.pa_workers_group}}
        <td>
        	 <span>Signed</span><br />
             <span> {{$item.pa_workers_group_date}} <br />
             {{$item.count_wg}} Days <br />
           <!--  <a href ="{{$BASE_URL}}files/air_bb_database/{{$item.pa_workers_group}}" target="_blank">{{$item.pa_workers_group}}</a>-->
  <a href="/partners_agreements.download_content?file_name={{$item.pa_workers_group}}&module_name=partners_agreements.home" target="_blank"/>Download</a>
            
        {{else}}
        <td style='background:#F00'> </td>
        {{/if}}
 
 	<td>
        {{if $item.pa_survey_link_1}} <a href="{{$item.pa_survey_link_1}}" target="_blank">Link</a> &nbsp;{{/if}}
        {{if $item.pa_survey_link_2}} <a href="{{$item.pa_survey_link_2}}" target="_blank">Link</a> &nbsp;{{/if}}
        {{if $item.pa_survey_link_3}} <a href="{{$item.pa_survey_link_3}}" target="_blank">Link</a><br />{{/if}}
        {{if $item.pa_survey_link_4}} <a href="{{$item.pa_survey_link_4}}" target="_blank">Link</a> &nbsp;{{/if}}
        {{if $item.pa_survey_link_5}} <a href="{{$item.pa_survey_link_5}}" target="_blank">Link</a> &nbsp;{{/if}}
        </td>
 
        <td><a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" class="various" title="Edit"> <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>
          <!-- {{if $USER_GROUP == 'Administrators'}} -->
          <a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}" onclick="javascript:if(!confirm('Are you sure want to delete this.')) return false;" title="Delete"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>
          <!--   {{/if}}-->
        </td>
      </tr>
      {{assign var=countn value=$countn+1}}
      {{/foreach}}
      </tbody>
      
  
    {{/if}}
  </table>

  {{if $last > 1}}
  <table width="90%" border="0" cellpadding="0" cellspacing="0">
    <tr> {{if $list}}
      <td align="center"><div class='pagination'> {{if $pagenum == 1}} <span class='disabled'>« previous</span> {{else}} <a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{math equation="x - y" x=$pagenum y=1}}" title="Previous">« previous</a> {{/if}}
          
          {{if $pagenum != 1}} <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/1" title="{{$page_num}} Page">1</a></span> {{else}}<span class='current'>1</span> {{/if}}{{if $pagenum != 2}} <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/2" title="{{$page_num}} Page">2</a></span> {{else}}<span class='current'>2</span> {{/if}}
          {{if $paginateprev.0 > 3}}
          ...
          {{/if}}
          {{foreach from=$paginateprev key="page_key" item="page_num"}}
          {{if $page_num == $pagenum OR $page_num <= 2}}
          {{elseif $page_num == $lastone}}
          
          {{else}} <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$page_num}}" title="{{$page_num}} Page">{{$page_num}}</a></span> {{/if}}
          {{/foreach}}
          
          {{foreach from=$paginatenext key="page_key" item="page_num2"}}
          {{if $page_num2 < $last AND $page_num2 != $lastone}}
          {{if $page_num2 == 1}}
          {{elseif $page_num2 == 2}}
          {{else}}
          {{if $page_num2 == $pagenum OR $page_num2 <= 0}} <span class='current'> {{$page_num2}}</span> {{else}} <a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$page_num2}}" title="{{$page_num2}} Page">{{$page_num2}}</a> {{/if}}
          {{/if}}     
          {{/if}}
          {{/foreach}}
          {{if $page_num2 < $lasttow}}
          ...
          {{/if}}
          {{if $lastone == 1}}
          {{elseif $lastone == 2}}
          {{else}}
          {{if $pagenum == $lastone }} <span class='current'>{{$lastone}}</span> {{else}} <a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$lastone}}" title="{{$lastone}} Page">{{$lastone}}</a> {{/if}}
          {{/if}}
          {{if $last == 1}}
          {{elseif $last == 2}}
          {{else}}
          {{if $pagenum == $last}} <span class='current'>{{$last}}</span> {{else}} <a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$last}}" title="{{$last}} Page">{{$last}}</a> {{/if}}
          {{/if}}
          {{if $pagenum == $last}} <span class='disabled'>next »</span> {{else}} <a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{math equation="x + y" x=$pagenum y=1}}" title="Next">next »</a></div>
        {{/if}} </td>
      {{else}}
      <td align="center" height="300">Record Not found... </td>
      {{/if}} </tr>
  </table>
  {{/if}} <br />
  <br />
  <table id="doclist-table"  width="100%" bgcolor="#d3e8d6">
    <thead>
  
      <tr>
        <td colspan="2">&nbsp;</td>
      </tr>
    </thead>
  </table>
</div>