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





function close_win()
	{
	$.fancybox.close();
	window.location.reload();
	}
</script>

<script type="text/javascript">
function add_procedure()
{
	var viewurl = "{{$BASE_URL}}complete_report.view_procedure"+ "/random/" + Math.random();	

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
.div1 {width:4190px; height: 20px; }
.div2 {width:4190px;  overflow: auto;}   

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


<h3 class="page-title">{{$title}}</h3>
<br />
<!--<table  width="100%"><tr><td></td><td>
<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
<div style="float:left;">

 </div>
</form>

</td></tr></table>-->
<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
<div style="float:left; text-align:left;">
&nbsp;&nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> <br />
<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Search:</strong>&nbsp;&nbsp;</span>
<input type="text" name="keyword" value="{{$keyword}}" style="width:400px;" placeholder="Search for Address"/>
&nbsp;&nbsp;
<input type="submit" value="Search" name="search"  />
 </div>
 </form>
<form name ="videosave" method="post" action="">
<input type="submit" name="save1"  value="Save Online Comp Package Link" />
<input type="submit" name="save2"  value="Save Video Walkthrough Link" />
<input type="submit" name="save3"  value="Save Testimonial Video" />

<div class="wrapper1">
    <div class="div1">
    </div>
</div>

<div class="wrapper2">
    <div class="div2 tableFixHead" >
  <table id="doclist-table" class="nav-back" width="100%">
    <thead>
      <tr>
        <th class="topmenu" align="center" valign="middle" width="3%">SrNo</th>
        <th class="topmenu" align="center" valign="middle" width="12%">Address</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Link</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Design Number</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Comm Date</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Online Completion Package</th> 
        <th class="topmenu" align="center" valign="middle" width="7%">Physical Completion Package</th> 
        <th class="topmenu" align="center" valign="middle" width="7%">30 Day Letter</th> 
        <th class="topmenu" align="center" valign="middle" width="7%">60 Day Conversation</th> 
        <th class="topmenu" align="center" valign="middle" width="7%">Walkthrough Video</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Video Q/A</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Testimonial Video</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Google Review</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Written Testimonial</th>
        <th class="topmenu" align="center" valign="middle" width="7%">365 Letter</th>
        <th class="topmenu" align="center" valign="middle" width="7%">365 Conversation</th>
        <th class="topmenu" align="center" valign="middle" width="7%">365 Gift </th>
        <th class="topmenu" align="center" valign="middle" width="7%">Cal Project Profit and Loss</th>
        

        
      </tr>
    {{if $list}}
    <tbody>

      <!--{{assign var=countn value= $numstartvounter}}-->
       {{assign var=countn value= $total}}
      
      {{foreach from=$list key="key" item="item"}}
      <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
        <td> {{$countn}} </td>
        <td>{{$item.bsn_address}}</td>
        <td style="text-align:center;" ><a href = "{{$item.link}}" target="blank">Link</a></td>
        <td>
        <input type="text" name="design_no[{{$item.bsn_id}}]" value="{{$item.bs_cr_design_no}}" style="width:100px;" Onchange = "update_design_number({{$item.bs_business_id}},this.value)" />
        <script>
	   
		function update_design_number(id,value)
		{
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}/complete_report.update_design_no/bsn_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	</script>
        
        
         </td>
        <td>
         <form name = "pbd" method="post" action="">
        <input type="text" name="bs_cr_comm_date[{{$item.bsn_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo2_{{$item.bs_business_id}}" value="{{$item.bs_cr_comm_date}}"  /> 
       <input type="submit" value="Set" name="hia" class="set" />
       </form> 
        
        
        </td>
        <td><input type="text" name="onlinepackage[{{$item.bsn_id}}]" value="{{$item.bs_comp_compl_pkg}}" style="width:300px;" /></td>
        
        <td><input type="text" name="physicalpackage[{{$item.bsn_id}}]" value="{{$item.bs_comp_phy_pkg}}" style="width:200px;" Onchange = "update_phy_package({{$item.bs_business_id}},this.value)" />
        <script>
	   
		function update_phy_package(id,value)
		{
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}/complete_report.update_physical_package/bsn_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	</script>
        
        
        </td>
        
        <td> <form name="upload" method="post" enctype="multipart/form-data"> 
        <input type="hidden" name="bs_business_id" value="{{$item.bs_business_id}}"  />
       <input type="file" name="upload_letter" /><br />
        {{if $item.bs_comm_30day_letter}}
        <div style="text-align:center;"> 
        
       <a href="/complete_report.download_content?file_name={{$item.bs_comm_30day_letter}}&module_name=complete_report.home" target="_blank"/>Download</a>
        </div> {{/if}}
       <input type= "submit" name="uploadletter" title="Save" value="Upload" class="set2"> &nbsp; 
        </form>
        </td>
        <td>
        <input type="text" name="sixty_day[{{$item.bsn_id}}]" value="{{$item.bs_comm_60day_letter}}" style="width:200px;" Onchange = "update_60_day({{$item.bs_business_id}},this.value)" />
        <script>
	   
		function update_60_day(id,value)
		{
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}/complete_report.update_60day_letter/bsn_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	</script>
        
        </td>
        
        <td>
        
        <input type="text" name="video[{{$item.bsn_id}}]" value="{{$item.bc_ptt_letter}}" style="width:300px;"  />
        </form>
      
        </td>
        
        <td> 
        <select name="video_qa[{{$item.bsn_id}}]" Onchange = "update_video_qa({{$item.bsn_id}},this.value)" >
       <option value="No video" {{if $item.bs_cr_video_qa eq 'No video'}} selected="selected" {{/if}}> No video </option>
       <option value="Video filmed and needs editing" {{if $item.bs_cr_video_qa eq 'Video filmed and needs editing'}} selected="selected" {{/if}}> Video filmed and needs editing </option>
       <option value="Video edited needs uploading" {{if $item.bs_cr_video_qa eq 'Video edited needs uploading'}} selected="selected" {{/if}}> Video edited needs uploading </option>
       <option value="Video edited needs replacing" {{if $item.bs_cr_video_qa eq 'Video edited needs replacing'}} selected="selected" {{/if}}> Video edited needs replacing </option>
       <option value="All good 100" {{if $item.bs_cr_video_qa eq 'All good 100'}} selected="selected" {{/if}}>All good 100% </option>
      </select>
       
       <script>
	   
        function update_video_qa(id,value)
		{
		
		 $.ajax({
					   type: "GET",
					   url: "{{$BASE_URL}}/complete_report.update_video_qa/bsn_id/"+id+"/value/"+value,
						   success: function(result){
					   }
					 });
		
		}
	
       </script>
      
        
        </td>
        <td>
        <input type="text" name="testimonialvideo[{{$item.bsn_id}}]" value="{{$item.bs_testimonial_video}}" style="width:300px;" />
        </form>
      
        
        </td>
        <td style="text-align:center;">
       <!-- {{if $item.bc_cr_wt_yn eq 1}}
        {{$item.bc_cr_wt_yn_date}}
        {{/if}}
        <form name ="recmet" method="post" action="">
        <input type="hidden" name="written[{{$item.bs_business_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="written[{{$item.bs_business_id}}]" value="1"  onclick="this.form.submit();" {{if $item.bc_cr_wt_yn eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
        </label>
    	</form> -->
        
        <input type="text" name="google[{{$item.bsn_id}}]" value="{{$item.bs_google_review}}" style="width:200px;" Onchange = "update_google_review({{$item.bs_business_id}},this.value)" />
        <script>
	   
		function update_google_review(id,value)
		{
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}/complete_report.update_google_review/bsn_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	</script>
        
        
        </td>
        <td>
         <input type="text" name="wt[{{$item.bsn_id}}]" value="{{$item.bs_written_testimonial}}" style="width:200px;" Onchange = "update_written_testimonial({{$item.bs_business_id}},this.value)" />
        <script>
	   
		function update_written_testimonial(id,value)
		{
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}/complete_report.update_written_testimonial/bsn_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	</script>
        
        </td>
        <td> 
         <input type="text" name="letter365[{{$item.bsn_id}}]" value="{{$item.bs_365_letter}}" style="width:200px;" Onchange = "update_365_letter({{$item.bs_business_id}},this.value)" />
        <script>
	   
		function update_365_letter(id,value)
		{
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}/complete_report.update_365_letter/bsn_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	</script>
        </td>
        <td>
         <input type="text" name="conversation365[{{$item.bsn_id}}]" value="{{$item.bs_365_conversation}}" style="width:200px;" Onchange = "update_365_conversation({{$item.bs_business_id}},this.value)" />
        <script>
	   
		function update_365_conversation(id,value)
		{
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}/complete_report.update_365_conversation/bsn_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	</script>
        </td>
        
        <td>
        <input type="text" name="gift365[{{$item.bsn_id}}]" value="{{$item.bs_365_gift}}" style="width:200px;" Onchange = "update_365_gift({{$item.bs_business_id}},this.value)" />
        <script>
	   
		function update_365_gift(id,value)
		{
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}/complete_report.update_365_gift/bsn_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	</script>
        
        </td>
        
        <td>
        <form name="prlo" method="post" enctype="multipart/form-data"> 
        <input type="hidden" name="bs_business_id" value="{{$item.bs_business_id}}"  />
       <input type="file" name="profit_loss" /><br />
        {{if $item.bs_profit_loss_excel}}
        <div style="text-align:center;"> <a href="{{$BASE_URL}}files/uploads/{{$item.bs_profit_loss_excel}}" target="_blank">Download</a></div> {{/if}}
       <input type= "submit" name="savedata" title="Save" value="Upload" class="set2"> &nbsp; 
        </form>
        
        </td>
        
        
        
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
</div>