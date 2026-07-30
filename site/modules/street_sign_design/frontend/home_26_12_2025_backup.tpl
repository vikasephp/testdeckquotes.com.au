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
				'width': '95%',
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


function show_notes(ssid)
{
	var viewurl = "{{$BASE_URL}}street_sign_design.show-notes-content"+ "/ss_id/" + ssid;	
	
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
var viewurl = "{{$BASE_URL}}street_sign_design.detail"+ "/random/" + Math.random();	
 $(document).ready(function () {
        $.fancybox({
				'width': '95%',
				'height': '90%',
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
	var viewurl = "{{$BASE_URL}}street_sign_design.view_procedure"+ "/random/" + Math.random();	

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
	var viewurl = "{{$BASE_URL}}street_sign_design.view_type"+ "/random/" + Math.random();	
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
        
function add_action()
{
	var viewurl = "{{$BASE_URL}}street_sign_design.view_action"+ "/random/" + Math.random();	
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

function add_intensity()
{
	var viewurl = "{{$BASE_URL}}street_sign_design.view_intensity"+ "/random/" + Math.random();	
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

function add_banneraction()
{
	var viewurl = "{{$BASE_URL}}street_sign_design.view_banner_action"+ "/random/" + Math.random();	
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
	//window.location.reload();
	window.location=window.location;
	}
	
var expanded = false;

function showCheckboxes() {
  var checkboxes = document.getElementById("checkboxes");
  if (!expanded) {
    checkboxes.style.display = "block";
    expanded = true;
  } else {
    checkboxes.style.display = "none";
    expanded = false;
  }
}

function showCheckboxes2() {
  var checkboxes = document.getElementById("checkboxes2");
  if (!expanded) {
    checkboxes.style.display = "block";
    expanded = true;
  } else {
    checkboxes.style.display = "none";
    expanded = false;
  }
}

function showCheckboxes3() {
  var checkboxes = document.getElementById("checkboxes3");
  if (!expanded) {
    checkboxes.style.display = "block";
    expanded = true;
  } else {
    checkboxes.style.display = "none";
    expanded = false;
  }
}

function showCheckboxes4() {
  var checkboxes = document.getElementById("checkboxes4");
  if (!expanded) {
    checkboxes.style.display = "block";
    expanded = true;
  } else {
    checkboxes.style.display = "none";
    expanded = false;
  }
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

.multiselect {
  width: 230px;
  display:inline-block;
}

.multiselect3 {
  width: 220px;
  display:inline-block;
}


.selectBox {
  position: relative;
  
}

.selectBox select {
  width: 100%;
  font-weight: bold;
}

.overSelect {
  position: absolute;
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
}

#checkboxes {
  display: none;
  border: 1px #dadada solid;
  height: 100px;
  overflow-y:scroll;
}

#checkboxes label {
  display: block;
}

#checkboxes label:hover {
  background-color: #1e90ff;
}

#checkboxes2 {
  display: none;
  border: 1px #dadada solid;
  height: 150px;
  overflow-y:scroll;
}

#checkboxes2 label {
  display: block;
}

#checkboxes2 label:hover {
  background-color: #1e90ff;
}

#checkboxes3 {
  display: none;
  border: 1px #dadada solid;
    height: 210px;
  overflow-y:scroll;
}

#checkboxes3 label {
  display: block;
}

#checkboxes3 label:hover {
  background-color: #1e90ff;
}

#checkboxes4 {
  display: none;
  border: 1px #dadada solid;
    height: 150px;
  overflow-y:scroll;
}

#checkboxes4 label {
  display: block;
}

#checkboxes4 label:hover {
  background-color: #1e90ff;
}



</style>

