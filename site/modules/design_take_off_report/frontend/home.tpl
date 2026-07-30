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
	var viewurl = "{{$BASE_URL}}design_take_off_report.view_procedure"+ "/random/" + Math.random();	

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


// We create the HTTP Object

function close_win()
	{
	$.fancybox.close();
	window.location.reload();
	}
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
	   
	   
.wrapper1, .wrapper2{width: 1610px; border: none 0px RED;
overflow-x: scroll; overflow-y:hidden; scrollbar-color: yellow blue;}
.wrapper1{height: 20px; }
.wrapper2{ }
.div1 {width:1710px; height: 20px; }
.div2 {width:1710px;  overflow: auto;}   
.tableFixHead          { overflow-y: auto; height: 700px; }
.tableFixHead thead th { position: sticky; top: 0; text-align:left; }
table  { border-collapse: collapse; width: 100%; }
th     { z-index:9999; }
#fancybox-wrap {z-index:9999999;}
</style>

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

<h3 class="page-title">Design Take Off Report </h3>
<br />

<form name="mlist" method="post">
<div style="float:left; text-align:left;">
&nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> 
</div>

<div style="float:right;"> 
<input type="button" value="Export To XLS" onclick="document.location.href='{{$BASE_URL}}{{$XFA.home}}/export/1'" /> &nbsp;
<input type="submit" value="Show Hidden" name="unhide"  />
<input type="submit" value="Save Hide/Unhide" name="hideupdate"  />

</div> &nbsp; &nbsp;
<div class="wrapper1">
    <div class="div1">
    </div>
