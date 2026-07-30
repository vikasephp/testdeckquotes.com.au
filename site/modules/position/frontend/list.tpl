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
				'width': '78%',
				'height': '97%',
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

		
			$(".addnotes").fancybox({
				'width': '48%',
				'height': '57%',
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

		
		});

function add_new()
 {
var viewurl = "{{$BASE_URL}}sellerlisting.detail"+ "/random/" + Math.random();	
 $(document).ready(function () {
        $.fancybox({
				'width': '78%',
				'height': '97%',
				'autoScale': false,
				 'transitionIn' : 'elastic',
				 'transitionOut' : 'elastic',
				 'speedIn' : 300,
				 'speedOut' : 300,
				 'overlayShow' : true,
				 'hideOnOverlayClick':false,
				 'hideOnContentClick':false,
				 'type': 'iframe',
				 'href': viewurl,
				 'scrolling': 'yes' 
			
        });
});
}


function view()
 {
var viewurl = "{{$BASE_URL}}sellerlisting.detail"+ "/random/" + Math.random();	
 $(document).ready(function () {
        $.fancybox({
				'width': '78%',
				'height': '97%',
				'autoScale': false,
				 'transitionIn' : 'elastic',
				 'transitionOut' : 'elastic',
				 'speedIn' : 300,
				 'speedOut' : 300,
				 'overlayShow' : true,
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




<div class="page-title" style="height:50px;">{{$title}}</div>
<div style="float:left; width:100%;">

 {{if $list}}
 <table  width="100%">
  <tbody>
 	<tr>
    	<td><input type="button" name="People_Panel" value="People Management Panel" onclick="document.location.href='{{$BASE_URL}}people_management.list'" /></td>
    	<td width="60%">&nbsp;</td>
        <td><input type="button" name="People_Panel" value="Position Management Panel" onclick="document.location.href='{{$BASE_URL}}position.list'" /></td>
        <td><input type="button" name="People_Panel" value="Add New Position" onclick="document.location.href='{{$BASE_URL}}position.detail'" /></td>
    </tr>
    </tbody>
 </table>
 
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>	
            		<th class="topmenu" align="center" valign="middle" width="2%">No.</th> 
            		<th class="topmenu" align="left" valign="middle" width="15%"><div align="left">Position:</div></th>
                    <th class="topmenu" align="left" valign="middle" width="20%"><div align="left">Position Description:</div></th>
                    <th class="topmenu" align="left" valign="middle"><div align="left">Position Reports to:</div></th>
                    <th class="topmenu" align="left" valign="middle"><div align="left">Position Leads:</div></th>
                     <th class="topmenu" align="left" valign="middle"><div align="left">Document:</div></th>
                     <th class="topmenu" align="left" valign="middle"><div align="left">Links:</div></th>
                    <th class="topmenu" align="left" valign="middle"><div align="left">Persons holding this position:</div></th>
               		<th class="topmenu" align="left" valign="middle" width="5%"><div align="left">Action:</div></th>
           </tr>
        <tbody>
        <form name="mlist" method="post">
        {{foreach from=$list key="key" item="item"}}
            <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
            	<td>{{counter}}.</td>
                <td><p>{{$item.p_name}}</p>     	</td>
                <td>{{$item.p_description}}</td>
                <td>{{$item.rp_name}}</td>
                <td> </td>
               
                <td>
                {{if $item.p_document}} 
                Position Agreement :  <a href="{{$BASE_URL}}/files/user_docs/{{$item.p_document}}">{{$item.p_document}} </a><br />
                {{/if}}
               
                {{if $item.p_relevant_award}} 
                Relevant Award :  <a href="{{$BASE_URL}}/files/user_docs/{{$item.p_relevant_award}}">{{$item.p_relevant_award}} </a><br />
                {{/if}}
   
               {{if $item.p_position_budget_tool}} 
               	Position Budgeting Tool :  <a href="{{$BASE_URL}}/files/user_docs/{{$item.p_position_budget_tool}}">{{$item.p_position_budget_tool}} </a><br />
               {{/if}}
                
               {{if $item.p_advertising_text}} 
               	Advertising Text :  <a href="{{$BASE_URL}}/files/user_docs/{{$item.p_advertising_text}}">{{$item.p_advertising_text}} </a><br />
               {{/if}}
          
               {{if $item.p_letter_of_offer}} 
               	Letter of Offer :  <a href="{{$BASE_URL}}/files/user_docs/{{$item.p_letter_of_offer}}">{{$item.p_letter_of_offer}} </a><br />
               {{/if}}       
         
         
               {{if $item.p_learning_development}} 
                Learning and Development  :  <a href="{{$BASE_URL}}/files/user_docs/{{$item.p_learning_development}}">{{$item.p_learning_development}} </a><br />
               {{/if}} 
          
                </td>
                
                 <td> 
                  {{if $item.p_payrate_link}}Payrate Link : <a href="{{$item.p_payrate_link}}" target="_blank" >{{$item.p_payrate_link}} </a>
                  {{/if}} <br />
                 
                  {{if $item.p_adward_link}}Award Link : <a href="{{$item.p_adward_link}}" target="_blank" >{{$item.p_adward_link}} </a>
                  {{/if}} <br />
                 
                 </td>
                <td>{{if $item.u_name}}
                	{{foreach from=$item.u_name key="key1" item="item1"}}
                    <p>{{$item1.customer_name}}</p>
                    {{/foreach}}	
                 {{/if}}</td>

          <td><div align="left">
      <!--    <a href="{{$BASE_URL}}{{$XFA.view}}/user_id/{{$item.user_id}}" class="various" title="View"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/view.png"/></a>-->
          <a href="{{$BASE_URL}}{{$XFA.detail}}/p_id/{{$item.p_id}}"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a></div>
          
          </td>
          
            </tr>
        {{/foreach}}
        </tbody>
        </form>
    </table>
    {{/if}}

  {{if $last > 1}} 
    <table width="90%" border="0" cellpadding="0" cellspacing="0">   
    <tr>  
  {{if $list}}   
<td align="center">

 <div class='pagination'>
 {{if $pagenum == 1}}
 <span class='disabled'>« previous</span>
 {{else}}
<a class="pagination" href="{{$BASE_URL}}{{$XFA.list}}/pagenum/{{math equation="x - y" x=$pagenum y=1}}" title="Previous">« previous</a>
 {{/if}}
        
{{if $pagenum != 1}}
 <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.list}}/pagenum/1" title="{{$page_num}} Page">1</a></span>
 {{else}}<span class='current'>1</span>
 {{/if}}{{if $pagenum != 2}}
   <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.list}}/pagenum/2" title="{{$page_num}} Page">2</a></span>
{{else}}<span class='current'>2</span>
 {{/if}}
{{if $paginateprev.0 > 3}}
...
{{/if}}
{{foreach from=$paginateprev key="page_key" item="page_num"}}
	{{if $page_num == $pagenum OR $page_num <= 2}}
   		{{elseif $page_num == $lastone}}
    
    	{{else}} <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.list}}/pagenum/{{$page_num}}" title="{{$page_num}} Page">{{$page_num}}</a></span>
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
                        <a class="pagination"  href="{{$BASE_URL}}{{$XFA.list}}/pagenum/{{$page_num2}}" title="{{$page_num2}} Page">{{$page_num2}}</a>
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
<a class="pagination"  href="{{$BASE_URL}}{{$XFA.list}}/pagenum/{{$lastone}}" title="{{$lastone}} Page">{{$lastone}}</a>
{{/if}}
{{/if}}
{{if $last == 1}}
{{elseif $last == 2}}
{{else}}
{{if $pagenum == $last}}
<span class='current'>{{$last}}</span>
{{else}}
 <a class="pagination"  href="{{$BASE_URL}}{{$XFA.list}}/pagenum/{{$last}}" title="{{$last}} Page">{{$last}}</a>
{{/if}}
{{/if}}
{{if $pagenum == $last}}
<span class='disabled'>next »</span>
 {{else}}
<a class="pagination" href="{{$BASE_URL}}{{$XFA.list}}/pagenum/{{math equation="x + y" x=$pagenum y=1}}" title="Next">next »</a></div>
 {{/if}}
</td>
{{else}}
<td align="center" height="300">Record Not found... </td>
{{/if}}
 </tr>
</table> 
{{/if}}
</div>
