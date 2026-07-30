
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/default.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/tree/simpletreemenu.js"></script>
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


function close_win()
	{
	$.fancybox.close();
	window.location.reload();
	}
</script>

<script language="javascript">
function add_options()
{
	var viewurl = "{{$BASE_URL}}customer_survey.viewoptions"+ "/random/" + Math.random();	

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
	var viewurl = "{{$BASE_URL}}customer_survey.view_procedure"+ "/random/" + Math.random();	

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

var expanded = false;
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
	  height:25px !important; 
	  margin-top:7px;}
#fancybox-wrap {z-index:9999999;} 

.slidecontainer {
  width: 125px;
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
  width: 15px;
  height: 25px;
  background: #F00 ;
  cursor: pointer;
}

.slider::-moz-range-thumb {
  width: 10px;
  height: 15px;
  background: #F00;
  cursor: pointer;
}

.multiselect {
  width: 280px;
  display:inline-block;
}

.multiselect3 {
  width: 200px;
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
    height: 150px;
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
  text-align:left;
}

#checkboxes2 label {
  display: block;
}

#checkboxes2 label:hover {
  background-color: #1e90ff;
}	  
</style>


<h3 class="page-title">{{$title}}</h3>
<br />

<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
<div style="float:left; margin-left:10px; text-align:left;">

<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> <br />


<!---------Project Search--------------->
<div class="multiselect" >
    <div class="selectBox" onclick="showCheckboxes2()" >
      <select>
        <option>Select Status</option>
      </select>
      <div class="overSelect"></div>
    </div>
    <div id="checkboxes2">
    
    {{foreach from=$statuslist key="key" item="item"}}
    	<label for="one{{$item.st_id}}">
        <input type="checkbox" id="one_{{$item.st_id}}" name="status[{{$item.st_id}}]" value="{{$item.st_id}}" />{{$item.st_name}}</label>
    {{/foreach}}
    </div>
</div>

<input type="submit" value="Search" name="search"  /> 
<input type="submit" value="Clear Search" name="clear"  /> 
</div>
</div>
<div style="float:right; margin-left:10px;">
<input type="button" name="Add New" value="Survey Options" onclick="javascript:add_options();" /> 
</div>
</div>

