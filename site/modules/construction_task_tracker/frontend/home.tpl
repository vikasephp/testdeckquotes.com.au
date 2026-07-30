<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/rangeslider/rangeSlider.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/rangeslider/rangeSlider.js"></script>

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

<script> !window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');</script>
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

function add_procedure()
{
	var viewurl = "{{$BASE_URL}}construction_task_tracker.view_procedure"+ "/random/" + Math.random();	

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
$(function(){
    $(".wrapper1").scroll(function(){
        $(".wrapper2")
            .scrollLeft($(".wrapper1").scrollLeft());
    });
    $(".wrapper2").scroll(function(){
        $(".wrapper1")
            .scrollLeft($(".wrapper2").scrollLeft());
    });
});
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

.wrapper1, .wrapper2{width: 100%; border: none 0px RED;
overflow-x: scroll; overflow-y:hidden; scrollbar-color: yellow blue;}
.wrapper1{height: 20px; }
.wrapper2{ }
.div1 {width:9560px; height: 20px; }
.div2 {width:9560px;  overflow: auto;}  

.tableFixHead          { overflow-y: auto; height: 700px; }
.tableFixHead thead th { position: sticky; top: 0; text-align:left; }

table  { border-collapse: collapse; width: 100%; }

th     { z-index:9999; }


.slidecontainer {
  width: 225px;
}

.slider {
  -webkit-appearance: none;
  width: 100%;
  height: 5px;
  background: #06F ;
  outline: none;
  opacity: 0.7;
  -webkit-transition: .2s;
  transition: opacity .2s;
}

.slider:hover {
  opacity: 1;
}

.slider::-webkit-slider-thumb {
  -webkit-appearance: none;
  appearance: none;
  width: 5px;
  height: 25px;
  background: #F00 ;
  cursor: pointer;
}

.slider::-moz-range-thumb {
  width: 15px;
  height: 15px;
  background: #F00;
  cursor: pointer;
}
#fancybox-wrap {z-index:9999999;} 
</style>

<h3 class="page-title">{{$title}}</h3>
<br />

<form name="mlist" method="post">

<div style="float:left; text-align:left;"> 
&nbsp; &nbsp; <input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> <br />
&nbsp; &nbsp; <input type="submit" value="Sort By Project" name="sort_project"  /> 
&nbsp; &nbsp; <input type="submit" value="Sort By Project Manager" name="sort_manager"  /> 
&nbsp; &nbsp; <input type="submit" value="Sort By Days at Status" name="sort_days"  /> 
&nbsp; &nbsp; <input type="submit" value="Add Tasks" name="add_task"  /> 
</div>
<div style="float:right;">
<!-- <input type="submit" value="Print All Reports" name="printall"  />  -->
<input type="button" value="Export To XLS" onclick="document.location.href='{{$BASE_URL}}{{$XFA.home}}/export/1'" /> &nbsp;
</div>
</form>
<br />

<div style="float:right; text-align:left;margin-right: 100px;">
<form name="mlist2" method="post">
  <input type="submit" value="Clear database for Print All files" name="clear_database_for_print_all_files" id="clear_database_for_print_all_files">
  <br>
  <div class="show_remainingCredits">
      <input type="submit" value="Print All Reports" name="printall"  />
    <span class="show_info">Total files ::  {{$total_records_of_print_reports }}/ </span>
    <span class="show_info">Total Printed files :: {{$total_printed_records }}  </span>
  </div>
 

  <!--<input type="submit" value="Merge Match PO PDF" name="merge__po_number_pdf"    id ="submitBtn"/><br /><br /> -->
  <input type="submit" value="Download Print Report" name="download_all_files_report" id="dafaz_submitBtn">
  <br>
  </form>
</div>


<div class="wrapper1">
    <div class="div1">
    </div>
</div>

<!--<div class="wrapper2">
    <div class="div2 tableFixHead">-->
    
    <div style="border:1px solid black;width:auto;height:auto;overflow-y:hidden;overflow-x:scroll;">
    <div class="div2 tableFixHead" >

  <table id="doclist-table" class="nav-back" width="100%">
    <thead>
      <tr>
        <th class="topmenu" align="center" valign="middle" style="width:5px;">SrNo</th>
        <th class="topmenu" align="center" valign="middle" style="width:110px;">Address</th>
        <th class="topmenu" align="center" valign="middle" style="width:15px;">Project Manager </th>
        <th class="topmenu" align="center" valign="middle" style="width:10px;">Link</th>
        <th class="topmenu" align="center" valign="middle" style="width:10px;">Document Click<br />Link</th>
        <th class="topmenu" align="center" valign="middle" style="width:5px;">Days at <br />Status</th>
        <!--<th class="topmenu" align="center" valign="middle" style="width:5px;">Lastest Update Letter</th>-->
        
     {{foreach from=$colhead key="keyh" item="itemh"}}
     <th class="topmenu" align="center" valign="middle" style="width:80px;" >{{$itemh.bst_task_id}}</th>
     {{/foreach}}
        <th class="topmenu" align="center" valign="middle" style="width:110px;">Percentage Completed</th> 
         <th class="topmenu" align="center" valign="middle" style="width:195px;">Orginal CSBD</th> 
        <th class="topmenu" align="center" valign="middle" style="width:195px;">Latest CSBD</th> 
        <th class="topmenu" align="center" valign="middle" style="width:195px;">Day Difference</th> 
        <th class="topmenu" align="center" valign="middle" style="width:195px;">Task Completed %</th> 
        <th class="topmenu" align="center" valign="middle" style="width:110px;">Combined Report Function</th> 
        <th class="topmenu" align="center" valign="middle" style="width:110px;">Weekly Update Letter</th> 
        <th class="topmenu" align="center" valign="middle" style="width:110px;">Alert Report</th> 
        <th class="topmenu" align="center" valign="middle" style="width:110px;">PDF Calendar</th> 
        <th class="topmenu" align="center" valign="middle" style="width:110px;">Address</th>  
        <th class="topmenu" align="center" valign="middle" style="width:110px;">Print</th> 
      </tr>
      
   {{if $list}}
   
        <tr>
     <td colspan="7"></td> 
    {{foreach from=$colhead key="keyp" item="itemp"}}
     <td><input type="text" name="{{$itemp.bst_task_id}}" value="{{$itemp.bst_ptt_summary}}" style="width:100px;"  onkeyup = "update_ts({{$itemp.bst_task_id}},this.value)"/>
     {{/foreach}}
      <script>
	   
		function update_ts(id,value)
		{
			
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}construction_task_tracker.update_ts/bst_task_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	</script>
        </td>  
    <td colspan="11"></td>    
    </tr>
    <tbody>
    
      <!--{{assign var=countn value= $numstartvounter}}-->
       {{assign var=countn value= $total}}
      
      {{foreach from=$list key="key" item="item"}}
      <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
        <td> {{$countn}} </td>
        <td><strong>{{$item.bcust_fname}} &nbsp; {{$item.bcust_lname}}</strong> <br />
        {{$item.bsn_address}}
        </td>
    
       <td>{{$item.prd_name}} </td>
       <td style="text-align:center;" ><a href = "{{$item.link}}" target="blank">Link</a></td>
       <td style="text-align:center;" ><a href = "{{$item.link2}}" target="blank">Link</a></td>
       <td>{{$item.dayscount}} </td>
        <!--<td></td>-->
       
     {{foreach from=$item.task key="keyh" item="itemh"}}
     {{if $itemh}}
     	{{if $itemh eq  'N / R'}}
     		<th valign="middle" style="width:100px;" >
                <a href="{{$BASE_URL}}business.taskdetail/bsn_id/{{$item.bsn_id}}/uid/{{$keyh}}">{{$itemh}}</a></th>
        {{else}}
        	<th valign="middle" style="background:#0C0;">
                <a href="{{$BASE_URL}}business.taskdetail/bsn_id/{{$item.bsn_id}}/uid/{{$keyh}}">{{$itemh}}</a> </th>
        {{/if}}        
                
     {{else}}
     <th  align="center" valign="middle" style="width:100px;" >
      <a href="{{$BASE_URL}}business.taskdetail/bsn_id/{{$item.bsn_id}}/uid/{{$keyh}}">View<br />Task</a></th>
     {{/if}}
     
     {{/foreach}}

       
      <td> 
      
   <div class="slidecontainer">
  <input type="range" min="0" max="100" value="{{$item.bsn_per_complete}}" class="slider" id="myRange_{{$countn}}" Onchange = "update({{$item.bsn_id}},this.value)" >
  <p>%: <span id="demo_{{$item.bsn_id}}"></span></p>
  </div>

<script>
var slider = document.getElementById("myRange_{{$countn}}");
var output{{$item.bsn_id}} = document.getElementById("demo_{{$item.bsn_id}}");
output{{$item.bsn_id}}.innerHTML = slider.value;

slider.oninput = function() {
  output{{$item.bsn_id}}.innerHTML = this.value;
}

	
	function update(id,value)
	{
	 //alert(id);
	 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}/design_report.update_per/bsn_id/"+id+"/value/"+value,
					   success: function(result){
				   }
				 });
	
	}
	
	
