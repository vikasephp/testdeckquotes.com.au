
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
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


function add_procedure()
{
	var viewurl = "{{$BASE_URL}}entity_referal_report.view_procedure"+ "/random/" + Math.random();	

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
	var viewurl = "{{$BASE_URL}}entity_referal_report.view_type"+ "/random/" + Math.random();	

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

body{style="border:1px solid #F00;"}
 
.tooltip:hover .tooltiptext {
    visibility: visible;
}

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
	   
.wrapper1, .wrapper2{width: 100%; border: none 0px RED; overflow-x: scroll; overflow-y:hidden; scrollbar-color: yellow blue; }	   

.wrapper1{height: 20px; }
.wrapper2{ }
.div1 {width:2450px; height: 20px; }
.div2 {width:3450px; overflow: auto;}   
.tableFixHead          { overflow-y: auto; height: 1200px; overflow-x:hidden }
.tableFixHead thead th { position: sticky; top: 0; text-align:left; }
table  { border-collapse: collapse; width: 100%; }
th     { z-index:9999; }
 #fancybox-wrap {z-index:9999999;}   
 
 
}

tr:nth-child(even){background-color: #f2f2f2}


.grid-container {
    display: grid;
    grid-template-columns: 1fr 1fr;
    grid-gap: 20px;
}

</style>

<h3 class="page-title">Entity Referal Report</h3>
<br />

<form name="sort" method="post">
<div style="float:left; text-align: left; left; margin-left:10px;  text-align:left; display:grid; grid-template-columns: 1fr 1fr;">
<div style="margin-right:10px; text-align:left;">
&nbsp; &nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> &nbsp;
<input type="button" name="type_options" value="Type Options" onclick="javascript:add_type();" /> 
<br />

&nbsp; <strong>Search:</strong>&nbsp;&nbsp;
<input type="text" name="searchkey" value="{{$searchkey}}" style="width:230px;" placeholder="Search By Checklist Number"/>
&nbsp;&nbsp;
<input type="submit" value="Search" name="searchaddr"  />
<input type="submit" value="Clear Search" name="clear"  /> 
<br />
&nbsp; <strong>Search:</strong>&nbsp;&nbsp;
<input type="text" name="projectname" value="{{$searchkey}}" style="width:230px;" placeholder="Search By Project Name after -"/>
&nbsp;&nbsp;
<input type="submit" value="Search" name="searchaddr"  />
<input type="submit" value="Clear Search" name="clear"  /> 

<br />
<input type="submit" value="Sort By Project" name="sort_project"  />
<input type="submit" value="Sort By Uid" name="sort_uid"  />
<input type="submit" value="Sort By Application Submitted" name="sort_appsub"  />
</form>
 <form name ="law" method="post" action="">
<span style="display:inline-flex; font-weight:bold; vertical-align:middle; margin-left:5px;">  Last Audit : &nbsp;

     	<input type="hidden" name="audit_whole[{{$wlaData.la_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="audit_whole[{{$wlaData.la_id}}]" value="1"  onclick="this.form.submit();" {{if $wlaData.la_last_audit  eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form>  
{{if $wlaData.la_last_audit  eq 1 }} Date : &nbsp;{{ $wlaData.la_last_audit_date}} &nbsp; &nbsp;&nbsp; Who : {{ $wlaData.la_last_audit_user}} {{/if}}   
       
</span>
<br />
</div>

<form name="mlist2" method="post">
<div style="width:28%;">
<table border="1" style="font-weight:bold;" cellpadding="3">
<tr>
<td></td>
<td>Status</td>
</tr>
<tr>
<td>Design Phase</td>
<td><input type= "submit" name="design_phase" title="Save" value="{{$design_phase}}" ></td>
</tr>
<tr>
<td>Planning</td>
<td><input type= "submit" name="planning" title="Save" value="{{$planning}}" ></td>
</tr>
<tr>
<td>Construction</td>
<td><input type= "submit" name="construction" title="Save" value="{{$construction}}" ></td>
</tr>
</table>
</div>
</div>

<div style="float:right; text-align: left;">
<input type="submit" value="Show Hidden" name="unhide"  /> 
</div>
</form>
<form name="mlist" method="post">

<br />
<div class="wrapper1">
    <div class="div1">
    </div>
</div>

<!--<div class="wrapper2">
    <div class="div2 tableFixHead" >-->
    
    <div style="border:1px solid black;width:auto;height:auto;overflow-y:hidden;overflow-x:scroll;">
    
    <div class="div2 tableFixHead" >
  <table id="doclist-table" class="nav-back" width="100%">
    <thead>
      <tr>
        <th class="topmenu" align="center" valign="middle" style="width:5px;">UID</th>
        <th class="topmenu" align="center" valign="middle" style="width:250px;">Project</th>
        <th class="topmenu" align="center" valign="middle" style="width:250px;">Project Status</th>
        <th class="topmenu" align="center" valign="middle" style="width:15px;">Relevant Checklist Numbers</th>
        <th class="topmenu" align="center" valign="middle" style="width:80px;">Link</th>
        <th class="topmenu" align="center" valign="middle" style="width:80px;">Days Count</th>
        <th class="topmenu" align="center" valign="middle" style="width:140px;">Latest Plan</th>
        <th class="topmenu" align="center" valign="middle" style="width:120px;">Is Change Service Required</th>
        <th class="topmenu" align="center" valign="middle" style="width:120px;">Icon Water Asset Survey Requested</th>
        <th class="topmenu" align="center" valign="middle" style="width:120px;">Pre-Filled WSCC Form</th>
        <th class="topmenu" align="center" valign="middle" style="width:150px;">Signed ICON Minor Works</th>
        <th class="topmenu" align="center" valign="middle" style="width:140px;">Minor Works Form Submitted</th>
        <th class="topmenu" align="center" valign="middle" style="width:120px;">Icon Sufferance</th> 
        <th class="topmenu" align="center" valign="middle" style="width:120px;">Does ICON Sufferance need to be sent</th> 
        <th class="topmenu" align="center" valign="middle" style="width:140px;">Icon Water WSCC Letter Received</th>
        <th class="topmenu" align="center" valign="middle" style="width:140px;">Application Submitted</th>
      
        <th class="topmenu" align="center" valign="middle" style="width:140px;">Water Assessment</th> 
        <th class="topmenu" align="center" valign="middle" style="width:140px;">Water Ref</th>
        <th class="topmenu" align="center" valign="middle" style="width:140px;">Electricity Assessment</th>
        <th class="topmenu" align="center" valign="middle" style="width:140px;">Electric Ref</th>  
        <th class="topmenu" align="center" valign="middle" style="width:140px;">Gas Assessment</th>  
        <th class="topmenu" align="center" valign="middle" style="width:140px;">Gas Ref</th> 
        <th class="topmenu" align="center" valign="middle" style="width:140px;">Storm Water Assessment</th> 
        <th class="topmenu" align="center" valign="middle" style="width:140px;">Storm Ref</th>  
        
        <th class="topmenu" align="center" valign="middle" style="width:140px;">Heritage Assessment</th> 
        <th class="topmenu" align="center" valign="middle" style="width:140px;">Heritage Ref</th>
        
        <th class="topmenu" align="center" valign="middle" style="width:140px;">Tree Assessment</th> 
        <th class="topmenu" align="center" valign="middle" style="width:140px;">Tree Ref</th> 
    
        <!--<th class="topmenu" align="center" valign="middle" style="width:140px;">Entity Referral Update</th>-->
   <!--     <th class="topmenu" align="center" valign="middle" style="width:140px;">Tree Survey</th>-->
        <th class="topmenu" align="center" valign="middle" style="width:180px;">Tree Doc</th>
     
        <th class="topmenu" align="center" valign="middle" style="width:120px;">ERR Document</th>
        <th class="topmenu" align="center" valign="middle" style="width:120px;">Fire Rating</th>
        <th class="topmenu" align="center" valign="middle" style="width:120px;">Hide/Unhide</th> 
        <th class="topmenu" align="center" valign="middle" style="width:120px;">Entity Referral Letter</th>
        <th class="topmenu" align="center" valign="middle" style="width:220px;">Traffic Light</th> 
 
       </tr>
    </thead>
    {{if $list}}

   
        <tbody>
       {{assign var=countn value= $total}}
      
      {{foreach from=$list key="key" item="item"}}
     
      <tr {{if $item.dpn_dr_per_complete eq 100}} bgcolor="#99CC99" {{else}} bgcolor="{{cycle values="#dceff5,WHITE" advance=true}} {{/if}}">
      <td>{{$item.dpn_id}}</td>  
      <td>{{$item.bsn_name}}</td>
       <td> {{$item.status}}</td>
      <td>{{$item.dpn_unique_id}} </td>
      <td style="text-align:center;" ><a href = "{{$item.link}}" target="blank">Link</a></td>
      <td>{{$item.dayscount}}</td>
      <td>
      {{$item.doc_date_uploaded_20}}<br />
      {{if $item.doc_file_name_20}} 
 
    <a href="/entity_referal_report.download_content?file_name={{$item.doc_file_name_20}}&module_name=entity_referal_report.home" target="_blank">Download</a>
      
      {{/if}}
    
       </td>
      <td> 
        <form name ="recmet3" method="post" action="">
     	<input type="hidden" name="service[{{$item.dpn_unique_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="service[{{$item.dpn_unique_id}}]" value="1"  onclick="this.form.submit();" {{if $item.dpn_err_service_req eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
        </label> 
        </form>  
          {{if $item.dpn_err_service_req  eq 0 }}{{$item.dpn_err_service_date}}<br />{{$item.dpn_err_service_user}}<br />{{/if}}
          <a href="{{$BASE_URL}}entity_referal_report.notes/dpn_unique_id/{{$item.dpn_unique_id|ltrim:'0'}}" class="various">Notes</a> 
      </td>
      <td>{{$item.bt_completed_date_123}} </td>
      <td>
      {{$item.doc_date_uploaded_136}}<br />
      {{if $item.doc_file_name_136}} 
      
       <a href="/entity_referal_report.download_content?file_name={{$item.doc_file_name_136}}&module_name=entity_referal_report.home" target="_blank">Download</a>
  
      
      {{/if}}
    
      </td>
   
    
      <td>{{$item.doc_date_uploaded_517}}<br />
      {{if $item.doc_file_name}} 
      
    <a href="/entity_referal_report.download_content?file_name={{$item.doc_file_name}}&module_name=entity_referal_report.home" target="_blank">Download</a>
      
      {{/if}}
      </td> 
       <td>{{if $item.bt_complete eq 1}} {{$item.bt_completed_date}} {{/if}} </td>
      
     <td>{{$item.doc_date_uploaded_635}}<br />
    {{if $item.doc_file_name_635}} 
    
     <a href="/entity_referal_report.download_content?file_name={{$item.doc_file_name_635}}&module_name=entity_referal_report.home" target="_blank">Download</a>
  
    
    {{/if}}
     </td> 
     <td>  
     <select name="design_type[{{$item.chknoData}}]" Onchange = "does_icon({{$item.dpn_unique_id|ltrim:'0'}},this.value)" >
      <option value=""    {{if $item.dpn_err_does_icon eq ''}} selected="selected" {{/if}}>Please Select </option>
       <option value="SR Letter"    {{if $item.dpn_err_does_icon eq 'SR Letter'}} selected="selected" {{/if}}> SR Letter </option>
       <option value="FPE Letter"   {{if $item.dpn_err_does_icon eq 'FPE Letter'}} selected="selected" {{/if}}> FPE Letter</option>
    </select>
       
       <script>
 	   
        function does_icon(id,value)
		{
		
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}entity_referal_report.update_does_icon/dpn_unique_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
	
       </script>
     
     </td>
      <td>{{$item.doc_date_uploaded_518}}<br />
   {{if $item.doc_file_name_518}} 
   
    <a href="/entity_referal_report.download_content?file_name={{$item.doc_file_name_518}}&module_name=entity_referal_report.home" target="_blank">Download</a>
  
   
   {{/if}}
   
       </td> 
        <td> 
       <input type="text" name="app_sub[{{$item.dpn_unique_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo5_{{$item.dpn_unique_id}}" value="{{$item.dpn_appl_submitted}}" onfocus = "update_app_submitted({{$item.dpn_unique_id|ltrim:'0'}},this.value)"  /> 
      <div id="as{{$item.dpn_unique_id|ltrim:'0'}}">{{$item.dpn_gas_ref_date}}<br />{{$item.dpn_gas_ref_user}}</div>   
         <script>
	   
	   function update_app_submitted(id,value)
		{
		var tana10 = "#as"+id;	
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}entity_referal_report.app_submitted/dpn_unique_id/"+id+"/value/"+value,
				   success: function(result){
					   $(tana10).html(result);
			   }
			 });
		}
	
       </script>
        
     
     </td>

    
        <td>{{$item.doc_date_uploaded_627}} <br />
        {{if $item.doc_file_name_627}} 
        
        <a href="/entity_referal_report.download_content?file_name={{$item.doc_file_name_627}}&module_name=entity_referal_report.home" target="_blank">Download</a>
{{/if}}  
        </td>
        
        <td {{if $item.dpn_water_ref eq 'Not Required' }} style="background: #F90;" {{elseif $item.dpn_water_ref eq 'Fails' }} style="background: #F00;" {{elseif $item.dpn_water_ref eq 'Requested and Waiting For Entity'}} style="background: #FF0;" {{elseif $item.dpn_water_ref eq 'Not Requested'}} style="background:#0CF;" {{elseif $item.dpn_water_ref eq 'Passed With Conditions'}} style="background: #3F0;" {{else}} style="background: #FFF;" {{/if}}>
       
     <select name="design_type[{{$item.chknoData}}]" Onchange = "water_ref({{$item.dpn_unique_id|ltrim:'0'}},this.value)" >
     <option value=""  >Please Select</option>
      <option value="Not Required"    {{if $item.dpn_water_ref eq 'Not Required'}} selected="selected" {{/if}}>Not Required</option>
      <option value="Not Requested"    {{if $item.dpn_water_ref eq 'Not Requested'}} selected="selected" {{/if}}>Not Requested</option>
      <option value="Requested and Waiting For Entity"  {{if $item.dpn_water_ref eq 'Requested and Waiting For Entity'}} selected="selected" {{/if}}>Requested and Waiting For Entity</option>
      <option value="Passed With Conditions" {{if $item.dpn_water_ref eq 'Passed With Conditions'}} selected="selected" {{/if}}>Passed With Conditions</option>
     <option value="Fails"   {{if $item.dpn_water_ref eq 'Fails'}} selected="selected" {{/if}}>Fails</option>
    </select>
      
      <div id="usr1{{$item.dpn_unique_id|ltrim:'0'}}">{{$item.dpn_water_ref_date}}<br />{{$item.dpn_water_ref_user}}
      <br /><a href="{{$BASE_URL}}entity_referal_report.notes_water/dpn_unique_id/{{$item.dpn_unique_id|ltrim:'0'}}" class="various">Notes</a> 
  
      </div>  
      
        <script>
 	   
        function water_ref(id,value)
		{
		 var tana1 = "#usr1"+id;
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}entity_referal_report.update_ref/dpn_unique_id_w/"+id+"/value/"+value,
				   success: function(result){
					   $(tana1).html(result);
			   }
			 });
		}
	
       </script>
        
        
         </td>
        
        
        <td>{{$item.doc_date_uploaded_628}}<br />
        {{if $item.doc_file_name_628}} 
        
        <a href="/entity_referal_report.download_content?file_name={{$item.doc_file_name_628}}&module_name=entity_referal_report.home" target="_blank">Download</a>
        
        {{/if}}
        
        
        </td>
        
        <td {{if $item.dpn_electric_ref eq 'Not Required' }} style="background: #F90;" {{elseif $item.dpn_electric_ref eq 'Fails' }} style="background: #F00;" {{elseif $item.dpn_electric_ref eq 'Requested and Waiting For Entity'}} style="background: #FF0;" {{elseif $item.dpn_electric_ref eq 'Not Requested'}} style="background:#0CF;" {{elseif $item.dpn_electric_ref eq 'Passed With Conditions'}} style="background: #3F0;" {{else}} style="background: #FFF;" {{/if}}>
       
     <select name="design_type[{{$item.chknoData}}]" Onchange = "electric_ref({{$item.dpn_unique_id|ltrim:'0'}},this.value)" >
     <option value=""  >Please Select</option>
      <option value="Not Required"    {{if $item.dpn_electric_ref eq 'Not Required'}} selected="selected" {{/if}}>Not Required</option>
      <option value="Not Requested"    {{if $item.dpn_electric_ref eq 'Not Requested'}} selected="selected" {{/if}}>Not Requested</option>
      <option value="Requested and Waiting For Entity"  {{if $item.dpn_electric_ref eq 'Requested and Waiting For Entity'}} selected="selected" {{/if}}>Requested and Waiting For Entity</option>
      <option value="Passed With Conditions" {{if $item.dpn_electric_ref eq 'Passed With Conditions'}} selected="selected" {{/if}}>Passed With Conditions</option>
     <option value="Fails"   {{if $item.dpn_electric_ref eq 'Fails'}} selected="selected" {{/if}}>Fails</option>
    </select>
    
    <div id="usr2{{$item.dpn_unique_id|ltrim:'0'}}">{{$item.dpn_electric_ref_date}}<br />{{$item.dpn_electric_ref_user}}
        <br /><a href="{{$BASE_URL}}entity_referal_report.notes_electric/dpn_unique_id/{{$item.dpn_unique_id|ltrim:'0'}}" class="various">Notes</a> 
  
     </div>
    
    <script>
 	   
        function electric_ref(id,value)
		{
		var tana2 = "#usr2"+id;
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}entity_referal_report.update_ref/dpn_unique_id_e/"+id+"/value/"+value,
				   success: function(result){
					    $(tana2).html(result);
			   }
			 });
		}
	
       </script>
    
         </td>
          
        <td>{{$item.doc_date_uploaded_629}} <br />
          {{if $item.doc_file_name_629}} 
          
              <a href="/entity_referal_report.download_content?file_name={{$item.doc_file_name_629}}&module_name=entity_referal_report.home" target="_blank">Download</a>  
          
          {{/if}}
        </td> 
       
        <td {{if $item.dpn_gas_ref eq 'Not Required' }} style="background: #F90" {{elseif $item.dpn_gas_ref eq 'Fails' }} style="background: #F00;" {{elseif $item.dpn_gas_ref eq 'Requested and Waiting For Entity'}} style="background: #FF0;" {{elseif $item.dpn_gas_ref eq 'Not Requested'}} style="background:#0CF;" {{elseif $item.dpn_gas_ref eq 'Passed With Conditions'}} style="background: #3F0;" {{else}} style="background: #FFF;" {{/if}}>
       
     <select name="design_type[{{$item.chknoData}}]" Onchange = "gas_ref({{$item.dpn_unique_id|ltrim:'0'}},this.value)" >
     <option value=""  >Please Select</option>
      <option value="Not Required"    {{if $item.dpn_gas_ref eq 'Not Required'}} selected="selected" {{/if}}>Not Required</option>
      <option value="Not Requested"    {{if $item.dpn_gas_ref eq 'Not Requested'}} selected="selected" {{/if}}>Not Requested</option>
      <option value="Requested and Waiting For Entity"  {{if $item.dpn_gas_ref eq 'Requested and Waiting For Entity'}} selected="selected" {{/if}}>Requested and Waiting For Entity</option>
      <option value="Passed With Conditions" {{if $item.dpn_gas_ref eq 'Passed With Conditions'}} selected="selected" {{/if}}>Passed With Conditions</option>
     <option value="Fails"   {{if $item.dpn_gas_ref eq 'Fails'}} selected="selected" {{/if}}>Fails</option>
    </select>
    
    
    </select>
    
    <div id="usr3{{$item.dpn_unique_id|ltrim:'0'}}">{{$item.dpn_gas_ref_date}}<br />{{$item.dpn_gas_ref_user}} 
          <br /><a href="{{$BASE_URL}}entity_referal_report.notes_gas/dpn_unique_id/{{$item.dpn_unique_id|ltrim:'0'}}" class="various">Notes</a> 
 
    </div>
    
     <script>
 	   
        function gas_ref(id,value)
		{
		var tana3 = "#usr3"+id;
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}entity_referal_report.update_ref/dpn_unique_id_g/"+id+"/value/"+value,
				   success: function(result){
					    $(tana3).html(result);
			   }
			 });
		}
	
       </script>
    
    
         </td>
       
        <td>
        {{$item.doc_date_uploaded_630}} <br />
          {{if $item.doc_file_name_630}} 
       <a href="/entity_referal_report.download_content?file_name={{$item.doc_file_name_630}}&module_name=entity_referal_report.home" target="_blank">Download</a>    
          {{/if}}
        </td> 
     
        <td {{if $item.dpn_storm_ref eq 'Not Required' }} style="background: #F90" {{elseif $item.dpn_storm_ref eq 'Fails' }} style="background: #F00;" {{elseif $item.dpn_storm_ref eq 'Requested and Waiting For Entity'}} style="background: #FF0;" {{elseif $item.dpn_storm_ref eq 'Not Requested'}} style="background:#0CF;" {{elseif $item.dpn_storm_ref eq 'Passed With Conditions'}} style="background: #3F0;" {{else}} style="background: #FFF;" {{/if}}>
       
     <select name="design_type[{{$item.chknoData}}]" Onchange = "storm_ref({{$item.dpn_unique_id|ltrim:'0'}},this.value)" >
     <option value=""  >Please Select</option>
      <option value="Not Required"    {{if $item.dpn_storm_ref eq 'Not Required'}} selected="selected" {{/if}}>Not Required</option>
      <option value="Not Requested"    {{if $item.dpn_storm_ref eq 'Not Requested'}} selected="selected" {{/if}}>Not Requested</option>
      <option value="Requested and Waiting For Entity"  {{if $item.dpn_storm_ref eq 'Requested and Waiting For Entity'}} selected="selected" {{/if}}>Requested and Waiting For Entity</option>
      <option value="Passed With Conditions" {{if $item.dpn_storm_ref eq 'Passed With Conditions'}} selected="selected" {{/if}}>Passed With Conditions</option>
     <option value="Fails"   {{if $item.dpn_storm_ref eq 'Fails'}} selected="selected" {{/if}}>Fails</option>
    </select>
    
    <div id="usr4{{$item.dpn_unique_id|ltrim:'0'}}">{{$item.dpn_storm_ref_date}}<br />{{$item.dpn_storm_ref_user}} 
     <br /><a href="{{$BASE_URL}}entity_referal_report.notes_storm/dpn_unique_id/{{$item.dpn_unique_id|ltrim:'0'}}" class="various">Notes</a> 
 
    </div>
    
     <script>
 	   
        function storm_ref(id,value)
		{
		var tana4 = "#usr4"+id;
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}entity_referal_report.update_ref/dpn_unique_id_s/"+id+"/value/"+value,
				   success: function(result){
					    $(tana4).html(result);
			   }
			 });
		}
	
       </script>
     
         </td>

   <td>
     {{$item.doc_date_uploaded_716}} <br />
          {{if $item.doc_file_name_716}} 
       <a href="/entity_referal_report.download_content?file_name={{$item.doc_file_name_716}}&module_name=entity_referal_report.home" target="_blank">Download</a>    
          {{/if}}
   </td>
   
   <td {{if $item.dpn_heritage_ref eq 'Not Required' }} style="background: #F90" {{elseif $item.dpn_heritage_ref eq 'Fails' }} style="background: #F00;" {{elseif $item.dpn_heritage_ref eq 'Requested and Waiting For Entity'}} style="background: #FF0;" {{elseif $item.dpn_heritage_ref eq 'Not Requested'}} style="background:#0CF;" {{elseif $item.dpn_heritage_ref eq 'Passed With Conditions'}} style="background: #3F0;" {{else}} style="background: #FFF;" {{/if}}>
       
     <select name="design_type[{{$item.chknoData}}]" Onchange = "heritage_ref({{$item.dpn_unique_id|ltrim:'0'}},this.value)" >
     <option value=""  >Please Select</option>
      <option value="Not Required"    {{if $item.dpn_heritage_ref eq 'Not Required'}} selected="selected" {{/if}}>Not Required</option>
      <option value="Not Requested"    {{if $item.dpn_heritage_ref eq 'Not Requested'}} selected="selected" {{/if}}>Not Requested</option>
      <option value="Requested and Waiting For Entity"  {{if $item.dpn_heritage_ref eq 'Requested and Waiting For Entity'}} selected="selected" {{/if}}>Requested and Waiting For Entity</option>
      <option value="Passed With Conditions" {{if $item.dpn_heritage_ref eq 'Passed With Conditions'}} selected="selected" {{/if}}>Passed With Conditions</option>
     <option value="Fails"   {{if $item.dpn_heritage_ref eq 'Fails'}} selected="selected" {{/if}}>Fails</option>
    </select>
    
    <div id="usr6{{$item.dpn_unique_id|ltrim:'0'}}">{{$item.dpn_heritage_ref_date}}<br />{{$item.dpn_heritage_ref_user}} 
     <br /><a href="{{$BASE_URL}}entity_referal_report.notes_heritage/dpn_unique_id/{{$item.dpn_unique_id|ltrim:'0'}}" class="various">Notes</a> 
 
    </div>
    
     <script>
 	   
        function heritage_ref(id,value)
		{
		var tana6 = "#usr6"+id;
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}entity_referal_report.update_ref/dpn_unique_id_h/"+id+"/value/"+value,
				   success: function(result){
					    $(tana6).html(result);
			   }
			 });
		}
	
       </script>

     <td>{{$item.doc_date_uploaded_717}} <br />
          {{if $item.doc_file_name_717}} 
       <a href="/entity_referal_report.download_content?file_name={{$item.doc_file_name_717}}&module_name=entity_referal_report.home" target="_blank">Download</a>    
          {{/if}}
     </td>
     
            <td {{if $item.dpn_tree_ref eq 'Not Required' }} style="background: #F90" {{elseif $item.dpn_tree_ref eq 'Fails' }} style="background: #F00;" {{elseif $item.dpn_tree_ref eq 'Requested and Waiting For Entity'}} style="background: #FF0;" {{elseif $item.dpn_tree_ref eq 'Not Requested'}} style="background:#0CF;" {{elseif $item.dpn_tree_ref eq 'Passed With Conditions'}} style="background: #3F0;" {{else}} style="background: #FFF;" {{/if}}>
       
     <select name="design_type[{{$item.chknoData}}]" Onchange = "tree_ref({{$item.dpn_unique_id|ltrim:'0'}},this.value)" >
     <option value=""  >Please Select</option>
      <option value="Not Required"    {{if $item.dpn_tree_ref eq 'Not Required'}} selected="selected" {{/if}}>Not Required</option>
      <option value="Not Requested"    {{if $item.dpn_tree_ref eq 'Not Requested'}} selected="selected" {{/if}}>Not Requested</option>
      <option value="Requested and Waiting For Entity"  {{if $item.dpn_tree_ref eq 'Requested and Waiting For Entity'}} selected="selected" {{/if}}>Requested and Waiting For Entity</option>
      <option value="Passed With Conditions" {{if $item.dpn_tree_ref eq 'Passed With Conditions'}} selected="selected" {{/if}}>Passed With Conditions</option>
     <option value="Fails"   {{if $item.dpn_tree_ref eq 'Fails'}} selected="selected" {{/if}}>Fails</option>
    </select>
    
    <div id="usr5{{$item.dpn_unique_id|ltrim:'0'}}">{{$item.dpn_tree_ref_date}}<br />{{$item.dpn_tree_ref_user}} 
     <br /><a href="{{$BASE_URL}}entity_referal_report.notes_tree/dpn_unique_id/{{$item.dpn_unique_id|ltrim:'0'}}" class="various">Notes</a> 
 
    </div>
    
     <script>
 	   
        function tree_ref(id,value)
		{
		var tana5 = "#usr5"+id;
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}entity_referal_report.update_ref/dpn_unique_id_t/"+id+"/value/"+value,
				   success: function(result){
					    $(tana5).html(result);
			   }
			 });
		}
	
       </script>
     

          