<div style="float:left; width:100%;">
  <table id="doclist-table" class="nav-back" width="100%">
    <thead>
      <tr>
        <th class="topmenu" align="center" valign="middle" width="3%">SrNo</th>
        <th class="topmenu" align="center" valign="middle" width="14%">Project Name</th>
        <th class="topmenu" align="center" valign="middle" width="10%">Auto Send</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Survey to be sent</th>
     	<th class="topmenu" align="center" valign="middle" width="7%">Status</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Days at status</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Last Sent</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Last Complete</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Who sent</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Last Result</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Problems</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Survey Download</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Latest Client Letter</th>
        
  
          
      </tr>
    {{if $list}}
    <tbody>
    <form name="mlist" method="post">
      <!--{{assign var=countn value= $numstartvounter}}-->
       {{assign var=countn value= $total}}
      
      {{foreach from=$list key="key" item="item"}}
      <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
        <td> {{counter}} </td>
        <td><a href="{{$BASE_URL}}business.detail/bsn_id/{{$item.bs_business_id}}" target="_blank">{{$item.bsn_name}}</td>
        <td>
         <form name ="recmet" method="post" action="">
        <input type="hidden" name="auto[{{$item.bs_business_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="auto[{{$item.bs_business_id}}]" value="1"  onclick="this.form.submit();" {{if $item.bs_cs_auto_send eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
            </label>
             
   	</form> 
        
        </td>
       <td>
       <select name="{{$TABLE}}[bs_cs_servey_tobe]" Onchange = "update_survey_to({{$item.bs_business_id}},this.value)">
                <option value="Please Select">Please Select </option>
                {{foreach from = $optionlist key="key4" item="item4"}}
                <option value="{{$item4.so_name}}" {{if $item4.so_name eq $item.bs_cs_servey_tobe}} selected="selected" {{/if}}>{{$item4.so_name}}</option>
                {{/foreach}}
        </select>
        
                <script>
	   
		function update_survey_to(id,value)
		{
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}customer_survey.update_survey_sent/bs_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	</script>
        
       
       </td>
       <td>{{$item.status}}</td>
       <td>{{$item.days}}</td>
       <td>
       <form name ="ccd" method="post" action="" id="myForm3" enctype="multipart/form-data">
         <input type="text" name="last_sent[{{$item.bs_business_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo2_{{$item.bs_business_id}}" value="{{$item.bs_cs_last_sent}}"  /> 
         <input type="submit" value="Set" name="last" class="set" />
         </form>
       
       </td>
       <td> <form name ="lastc" method="post" action="" id="myForm3" enctype="multipart/form-data">
         <input type="text" name="last_comp[{{$item.bs_business_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo3_{{$item.bs_business_id}}" value="{{$item.bs_cs_last_complete}}"  /> 
         <input type="submit" value="Set" name="comp" class="set" />
         </form></td>
       <td>
       <form name ="ccd" method="post" action="" id="myForm4" enctype="multipart/form-data">
         <input type="text" name="who[{{$item.bs_business_id}}]"  value="{{$item.bs_cs_who_sent}}" onkeyup="update_who({{$item.bs_business_id}},this.value)" /> 
       </form>
       <script>
	   
		function update_who(id,value)
		{
			
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}customer_survey.update_survey_sent/who_bs_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	</script>
       
       </td>
       <td>
       	
                
        <div class="slidecontainer">
        <input type="range" min="0" max="10" value="{{$item.bs_cs_last_result}}" class="slider" id="myRange_{{$countn}}" Onchange = "update({{$item.bs_business_id}},this.value)" >
        <p> <span id="demo_{{$item.bs_business_id}}"></span></p>
        </div>

<script>
var slider = document.getElementById("myRange_{{$countn}}");
var output{{$item.bs_business_id}} = document.getElementById("demo_{{$item.bs_business_id}}");
output{{$item.bs_business_id}}.innerHTML = slider.value;

slider.oninput = function() {
  output{{$item.bs_business_id}}.innerHTML = this.value;
}

	
	function update(id,value)
	{
	 //alert(id);
	 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}customer_survey.update_survey_sent/ls_bs_id/"+id+"/value/"+value,
					   success: function(result){
				   }
				 });
	
	}
	
	
	
</script>

       
       </td>
       <td></td>
       <td>
        <form name="ps" method="post" enctype="multipart/form-data"> 
        <input type="hidden" name="bs_business_id" value="{{$item.bs_business_id}}"  />
        <input type="file" name="survey" /><br />
        {{if $item.bs_cs_survey}}
       
        <a href="/customer_survey.download_content?file_name={{$item.bs_cs_survey}}&module_name=customer_survey.home" target="_blank"/>Download</a>
        {{/if}}
        <input type= "submit" name="save_survey" title="Save" value="Upload" class="set2"> &nbsp; 
        </form>
       </td>
   
   	 <td> 
        
        <form name="pw" method="post" enctype="multipart/form-data"> 
        <input type="hidden" name="bs_business_id" value="{{$item.bs_business_id}}"  />
        <input type="file" name="letter" /><br />
        {{if $item.bs_cs_latest_letter}}
        <div style="text-align:center;"> 
       
       <a href="/customer_survey.download_content?file_name={{$item.bs_cs_latest_letter}}&module_name=customer_survey.home" target="_blank"/>Download</a>
        <a href="{{$BASE_URL}}customer_survey.delete_w/bs_business_id/{{$item.bs_business_id}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img src="{{$BASE_URL}}/images/delete_icon.png" width="20" /></a>
   
        </div> {{/if}}
        <input type= "submit" name="upload_letter" title="Save" value="Upload" class="set2"> &nbsp; 
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