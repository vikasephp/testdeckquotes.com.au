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


function add_letter()
{
	var viewurl = "{{$BASE_URL}}construction_in_progress_report.viewletter"+ "/random/" + Math.random();	
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

function add_stage()
{
	var viewurl = "{{$BASE_URL}}construction_in_progress_report.view_stage"+ "/random/" + Math.random();	
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

function add_sn()
{
	var viewurl = "{{$BASE_URL}}construction_in_progress_report.view_sn"+ "/random/" + Math.random();	
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
	var viewurl = "{{$BASE_URL}}construction_in_progress_report.view_procedure"+ "/random/" + Math.random();	

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
	var viewurl = "{{$BASE_URL}}construction_in_progress_report.view_type"+ "/random/" + Math.random();	

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
	  
#fancybox-wrap {z-index:9999999;} 
	  
</style>

<h3 class="page-title">Construction In Progress Report</h3>
<br />

<div style="float:left; margin-left:10px; text-align:left; padding-bottom:2px;">
<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> &nbsp;
<input type="button" name="type_options" value="Type Options" onclick="javascript:add_type();" /> 
<form name="hidden_show" method="post" action="">
&nbsp;&nbsp;<strong>Procedure Link </strong><input type="text" name="proc" value="{{$proc_detail.tl_link}}" style="width:700px" /> 

<input type="submit" value="Update Link" name="update_link"  /> <br />
<input type="button" name="Add New" value="Letter Text Admin" onclick="javascript:add_letter();" /> 
<input type="button" name="Add New" value="Stage Admin" onclick="javascript:add_stage();" /> 
<input type="button" name="Add New" value="Sth/Nth Admin" onclick="javascript:add_sn();" /> 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<span style="border:2px solid #F60; padding:10px; display:inline-block; margin-bottom:4px;">
 <input type="submit" name="last_audit" value="Audit Manager" />&nbsp;&nbsp;
{{if $amData.la_user}}<strong> {{$amData.la_user}} &nbsp; {{$amData.la_date}}</strong> {{/if}} </span>
</form>
</div>
<div style="clear:both; width:100%; margin: 6px 0 12px 10px;">
<div style="float:left; text-align:left;">
<form name="mshort" method="post" action="">
<strong>Project search :</strong>
<datalist id="cipr_project">
	{{foreach from=$project_data key="keyp" item="itemp"}}
	<option value="{{$itemp.bsn_name}}">{{$itemp.bsn_name}}</option>
	{{/foreach}}
</datalist>
<input type="text" list="cipr_project" name="search_proj" value="{{$search_proj}}" style="width:350px;" placeholder="Search for Address" />
&nbsp;
<strong>Location search :</strong>
<select name="search_location" style="width:150px;">
	<option value="">Select Location</option>
	{{foreach from=$snData key="keysnf" item="itemsnf"}}
	<option value="{{$itemsnf.sn_id}}" {{if $search_location eq $itemsnf.sn_id}} selected="selected" {{/if}}>{{$itemsnf.sn_option}}</option>
	{{/foreach}}
</select>
<input type="submit" value="Search" name="location_search" />
<input type="submit" name="clear" value="Clear All Filter" />
</form>
</div>
<div style="float:right;">
<form name="hidden_show" method="post" action="">
<input type="button" value="Export To XLS" onclick="document.location.href='{{$BASE_URL}}construction_in_progress_report.home/export/1'" /> &nbsp;
<input type="submit" name="showhidden" value="Show Hidden" />
</form>
</div>
<div style="clear:both;"></div>
</div>

<div style="float:left; width:100%; margin-top:5px;">
  <table id="doclist-table" class="nav-back" width="100%">
    <thead>
      <tr>
        <th class="topmenu" align="center" valign="middle" width="3%">SrNo</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Set Date</th>
        <th class="topmenu" align="center" valign="middle" width="12%">Address</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Sth/Nth</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Type</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Stage</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Link</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Live Calendar</th>
         <th class="topmenu" align="center" valign="middle" width="3%">CC Link</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Site Camera </th>
        <th class="topmenu" align="center" valign="middle" width="3%">Document Click</th>
         
         <th class="topmenu" align="center" valign="middle" width="3%">Traffic Light</th>
         <th class="topmenu" align="center" valign="middle" width="3%">Commenced Onsite Date</th>
         <th class="topmenu" align="center" valign="middle" width="3%">Days</th>
         <th class="topmenu" align="center" valign="middle" width="8%">Total Days Added</th>
         <th class="topmenu" align="center" valign="middle" width="8%">Total Time Delay Letters </th>
         <th class="topmenu" align="center" valign="middle" width="8%">Revised HIA Completion Date</th>
         <th class="topmenu" align="center" valign="middle" width="8%">EST HOD Date</th>
        
         <th class="topmenu" align="center" valign="middle" width="4%">Letter Text</th>
         <th class="topmenu" align="center" valign="middle" width="6%">To receive Construction Progress letter</th>
         <th class="topmenu" align="center" valign="middle" width="6%">Smartsheet Setup</th>
         <th class="topmenu" align="center" valign="middle" width="6%">Calendar</th>
         
         <th class="topmenu" align="center" valign="middle" width="3%">Weekly Update Letter</th>
         <th class="topmenu" align="center" valign="middle" width="3%">Latest Client Letter</th>
         
        <th class="topmenu" align="center" valign="middle" width="6%">Hide From Report</th>
      </tr>
    {{if $list}}
    <tbody>
    <form name="mlist" method="post">
      <!--{{assign var=countn value= $numstartvounter}}-->
       {{assign var=countn value= $total}}
      
      {{foreach from=$list key="key" item="item"}}
      <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
        <td> {{$countn}} </td>
        <td>
        <form name="setdt" method="post" action="">
        <input type="hidden" name="setdt[{{$item.bsn_id}}]"  id="demo21_{{$item.bsn_id}}" value="{{$item.bsn_id}}"  />
        <input type="submit" value="Set" name="set_date" class="set" />
        </form>
        </td>
        <td>{{$item.bsn_name}}</td>
        <td> 
          <select name="sn[{{$item.bsn_id}}]" Onchange = "update_sn({{$item.bsn_id}},this.value)" >
          {{foreach from=$snData key="keysn" item="itemsn"}}
           <option value="{{$itemsn.sn_id}}"  {{if $itemsn.sn_id eq $item.bs_cipr_sn}} selected="selected" {{/if}}>{{$itemsn.sn_option}}</option>
          {{/foreach}}
           </select>
         
	 <script>
 	   
        function update_sn(id,value)
		{
		
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}construction_in_progress_report.update_sn_th/id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
       </script>
        </td>
  	<td>
        <select name="{{$TABLE}}[{{$item.bsn_id}}]"  Onchange = "update_type({{$item.bsn_id}},this.value)">
                <option value="-1" {{if $item.bs_cip_type eq -1}} selected="selected" {{/if}}>Please Select </option>
                {{foreach from = $typedetail key="key4" item="item4"}}
                 <option value="{{$item4.cp_id}}" {{if $item4.cp_id eq $item.bs_cip_type}} selected="selected" {{/if}}>{{$item4.cp_type}}</option>
                {{/foreach}}
       </select>
        
        <script>
	   
		function update_type(id,value)
		{
			
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}construction_in_progress_report.update_type/bsn_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	</script>
        
        </td>
  
        
         <td>
         <form name="stset" method="post" action="">
           <select name="stage[{{$item.bsn_id}}]" Onchange = "update_stage({{$item.bsn_id}},this.value)" >
          {{foreach from=$stageData key="key3" item="item3"}}
          <option value="{{$item3.st_id}}"  {{if $item3.st_id eq $item.bs_cip_stage}} selected="selected" {{/if}}>{{$item3.st_stage}}</option>
          {{/foreach}}
          </select>
         &nbsp; &nbsp; {{$item.bs_cip_stage_date}} <br /> {{$item.bs_cip_stage_user}}
         <input type="hidden" name="state_date_set[{{$item.bsn_id}}]"  id="demo20_{{$item.bsn_id}}" value="{{$item.bsn_id}}"  />
         <input type="submit" value="Set" name="stage_date" class="set" />
         </form>
	    <script>
 	   
        function update_stage(id,value)
		{
		
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}construction_in_progress_report.update_stage/id/"+id+"/value/"+value,
				   success: function(result){
					    location.reload();
			   }
			 });
			 
		}
	
       </script>
        
         
         </td>
        <td style="text-align:center;" ><a href = "{{$item.link}}" target="blank">Link</a></td>
        <td style="text-align:center;">{{if $item.bsn_live_proj_calendar}} <a href="{{$item.bsn_live_proj_calendar}}" target="_blank">Link</a>{{/if}} </td>
        <td>{{if $item.bsn_cc_link}} <a href="{{$item.bsn_cc_link}}" target="_blank">Link</a>{{/if}}
        </td>
        
        <td style="text-align:center;">{{if $item.bsn_site_camera}} <a href="{{$item.bsn_site_camera}}" target="_blank">Link</a>{{/if}} </td>
        <td style="text-align:center;">{{if $item.bsn_document_click}} <a href="{{$item.bsn_document_click}}" target="_blank">Link</a>{{/if}} </td>
        
          {{ if $item.bs_con_in_prog_tl eq 1}}
       <td style="background:#00CC33; color:#FFF";>
       <a href="{{$BASE_URL}}construction_in_progress_report.colorbox/bsn_id/{{$item.bsn_id}}" class="various">Color</a>
       <br /><br />{{$item.bs_con_in_prog_tl_user}}<br />{{$item.bs_con_in_prog_tl_date}}<br />
        <a href="{{$BASE_URL}}construction_in_progress_report.reason/bsn_id/{{$item.bsn_id}}" class="various">Read</a>
       </td>
       {{ elseif  $item.bs_con_in_prog_tl eq 2}}
       <td style="background: #ff7f27; color:#FFF";>
       <a href="{{$BASE_URL}}construction_in_progress_report.colorbox/bsn_id/{{$item.bsn_id}}" class="various">Color</a>
       <br /><br />{{$item.bs_con_in_prog_tl_user}}<br />{{$item.bs_con_in_prog_tl_date}}<br />
       <a href="{{$BASE_URL}}construction_in_progress_report.reason/bsn_id/{{$item.bsn_id}}" class="various">Read</a>
       </td>
       {{ elseif  $item.bs_con_in_prog_tl eq 3}}
       <td style="background: #F00; color:#FFF";>
       <a href="{{$BASE_URL}}construction_in_progress_report.colorbox/bsn_id/{{$item.bsn_id}}" class="various">Color</a>
       <br /><br />{{$item.bs_con_in_prog_tl_user}}<br />{{$item.bs_con_in_prog_tl_date}}<br />
       <a href="{{$BASE_URL}}construction_in_progress_report.reason/bsn_id/{{$item.bsn_id}}" class="various">Read</a>
       </td>
       {{else }}
       <td>
       <a href="{{$BASE_URL}}construction_in_progress_report.colorbox/bsn_id/{{$item.bsn_id}}" class="various">Color</a></td>
       {{/if}}
       <td>
       <form name ="ccd" method="post" action="" id="myForm3" enctype="multipart/form-data">
         <input type="text" name="bsn_cip_commed_onsite[{{$item.bsn_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo10_{{$item.bsn_id}}" value="{{$item.bsn_cip_com_on_date}}"  /> 
        {{if $item.bsn_cip_com_on_date}}<br /> {{$item.bsn_cip_com_on_user}}<br />{{$item.bsn_cip_com_on_userdt}} {{/if}}
         <input type="submit" value="Set" name="commed" class="set" />
         </form>
       </td>
       
       <td>{{$item.days2}}</td>
       
         <td>
	<strong>{{$item.bsn_cip_total_days_added}}</strong>
         <!--
         <br />
         <div id="tana_{{$item.bsn_id}}">{{$item.bsn_cip_daysadded_date}} <br />
         {{$item.bsn_cip_daysadded_user}}
          </div>
         -->
         
         <!--<form name ="tda" method="post" action="" id="myForm4" enctype="multipart/form-data">
         <input type="text" name="bsn_cip_daysadded_date[{{$item.bsn_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo11_{{$item.bsn_id}}" value="{{$item.bsn_cip_daysadded_date}}"  /> 
         <input type="submit" value="Set" name="totdays" class="set" />
         </form> -->
          
         </td>
       
       <td>{{$item.total_delay}}</td>
       
        <td> 
         <form name ="ccd" method="post" action="" id="myForm3" enctype="multipart/form-data">
         <input type="text" name="bs_c_in_p_comm_onsite[{{$item.bsn_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo3_{{$item.bsn_id}}" value="{{$item.bs_c_in_p_comm_onsite}}"  /> 
        {{if $item.bs_c_in_p_comm_onsite}}<br /> {{$item.bs_c_in_p_hia_user}}<br />{{$item.bs_c_in_p_hia_date}} {{/if}}
         <input type="submit" value="Set" name="latest" class="set" />
         </form>
         
        </td>
        <td> 
         <form name ="forcast" method="post" action="" id="myForm4" enctype="multipart/form-data">
         <input type="text" name="bs_c_in_p_forcast[{{$item.bsn_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo4_{{$item.bsn_id}}" value="{{$item.bs_c_in_p_forcast}}"  /> 
         <input type="submit" value="Set" name="est" class="set" />
           {{if $item.bs_c_in_p_forcast}} {{$item.bs_c_in_p_est_user}}<br />{{$item.bs_c_in_p_est_date}} {{/if}}
    
         </form>
        
         </td> 
       
         <td>
          <select name="letter[{{$item.bsn_id}}]" Onchange = "update_letter({{$item.bsn_id}},this.value)" >
          {{foreach from=$letterData key="key2" item="item2"}}
          <option value="{{$item2.lt_code}}"    {{if $item2.lt_code eq $item.bs_cip_letter_text}} selected="selected" {{/if}}>{{$item2.lt_code}}</option>
          {{/foreach}}
          </select>
          {{if $item.bs_cip_letter_text}} {{$item.bs_cip_letter_user}}<br />{{$item.bs_cip_letter_date}} {{/if}}
	 <script>
 	   
        function update_letter(id,value)
		{
		
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}construction_in_progress_report.update_lettertext/id/"+id+"/value/"+value,
				   success: function(result){
					location.reload();   
			   }
			 });
		}
	
       </script>
         
         </td>
         <td> 
        <form name ="cipl" method="post" action="">
     	<input type="hidden" name="cip_l[{{$item.bsn_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="cip_l[{{$item.bsn_id}}]" value="1"  onclick="this.form.submit();" {{if $item.bs_cip_receive_cpl eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       
        </label> 
      </form>  
         
         </td>
         
         <td> 
        <form name ="cipl" method="post" action="">
     	<input type="hidden" name="smart[{{$item.bsn_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="smart[{{$item.bsn_id}}]" value="1"  onclick="this.form.submit();" {{if $item.bs_cipr_smartsheet eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
        </label>
        {{if $item.bs_cipr_smartsheet}} {{$item.bs_cipr_smart_user}}<br />{{$item.bs_cipr_smart_date}} {{/if}}
        </form>  
         </td>
         
         <td> 
        <form name="cal" method="post" enctype="multipart/form-data"> 
        <input type="hidden" name="bsn_id" value="{{$item.bsn_id}}"  />
        <input type="file" name="calendar" /><br />
        {{if $item.bsn_cip_calendar}}
        <div style="text-align:center;"> 
        <!--<a href="https://deckquote.s3.amazonaws.com/files/uploads/{{$item.bsn_cip_calendar}}" target="_blank">Download</a>-->
        <a href="/construction_in_progress_report.download_content?file_name={{$item.bsn_cip_calendar}}&module_name=construction_in_progress_report.home" target="_blank">Download</a>
        
        <a href="{{$BASE_URL}}construction_in_progress_report.delete_cal/bsn_id/{{$item.bsn_id}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img src="{{$BASE_URL}}/images/delete_icon.png" width="20" /></a>
        <br />{{$item.bsn_cip_calendar_user}}<br />{{$item.bsn_cip_calendar_date}} 
        </div> {{/if}}
       <input type= "submit" name="save_cal" title="Save" value="Upload" class="set2"> &nbsp; 
        </form>
         </td>
         
         <td> 
		 
		 {{if $item.weekly_update_455}}
		 <a href="{{$BASE_URL}}construction_in_progress_report.download_content?file_name={{$item.weekly_update_455}}&module_name=construction_in_progress_report.document_check_list" title="{{$item.weekly_update_455}}" target="_blank">Download</a>
		 {{/if}}     
         
        <!-- <form name="mlist123" method="post" enctype="multipart/form-data"> 
        <input type="hidden" name="bsn_id" value="{{$item.bsn_id}}"  />
        <input type="file" name="in_letter" /><br />
        {{if $item.bsn_cip_letter}}
        <div style="text-align:center;"> 
        <a href="/construction_in_progress_report.download_content?file_name={{$item.bsn_cip_letter}}&module_name=construction_in_progress_report.home" target="_blank">Download</a>
        
        <a href="{{$BASE_URL}}construction_in_progress_report.delete_wcl/bsn_id/{{$item.bsn_id}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img src="{{$BASE_URL}}/images/delete_icon.png" width="20" /></a>
   
        </div> {{/if}}
       <input type= "submit" name="savedata" title="Save" value="Upload" class="set2"> &nbsp; 
        </form>-->
		</td>
         
        <td> 
        
        <form name="pw" method="post" enctype="multipart/form-data"> 
        <input type="hidden" name="bcust_id" value="{{$item.bcust_id}}"  />
        <input type="file" name="letter" /><br />
        {{if $item.bcust_cip_latest_letter}}
        <div style="text-align:center;"> 
       <!-- <a href="https://deckquote.s3.amazonaws.com/files/uploads/{{$item.bcust_cip_latest_letter}}" target="_blank">Download</a>-->
        
         <a href="/construction_in_progress_report.download_content?file_name={{$item.bcust_cip_latest_letter}}&module_name=construction_in_progress_report.home" target="_blank">Download</a>
       
        <a href="{{$BASE_URL}}construction_in_progress_report.delete_w/bcust_id/{{$item.bcust_id}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img src="{{$BASE_URL}}/images/delete_icon.png" width="20" /></a>
   
        </div> {{/if}}
        <input type= "submit" name="upload_letter" title="Save" value="Upload" class="set2"> &nbsp; 
        </form>
         </td> 
         
        <td> 
       <form name ="recmet22" method="post" action="">
     	<input type="hidden" name="hide[{{$item.bcust_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="hide[{{$item.bcust_id}}]" value="1"  onclick="this.form.submit();" {{if $item.bcust_cip_hide eq 1 }} checked="checked" {{/if}} />
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
      <td align="center"><div class='pagination'> {{if $pagenum == 1}} <span class='disabled'>� previous</span> {{else}} <a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{math equation="x - y" x=$pagenum y=1}}" title="Previous">� previous</a> {{/if}}
          
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
          {{if $pagenum == $last}} <span class='disabled'>next �</span> {{else}} <a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{math equation="x + y" x=$pagenum y=1}}" title="Next">next �</a></div>
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