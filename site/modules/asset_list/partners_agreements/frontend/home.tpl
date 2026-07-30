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
				'width': '75%',
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
var viewurl = "{{$BASE_URL}}partners_agreements.detail"+ "/random/" + Math.random();	
 $(document).ready(function () {
        $.fancybox({
				'width': '78%',
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
<br />
<table  width="100%"><tr><td></td><td>
<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
<div style="float:left;">
</td><td>
<!--<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Search:</strong>&nbsp;&nbsp;</span>
<input type="text" name="{{$TABLE}}[keyword]" value="{{$keyword}}" style="width:400px;"/>
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" value="Search" name="search"  />-->
 </div>
</form>
<div style="float:right;"> <input type="button" name="Add New " value="Add New" onclick="javascript:add_new();" /> </div>
</td></tr></table>

<div style="float:left; width:100%;">
  <table id="doclist-table" class="nav-back" width="100%">
    <thead>
      <tr>
      
        <th class="topmenu" align="center" valign="middle" width="12%">Company Name </th>
        <th class="topmenu" align="center" valign="middle" width="12%">Trading Name</th>
        <th class="topmenu" align="center" valign="middle" width="9%">Agreement</th>
        <th class="topmenu" align="center" valign="middle" width="9%">Price List </th>
        
        <th class="topmenu" align="center" valign="middle" width="9%">Quality assurance  </th>
        <th class="topmenu" align="center" valign="middle" width="9%">Licenses </th>
        <th class="topmenu" align="center" valign="middle" width="9%">Public Liability  </th>
        <th class="topmenu" align="center" valign="middle" width="9%">Workers Comp </th>
              

        <th class="topmenu" align="center" valign="middle" width="5%">Action</th>
      </tr>
    {{if $list}}
    <tbody>
    <form name="mlist" method="post">
      {{assign var=countn value= $numstartvounter}}
      {{foreach from=$list key="key" item="item"}}
      <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}" >
      
        <td>{{$item.pa_comp_name}}</td>
        <td>{{$item.pa_trading_name}}</td>
      
        {{if $item.pa_agreement}}
        <td>
            <span>Signed</span><br />
            <span> {{$item.pa_agreement_date}} <br />
            {{$item.count_ad}} Days <br />
            <a href ="{{$BASE_DIR}}files/air_bb_database/{{$item.pa_agreement}}" target="_blank">{{$item.pa_agreement}}</a> <br /> 
        </td>    
	     {{else}}
        <td style='background:#F00'> </td>
        {{/if}}
                              
         {{if $item.pa_price_list}}
     	   <td> 
            <span>Signed</span><br />
            <span> {{$item.pa_price_list_date}} <br />
            {{$item.count_pl}} Days <br />
            <a href ="{{$BASE_URL}}files/air_bb_database/{{$item.pa_price_list}}" target="_blank">{{$item.pa_price_list}} </a> <br /> 
      
        </td>
       {{else}}
        <td style='background:#F00'> </td>
        {{/if}}
       
        {{if $item.pa_quality_assurance}}
        <td>
      
            <span>Signed</span><br />
            <span> {{$item.pa_quality_assurance_date}} <br />
            {{$item.count_qa}} Days <br />
            <a href ="{{$BASE_URL}}files/air_bb_database/{{$item.pa_price_list}}" target="_blank">{{$item.pa_quality_assurance}} </a> <br /> 
         </td>
       {{else}}
        <td style='background:#F00'> </td>
        {{/if}}
        
      
       {{if $item.pa_licences_1 || $item.pa_licences_2 || $item.pa_licences_3}}
        <td>
       
        	 <span>Signed</span><br />
          	 <span> {{$item.pa_licences_1_date}} <br />
             {{$item.count_li_1}} Days <br />
       		 <a href ="{{$BASE_URL}}files/air_bb_database/{{$item.pa_licences_1}}" target="_blank">{{$item.pa_licences_1}}</a> 
             
         <br />  
        
        
        {{if $item.pa_licences_2}}
<!--         	<span>Signed</span><br />
        	<span> {{$item.pa_licences_2_date}} <br />
            {{$item.count_li_2}} Days <br />-->
        	<a href ="{{$BASE_URL}}files/air_bb_database/{{$item.pa_licences_2}}" target="_blank">{{$item.pa_licences_2}}</a> 
           <!--  {{$item.count_li_2}} Days-->
           <br />  
        {{/if}}
     
        {{if $item.pa_licences_3}}
<!--        	 <span>Signed</span><br />
        	 <span> {{$item.pa_licences_3_date}} <br />-->
        	 <a href ="{{$BASE_URL}}files/air_bb_database/{{$item.pa_licences_3}}" target="_blank">{{$item.pa_licences_3}}</a> <br />
           <!--  {{$item.count_li_3}} Days-->
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
        	  <a href ="{{$BASE_URL}}files/air_bb_database/{{$item.pa_public_liability}}" target="_blank">{{$item.pa_public_liability}}</a> <br />
        {{else}}
        <td style='background:#F00'> </td>
        {{/if}}
        
        {{if $item.pa_workers_group}}
        <td>
        	 <span>Signed</span><br />
             <span> {{$item.pa_workers_group_date}} <br />
             {{$item.count_wg}} Days <br />
             <a href ="{{$BASE_URL}}files/air_bb_database/{{$item.pa_workers_group}}" target="_blank">{{$item.pa_workers_group}}</a> <br /> 
        {{else}}
        <td style='background:#F00'> </td>
        {{/if}}
 
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
  <script type="text/javascript">  
$(".shofiles").hover(function(){$(this).fadeOut(100);$(this).fadeIn(500);});
$(".shofiles").hover(
function () {
    $(this).addClass("hover");
  },
  function () {
    $(this).removeClass("hover");
  }
);
</script>
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