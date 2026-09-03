<!--<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/jquery-1.7.2.js"></script>-->
<script> 
	!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
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

function open_popup(type) {
	let viewurl = '';
	if (type == 'view_procedure') {
		viewurl = "{{$BASE_URL}}{{$BASEFOLDER}}.view_procedure" + "/random/" + Math.random();
	}
	else if (type == 'view_zoning') {
		viewurl = "{{$BASE_URL}}{{$BASEFOLDER}}.view_zoning" + "/random/" + Math.random();
	}
	else if (type == 'view_sizeclass') {
		viewurl = "{{$BASE_URL}}{{$BASEFOLDER}}.view_sizeclass" + "/random/" + Math.random();
	}
	
	$(document).ready(function () {
		$.fancybox({
			'width': '90%',
			'height': '99%',
			'autoScale': false,
			'transitionIn': 'elastic',
			'transitionOut': 'elastic',
			'speedIn': 400,
			'speedOut': 300,
			'overlayShow': true,
			'overlayColor': '#000',
			'hideOnOverlayClick': false,
			'hideOnContentClick': false,
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

<h3 class="page-title">{{$title}}</h3>

<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">

 <div style="float:left; text-align:left;">
&nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:open_popup('view_procedure');" />
&nbsp;<input type="button" name="zoning" value="Zoning" onclick="javascript:open_popup('view_zoning');" />
&nbsp;<input type="button" name="size_class" value="Size Class" onclick="javascript:open_popup('view_sizeclass');" /><br />    
 </div>

<div style="float:right;">
    <input type="button" name="Add New " value="Add New" onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.detail}}');" />
 </div>
</form>


<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
                <th class="topmenu" align="center" valign="middle" width="5%">Record No.</th>   
                <th class="topmenu" align="center" valign="middle" width="8%">Enquiry Date</th> 
                <th class="topmenu" align="center" valign="middle" width="8%">Source</th>
				<th class="topmenu" align="center" valign="middle" width="10%">Customer Email</th>
                <th class="topmenu" align="center" valign="middle" width="10%">Customer</th>
				<th class="topmenu" align="center" valign="middle" width="20%">Project Address</th>
				<th class="topmenu" align="center" valign="middle" width="10%">Phone Number</th>
				<th class="topmenu" align="center" valign="middle" width="5%">Block Size(m²)</th>
                <th class="topmenu" align="center" valign="middle" width="8%">Zoning</th> 
				<th class="topmenu" align="center" valign="middle" width="5%">Block Class</th>
				<th class="topmenu" align="center" valign="middle" width="5%">Approved Date</th>
				<th class="topmenu" align="center" valign="middle" width="5%">Heritage</th>
				<th class="topmenu" align="center" valign="middle" width="5%">Property Type</th>
				<th class="topmenu" align="center" valign="middle" width="5%">Portal Created</th>
				<th class="topmenu" align="center" valign="middle" width="8%">Subdivision Report Created</th>
				<th class="topmenu" align="center" valign="middle" width="5%">Action</th>
            </tr>
        </thead>
<tbody>
 {{foreach from=$list key="key" item="item"}}
  
 	 <tr bgcolor='{{cycle values="#D3E8D6,WHITE" advance=true}}'>
		<td>ENQ-{{$item.$ID}}</td>    
		<td>{{$item.dolr_enquiry_date|date_format:"%d-%m-%Y"}}</td>
		<td>
			{{$item.dolr_source}}
			{{if $item.dolr_source eq 'Website' and !empty($item.dolr_webpage)}}{{$item.dolr_webpage}}{{/if}}
		</td>
		<td>{{$item.dolr_customer_email}}</td>
		<td>{{$item.dolr_customer_name}}</td>
		<td>{{$item.dolr_project_address}}</td>
		<td>{{$item.dolr_phone_number}}</td>
		<td>
			{{foreach from=$data_sc key="key_bsc" item="item_bsc"}}
				{{if ($item_bsc.docsc_id == $item.dolr_block_sizeclass) and $item_bsc.docsc_option eq 'Compact' }}
					<250m²
				{{elseif ($item_bsc.docsc_id == $item.dolr_block_sizeclass) and $item_bsc.docsc_option eq 'Mid Size'}}
					250m²-500m²
				{{elseif ($item_bsc.docsc_id == $item.dolr_block_sizeclass) and $item_bsc.docsc_option eq 'Large'}}
					>500m²
				{{else}}
				{{/if}}
			{{/foreach}}
		</td>
		<td>
			<select name="doc_zone[{{$item.dolr_id}}]" onchange="update_zoning({{$item.dolr_id}}, this.value)">
				<option value="">Please Select</option>
				{{foreach from=$data_zoning key="key_zone" item="item_zone"}}
				<option value="{{$item_zone.docz_id}}" {{if $item_zone.docz_id == $item.dolr_zoning}} selected="selected" {{/if}}>
					{{$item_zone.docz_option}}
				</option>
				{{/foreach}}
			</select>
			<div id="doc_zone_{{$item.dolr_id}}">
			{{if $item.dolr_zoning gt 0}}
				{{$item.dolr_zoning_updated_by}}<br/>
				{{$item.dolr_zoning_updated_at|date_format:"%d-%m-%Y"}}
			{{/if}}
			</div>
			<script>
				function update_zoning(id, value) {
					var doc_zoneid = '#doc_zone_' + id;
					$.ajax({
						type: "GET",
						url: "{{$BASE_URL}}{{$BASEFOLDER}}.update_zoning/dolr_id/" + id + "/value/" + value,
						success: function (result) {
							$(doc_zoneid).html(result);
						}
					});
				}
			</script>
		</td>
		<td>
			<select name="doc_bsc[{{$item.dolr_id}}]" onchange="update_bsc({{$item.dolr_id}}, this.value)">
				<option value="">Please Select</option>
				{{foreach from=$data_sc key="key_bsc" item="item_bsc"}}
				<option value="{{$item_bsc.docsc_id}}" {{if $item_bsc.docsc_id == $item.dolr_block_sizeclass}} selected="selected" {{/if}}>
					{{$item_bsc.docsc_option}}
				</option>
				{{/foreach}}
			</select>
			<div id="bsc_{{$item.dolr_id}}">
			{{if $item.dolr_block_sizeclass gt 0}}
				{{$item.dolr_block_sizeclass_updated_by}}<br/>
				{{$item.dolr_block_sizeclass_updated_at|date_format:"%d-%m-%Y"}}
			{{/if}}
			</div>
			<script>
				function update_bsc(id, value) {
					var bsc_id = '#bsc_' + id;
					$.ajax({
						type: "GET",
						url: "{{$BASE_URL}}{{$BASEFOLDER}}.update_bsc/dolr_id/" + id + "/value/" + value,
						success: function (result) {
							$(bsc_id).html(result);
						}
					});
				}
			</script>
		</td>
		<td>
			<input type="text" name="dt" class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo452_{{$item.$ID}}" value="{{$item.dolr_date_approved}}" onchange="update_approval_date({{$item.$ID}}, 'dolr_date_approved', this.value);" onblur="update_approval_date({{$item.$ID}}, 'dolr_date_approved', this.value);"/>
			
			<div id="app_{{$item.$ID}}">{{if $item.dolr_date_approved}}{{$item.dolr_date_approved_by}}{{/if}}</div>
			<script>
			function update_approval_date(id, column, value) {
				value = encodeURIComponent(value);
				var appDate = '#app_' + id;
				$.ajax({
					type: 'POST',
					url: "{{$BASE_URL}}{{$BASEFOLDER}}.update_approval_date/{{$ID}}/" + id + "/column/" + column + "/value/" + value,
					success: function(response) {
						console.log("Date saved:", response);
						$(appDate).html(response);
					},
					error: function(xhr) {
						console.error("Error saving date:", xhr.responseText);
					}
				});
			}
			</script>
		</td>
		<td>
			<form name="recmet3" method="post" action="">
				<input type="hidden" name="heritage[{{$item.$ID}}]" value="0">
				<label class="switch">
					<input class="switch-input" type="checkbox" name="heritage[{{$item.$ID}}]" value="1" onclick="this.form.submit();" {{if $item.dolr_heritage eq 1 }} checked="checked" {{/if}} />
					<span class="switch-label" data-on="Yes" data-off="No"></span>
					<span class="switch-handle"></span> <br />
				</label>
			</form>
			{{if $item.dolr_heritage eq 1 }}
				{{$item.dolr_heritage_updated_by}}<br/>
				{{$item.dolr_heritage_updated_at|date_format:"%d-%m-%Y"}}
			{{/if}}
		</td>
		<td>
			<textarea rows="3" cols="25" class="tinymce2" id="type_{{$item.$ID}}" style="overflow-y: scroll;">{{$item.dolr_property_type}}</textarea>  
			<script>	   
			$(document).ready(function(){				
				$("#type_{{$item.$ID}}").keyup(function(){
				   update_property_type({{$item.$ID}}, this.value);
				});
			});
			function update_property_type(id,value)
			{
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}{{$BASEFOLDER}}.update_property_type/{{$ID}}/"+id+"/value/"+value,
					   success: function(result){
				   }
				});
			}
		   </script>
		</td>
		<td>TBD</td>
		<td>TBD</td>
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