<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
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
	var viewurl = "{{$BASE_URL}}lead_generation_report.view_procedure"+ "/random/" + Math.random();	

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
.set { font-size:10px !important; 
       width:25px !important; display:inline-block; 
	   padding-top:1px !important;
	   padding-bottom: 1px !important;
	   padding-left:1px !important;
	   height:25px !important; }


.wrapper1, .wrapper2{width: 100%; border: none 0px RED;
overflow-x: scroll; overflow-y:hidden; scrollbar-color: yellow blue;}
.wrapper1{height: 20px; }
.wrapper2{ }
.div1 {width:1420px; height: 20px; }
.div2 {width:1420px;  overflow: auto;} 

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
#fancybox-wrap {z-index:9999999;} 
</style>

<h3 class="page-title">Lead Generation Report</h3>
<br />
   
   <div style="float:left; margin-right:15px;">

   </div> 
  
<form name="mlist" method="post">
<div style="float:left;">
<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> <br />
</div>

<div style="float:right;">
<!--<input type="button" value="Export To XLS" onclick="document.location.href='{{$BASE_URL}}planning_assesment_quickreport.home/export/1'" /> &nbsp;
 <input type="submit" name="meetinoffice" value="Update Sales Pathway" /> &nbsp;&nbsp;
 <input type="submit" name="watchlist" value="Update Watch List" />
<input type="submit" name="download" value="Download Pdf" /> 
<input type="submit" name="moveto" value="Move To Old" /> -->
</div>
<!--<div style="float:left;"> &nbsp; &nbsp; <strong>Search:</strong>&nbsp;&nbsp;
<input type="text" name="searchkey" value="{{$searchkey}}" style="width:400px;" placeholder="Enter address"/>
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" value="Search" name="searchaddr"  />
</div> -->
<div style="margin-top:35px;"> &nbsp; </div>
<div class="wrapper1">
    <div class="div1">
    </div>
</div>

<div class="wrapper2">
    <div class="div2 tableFixHead">

  <table id="doclist-table" class="nav-back" width="100%">
    <thead>
      <tr>
        <th class="topmenu" align="center" valign="middle" width="2%">SrNo</th>
        <th class="topmenu" align="center" valign="middle" width="10%">Address</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Link</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Vcard</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Status</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Day Count</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Enquiry Method</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Project Enquiry</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Verified By MManager</th>
       
      </tr>
      </thead>
    {{if $list}}
    <tbody>
    
       {{assign var=countn value= $total}}
      
      {{foreach from=$list key="key" item="item"}}
      
       
      <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
        <td> {{$countn}} </td>
        <td><strong>{{$item.bcust_fname}} {{$item.bcust_lname}} </strong><br />
        {{$item.bsn_address}}</td>
        <td style="text-align:center;" ><a href = "{{$item.link}}" target="blank">Link</a></td>
        <td><a href="{{$BASE_URL}}js/vcard/index.php?fname={{$item.bcust_fname}}&lname={{$item.bcust_lname}}&email1={{$item.bcust_misc_email1}}&email2={{$item.bcust_misc_email2}}&mobile={{$item.bcust_misc_moble}}&business={{$item.bcust_misc_business}}&home={{$item.bcust_misc_home}}" class="action_new" title="Download Vcard"><img style="height: 17px; width:22px" src="{{$BASE_URL}}images/vcard.png"/></a> </td>
        <td style="text-align:center;" >{{$item.status}}</td>
        <td style="text-align:center;" >{{$item.dayscount}}</td>
        <td style="text-align:center;" >
        <input type="text" name="enq_method"  value="{{$item.bs_lgr_enq_method}}" onkeyup="update_method({{$item.bsn_id}}, this.value)"/>
        <script>
	
	function update_method(id,value)
	{
	     $.ajax({
		   type: "GET",
		   url: "{{$BASE_URL}}lead_generation_report.update_method/bsn_id/"+id+"/value/"+value,
			   success: function(result){
		   }
		 });
	}
	
        </script>
        
        </td>
	<td>{{$item.soe_name}}
        <select name="{{$TABLE}}[bsn_cd_enquiry_source]" class="lrg" >
                      <option value="0" selected="selected"> -- select --</option>
            	  {{foreach from=$allenquirysource key="key" item="item"}}
                      <option value="{{$item.soe_id}}" {{if $item.soe_id == $detail.bsn_cd_enquiry_source}} selected="selected" {{/if}}> {{$item.soe_name}}</option>  
            	  {{/foreach}}
                      </select>
        
         </td>
       <td>
         <form name ="recmet2" method="post" action="">
     	<input type="hidden" name="varified[{{$item.bcust_id}}]" value="2" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="varified[{{$item.bcust_id}}]" value="1"  onclick="this.form.submit();" {{if $item.bcust_lg_varified eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> 
       {{if $item.bcust_lg_varified eq 1 }} {{$item.bcust_lg_varified_date}} {{/if}}
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