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

function add_procedure()
{
	var viewurl = "{{$BASE_URL}}quality_assurance_report.view_procedure"+ "/random/" + Math.random();	

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
.tooltip {
    position: relative;
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
    position: absolute;
    z-index: 1;
}

.tooltip:hover .tooltiptext {
    visibility: visible;
}

#fancybox-wrap {z-index:9999999;} 
</style>

<h3 class="page-title">{{$title}}</h3>
<br />
<div style="float:left">
&nbsp; &nbsp; <input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> 
</div>
<div style="float:right">
<form name="mlist" method="post">
<input type="submit" value="Show Hidden" name="unhide"  />
</form>
</div>
<div style="float:left; width:100%;">
  <table id="doclist-table" class="nav-back" width="100%">
    <thead>
      <tr>
        <th class="topmenu" align="center" valign="middle" width="3%">SrNo</th>
        <th class="topmenu" align="center" valign="middle" width="15%">Address</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Status</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Day Count</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Link</th>
       
        <th class="topmenu" align="center" valign="middle" width="3%">Wall and Roof Frames Inspection Report</th>
        
        <th class="topmenu" align="center" valign="middle" width="3%">Pre-sheet Inspection Report</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Pre-paint Inspection Report</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Pre-walkthrough Inspection Report</th>
        
  	<th class="topmenu" align="center" valign="middle" width="3%">Floor System</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Wall and Roof</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Cloose Up</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Fixing</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Painting</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Completion Audit Report </th>
        <th class="topmenu" align="center" valign="middle" width="3%">Hide From Report</th>
       
      </tr>
    {{if $list}}
    <tbody>
    <form name="mlist" method="post" enctype="multipart/form-data">
      <!--{{assign var=countn value= $numstartvounter}}-->
       {{assign var=countn value= $total}}
      
      {{foreach from=$list key="key" item="item"}}
      <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
        <td>{{$countn}}</td>
        <td>{{$item.bsn_address}}</td>
        <td>Construction</td>
        <td>{{$item.dayscount}}</td>
        <td style="text-align:center;"><a href = "{{$item.link}}" target="blank">Link</a></td>
       
       
        {{if $item.bsn_qar_wall_roof }}
        <td>
	{{else}}
        <td style="background:#F00">
        {{/if}}
        
        <form name="ps" method="post" enctype="multipart/form-data"> 
        <input type="hidden" name="bsn_id" value="{{$item.bsn_id}}"  />
        <input type="file" name="wall_roof" /><br />
        {{if $item.bsn_qar_wall_roof }}
        <div style="text-align:center;"> 
         <a href="/quality_assurance_report.download_content?file_name={{$item.bsn_qar_wall_roof}}&module_name=quality_assurance_report.home" >Download</a>
      <!--  <a href="https://deckquote.s3.amazonaws.com/files/uploads/{{$item.bsn_qar_wall_roof }}" target="_blank">Download</a> -->
        {{$item.bsn_qar_wall_roof_date}}
        <a href="{{$BASE_URL}}quality_assurance_report.delete_wr/bsn_id/{{$item.bsn_id}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img src="{{$BASE_URL}}/images/delete_icon.png" width="20" /></a>
       </div> {{/if}}
        <input type= "submit" name="savedata_wr" title="Save" value="Upload" class="set2"> &nbsp; 
        </form>
        </td>
        
        
        
        {{if $item.bsn_qar_pre_sheet}}
        <td>
	{{else}}
        <td style="background:#F00">
        {{/if}}
        
        <form name="ps" method="post" enctype="multipart/form-data"> 
        <input type="hidden" name="bsn_id" value="{{$item.bsn_id}}"  />
        <input type="file" name="pre_sheet" /><br />
        {{if $item.bsn_qar_pre_sheet}}
        <div style="text-align:center;"> 
         <a href="/quality_assurance_report.download_content?file_name={{$item.bsn_qar_pre_sheet}}&module_name=quality_assurance_report.home" >Download</a>
      <!--  <a href="https://deckquote.s3.amazonaws.com/files/uploads/{{$item.bsn_qar_pre_sheet}}" target="_blank">Download</a> -->
        {{$item.bsn_qar_pre_sheet_date}}
        <a href="{{$BASE_URL}}quality_assurance_report.delete_s/bsn_id/{{$item.bsn_id}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img src="{{$BASE_URL}}/images/delete_icon.png" width="20" /></a>
       </div> {{/if}}
        <input type= "submit" name="savedata_ps" title="Save" value="Upload" class="set2"> &nbsp; 
        </form>
        </td>
      
       {{if $item.bsn_qar_fix_insp}}
        <td>
	{{else}}
        <td style="background:#F00">
        {{/if}}
        
        <form name="ps" method="post" enctype="multipart/form-data"> 
        <input type="hidden" name="bsn_id" value="{{$item.bsn_id}}"  />
        <input type="file" name="fix_insp" /><br />
        {{if $item.bsn_qar_fix_insp}}
        <div style="text-align:center;"> 
        <a href="/quality_assurance_report.download_content?file_name={{$item.bsn_qar_fix_insp}}&module_name=quality_assurance_report.home" >Download</a>
       <!-- <a href="https://deckquote.s3.amazonaws.com/files/uploads/{{$item.bsn_qar_fix_insp}}" target="_blank">Download</a> -->
        {{$item.bsn_qar_fix_insp_date}}
        <a href="{{$BASE_URL}}quality_assurance_report.delete_f/bsn_id/{{$item.bsn_id}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img src="{{$BASE_URL}}/images/delete_icon.png" width="20" /></a>
       </div> {{/if}}
        <input type= "submit" name="savedata_fi" title="Save" value="Upload" class="set2"> &nbsp; 
        </form>
        </td>
      
        
        {{if $item.bsn_qar_pre_walk}}
        <td>
	{{else}}
        <td style="background:#F00">
        {{/if}}
        <form name="pw" method="post" enctype="multipart/form-data"> 
        <input type="hidden" name="bsn_id" value="{{$item.bsn_id}}"  />
        <input type="file" name="pre_walk" /><br />
        {{if $item.bsn_qar_pre_walk}}
        <div style="text-align:center;"> 
        <a href="/quality_assurance_report.download_content?file_name={{$item.bsn_qar_pre_walk}}&module_name=quality_assurance_report.home" >Download</a>
      <!--  <a href="https://deckquote.s3.amazonaws.com/files/uploads/{{$item.bsn_qar_pre_walk}}" target="_blank">Download</a> -->
        {{$item.bsn_qar_pre_walk_date}}
        <a href="{{$BASE_URL}}quality_assurance_report.delete_w/bsn_id/{{$item.bsn_id}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img src="{{$BASE_URL}}/images/delete_icon.png" width="20" /></a>
   
        </div> {{/if}}
        <input type= "submit" name="savedata_pw" title="Save" value="Upload" class="set2"> &nbsp; 
        </form>
        </td>
        
        {{if $item.floor_system}}
        <td>
             <a href="/quality_assurance_report.download_content?file_name={{$item.floor_system}}&module_name=progress_payment_doc" >Download</a>
           <!-- <a href="https://deckquote.s3.amazonaws.com/files/progress_payment_doc/{{$item.floor_system}}" target="_blank">Download</a> --> </td>
        {{else}}
        <td style="background:#F00"></td>
        {{/if}}
        
        {{if $item.wall_roof}}
        <td>
             <a href="/quality_assurance_report.download_content?file_name={{$item.wall_roof}}&module_name=progress_payment_doc" >Download</a>
           <!-- <a href="https://deckquote.s3.amazonaws.com/files/progress_payment_doc/{{$item.wall_roof}}" target="_blank">Download</a> --> </td>
        {{else}}
        <td style="background:#F00"></td>
        {{/if}}
        
        {{if $item.close_up}}
        <td>
             <a href="/quality_assurance_report.download_content?file_name={{$item.close_up}}&module_name=progress_payment_doc" >Download</a>
            <!--<a href="https://deckquote.s3.amazonaws.com/files/progress_payment_doc/{{$item.close_up}}" target="_blank">Download</a>  --> </td>
        {{else}}
        <td style="background:#F00"></td>
        {{/if}}
        
        
        {{if $item.fixing}}
        <td>
            <a href="/quality_assurance_report.download_content?file_name={{$item.fixing}}&module_name=progress_payment_doc" >Download</a>
          <!--  <a href="https://deckquote.s3.amazonaws.com/files/progress_payment_doc/{{$item.fixing}}" target="_blank">Download </a> --> </td> 
        {{else}}
        <td style="background:#F00"></td>
        {{/if}}
        
        {{if $item.painting}}
        <td>
            <a href="/quality_assurance_report.download_content?file_name={{$item.painting}}&module_name=progress_payment_doc" >Download</a>
         <!--   <a href="https://deckquote.s3.amazonaws.com/files/progress_payment_doc/{{$item.painting}}" target="_blank">Download </a> --> </td> 
        {{else}}
        <td style="background:#F00"></td>
        {{/if}}
        
<!--        {{if $item.project}}
        <td><a href="{{$BASE_URL}}files/progress_payment_doc/{{$item.project}}" target="_blank">Download</td>
        {{else}}
        <td style="background:#F00"></td>
        {{/if}}-->
        
        {{if $item.bsn_qar_com_aud}}
        <td>
	{{else}}
        <td style="background:#F00">
        {{/if}}
        
        <form name="ca" method="post" enctype="multipart/form-data"> 
        <input type="hidden" name="bsn_id" value="{{$item.bsn_id}}"  />
        <input type="file" name="ca_report" /><br />
        {{if $item.bsn_qar_com_aud}}
        <div style="text-align:center;">
             <a href="/quality_assurance_report.download_content?file_name={{$item.bsn_qar_com_aud}}&module_name=quality_assurance_report.home" >Download</a>
            <!-- <a href="https://deckquote.s3.amazonaws.com/files/uploads/{{$item.bsn_qar_com_aud}}" target="_blank">Download</a> -->
        {{$item.bsn_qar_com_aud_date}}
        <a href="{{$BASE_URL}}quality_assurance_report.delete_c/bsn_id/{{$item.bsn_id}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img src="{{$BASE_URL}}/images/delete_icon.png" width="20" /></a>
       </div> {{/if}}
        <input type= "submit" name="savedata_car" title="Save" value="Upload" class="set2"> &nbsp; 
        </form>
        
        </td> 
        
        <td>
        
        <form name ="recmet" method="post" action="">
        <input type="hidden" name="hide[{{$item.bsn_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="hide[{{$item.bsn_id}}]" value="1"  onclick="this.form.submit();" {{if $item.bsn_qar_hide eq 1 }} checked="checked" {{/if}} />
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
  <table id="doclist-table"  width="100%" bgcolor="#d3e8d6">
    <thead>
  
      <tr>
        <td colspan="2">&nbsp;</td>
      </tr>
    </thead>
  </table>
</div>