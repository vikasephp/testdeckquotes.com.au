<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
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


function show_notes(ssid)
{
	var viewurl = "{{$BASE_URL}}smartsheet_accuracy_report.show-notes-content"+ "/ss_id/" + ssid;	
	
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


function add_accuracy()
 {
 var viewurl = "{{$BASE_URL}}smartsheet_accuracy_report.view_accuracy"+ "/random/" + Math.random();	
 $(document).ready(function () {
        $.fancybox({
				'width': '95%',
				'height': '90%',
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
	var viewurl = "{{$BASE_URL}}smartsheet_accuracy_report.view_procedure"+ "/random/" + Math.random();	

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
#fancybox-wrap {z-index:9999999;}
</style>

<h3 class="page-title">{{$title}}</h3>
<br />
 <form name="acc" method="post" action="">
<div style="float:left; text-align:left;">
&nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> 
&nbsp;<input type="button" name="acc_admin" value="Accuracy Admin" onclick="javascript:add_accuracy();" /> 

&nbsp; &nbsp; &nbsp; &nbsp;<strong> Filter By : </strong> 

 
        <select name="accuracy"/>
        <option value="">Show All</option>
        {{foreach from = $accuracy_data key="key3" item="item3"}}
        <option value="{{$item3.aa_id}}">{{$item3.aa_option}}</option>
        {{/foreach}}
        </select> 
        &nbsp; &nbsp;<input type="submit" value="Filter" name="filter" />       
</div>
  </form> 

<div style="float:left; width:100%;">
  <table id="doclist-table" class="nav-back" width="100%">
    <thead>
      <tr>
        <th class="topmenu" align="center" valign="middle" width="3%">SrNo</th>
        <th class="topmenu" align="center" valign="middle" width="15%">Project Address</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Status</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Accuracy</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Day</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Notes</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Smartsheet Link</th>
        <th class="topmenu" align="center" valign="middle" width="5%">Construction Calendar Link</th>
         <th class="topmenu" align="center" valign="middle" width="5%">Edit</th>
         
      </tr>
    {{if $list}}
    <tbody>
    <form name="mlist" method="post">
    
       <!--{{assign var=countn value= $total}}-->
      
      {{foreach from=$list key="key" item="item"}}
      <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
        <td> {{counter}} </td>
        <td>{{$item.bsn_name}}</td>
        <td>{{$item.status}}</td>
        <td>
        <select name="accu" onchange="update_accuracy({{$item.bsn_id}}, this.value)">
        <option value="0">Please Select</option>
        {{foreach from=$accuracy_data key="key2" item="item2"}}
        <option value="{{$item2.aa_id}}" {{if $item2.aa_id eq $item.bs_sar_accuracy}} selected="selected" {{/if}} >{{$item2.aa_option}}</option>
        {{/foreach}}
        </select>
        
        <div id="sm_user{{$item.bsn_id}}">{{$item.bs_sar_acc_user}}<br />{{$item.bs_sar_acc_date}} </div>
         <script>
 	   
        function update_accuracy(id,value)
		{
		var cond = "#sm_user"+id;
		
		 $.ajax({
			   type: "GET",
			   url: "{{$BASE_URL}}smartsheet_accuracy_report.update_accuracy/bsn_id/"+id+"/value/"+value,
				   success: function(result){
					    $(cond).html(result); 
			   }
			 });
		}
	
       </script>
        
        </td>
        <td>{{$item.dayscount}}</td>
        <td><a href="{{$BASE_URL}}smartsheet_accuracy_report.view_notes/bsn_id/{{$item.bsn_id}}" class="various">Notes</a></td>
        <td>{{if $item.bs_sar_ss_link}}<a href="{{$item.bs_sar_ss_link}}" target="_blank">Link{{/if}}</td>
        <td>{{if $item.bs_sar_cc_link}}<a href="{{$item.bs_sar_cc_link}}" target="_blank">Link{{/if}}</td>
        <td><a href="{{$BASE_URL}}{{$XFA.detail}}/bs_business_id/{{$item.bs_business_id}}" class="various" title="Edit"> 
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;</td>
        
      </tr>
     <!-- {{assign var=countn value=$countn-1}}-->
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