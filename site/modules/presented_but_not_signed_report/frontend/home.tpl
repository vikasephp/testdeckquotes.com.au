<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<script type="text/javascript" src="{{$BASE_URL}}js/default.js"></script>
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
				'width': '90%',
				'height': '85%',
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
	var viewurl = "{{$BASE_URL}}presented_but_not_signed_report.addfeedback"+ "/bsn_id/" + bsn_id;	
		
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
	var viewurl = "{{$BASE_URL}}presented_but_not_signed_report.viewfeedback"+ "/bsn_id/" + bsn_id;	
	
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
function add_new(url)
{
		
 	$(document).ready(function () {

        $.fancybox({

				'width': '90%',
				'height': '85%',
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
				 'href': url,
				 'scrolling': 'yes' 
        });
      });
}

function add_procedure()
{
	var viewurl = "{{$BASE_URL}}presented_but_not_signed_report.view_procedure"+ "/random/" + Math.random();	

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

table  { border-collapse: collapse; width: 100%; }
th     { z-index:9999; }

.wrapper1, .wrapper2{width: 100%; border: none 0px RED;
overflow-x: scroll; overflow-y:hidden; scrollbar-color: yellow blue;}
.wrapper1{height: 20px; }
.wrapper2{ }
.div1 {width:2180px; height: 20px; }
.div2 {width:100%;  overflow: auto;}  
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

<div style="float:left; text-align:left;">&nbsp;
&nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> <br />
<!--<input type="button" name="Add New" value="Add New Mood Option" onclick="javascript:add_new('{{$BASE_URL}}presented_but_not_signed_report.add_mood');" />  &nbsp;
<input type="button" name="edit_cat" value="Edit Mood Option" onclick="javascript:add_new('{{$BASE_URL}}presented_but_not_signed_report.edit_mood');" />&nbsp;-->
<input type="button" name="Add New st" value="Add New status" onclick="javascript:add_new('{{$BASE_URL}}presented_but_not_signed_report.add_status');" />  &nbsp;
<input type="button" name="edit_st" value="Edit Status Option" onclick="javascript:add_new('{{$BASE_URL}}presented_but_not_signed_report.edit_status');" />&nbsp;
</div>
<br />

<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">

<div style="float:left;"> 

&nbsp; &nbsp; <strong>Search:</strong>&nbsp;&nbsp;
<input type="text" name="searchkey" value="{{$searchkey}}" style="width:300px;" placeholder="Enter address"/>
&nbsp;&nbsp;&nbsp;&nbsp; 
<input type="submit" value="Search" name="searchaddr"  />
&nbsp;&nbsp;<strong>Sort By :</strong>
<input type="submit" value="Hia Booked Date" name="hiabooked"  />
<input type="submit" value="Meeting Date" name="meetingdate"  />
 <br />
</div> 

<div style="float:right;">
<input type="button" value="Export To XLS" onclick="document.location.href='{{$BASE_URL}}presented_but_not_signed_report.home/export/1'" /> &nbsp;
<input type="submit" value="Show Hidden" name="unhide"  />
</div>
<br />
</form>

<div class="wrapper1">
    <div class="div1">
    </div>
</div>

<!--<div class="wrapper2">-->
<div style="border:1px solid black;width:auto;height:auto;overflow-y:hidden;overflow-x:scroll;">
  <div class="div2 tableFixHead">

  <table id="doclist-table" class="nav-back tableFixHead" width="100%">
    <thead>
      <tr>
        <th class="topmenu" align="center" valign="middle" width="3%">SrNo</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Address</th>
        <th class="topmenu" align="center" valign="middle" width="2%">Link</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Proposal Checklist Number</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Letter Text</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Status</th> 
        <th class="topmenu" align="center" valign="middle" width="8%">Where We Are At</th> 
        <th class="topmenu" align="center" valign="middle" width="5%">Proposal Alert Complete</th> 
        <th class="topmenu" align="center" valign="middle" width="5%">Face To Face Meeting</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Proposal Action Items</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Reviased Pdf Sent</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Hia Item Sent </th>
        <th class="topmenu" align="center" valign="middle" width="5%">HIA Booked Date </th>
        <th class="topmenu" align="center" valign="middle" width="5%">Download PDF</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Add Feedback</th>
<!--        <th class="topmenu" align="center" valign="middle" width="5%">Project Handover </th>
        <th class="topmenu" align="center" valign="middle" width="5%">Support Places Design On Website</th>-->
       <th class="topmenu" align="center" valign="middle" width="5%">Special Conditions</th>
       <th class="topmenu" align="center" valign="middle" width="5%">Recordings</th>
       
       <th class="topmenu" align="center" valign="middle" width="5%">Hide From Report</th>
        
      
      </tr>
    {{if $list}}
    <tbody>
    <form name="mlist" method="post">
    
       {{assign var=countn value= $total}}
      
      {{foreach from=$list key="key" item="item"}}
      <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
        <td> {{$countn}} </td>
        <td><strong>{{$item.bcust_fname}} &nbsp; {{$item.bcust_lname}}</strong> <br />
        {{$item.bsn_address}}</td>
        <td><a href="{{$item.link}}" target="_blank" >Link</td>
        <td>{{$item.dpn_unique_id}} </td>
       
       <td>
       <input type="text" name="letter[{{$item.bsn_id}}]" value="{{$item.bs_pbns_letter_text}}" onkeyup = "update_letter({{$item.bsn_id}},this.value)" style="width:60px;"/>
       
       <script>
	   
	   function update_letter(id,value)
		{
			
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}/presented_but_not_signed_report.update_letter_text/bsn_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
	
       </script>
         
         </td>
   
   
   <td> 
       <select name="status[{{$item.bsn_id}}]" Onchange = "update_status({{$item.bsn_id}},this.value)" >
       <option value="">Please Select </option>
         {{foreach from=$statusData key="keym" item="itemm"}}
         <option value="{{$itemm.st_status}}" {{if $item.bs_pbns_status eq $itemm.st_status}} selected="selected" {{/if}}>{{$itemm.st_status}}</option>
         {{/foreach}}
      </select>
       
       <script>
	   
        function update_status(id,value)
		{
		
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}presented_but_not_signed_report.update_status/bsn_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
	
       </script>
        
        </td>
  
   <td>
   <textarea rows="4" cols="40" class="tinymce2" id="{{$item.bsn_id}}" style="overflow-y: scroll;">{{$item.bs_pbns_where_we_are}}</textarea>       
   
       <script>
	   
	    $(document).ready(function(){
                     $("#{{$item.bsn_id}}").keyup(function(){
                           update_where_we_are({{$item.bsn_id}},this.value);
                     });
             });
	     
	   
	   
	   function update_where_we_are(id,value)
		{
			
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}presented_but_not_signed_report.update_where_we_are/bsn_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
	
       </script>
   
    </td>
        

        <td style="text-align:center">
        <a href="{{$BASE_URL}}presented_but_not_signed_report.view_alerts/bsn_id/{{$item.bs_business_id}}" class="various">View Alert</a><br />
        {{$item.pract}} / {{$item.prtot}}</td>
      
        <td>{{$item.bt_complete_8}}</td>
        <td> 
        {{if $item.checklist144}}
           <!-- <a href = "https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.checklist61}}?dummy={{$ran}}" target="_blank">Download</a>-->
           <a href = "/presented_but_not_signed_report.download_content?file_name={{$item.checklist144}}&module_name=presented_but_not_signed_report.home" target="_blank">Download</a> 
             <br />{{$item.checklist144_date}}
            {{/if}}
        </td>
      
      
      
        <td>
        {{if $item.slider_no}}
          Task not added.   
             
        {{else}}    
        {{$item.bt_complete_72}}
        <form name ="recmet2" method="post" action="">
        <input type="hidden" name="task72[{{$item.dpn_unique_id}}]" value="0" />
        <input type="hidden" name="prop_num" value="{{$item.dpn_proposal_number}}" />
        <input type="hidden" name="bsn_id" value="{{$item.bs_business_id}}" />
  	    <label class="switch">
<input class="switch-input" type="checkbox"  name="task72[{{$item.dpn_unique_id}}]" value="1"  onclick="this.form.submit();" {{if $item.bt_comp_72 eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
        </label>
        </form> 
        {{/if}}
        </td>
            
           
       
       <td>
        {{if $item.slider_no_33}}
          Task not added.   
             
        {{else}}
       {{$item.bt_complete_33}}
       
       <form name ="recmet2" method="post" action="">
        <input type="hidden" name="task33[{{$item.dpn_unique_id}}]" value="0" />
        <input type="hidden" name="prop_num" value="{{$item.dpn_proposal_number}}" />
        <input type="hidden" name="bsn_id" value="{{$item.bs_business_id}}" />
  	    <label class="switch">
<input class="switch-input" type="checkbox"  name="task33[{{$item.dpn_unique_id}}]" value="1"  onclick="this.form.submit();" {{if $item.bt_comp_33 eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
        </label>
        </form> 
       {{/if}}
       </td>
        
        <td> 
        <form name = "spoken" method="post" action="">
        <input type="text" name="hia_signed[{{$item.bsn_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo2_{{$item.bsn_id}}" value="{{$item.bs_pbns_hia_signed}}"  /> 
       <input type="submit" value="Set" name="pbd" class="set" />
       </form>
        </td>
        
      <td><!--{{$item.bt_complete_70}}-->
      <a href="{{$BASE_URL}}presented_but_not_signed_report.view_downloads/bsn_id/{{$item.bsn_id}}/dpn_unique_id/{{$item.dpn_unique_id}}" class="various">Downloads </a>
      
      <td>
      <input type="button" name="Alert" value="Add Feedback" onclick="javascript:addfeedback({{$item.bsn_id}});" style="width:90px; height:20px; font-size:11px; line-height:17px !important; padding:0px !important" /><br />
          
          <input type="button" name="Alert" value="View Feedback" onclick="javascript:viewfeedback({{$item.bsn_id}});" style="width:90px; height:20px; font-size:11px; line-height:17px !important; padding:0px !important" />
      </td>
      
<!--      <td>m1{{$item.bt_complete_25}}</td>
      <td>m2{{$item.bt_complete_53}}</td>--> 
      <td><a href="{{$BASE_URL}}presented_but_not_signed_report.view_spl_cond/bsn_id/{{$item.bsn_id}}" class="various">View Special Conditions</a></td>
      <td><a href="{{$BASE_URL}}presented_but_not_signed_report.viewrecordings/bsn_id/{{$item.bsn_id}}" class="various">View Recordings</a></td>  
        
          
        <td>
        <form name ="recmet" method="post" action="">
        <input type="hidden" name="hide[{{$item.dpn_unique_id}}]" value="1" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="hide[{{$item.dpn_unique_id}}]" value="0"  onclick="this.form.submit();" {{if $item.dpn_pbns_hide eq 0 }} checked="checked" {{/if}} />
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