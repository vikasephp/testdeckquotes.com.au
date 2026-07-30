<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/default.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/tree/simpletreemenu.js"></script>

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

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
		
		});


function show_alert(bsn_id)
{
	var viewurl = "{{$BASE_URL}}inclusions_report.alerts"+ "/bsn_id/" + bsn_id;	
	
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
</script>
<script type="text/javascript">
function add_procedure()
{
	var viewurl = "{{$BASE_URL}}inclusions_report.view_procedure"+ "/random/" + Math.random();	

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

.set { font-size:10px !important; 
       width:25px !important; display:inline-block; 
	  padding-top:1px !important;
	  padding-bottom: 1px !important;
	  padding-left:1px !important;
	  height:25px !important; }

.set2 { font-size:10px !important; 
       width:60px !important; display:inline-block; 
	  padding-top:1px !important;
	  padding-bottom: 1px !important;
	  padding-left:1px !important;
	  height:25px !important; }
.tooltip {
    position: relative;
	border:0px solid !important;
	margin-top:5px;
    
}

.tooltip .tooltiptext {
    visibility: hidden;
    width: 500px;
    background-color: black;
    color: #fff;
    text-align: center;
    border-radius: 6px;
    padding: 5px 5px;
	display:block;
	margin-left:20px;

    /* Position the tooltip */
    position: absolute;
    z-index: 1;
}

.tooltip:hover .tooltiptext {
    visibility: visible;
}

.tooltip:hover .tooltiptext {
    visibility: visible;
}

.tableFixHead          { overflow-y: auto; height: 100px; }
.tableFixHead thead th { position: sticky; top: 0; text-align:left; }

table  { border-collapse: collapse; width: 100%; }
th     { z-index:9999; }
#fancybox-wrap {z-index:9999999;} 
</style>

<h3 class="page-title">{{$title}}</h3>
<br />
<div style="float:left; text-align:left;"> 
&nbsp; &nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> <br />
<form name="mlist" method="post" enctype="multipart/form-data">

<div style="float:left;"> &nbsp; &nbsp; <strong>Search:</strong>&nbsp;&nbsp;
<input type="text" name="searchkey" value="{{$searchkey}}" style="width:400px;" placeholder="Enter address"/>
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" value="Search" name="searchaddr"  />

</div> 
<div style="float:right;"> 
<input type="submit" name="download" value="Download Pdf" /> 
</div>


<div style="float:left; width:100%;">
  <table id="doclist-table" class="nav-back tableFixHead" width="100%">
    <thead>
      <tr>
        <th class="topmenu" align="center" valign="middle" width="3%">SrNo</th>
        <th class="topmenu" align="center" valign="middle" width="15%">Address</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Contacts</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Link</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Inclusion Coordinator</th>
        
        <th class="topmenu" align="center" valign="middle" width="3%">Day Count (HIA signed Date)</th>

        <th class="topmenu" align="center" valign="middle" width="3%">Active Alerts</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Add Feedback</th>
       
        <th class="topmenu" align="center" valign="middle" width="3%">Progress</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Current Project<br /> Inclusions Choices</th>
        <th class="topmenu" align="center" valign="middle" width="3%">UID 476</th> 
        <th class="topmenu" align="center" valign="middle" width="3%">UID 271</th>
        <th class="topmenu" align="center" valign="middle" width="3%">UID 528</th>
        <th class="topmenu" align="center" valign="middle" width="3%">UID 377</th>
        <th class="topmenu" align="center" valign="middle" width="3%">UID 518</th>
        <th class="topmenu" align="center" valign="middle" width="3%">UID 359</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Task Completed</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Unapproved - Current Project<br /> Inclusions Choices</th>
        
        <th class="topmenu" align="center" valign="middle" width="7%">Add To Report</th>
        
        
      </tr>
    {{if $list}}
    <tbody>
    
      <!--{{assign var=countn value= $numstartvounter}}-->
       {{assign var=countn value= $total}}
      
      {{foreach from=$list key="key" item="item"}}
      <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
        <td> {{$countn}} </td>
        <td>{{$item.bsn_address}}</td>
        <td> <a href="{{$BASE_URL}}js/vcard/index.php?fname={{$item.bcust_fname}}&lname={{$item.bcust_lname}}&email1={{$item.bcust_misc_email1}}&email2={{$item.bcust_misc_email2}}&mobile={{$item.bcust_misc_moble}}&business={{$item.bcust_misc_business}}&home={{$item.bcust_misc_home}}" class="action_new" title="Download Vcard"><img style="height: 17px; width:22px" src="{{$BASE_URL}}images/vcard.png"/></a> </td>
        <td style="text-align:center;" ><a href = "{{$item.link}}" target="blank">Link</a></td>
       <td>{{$item.prd_name}} </td>
       
       <td>{{$item.dayscount}} </td>
      
       
        <td><input type="button" name="alert" value="{{$item.tot}}" onclick="javascript:show_alert({{$item.bsn_id}});" style="width:30px; height:20px; font-size:11px; line-height:17px !important; padding:0px !important" />
         </td>
       <td> <input type="button" name="feedback" value="Add Feedback" onclick="javascript:addfeedback({{$item.bsn_id}});" style="width:90px; height:20px; font-size:11px; line-height:17px !important; padding:0px !important" /> </td>
     
      <td style="text-align:center;">{{$item.task_inc_done}}/{{$item.total_inc_task}} </td>
      <td> 
       <select name="inclusion_choices[{{$item.bsn_id}}]" Onchange = "update_in_choices({{$item.bsn_id}},this.value)" >
       <option value="Yes" {{if $item.bsn_cp_incl_choices eq 'Yes'}} selected="selected" {{/if}}> Yes </option>
       <option value="No" {{if $item.bsn_cp_incl_choices eq 'No'}} selected="selected" {{/if}}> No </option>
      </select>
       
       <script>
	   
        function update_in_choices(id,value)
		{
		
		 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}/inclusions_report.update_cp_inclusion_choices/bsn_id/"+id+"/value/"+value,
						   success: function(result){
					   }
					 });
		
		}
	
       </script>
      
      
      
       </td>
      
      {{if $item.uid476complete eq 1 }}
        	<td style="text-align:center;" >{{$item.uid476}}</td>
        {{else}}
            <td style="background:#F00"></td>
        {{/if}}
        
      {{if $item.uid271complete eq 1 }}
        	<td style="text-align:center;" >{{$item.uid271}}</td>
        {{else}}
            <td style="background:#F00"></td>
        {{/if}}
       
      {{if $item.uid528complete eq 1 }}
        	<td style="text-align:center;" >{{$item.uid528}}</td>
        {{else}}
            <td style="background:#F00"></td>
        {{/if}}
        
       {{if $item.uid377complete eq 1 }}
        	<td style="text-align:center;" >{{$item.uid377}}</td>
       {{else}}
            <td style="background:#F00"></td>
       {{/if}}
       
       {{if $item.uid518complete eq 1 }}
        	<td style="text-align:center;" >{{$item.uid518}}</td>
       {{else}}
            <td style="background:#F00"></td>
       {{/if}}
      
      {{if $item.uid359complete eq 1 }}
        	<td style="text-align:center;" >{{$item.uid359}}</td>
       {{else}}
            <td style="background:#F00"></td>
       {{/if}}
       
       <td style="text-align:center;">{{$item.taskdone}}/{{$item.total_task}} </td>
      <td style="text-align:center;" >{{if $item.uid370doc}}
   <!--   <a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.uid370doc}}" target="_blank">Download </a>-->
      
      <a href="/inclusions_report.download_content?file_name={{$item.uid370doc}}&module_name=inclusions_report.home" >Download</a> <br />
      
      {{$item.uid370}}
      {{/if}}
      </td>
       <td>
       <input type="hidden" name="pdf[{{$item.bsn_id}}]" value="0" />
  	   <label class="switch">
            <input class="switch-input" type="checkbox"  name="pdf[{{$item.bsn_id}}]" value="1" />
         	<span class="switch-label" data-on="Yes" data-off="No"></span> 
        	<span class="switch-handle"></span> <br />
       </label>
         
        </td>
      </tr>
      {{assign var=countn value=$countn-1}}
      {{/foreach}}
      </tbody>
      
  
    {{/if}}
  </table>
    </form>
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