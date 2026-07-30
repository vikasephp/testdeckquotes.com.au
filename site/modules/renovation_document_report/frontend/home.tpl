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


function close_win()
	{
	$.fancybox.close();
	window.location.reload();
	}
</script>


<script type="text/javascript" > 
function addfeedback(bsn_id)
{
	var viewurl = "{{$BASE_URL}}renovation_report.addfeedback"+ "/bsn_id/" + bsn_id;	
	
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
	var viewurl = "{{$BASE_URL}}renovation_report.viewfeedback"+ "/bsn_id/" + bsn_id;	
	
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
	var viewurl = "{{$BASE_URL}}renovation_document_report.view_procedure"+ "/random/" + Math.random();	

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

#fancybox-wrap {z-index:9999999;}
.wrapper1, .wrapper2{width: 100%; border: none 0px RED;
overflow-x: scroll; overflow-y:hidden; scrollbar-color: yellow blue;}
.wrapper1{height: 20px; }
.wrapper2{ }
.div1 {width:1680px; height: 20px; }
.div2 {width:1680px;  overflow: auto;}  
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

</style>

<h3 class="page-title">{{$title}}</h3>
<br />

<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
<div style="float:left; text-align:left;"> 
&nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" />  <br />
&nbsp; &nbsp; <strong>Search:</strong>&nbsp;&nbsp;
<input type="text" name="searchkey" value="{{$searchkey}}" style="width:300px;" placeholder="Enter Address"/>
&nbsp;&nbsp;
<input type="submit" value="Search" name="searchaddr"  />
<input type="submit" value="Clear Search" name="clear"  /> 
</div>

<div style="float:right;">
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
        <th class="topmenu" align="center" valign="middle" width="12%">Customer Detail</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Contacts</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Link</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Relevant Checklist Numbers</th>   
        <th class="topmenu" align="center" valign="middle" width="5%">Days Active</th> 
        <th class="topmenu" align="center" valign="middle" width="5%">Signed Design Agreement</th> 
        <th class="topmenu" align="center" valign="middle" width="5%">Web Survey</th> 
        <th class="topmenu" align="center" valign="middle" width="8%">Customer Survey</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Introduction Letter</th> 
        <th class="topmenu" align="center" valign="middle" width="8%">Inspection Manager Report</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Initial Sketches</th>
        <th class="topmenu" align="center" valign="middle" width="8%">3D Scan Video</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Measurements and Quantities</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Renovation Operation Calculator</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Renovation Estimation Report PDF</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Hide From Report</th>
        

      </tr>
    {{if $list}}
    <tbody>
    <form name="mlist" method="post">
      <!--{{assign var=countn value= $numstartvounter}}-->
       {{assign var=countn value= $total}}
      
      {{foreach from=$list key="key" item="item"}}
      <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
        <td> {{$countn}} </td>
        <td><strong>{{$item.bcust_fname}} &nbsp; {{$item.bcust_lname}}</strong> <br />
        {{$item.bsn_address}}</td>
        <td> 
        <a href="{{$BASE_URL}}js/vcard/index.php?fname={{$item.bcust_fname}}&lname={{$item.bcust_lname}}&email1={{$item.bcust_misc_email1}}&email2={{$item.bcust_misc_email2}}&mobile={{$item.bcust_misc_moble}}&business={{$item.bcust_misc_business}}&home={{$item.bcust_misc_home}}" class="action_new" title="Download Vcard"><img style="height: 17px; width:22px" src="{{$BASE_URL}}images/vcard.png"/></a> </td>
      </td>
        <td style="text-align:center;" ><a href = "{{$item.link}}" target="blank">Link</a></td>
       
        <td style="text-align:center;" >{{$item.dpn_unique_id}}</td>
        <td>{{$item.dayscount}} </td>
        <td> 
        <form name = "ppd" method="post" action="">
        <input type="text" name="sda[{{$item.dpn_unique_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo3_{{$item.dpn_unique_id}}" value="{{$item.dpn_rdr_sda_date}}"  /> 
        <input type="submit" value="Set" name="sda_date" class="set" />
        </form>
       </td>
       <td>{{if $item.doc10}}
       <!--<a href ="{{$BASE_URL}}files/document_check_list_files/{{$item.doc10}}">-->
       <a href="/renovation_document_report.download_content?file_name={{$item.doc10}}&module_name=renovation_document_report.home"  target="_blank">
       Link</a><br />{{$item.date10}}{{/if}}</td>
           
        <td>{{if $item.doc18}}
        <!--<a href ="{{$BASE_URL}}files/document_check_list_files/{{$item.doc18}}">-->
        <a href="/renovation_document_report.download_content?file_name={{$item.doc18}}&module_name=renovation_document_report.home"  target="_blank">
        Link</a>
        
        <br />{{$item.date18}}{{/if}}</td>
        <td>{{if $item.doc19}}
       <!-- <a href ="{{$BASE_URL}}files/document_check_list_files/{{$item.doc19}}">-->
        <a href="/renovation_document_report.download_content?file_name={{$item.doc19}}&module_name=renovation_document_report.home"  target="_blank">
        Link</a><br />{{$item.date19}}{{/if}} </td>
        
        <td>{{if $item.doc9}}
        <!--<a href ="{{$BASE_URL}}files/document_check_list_files/{{$item.doc9}}">-->
         <a href="/renovation_document_report.download_content?file_name={{$item.doc9}}&module_name=renovation_document_report.home"  target="_blank">
        Link</a><br />{{$item.date9}}{{/if}}</td>
        
       <td>{{if $item.doc2}}
   <!--    <a href ="{{$BASE_URL}}files/document_check_list_files/{{$item.doc2}}">-->
        <a href="/renovation_document_report.download_content?file_name={{$item.doc2}}&module_name=renovation_document_report.home"  target="_blank">
       Link</a><br />{{$item.date2}}{{/if}}</td>
       
       <td>{{if $item.doc12}}
      <!-- <a href ="{{$BASE_URL}}files/document_check_list_files/{{$item.doc12}}">-->
        <a href="/renovation_document_report.download_content?file_name={{$item.doc12}}&module_name=renovation_document_report.home"  target="_blank">
       Link</a><br />{{$item.date12}}{{/if}}</td>
       
       <td>{{if $item.doc13}}
   <!--    <a href ="{{$BASE_URL}}files/document_check_list_files/{{$item.doc13}}">-->
        <a href="/renovation_document_report.download_content?file_name={{$item.doc13}}&module_name=renovation_document_report.home"  target="_blank">
       Link</a><br />{{$item.date13}}{{/if}}</td>
       
      
      <td>{{if $item.doc24}}
     <!-- <a href ="{{$BASE_URL}}files/document_check_list_files/{{$item.doc24}}">-->
       <a href="/renovation_document_report.download_content?file_name={{$item.doc24}}&module_name=renovation_document_report.home"  target="_blank">
      Link</a><br />{{$item.date24}}{{/if}}</td>
      
      <td>{{if $item.doc21}}
     <!-- <a href ="{{$BASE_URL}}files/document_check_list_files/{{$item.doc21}}">-->
       <a href="/renovation_document_report.download_content?file_name={{$item.doc21}}&module_name=renovation_document_report.home"  target="_blank">
      Link</a><br />{{$item.date21}}{{/if}}</td>
     <td>
        <form name ="recmet" method="post" action="">
        <input type="hidden" name="hide[{{$item.dpn_unique_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="hide[{{$item.dpn_unique_id}}]" value="1"  onclick="this.form.submit();" {{if $item.dpn_rdr_hide eq 1 }} checked="checked" {{/if}} />
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