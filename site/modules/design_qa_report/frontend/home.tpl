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


function add_procedure()
{
	var viewurl = "{{$BASE_URL}}design_qa_report.view_procedure"+ "/random/" + Math.random();	

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

.set2 { font-size:10px !important; 
       width:60px !important; display:inline-block; 
	  padding-top:1px !important;
	  padding-bottom: 1px !important;
	  padding-left:1px !important;
	  height:25px !important; }	   
	   
.wrapper1, .wrapper2{width:100%; border: none 0px RED;
overflow-x: scroll; overflow-y:hidden; scrollbar-color: yellow blue;}
.wrapper1{height: 20px; }
.wrapper2{ }
.div1 {width:2550px; height: 20px; }
.div2 {width:2550px;  overflow: auto;}   

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

<h3 class="page-title">Design QA Report </h3>
<br />

<form name="sort" method="post">

<div style="float:left; text-align:left;">

&nbsp;&nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> <br />
 &nbsp; &nbsp; <strong>Search:</strong>&nbsp;&nbsp;
<input type="text" name="searchkey" value="{{$searchkey}}" style="width:400px;" placeholder="Search Address OR First Name Or Last Name"/>
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" value="Search" name="searchaddr"  />
<input type="submit" value="Clear Search" name="clear"  /> 

<input type="submit" value="Sort By Designer" name="sortbydesigner"  /> 

</div>
</form>


<div style="float:right;"> 

<input type="button" value="Export To XLS" onclick="document.location.href='{{$BASE_URL}}design_qa_report.home/export/1'" /> &nbsp;

</div> &nbsp; &nbsp;
<div class="wrapper1">
    <div class="div1">
    </div>
</div>

<div class="wrapper2">
    <div class="div2 tableFixHead" >
  <table id="doclist-table" class="nav-back" width="100%">
    <thead>
      <tr>

         <th class="topmenu" align="center" valign="middle" width="11%">Customer Details</th>
         <th class="topmenu" align="center" valign="middle" width="3%">Link</th>
         <th class="topmenu" align="center" valign="middle" width="5%">Relevant Checklist Numbers</th>
         <th class="topmenu" align="center" valign="middle" width="7%">Designer</th>
         <th class="topmenu" align="center" valign="middle" width="7%">Overseas Architect</th>
         <th class="topmenu" align="center" valign="middle" width="4%">Latest <br />Mrged Plans</th>
         <th class="topmenu" align="center" valign="middle" width="7%">Customer Designer QA sign off</th>
         <th class="topmenu" align="center" valign="middle" width="7%">Construction 1st Review </th>
         <th class="topmenu" align="center" valign="middle" width="5%">Where Are We At</th>
         <th class="topmenu" align="center" valign="middle" width="7%">Have you checked the customer will buy it and can afford it? (Sales)</th>
         <th class="topmenu" align="center" valign="middle" width="7%">Have you check we can legally build it? (Planning)</th>
         <th class="topmenu" align="center" valign="middle" width="7%">Have you checked we can practically build it? (Construction)</th>
    	 
       
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
       <td> <a href = "{{$item.link}}" target="blank">Link</a></td>     
       <td>{{$item.chknoData}}</td>
       <td> {{$item.designer}}</td> 
       <td>{{$item.osarchi}} </td>

       
       <td> 
       {{if $item.lmpData}}
        {{foreach from=$item.lmpData key="key3" item="item3"}}
        {{if $item3.doc_file_name}}
             {{if $item.chknoData eq $item3.dpn_unique_id }}
        <!-- <a href = "https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item3.doc_file_name}}" target="_blank">-->
         <a href="/design_qa_report.download_content?file_name={{$item3.doc_file_name}}&module_name=design_qa_report.home"  target="_blank">
         
         Download-{{$item3.dpn_unique_id}}</a>
         {{/if}}
         <br>
      {{/if}} 
       {{/foreach}}
       {{/if}}       
       
       </td>
    
        {{if $item.qaData}}
        <td> 
        {{else}}
        <td style="background:#F00">
        {{/if}}
          
         {{if $item.qaData}}
                {{foreach from=$item.qaData key="key4" item="item4"}}
                {{if $item4.doc_file_name}}
                {{if $item.chknoData eq $item4.dpn_unique_id }}
               <!--  <a href = "https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item4.doc_file_name}}" target="_blank">-->
                 <a href="/design_qa_report.download_content?file_name={{$item4.doc_file_name}}&module_name=design_qa_report.home"  target="_blank">                 Download-{{$item4.dpn_unique_id}}</a>
                 {{/if}}
                 <br>
                {{/if}} 
               {{/foreach}}
       {{/if}}   
        
        </td>
               
        <td>
        <form name="mlist123" method="post" enctype="multipart/form-data"> 
        <input type="hidden" name="chkno" value="{{$item.chknoData}}"  />
       <input type="file" name="first_review" /><br />
        {{if $item.dpn_qarep_const_1_review}}
        <div style="text-align:center;"> 
     <!--   <a href="{{$BASE_URL}}files/cma/{{$item.dpn_qarep_const_1_review}}" target="_blank">Download</a>-->
       
 <a href="/design_qa_report.download_content_wl?file_name={{$item.dpn_qarep_const_1_review}}&module_name=design_qa_report.home" target="_blank"/>Download</a>
        
        
        </div> {{/if}}
       <input type= "submit" name="savedata" title="Save" value="Upload" class="set2"> &nbsp; 
        </form>
        
         </td>
         
          <td>
                       
        <textarea rows="4" cols="40" class="tinymce2" id="{{$item.chknoData|ltrim:'0'}}" style="overflow-y: scroll;">{{$item.dpn_dr_wherewe}}</textarea>       
  <!-- <input type="text" name="whereare[{{$item.chknoData}}]" value="{{$item.dpn_dr_wherewe}}" onkeyup = "update_where_are({{$item.chknoData|ltrim:'0'}},this.value)"/>
-->    
       <script>
	   
	    $(document).ready(function(){
                     $("#{{$item.chknoData|ltrim:'0'}}").keyup(function(){
                           update_where_we_are({{$item.chknoData|ltrim:'0'}},this.value);
                     });
             });
	     
		   
	   function update_where_we_are(id,value)
		{
		//alert(id);	
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}design_qa_report.update_where_we_are/dpn_unique_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
	
       </script>
         
         </td>
         

       <td>
        <form name ="recmet4" method="post" action="">
     	<input type="hidden" name="will[{{$item.bsn_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="will[{{$item.bsn_id}}]" value="1"  onclick="this.form.submit();" {{if $item.bs_dqr_customer_buy eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form>  
       {{if $item.bs_dqr_customer_buy eq 1}} {{$item.bs_dqr_will_date}}<br />{{$item.bs_dqr_will_user}} {{/if}}
       </td>
       <td>
        <form name ="recmet5" method="post" action="">
     	<input type="hidden" name="legally[{{$item.bsn_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="legally[{{$item.bsn_id}}]" value="1"  onclick="this.form.submit();" {{if $item.bs_dqr_we_legally eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form>  
       {{if $item.bs_dqr_we_legally eq 1}} {{$item.bs_dqr_legally_date}}<br />{{$item.bs_dqr_legally_user}} {{/if}}
       </td>
       <td>
        <form name ="recmet6" method="post" action="">
     	<input type="hidden" name="practically[{{$item.bsn_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="practically[{{$item.bsn_id}}]" value="1"  onclick="this.form.submit();" {{if $item.bs_dqr_we_practically eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form>
       
         {{if $item.bs_dqr_we_practically eq 1}} {{$item.bs_dqr_practically_date}}<br />{{$item.bs_dqr_practically_user}} {{/if}}       
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
  {{/if}} 

</div>
</div>