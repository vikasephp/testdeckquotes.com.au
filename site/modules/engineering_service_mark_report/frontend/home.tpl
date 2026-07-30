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
	var viewurl = "{{$BASE_URL}}engineering_service_mark_report.view_procedure"+ "/random/" + Math.random();	

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

function add_person_responsible()
{
	var viewurl = "{{$BASE_URL}}engineering_service_mark_report.view_person_responsible"+ "/random/" + Math.random();	

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

.tableFixHead          { overflow-y: auto; height: 100px; }
.tableFixHead thead th { position: sticky; top: 0; text-align:left; }

table  { border-collapse: collapse; width: 100%; }

th     { z-index:9999; }
#fancybox-wrap {z-index:9999999;} 

</style>

<h3 class="page-title">{{$title}}</h3>
<br />

<form name="mlist" method="post">
<div style="float:left; text-align:left;"> 
&nbsp; &nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> 
&nbsp; &nbsp;<input type="button" name="response" value="Person Responsible Admin"  onclick="javascript:add_person_responsible();" />
<br />
&nbsp; &nbsp; <strong>Project Search:</strong>&nbsp;&nbsp;
<input type="text" name="searchkey" value="{{$searchkey}}" style="width:400px;" placeholder="Enter Project Address"/>
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" value="Search" name="searchaddr"  />
<input type="submit" value="Clear Search" name="clear"  /> 
<br />
&nbsp; &nbsp; <strong>Status Search:</strong>&nbsp;&nbsp;
<select name="status_search">
<option value="">Please Select</option>
<option value="|3|">Construction</option>
<option value="|2|">Planning</option>
</select>
<input type="submit" value="Search" name="stsearch"  />
<input type="submit" value="Clear Search" name="clear"  /> 

</div>

<div style="float:right;"> 
<input type="submit" name="hidden" value ="Show Hidden" />
</div>

</form>
<div style="float:left; width:100%;">
  <table id="doclist-table" class="nav-back tableFixHead" width="100%">
    <thead>
      <tr>
        <th class="topmenu" align="center" valign="middle" width="3%">SrNo</th>
        <th class="topmenu" align="center" valign="middle" width="16%">Address</th>
        <th class="topmenu" align="center" valign="middle" width="6%">Status</th>
        <th class="topmenu" align="center" valign="middle" width="8%">Engineering Request Sent </th>
        <th class="topmenu" align="center" valign="middle" width="8%">Engineering Received </th>
        <th class="topmenu" align="center" valign="middle" width="5%">Engineers Design </th>
        <th class="topmenu" align="center" valign="middle" width="5%">Engineers Site Classification </th>
        <th class="topmenu" align="center" valign="middle" width="7%">Engineering Amendment </th>
        <th class="topmenu" align="center" valign="middle" width="7%">Person Responsible</th>
        
        <th class="topmenu" align="center" valign="middle" width="12%">Notes</th>
        <th class="topmenu" align="center" valign="middle" width="3%">Construction Alerts</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Electrical Utility Provider Service Mark </th>
        <th class="topmenu" align="center" valign="middle" width="8%">Service Mark Sent to Electrician </th>
        <th class="topmenu" align="center" valign="middle" width="6%">Hide</th>
        
        
      </tr>
    {{if $list}}
    <tbody>
    <form name="mlist" method="post">
      {{assign var=countn value= $numstartvounter}}
      {{foreach from=$list key="key" item="item"}}
      <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
        <td> {{$countn}} </td>
        
        <td><a href="{{$item.link}}" target="_blank">{{$item.bsn_address}}</a></td>
        
        <td style="text-align:center;" >{{$item.status}}</td>
        
        {{if $item.uid577nr eq 1 }}
        	<td style="text-align:center;" >Not Required</td>
        {{elseif  $item.uid577complete eq 1}}
            <td style="background:#060; color:#FFF;">{{$item.uid577date}}</td>
        {{else}}
            <td style="background:#F00"></td>    
        {{/if}}
        
        {{if $item.uid701nr eq 1 }}
        	<td style="text-align:center;" >Not Required</td>
        {{elseif  $item.uid701complete eq 1}}
            <td style="background:#060; color:#FFF;">{{$item.uid701date}}</td>
        {{else}}
            <td style="background:#F00"></td>    
        {{/if}}
        
        <td {{if $item.doc_file_name_116}} style="background:#060;color:#FFF;" {{/if}} >
        {{if $item.doc_file_name_116}}
 <!--  <a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name_116}}" target="_blank" style="color:#FFF;">Download</a>-->
 <a href="/engineering_service_mark_report.download_content?file_name={{$item.doc_file_name_116}}&module_name=engineering_service_mark_report.home" target="_blank" style="color:#FFF;">Download</a>
   
       {{/if}}
        </td>
        
        <td {{if $item.doc_file_name_117}} style="background:#060;color:#FFF;" {{/if}} >
        {{if $item.doc_file_name_117}}
 <!-- <a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name_117}}" target="_blank" style="color:#FFF;">Download</a>-->
  <a href="/engineering_service_mark_report.download_content?file_name={{$item.doc_file_name_117}}&module_name=engineering_service_mark_report.home" target="_blank" style="color:#FFF;">Download</a> 
  
       {{/if}}
        </td>
        
        <td><select name="eam" Onchange = "update_eng_ame({{$item.bsn_id}},this.value)" >
           
            <option value="Not required" {{if $item.bsn_esmr_eng_ame eq 'Not required'}} selected="selected" {{/if}}>Not required</option>
            <option value="Required" {{if $item.bsn_esmr_eng_ame eq 'Required'}} selected="selected" {{/if}}>Required</option>
            <option value="Requested" {{if $item.bsn_esmr_eng_ame eq 'Requested'}} selected="selected" {{/if}}>Requested</option>
            <option value="Amendment complete" {{if $item.bsn_esmr_eng_ame eq 'Amendment complete'}} selected="selected" {{/if}}>Amendment complete</option>
            </select>
            
        <script>
	   
		function update_eng_ame(id,value)
		{
			
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}engineering_service_mark_report.update_eng_ame/bsn_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	    </script>
            
            
        </td>
        
        
        <td><select name="eam" Onchange = "update_person_resp({{$item.bsn_id}},this.value)" >
            <option value="0" {{if $item.bsn_esmr_eng_ame eq '0'}} selected="selected" {{/if}}>Please Select</option>
             {{foreach from=$prdata key="key1" item="item1"}}
              <option value="{{$item1.pr_id}}" {{if $item.bsn_esmr_person_resp  eq $item1.pr_id}} selected="selected" {{/if}}>{{$item1.pr_option}}</option>
             {{/foreach}}
             </select>
            
        <script>
	   
		function update_person_resp(id,value)
		{
			
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}engineering_service_mark_report.update_person_resp/bsn_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	    </script>
              
        </td>
        
         <td style="text-align:center;" >
         <textarea rows="4" cols="40" id="{{$item.bsn_id}}" style="overflow-y: scroll;">{{$item.bsn_esmr_notes}}</textarea>       
        <script>
	   
	    $(document).ready(function(){
                     $("#{{$item.bsn_id}}").keyup(function(){
                           update_notes({{$item.bsn_id}},this.value);
                     });
             });
	     
		   
	   function update_notes(id,value)
		{
		
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}engineering_service_mark_report.update_notes/bsn_id/"+id+"/value/"+value,
				   success: function(result){
			   }
			 });
		}
	
       </script>
         </td>
		 <td>
         <a href="{{$BASE_URL}}engineering_service_mark_report.view_construction_alert/bsn_id/{{$item.bsn_id}}" class="various">Construction Alert</a>
        </td>

        <td {{if $item.doc_file_name_421}} style="background:#00CC33;" {{elseif $item.bsn_esmr_service_mark eq 1}} 
        style="background:#F00;" {{elseif  $item.bsn_esmr_service_mark eq 2}} style="background:#999;" {{/if}}  id = "ele{{$item.bsn_id}}">
     
        {{if $item.doc_file_name_421}}
   <!--<a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name_421}}" target="_blank" style="color:#FFF">Download</a>-->
    <a href="/engineering_service_mark_report.download_content?file_name={{$item.doc_file_name_421}}&module_name=engineering_service_mark_report.home" target="_blank" style="color:#FFF;">Download</a> 
   
        {{else}} 
         
        <select name="ele_mark[{{$item.bsn_id}}]" onChange="update_elect_mark({{$item.bsn_id}}, this.value)">
        <option value="0" {{if $item.bsn_esmr_service_mark  eq 0 }} selected="selected" {{/if}}>Not Selected</option>
        <option value="1" {{if $item.bsn_esmr_service_mark  eq 1 }} selected="selected" {{/if}}>Required</option>
        <option value="2" {{if $item.bsn_esmr_service_mark  eq 2 }} selected="selected" {{/if}}>Not Required</option>
        </select>
        <script>
		
		function update_elect_mark(id,value)
		{
			var ele = '#ele'+id;
			
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}engineering_service_mark_report.update_elect_mark/bsn_id/"+id+"/value/"+value,
					   success: function(result){
						
						if(value == 1 ) {
							$(ele).css("background","#F00");
						} else if(value == 2 ){
							$(ele).css("background","#999"); 
						}  else {
							$(ele).css("background","#FFF"); 
						}
					}
					
				});
		}
	   </script>
       
         {{/if}}
         
         </td>

 
        {{if $item.uid658nr eq 1 }}
        	<td style="text-align:center; background:#CCC;" >Not Required</td>
        {{elseif  $item.uid658complete eq 1}}
            <td style="background:#060; color:#FFF;">{{$item.uid658date}}</td>
        {{else}}
            <td style="background:#F00"></td>    
        {{/if}}
          
         <td>
         <form name ="recmet3" method="post" action="">
     	<input type="hidden" name="hide[{{$item.bsn_id}}]" value="0" />
  	<label class="switch">
<input class="switch-input" type="checkbox"  name="hide[{{$item.bsn_id}}]" value="1"  onclick="this.form.submit();" {{if $item.bsn_esmr_hide eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
       </label> 
       </form>  
         
         </td>
        
      </tr>
      {{assign var=countn value=$countn+1}}
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