<!--          <td> m2
       <select name="design_type[{{$item.chknoData}}]" Onchange = "update_tree_survey({{$item.dpn_unique_id|ltrim:'0'}},this.value)" >
       <option value="TBD"   {{if $item.dpn_er_tree_survey eq 'TBD'}} selected="selected" {{/if}}>TBD</option>
       <option value="Not Required"   {{if $item.dpn_er_tree_survey eq 'Not Required'}} selected="selected" {{/if}}>Not Required</option>
       <option value="Required"   {{if $item.dpn_er_tree_survey eq 'Required'}} selected="selected" {{/if}}>Required</option>
       <option value="Required,Requested"   {{if $item.dpn_er_tree_survey eq 'Required,Requested'}} selected="selected" {{/if}}>Required,Requested</option>
      <option value="Received"   {{if $item.dpn_er_tree_survey eq 'Received'}} selected="selected" {{/if}}>Received</option>
      
       </select>
    
    <div id="usrtree{{$item.dpn_unique_id|ltrim:'0'}}">{{$item.dpn_storm_ref_date}}<br />{{$item.dpn_storm_ref_user}} </div>
           <script>
 	   
        function update_tree_survey(id,value)
		{
		var tana5 = "#usrtree"+id;
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}entity_referal_report.update_tree_survey/dpn_unique_id/"+id+"/value/"+value,
				   success: function(result){
					 $(tana5).html(result);   
			   }
			 });
		}
	
       </script> 
          
          </td>-->
          
          <td>
          {{$item.doc_date_uploaded_632}} <br />
          {{if $item.doc_file_name_632}} 
          
          <!--<a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name_632}}" target="_blank">Download</a>-->
          <a href="/entity_referal_report.download_content?file_name={{$item.doc_file_name_632}}&module_name=entity_referal_report.home" target="_blank">Download</a>
          
          {{/if}}
          </td>
          
  <td>
       {{$item.doc_date_uploaded_138}}<br />
      {{if $item.doc_file_name_138}} 
      
    <!--  <a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name_138}}" target="_blank">Download</a>-->
      <a href="/entity_referal_report.download_content?file_name={{$item.doc_file_name_138}}&module_name=entity_referal_report.home" target="_blank">Download</a>
      
      {{/if}}
     </td>
   
      <td>
       {{$item.doc_date_uploaded_137}}<br />
      {{if $item.doc_file_name_137}} 
      
      <!--<a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name_137}}" target="_blank">Download</a>-->
      <a href="/entity_referal_report.download_content?file_name={{$item.doc_file_name_137}}&module_name=entity_referal_report.home" target="_blank">Download</a>
      {{/if}}
     </td>
         
          
        <td> 
        <form name ="recmet3" method="post" action="">
     	<input type="hidden" name="hide[{{$item.dpn_unique_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="hide[{{$item.dpn_unique_id}}]" value="1"  onclick="this.form.submit();" {{if $item.dpn_err_hide eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
        </label> 
        </form> 
        </td>  
        
        <td>
        <form name="gen" method="post" action="">
        <input type="hidden" name="bsn_id" value="{{$item.bsn_id}}" />
        <input type="hidden" name="dpn_unique_id" value="{{$item.dpn_unique_id}}" />
        <input type="submit" name="generate" value="Generate" />
        </form>
        </td>
        
       {{ if $item.dpn_err_traffic_light eq 1}}
       <td style="background:#00CC33";>
       <a href="{{$BASE_URL}}entity_referal_report.colorbox/dpn_unique_id/{{$item.dpn_unique_id}}" class="various">Color</a>
       <br /><br />{{$item.dpn_err_traffic_light_user}}<br />{{$item.dpn_err_traffic_light_date}}<br />
        <a href="{{$BASE_URL}}entity_referal_report.reason/dpn_unique_id/{{$item.dpn_unique_id}}" class="various">Read</a>
       </td>
       {{ elseif  $item.dpn_err_traffic_light eq 2}}
       <td style="background: #ff7f27";>
       <a href="{{$BASE_URL}}entity_referal_report.colorbox/dpn_unique_id/{{$item.dpn_unique_id}}" class="various">Color</a>
       <br /><br />{{$item.dpn_err_traffic_light_user}}<br />{{$item.dpn_err_traffic_light_date}}<br />
       <a href="{{$BASE_URL}}entity_referal_report.reason/dpn_unique_id/{{$item.dpn_unique_id}}" class="various">Read</a>
       </td>
       {{ elseif  $item.dpn_err_traffic_light eq 3}}
       <td style="background: #F00";>
       <a href="{{$BASE_URL}}entity_referal_report.colorbox/dpn_unique_id/{{$item.dpn_unique_id}}" class="various">Color</a>
      <br /><br />{{$item.dpn_err_traffic_light_user}}<br />{{$item.dpn_err_traffic_light_date}}<br />
      <a href="{{$BASE_URL}}entity_referal_report.reason/dpn_unique_id/{{$item.dpn_unique_id}}" class="various">Read</a>
       </td>
       {{else }}
       <td>
       <a href="{{$BASE_URL}}entity_referal_report.colorbox/dpn_unique_id/{{$item.dpn_unique_id}}" class="various">Color</a></td>
       {{/if}}
        
          
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
  {{/if}}
  </div>
  </p>
</div>

 </form>