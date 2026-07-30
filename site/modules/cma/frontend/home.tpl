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
				'width': '68%',
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
var viewurl = "{{$BASE_URL}}{{$XFA.detail}}"+ "/random/" + Math.random();	
 $(document).ready(function () {
        $.fancybox({
				'width': '68%',
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


function oper_url(url)
 {
var viewurl = url;	
 $(document).ready(function () {
        $.fancybox({
				'width': '68%',
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

{{if $newpath}}
<script type="text/javascript">
	setTimeout("oper_url('{{$newpath}}');", 500);
</script>
{{/if}}
<h3 class="page-title">{{$title}}</h3>
<table  width="100%">
  <tr>
    <td><div style="float:left;">
    <form name="filter" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
    <strong>Location&nbsp;:-</strong>&nbsp;<select name="{{$TABLE}}[c_location]" class="lrg" style="width:150px;" onchange="submit();">
    		<option value="">--Select--</option>
       		 {{foreach from=$states key="key" item="item"}}
     	    <option value="{{$item.s_id}}" {{if $item.s_id == $detail.c_location}} selected="selected" {{/if}}> {{$item.s_shortcodes}} - {{$item.s_name}}</option>
      		{{/foreach}}
          </select>
        &nbsp;&nbsp;
        <select name="{{$TABLE}}[c_city]" class="lrg" style="width:150px;">
    		<option value="">--Select--</option>
       		 {{foreach from=$cities key="key" item="item"}}
     	    <option value="{{$item.s_id}}" {{if $item.s_id == $detail.c_city}} selected="selected" {{/if}}>{{$item.s_name}}</option>
      		{{/foreach}}
          </select>
        &nbsp;&nbsp;&nbsp;
        
     <strong>Industry&nbsp;:-</strong>&nbsp;<select name="{{$TABLE}}[c_industry]" class="lrg" style="width:150px;">
     <option value="">--Select--</option>
         {{foreach from=$industries key="key" item="item"}}
     	    <option value="{{$item.ind_id}}" {{if $item.ind_id == $detail.c_industry}} selected="selected" {{/if}}> {{$item.ind_name}}</option>
      		{{/foreach}}
          </select>
      &nbsp;&nbsp;&nbsp;
     <strong>Status&nbsp;:-</strong>&nbsp;<select name="{{$TABLE}}[c_status]" class="lrg" style="width:150px;">
     <option value="">--Select--</option>
            	{{foreach from=$status key="key" item="item"}}
            <option value="{{$item.st_id}}" {{if $item.st_id == $detail.c_status}} selected="selected" {{/if}}> {{$item.st_name}}</option>
          		{{/foreach}} 
          </select>
          &nbsp; 
          <input type="reset" value="Reset form" />
         &nbsp;&nbsp;<input type="button" name="genrate_report" onclick="javascript:oper_url('{{$BASE_URL}}cma.report');" value="Generate Report" />
          &nbsp;<br /><br />
         <strong>&nbsp;Price From&nbsp;:-&nbsp;</strong><input type="text" name="{{$TABLE}}[c_price_from]" value="{{$detail.c_price_from}}" size="20" maxlength="25" /> 
         <strong>&nbsp;Price To&nbsp;:-&nbsp;</strong><input type="text" name="{{$TABLE}}[c_price_to]" value="{{$detail.c_price_to}}" size="20" maxlength="25" />  
          &nbsp;<strong>Date From :- </strong><input type="text" name="{{$TABLE}}[c_date_listed_from]" value="{{$detail.c_date_listed_from}}" size="20" maxlength="25" class="w16em dateformat-d-ds-m-ds-Y" readonly="readonly"/>
           &nbsp;<strong>Date To :- </strong><input type="text" name="{{$TABLE}}[c_date_listed_to]" value="{{$detail.c_date_listed_to}}" size="20" maxlength="25" class="w16em dateformat-d-ds-m-ds-Y" readonly="readonly"/>
           &nbsp; <input type="submit" name="filter" value="Filter Your Result" />
           </form>
         </div>
      <div style="float:right;">
        <input type="button" name="Add New" value="Add New" onclick="javascript:add_new();" />
      </div></td>
  </tr>
</table>
<div style="float:left; width:100%;">
  <table id="doclist-table" class="nav-back" width="100%">
    <thead>
      <tr>
        <th class="topmenu" align="center" valign="middle" width="2%">No.</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Business Name</th>
        <th class="topmenu" align="center" valign="middle" width="6%">Status</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Creator</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Location</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Industry </th>
        <!--<th class="topmenu" align="center" valign="middle" width="14%">Long Description </th>-->
        <th class="topmenu" align="center" valign="middle" width="4%">Price</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Initial Price</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Sale Price </th>
        <th class="topmenu" align="center" valign="middle" width="5%">Date Listed </th>
        <th class="topmenu" align="center" valign="middle" width="6%">Date Exchanged </th>
        <th class="topmenu" align="center" valign="middle" width="4%">Date Sold</th>
        <th class="topmenu" align="center" valign="middle" width="15%">Images </th>
        <th class="topmenu" align="center" valign="middle" width="5%">Action</th>
      </tr>

    <tbody>

      {{assign var=countn value= $numstartvounter}}
      {{foreach from=$list key="key" item="item"}}
      <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
        <td>{{$countn}}.</td>
        <td>{{$item.c_business_name}}</td>
        <td>{{$item.st_name}}</a></td>
        <td>{{$item.creator}}</td>
        <td>{{$item.scode}} - {{$item.sname}} - {{$item.cname}}</td>
        <td>{{$item.ind_name}}</td>
  		<!--<td>{{$item.c_long_description|truncate:"100"}}</td>-->
       <td>{{$item.c_price}}</td>
       <td>{{$item.c_sale_price}}</td>
        <td>{{$item.c_initial_price}}</td>
        <td>{{if $item.c_date_listed == '0000-00-00' }}NA{{else}}{{$item.c_date_listed|date_format:"%d/%m/%Y"}}{{/if}}</td>
     <td>{{if $item.c_date_exchanged == '0000-00-00'}}NA {{else}}{{$item.c_date_exchanged|date_format:"%d/%m/%Y"}}{{/if}}</td>
      <td>{{if $item.c_date_sold == '0000-00-00' }}NA{{else}}{{$item.c_date_sold|date_format:"%d/%m/%Y"}}{{/if}}</td>
        <td><div style="float:left;">
            <table cellpadding="0" cellspacing="5" id="doc_list">
              <tr> {{counter start=1 print=false assign="count"}}
                {{foreach from=$item.c_images key="keyfiles" item="itemfiles"}}
                <td><a href="javascript:oper_url('{{$BASE_URL}}{{$FILE_PATH}}files/cma/{{$itemfiles.cma_name}}');" title="Start download">
                 <img src="{{$BASE_URL}}{{$FILE_PATH}}files/cma/{{$itemfiles.cma_name}}" width="40" /></a><br />
                <a href="javascript:oper_url('{{$BASE_URL}}{{$FILE_PATH}}files/cma/{{$itemfiles.cma_name}}');" title="{{$itemfiles.cma_name}}" >{{$itemfiles.cma_name|truncate:"9"}}</a> </td>
                {{if $count % 3 == 0}}</tr>
              <tr> {{/if}}
                {{counter}}
                {{/foreach}} </tr>
            </table>
          </div>
          <div style="float:right;">
            <table>
              <tr>
                <td><a href="{{$BASE_URL}}{{$XFA.upload}}/{{$ID}}/{{$item.$ID}}" title="Quick Add New" class="addfile">
                 <img src="{{$BASE_URL}}images/add_files.png" width="40" /></a><br />
                  <a href="{{$BASE_URL}}{{$XFA.upload}}/{{$ID}}/{{$item.$ID}}" title="Quick Add New" class="addfile">Add New</a> </td>
              </tr>
            </table>
          </div></td>
        <td><a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" class="various" title="Edit"> 
        <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>
        
        <a href="{{$BASE_URL}}{{$XFA.view}}/{{$ID}}/{{$item.$ID}}" class="addfile" title="Create Record"> 
        <img style="height: 15px;; width:15px" src="{{$BASE_URL}}images/bot_mid2.gif"/></a>
        
           {{if $USER_GROUP == 'Administrators'}} 
          <a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}" onclick="javascript:if(!confirm('Are you sure want to delete the list? Because it will delete all the document related to this listing.')) return false;" title="Delete"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>
          {{/if}}
        </td>
      </tr>
      {{assign var=countn value=$countn+1}}
      {{/foreach}}
      </tbody>
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
