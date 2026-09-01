<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/jquery-1.7.2.js"></script>
<script> 
	!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
<script type="text/javascript" >  
	$(document).ready(function() {
		$(".various").fancybox({
			'width': '90%',
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
		
		
		$(".view").fancybox({
			'autoScale': true,
			 'transitionIn' : 'elastic',
			 'transitionOut' : 'elastic',
			 'speedIn' : 300,
			 'speedOut' : 300,
			 'overlayShow' : true,
			 'hideOnOverlayClick':false,
			 'hideOnContentClick':false,
			 'scrolling': 'yes' 
		});			
	});
	$(document).ready(function() {
		$(".fancybox").fancybox();
	});
	
function add_new(URL)
 {
var viewurl = URL+ "/random/" + Math.random();	
 $(document).ready(function () {
	$.fancybox({
			'width': '90%',
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

function refresh_delay_counts(pdrId)
{
	if (!pdrId) {
		return;
	}
	$.ajax({
		type: 'GET',
		url: "{{$BASE_URL}}{{$BASEFOLDER}}.get_delay_counts/pdr_id/" + pdrId + "/random/" + Math.random(),
		dataType: 'json',
		success: function (data) {
			if (!data) {
				return;
			}
			var approved = (data.approved !== undefined && data.approved !== null) ? data.approved : 0;
			var pending = (data.pending !== undefined && data.pending !== null) ? data.pending : 0;
			var lastSent = data.last_letter_sent ? data.last_letter_sent : '';
			$('#pdr_approved_' + pdrId).text(approved);
			$('#pdr_pending_' + pdrId).text(pending);
			$('#pdr_last_letter_' + pdrId).text(lastSent);
		}
	});
}

function add_delay(idKey, pdrId)
{
var viewurl = "{{$BASE_URL}}project_delay_register.delay_list/" + idKey + "/" + pdrId + "/random/" + Math.random();
 $(document).ready(function () {
	$.fancybox({
			'width': '95%',
			'height': '95%',
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
			'scrolling': 'yes',
			'onClosed': function() {
				refresh_delay_counts(pdrId);
			}
	});
});
}

function view_dashboard_summary()
{
var viewurl = "{{$BASE_URL}}project_delay_register.dashboard_summary/random/" + Math.random();
 $(document).ready(function () {
	$.fancybox({
			'width': '60%',
			'height': '55%',
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

function view_delay_summary()
{
var viewurl = "{{$BASE_URL}}project_delay_register.delay_summary/random/" + Math.random();
 $(document).ready(function () {
	$.fancybox({
			'width': '80%',
			'height': '85%',
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

function view_delay_history(idKey, pdrId)
{
var viewurl = "{{$BASE_URL}}project_delay_register.delay_history/" + idKey + "/" + pdrId + "/random/" + Math.random();
 $(document).ready(function () {
	$.fancybox({
			'width': '90%',
			'height': '85%',
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

function view_delay_letters(pdrId, status)
{
var viewurl = "{{$BASE_URL}}project_delay_register.delay_list/pdr_id/" + pdrId + "/status/" + status + "/random/" + Math.random();
 $(document).ready(function () {
	$.fancybox({
			'width': '95%',
			'height': '95%',
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
			'scrolling': 'yes',
			'onClosed': function() {
				refresh_delay_counts(pdrId);
			}
	});
});
}

function add_procedure()
{
	var viewurl = "{{$BASE_URL}}{{$BASEFOLDER}}.view_procedure"+ "/random/" + Math.random();	

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
	window.location.href = window.location.href;
	}
</script>

<style>
	#fancybox-inner{
		 overflow:scroll;
		-webkit-overflow-scrolling: touch;
	}
	#TheFancybox {
		overflow:auto;
		-webkit-overflow-scrolling:touch;
		width: 100%;
		height: 100%;  
	}
	#fancybox-content {
		overflow:auto;
		-webkit-overflow-scrolling:touch;
		width: 100%;
		height: 100%; 
	}
	#fancybox-wrap {
		z-index:9999999;
	} 
	#list-table tr td {
		color: #000;
	}
</style>

<h3 class="page-title">
	{{$title}}
	<!-- {{if $pdr_show_mode eq 'hidden'}} - Hidden Projects{{else}} - Visible Projects{{/if}} -->
</h3>

<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">

 <div style="float:left; text-align:left;">
&nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /><br />    
 </div>

<div style="float:right;">
	<input type="submit" name="show_visible" value="Show Visible" />&nbsp;&nbsp;
	<input type="submit" name="show_hidden" value="Show Hidden" />&nbsp;&nbsp;
    <input type="button" name="Add New " value="Add New" onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.detail}}');" />
 </div>

<div style="clear:both; padding:10px 0;">
	<div style="position:relative; min-height:32px;">
		<div style="display:flex; gap:6px; flex-wrap:nowrap; align-items:center; justify-content:flex-start;">
			<strong>Search by Project : </strong>
			<input type="text" name="search_project" value="{{$search_project}}" style="width:220px;"
				list="pdr_search_project_list" autocomplete="off" />
			<datalist id="pdr_search_project_list">
				{{ foreach from=$projdetail key="index" item="row" }}
				<option value="{{ $row.bsn_name }}">{{ $row.bsn_name }}</option>
				{{ /foreach }}
			</datalist>
			<input type="submit" value="Search" name="search" />
			<input type="submit" name="reset" value="Clear Search" />
		</div>
		<div style="position:absolute; left:54%; top:50%; transform:translate(-50%, -50%); display:flex; gap:8px; align-items:center; white-space:nowrap;">
			<input type="button" name="Dashboard Summary" value="Dashboard Summary" onclick="javascript:view_dashboard_summary();" />
			<input type="button" name="Delay Summary" value="Delay Summary" onclick="javascript:view_delay_summary();" />
			<!-- <div style="border:2px solid #3FDBFF; padding:10px;">Visible Projects: {{$summary_project_count|default:0}}</div>
			<div style="border:2px solid #3FDBFF; padding:10px;">Total Letters Sent: {{$summary_total_letters|default:0}}</div>
			<div style="border:2px solid #3FDBFF; padding:10px;">Total Delays Added: {{$summary_total_delays|default:0}}</div> -->
		</div>
	</div>
	<!-- <div style="text-align:center; color:#666; font-size:12px; margin-top:4px;">Summary excludes hidden projects.</div> -->
</div>
</form>


<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
                <th class="topmenu" align="center" valign="middle" width="5%">Sr No.</th>   
                <th class="topmenu" align="center" valign="middle" width="10%">Project Address </th> 
                <th class="topmenu" align="center" valign="middle" width="8%">Location</th>
				<th class="topmenu" align="center" valign="middle" width="10%">Total Time Delay Letters Sent </th>
                <th class="topmenu" align="center" valign="middle" width="10%">Total Time Delays Added </th>
				<th class="topmenu" align="center" valign="middle" width="10%">Approved Letters to be Sent </th>
				<th class="topmenu" align="center" valign="middle" width="10%">Pending Confirmation </th>
				<th class="topmenu" align="center" valign="middle" width="10%">Last Time Delay Letter Sent </th>
                <th class="topmenu" align="center" valign="middle" width="8%">Delay History</th> 
				<th class="topmenu" align="center" valign="middle" width="5%">New Delay </th>
				<th class="topmenu" align="center" valign="middle" width="5%">Hide</th>
				<th class="topmenu" align="center" valign="middle" width="5%">Action</th>
            </tr>
        </thead>
<tbody>
 {{foreach from=$list key="key" item="item"}}
  
 	 <tr bgcolor='{{cycle values="#D3E8D6,WHITE" advance=true}}'>
		<td>{{$item.$ID}}</td>    
		<td>{{$item.pdr_project_address}}</td>
		<td>
			<select name="project_delay_register[pdr_location]" onchange="update_location({{$item.$ID}}, this.value)">
				<option value="">Please select Location</option>
				<option value="North" {{if $item.pdr_location eq 'North'}}selected="selected"{{/if}}>North</option>
				<option value="South" {{if $item.pdr_location eq 'South'}}selected="selected"{{/if}}>South</option>
			</select>
			<div id="location_{{$item.$ID}}">
				{{if $item.pdr_location and $item.pdr_location_updated_by}}
					{{$item.pdr_location_updated_by}}<br/>
					{{$item.pdr_location_updated_at|date_format:"%d-%m-%Y"}}
				{{/if}}
			</div>
			<script>
			function update_location(id, value) {
				var locId = "#location_"+id;
				$.ajax({
					type: 'POST',
					url: "{{$BASE_URL}}{{$BASEFOLDER}}.update_location/{{$ID}}/" + id + "/value/" + value,
					success: function(response) {
						console.log("Saved successfully:", response);
						$(locId).html(response);
						//window.location.reload();
					},
					error: function(xhr) {
						console.error("Error saving:", xhr.responseText);
					}
				});
			}
			</script>
		</td>
		<td>{{$item.total_letters_sent}}</td>
		<td>{{$item.total_delays_added}}</td>
		<td>
			<a href="javascript:void(0);" id="pdr_approved_{{$item.pdr_id}}" onclick="javascript:view_delay_letters({{$item.pdr_id}}, 'Approved');" title="View Approved Letters">
				{{if $item.pdr_approved_letters_to_be_sent}}{{$item.pdr_approved_letters_to_be_sent}}{{else}}0{{/if}}
			</a>
		</td>
		<td>
			<a href="javascript:void(0);" id="pdr_pending_{{$item.pdr_id}}" onclick="javascript:view_delay_letters({{$item.pdr_id}}, 'Pending');" title="View Pending Letters">
				{{if $item.pdr_pending_confirmation}}{{$item.pdr_pending_confirmation}}{{else}}0{{/if}}
			</a>
		</td>
		<td id="pdr_last_letter_{{$item.pdr_id}}">{{$item.last_letter_sent}}</td>
		<td>
			<input type="button" name="View" value="View" title="View Delay History" onclick="javascript:view_delay_history('{{$ID}}', {{$item.$ID}});">
		</td>
		<td>
			<input type="button" name="Add" value="Add" title="Add Delay" onclick="javascript:add_delay('{{$ID}}', {{$item.$ID}});">
		</td>
		<td>
			<form name="recmet3" method="post" action="">
				<input type="hidden" name="project_hide[pdr_id]" value="{{$item.pdr_id}}">
				<input type="hidden" name="project_hide[pdr_hide]" value="0">
				<label class="switch">
					<input class="switch-input" type="checkbox" name="project_hide[pdr_hide]" value="1" onclick="this.form.submit();" {{if $item.pdr_hide eq 1}} checked="checked"{{/if}} />
					<span class="switch-label" data-on="Yes" data-off="No"></span>
					<span class="switch-handle"></span> <br />
				</label>
			</form>
			{{if $item.pdr_hide eq 1}}
				{{$item.pdr_hide_by}}<br/>
				{{$item.pdr_hide_date|date_format:"%d-%m-%Y"}}
			{{/if}}
		</td>
		<td style="color:#000;">
			<a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" class="various" title="Edit">
			<img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
			<a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete">
			<img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png"/></a>
		</td>
	</tr>  
    {{/foreach}}
</tbody>
    </table>
    
     {{if $last > 1}} 
    <table width="90%" border="0" cellpadding="0" cellspacing="0">   
    <tr>  
  {{if $list}}   
<td align="center">
 <div class='pagination'>
 {{if $pagenum == 1}}
 <span class='disabled'>&#171; previous</span>
 {{else}}
<a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{math equation="x - y" x=$pagenum y=1}}" title="Previous">&#171; previous</a>
 {{/if}}
        
{{if $pagenum != 1}}
 <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/1" title="{{$page_num}} Page">1</a></span>
 {{else}}<span class='current'>1</span>
 {{/if}}{{if $pagenum != 2}}
   <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/2" title="{{$page_num}} Page">2</a></span>
{{else}}<span class='current'>2</span>
 {{/if}}
{{if $paginateprev.0 > 3}}
...
{{/if}}
{{foreach from=$paginateprev key="page_key" item="page_num"}}
	{{if $page_num == $pagenum OR $page_num <= 2}}
   		{{elseif $page_num == $lastone}}
    
    	{{else}} <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$page_num}}" title="{{$page_num}} Page">{{$page_num}}</a></span>
        {{/if}}
        {{/foreach}}

{{foreach from=$paginatenext key="page_key" item="page_num2"}}
  	{{if $page_num2 < $last AND $page_num2 != $lastone}}
    			{{if $page_num2 == 1}}
                {{elseif $page_num2 == 2}}
                {{else}}
                    {{if $page_num2 == $pagenum OR $page_num2 <= 0}}
                            <span class='current'> {{$page_num2}}</span>
                    {{else}}
                        <a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$page_num2}}" title="{{$page_num2}} Page">{{$page_num2}}</a>
                     {{/if}}
                {{/if}}     
    {{/if}}
{{/foreach}}
{{if $page_num2 < $lasttow}}
...
{{/if}}
{{if $lastone == 1}}
{{elseif $lastone == 2}}
{{else}}
{{if $pagenum == $lastone }}
<span class='current'>{{$lastone}}</span>
{{else}}
<a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$lastone}}" title="{{$lastone}} Page">{{$lastone}}</a>
{{/if}}
{{/if}}
{{if $last == 1}}
{{elseif $last == 2}}
{{else}}
{{if $pagenum == $last}}
<span class='current'>{{$last}}</span>
{{else}}
 <a class="pagination"  href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$last}}" title="{{$last}} Page">{{$last}}</a>
{{/if}}
{{/if}}
{{if $pagenum == $last}}
<span class='disabled'>next &#187;</span>
 {{else}}
<a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{math equation="x + y" x=$pagenum y=1}}" title="Next">next &#187;</a></div>
 {{/if}}
</td>
{{else}}
<td align="center" height="300">Record Not found... </td>
{{/if}}
 </tr>
</table> 
{{/if}}
</div>
</form>