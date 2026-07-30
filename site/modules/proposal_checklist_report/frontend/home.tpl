<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/default.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/tree/simpletreemenu.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tree/simpletree.css" />

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

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

		
			
		
		});


function show_notes(ssid)
{
	var viewurl = "{{$BASE_URL}}street_sign.show-notes-content"+ "/ss_id/" + ssid;	
	
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


function add_new()
 {
var viewurl = "{{$BASE_URL}}street_sign.detail"+ "/random/" + Math.random();	
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

function add_procedure()
{
	var viewurl = "{{$BASE_URL}}proposal_checklist_report.view_procedure"+ "/random/" + Math.random();	

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

.tableFixHead          { overflow-y: auto; height: 700px; }
.tableFixHead thead th { position: sticky; top: 0; text-align:left; }
table  { border-collapse: collapse; width: 100%; }
th     { z-index:9999; }
#fancybox-wrap {z-index:9999999;}
</style>

<h3 class="page-title">{{$title}}</h3>
<br />

<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
<div style="float:left; text-align:left;"> 
&nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> <br />
&nbsp; &nbsp; <strong>Search:</strong>&nbsp;&nbsp;
<input type="text" name="searchkey" value="{{$searchkey}}" style="width:400px;" placeholder="Enter address"/>
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" value="Search" name="searchaddr"  />

</div> 
<div style="float:right;"><input type="submit" value="Show Hidden" name="unhide"  /></div>
</form>
<div style="float:left; width:100%;">
  <table id="doclist-table" class="nav-back tableFixHead" width="100%">
    <thead>
      <tr>
        <th class="topmenu" align="center" valign="middle" width="3%">SrNo</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Address</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Link</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Checklist Number</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Site Scope Report</th>
        <th class="topmenu" align="center" valign="middle" width="7%">S.S. Calculator</th>
        <th class="topmenu" align="center" valign="middle" width="7%">S.S. Proposal Word</th>
        <th class="topmenu" align="center" valign="middle" width="7%">S.S. Proposal PDF</th>
        
        <th class="topmenu" align="center" valign="middle" width="7%">Final Signed Plans</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Design Summary</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Operations Calculator</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Master Calculator</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Proposal PDF</th>
        
         <th class="topmenu" align="center" valign="middle" width="7%">Merged Plan</th>
         
        <th class="topmenu" align="center" valign="middle" width="7%">Proposal Booked</th>
		<th class="topmenu" align="center" valign="middle" width="7%">Face to<br />Face Meeting</th>
        
        <th class="topmenu" align="center" valign="middle" width="7%">HIA Booked</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Project Handover</th>
		<th class="topmenu" align="center" valign="middle" width="12%">Hide From Report</th>


        
      </tr>
    {{if $list}}
    <tbody>
    <form name="mlist" method="post">
      <!--{{assign var=countn value= $numstartvounter}}-->
       {{assign var=countn value= $total}}
      
      {{foreach from=$list key="key" item="item"}}
      <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
        <td> {{$countn}} </td>
        <td>{{$item.bsn_address}}</td>
        <td style="text-align:center;" ><a href = "{{$item.link}}" target="blank">Link</a></td>
        <td style="text-align:center;" >{{$item.dpn_unique_id}}</td>
    
       {{if $item.checklist30}}
        <td style="text-align:center;" >
          <!--  <a href = "https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.checklist30}}?dummy={{$ran}}" target="_blank">Download</a>-->
   <a href = "/proposal_checklist_report.download_content?file_name={{$item.checklist30}}&module_name=proposal_checklist_report.home">Download</a>
        </td>
        {{else}}
        <td style="background:#F00"> </td>
        {{/if}}
      
        {{if $item.checklist5}}
        <td style="text-align:center;" >
            <!--<a href = "https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.checklist5}}?dummy={{$ran}}" target="_blank">Download</a>-->
            <a href = "/proposal_checklist_report.download_content?file_name={{$item.checklist5}}&module_name=proposal_checklist_report.home">Download</a>
            
        </td>
        {{else}}
        <td style="background:#F00"> </td>
        {{/if}}
		
        {{if $item.checklist37}}
        <td style="text-align:center;" >
          <!--  <a href = "https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.checklist37}}?dummy={{$ran}}" target="_blank">Download</a>-->
          <a href = "/proposal_checklist_report.download_content?file_name={{$item.checklist37}}&module_name=proposal_checklist_report.home">Download</a>     
        </td>
        {{else}}
        <td style="background:#F00"> </td>
        {{/if}}
        
        {{if $item.checklist31}}
        <td style="text-align:center;" >
           <!-- <a href = "https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.checklist31}}?dummy={{$ran}}" target="_blank">Download</a>-->
       <a href = "/proposal_checklist_report.download_content?file_name={{$item.checklist31}}&module_name=proposal_checklist_report.home">Download</a>      
        </td>
        {{else}}
        <td style="background:#F00"> </td>
        {{/if}}
        
        
        {{if $item.checklist17}}
        <td style="text-align:center;" >
          <!--  <a href = "https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.checklist17}}?dummy={{$ran}}" target="_blank">Download</a>-->
         <a href = "/proposal_checklist_report.download_content?file_name={{$item.checklist17}}&module_name=proposal_checklist_report.home">Download</a> 
        </td>
        {{else}}
        <td style="background:#F00"> </td>
        {{/if}}
        
        
       {{if $item.checklist36}}
        <td style="text-align:center;" >
           <!-- <a href = "https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.checklist36}}?dummy={{$ran}}" target="_blank">Download</a>-->
        <a href = "/proposal_checklist_report.download_content?file_name={{$item.checklist36}}&module_name=proposal_checklist_report.home">Download</a>      
        </td>
        {{else}}
        <td style="background:#F00"> </td>
        {{/if}}
        
        {{if $item.checklist6}}
        <td style="text-align:center;" >
      <!--      <a href = "https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.checklist6}}?dummy={{$ran}}" target="_blank">Download</a>-->
      <a href = "/proposal_checklist_report.download_content?file_name={{$item.checklist6}}&module_name=proposal_checklist_report.home">Download</a>      
        </td>
        {{else}}
        <td style="background:#F00"> </td>
        {{/if}}
        
        {{if $item.checklist7}}
        <td style="text-align:center;" >
          <!--  <a href = "https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.checklist7}}?dummy={{$ran}}" target="_blank">Download</a>-->
       <a href = "/proposal_checklist_report.download_content?file_name={{$item.checklist7}}&module_name=proposal_checklist_report.home">Download</a>       
        </td>
        {{else}}
        <td style="background:#F00"> </td>
        {{/if}}
        
        
        {{if $item.checklist10}}
        <td style="text-align:center;" >
        <!--    <a href = "https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.checklist10}}?dummy={{$ran}}" target="_blank">Download</a>-->
      <a href = "/proposal_checklist_report.download_content?file_name={{$item.checklist10}}&module_name=proposal_checklist_report.home">Download</a>        
        </td>
        {{else}}
        <td style="background:#F00"> </td>
        {{/if}}
        
        {{if $item.checklist20}}
        <td style="text-align:center;" >
       <!--     <a href = "https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.checklist20}}?dummy={{$ran}}" target="_blank">Download</a>-->
   <a href = "/proposal_checklist_report.download_content?file_name={{$item.checklist20}}&module_name=proposal_checklist_report.home">Download</a>          
        </td>
        {{else}}
        <td style="background:#F00"> </td>
        {{/if}}
        
        
        
        {{if $item.uid10complete eq 1 }}
        	<td style="text-align:center;" >{{$item.uid10}}</td>
        {{else}}
            <td style="background:#F00"></td>
        {{/if}}
        
        {{if $item.uid8complete eq 1 }}
        	<td style="text-align:center;" >{{$item.uid8}}</td>
        {{else}}
            <td style="background:#F00"></td>
        {{/if}}
        
        {{if $item.uid38complete eq 1 }}
        	<td style="text-align:center;" >{{$item.uid38}}</td>
        {{else}}
            <td style="background:#F00"></td>
        {{/if}}
       
       {{if $item.uid25complete eq 1 }}
        	<td style="text-align:center;" >{{$item.uid25}}</td>
        {{else}}
            <td style="background:#F00"></td>
        {{/if}}
        
        
        <td><form name ="recmet" method="post" action="">
     <input type="hidden" name="hide[{{$item.dpn_unique_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="hide[{{$item.dpn_unique_id}}]" value="1"  onclick="this.form.submit();" {{if $item.yes eq 1 }} checked="checked" {{/if}} />
        	<span class="switch-label" data-on="Yes" data-off="No"></span> 
        	<span class="switch-handle"></span> <br />
             </label>
             
   		 </form> 
        </td> 
        
      </tr>
      {{assign var=countn value=$countn-1}}
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