</script>
      
      <td><form name ="original" method="post" action="" id="myForm1" enctype="multipart/form-data">
         <input type="text" name="bsn_orginal_csbd_ctt[{{$item.bsn_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo1_{{$item.bsn_id}}" value="{{$item.bsn_orginal_csbd_ctt}}"  /> 
             <input type="submit" value="Set" name="original" class="set" />
          </td>
        </form>   
         <td><form name ="latest" method="post" action="" id="myForm2" enctype="multipart/form-data">
         <input type="text" name="bsn_latest_csbd_ctt[{{$item.bsn_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo2_{{$item.bsn_id}}" value="{{$item.bsn_latest_csbd_ctt}}"  /> 
             <input type="submit" value="Set" name="latest" class="set" />
             </form>
          </td>
         <td> {{$item.dd}}</td>
          
      <td>Completed Task: {{$item.completed}}%
          <br />Not Req. Task : {{$item.notreq }}%
       </td>
 
     <td><input type="button" value="Print"  /> </td>
      <td> <form name ="wul" method="post" action="" id="myForm" enctype="multipart/form-data">
      <input type="hidden" value="{{$item.bsn_id}}" name="business_id" />
       <input type="file" name="weekly" /> <br /><br /><input type ="submit" name="upload_letter" value="Save"/>
       {{if $item.bsn_weekly_letter_const}}
        <span style="text-align:center;">&nbsp;&nbsp;
        
        <!--<a href="{{$BASE_URL}}files/weekly_letter_construction/{{$item.bsn_weekly_letter_const}}" target="_blank">Download</a>-->
    <a href="/construction_task_tracker.download_content_l?file_name={{$item.bsn_weekly_letter_const}}&module_name=construction_task_tracker.home" target="_blank">Download</a>     
        
        </span>
       
       {{/if}}
      </form> 
       </td>
      <td> </td>
      <td>
      {{if $item.doc_file_name}} 
      <!--<a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name}}" target="_blank">Download</a>-->
      
      <a href="/construction_task_tracker.download_content?file_name={{$item.doc_file_name}}&module_name=construction_task_tracker.home" target="_blank">Download</a>
      
       {{/if}} 
      </td>
 
      <td><strong>{{$item.bcust_fname}} &nbsp; {{$item.bcust_lname}}</strong> <br />
        {{$item.bsn_address}}
      </td>
       <td><input type="button" value="Print" onclick="document.location.href='{{$BASE_URL}}{{$XFA.home}}/print/{{$item.bsn_id}}'" /></td>
      </tr>
      {{assign var=countn value=$countn-1}}
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
<!--  <table id="doclist-table"  width="100%" bgcolor="#d3e8d6">
    <thead>
  
      <tr>
        <td colspan="2">&nbsp;</td>
      </tr>
    </thead>
  </table>-->
</div> 
</div>