<h3 class="page-title">{{$title}}</h3>
<br />
<table  width="100%"><tr><td></td><td>
<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
<div style="float:left;">
&nbsp;&nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" />
&nbsp;<input type="button" name="sign_type" value="Sign Type Admin" onclick="javascript:add_type();" />
&nbsp;<input type="button" name="sign_action" value="Sign Action Admin" onclick="javascript:add_action();" />
&nbsp;<input type="button" name="intensity" value="Intensity Admin" onclick="javascript:add_intensity();" />
&nbsp;<input type="button" name="banneraction" value="Banner Action Admin" onclick="javascript:add_banneraction();" />
 <br /> <br />
&nbsp;&nbsp;<strong>Pull Up Pull Down Street Sign : </strong><input type="text" name="proc2" value="{{$proc2_detail.tl_link}}" style="width:450px" /> 
<input type="submit" value="Update Link" name="update_link"  /><br />


 <div class="multiselect" >
    <div class="selectBox" onclick="showCheckboxes()" >
      <select>
        <option>Select Intensity</option>
      </select>
      <div class="overSelect"></div>
    </div>
    <div id="checkboxes">
    
    {{foreach from=$intensitydetail key="key12" item="item12"}}
    	<label for="one{{$item12.si_id}}">
        <input type="checkbox" id="one_{{$item12.si_id}}" name="intensity[{{$item12.si_id}}]" value="{{$item12.si_intensity}}" />{{$item12.si_intensity}}</label>
    {{/foreach}}
     
    </div>   
</div>
<input type="submit" name="icity_filter" value="Search" />
  
<div class="multiselect" >
    <div class="selectBox" onclick="showCheckboxes4()" >
      <select>
        <option>Select Status</option>
      </select>
      <div class="overSelect"></div>
    </div>
    <div id="checkboxes4">
    
    {{foreach from=$statusdetail key="key15" item="item15"}}
    	<label for="four{{$item15.si_id}}">
        <input type="checkbox" id="four{{$item15.si_id}}" name="status[{{$item15.si_id}}]" value="{{$item15.st_name}}" />{{$item15.st_name}}</label>
    {{/foreach}}
    </div>
</div>
<input type="submit" value="Search" name="search_status"  /> 
  
  <br />
  

<div class="multiselect" >
    <div class="selectBox" onclick="showCheckboxes2()" >
      <select>
        <option>Select Sign Action</option>
      </select>
      <div class="overSelect"></div>
    </div>
    <div id="checkboxes2">
    
    {{foreach from=$actiondetail key="key11" item="item11"}}
    	<label for="two{{$item11.si_id}}">
        <input type="checkbox" id="two_{{$item11.si_id}}" name="signaction[{{$item11.si_id}}]" value="{{$item11.sa_action}}" />{{$item11.sa_action}}</label>
    {{/foreach}}
    </div>
</div>
<input type="submit" value="Search" name="search_signaction"  /> 
 
<div class="multiselect" >
    <div class="selectBox" onclick="showCheckboxes3()" >
      <select>
        <option>Select Banner Action</option>
      </select>
      <div class="overSelect"></div>
    </div>
    <div id="checkboxes3">
    
    {{foreach from=$badetail key="key12" item="item12"}}
    	<label for="three{{$item12.si_id}}">
        <input type="checkbox" id="three_{{$item12.si_id}}" name="banneraction[{{$item12.si_id}}]" value="{{$item12.sa_banner_action}}" />{{$item12.sa_banner_action}}</label>
    {{/foreach}}
    </div>
</div>

<input type="submit" name="ba_filter" value="Search" />
  &nbsp; <input type="submit" name="clear_filter" value="Clear All Filter" />
 
</div>


<div style="float:right;"> 
<input type="submit" value="Print" name="print"  />
<input type="submit" value="Print Shown" name="printshown"  />
<input type="submit" name="showall" value="Show Hidden" />
 <input type="button" value="Export To XLS" onclick="document.location.href='{{$BASE_URL}}{{$XFA.home}}/export/1'" /> &nbsp;
<input type="button" name="Add New " value="Add New" onclick="javascript:add_new();" />

 </div>
 </form>
