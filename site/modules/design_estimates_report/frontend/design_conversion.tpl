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


function add_procedure()
{
	var viewurl = "{{$BASE_URL}}design_report.view_procedure_dcr"+ "/random/" + Math.random();	

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



function proj_panel()
{
	var viewurl = "{{$BASE_URL}}design_report.project_panel"+ "/random/" + Math.random();	

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
	
function close_win2()
	{
	$.fancybox.close();
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
.div1 {width:2190px; height: 20px; }
.div2 {width:2490px;  overflow: auto;}   
.tableFixHead          { overflow-y: auto; height: 1200px; }
.tableFixHead thead th { position: sticky; top: 0; text-align:left; }
table  { border-collapse: collapse; width: 100%; }
th     { z-index:9999; }
 #fancybox-wrap {z-index:9999999;}   
 
 .slidecontainer {
  width: 300px;
  
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
  width: 5px;
  height: 25px;
  background: #F00 ;
  cursor: pointer;
}

.slider::-moz-range-thumb {
  width: 15px;
  height: 15px;
  background: #F00;
  cursor: pointer;
}
 
 
</style>

<h3 class="page-title">Designs Conversion Report</h3>
<br />

<form name="sort" method="post">
<div style="float:left; text-align: left; margin-left:10px; text-align:left">
&nbsp; &nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> &nbsp;
<strong>Value Of Likley to go ahead: ${{$valuedata.valtot|number_format:2:".":","}} </strong>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<strong>Number Likley To Go Ahead: &nbsp; &nbsp; {{$tot}} </strong> 
</div> <br />

 <div class="slidecontainer" style="float:left; text-align:left; margin-left:20px; display:inline" >
  <input type="range" min="0" max="100" value="{{$dpdata.dp_percent}}" class="slider" id="myRange" Onchange = "update_dp(this.value,{{$valuedata.valtot}})" >
   <p>%: <span id="demo"></span></p>
 $ <input type="text" name="design_profit" id="dp" value="{{$dpdata.dp_profit|number_format:2:".":","}}" readonly="readonly" /> 
  </div>
   
<script>
	var slider = document.getElementById("myRange");
	var output = document.getElementById("demo");
	output.innerHTML = slider.value;
	
	slider.oninput = function() {
	  output.innerHTML = this.value;
	}
	
	function update_dp(value, totval)
		{
		 var profit = totval * value /100;
		 
		 const formattedProfit = new Intl.NumberFormat('en-US', {
		  minimumFractionDigits: 2,
		  maximumFractionDigits: 2
		}).format(profit);
		 	
	     $('#dp').val(formattedProfit);
		 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}design_report.update_dp/value/"+value,
						   success: function(result){
					   }
					 });
		}		
</script>
       

</form>

