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

			$(".addfile").fancybox({
				'width': '40%',
				'height': '30%',
				'autoScale': false,
				 'transitionIn' : 'elastic',
				 'transitionOut' : 'elastic',
				 'speedIn' : 300,
				 'speedOut' : 300,
				 'overlayShow' : true,
				 'hideOnOverlayClick':false,
				 'hideOnContentClick':false,
				 'type': 'iframe',
				 'scrolling': 'no' 
			});
		
			$(".shofile").fancybox({
						'width': '80%',
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

 var getcurrenturl= "{{$BASE_URL}}{{$XFA.home}}?mlbs_id="; // The server-side script
 
function handleHttpupdatelist() {   
        if (http.readyState == 4) {
              if(http.status == 200) {
                  var results=http.responseText;    			  
			  if(results !='')
			  	{
				
				window.location.reload();
				closeTop();
				}
            }
          }
        }
       
        function updatelist(id) { 

	     var mlbs_last_buyer_feedback = document.getElementById(id+'_mlbs_last_buyer_feedback').value;
		var mlbs_completedby = document.getElementById(id+'_mlbs_completedby').value;
		 var mlbs_update_date = document.getElementById(id+'_mlbs_update_date').value;
         var mlbs_notes = document.getElementById(id+'_mlbs_notes').value;
		var businessurl = getcurrenturl + id+'&mlbs_completedby=' + mlbs_completedby + '&mlbs_update_date=' +mlbs_update_date +'&mlbs_last_buyer_feedback='+mlbs_last_buyer_feedback+'&mlbs_notes='+mlbs_notes+ '&random=' + Math.random();

			http.open("GET", businessurl, true);
            http.onreadystatechange = handleHttpupdatelist;
           	http.send(null);
			showTop();
        }

//////////////////////////////////////////////////
function getHTTPObject() {
			  var xmlhttp;
			
			  if(window.XMLHttpRequest){
				xmlhttp = new XMLHttpRequest();
			  }
			  else if (window.ActiveXObject){
				xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
				if (!xmlhttp){
					xmlhttp=new ActiveXObject("Msxml2.XMLHTTP");
					}
				}
			  return xmlhttp; 
			}
			var http = getHTTPObject(); 
// We create the HTTP Object

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
</script>


<script type="text/javascript" > 
function viewfeedback(bsn_id)
{
	var viewurl = "{{$BASE_URL}}planning_assesment_quickreport.viewfeedback"+ "/bsn_id/" + bsn_id;	
	
	
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
.tooltip {
    position: relative;
   /* display: inline-block;*/
	border:0px solid !important;
	margin-top:5px;
    
}

.tooltip .tooltiptext {
    visibility: hidden;
    width: 500px;
    background-color: black;
    color: #fff;
    text-align: center;
    border-radius: 6px;
    padding: 5px 5px;
	display:block;
	margin-left:20px;

    /* Position the tooltip */
    position: absolute;
    z-index: 1;
}

.tooltip:hover .tooltiptext {
    visibility: visible;
}

.wrapper1, .wrapper2{width: 1900px; border: none 0px RED;
overflow-x: scroll; overflow-y:hidden; scrollbar-color: yellow blue;}
.wrapper1{height: 20px; }
.wrapper2{ }
.div1 {width:2880px; height: 20px; }
.div2 {width:2880px;  overflow: auto;} 

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

.tableFixHead          { overflow-y: auto; height: 700px; }
.tableFixHead thead th { position: sticky; top: 0; text-align:left; }

table  { border-collapse: collapse; width: 100%; }

th     { z-index:9999; }

</style>

<h3 class="page-title">{{$title}}</h3>
<br />
<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
    
   <div style="float:left; padding-top:8px;"> &nbsp;&nbsp;&nbsp;
   	<span><strong>Planning Reports Not Created :</strong> </span>&nbsp;&nbsp;&nbsp;
   </div>
   <div style="float:left;"> &nbsp;
   <input type="hidden" name="hide[{{$item.bsn_id}}]" value="0" />
   <label class="switch" style="margin-top:-10px;">
   <input class="switch-input" type="checkbox"  name="plreport_not" value="1" {{if $pnot eq 1 }} checked="checked" {{/if}}  />
         	<span class="switch-label" data-on="ON" data-off="OFF"></span> 
        	<span class="switch-handle"></span> <br />
   </label>
   </div>  
   
   <div style="float:left; margin-right:10px;"> <input type="submit" value="Submit" name="planning"  />   </div>
   
   <div style="float:left; margin-right:15px;">
    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Status:</strong>&nbsp;&nbsp;</span>
    
    <select name="keyword">
    <option value="Open" {{if $keyword eq 'Open' }} selected="selected" {{/if}} >Open </option>
    <option value="Hold" {{if $keyword eq 'Hold' }} selected="selected" {{/if}} >Hold </option>
    <option value="Lost" {{if $keyword eq 'Lost' }} selected="selected" {{/if}} >Lost </option>
    </select>
    &nbsp;&nbsp;&nbsp
    <input type="submit" value="Search" name="search"  />
   </div> 
   
   <div style="float:left;"> <input type="submit" value="Clear All" name="clear"  /> &nbsp;&nbsp;</div>  
   
   
 </form>

<form name="mlist" method="post">
<div style="float:right;"> 
 <input type="submit" name="meetinoffice" value="Update Meet in Office" /> &nbsp;&nbsp;
<input type="submit" name="download" value="Download Pdf" /> 
<input type="submit" name="moveto" value="Move To New" /> 
</div>
<br />
<div style="float:left;"> &nbsp; &nbsp; <strong>Search:</strong>&nbsp;&nbsp;
<input type="text" name="searchkey" value="{{$searchkey}}" style="width:400px;" placeholder="Enter address"/>
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" value="Search" name="searchaddr"  />
</div> 
<div style="margin-top:35px;"> &nbsp; </div>
<div class="wrapper1">
    <div class="div1">
    </div>
</div>

<div class="wrapper2">
    <div class="div2 tableFixHead">

  <table id="doclist-table" class="nav-back tableFixHead" width="100%">
    <thead>
      <tr>
        <th class="topmenu" align="center" valign="middle" width="3%">SrNo</th>
        <th class="topmenu" align="center" valign="middle" width="14%">Address</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Link</th>
        <th class="topmenu" align="center" valign="middle" width="3%"> Vcard</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Status</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Day Count</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Budget</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Meeting Options</th>
        <th class="topmenu" align="center" valign="middle" width="6%">Planning Assessment Report</th>
        <th class="topmenu" align="center" valign="middle" width="6%">Star Rating</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Phone Follow Ups</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Last Followup Date</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Signed Design Agreement</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Needs Analysis Survey</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Add Feedback</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Box Sent</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Face to Face Booked</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Planning Assement Report Delivered </th>
        <th class="topmenu" align="center" valign="middle" width="7%">Third Pary Designs </th>
        <th class="topmenu" align="center" valign="middle" width="7%">Address </th>
        <th class="topmenu" align="center" valign="middle" width="6%">Add to Report</th>
         <th class="topmenu" align="center" valign="middle" width="6%">Move to New</th>
        
      </tr>
      </thead>
    {{if $list}}
    <tbody>
    
      <!--{{assign var=countn value= $numstartvounter}}-->
       {{assign var=countn value= $total}}
      
      {{foreach from=$list key="key" item="item"}}
      
       
      <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
        <td> {{$countn}} </td>
        <td>{{$item.bsn_address}}</td>
        <td style="text-align:center;" ><a href = "{{$item.link}}" target="blank">Link</a></td>
        <td><a href="{{$BASE_URL}}js/vcard/index.php?fname={{$item.bcust_fname}}&lname={{$item.bcust_lname}}&email1={{$item.bcust_misc_email1}}&email2={{$item.bcust_misc_email2}}&mobile={{$item.bcust_misc_moble}}&business={{$item.bcust_misc_business}}&home={{$item.bcust_misc_home}}" class="action_new" title="Download Vcard"><img style="height: 17px; width:22px" src="{{$BASE_URL}}images/vcard.png"/></a> </td>
        <td style="text-align:center;" >{{$item.status}}</td>
        <td style="text-align:center;" >{{$item.dayscount}}</td>
        <td style="text-align:center;" >{{$item.budget}}</td>
		<td>
       <select name="meet[{{$item.bsn_id}}]" >
       <option value="1" {{if $item.meet eq 1}} selected="selected" {{/if}}> Default   </option>
       <option value="2" {{if $item.meet eq 2}} selected="selected" {{/if}}> Meet in office </option>
       <option value="3" {{if $item.meet eq 3}} selected="selected" {{/if}}> Email then meets in office  </option>
       <option value="4" {{if $item.meet eq 4}} selected="selected" {{/if}}> Only Email Reports  </option>
       <option value="5" {{if $item.meet eq 5}} selected="selected" {{/if}}> Email and Post Reports   </option>
	</select>  
         </td>
       
        {{if $item.checklist44}}
        <td style="text-align:center;" >
            <a href = "{{$BASE_URL}}files/document_check_list_files/{{$item.checklist44}}?dummy={{$ran}}" target="_blank">Download</a>
        </td>
        {{else}}
        <td style="background:#F00"> </td>
        {{/if}}
        
        <td>
   	
                
        <div class="slidecontainer">
        <input type="range" min="0" max="10" value="{{$item.bsn_rating}}" class="slider" id="myRange_{{$countn}}" Onchange = "update({{$item.bsn_id}},this.value)" >
        <p> <span id="demo_{{$item.bsn_id}}"></span></p>
        </div>

<script>
var slider = document.getElementById("myRange_{{$countn}}");
var output{{$item.bsn_id}} = document.getElementById("demo_{{$item.bsn_id}}");
output{{$item.bsn_id}}.innerHTML = slider.value;

slider.oninput = function() {
  output{{$item.bsn_id}}.innerHTML = this.value;
}

	
	function update(id,value)
	{
	 //alert(id);
	 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}/planning_assesment_quickreport.update_rating/bsn_id/"+id+"/value/"+value,
					   success: function(result){
				   }
				 });
	
	}
	
	
