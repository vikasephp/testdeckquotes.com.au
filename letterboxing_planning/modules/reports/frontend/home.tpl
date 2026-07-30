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
				'width': '58%',
				'height': '75%',
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

		
			$(".addfile").fancybox({
				'width': '40%',
				'height': '30%',
				'autoScale': false,
				 'transitionIn' : 'elastic',
				 'transitionOut' : 'elastic',
				 'speedIn' : 300,
				 'speedOut' : 300,
				 'overlayShow' : true,
				 'hideOnOverlayClick':false,
				 'hideOnContentClick':false,
				 'type': 'iframe',
				 'scrolling': 'no' 
			});

	$(".shofile").fancybox({
				'width': '80%',
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
var viewurl = "{{$BASE_URL}}reports.detail"+ "/random/" + Math.random();	
 $(document).ready(function () {
        $.fancybox({
				'width': '98%',
				'height': '80%',
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


 var getcurrenturl= "{{$BASE_URL}}{{$XFA.home}}?mlbs_id="; // The server-side script
 
function handleHttpupdatelist() {   
        if (http.readyState == 4) {
              if(http.status == 200) {
                  var results=http.responseText;    			  
			  if(results !='')
			  	{
				
				window.location.reload();
				closeTop();
				}
            }
          }
        }
       
        function updatelist(id) { 

	     var mlbs_last_buyer_feedback = document.getElementById(id+'_mlbs_last_buyer_feedback').value;
		var mlbs_completedby = document.getElementById(id+'_mlbs_completedby').value;
		 var mlbs_update_date = document.getElementById(id+'_mlbs_update_date').value;
         var mlbs_notes = document.getElementById(id+'_mlbs_notes').value;
		var businessurl = getcurrenturl + id+'&mlbs_completedby=' + mlbs_completedby + '&mlbs_update_date=' +mlbs_update_date +'&mlbs_last_buyer_feedback='+mlbs_last_buyer_feedback+'&mlbs_notes='+mlbs_notes+ '&random=' + Math.random();

			http.open("GET", businessurl, true);
            http.onreadystatechange = handleHttpupdatelist;
           	http.send(null);
			showTop();
        }

//////////////////////////////////////////////////
function getHTTPObject() {
			  var xmlhttp;
			
			  if(window.XMLHttpRequest){
				xmlhttp = new XMLHttpRequest();
			  }
			  else if (window.ActiveXObject){
				xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
				if (!xmlhttp){
					xmlhttp=new ActiveXObject("Msxml2.XMLHTTP");
					}
				}
			  return xmlhttp; 
			}
			var http = getHTTPObject(); 
// We create the HTTP Object

function close_win()
	{
	$.fancybox.close();
	window.location.reload();
	}
</script>
<h3 class="page-title">{{$title}}</h3>
<div style="float:left; width:80%;">
<form name="mlist" method="post" action="{{$BASE_URL}}{{$XFA.home}}">
<input type="hidden" name="reportgen" value="reportgen" />
<table  width="100%">
  <tr>
    <td >
    <div >
    	{{if !$usergroup}}
    	<select name="filter[gen_user_id]" style="width:150px;">
        	<option value="all">-- All Users --</option>
        	{{foreach from=$users item="item" key="key"}}
    		<option value="{{$item.user_id}}" {{if $filters.gen_user_id == $item.user_id}} selected="selected" {{/if}}>{{$item.user_name}}</option>
            {{/foreach}}
    	</select>
       	{{/if}} 
       
      &nbsp; 
        <select name="filter[report_type]" >
         <option value="all" {{if $filters.report_type == 'All'}} selected="selected" {{/if}}>All</option>
        <option value="3" {{if $filters.report_type == 3}} selected="selected" {{/if}}>Selected Date</option>
    	<option value="1" {{if $filters.report_type == 1}} selected="selected" {{/if}}>24 Hour</option>
    	<option value="2" {{if $filters.report_type == 2}} selected="selected" {{/if}}>7 Day's</option>
    </select>
      &nbsp; 
        <input type="text" name="filter[fromdate]" value="{{$filters.fromdate}}" class="w16em dateformat-d-ds-m-ds-Y"/>&nbsp;&nbsp;
        <input type="text" name="filter[todate]" value="{{$filters.todate}}" class="w16em dateformat-d-ds-m-ds-Y"/>&nbsp;&nbsp;
        &nbsp;
      <select name="filter[ur_feature]" style="width:250px;">
        	{{foreach from=$report_filters item="item" key="key"}}
    		<option value="{{$key}}" {{if $filters.ur_feature == $key}} selected="selected" {{/if}}>{{$item}}</option>
            {{/foreach}}
      </select>  
    <input type="submit" name="Filter_Result" value="Filter Result" />
      </div></td>
  </tr>
</table>
</form>
</div>
<div style="float:right; width:20%; padding:0; "><input type="button" name="Report" onclick="javascript:add_new();" value="Generate Report" /></div>
<div style="float:left; width:100%;">
  <table id="doclist-table" class="nav-back" width="100%">
    <thead>
      <tr>
        <th class="topmenu" align="center" valign="middle" width="2%">No.</th>
        <th class="topmenu" align="center" valign="middle" width="35%">Report Name</th>
        <th class="topmenu" align="center" valign="middle" width="8%"><a href="{{$BASE_URL}}reports.home/field_name/user_name/ord/{{$ord}}">User Name</a></th>
        <th class="topmenu" align="center" valign="middle" width="8%"><a href="{{$BASE_URL}}reports.home/field_name/ur_type/ord/{{$ord}}">Report Type</a></th>
        <th class="topmenu" align="center" valign="middle" width="8%"><a href="{{$BASE_URL}}reports.home/field_name/ur_feature/ord/{{$ord}}">Filter Type</a></th>
        <th class="topmenu" align="center" valign="middle" width="8%"><a href="{{$BASE_URL}}reports.home/field_name/ur_type/ord/{{$ord}}">To Date</a></th>
        <th class="topmenu" align="center" valign="middle" width="8%"><a href="{{$BASE_URL}}reports.home/field_name/ur_type/ord/{{$ord}}">From Date</a></th>
         <th class="topmenu" align="center" valign="middle" width="8%"><a href="{{$BASE_URL}}reports.home/field_name/ur_timestamp/ord/{{$ord}}">Report Date</a></th>
        <th class="topmenu" align="center" valign="middle" width="5%">Action</th>
      </tr>
    {{if $list}}
    <tbody>
    
 
      {{foreach from=$list key="key" item="item"}}
      <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
        <td>{{counter}}.</td>
        <td>{{$item.ur_report_name}}</td>
         <td>{{$item.user_name|default:"All Users"}}</td>
         <td>{{foreach from=$report_types key="tid" item="typename"}}{{if $item.ur_type == $tid}}{{$typename}}{{/if}}{{/foreach}}</td>
         <td>{{foreach from=$report_filters key="fid" item="featurename"}}{{if $item.ur_feature == $fid}}{{$featurename}}{{/if}}{{/foreach}}</td>
         <td>{{$item.ur_start_date}}</td>
         <td>{{$item.ur_end_date}}</td>
        <td>{{$item.ur_timestamp|date_format:"%d-%m-%Y"}}</td>
    
        <td><a href="{{$BASE_URL}}{{$FILE_PATH}}files/user_reports/{{$item.ur_report_name}}" class="various" title="View"><img style="height: 25px;; width:25px" src="{{$BASE_URL}}css/admin/images/view.png"/></a>
        &nbsp;<a href="{{$BASE_URL}}{{$FILE_PATH}}files/user_reports/{{$item.ur_report_name}}" title="Download" target="_blank"><img style="height: 25px;; width:25px" src="{{$BASE_URL}}css/admin/images/download.png"/></a>
        </td>
      </tr>
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
</div>