</div>

 <div class="wrapper2">
    <div class="div2 tableFixHead">

  <table id="doclist-table" class="nav-back" width="100%">
    <thead>
      <tr>

        <th class="topmenu" align="center" valign="middle" width="11%">Customer Details</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Link</th>
	    <th class="topmenu" align="center" valign="middle" width="4%">Number Of Proposal<br />Checklist</th>
      	<th class="topmenu" align="center" valign="middle" width="3%">Proposal Checklist Numbers</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Signed Design <br />Agreement</th>
        
        <th class="topmenu" align="center" valign="middle" width="5%">Survey Status</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Survey Uploaded</th>
        
        <th class="topmenu" align="center" valign="middle" width="8%">Site Scope Visit Booked</th>
        <th class="topmenu" align="center" valign="middle" width="8%">SSV Date</th>  
        <th class="topmenu" align="center" valign="middle" width="4%">Initial Designs Meeting Booked</th>
        <th class="topmenu" align="center" valign="middle" width="7%">IDM Booked Date</th>
        <th class="topmenu" align="center" valign="middle" width="7%">SSV Complete</th>
       	<th class="topmenu" align="center" valign="middle" width="7%">Commencment Plan</th> 
   
        <th class="topmenu" align="center" valign="middle" width="4%">MS Teams Link</th>

        <th class="topmenu" align="center" valign="middle" width="4%">IDM Completed </th>
        <th class="topmenu" align="center" valign="middle" width="5%">Hide From Report</th>
        
      </tr>
    </thead>
    {{if $list}}
    <tbody>
    
      <!--{{assign var=countn value= $numstartvounter}}-->
       {{assign var=countn value= $total}}
      
      {{foreach from=$list key="key" item="item"}}
    
       <tr {{if $item.bsn_per_complete ge 90}} bgcolor="#66FF66" {{else}} bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}} {{/if}}">

        <td> <strong>{{$item.bcust_fname}} &nbsp; {{$item.bcust_lname}}</strong> <br />
        {{$item.bsn_address}}</td>
      
       <td style="text-align:center;" ><a href = "{{$item.link}}" target="blank">Link</a></td>
       <td>{{$item.prochklist}} </td>
        
       <td>
        {{if $item.chknoData}}
        <select name="chkno">
         {{foreach from = $item.chknoData key="key1" item="item1"}}
               <option value="{{$item1.dpn_unique_id}}">{{$item1.dpn_unique_id}}</option>
          {{/foreach}}
          </select>
       {{/if}}
       </td>
      
        <td>{{$item.checklist45|date_format:"%e-%m-%Y"}}  </td>
        <td> 
        <select name="survey[{{$item.bsn_id}}]" Onchange = "update_survey({{$item.bsn_id}},this.value)" >
        <option value="Requested" {{if $item.bs_dtor_survey eq 'Requested'}} selected="selected" {{/if}}>Requested</option>
        <option value="TBC" {{if $item.bs_dtor_survey eq 'TBC'}} selected="selected" {{/if}}>TBC</option>
        <option value="Client" {{if $item.bs_dtor_survey eq 'Client'}} selected="selected" {{/if}}>Client</option>
        <option value="CGFB" {{if $item.bs_dtor_survey eq 'CGFB'}} selected="selected" {{/if}}>CGFB</option>
        <option value="Uploaded" {{if $item.bs_dtor_survey eq 'Uploaded'}} selected="selected" {{/if}}>Received/Uploaded </option>
        <option value="Refused" {{if $item.bs_dtor_survey eq 'Refused'}} selected="selected" {{/if}}>Refused</option>
        </select><br />
        <input type="text" name="bs_dtor_survey_date[{{$item.bsn_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo33_{{$item.bsn_id}}" value="{{$item.bs_dtor_survey_date}}"  /> 
             <input type="submit" value="Set" name="survey" class="set" />
      
       
       <script>
	   
		function update_survey(id,value)
		{
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}design_take_off_report.update_survey/bsn_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	</script>
      
        
        </td>
        <td>
        {{if $item.survey_uploaded}}
     <!--   <a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.survey_uploaded}}" target="_blank">Link</a>-->
        <a href="/design_take_off_report.download_content?file_name={{$item.survey_uploaded}}&module_name=design_take_off_report.home" target="_blank">Link</a>
        
        {{/if}}
        </td>
        
        <td>
       {{$item.uid594}}
       </td>
       <td> 
              <input type="text" name="bsn_ssv_date[{{$item.bsn_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo2_{{$item.bsn_id}}" value="{{$item.bsn_ssv_date}}"  /> 
             <input type="submit" value="Set" name="myob" class="set" />
       
       </td>
       
       <td>{{$item.uid430}} </td>

       <td>
        <input type="text" name="bsn_idm_booked_date[{{$item.bsn_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo4_{{$item.bsn_id}}" value="{{$item.bsn_idm_booked_date}}"  /> 
             <input type="submit" value="Set" name="myob2" class="set" />
        
        </td>
         
          
         <td style="text-align:center;" >{{$item.uid303}}</td>
         
       <td> 
        {{if $item.checklist482}}
       <!-- <a href = "https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.checklist482}}?dummy={{$ran}}" target="_blank">Download</a>-->
      <a href = "/design_take_off_report.download_content?file_name={{$item.checklist482}}&module_name=design_take_off_report.home" target="_blank">Download</a>
        {{/if}}
       </td>
       
       
       <td> 
       {{if $item.msteam}}
  
         {{foreach from = $item.msteam key="keyms" item="itemms"}}
            <a href="{{$itemms.ms_path}}" target="_blank">Link</a><br />
          {{/foreach}}
       
       {{/if}}
       
       </td>
  
         
     <td>{{$item.uid595}} </td>
       
       <td>
   
     <input type="hidden" name="hide[{{$item.bsn_id}}_{{$item.bs_customers_id}}]" value="0" />
  	<label class="switch">


<input class="switch-input" type="checkbox"  name="hide[{{$item.bsn_id}}_{{$item.bs_customers_id}}]"    {{if $item.bsn_takeoff_hide eq 1 }} checked="checked" {{/if}} />

        	<span class="switch-label" data-on="Yes" data-off="No"></span> 
        	<span class="switch-handle"></span> <br />
             </label>
            
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
  {{/if}} 

</div>
</div>