</td></tr></table>

<div style="float:left; width:100%;">
  <table id="doclist-table" class="nav-back" width="100%">
    <thead>
      <tr>
        <th class="topmenu" align="center" valign="middle" width="3%">SrNo1</th>
        <th class="topmenu" align="center" valign="middle" width="20%">Property Address</th>
        <th class="topmenu" align="center" valign="middle" width="10%">Status</th>
        <th class="topmenu" align="center" valign="middle" width="10%">Intensity</th>
        <th class="topmenu" align="center" valign="middle" width="10%">Sign Action</th>
        <th class="topmenu" align="center" valign="middle" width="10%">Banner Action</th>
        <!--<th class="topmenu" align="center" valign="middle" width="10%">Street Sign Type</th>-->
		<th class="topmenu" align="center" valign="middle" width="10%">Client Agrees</th>
        <th class="topmenu" align="center" valign="middle" width="10%">ACTMapi Aerial Block Image</th>
        <th class="topmenu" align="center" valign="middle" width="10%">Street Sign Image</th>
        <th class="topmenu" align="center" valign="middle" width="10%">Fence Banner Image</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Have Sign</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Have Banner</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Date Sign Up</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Date Sign Down</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Date Banner UP</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Date Banner Down</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Sign Number</th>
        <th class="topmenu" align="center" valign="middle" width="10%">Notes</th>
        <th class="topmenu" align="center" valign="middle" width="10%">Hide From Report</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Action</th>
      </tr>
    {{if $list}}
    <tbody>
    <!--<form name="mlist" method="post">-->
      {{assign var=countn value= $numstartvounter}}
      {{foreach from=$list key="key" item="item"}}
      <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
        <td> {{$countn}} <span style="display: none;">{{$item.ss_id}}</span></td>
        <td class="link_address" data-address="{{$item.ss_address}}"><a href="{{$BASE_URL}}business.detail/bsn_id/{{$item.bsn_id}}" target="'">{{$item.ss_address|stripslashes}}</td>
        <td>{{$item.status}}</td>
        <td>
        <select name="inten[{{$item.ss_id}}]" Onchange = "update_intensity({{$item.ss_id}},this.value)" >
             <option value="" {{if $item.ss_intensity eq ''}} selected="selected" {{/if}}>Please Select </option>
             {{foreach from = $intensitydetail key="key2" item="item2"}}
             <option value="{{$item2.si_intensity}}" {{if $item2.si_intensity eq $item.ss_intensity}} selected="selected" {{/if}}>{{$item2.si_intensity}}</option>
             {{/foreach}}
        </select>
        
        <script>
	   
		function update_intensity(id,value)
		{
			 var tana = "#gh"+id;
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}street_sign_design.update_intensity/ss_id/"+id+"/value/"+value,
					   success: function(result){
						   $(tana).html(result);
					}
				});
		}
	</script>
        </td>
       
        <td>
        <select name="signaction[{{$item.ss_id}}]" Onchange = "update_sign_action({{$item.ss_id}},this.value)" >
                <option value="" {{if $item.ss_sign_action eq ''}} selected="selected" {{/if}}>Please Select </option>
                {{foreach from = $actiondetail key="key4" item="item4"}}
                <option value="{{$item4.sa_action}}" {{if $item4.sa_action eq $item.ss_sign_action}} selected="selected" {{/if}}>{{$item4.sa_action}}</option>
                {{/foreach}}
        </select>
        
        <div id="gh{{$item.ss_id}}">{{$item.ss_sign_action_date}}<br />{{$item.ss_sign_action_user}}</div>
         <script>
	   
		function update_sign_action(id,value)
		{
			 var tana = "#gh"+id;
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}street_sign_design.update_signaction/ss_id/"+id+"/value/"+value,
					   success: function(result){
						   $(tana).html(result);
					}
				});
		}
	</script>
        
         </td>
         <td>
         <select data-active-option="{{$item.ss_banner_action}}" name="banneraction[{{$item.ss_Id}}]"  Onchange = "update_banner_action({{$item.ss_id}},this.value)">
                <option value="" {{if $item.ss_banner_action eq ''}} selected="selected" {{/if}}>Please Select </option>
                {{foreach from = $badetail key="key5" item="item5"}}
                <option value="{{$item5.sa_banner_action}}" {{if trim($item5.sa_banner_action) eq urldecode($item.ss_banner_action) }} selected="selected" {{/if}}>{{$item5.sa_banner_action}}</option>
                {{/foreach}}
        </select>
        <div id="ba{{$item.ss_id}}">{{$item.ss_banner_action_date}}<br />{{$item.ss_banner_action_user}}</div>
         <script>
	   
		function update_banner_action(id,value)
		{
			  var tana2 = "#ba"+id;
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}street_sign_design.update_banner_action/ss_id/"+id+"/value/"+value,
					   success: function(result){
						   $(tana2).html(result);
					}
				});
		}
	</script>
         </td>
         
          
         <!-- <td>
   
         <select name="signtype[{{$item.ss_Id}}]"  Onchange = "update_sign_type({{$item.ss_id}},this.value)">
                <option value="" {{if $item.ss_sign_type eq ''}} selected="selected" {{/if}}>Please Select </option>
                {{foreach from = $typedetail key="key4" item="item4"}}
                <option value="{{$item4.et_type}}" {{if $item4.et_type eq $item.ss_sign_type}} selected="selected" {{/if}}>{{$item4.et_type}}</option>
                {{/foreach}}
        </select>
        
         <script>
	   
		function update_sign_type(id,value)
		{
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}street_sign_design.update_signtype/ss_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	</script>
        
         </td>-->
		<td data-col="client_Agrees" style="text-align:center;">
			<form name ="recmet2ca" method="post" action="">
				<input type="hidden" name="clientagrees[{{$item.ss_id}}]" value="No" />
				<label class="switch">
				<input class="switch-input" type="checkbox"  name="clientagrees[{{$item.ss_id}}]" value="Yes"  onclick="this.form.submit();" {{if $item.ss_client_agrees eq 'Yes' }} checked="checked" {{/if}} />
				<span class="switch-label" data-on="Yes" data-off="No"></span> 
				<span class="switch-handle"></span> <br />
				</label> 
			</form> 
			{{if $item.ss_client_agrees eq 'Yes' }} 
				{{$item.ss_client_agrees_user}}<br />{{$item.ss_client_agrees_date}} 
			{{/if}}
		</td>
        
         <td> {{if $item.ss_actmapi_image}}
         <a href="/street_sign_design.download_content?file_name={{$item.ss_actmapi_image}}&module_name=street_sign_design.home" >Download</a><br />
            {{$item.ss_actmapi_image_date}}
            {{/if}}
         </td>
         
         <td> {{if $item.ss_street_sign_image}}
         <a href="/street_sign_design.download_content?file_name={{$item.ss_street_sign_image}}&module_name=street_sign_design.home" >Download</a>
        <!-- <a href="https://deckquote.s3.amazonaws.com/files/street_sign_design/{{$item.ss_street_sign_image}}" target="_blank">Download</a> --><br />
            {{$item.ss_sign_image_date}}
            {{/if}}
         </td>
         <td>{{if $item.ss_banner_image}}
         <a href="/street_sign_design.download_content?file_name={{$item.ss_banner_image}}&module_name=street_sign_design.home" >Download</a>
        <!-- <a href="https://deckquote.s3.amazonaws.com/files/street_sign_design/{{$item.ss_banner_image}}" target="_blank">Download</a> --><br />
            {{$item.ss_banner_image_date}}
            {{/if}}
         </td>
         
        <td style="text-align:center;" >
        <form name ="recmet2" method="post" action="">
     	<input type="hidden" name="havesign[{{$item.ss_id}}]" value="No" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="havesign[{{$item.ss_id}}]" value="Yes"  onclick="this.form.submit();" {{if $item.ss_have_sign eq 'Yes' }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form>  
       {{if $item.ss_have_sign eq 'Yes' }} {{$item.ss_have_sign_user}}<br />{{$item.ss_have_sign_date}} {{/if}}
       
        </td>
        <td style="text-align:center;" >
        <form name ="recmet2" method="post" action="">
     	<input type="hidden" name="havebanner[{{$item.ss_id}}]" value="No" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="havebanner[{{$item.ss_id}}]" value="Yes"  onclick="this.form.submit();" {{if $item.ss_have_banner eq 'Yes' }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form> 
         {{if $item.ss_have_banner eq 'Yes' }} {{$item.ss_have_banner_user}}<br />{{$item.ss_have_banner_date}} {{/if}}
        </td>
        <td style="text-align:center;" >
         <form name ="ccd" method="post" action="" id="myForm3" enctype="multipart/form-data">
         <input type="text" name="date_sign_up[{{$item.ss_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo4_{{$item.ss_id}}" value="{{$item.ss_date_signup}}"  /> 
         <input type="submit" value="Set" name="latest" class="set" />
         </form>
        
        </td>
        <td>
         <form name ="ccd" method="post" action="" id="myForm3" enctype="multipart/form-data">
         <input type="text" name="date_sign_down[{{$item.ss_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo3_{{$item.ss_id}}" value="{{$item.ss_date_signdown}}"  /> 
         <input type="submit" value="Set" name="signdown" class="set" />
         </form>
        </td>
	<td>
         <form name ="ccd" method="post" action="" id="myForm3" enctype="multipart/form-data">
         <input type="text" name="date_bannerup[{{$item.ss_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo5_{{$item.ss_id}}" value="{{$item.ss_date_bannerup}}"  /> 
         <input type="submit" value="Set" name="datebannerup" class="set" />
         </form>
        </td>
        <td>
        <form name ="ccd" method="post" action="" id="myForm3" enctype="multipart/form-data">
         <input type="text" name="date_bannerdown[{{$item.ss_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo6_{{$item.ss_id}}" value="{{$item.ss_date_bannerdown}}"  /> 
         <input type="submit" value="Set" name="datebannerdown" class="set" />
         </form>
        </td>
        <td style="text-align:center;" >{{$item.ss_sign_number}}</td>
        
        <td style="text-align:center;" >
         <!--   <input type="button" name="View Notes" value="View  Notes" onclick="javascript:show_notes({{$item.ss_id}});" style="width:90px; height:20px; font-size:11px; line-height:17px !important; padding:0px !important" />-->
        
        <textarea rows="4" cols="40" class="tinymce2" id="{{$item.ss_id}}" style="overflow-y: scroll;">{{$item.ss_notes}}</textarea>       
   
       <script>
	   
	    $(document).ready(function(){
                     $("#{{$item.ss_id}}").keyup(function(){
                           update_notes({{$item.ss_id}},this.value);
                     });
             });
	     
	   
	   
	   function update_notes(id,value)
		{
		//alert(id);	
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}street_sign_design.update_notes/ss_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
	
       </script>   
        
        
        
        </td>
        
        
        
        <td>
        <form name ="recmet2" method="post" action="">
     	<input type="hidden" name="hide[{{$item.ss_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="hide[{{$item.ss_id}}]" value="1"  onclick="this.form.submit();" {{if $item.ss_hide eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       
        </label> 
        </form>  
        </td>
        
        <td><a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" class="various" title="Edit"> <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>
      		<a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}" onclick="javascript:if(!confirm('Are you sure want to delete this record ?')) return false;" title="Delete">
            <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>
        </td>
        
        
      </tr>
      {{assign var=countn value=$countn+1}}
      {{/foreach}}
      </tbody>
      
   <!-- </form>-->
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