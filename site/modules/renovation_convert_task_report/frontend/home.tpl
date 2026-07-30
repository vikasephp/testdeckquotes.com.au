<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/default.js"></script>

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<link rel="stylesheet" type="text/css" href="https://www.deckquotes.com.au/js/tiny_mce/themes/advanced/skins/default/ui.css" />
<link rel="stylesheet" type="text/css" href="https://www.deckquotes.com.au/css/default/cis-styles.css" />
{{include file=$jdata}}
{{include file=$tiny_basic}}

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
	var viewurl = "{{$BASE_URL}}renovation_convert_task_report.addfeedback"+ "/bsn_id/" + bsn_id;	
	
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


<script type="text/javascript" > 
function viewfeedback(bsn_id)
{
	var viewurl = "{{$BASE_URL}}renovation_convert_task_report.viewfeedback"+ "/bsn_id/" + bsn_id;	
	
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

<script language="javascript">
function add_type()
{
	var viewurl = "{{$BASE_URL}}renovation_convert_task_report.viewtype"+ "/random/" + Math.random();	

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
	var viewurl = "{{$BASE_URL}}renovation_convert_task_report.view_procedure"+ "/random/" + Math.random();	

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

.tableFixHead          { overflow-y: auto; height: 700px; }
.tableFixHead thead th { position: sticky; top: 0; text-align:left; }

table  { border-collapse: collapse; width: 100%; table-layout:fixed; }
th     { z-index:9999; }


.wrapper1, .wrapper2{width: 100%; border: none 0px RED;
overflow-x: scroll; overflow-y:hidden; scrollbar-color: yellow blue;}
.wrapper1{height: 20px; }
.wrapper2{ }
.div1 {width:2680px; height: 20px; }
.div2 {width:2680px;  overflow: auto;}  
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
#fancybox-wrap {z-index:9999999;} 
</style>

<h3 class="page-title">{{$title}}</h3>
<br />

<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
<div style="float:left; text-align:left;"> 
&nbsp; &nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> 

&nbsp; &nbsp;<input type="button" name="Add New" value="Project Type" onclick="javascript:add_type();" /> <br />
&nbsp; &nbsp; <strong>Search:</strong>&nbsp;&nbsp;
<input type="text" name="searchkey" value="{{$searchkey}}" style="width:300px;" placeholder="Enter Address"/>
&nbsp;&nbsp;
<input type="submit" value="Search" name="searchaddr"  /> <br />
&nbsp; &nbsp; <strong>Project Type:</strong>&nbsp;&nbsp;
 <select name="project_type" >
                <option value="-1" {{if $item.dpn_rctr_ptype eq -1}} selected="selected" {{/if}}>Please Select </option>
                {{foreach from = $prdetail key="key4" item="item4"}}
                <option value="{{$item4.rpt_type}}" {{if $item4.rpt_type eq $pt}} selected="selected" {{/if}}>{{$item4.rpt_type}}</option>
                {{/foreach}}
        </select>
<input type="submit" value="Search" name="searchtype"  /> &nbsp; &nbsp; &nbsp;
<input type="submit" value="Clear Search" name="clear"  /> 
</div>

<div style="float:right;">
<input type="submit" value="Show Hidden" name="unhide"  />

</div>
</form>

<div class="wrapper1">
    <div class="div1">
    </div>
</div>

<div class="wrapper2">
  <div class="div2 tableFixHead">


  <table id="list-table" class="nav-back tableFixHead">
    <thead>
      <tr>
        <th class="topmenu" align="center" valign="middle" width="3%">SrNo</th>
         <th class="topmenu" align="center" valign="middle" width="4%">Checklist Numbers</th> 
        <th class="topmenu" align="center" valign="middle" width="10%">Project Address</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Link</th>
        <th class="topmenu" align="center" valign="middle" width="18%">Project Type</th> 
        <th class="topmenu" align="center" valign="middle" width="5%">Customer Added To Gcons</th>  
        <th class="topmenu" align="center" valign="middle" width="4%">Days At Status</th> 
        <th class="topmenu" align="center" valign="middle" width="8%">Speak to client to qualify</th> 
        <th class="topmenu" align="center" valign="middle" width="8%">FeedBack</th> 
        <th class="topmenu" align="center" valign="middle" width="8%">Latest Customer Survey Uploaded</th> 
        <th class="topmenu" align="center" valign="middle" width="12%">Value of Project</th>
        <th class="topmenu" align="center" valign="middle" width="12%">Client Budget</th> 
        <th class="topmenu" align="center" valign="middle" width="8%">Intro Box Sent</th> 
        <th class="topmenu" align="center" valign="middle" width="8%">Book in with Liam for onsite visit</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Onsite Visit Complete</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Inspection Report</th>
        <th class="topmenu" align="center" valign="middle" width="8%">3D Scan – sent to client</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Phone Client about 3D Scan</th>
        
        <th class="topmenu" align="center" valign="middle" width="8%">Windows and Doors Measure</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Initial Sketches</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Estimation Report completed</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Courier out Estimation report with Design agreement</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Click and Send letter – 7th Day letter</th> 
        <th class="topmenu" align="center" valign="middle" width="8%">Follow up Phone call -8th day </th>
        <th class="topmenu" align="center" valign="middle" width="8%">Click and Send letter – 21 Day letter</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Follow up Phone call - 22nd day </th>
        <th class="topmenu" align="center" valign="middle" width="6%">Likely hood of going ahead in %  </th>
 
        <th class="topmenu" align="center" valign="middle" width="7%">Hide From Report</th>
        

      </tr>
    {{if $list}}
    <tbody>
    <form name="mlist" method="post">
      <!--{{assign var=countn value= $numstartvounter}}-->
       {{assign var=countn value= $total}}
      
      {{foreach from=$list key="key" item="item"}}
      <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
        <td> {{$countn}} </td>
        <td style="text-align:center;" >{{$item.dpn_unique_id}}</td>
        <td><strong>{{$item.bcust_fname}} &nbsp; {{$item.bcust_lname}}</strong> <br />
        {{$item.bsn_address}}</td>
      <td><a href="{{$item.link}}" target="_blank">Link</a></td>
      
      <td> 
      
       <select name="{{$TABLE}}[wa_priority]"  Onchange = "update_project_type({{$item.dpn_unique_id|ltrim:'0'}},this.value)">
                <option value="-1" {{if $item.dpn_rctr_ptype eq -1}} selected="selected" {{/if}}>Please Select </option>
                {{foreach from = $prdetail key="key4" item="item4"}}
                <option value="{{$item4.rpt_type}}" {{if $item4.rpt_type eq $item.dpn_rctr_ptype}} selected="selected" {{/if}}>{{$item4.rpt_type}}</option>
                {{/foreach}}
        </select>
        
        <script>
	   
		function update_project_type(id,value)
		{
			
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}renovation_convert_task_report.update_project_type/dpn_unique_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	</script>
      
      
      </td>
      
      <td {{if $item.date1}} style="background:#0C6" {{else}} style="background:#F00" {{/if}}>{{$item.date1}}</td>
      <td style="text-align:center;">{{$item.dayscount}} </td>
      <td> 
        <form name ="spk" method="post" action="">
        <input type="hidden" name="speak[{{$item.dpn_unique_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="speak[{{$item.dpn_unique_id}}]" value="1"  onclick="this.form.submit();" {{if $item.dpn_rctr_speak eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
        </label>
        </form> 
        {{if $item.dpn_rctr_speak eq 1 }} <br />{{$item.dpn_rctr_speak_date}} <br />{{$item.dpn_rctr_speak_who}} {{/if}}
      </td> 
      
      <td>
      <input type="button" name="Alert" value="Add Feedback" onclick="javascript:addfeedback({{$item.bsn_id}});" style="width:90px; height:20px; font-size:11px; line-height:17px !important; padding:0px !important" /><br />
      <input type="button" name="Alert" value="View Feedback" onclick="javascript:viewfeedback({{$item.bsn_id}});" style="width:90px; height:20px; font-size:11px; line-height:17px !important; padding:0px !important" />
        
       </td>
      <td>{{if $item.doc_34}}
      <!--<a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_34}}" target="_blank">Download</a>-->
      <a href="/renovation_convert_task_report.download_content?file_name={{$item.doc_34}}&module_name=renovation_convert_task_report.home" target="_blank">Download</a>
      
      {{/if}}</td> 
      <td>
      <input type="text" name="valu[{{$item.dpn_unique_id}}]" value="{{$item.dpn_rctr_valueof_proj}}"  style="width:110px;" onkeyup = "update_valueof({{$item.dpn_unique_id|ltrim:'0'}},this.value)"/>
	
       <script language="javascript">
        function update_valueof(id,value)
		{
			$.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}renovation_convert_task_report.update_value_proj/dpn_unique_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	</script>	
      
       </td>
        
        <td>
          <input type="text" name="budget[{{$item.dpn_unique_id}}]" value="{{$item.dpn_rctr_budget}}"  style="width:110px;" onkeyup = "update_budget({{$item.dpn_unique_id|ltrim:'0'}},this.value)"/>
	
       <script language="javascript">
        function update_budget(id,value)
		{
			
			$.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}renovation_convert_task_report.update_budget/dpn_unique_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	</script>
        
        </td>
        
        <td>
        <form name ="intro" method="post" action="">
        <input type="hidden" name="intro[{{$item.dpn_unique_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="intro[{{$item.dpn_unique_id}}]" value="1"  onclick="this.form.submit();" {{if $item.dpn_rctr_intro_box eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
        </label>
        </form> 
        {{if $item.dpn_rctr_intro_box eq 1 }} <br />{{$item.dpn_rctr_intro_date}} <br />{{$item.dpn_rctr_intro_who}} {{/if}}
        </td>
        <td>
         <form name ="book" method="post" action="">
        <input type="hidden" name="book[{{$item.dpn_unique_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="book[{{$item.dpn_unique_id}}]" value="1"  onclick="this.form.submit();" {{if $item.dpn_rctr_bookonsite eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
        </label>
        </form> 
        {{if $item.dpn_rctr_bookonsite eq 1 }} <br />{{$item.dpn_rctr_bookonsite_date}} <br />{{$item.dpn_rctr_bookonsite_who}} {{/if}}
        </td>
        
        <td>
         <form name ="onsitevisit" method="post" action="">
        <input type="hidden" name="onsite[{{$item.dpn_unique_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="onsite[{{$item.dpn_unique_id}}]" value="1"  onclick="this.form.submit();" {{if $item.dpn_rctr_onsite eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
        </label>
        </form> 
        {{if $item.dpn_rctr_onsite eq 1 }} <br />{{$item.dpn_rctr_onsite_date}} <br />{{$item.dpn_rctr_onsite_who}} {{/if}}
        </td>
        <td> {{if $item.doc_9}} 
        <!--<a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_9}}" target="_blank">Download</a>-->
      <a href="/renovation_convert_task_report.download_content?file_name={{$item.doc_9}}&module_name=renovation_convert_task_report.home" target="_blank">Download</a>
        {{/if}}</td>
      
        <td {{if $item.date6}} style="background:#0C6" {{else}} style="background:#F00" {{/if}}>{{$item.date6}}</td>
        
          <td>
          <form name ="pc3d" method="post" action="">
        <input type="hidden" name="pc3dscan[{{$item.dpn_unique_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="pc3dscan[{{$item.dpn_unique_id}}]" value="1"  onclick="this.form.submit();" {{if $item.dpn_rctr_pc_3dscan eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
        </label>
        </form> 
          
          
          </td>
        <td {{if $item.date34}} style="background:#0C6" {{else}} style="background:#F00" {{/if}}>{{$item.date34}}</td>
        <td> {{if $item.doc_2}} 
        <!--<a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_2}}" target="_blank">Download</a>-->
        <a href="/renovation_convert_task_report.download_content?file_name={{$item.doc_2}}&module_name=renovation_convert_task_report.home" target="_blank">Download</a>
        {{/if}}</td>
      
        <td>{{if $item.doc_21}}
       <!-- <a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_21}}" target="_blank">Download</a>-->
        <a href="/renovation_convert_task_report.download_content?file_name={{$item.doc_21}}&module_name=renovation_convert_task_report.home" target="_blank">Download</a>
        
        {{/if}}</td> 
        <td {{if $item.date12}} style="background:#0C6" {{else}} style="background:#F00" {{/if}}>{{$item.date12}}</td>
        <td {{if $item.date18}} style="background:#0C6" {{else}} style="background:#F00" {{/if}}>{{$item.date18}}</td>
    
         
        <td>
         <form name ="followupcall" method="post" action="">
        <input type="hidden" name="followup[{{$item.dpn_unique_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="followup[{{$item.dpn_unique_id}}]" value="1"  onclick="this.form.submit();" {{if $item.dpn_rctr_followup eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
        </label>
        </form> 
        {{if $item.dpn_rctr_followup eq 1 }} <br />{{$item.dpn_rctr_followup_date}} <br />{{$item.dpn_rctr_followup_who}} {{/if}}
        </td>
        
         <td {{if $item.date19}} style="background:#0C6" {{else}} style="background:#F00" {{/if}}>{{$item.date19}}</td>
        
        <td>
         <form name ="follow22" method="post" action="">
        <input type="hidden" name="follow22[{{$item.dpn_unique_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="follow22[{{$item.dpn_unique_id}}]" value="1"  onclick="this.form.submit();" {{if $item.dpn_rctr_follow22 eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
        </label>
        </form> 
        {{if $item.dpn_rctr_follow22 eq 1 }} <br />{{$item.dpn_rctr_follow22_date}} <br />{{$item.dpn_rctr_follow22_who}} {{/if}}
        </td>
        
         <td>
      <input type="text" name="likelihood[{{$item.dpn_unique_id}}]" value="{{$item.dpn_rctr_likelihood}}"  style="width:50px;" onkeyup = "update_likelihood({{$item.dpn_unique_id|ltrim:'0'}},this.value)"/>
	
       <script language="javascript">
        function update_likelihood(id,value)
		{
			$.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}renovation_convert_task_report.update_likeli_hood/dpn_unique_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	</script>	
      
       </td>
        
        
        <td>
        <form name ="recmet" method="post" action="">
        <input type="hidden" name="hide[{{$item.dpn_unique_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="hide[{{$item.dpn_unique_id}}]" value="1"  onclick="this.form.submit();" {{if $item.dpn_rdr_hide eq 1 }} checked="checked" {{/if}} />
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