<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/default.js"></script>

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
	var viewurl = "{{$BASE_URL}}block_assessment_report.view_procedure"+ "/random/" + Math.random();	

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
&nbsp; &nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> <br />
<!--&nbsp; &nbsp; <strong>Search:</strong>&nbsp;&nbsp;
<input type="text" name="searchkey" value="{{$searchkey}}" style="width:400px;" placeholder="Enter address"/>
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" value="Search" name="searchaddr"  />
<input type="submit" value="Clear Search" name="clear"  />--> 
</div>
</form>
<div style="float:left; width:100%;">
  <table id="doclist-table" class="nav-back tableFixHead" width="100%">
    <thead>
      <tr>
        <th class="topmenu" align="center" valign="middle" width="3%">SrNo</th>
        <th class="topmenu" align="center" valign="middle" width="14%">Project Address</th>
        <th class="topmenu" align="center" valign="middle" width="6%">Status</th>
        <th class="topmenu" align="center" valign="middle" width="7%">Crown Lease Doc</th>
        <th class="topmenu" align="center" valign="middle" width="12%">Crown Lease Heading</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Building File Doc </th>
        <th class="topmenu" align="center" valign="middle" width="5%">Building File Text </th>
        
        <th class="topmenu" align="center" valign="middle" width="7%">Building File Approved </th>
        <th class="topmenu" align="center" valign="middle" width="8%">Block Type</th>
         
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
        
        <td>
        {{if $item.doc_file_name_288}}
      <!-- <a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name_288}}" target="_blank" >Download</a>-->
       <a href="/block_assessment_report.download_content?file_name={{$item.doc_file_name_288}}&module_name=block_assessment_report.home" target="_blank" >Download</a>
       
       {{/if}}
        </td>
         
       <td><input type="text" name="lease_head" value="{{$item.bsn_bar_crown_heading}}" style="width:220px;" onkeyup ="update_lease_heading({{$item.bsn_id}},this.value)" />
        <script>
	   
		function update_lease_heading(id,value)
		{
			
		
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}block_assessment_report.update_lease_heading/bsn_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	    </script>
       
       </td>
        
         <td>
        {{if $item.doc_file_name_287}}
      <!-- <a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.doc_file_name_287}}" target="_blank" >Download</a>-->
       <a href="/block_assessment_report.download_content?file_name={{$item.doc_file_name_287}}&module_name=block_assessment_report.home" target="_blank" >Download</a>
       
       {{/if}}
        </td>
        
      
        <td><input type="text" name="l_h" value="{{$item.bsn_bar_building_file}}" style="width:220px;"  onkeyup ="update_building_file({{$item.bsn_id}},this.value)" /></td>
        
        <script>
	   
		function update_building_file(id,value)
		{
			
			
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}block_assessment_report.update_building_file/bsn_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	    </script>
        
        
        
        <td><input type="text" name="ba" value="{{$item.bsn_bar_build_approve}}" style="width:220px;" onkeyup ="update_building_approve({{$item.bsn_id}},this.value)"/></td>
        
        <script>
	   
		function update_building_approve(id,value)
		{
			
			
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}block_assessment_report.update_building_approve/bsn_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	    </script>
        
        
        <td>
        <select name="block_type" Onchange = "update_block_type({{$item.bsn_id}},this.value)" >
           
           <option value="Not Selected" {{if $item.bsn_bar_block_type  eq 'Not Selected'}} selected="selected" {{/if}}>Not Selected</option>
           <option value="RZ1" {{if $item.bsn_bar_block_type  eq 'RZ1'}} selected="selected" {{/if}}>RZ1</option>
           <option value="RZ2" {{if $item.bsn_bar_block_type  eq 'RZ2'}} selected="selected" {{/if}}>RZ2</option>
           <option value="RZ3" {{if $item.bsn_bar_block_type  eq 'RZ3'}} selected="selected" {{/if}}>RZ3</option>
           <option value="RZ4" {{if $item.bsn_bar_block_type  eq 'RZ4'}} selected="selected" {{/if}}>RZ4</option>
           <option value="RZ5" {{if $item.bsn_bar_block_type  eq 'RZ5'}} selected="selected" {{/if}}>RZ5</option>
        </select>
            
        <script>
	   
		function update_block_type(id,value)
		{
			
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}block_assessment_report.update_block_type/bsn_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
	    </script>
            
            
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