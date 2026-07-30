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
	
	
function add_procedure()
{
	var viewurl = "{{$BASE_URL}}project_plans_report.view_procedure"+ "/random/" + Math.random();	

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

.wrapper1, .wrapper2{width: 1820px; border: none 0px RED;
overflow-x: scroll; overflow-y:hidden; scrollbar-color: yellow blue;}
.wrapper1{height: 20px; }
.wrapper2{ }
.div1 {width:2180px; height: 20px; }
.div2 {width:2180px;  overflow: auto;}  

.tableFixHead          { overflow-y: auto; height: 700px; }
.tableFixHead thead th { position: sticky; top: 0; text-align:left; }

table  { border-collapse: collapse; width: 100%; }
th     { z-index:9999; }
#fancybox-wrap {z-index:9999999;} 
</style>

<h3 class="page-title">{{$title}}</h3>
<br />

<form name="mlist" method="post" enctype="multipart/form-data">

<div style="float:left;padding-left:10px; text-align:left;">
&nbsp; &nbsp; <input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> <br />
<strong>Sort Order</strong>
<select name="sortorder">
<option value="1" {{if $ascdsc eq 1 }} selected="selected" {{/if}} > Ascending </option>
<option value="2" {{if $ascdsc eq 2 }} selected="selected" {{/if}} > Descending </option>
</select>
<strong>Sort By :</strong>
<input type="submit" value="Days At Status" name="daysat"  />
<input type="submit" value="Traffic Light" name="traffic"  />

<input type="submit" value="Hide 312 Completed Task" name="hide312"  />
<input type="submit" value="Hide 301 Completed Task" name="hide301"  />
<input type="submit" value="Hide 330 Completed Task" name="hide330"  />
<input type="submit" value="Hide 369 Completed Task" name="hide369"  />
</div>
<div style="float:right;">

<!--<input type="submit" value="Print All Reports" name="printall"  />-->
<input type="button" value="Export To XLS" onclick="document.location.href='{{$BASE_URL}}{{$XFA.home}}/export/1'" /> &nbsp;
</div>

<div class="wrapper1">
    <div class="div1">
    </div>
</div>

<div class="wrapper2">
    <div class="div2 tableFixHead">

  <table id="doclist-table" class="nav-back" width="100%">
    <thead>
      <tr>
        <th class="topmenu" align="center" valign="middle" style="width:2%;">SrNo</th>
        <th class="topmenu" align="center" valign="middle" style="width:15%;">Address</th>
        <th class="topmenu" align="center" valign="middle" style="width:5%;">D Type</th>
        <th class="topmenu" align="center" valign="middle" style="width:10%;">Planning Manager</th>
        <th class="topmenu" align="center" valign="middle" style="width:5%;">Link</th>
        <th class="topmenu" align="center" valign="middle" style="width:5%;">Days at <br />Status</th>
        <th class="topmenu" align="center" valign="middle" style="width:8%;">Target Date</th>
        <th class="topmenu" align="center" valign="middle" style="width:8%;">Traffic Light</th>
        <th class="topmenu" align="center" valign="middle" style="width:8%;">Survey Implemented</th>
        <th class="topmenu" align="center" valign="middle" style="width:8%;">Project Plans</th>
        <th class="topmenu" align="center" valign="middle" style="width:12%;">UID-312</th>
        <th class="topmenu" align="center" valign="middle" style="width:12%;">UID-301</th>
        <th class="topmenu" align="center" valign="middle" style="width:12%;">UID-330</th>
        <th class="topmenu" align="center" valign="middle" style="width:12%;">UID-369</th>
        
        <th class="topmenu" align="center" valign="middle" style="width:12%;">UID-374</th>
        <th class="topmenu" align="center" valign="middle" style="width:12%;">UID-357</th>
        <th class="topmenu" align="center" valign="middle" style="width:12%;">UID-514</th>
      </tr>
    </thead>  

    {{if $list}}
    <tbody>
    
    <tr bgcolor="WHITE">
    <td> </td>
    <td> </td>
    <td> </td>
    <td> </td>
    <td> </td>
    <td> </td>
    <td> </td>
    <td> </td>
    <td> </td>
    <td> </td>
    <td><input type="text" name="uid312" style="width:150px;" value="{{$ppdata.pp_uid312}}"  onkeyup = "update_312(this.value)"/> </td>
    <td><input type="text" name="uid301" style="width:150px;" value="{{$ppdata.pp_uid301}}"  onkeyup = "update_301(this.value)"/></td>
    <td><input type="text" name="uid330" style="width:150px;" value="{{$ppdata.pp_uid330}}"  onkeyup = "update_330(this.value)"/> </td>
    <td><input type="text" name="uid369" style="width:150px;" value="{{$ppdata.pp_uid369}}"  onkeyup = "update_369(this.value)"/> </td>
    
     <td><input type="text" name="uid369" style="width:150px;" value="{{$ppdata.pp_uid374}}"  onkeyup = "update_374(this.value)"/> </td>
     <td><input type="text" name="uid369" style="width:150px;" value="{{$ppdata.pp_uid357}}"  onkeyup = "update_357(this.value)"/> </td>
     <td><input type="text" name="uid369" style="width:150px;" value="{{$ppdata.pp_uid514}}"  onkeyup = "update_514(this.value)"/> </td>
    </tr>
    
    <script>
	   
		function update_312(value)
		{
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}/project_plans_report.update_312/value/"+value,
					   success: function(result){
					}
				});
		}
		
		
		function update_301(value)
		{
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}/project_plans_report.update_301/value/"+value,
					   success: function(result){
					}
				});
		}
		
		function update_330(value)
		{
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}/project_plans_report.update_330/value/"+value,
					   success: function(result){
					}
				});
		}
		
		function update_369(value)
		{
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}/project_plans_report.update_369/value/"+value,
					   success: function(result){
					}
				});
		}
		
		
		function update_374(value)
		{
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}/project_plans_report.update_374/value/"+value,
					   success: function(result){
					}
				});
		}
		
		function update_357(value)
		{
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}/project_plans_report.update_357/value/"+value,
					   success: function(result){
					}
				});
		}
		
		
		function update_514(value)
		{
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}/project_plans_report.update_514/value/"+value,
					   success: function(result){
					}
				});
		}
		
     </script>
    
    
      <!--{{assign var=countn value= $numstartvounter}}-->
       {{assign var=countn value= $total}}
      
      {{foreach from=$list key="key" item="item"}}
      <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
        <td> {{$countn}} </td>
        <td><strong>{{$item.bcust_fname}} &nbsp; {{$item.bcust_lname}}</strong> <br />
        {{$item.bsn_address}}
        </td>
       <td> 

       {{$item.bsn_ptt_d_type}}
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
        <!--<td style="text-align:center;" ><a href = "{{$item.link2}}" target="blank">Link</a></td>-->
       <td>{{$item.dayscount}} </td>
        <td> 
        <form name ="ccd" method="post" action="" id="myForm3" enctype="multipart/form-data">
         <input type="text" name="bs_ppr_target_date[{{$item.bsn_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo3_{{$item.bsn_id}}" value="{{$item.bs_ppr_target_date}}"  /> 
         <input type="submit" value="Set" name="latest" class="set" />
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
       
       
       {{if $item.bs_ppr_survey_imple eq 'No'}}
       		<td style="background:#F00"> 
       {{else}}
    	   <td>
       {{/if}}  
       <a href="{{$BASE_URL}}project_plans_report.txtmsg/bsn_id/{{$item.bsn_id}}" class="various">
       <img src="{{$BASE_URL}}images/textmsg.png" /></a> &nbsp;       
        <select name="sur_imp" onchange="update_sur_imp({{$item.bsn_id}},this.value)">
        <option value="No"  {{if $item.bs_ppr_survey_imple eq 'No' }} selected="selected" {{/if}} >No</option>
        <option value="Yes" {{if $item.bs_ppr_survey_imple eq 'Yes' }} selected="selected" {{/if}}>Yes</option>
        </select>  <br />
        {{if $item.bs_ppr_survey_imple eq 'Yes' }}{{$item.bs_ppr_survey_imp_user}} <br /> {{$item.bs_ppr_survey_date}}
        {{/if}}
         <script>
	   
		function update_sur_imp(id,value)
		{
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}project_plans_report.update_sur_imp/bsn_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	</script>
             
       </td>
       
       {{ if $item.project_plan}}
       <td> 
       <!-- <a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.project_plan}}" target="_blank">Download </a>-->
       <a href="/project_plans_report.download_content?file_name={{$item.project_plan}}&module_name=project_plans_report.home" target="_blank">Download </a> 
        </td>
        {{else}}
        <td style="background:#F00"></td>
        {{/if}}
        
     {{if $item.uid312}}
     	{{if $item.uid312 eq  'N / R'}}
     		<th valign="middle" style="width:100px;" >
                <a href="{{$BASE_URL}}business.taskdetail/bsn_id/{{$item.bsn_id}}/uid/312/pp/1">{{$item.uid312}}</a></th>
        {{else}}
        	<th valign="middle" style="background:#0C0;">
                <a href="{{$BASE_URL}}business.taskdetail/bsn_id/{{$item.bsn_id}}/uid/312/pp/1">{{$item.uid312}}</a> </th>
        {{/if}}        
                
     {{else}}
     <th  align="center" valign="middle" style="width:100px;" >
      <a href="{{$BASE_URL}}business.taskdetail/bsn_id/{{$item.bsn_id}}/uid/312/pp/1">View<br />Task</a></th>
     {{/if}}

     {{if $item.uid301}}
     	{{if $item.uid301 eq  'N / R'}}
     		<th valign="middle" style="width:100px;" >
                <a href="{{$BASE_URL}}business.taskdetail/bsn_id/{{$item.bsn_id}}/uid/301/pp/1">{{$item.uid301}}</a></th>
        {{else}}
        	<th valign="middle" style="background:#0C0;">
                <a href="{{$BASE_URL}}business.taskdetail/bsn_id/{{$item.bsn_id}}/uid/301/pp/1">{{$item.uid301}}</a> </th>
        {{/if}}        
                
     {{else}}
     <th  align="center" valign="middle" style="width:100px;" >
      <a href="{{$BASE_URL}}business.taskdetail/bsn_id/{{$item.bsn_id}}/uid/301/pp/1">View<br />Task</a></th>
     {{/if}}

     {{if $item.uid330}}
     	{{if $item.uid330 eq  'N / R'}}
     		<th valign="middle" style="width:100px;" >
                <a href="{{$BASE_URL}}business.taskdetail/bsn_id/{{$item.bsn_id}}/uid/330/pp/1">{{$item.uid330}}</a></th>
        {{else}}
        	<th valign="middle" style="background:#0C0;">
                <a href="{{$BASE_URL}}business.taskdetail/bsn_id/{{$item.bsn_id}}/uid/330/pp/1">{{$item.uid330}}</a> </th>
        {{/if}}        
                
     {{else}}
     <th  align="center" valign="middle" style="width:100px;" >
      <a href="{{$BASE_URL}}business.taskdetail/bsn_id/{{$item.bsn_id}}/uid/330/pp/1">View<br />Task</a></th>
     {{/if}}
     
     {{if $item.uid369}}
     	{{if $item.uid369 eq  'N / R'}}
     		<th valign="middle" style="width:100px;" >
                <a href="{{$BASE_URL}}business.taskdetail/bsn_id/{{$item.bsn_id}}/uid/369/pp/1">{{$item.uid369}}</a></th>
        {{else}}
        	<th valign="middle" style="background:#0C0;">
                <a href="{{$BASE_URL}}business.taskdetail/bsn_id/{{$item.bsn_id}}/uid/369/pp/1">{{$item.uid369}}</a> </th>
        {{/if}}        
                
     {{else}}
     <th  align="center" valign="middle" style="width:100px;" >
      <a href="{{$BASE_URL}}business.taskdetail/bsn_id/{{$item.bsn_id}}/uid/369/pp/1">View<br />Task</a></th>
     {{/if}}
       
      {{if $item.uid374}}
     	 {{if $item.uid374 eq  'N / R'}}
     		<th valign="middle" style="width:100px;" >
                <a href="{{$BASE_URL}}business.taskdetail/bsn_id/{{$item.bsn_id}}/uid/374/pp/1">{{$item.uid374}}</a></th>
        {{else}}
        	<th valign="middle" style="background:#0C0;">
                <a href="{{$BASE_URL}}business.taskdetail/bsn_id/{{$item.bsn_id}}/uid/374/pp/1">{{$item.uid374}}</a> </th>
        {{/if}}        
                
     {{else}}
     		<th  align="center" valign="middle" style="width:100px;" >
     	 	<a href="{{$BASE_URL}}business.taskdetail/bsn_id/{{$item.bsn_id}}/uid/374/pp/1">View<br />Task</a></th>
     {{/if}}   
     
        {{if $item.uid357}}
                 {{if $item.uid357 eq  'N / R'}}
                        <th valign="middle" style="width:100px;" >
                        <a href="{{$BASE_URL}}business.taskdetail/bsn_id/{{$item.bsn_id}}/uid/357/pp/1">{{$item.uid357}}</a></th>
                {{else}}
                        <th valign="middle" style="background:#0C0;">
                        <a href="{{$BASE_URL}}business.taskdetail/bsn_id/{{$item.bsn_id}}/uid/357/pp/1">{{$item.uid357}}</a> </th>
                {{/if}}        
                        
             {{else}}
                        <th  align="center" valign="middle" style="width:100px;" >
                        <a href="{{$BASE_URL}}business.taskdetail/bsn_id/{{$item.bsn_id}}/uid/357/pp/1">View<br />Task</a></th>
         {{/if}}  
         
         
    {{if $item.uid514}}
     	 {{if $item.uid514 eq  'N / R'}}
     		<th valign="middle" style="width:100px;" >
                <a href="{{$BASE_URL}}business.taskdetail/bsn_id/{{$item.bsn_id}}/uid/514/pp/1">{{$item.uid514}}</a></th>
        {{else}}
        	<th valign="middle" style="background:#0C0;">
                <a href="{{$BASE_URL}}business.taskdetail/bsn_id/{{$item.bsn_id}}/uid/514/pp/1">{{$item.uid514}}</a> </th>
        {{/if}}        
                
     {{else}}
     		<th  align="center" valign="middle" style="width:100px;" >
     	 	<a href="{{$BASE_URL}}business.taskdetail/bsn_id/{{$item.bsn_id}}/uid/514/pp/1">View<br />Task</a></th>
     {{/if}}   

   
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
<!--  <table id="doclist-table"  width="100%" bgcolor="#d3e8d6">
    <thead>
  
      <tr>
        <td colspan="2">&nbsp;</td>
      </tr>
    </thead>
  </table>-->
</div>
</div>