<form name="mlist" method="post">
<div style="float:right;"> 
<input type="Submit" name = "print" value="Print"  /> &nbsp;
</div> 
</form>
  <div > 
  <table id="list-table" class="nav-back tableFixHead" style="width:100%;">
    <thead>
      <tr>
        <th class="topmenu" align="center" valign="middle" width="5%">Relevant Checklist Numbers</th>
        <th class="topmenu" align="center" valign="middle" width="22%">Customer Details</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Day Count</th>
        <th class="topmenu" align="center" valign="middle" width="10%">Designer</th>
        <th class="topmenu" align="center" valign="middle" width="15%">Value ($) </th>
        <th class="topmenu" align="center" valign="middle" width="12%">Last CSM spoke</th>
        <th class="topmenu" align="center" valign="middle" width="10%">Latest Merged Plans </th>
        <th class="topmenu" align="center" valign="middle" width="10%">Add To Construction Pipeline Report</th>
        <th class="topmenu" align="center" valign="middle" width="10%">Project Go Ahead</th>
        <th class="topmenu" align="center" valign="middle" width="10%">Ranking</th>
        <th class="topmenu" align="center" valign="middle" width="10%">Plan Day Count</th>
      </tr>
    </thead>
    {{if $list}}
    <tbody>
    
      {{assign var=countn value= $total}}
      
      {{foreach from=$list key="key" item="item"}}
     
      <tr {{if $item.dpn_dr_per_complete eq 100}} bgcolor="#99CC99" {{else}} bgcolor="{{cycle values="#dceff5,WHITE" advance=true}} {{/if}}">
      <td> {{$item.chknoData}} </td>
      <td> <strong>{{$item.bcust_fname}} &nbsp; {{$item.bcust_lname}}</strong> <br /><a href="{{$item.link}}" target="_blank">{{$item.bsn_address}}</a></td>
      <td>{{$item.dayscount}} </td>
      <td>{{$item.dpn_customer_designer}}</td>
      <td> $
      <input type="text" name="dpn_dcr_value" value="{{$item.dpn_dcr_value}}"  onkeyup="update_value({{$item.chknoData|ltrim:'0'}}, this.value);" autofocus oninput="this.value = this.value.replace(/[^0-9+.,]/g, '').replace(/(\..*?)\..*/g, '$1');"/>
     
     <script language="javascript">
       	
	function update_value(id,value)
		{
			
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}design_report.update_dcr_value/dpn_unique_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		
		}
       
       </script>
      </td>
      <td>  
        <form name = "pbd" method="post" action="">
        <input type="text" name="dpn_dcr_latest_css[{{$item.chknoData}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo2_{{$item.chknoData}}" value="{{$item.dpn_dcr_latest_css}}"  /> 
       <input type="submit" value="Set" name="latest_css" class="set" /><br />{{if $item.dpn_dcr_latest_css}}{{$item.dpn_dcr_latest_css_user}} {{/if}}
       </form>
       </td>
      
      <td> 
      {{$item.lmp_date}}
      {{if $item.lmp_date}}<br /><br />
        <!--<a href = "https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.lmp_doc_file_name}}" target="_blank">Download</a>-->
        <a href="/design_report.download_content_deco?file_name={{$item.lmp_doc_file_name}}&module_name=design_report.design_conversion" target="_blank">Download</a>
         <br />
      {{/if}} 
      </td>
       <td>
        <form name ="showincpr" method="post" action="">
     	<input type="hidden" name="incpr[{{$item.bsn_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="incpr[{{$item.bsn_id}}]" value="1"  onclick="this.form.submit();" {{if $item.bsn_showin_cpr eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
        </label> 
        </form>  
        </td> 
        
        <td>
        <form name ="go" method="post" action="">
     	<input type="hidden" name="go_ahead[{{$item.chknoData}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="go_ahead[{{$item.chknoData}}]" value="1"  onclick="this.form.submit();" {{if $item.dpn_dcr_go_ahead eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
        </label> 
        </form>  
        </td> 
        
        <td>
        <select name="ranking" onchange="update_ranking({{$item.chknoData|ltrim:'0'}}, this.value)">
        <option value="1" {{if $item.dpn_dcr_ranking eq 1}} selected="selected" {{/if}} > 1</option>  
   	    <option value="2" {{if $item.dpn_dcr_ranking eq 2}} selected="selected" {{/if}} > 2</option>   
        <option value="3" {{if $item.dpn_dcr_ranking eq 3}} selected="selected" {{/if}} > 3</option>   
        <option value="4" {{if $item.dpn_dcr_ranking eq 4}} selected="selected" {{/if}} > 4</option>   
        <option value="5" {{if $item.dpn_dcr_ranking eq 5}} selected="selected" {{/if}} > 5</option>   
        <option value="6" {{if $item.dpn_dcr_ranking eq 6}} selected="selected" {{/if}} > 6</option>   
        <option value="7" {{if $item.dpn_dcr_ranking eq 7}} selected="selected" {{/if}} > 7</option>   
        <option value="8" {{if $item.dpn_dcr_ranking eq 8}} selected="selected" {{/if}} > 8</option>   
        <option value="9" {{if $item.dpn_dcr_ranking eq 9}} selected="selected" {{/if}} > 9</option>   
        <option value="10" {{if $item.dpn_dcr_ranking eq 10}} selected="selected" {{/if}} > 10</option>        
        </select>
         <div id="gh{{$item.chknoData|ltrim:'0'}}">{{$item.dpn_dcr_ranking_date}}<br />{{$item.dpn_dcr_ranking_user}} </div>
        
        <script language="javascript">
			
			function update_ranking(id,value)
				{
				var tana10 = "#gh"+id;
				
				 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}design_report.update_dcr_ranking/dpn_unique_id/"+id+"/value/"+value,
						   success: function(result){
							    $(tana10).html(result);  
					   }
					 });
				
				}
			   
       </script>
        
        </td>
        
        <td>{{$item.plandaycount}}</td>
        
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