</script>
                
                
                
        </td>
        
        <td style="text-align:center;" > {{$item.salesfolloup}} </td>
        <td style="text-align:center;" >{{$item.lastfoldt}}</td>
        
        {{if $item.checklist45}}
        <td style="text-align:center;" >
            <a href = "{{$BASE_URL}}files/document_check_list_files/{{$item.checklist45}}?dummy={{$ran}}" target="_blank">Download</a>
        </td>
        {{else}}
        	<td style="background:#F00"> </td>
        {{/if}}
        
       {{if $item.checklist2}}
        <td style="text-align:center;" >
            <a href = "{{$BASE_URL}}files/document_check_list_files/{{$item.checklist2}}?dummy={{$ran}}" target="_blank">Download</a>
        </td>
        {{else}}
        	<td style="background:#F00"> </td>
        {{/if}}
        
         <td style="text-align:center;" >
          <input type="button" name="Alert" value="Add Feedback" onclick="javascript:addfeedback({{$item.bsn_id}});" style="width:90px; height:20px; font-size:11px; line-height:17px !important; padding:0px !important" /><br />
          
          <input type="button" name="Alert" value="View Feedback" onclick="javascript:viewfeedback({{$item.bsn_id}});" style="width:90px; height:20px; font-size:11px; line-height:17px !important; padding:0px !important" />
         </td>
        
        {{if $item.boxsent}} 
        <td style="text-align:center;" >{{$item.boxsent}}</td> 
        {{else}}
        <td style="background:#F00"> </td>
        {{/if}}
        
      {{if $item.uid137complete eq 1 }}
        	<td style="text-align:center;" >{{$item.uid137}}</td>
        {{else}}
            <td style="background:#F00"></td>
        {{/if}}
       {{if $item.uid206complete eq 1 }}
        	<td style="text-align:center;" >{{$item.uid206}}</td>
        {{else}}
            <td style="background:#F00"></td>
        {{/if}}
        
        {{if $item.checklist412}}
        <td style="text-align:center;" >
            <a href = "{{$BASE_URL}}files/document_check_list_files/{{$item.checklist412}}?dummy={{$ran}}" target="_blank">Download</a>
        </td>
        {{else}}
        	<td style="background:#F00"> </td>
        {{/if}}
        <td>{{$item.bsn_address}}</td>
        <td style="text-align:center;" >
        <input type="hidden" name="hide[{{$item.bsn_id}}]" value="0" />
  	    <label class="switch">
            <input class="switch-input" type="checkbox"  name="pdf[{{$item.bsn_id}}]" value="1" />
         	<span class="switch-label" data-on="Yes" data-off="No"></span> 
        	<span class="switch-handle"></span> <br />
       </label>
        </td>
        <td> <input type="checkbox" name="new[{{$item.bsn_id}}]"  /> </td>
      </tr>
      {{assign var=countn value=$countn-1}}
      
      

      {{/foreach}}
      </tbody>
      
   
    {{/if}}
  </table>
  </form> 

  <script type="text/javascript">  
$(".shofiles").hover(function(){$(this).fadeOut(100);$(this).fadeIn(500);});
$(".shofiles").hover(
function () {
    $(this).addClass("hover");
  },
  function () {
    $(this).removeClass("hover");
  }
);
</script>
  {{if $last > 1}}
  <table width="90%" border="0" cellpadding="0" cellspacing="0">
    <tr> {{if $list}}
      <td align="center"><div class='pagination'> {{if $pagenum == 1}} <span class='disabled'>« previous</span> {{else}} <a class ="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{math equation="x - y" x=$pagenum y=1}}" title="Previous">« previous </a> {{/if}}
          
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
          {{if $pagenum == $last}} <span class='disabled'>next »</span> {{else}} <a class = "pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{math equation="x + y" x=$pagenum y=1}}" title="Next">next » </a></div>
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
</div>