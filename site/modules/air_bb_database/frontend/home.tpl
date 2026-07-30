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
				'width': '85%',
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
var viewurl = "{{$BASE_URL}}air_bb_database.detail"+ "/random/" + Math.random();	
 $(document).ready(function () {
        $.fancybox({
				'width': '85%',
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

function add_procedure()
{
	var viewurl = "{{$BASE_URL}}air_bb_database.view_procedure"+ "/random/" + Math.random();	

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
&nbsp;&nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> <br />
 </div>
<div style="float:right;"> <input type="button" name="Add New " value="Add New" onclick="javascript:add_new();" /> </div>
</form>

<div style="float:left; width:100%;">
  <table id="doclist-table" class="nav-back" width="100%">
    <thead>
      <tr>
      
        <th class="topmenu" align="center" valign="middle" width="15%">Property Address</th>
        <th class="topmenu" align="center" valign="middle" width="25%">Agreement With Client</th>
        <th class="topmenu" align="center" valign="middle" width="15%">Business Case</th>
        <th class="topmenu" align="center" valign="middle" width="15%">P&L  Statements</th>
        
        <th class="topmenu" align="center" valign="middle" width="12%">Weekly Rent</th>
        <th class="topmenu" align="center" valign="middle" width="12%">Lease Expiry</th>

        <th class="topmenu" align="center" valign="middle" width="6%">Action</th>
      </tr>
    {{if $list}}
    <tbody>
    <form name="mlist" method="post">
      {{assign var=countn value= $numstartvounter}}
      {{foreach from=$list key="key" item="item"}}
      <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}" >
      
        <td>{{$item.ab_property_address}}</td>
        
        <td> 
        {{if $item.ab_aggr_with_client_1}}
        <!--  <a href ="https://deckquote.s3.amazonaws.com/files/air_bb_database/{{$item.ab_aggr_with_client_1}}" target="_blank">{{$item.ab_aggr_with_client_1}}</a> -->
          <a href="/air_bb_database.download_content?file_name={{$item.ab_aggr_with_client_1}}&module_name=air_bb_database.home" >{{$item.ab_aggr_with_client_1}}</a> <br /> 
        {{/if}}
        {{if $item.ab_aggr_with_client_2}}
        <a href="/air_bb_database.download_content?file_name={{$item.ab_aggr_with_client_2}}&module_name=air_bb_database.home" >{{$item.ab_aggr_with_client_2}}</a>
       <!-- <a href ="https://deckquote.s3.amazonaws.com/files/air_bb_database/{{$item.ab_aggr_with_client_2}}" target="_blank">{{$item.ab_aggr_with_client_2}}</a> -->
        <br /> 
        {{/if}}
        {{if $item.ab_aggr_with_client_3}}
        <a href="/air_bb_database.download_content?file_name={{$item.ab_aggr_with_client_3}}&module_name=air_bb_database.home" >{{$item.ab_aggr_with_client_3}}</a>
     <!--   <a href ="https://deckquote.s3.amazonaws.com/files/air_bb_database/{{$item.ab_aggr_with_client_3}}" target="_blank">{{$item.ab_aggr_with_client_3}}</a> --> {{/if}}
        </td>
  
        <td> 
        {{if $item.ab_business_case_1}}
        <a href="/air_bb_database.download_content?file_name={{$item.ab_business_case_1}}&module_name=air_bb_database.home" >{{$item.ab_business_case_1}}</a>
       <!-- <a href ="https://deckquote.s3.amazonaws.com/files/air_bb_database/{{$item.ab_business_case_1}}" target="_blank">{{$item.ab_business_case_1}} </a>  --> <br /> {{/if}}
        {{if $item.ab_business_case_2}}
        <a href="/air_bb_database.download_content?file_name={{$item.ab_business_case_2}}&module_name=air_bb_database.home" >{{$item.ab_business_case_2}}</a>
        <!--<a href ="https://deckquote.s3.amazonaws.com/files/air_bb_database/{{$item.ab_business_case_2}}" target="_blank">{{$item.ab_business_case_2}} </a>  --> <br /> {{/if}}
        {{if $item.ab_business_case_3}}
        <a href="/air_bb_database.download_content?file_name={{$item.ab_business_case_3}}&module_name=air_bb_database.home" >{{$item.ab_business_case_3}}</a>
        <!--<a href ="https://deckquote.s3.amazonaws.com/files/air_bb_database/{{$item.ab_business_case_3}}" target="_blank">{{$item.ab_business_case_3}} </a> -->  {{/if}}
        </td>
       
        <td>
        {{if $item.ab_pl_statement_1}}
        <a href="/air_bb_database.download_content?file_name={{$item.ab_pl_statement_1}}&module_name=air_bb_database.home" >{{$item.ab_pl_statement_1}}</a>
        <!-- <a href ="https://deckquote.s3.amazonaws.com/files/air_bb_database/{{$item.ab_pl_statement_1}}" target="_blank">{{$item.ab_pl_statement_1}}</a> --> <br /> {{/if}}
        {{if $item.ab_pl_statement_2}}
        <a href="/air_bb_database.download_content?file_name={{$item.ab_pl_statement_2}}&module_name=air_bb_database.home" >{{$item.ab_pl_statement_2}}</a>
       <!-- <a href ="https://deckquote.s3.amazonaws.com/files/air_bb_database/{{$item.ab_pl_statement_2}}" target="_blank">{{$item.ab_pl_statement_2}}</a> --> <br /> {{/if}}
        {{if $item.ab_pl_statement_3}}
        <a href="/air_bb_database.download_content?file_name={{$item.ab_pl_statement_3}}&module_name=air_bb_database.home" >{{$item.ab_pl_statement_3}}</a>
       <!-- <a href ="https://deckquote.s3.amazonaws.com/files/air_bb_database/{{$item.ab_pl_statement_3}}" target="_blank">{{$item.ab_pl_statement_3}}</a> --> {{/if}}
        </td>
	 <td>{{$item.ab_weekly_rent}} </td>
        <td> {{$item.ab_lease_expiry}}</td>
        <td><a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" class="various" title="Edit"> <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>
          <!-- {{if $USER_GROUP == 'Administrators'}} -->
          <a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}" onclick="javascript:if(!confirm('Are you sure want to delete this.')) return false;" title="Delete"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>
          <!--   {{/if}}-->
        </td>
        
        
        
      </tr>
      {{assign var=countn value=$countn+1}}
      {{/foreach}}
      </tbody>
      
    </form>
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