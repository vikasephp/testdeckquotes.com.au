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


function show_notes(ssid)
{
	var viewurl = "{{$BASE_URL}}street_sign.show-notes-content"+ "/ss_id/" + ssid;	
	
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


function add_new(url)
 {
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
				 'href': url,
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


<script type="text/javascript" > 
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

function add_procedure()
{
	var viewurl = "{{$BASE_URL}}proposal_report.view_procedure"+ "/random/" + Math.random();	

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
.div1 {width:2980px; height: 20px; }
.div2 {width:2980px;  overflow: auto;}  
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
&nbsp; &nbsp; <input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> 
&nbsp; &nbsp; <strong>Procedure Link :</strong> <a href = "https://app.process.st/workflows/Sales-Coordinator-Proposal-Control-Panel-Guide-iuG-StkRTNrVCfDc33xPSA/view/tasks/to40zUO_o_etpTg_3eZJzg"
 target="_blank";>https://app.process.st/workflows/Sales-Coordinator-Proposal-Control-Panel-Guide-iuG-StkRTNrVCfDc33xPSA/view/tasks/to40zUO_o_etpTg_3eZJzg</a>
<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" name="Add New st" value="Add New status" onclick="javascript:add_new('{{$BASE_URL}}proposal_report.add_status');" />  &nbsp;
<input type="button" name="edit_st" value="Edit Status Option" onclick="javascript:add_new('{{$BASE_URL}}proposal_report.edit_status');" />&nbsp;
<br /> <br />
&nbsp; &nbsp; <strong>Search:</strong>&nbsp;&nbsp;
<input type="text" name="searchkey" value="{{$searchkey}}" style="width:300px;" placeholder="Enter Address"/>
&nbsp;&nbsp;
<input type="submit" value="Search" name="searchaddr"  />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<strong>Search:</strong>&nbsp;&nbsp;
<input type="text" name="keyword" value="{{$keyword}}" style="width:70px;" placeholder="Checklist Number"/>
&nbsp;&nbsp;
<input type="submit" value="Search" name="searchchk"  /> &nbsp;&nbsp;&nbsp;&nbsp;
<strong>Sort By :</strong>
<input type="submit" value="Proposal booked date" name="pbd"  />
<input type="submit" value="Final Signed Plans" name="fsp"  />
</div> 

<div style="float:right;">
<input type="button" name="add_chk" value="Add New Checklist" onclick="javascript:add_new('{{$BASE_URL}}proposal_report.add_checklist');" />  &nbsp;

<input type="submit" value="Hide All" name="hideall"  />
<input type="button" value="Export To XLS" onclick="document.location.href='{{$BASE_URL}}proposal_report.home/export/1'" /> &nbsp;
<input type="submit" value="Show Hidden" name="unhide"  />
</div>
</form>

<div class="wrapper1">
    <div class="div1">
    </div>
</div>

<div class="wrapper2">
  <div class="div2 tableFixHead">


  <table id="list-table" class="nav-back tableFixHead" width="100%">
    <thead>
      <tr>
        <th class="topmenu" align="center" valign="middle" width="3%">SrNo</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Address</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Status</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Link</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Proposal Checklist Number</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Has Reno</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Status</th>
         <th class="topmenu" align="center" valign="middle" width="5%">Design Sent off for signing</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Final Signed Plans</th>
         <th class="topmenu" align="center" valign="middle" width="5%">Letter Text</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Where Are We At</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Estimate Build Cost</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Estimate Site Scope Value</th>
       <th class="topmenu" align="center" valign="middle" width="5%">S.S. Proposal PDF</th>
       <th class="topmenu" align="center" valign="middle" width="5%">Proposal PDF</th>
       
        <th class="topmenu" align="center" valign="middle" width="4%">Brochure A</th>  
        <th class="topmenu" align="center" valign="middle" width="4%">Brochure B</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Box 1 Due Date</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Box 1 Sent</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Box 2 Due Date</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Box 2 Sent</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Tentative Proposal Date</th>
        
        <th class="topmenu" align="center" valign="middle" width="5%">Proposal Booked Date</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Proposal Action Items</th>
	<th class="topmenu" align="center" valign="middle" width="5%">Revised PDF sent</th>
         
         <th class="topmenu" align="center" valign="middle" width="5%">HIA Booked Date</th>
        <th class="topmenu" align="center" valign="middle" width="12%">Hide From Report</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Added To PBNS Report</th>
      
      </tr>
    {{if $list}}
    <tbody>
    <form name="mlist" method="post">
      <!--{{assign var=countn value= $numstartvounter}}-->
       {{assign var=countn value= $total}}
      
      {{foreach from=$list key="key" item="item"}}
      <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
        <td> {{$countn}} </td>
        <td>{{$item.bsn_address}}</td>
        <td>
         <select name="status[{{$item.dpn_bsn_id}}]" Onchange = "update_status({{$item.dpn_bsn_id}},this.value)" >
       <option value="">Please Select </option>
         {{foreach from=$statusData key="keym" item="itemm"}}
         <option value="{{$itemm.pr_status}}" {{if $item.bsn_pcp_status eq $itemm.pr_status}} selected="selected" {{/if}}>{{$itemm.pr_status}}</option>
         {{/foreach}}
      </select>
       
       <script>
	   
        function update_status(id,value)
		{
		
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}proposal_report.update_status/bsn_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
	
       </script>
        
        
        </td>
        <td style="text-align:center;" ><a href = "{{$item.link}}" target="blank">Link</a></td>
        <td>{{$item.dpn_unique_id}} </td>
        <td> 
        <form name ="recmet2" method="post" action="">
        <input type="hidden" name="hasreno[{{$item.dpn_unique_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="hasreno[{{$item.dpn_unique_id}}]" value="1"  onclick="this.form.submit();" {{if $item.dpn_pcp_hasreno eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
            </label>
   	</form> 
        </td> 


	 {{ if $item.dpn_pcp_trafic_light eq 1}}
       <td style="background:#00CC33";>
       <a href="{{$BASE_URL}}proposal_report.colorbox/chk_no/{{$item.dpn_unique_id}}" class="various">Color</a>
       <br /><br />{{$item.dpn_pcp_tl_user}}<br />{{$item.dpn_pcp_tl_date}}<br />
        <a href="{{$BASE_URL}}proposal_report.reason/chk_no/{{$item.dpn_unique_id}}" class="various">Read</a>
       </td>
       {{ elseif  $item.dpn_pcp_trafic_light eq 2}}
       <td style="background: #ff7f27";>
       <a href="{{$BASE_URL}}proposal_report.colorbox/chk_no/{{$item.dpn_unique_id}}" class="various">Color</a>
       <br /><br />{{$item.dpn_pcp_tl_user}}<br />{{$item.dpn_pcp_tl_date}}<br />
       <a href="{{$BASE_URL}}proposal_report.reason/chk_no/{{$item.dpn_unique_id}}" class="various">Read</a>
       </td>
       {{ elseif  $item.dpn_pcp_trafic_light eq 3}}
       <td style="background: #F00";>
       <a href="{{$BASE_URL}}proposal_report.colorbox/chk_no/{{$item.dpn_unique_id}}" class="various">Color</a>
       <br /><br />{{$item.dpn_pcp_tl_user}}<br />{{$item.dpn_pcp_tl_date}}<br />
       <a href="{{$BASE_URL}}proposal_report.reason/chk_no/{{$item.dpn_unique_id}}" class="various">Read</a>
       </td>
       {{else }}
       <td>
       <a href="{{$BASE_URL}}proposal_report.colorbox/chk_no/{{$item.dpn_unique_id}}" class="various">Color</a></td>
       {{/if}}
	<td>{{$item.uid1}}</td>
                   
        <td style="text-align:center;" > 
             {{if $item.checklist17}}
            <a href = "https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.checklist17}}?dummy={{$ran}}" target="_blank">Download</a>
            <br />{{$item.checklist17_date|date_format:"%e-%m-%Y"}}
             {{/if}}
        </td>
         
        <td>
        <input type="text" name="letter[{{$item.dpn_bsn_id}}]" value="{{$item.bsn_pcp_letter_text}}" onkeyup = "update_pcp_letter({{$item.dpn_bsn_id}},this.value)" style="width:60px;"/>
       
       <script>
	   
	   function update_pcp_letter(id,value)
		{
			
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}/proposal_report.update_pcp_letter_text/bsn_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
	
       </script>
         
         </td>
        
         <td>
                
        <textarea rows="4" cols="40" class="tinymce2" id="{{$item.dpn_bsn_id}}" style="overflow-y: scroll;">{{$item.bsn_where_we_are}}</textarea>       
   
       <script>
	   
	    $(document).ready(function(){
                     $("#{{$item.dpn_bsn_id}}").keyup(function(){
                           update_where_we_are({{$item.dpn_bsn_id}},this.value);
                     });
             });
	     
	   
	   
	   function update_where_we_are(id,value)
		{
		//alert(id);	
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}proposal_report.update_where_we_are/bsn_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
	
       </script>
         
         </td>
        <td> 
        <input type="text" name="estimate[{{$item.dpn_unique_id}}]" value="{{$item.dpn_pcp_esti_cost}}" onkeyup = "update_estimate_cost({{$item.dpn_unique_id|ltrim:'0'}},this.value)" style="width:120px;"/>
       
       <script>
	   
	   function update_estimate_cost(id,value)
		{
			
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}proposal_report.update_estimate_cost/dpn_unique_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
	
        </script>
         </td>
        
         <td> 
        <input type="text" name="site_scope[{{$item.dpn_unique_id}}]" value="{{$item.dpn_pcp_site_scope}}" onkeyup = "update_site_scope({{$item.dpn_unique_id|ltrim:'0'}},this.value)" style="width:120px;"/>
       
       <script>
	   
	   function update_site_scope(id,value)
		{
			
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}proposal_report.update_site_scope/dpn_unique_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
	
        </script>
         </td>
       
       
        <td style="text-align:center;" >  {{if $item.checklist31}}
            <a href = "https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.checklist31}}?dummy={{$ran}}" target="_blank">Download</a>
             <br />{{$item.checklist31_date}}
             {{/if}} <br />
          <a href ="{{$BASE_URL}}proposal_report.viewstep_31/bsn_id/{{$item.dpn_bsn_id}}/pcn/{{$item.dpn_proposal_number}}" class="various">Show Detail</a>   
        </td>
  
	  <td style="text-align:center;" >
               {{if $item.checklist10}}
            <a href = "https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.checklist10}}?dummy={{$ran}}" target="_blank">Download</a>
             <br />{{$item.checklist10_date}}
            {{/if}}
            <br />
          <a href ="{{$BASE_URL}}proposal_report.viewstep_10/bsn_id/{{$item.dpn_bsn_id}}/pcn/{{$item.dpn_proposal_number}}" class="various">Show Detail</a>
        </td>

       
        <td>
        {{if $item.checklist8}}
            <a href = "https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.checklist8}}?dummy={{$ran}}" target="_blank">Download</a>
                 <br />{{$item.checklist8_date}}
             {{/if}}
             
       <br />
          <a href ="{{$BASE_URL}}proposal_report.viewstep_8/bsn_id/{{$item.dpn_bsn_id}}/pcn/{{$item.dpn_proposal_number}}" class="various">Show Detail</a>
               
        </td>
        
          <td>  {{if $item.checklist62}} 
                <a href = "https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.checklist62}}?dummy={{$ran}}" target="_blank">Download</a>
                 <br />{{$item.checklist62_date}}
             {{/if}}
       
         <br />
          <a href ="{{$BASE_URL}}proposal_report.viewstep_62/bsn_id/{{$item.dpn_bsn_id}}/pcn/{{$item.dpn_proposal_number}}" class="various">Show Detail</a>
   
       </td>
      
      	<td>{{$item.box_1_date}}</td>
        <td>{{$item.uid64}}</td>
        <td>{{$item.box_2_date}}</td>
        <td>{{$item.uid65}}</td>
       <td>
       <form name = "tent" method="post" action="">
        <input type="text" name="dpn_pcp_tent_date[{{$item.dpn_unique_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo2_{{$item.dpn_unique_id}}" value="{{$item.dpn_pcp_tent_date}}"  /> 
       <input type="submit" value="Set" name="test_date" class="set" />
       </form>
       </td>
       
        <td style="text-align:center;" > 
        <form name = "pbd2" method="post" action="">
        <input type="text" name="bsn_pcp_pbd2[{{$item.dpn_bsn_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo22_{{$item.dpn_bsn_id}}" value="{{$item.bsn_pcp_pbd}}"  /> 
       <input type="submit" value="Set" name="pbd" class="set" />
       </form>
        </td>
   
     <td style="text-align:center;" >
          {{if $item.checklist61}}
            <a href = "https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.checklist61}}?dummy={{$ran}}" target="_blank">Download</a>
             <br />{{$item.checklist61_date}}
            {{/if}}
        </td>
          
         <td>{{$item.uid72}} </td> 
                  
        <td style="text-align:center;" > 
         <form name = "pbd" method="post" action="">
         <input type="text" name="bsn_pcp_hbd[{{$item.dpn_bsn_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo3_{{$item.dpn_bsn_id}}" value="{{$item.bsn_pcp_hbd}}"  /> 
             <input type="submit" value="Set" name="hbd" class="set" />
         </form>    
        </td>
        
        <td>
        <form name ="recmet" method="post" action="">
        <input type="hidden" name="hide[{{$item.dpn_unique_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="hide[{{$item.dpn_unique_id}}]" value="1"  onclick="this.form.submit();" {{if $item.dpn_pcp_hide eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
            </label>
             
   	</form> 
        </td>
        
        <td>
        <form name ="recmet" method="post" action="">
        <input type="hidden" name="pbns[{{$item.dpn_unique_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="pbns[{{$item.dpn_unique_id}}]" value="1"  onclick="this.form.submit();" {{if $item.dpn_pbns_hide eq 1 }} checked="checked" {{/if}} />
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