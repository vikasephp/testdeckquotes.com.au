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
		
function add_task()
{
	var viewurl = "{{$BASE_URL}}warranty_log.viewtask"+ "/random/" + Math.random();	

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
	   margin-top:1px;
	   margin-left:3px;
	   }
	   
.wrapper1, .wrapper2{width: 100%; border: none 0px RED;
overflow-x: scroll; overflow-y:hidden; scrollbar-color: yellow blue;}
.wrapper1{height: 20px; }
.wrapper2{ }
.div1 {width:2190px; height: 20px; }
.div2 {width:2190px;  overflow: auto;}   
.tableFixHead          { overflow-y: auto; height: 700px; }
.tableFixHead thead th { position: sticky; top: 0; text-align:left; } 	   
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

<script type="text/javascript">
function add_procedure()
{
	var viewurl = "{{$BASE_URL}}warranty_and_complete_report.view_procedure"+ "/random/" + Math.random();	

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
	var viewurl = "{{$BASE_URL}}warranty_and_complete_report.viewtype"+ "/random/" + Math.random();	

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


<h3 class="page-title">{{$title}}</h3>
<br />
<!--<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
<div style="float:left;">
<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Search:</strong>&nbsp;&nbsp;</span>
<input type="text" name="keyword" value="{{$keyword}}" style="width:400px;" placeholder="Search for Address"/>
&nbsp;&nbsp;
<input type="submit" value="Search" name="search"  />
 </div>
 </form>-->
<div style="float:left;">
&nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> &nbsp;
<input type="button" name="Add New" value="Add Type Options" onclick="javascript:add_type();" /> 
</div>
  <br />
  <div class="tableFixHead" >  
  <table id="doclist-table" class="nav-back" width="100%">
    <thead>
      <tr>
        <th class="topmenu" align="center" valign="middle" width="3%">SrNo</th>
        <th class="topmenu" align="center" valign="middle" width="15%">Project</th>
        <th class="topmenu" align="center" valign="middle" width="4%">Link</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Occupancy Date</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Home Warranty Cert</th> 
        <th class="topmenu" align="center" valign="middle" width="7%">Merged QA reports </th>
        <th class="topmenu" align="center" valign="middle" width="7%">Certificate of occupancy</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Handover</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Customer Walkthrough Sign Off</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Walkthrough Warranty Log  </th>
        <th class="topmenu" align="center" valign="middle" width="7%">Open Logs </th>
        <th class="topmenu" align="center" valign="middle" width="7%">Merged Warranty</th>
        
        <th class="topmenu" align="center" valign="middle" width="7%">QI Report 1st </th>
        <th class="topmenu" align="center" valign="middle" width="7%">Q1 Report Final</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Customer Portal Link</th>
         
      </tr>
    </thead>  
    {{if $list}}
    <tbody>

      <!--{{assign var=countn value= $numstartvounter}}-->
       {{assign var=countn value= $total}}
      
      {{foreach from=$list key="key" item="item"}}
      <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
        <td> {{$countn}} </td>
        <td>{{$item.bcust_fname}} &nbsp; {{$item.bcust_lname}}<br />
        {{$item.bsn_address}}</td>
        <td style="text-align:center;" ><a href = "{{$item.link}}" target="blank">Link</a></td>
       <td style="text-align:center;" >
        <input type="text" name="oc_dt[{{$item.bcust_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo1_{{$item.bcust_id}}" value="{{$item.bcust_wcr_occ_date}}" onfocus ="update_occdt({{$item.bcust_id}}, this.value);"  /> 
        {{if $item.bcust_wcr_occ_date}}<br /> {{$item.bcust_wcr_occ_dt_who}} {{/if}}
	 <script>
	   
        function update_occdt(id,value)
		{
			$.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}warranty_and_complete_report.update_occ_date/bcust_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
	
       </script>
        </td>
        <td style="text-align:center;" >
        {{if $item.file_name_121}}
        <a href="/warranty_and_complete_report.download_content?file_name={{$item.file_name_121}}&module_name=warranty_and_complete_report.home" >Download</a>
          <!-- <a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.file_name_121}}">Download</a> -->
        {{/if}}
        </td>
        <td style="text-align:center;">
        
        </td>
        <td style="text-align:center;">
         {{if $item.file_name_173}}
          <a href="/warranty_and_complete_report.download_content?file_name={{$item.file_name_173}}&module_name=warranty_and_complete_report.home" >Download</a>
          <!-- <a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.file_name_173}}">Download</a> -->
         {{/if}}
        </td>
        <td>
        <select name="{{$TABLE}}[bcust_wacr_handover]" Onchange = "update_resstaff({{$item.bcust_id}},this.value)">
                <option value="Please Select">Please Select </option>
                {{foreach from = $datah key="key2" item="item2"}}
                <option value="{{$item2.ho_option}}" {{if $item2.ho_option eq $item.bcust_wacr_handover}} selected="selected" {{/if}}>{{$item2.ho_option}}</option>
                {{/foreach}}
        </select>
        
                <script>
	   
		function update_resstaff(id,value)
		{
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}warranty_and_complete_report.update_handover/bcust_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	</script>
        
        </td>
        <td style="text-align:center;">
         {{if $item.file_name_172}}
         <a href="/warranty_and_complete_report.download_content?file_name={{$item.file_name_172}}&module_name=warranty_and_complete_report.home" >Download</a>
        <!-- <a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.file_name_172}}">Download</a> -->
         {{/if}}
        </td>
        
      <td style="text-align:center;">
         {{if $item.file_name_610}}
         <a href="/warranty_and_complete_report.download_content?file_name={{$item.file_name_610}}&module_name=warranty_and_complete_report.home" >Download</a> 
        <!-- <a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.file_name_610}}">Download</a>-->
         {{/if}}
        </td>
        <td>{{$item.tot_log}}</td>
        <td>
        {{if $item.tot_log ge 1}}
        <form name="merge" method="post">
        <input type="hidden" name="project_name" value="{{$item.bsn_address}}" /> 
        <input type= "submit" name="mergeprint" title="Print" value="Print" ></td>
        </form>
        {{/if}}
        <td style="text-align:center;" {{if !$item.bcust_wcr_q1_report1}} bgcolor="#FF0000" {{/if}}>
        <form name="report1" method="post" enctype="multipart/form-data"> 
        <input type="hidden" name="bcust_id" value="{{$item.bcust_id}}"  />
        <input type="file" name="q1_report" /><br />
        {{if $item.bcust_wcr_q1_report1}}
        <div style="text-align:center;"> 
        <!--<a href="https://deckquote.s3.amazonaws.com/files/uploads/{{$item.bcust_wcr_q1_report1}}" target="_blank">Download</a>-->
         <a href="/warranty_and_complete_report.download_content_up?file_name={{$item.bcust_wcr_q1_report1}}&module_name=warranty_and_complete_report.home" >Download</a>
        </div> {{/if}}
       <input type= "submit" name="savedata_1" title="Save" value="Upload" class="set2"> &nbsp; 
        </form>
        </td>
        <td style="text-align:center;" {{if !$item.bcust_wcr_q1_report_final}} bgcolor="#FF0000" {{/if}}>
        <form name="report2" method="post" enctype="multipart/form-data"> 
        <input type="hidden" name="bcust_id" value="{{$item.bcust_id}}"  />
        <input type="file" name="q1_final" /><br />
        {{if $item.bcust_wcr_q1_report_final}}
        <div style="text-align:center;"> 
        <!--<a href="https://deckquote.s3.amazonaws.com/files/uploads/{{$item.bcust_wcr_q1_report_final}}" target="_blank">Download</a>-->
        <a href="/warranty_and_complete_report.download_content_up?file_name={{$item.bcust_wcr_q1_report_final}}&module_name=warranty_and_complete_report.home" >Download</a>
        </div> {{/if}}
       <input type= "submit" name="savedata_2" title="Save" value="Upload" class="set2"> &nbsp; 
        </form>
        </td>
        <td style="text-align:center;"><a href = "{{$item.link2}}" target="blank">Link</a></td>
    
      </tr>
      {{assign var=countn value=$countn-1}}
      {{/foreach}}
      </tbody>
      
 
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