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


function close_win()
	{
	$.fancybox.close();
	window.location.reload();
	}
</script>


<script type="text/javascript" > 
function addfeedback(bsn_id)
{
	var viewurl = "{{$BASE_URL}}planning_assesment_quickreport.addfeedback"+ "/bsn_id/" + bsn_id;	
	
	
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
	var viewurl = "{{$BASE_URL}}initial_design_task_report.view_procedure"+ "/random/" + Math.random();	

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


<style>
.dtpic {
	width:65px !important;
	padding-top:1px !important;
	padding-bottom:1px !important;	
}

.set { font-size:10px !important; 
       width:25px !important; display:inline-block; 
	   padding-top:1px !important;
	   padding-bottom: 1px !important;
	   padding-left:1px !important;
	   height:25px !important; }

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
        <th class="topmenu" align="center" valign="middle" width="8%">Project</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Link</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Design Agreement Signed Date</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Day Count</th>
        <th class="topmenu" align="center" valign="middle" width="6%">Building File</th>
        <th class="topmenu" align="center" valign="middle" width="8%">ASI Booked Date</th>
        <th class="topmenu" align="center" valign="middle" width="6%">ASI Completed Date</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Survey Status</th>
        <th class="topmenu" align="center" valign="middle" width="12%">Survey Who</th>
	<th class="topmenu" align="center" valign="middle" width="3%">Site Scope Booked</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Survey Uploaded</th>
    	<th class="topmenu" align="center" valign="middle" width="3%">Hide From Report</th>


        
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
        <td style="text-align:center;" >{{$item.doc_date_uploaded}} <br />
         <!--<a href = "{{$BASE_URL}}files/document_check_list_files/{{$item.checklist45}}?dummy={{$ran}}" target="_blank">Download</a>-->
        </td>
    
        <td style="text-align:center;">{{$item.dayscount}} </td>
       
          {{if $item.checklist287_date}}
           <td style="text-align:center;">
         <!--<a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.checklist287_doc}}" target="_blank">-->
     <a href="/initial_design_task_report.download_content?file_name={{$item.checklist287_doc}}&module_name=initial_design_task_report.home"  target="_blank">
         Link</a><br />
         {{$item.checklist287_date}}
          {{else}} 
         <td style="background:#F00; color:#FFF; text-align:center;">No</td>
          {{/if}}
          
          <td>
           <form name="asi" method="post" action="">
          <input type="text" name="bs_idtr_asi_book_date[{{$item.bsn_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo44_{{$item.bsn_id}}" value="{{$item.bs_idtr_asi_book_date}}"  /> 
             <input type="submit" value="Set" name="asi_date" class="set" />
          </form>
          </td>
          
          <td>{{$item.tasklist303}}</td>
          
         <td style="text-align:center;" >
         <form name="ss" method="post" action="">
        <select name="survey[{{$item.bsn_id}}]" Onchange = "update_survey({{$item.bsn_id}},this.value)" >
        <option value="Requested" {{if $item.bs_dr_survey eq 'Requested'}} selected="selected" {{/if}}>Requested</option>
       <option value="TBC" {{if $item.bs_dr_survey eq 'TBC'}} selected="selected" {{/if}}>TBC</option>
       <option value="Client" {{if $item.bs_dr_survey eq 'Client'}} selected="selected" {{/if}}>Client</option>
       <option value="CGFB" {{if $item.bs_dr_survey eq 'CGFB'}} selected="selected" {{/if}}>CGFB</option>
       <option value="Uploaded" {{if $item.bs_dr_survey eq 'Uploaded'}} selected="selected" {{/if}}>Received/Uploaded </option>
       <option value="Refused" {{if $item.bs_dr_survey eq 'Refused'}} selected="selected" {{/if}}>Refused</option>
       </select><br />
       <input type="text" name="bs_dr_survey_date[{{$item.bsn_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo33_{{$item.bsn_id}}" value="{{$item.bs_dr_survey_date}}"  /> 
             <input type="submit" value="Set" name="survey" class="set" />
      </form>
         <script>
	   
		function update_survey(id,value)
		{
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}initial_design_task_report.update_survey/bsn_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	</script>
         </td>

         

        <td style="text-align:center;" >
        <form name="who" method="post" action="">
        <input type="text" name="bs_idtr_who[{{$item.bsn_id}}]" value="{{$item.bs_idtr_who}}" onkeyup = "update_who({{$item.bsn_id}},this.value)" style="width:150px;" />
        <input type="submit" value="Set" name="who" class="set" />
        </form>
         <script>
	   
		function update_who(id,value)
		{
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}initial_design_task_report.update_who/bsn_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	</script>
        </td>



        <td style="text-align:center;" >
        <form name ="ss_booked" method="post" action="">
        <input type="hidden" name="ss_book[{{$item.bsn_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="ss_book[{{$item.bsn_id}}]" value="1"  onclick="this.form.submit();" {{if $item.bsn_idtr_ss_booked eq 1 }} checked="checked" {{/if}} />
        	<span class="switch-label" data-on="Yes" data-off="No"></span> 
        	<span class="switch-handle"></span> <br />
             </label>
       </form> 
        {{if $item.bsn_idtr_ss_booked eq 1}} {{$item.bsn_idtr_ss_booked_dt}} {{/if}}
        </td>

        <td style="text-align:center;" >
        {{if $item.survey_uploaded}}
        <!--<a href="{{$BASE_URL}}files/document_check_list_files/{{$item.survey_uploaded}}" target="_blank">-->
     <a href="/initial_design_task_report.download_content?file_name={{$item.survey_uploaded}}&module_name=initial_design_task_report.home"  target="_blank">
   
        
        Link</a>
        {{/if}}
        </td>

        
        <td><form name ="recmet" method="post" action="">
     <input type="hidden" name="hide[{{$item.bsn_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="hide[{{$item.bsn_id}}]" value="1"  onclick="this.form.submit();" {{if $item.yes eq 1 }} checked="checked" {{/if}} />
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