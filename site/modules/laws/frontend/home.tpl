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
var viewurl = "{{$BASE_URL}}{{$XFA.detail}}"+ "/random/" + Math.random();	
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

<table  width="100%"><tr><td>
<div style="float:right;"> <input type="button" name="Add New " value="Add New" onclick="javascript:add_new();" /> </div>
</td></tr></table>

<div style="float:left; width:100%;">
    <table id="doclist-table" class="nav-back" width="100%">
        <thead>
         <tr>	
            		<th class="topmenu" align="center" valign="middle" width="3%">UID.</th> 
            		<th class="topmenu" align="center" valign="middle" width="15%">Document Name</th>
                    <th class="topmenu" align="center" valign="middle" width="22%">Document Summary </th>
                    <th class="topmenu" align="center" valign="middle" width="5%">Effective Date Legislation</th>
                    <th class="topmenu" align="center" valign="middle" width="20%">Link</th>
<!--                <th class="topmenu" align="center" valign="middle" width="100">Business Stream</th>
                    <th class="topmenu" align="center" valign="middle" width="80">ACCESS </th>-->
                    <th class="topmenu" align="center" valign="middle" width="15%">Linked Documents </th> 
                    <!--<th class="topmenu" align="center" valign="middle" width="130">Last Updated </th>-->
                    <th class="topmenu" align="center" valign="middle" width="16%">Download document  </th>
                  	<th class="topmenu" align="center" valign="middle" width="5%">Action</th> 
           </tr>
          {{if $list}}  
        <tbody>
        <form name="mlist" method="post">
        	{{assign var=countn value= $numstartvounter}}
        {{foreach from=$list key="key" item="item"}}
            <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
            	<td>{{$item.bp_id}}.</td>
                <td>{{$item.bp_title}}</td>
                <td>{{$item.bp_summery|truncate:300:"...":true}}</td>
                <td>{{$item.bp_effective_date}}</td>
                <td>{{$item.bp_link}}</td>
<!--           <td>{{$item.bp_bus_streem}}</td>
               <td>{{if $item.bp_access == 1}}All Access{{else}}Users{{/if}}</td>-->
                <td></td>
<!--                <td>{{if $item.bp_last_update !== '0000-00-00 00:00:00'}}{{$item.bp_last_update|date_format:"%d/%m/%Y %H:%M"}}{{else}}
                  {{$item.bp_insert_date|date_format:"%d/%m/%Y %H:%M"}}{{/if}}</td>-->
                 <td>
                 <div style="float:left;">
                 <table cellpadding="0" cellspacing="5" id="doc_list"><tr>
              	{{counter start=1 print=false assign="count"}}
                 {{foreach from=$item.doc_files key="keyfiles" item="itemfiles"}}
                 	{{if !empty($itemfiles.bpd_name)}}  <td>       
            <ul  class="shofiles">
                    <li><img src="{{$itemfiles.iconpath}}" width="20" /> <br />
                      <a  class="shofilemenu">{{$itemfiles.bpd_name|truncate:"9"}}</a>
                      <ul class="small-menu">
                        
                     <!--  <li>{{if $itemfiles.bpd_docs_status == 0 }}
                        <a href="{{$BASE_URL}}{{$FILE_PATH}}files/{{$document_path}}/{{$itemfiles.bpd_name}}" title="{{$itemfiles.dhd_name}}" target="_blank" style="color:#FFFFFF;">{{else}}<a href="{{$BASE_URL}}dochub.open/fileid/{{$itemfiles.bpd_docs_path}}"  class="shofile" style="color:#FFFFFF;" >{{/if}}View/Edit</a></li>-->

                       <li>{{if $itemfiles.bpd_docs_status == 0}}
                       <a href="{{$BASE_URL}}{{$FILE_PATH}}files/{{$document_path}}/{{$itemfiles.bpd_name}}?dummy={{$ran}}" title="{{$itemfiles.dhd_name}}" target="_blank" style="color:#FFFFFF;">
    <a href="/laws.download_content?file_name={{$itemfiles.bpd_name}}&module_name=laws.home" target="_blank"/>Download</a>
                       
                       {{else}}<a href="{{$BASE_URL}}dochub.open/download/1/fileid/{{$itemfiles.bpd_docs_path}}?dummy={{$ran}}" title="Start Download" style="color:#FFFFFF;">{{/if}}Download</a></li>
                      	
                        	</ul>
                    	</li>
                  	</ul>
                  </td>{{/if}}
                 {{if $count % 4 == 0}}</tr><tr>
                 {{/if}}
                 {{counter}}
                 {{/foreach}}
               	</tr>
                 </table>
                 </div>
                 <div style="float:right;">
                 <table><tr><td>
                 <a href="{{$BASE_URL}}{{$XFA.upload}}/{{$ID}}/{{$item.$ID}}" title="Quick Add New" class="addfile">
                    <img src="{{$BASE_URL}}images/add_files.png" width="20" /></a><br />
                    <a href="{{$BASE_URL}}{{$XFA.upload}}/{{$ID}}/{{$item.$ID}}" title="Quick Add New" class="addfile">New</a>
                    </td>
                    </tr>
                    </table>
                    </div>
                 </td>
				<td><a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" class="various" title="Edit">
                <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>
     <!-- {{if $USER_GROUP == 'Administrators'}} -->          
     <a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}" onclick="javascript:if(!confirm('Are you sure want to delete? Because it will delete all the document related to this listing.')) return false;" title="Delete"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>
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
    <tr>  
  {{if $list}}   
<td align="center">

 <div class='pagination'>
 {{if $pagenum == 1}}
 <span class='disabled'>« previous</span>
 {{else}}
<a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{math equation="x - y" x=$pagenum y=1}}" title="Previous">« previous</a>
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
<span class='disabled'>next »</span>
 {{else}}
<a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{math equation="x + y" x=$pagenum y=1}}" title="Next">next »</a></div>
 {{/if}}
</td>
{{else}}
<td align="center" height="300">Record Not found... </td>
{{/if}}
 </tr>
</table> 
{{/if}}
</div>
