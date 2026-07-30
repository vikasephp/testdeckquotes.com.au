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

function close_win()
	{
	$.fancybox.close();
	window.location.reload();
	}
</script>

<script type="text/javascript" > 

function add_letter()
{
	var viewurl = "{{$BASE_URL}}planning_task_tracker.viewletter"+ "/random/" + Math.random();	
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

function add_type()
{
	var viewurl = "{{$BASE_URL}}planning_task_tracker.viewtype"+ "/random/" + Math.random();	
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
	var viewurl = "{{$BASE_URL}}planning_task_tracker.view_procedure"+ "/random/" + Math.random();	
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

.set2 { font-size:10px !important; 
       width:60px !important; display:inline-block; 
	  padding-top:1px !important;
	  padding-bottom: 1px !important;
	  padding-left:1px !important;
	  height:25px !important; }

.wrapper1, .wrapper2{width:100%; border: none 0px RED;
overflow-x: scroll; overflow-y:hidden; scrollbar-color: yellow blue;}
.wrapper1{height: 20px; }
.wrapper2{ }
.div1 {width:8880px; height: 20px; }
.div2 {width:8880px;  overflow: auto;}  

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

<form name="mlist" method="post" enctype="multipart/form-data">
<div style="float:left; text-align: left; margin-left:10px; text-align:left">
&nbsp;&nbsp;<strong>Procedure Link </strong><input type="text" name="proc" value="{{$proc_detail.tl_link}}" style="width:700px" /> 
<input type="submit" value="Update Link" name="update_link"  /> <br />
<input type="button" name="Add New" value="Letter Text Admin" onclick="javascript:add_letter();" /> 
<input type="button" name="Add New" value="Add Sub Status" onclick="javascript:add_type();" /> 
&nbsp;&nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" />
<br />
<input type= "submit" name="redlight" title="Save" value="Filter Red Light Projects">
<input type= "submit" name="amberlight" title="Save" value="Filter Amber Light Projects"> &nbsp; &nbsp;
<select name="bs_ptt_sub_status"   Onchange = "update_sub_status({{$item.bs_business_id}},this.value)"/>
      	 {{foreach from=$sub_status key="key" item="item2"}}
            <option value="{{$item2.pst_id}}" {{if $item2.pst_id eq $ss}} selected="selected" {{/if}}>
            {{$item2.pst_status}}
            </option>
         {{/foreach}}
</select>
<input type= "submit" name="filter_ss" title="filter" value="Filter Sub Status">
<input type= "submit" name="clear"  value="Clear Filter">
</div>

<div style="float:right;">
<input type="submit" value="Print All Reports" name="printall"  />
<input type="button" value="Export To XLS" onclick="document.location.href='{{$BASE_URL}}{{$XFA.home}}/export/1'" /> &nbsp;
</div>
<br />
<div class="wrapper1">
    <div class="div1">
    </div>
</div>

<!--<div class="wrapper2">
    <div class="div2 tableFixHead">-->

 <div style="border:1px solid black;width:auto;height:auto;overflow-y:hidden;overflow-x:scroll;">
    
    <!--<p style="width:300%;">-->
    <div class="div2 tableFixHead" >

  <table id="doclist-table" class="nav-back" width="100%">
    <thead>
      <tr>
        <th class="topmenu" align="center" valign="middle" style="width:5px;">SrNo</th>
        <th class="topmenu" align="center" valign="middle" style="width:110px;">Address</th>
        <th class="topmenu" align="center" valign="middle" style="width:110px;">Sub Status</th>
        <th class="topmenu" align="center" valign="middle" style="width:50px;">Order</th>
        <th class="topmenu" align="center" valign="middle" style="width:110px;">D Type</th>
        <th class="topmenu" align="center" valign="middle" style="width:15px;">Planning Manager</th>
        <th class="topmenu" align="center" valign="middle" style="width:10px;">Link</th>
        <th class="topmenu" align="center" valign="middle" style="width:10px;">Document Click<br />Link</th>
        <th class="topmenu" align="center" valign="middle" style="width:5px;">Days at <br />Status</th>
        <th class="topmenu" align="center" valign="middle" style="width:110px;">7 Day Task Report</th> 
        <th class="topmenu" align="center" valign="middle" style="width:5px;">Upload Weekly Letter</th>
        <th class="topmenu" align="center" valign="middle" style="width:190px;">Traffic Light</th>
        <th class="topmenu" align="center" valign="middle" style="width:150px;">Letter Text</th>
         
     {{foreach from=$colhead key="keyh" item="itemh"}}
     <th class="topmenu" align="center" valign="middle" style="width:100px;" >{{$itemh.bst_task_id}}</th>
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
       
      </tr>
    </thead>  

    {{if $list}}
    <tbody>
   <td colspan="12"></td> 
    {{foreach from=$colhead key="keyp" item="itemp"}}
     <td><input type="text" name="{{$itemp.bst_task_id}}" value="{{$itemp.bst_ptt_summary}}" style="width:100px;"  onkeyup = "update_ts({{$itemp.bst_task_id}},this.value)"/></td>
     {{/foreach}}
      <script>
	   
		function update_ts(id,value)
		{
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}planning_task_tracker.update_ts/bst_task_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	</script>  
    <td colspan="10"></td> 
   
   
     {{assign var=countn value= $total}}
      
      {{foreach from=$list key="key" item="item"}}
      <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
        <td> {{$countn}} </td>
        <td><strong>{{$item.bcust_fname}} &nbsp; {{$item.bcust_lname}}</strong> <br />
        {{$item.bsn_address}}
        </td>
        
       <td><select name="{{$TABLE}}[bs_ptt_sub_status]"   Onchange = "update_sub_status({{$item.bs_business_id}},this.value)"/>
      	 {{foreach from=$sub_status key="key" item="item2"}}
            <option value="{{$item2.pst_id}}" {{if $item.bs_ptt_sub_status eq $item2.pst_id}} selected="selected" {{/if}}>
            {{$item2.pst_status}}
            </option>
         {{/foreach}} 
         </select>
          <div id="usr{{$item.bs_business_id}}">{{$item.bs_ptt_sub_status_date}}<br />{{$item.bs_ptt_sub_status_user}} </div>
         <script>
	   
		function update_sub_status(id,value)
		{
			var tana = "#usr"+id;
			 $.ajax({
				
				   type: "GET",
				   url: "{{$BASE_URL}}planning_task_tracker.update_sub_status/bs_business_id/"+id+"/value/"+value,
					   success: function(result){
						 $(tana).html(result);   
					}
					
				});
				
			var tana10 = "#usr10"+id;
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}planning_task_tracker.show_order/bs_business_id/"+id,
					   success: function(result){
						 $(tana10).html(result);   
					}
				});	
		}
	</script>  
      </td> 
       <td> <div id="usr10{{$item.bs_business_id}}">{{$item.bs_ptt_sub_status_order}}</div></td> 
       <td> 
        <select name="ptt_d_type[{{$item.bsn_id}}]" Onchange = "update_d_type({{$item.bsn_id}},this.value)" >
       <option value="DA" {{if $item.bsn_ptt_d_type eq 'DA'}} selected="selected" {{/if}}> DA </option>
       <option value="BA" {{if $item.bsn_ptt_d_type eq 'BA'}} selected="selected" {{/if}}> BA </option>
       <option value="TBC" {{if $item.bsn_ptt_d_type eq 'TBC'}} selected="selected" {{/if}}> TBC </option>
       <option value="ED" {{if $item.bsn_ptt_d_type eq 'ED'}} selected="selected" {{/if}}> ED </option>
       </select>
       
       <script>
		function update_d_type(id,value)
		{
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}/planning_task_tracker.update_d_type/bsn_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	</script>
         
       </td>
       
        <td>{{$item.prd_name}} </td>
       <td style="text-align:center;" ><a href = "{{$item.link}}" target="blank">Link</a></td>
        <td style="text-align:center;" ><a href = "{{$item.link2}}" target="blank">Link</a></td>
       <td>{{$item.dayscount}} </td>
       <td><input type="button" value="Print" onclick="document.location.href='{{$BASE_URL}}{{$XFA.home}}/print/{{$item.bsn_id}}'" /></td>
   
        <td> 
       <form name="mlist123" method="post" enctype="multipart/form-data"> 
        <input type="hidden" name="bsn_id" value="{{$item.bsn_id}}"  />
       <input type="file" name="pr_letter" /><br />
        {{if $item.bc_ptt_letter}}
        <div style="text-align:center;"> <a href="{{$BASE_URL}}files/cma/{{$item.bc_ptt_letter}}" target="_blank">Download</a></div> {{/if}}
       <input type= "submit" name="savedata" title="Save" value="Upload" class="set2"> &nbsp; 
        </form>
        </td>
       
       {{ if $item.bs_traffic_light eq 1}}
       <td style="background:#00CC33";>
       <a href="{{$BASE_URL}}planning_task_tracker.colorbox/bsn_id/{{$item.bsn_id}}" class="various">Color</a>
       <br /><br />{{$item.bs_tl_user}}<br />{{$item.bs_tl_date}}<br />
        <a href="{{$BASE_URL}}planning_task_tracker.reason/bsn_id/{{$item.bsn_id}}" class="various">Read</a>
       </td>
       {{ elseif  $item.bs_traffic_light eq 2}}
       <td style="background: #ff7f27";>
       <a href="{{$BASE_URL}}planning_task_tracker.colorbox/bsn_id/{{$item.bsn_id}}" class="various">Color</a>
       <br /><br />{{$item.bs_tl_user}}<br />{{$item.bs_tl_date}}<br />
       <a href="{{$BASE_URL}}planning_task_tracker.reason/bsn_id/{{$item.bsn_id}}" class="various">Read</a>
       </td>
       {{ elseif  $item.bs_traffic_light eq 3}}
       <td style="background: #F00";>
       <a href="{{$BASE_URL}}planning_task_tracker.colorbox/bsn_id/{{$item.bsn_id}}" class="various">Color</a>
      <br /><br />{{$item.bs_tl_user}}<br />{{$item.bs_tl_date}}<br />
      <a href="{{$BASE_URL}}planning_task_tracker.reason/bsn_id/{{$item.bsn_id}}" class="various">Read</a>
       </td>
       {{else }}
       <td>
       <a href="{{$BASE_URL}}planning_task_tracker.colorbox/bsn_id/{{$item.bsn_id}}" class="various">Color</a></td>
       {{/if}}
       
       <td>
       <select name="letter[{{$item.bs_customers_id}}]" Onchange = "update_letter({{$item.bs_customers_id}},this.value)" >
          {{foreach from=$letterData key="key2" item="item2"}}
          <option value="{{$item2.lt_code}}"    {{if $item2.lt_code eq $item.bcust_ptt_letter_text}} selected="selected" {{/if}}>{{$item2.lt_code}}</option>
          {{/foreach}}
          </select>
       <!--  {{if $item.bcust_ptt_letter_text_date}}{{$item.bcust_ptt_letter_text_date}} &nbsp; &nbsp; {{$item.bcust_ptt_letter_text_user}}{{/if}}
	-->  <div id="usr2{{$item.bs_customers_id}}">{{$item.bcust_ptt_letter_text_date}}<br />{{$item.bcust_ptt_letter_text_user}} </div>
	 <script>
 	   
        function update_letter(id,value)
		{
		var tana2 = "#usr2"+id;
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}planning_task_tracker.update_lettertext/id/"+id+"/value/"+value,
				   success: function(result){
					  $(tana2).html(result); 
			   }
			 });
		}
	
       </script>
         
       </td>
       
     {{foreach from=$item.task key="keyh" item="itemh"}}
     {{if $itemh}}
     	{{if $itemh eq  'N / R'}}
     		<th valign="middle" style="width:100px; background:#0CF;" >
                <a href="{{$BASE_URL}}business.taskdetail/bsn_id/{{$item.bsn_id}}/uid/{{$keyh}}" target="_blank">{{$itemh}}</a></th>
        {{else}}
        	<th valign="middle" style="background:#0C0;">
                <a href="{{$BASE_URL}}business.taskdetail/bsn_id/{{$item.bsn_id}}/uid/{{$keyh}}" target="_blank">{{$itemh}}</a> </th>
        {{/if}}        
                
     {{else}}
     <th  align="center" valign="middle" style="width:100px;" >
      <a href="{{$BASE_URL}}business.taskdetail/bsn_id/{{$item.bsn_id}}/uid/{{$keyh}}" target="_blank">View<br />Task</a></th>
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
         
         <td>
         <input type="text" name="bsn_orginal_csbd[{{$item.bsn_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo1_{{$item.bsn_id}}" value="{{$item.bsn_orginal_csbd}}"  /> 
             <input type="submit" value="Set" name="original" class="set" />
          </td>
         <td>
         <input type="text" name="bsn_latest_csbd[{{$item.bsn_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo2_{{$item.bsn_id}}" value="{{$item.bsn_latest_csbd}}"  /> 
             <input type="submit" value="Set" name="latest" class="set" /> m
          </td>
         <td> {{$item.dd}}</td>
          
      <td>Completed Task: {{$item.completed}}%
          <br />Not Req. Task : {{$item.notreq }}%
       </td>
      
      </td>
      <td> {{if $item.bc_ptt_letter eq ''}}<span style="color: #F00;"> Weekly Letter Not Uploaded </span>
      {{elseif $item.bc_planning_task_report eq ''}}<span style="color: #F00;"> 7 Day Task Report Not Generated</span> {{else}}
      <input type="button" value="Merge" onclick="document.location.href='{{$BASE_URL}}{{$XFA.home}}/merge/{{$item.bsn_id}}'" /> {{/if}}
      </td>
      <td> </td>
      <td> </td>
      <td> </td>
      <td><strong>{{$item.bcust_fname}} &nbsp; {{$item.bcust_lname}}</strong> <br />
        {{$item.bsn_address}}
      </td>
      
       </tr>
      {{assign var=countn value=$countn-1}}
      {{/foreach}}
      </tbody>
  
    {{/if}}
  </table>
    </form>

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
<!--</p>-->
</div>