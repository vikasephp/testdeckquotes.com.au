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
	var viewurl = "{{$BASE_URL}}pre_construction_report.view_procedure"+ "/random/" + Math.random();	

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

.wrapper1, .wrapper2{width: 100%; border: none 0px RED;overflow-x: scroll; overflow-y:hidden; scrollbar-color: yellow blue;}
.wrapper1{height: 20px; }
.wrapper2{ }
.div1 {width:2280px; height: 20px; }
.div2 {width:2280px;  overflow: auto;}  

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
&nbsp;&nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> <br />
<strong>Sort Order</strong>
<select name="sortorder">
<option value="1" {{if $ascdsc eq 1 }} selected="selected" {{/if}} > Ascending </option>
<option value="2" {{if $ascdsc eq 2 }} selected="selected" {{/if}} > Descending </option>
</select>
<strong>Sort By :</strong>
<input type="submit" value="Days At Status" name="daysat"  />
<input type="submit" value="Traffic Light" name="traffic"  />
&nbsp; &nbsp; <input type="submit" value="Add Tasks" name="add_task"  /> 


</div>
<div style="float:right;">
<input type="button" value="Export To XLS" onclick="document.location.href='{{$BASE_URL}}{{$XFA.home}}/export/1'" /> &nbsp;
</div>
<br /> <br />
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
        <th class="topmenu" align="center" valign="middle" style="width:10%;">Pre Construction Manager</th>
        <th class="topmenu" align="center" valign="middle" style="width:5%;">Link</th>
        <th class="topmenu" align="center" valign="middle" style="width:5%;">Starting Onsite Date</th>
        <th class="topmenu" align="center" valign="middle" style="width:5%;">Days at <br />Status</th>
        <th class="topmenu" align="center" valign="middle" style="width:8%;">Traffic Light</th>
        <th class="topmenu" align="center" valign="middle" style="width:8%;">Planning Traffic Light</th>
        <th class="topmenu" align="center" valign="middle" style="width:8%;">Inclusions Traffic Light</th>
        <th class="topmenu" align="center" valign="middle" style="width:8%;">Construction Package</th>
        
        <th class="topmenu" align="center" valign="middle" style="width:12%;">UID-658</th>
        <th class="topmenu" align="center" valign="middle" style="width:12%;">UID-387</th>
        <th class="topmenu" align="center" valign="middle" style="width:12%;">UID-386</th>
        <th class="topmenu" align="center" valign="middle" style="width:8%;">Wall and Roof Frame Quote</th>
        <th class="topmenu" align="center" valign="middle" style="width:12%;">UID-363</th>
        <th class="topmenu" align="center" valign="middle" style="width:12%;">Floor System Quote</th>
        <th class="topmenu" align="center" valign="middle" style="width:12%;">UID-364</th>
        
        <th class="topmenu" align="center" valign="middle" style="width:8%;">Electrical Utility Provider Service Mark</th>
        <th class="topmenu" align="center" valign="middle" style="width:8%;">Approved - Exterior Colours and Materials - Signed by Customer</th>
        <th class="topmenu" align="center" valign="middle" style="width:8%;">Home Warranty Insurance Certificate</th>
        <th class="topmenu" align="center" valign="middle" style="width:8%;">Construction Commencement Report</th>
        
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
    <td> </td>
  
    <td><input type="text" name="uid658" style="width:200px;" value="{{$ppdata.pcr_uid658}}"  onkeyup = "update_658(this.value)"/> </td>
    <td><input type="text" name="uid387" style="width:200px;" value="{{$ppdata.pcr_uid387}}"  onkeyup = "update_387(this.value)"/></td>
    <td><input type="text" name="uid386" style="width:200px;" value="{{$ppdata.pcr_uid386}}"  onkeyup = "update_386(this.value)"/> </td>
    <td> </td>
    <td><input type="text" name="uid363" style="width:200px;" value="{{$ppdata.pcr_uid363}}"  onkeyup = "update_363(this.value)"/> </td>
    <td> </td>
    <td><input type="text" name="uid364" style="width:200px;" value="{{$ppdata.pcr_uid364}}"  onkeyup = "update_364(this.value)"/> </td>
    <td> </td>
    <td> </td>
    <td> </td>
    <td> </td>
    </tr>

   <script>
	   
		function update_658(value)
		{
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}pre_construction_report.update_658/value/"+value,
					   success: function(result){
					}
				});
		}
		
		
		function update_387(value)
		{
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}pre_construction_report.update_387/value/"+value,
					   success: function(result){
					}
				});
		}
		
		function update_386(value)
		{
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}pre_construction_report.update_386/value/"+value,
					   success: function(result){
					}
				});
		}
		
		function update_363(value)
		{
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}pre_construction_report.update_363/value/"+value,
					   success: function(result){
					}
				});
		}
		
		function update_364(value)
		{
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}pre_construction_report.update_364/value/"+value,
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
       <td>{{$item.bsn_starting_onsite_date}}</td>
       <td>{{$item.dayscount}} </td>
       
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
       
       {{ if $item.bs_traffic_light eq 1}}
       <td style="background:#00CC33";><br /><br />{{$item.bs_tl_user}}<br />{{$item.bs_tl_date}}<br />
       <a href="{{$BASE_URL}}construction_pipeline_report.reason/bsn_id/{{$item.bsn_id}}/a/1" class="various">Read</a>
       </td>
       {{ elseif  $item.bs_traffic_light eq 2}}
       <td style="background: #ff7f27";><br /><br />{{$item.bs_tl_user}}<br />{{$item.bs_tl_date}}<br />
       <a href="{{$BASE_URL}}construction_pipeline_report.reason/bsn_id/{{$item.bsn_id}}/a/1" class="various">Read</a>
       </td>
       {{ elseif  $item.bs_traffic_light eq 3}}
       <td style="background: #F00";><br /><br />{{$item.bs_tl_user}}<br />{{$item.bs_tl_date}}<br />
       <a href="{{$BASE_URL}}construction_pipeline_report.reason/bsn_id/{{$item.bsn_id}}/a/1" class="various">Read</a>
       </td>
        {{ elseif  $item.bs_traffic_light eq 4}}
        <td style="background: #FFFF00";><br /><br />{{$item.bs_tl_user}}<br />{{$item.bs_tl_date}}<br />
       <a href="{{$BASE_URL}}construction_pipeline_report.reason/bsn_id/{{$item.bsn_id}}/a/1" class="various">Read</a>
       </td>
       {{else }}
       
       <td></td>
       {{/if}}
       
       {{ if $item.bs_traffic_light_incl eq 1}}
       <td style="background:#00CC33";><br />{{$item.bs_tl_user_incl}}<br />{{$item.bs_tl_date_incl}}<br>
       <a href="{{$BASE_URL}}construction_pipeline_report.reason/bsn_id/{{$item.bsn_id}}/a/2" class="various">Read</a>
       </td>
       {{ elseif  $item.bs_traffic_light_incl eq 2}}
       <td style="background: #ff7f27";><br />{{$item.bs_tl_user_incl}}<br />{{$item.bs_tl_date_incl}}<br />
       <a href="{{$BASE_URL}}construction_pipeline_report.reason/bsn_id/{{$item.bsn_id}}/a/2" class="various">Read</a>
       </td>
       
       {{ elseif  $item.bs_traffic_light_incl eq 3}}
       <td style="background: #F00";><br />{{$item.bs_tl_user_incl}}<br />{{$item.bs_tl_date_incl}}<br />
       <a href="{{$BASE_URL}}construction_pipeline_report.reason/bsn_id/{{$item.bsn_id}}/a/2" class="various">Read</a>
       </td>
       {{else }}
       <td></td>
       {{/if}} 
       
       {{ if $item.construction_package}}
       <td> 
        <!--<a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.construction_package}}" target="_blank">Download </a>-->
        <a href="/pre_construction_report.download_content?file_name={{$item.construction_package}}&module_name=pre_construction_report.home" target="_blank">Download </a>
        </td>
        {{else}}
        <td style="background:#F00"></td>
        {{/if}}
       
       
       
       
       {{if $item.uid658}}
     	{{if $item.uid658 eq  'N / R'}}
     		<th valign="middle" style="width:100px;" >
                <a href="{{$BASE_URL}}business.taskdetail/bsn_id/{{$item.bsn_id}}/uid/658/pcr/1">{{$item.uid658}}</a></th>
        {{else}}
        	<th valign="middle" style="background:#0C0;">
                <a href="{{$BASE_URL}}business.taskdetail/bsn_id/{{$item.bsn_id}}/uid/658/pcr/1">{{$item.uid658}}</a> </th>
        {{/if}}        
                
       {{else}}
   	    <th  align="center" valign="middle" style="width:100px;" >
    	  <a href="{{$BASE_URL}}business.taskdetail/bsn_id/{{$item.bsn_id}}/uid/658/pcr/1">View<br />Task</a></th>
      {{/if}}
       
       
       
       {{if $item.uid387}}
     	{{if $item.uid387 eq  'N / R'}}
     		<th valign="middle" style="width:100px;" >
                <a href="{{$BASE_URL}}business.taskdetail/bsn_id/{{$item.bsn_id}}/uid/387/pcr/1">{{$item.uid387}}</a></th>
        {{else}}
        	<th valign="middle" style="background:#0C0;">
                <a href="{{$BASE_URL}}business.taskdetail/bsn_id/{{$item.bsn_id}}/uid/387/pcr/1">{{$item.uid387}}</a> </th>
        {{/if}}        
                
     {{else}}
     <th  align="center" valign="middle" style="width:100px;" >
      <a href="{{$BASE_URL}}business.taskdetail/bsn_id/{{$item.bsn_id}}/uid/387/pcr/1">View<br />Task</a></th>
     {{/if}}



         {{if $item.uid386}}
            {{if $item.uid386 eq  'N / R'}}
                <th valign="middle" style="width:100px;" >
                    <a href="{{$BASE_URL}}business.taskdetail/bsn_id/{{$item.bsn_id}}/uid/386/pcr/1">{{$item.uid386}}</a></th>
            {{else}}
                <th valign="middle" style="background:#0C0;">
                    <a href="{{$BASE_URL}}business.taskdetail/bsn_id/{{$item.bsn_id}}/uid/386/pcr/1">{{$item.uid386}}</a> </th>
            {{/if}}        
                    
         {{else}}
             <th  align="center" valign="middle" style="width:100px;" >
             <a href="{{$BASE_URL}}business.taskdetail/bsn_id/{{$item.bsn_id}}/uid/386/pcr/1">View<br />Task</a></th>
         {{/if}}

       
        {{if $item.wall_roof}}
        <td>
        <!--<a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.wall_roof}}" target="_blank">Download </a>-->
       <a href="/pre_construction_report.download_content?file_name={{$item.wall_roof}}&module_name=pre_construction_report.home" target="_blank">Download </a>
        
        </td>
        {{else}}
        <td style="background:#F00"></td>
        {{/if}}
       
       
       
       {{if $item.uid363}}
     	{{if $item.uid363 eq  'N / R'}}
     		<th valign="middle" style="width:100px;" >
                <a href="{{$BASE_URL}}business.taskdetail/bsn_id/{{$item.bsn_id}}/uid/363/pcr/1">{{$item.uid363}}</a></th>
        {{else}}
        	<th valign="middle" style="background:#0C0;">
                <a href="{{$BASE_URL}}business.taskdetail/bsn_id/{{$item.bsn_id}}/uid/363/pcr/1">{{$item.uid363}}</a> </th>
        {{/if}}        
                
      {{else}}
     		<th  align="center" valign="middle" style="width:100px;" >
      		<a href="{{$BASE_URL}}business.taskdetail/bsn_id/{{$item.bsn_id}}/uid/363/pcr/1">View<br />Task</a></th>
      {{/if}}
       
       
       
       
        {{if $item.floor_system}}
        <td> 
       <!-- <a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.floor_system}}" target="_blank">Download </a>-->
           <a href="/pre_construction_report.download_content?file_name={{$item.floor_system}}&module_name=pre_construction_report.home" target="_blank">Download </a>
        </td>
        {{else}}
        <td style="background:#F00"></td>
        {{/if}}
       
       
         {{if $item.uid364}}
            {{if $item.uid364 eq  'N / R'}}
                    <th valign="middle" style="width:100px;" >
                    <a href="{{$BASE_URL}}business.taskdetail/bsn_id/{{$item.bsn_id}}/uid/364/pcr/1">{{$item.uid364}}</a></th>
            {{else}}
                    <th valign="middle" style="background:#0C0;">
                    <a href="{{$BASE_URL}}business.taskdetail/bsn_id/{{$item.bsn_id}}/uid/364/pcr/1">{{$item.uid364}}</a> </th>
            {{/if}}        
                        
         {{else}}
                   <th  align="center" valign="middle" style="width:100px;" >
                   <a href="{{$BASE_URL}}business.taskdetail/bsn_id/{{$item.bsn_id}}/uid/364/pcr/1">View<br />Task</a></th>
         {{/if}}   
       
       
       
        {{if $item.doc_file_name_421}}
       <td> 
       <!-- <a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name_421}}" target="_blank">Download </a>-->
           <a href="/pre_construction_report.download_content?file_name={{$item.doc_file_name_421}}&module_name=pre_construction_report.home" target="_blank">Download </a>
        </td>
        {{else}}
        <td style="background:#F00"></td>
        {{/if}}
       
        {{if $item.doc_file_name_258}}
        <td> 
        <!--<a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name_258}}" target="_blank">Download </a>-->
           <a href="/pre_construction_report.download_content?file_name={{$item.doc_file_name_258}}&module_name=pre_construction_report.home" target="_blank">Download </a>
        </td>
        {{else}}
        <td style="background:#F00"></td>
        {{/if}}
      
        {{if $item.doc_file_name_121}}
        <td> 
       <!-- <a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name_121}}" target="_blank">Download </a>-->
           <a href="/pre_construction_report.download_content?file_name={{$item.doc_file_name_121}}&module_name=pre_construction_report.home" target="_blank">Download </a>
        </td>
        {{else}}
        <td style="background:#F00"></td>
        {{/if}}
      
      
        {{if $item.doc_file_name_625}}
        <td> 
      <!--  <a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name_625}}" target="_blank">Download </a>-->
           <a href="/pre_construction_report.download_content?file_name={{$item.doc_file_name_625}}&module_name=pre_construction_report.home" target="_blank">Download </a>
        </td>
        {{else}}
        <td style="background:#F00"></td>
        {{/if}}
      
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
</div>

