<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/default.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/tree/simpletreemenu.js"></script>

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/rangeslider/rangeSlider.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/rangeslider/rangeSlider.js"></script>

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

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


function show_alert(bsn_id)
{
	var viewurl = "{{$BASE_URL}}inclusions_report.alerts"+ "/bsn_id/" + bsn_id;	
	
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



</style>

<h3 class="page-title">CMA</h3>
<br />

<form name="mlist" method="post" enctype="multipart/form-data">

<div style="float:left; margin-left:5px;"> 
<input type= "submit" name="notcompleted" title="Not Completed" value="Not Completed">
<input type= "submit" name="showall" title="Show All" value="Show All">
<!--&nbsp; &nbsp; <strong>Search:</strong>&nbsp;&nbsp;
<input type="text" name="searchkey" value="{{$searchkey}}" style="width:400px;" placeholder="Enter address"/>
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" value="Search" name="searchaddr"  />
<input type="submit" value="Clear Search" name="clear"  /> -->
</div> 

<div style="float:right;"> 
<input type= "submit" name="savedata" title="Save" value="Save/Update Data"> &nbsp; 
<input type="submit" value="Show Hidden" name="unhide"  />&nbsp;&nbsp;

</div>


<div style="float:left; width:100%;">
  <table id="doclist-table" class="nav-back" width="100%">
    <thead>
      <tr>
        <th class="topmenu" align="center" valign="middle" width="3%">SrNo</th>
        <th class="topmenu" align="center" valign="middle" width="15%">Address</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Name</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Email</th>
      <!--  <th class="topmenu" align="center" valign="middle" width="3%">Saluation</th>-->
        <th class="topmenu" align="center" valign="middle" width="3%">Beds</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Bath</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Block SQM</th>
        <th class="topmenu" align="center" valign="middle" width="5%">High Price </th>
        <th class="topmenu" align="center" valign="middle" width="5%">Low Price</th>
        <th class="topmenu" align="center" valign="middle" width="5%">MPG</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Add to Agentbox </th>
        <th class="topmenu" align="center" valign="middle" width="5%">Type Of Report</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Price Finder Estimate</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Brochure</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Price Opinion</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Emailed</th> 
        <th class="topmenu" align="center" valign="middle" width="7%">Delivered</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Completed</th>
        <th class="topmenu" align="center" valign="middle" width="7%">DD Record</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Hide From Report</th>
        
      </tr>
    {{if $list}}
    <tbody>
    
      <!--{{assign var=countn value= $numstartvounter}}-->
       {{assign var=countn value= $total2}}
      
      {{foreach from=$list key="key" item="item"}}
      <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
        <td> {{$countn}} </td>
        <td>{{$item.bsn_address}}</td>
        <td> 
        {{$item.bcust_fname}}&nbsp;{{$item.bcust_lname}}
        </td>
        
        <td>{{$item.bcust_misc_email1}}</td>
       <!--<td><input type="text" name="salution[{{$item.bsn_id}}]" style="width:25px;" value="{{$item.cma_sal}}" /> </td>-->
       
       <td> 
       <select name="bed[{{$item.bsn_id}}]" >
       <option value="1" {{if $item.cma_bed eq 1}} selected="selected" {{/if}}> 01 </option>
       <option value="2" {{if $item.cma_bed eq 2}} selected="selected" {{/if}}> 02 </option>
       <option value="3" {{if $item.cma_bed eq 3}} selected="selected" {{/if}}> 03 </option>
       <option value="4" {{if $item.cma_bed eq 4}} selected="selected" {{/if}}> 04 </option>
       <option value="5" {{if $item.cma_bed eq 5}} selected="selected" {{/if}}> 05 </option>
       <option value="6" {{if $item.cma_bed eq 6}} selected="selected" {{/if}}> 06 </option>
       <option value="7" {{if $item.cma_bed eq 7}} selected="selected" {{/if}}> 07 </option>
       <option value="8" {{if $item.cma_bed eq 8}} selected="selected" {{/if}}> 08 </option>
       <option value="9" {{if $item.cma_bed eq 9}} selected="selected" {{/if}}> 09 </option>
       <option value="10" {{if $item.cma_bed eq 10}} selected="selected" {{/if}}> 10 </option>
       </select>       
       </td>
 
      <td> 
       <select name="bath[{{$item.bsn_id}}]" >
       <option value="1" {{if $item.cma_bath eq 1}} selected="selected" {{/if}}> 01 </option>
       <option value="2" {{if $item.cma_bath eq 2}} selected="selected" {{/if}}> 02 </option>
       <option value="3" {{if $item.cma_bath eq 3}} selected="selected" {{/if}}> 03 </option>
       <option value="4" {{if $item.cma_bath eq 4}} selected="selected" {{/if}}> 04 </option>
       <option value="5" {{if $item.cma_bath eq 5}} selected="selected" {{/if}}> 05 </option>
       <option value="6" {{if $item.cma_bath eq 6}} selected="selected" {{/if}}> 06 </option>
       <option value="7" {{if $item.cma_bath eq 7}} selected="selected" {{/if}}> 07 </option>
       <option value="8" {{if $item.cma_bath eq 8}} selected="selected" {{/if}}> 08 </option>
       <option value="9" {{if $item.cma_bath eq 9}} selected="selected" {{/if}}> 09 </option>
       <option value="10" {{if $item.cma_bath eq 10}} selected="selected" {{/if}}> 10 </option>
       </select>       
        </td>
  
        <td> 
        <input type="text" name="block[{{$item.bsn_id}}]" style="width:65px;" value="{{$item.cma_block}}" />
<!--       <select name="block[{{$item.bsn_id}}]" >
       <option value="1" {{if $item.cma_block eq 1}} selected="selected" {{/if}}> 01 </option>
       <option value="2" {{if $item.cma_block eq 2}} selected="selected" {{/if}}> 02 </option>
       <option value="3" {{if $item.cma_block eq 3}} selected="selected" {{/if}}> 03 </option>
       <option value="4" {{if $item.cma_block eq 4}} selected="selected" {{/if}}> 04 </option>
       <option value="5" {{if $item.cma_block eq 5}} selected="selected" {{/if}}> 05 </option>
	   </select> -->      
        </td>
   
       <td><input type="text" name="high_price[{{$item.bsn_id}}]" style="width:65px;" value="{{$item.cma_high_price}}" /> </td>
 
       <td><input type="text" name="low_price[{{$item.bsn_id}}]" style="width:65px;" value="{{$item.cma_low_price}}" /> </td>
  
       <td><input type="text" name="mpg[{{$item.bsn_id}}]" style="width:65px;" value="{{$item.cma_mpg}}" /> </td>
       <td>
         <form name ="recmet" method="post" action="">
        <input type="hidden" name="savetorm[{{$item.bsn_id}}]" value="0" />
        <label class="switch">
        <input class="switch-input" type="checkbox"  name="savetorm[{{$item.bsn_id}}]" value="1"  onclick="this.form.submit();" {{if $item.cma_agentbox eq 1 }} checked="checked" {{/if}} />
       
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
         
        </label>
         </form> 

        </td>
       <td> 
       <select name="type_of_report[{{$item.bsn_id}}]" >
       <option value="1" {{if $item.cma_type_of_report eq 1}} selected="selected" {{/if}}> None  </option>
       <option value="2" {{if $item.cma_type_of_report eq 2}} selected="selected" {{/if}}> Sales Brochure </option>
       <option value="3" {{if $item.cma_type_of_report eq 3}} selected="selected" {{/if}}> Market Update  </option>
       <option value="4" {{if $item.cma_type_of_report eq 4}} selected="selected" {{/if}}> Price Opinion  </option>
       <option value="5" {{if $item.cma_type_of_report eq 5}} selected="selected" {{/if}}> Both Price Opinion and Sales Brochure  </option>
	</select>  
       </td>
	<td>
        <input type="file" name="salescma[{{$item.bsn_id}}]" /><br />
        {{if $item.cma_sales_cma}}
        <div style="text-align:center;"> <a href="{{$BASE_URL}}files/cma/{{$item.cma_sales_cma}}" target="_blank">Download</a></div> {{/if}}
         </td>
 
       <td>
       <input type="file" name="brochure[{{$item.bsn_id}}]" /><br />
        {{if $item.cma_brochure}}
        <div style="text-align:center;">  <a href="{{$BASE_URL}}files/cma/{{$item.cma_brochure}}" target="_blank">Download</a></div> {{/if}}
        </td>
  
       <td> 
       <input type="file" name="merged[{{$item.bsn_id}}]" /><br />
       {{if $item.cma_merged}}
        <div style="text-align:center;">   <a href="{{$BASE_URL}}files/cma/{{$item.cma_merged}}" target="_blank">Download</a></div>
       {{/if}}
        </td>
       <td> 
        <input type="text" name="emailed[{{$item.bsn_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo1_{{$item.bsn_id}}" value="{{$item.cma_emailed_date}}" style="width:68px !important"  />
        </td>
       <td>
      
         
        </td>
        <td>
        <input type="hidden" name="completed[{{$item.bsn_id}}]" value="0" />
        <input type="checkbox" name="completed[{{$item.bsn_id}}]" value="1" {{if $item.cma_completed eq 1 }} checked="checked" {{/if}} />
        
        </td>
        
        <td>
        <input type="hidden" name="ddrecord[{{$item.bsn_id}}]" value="0" />
        <input type="checkbox" name="ddrecord[{{$item.bsn_id}}]" value="1" {{if $item.cma_dd_record eq 1 }} checked="checked" {{/if}} />
        </td>
        
        <td>
         <form name ="recmet2" method="post" action="">
        <input type="hidden" name="hide[{{$item.bsn_id}}]" value="0" />
        <label class="switch">
        <input class="switch-input" type="checkbox"  name="hide[{{$item.bsn_id}}]" value="1"  onclick="this.form.submit();" {{if $item.bs_cma_hide eq 1 }} checked="checked" {{/if}} />
       
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
         
        </label>
         </form> 

        </td>
        
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