<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

<script>
	!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />

<script type="text/javascript">
function add_procedure()
{
	var viewurl = "{{$BASE_URL}}short_stays_payables_tracker.view_procedure/random/" + Math.random();
	$(document).ready(function () {
		$.fancybox({
			'width': '90%',
			'height': '99%',
			'autoScale': false,
			'transitionIn': 'elastic',
			'transitionOut': 'elastic',
			'speedIn': 300,
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

function add_new()
{
	var viewurl = "{{$BASE_URL}}short_stays_payables_tracker.detail/random/" + Math.random();
	$(document).ready(function () {
		$.fancybox({
			'width': '85%',
			'height': '85%',
			'autoScale': false,
			'transitionIn': 'elastic',
			'transitionOut': 'elastic',
			'speedIn': 300,
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

function add_stage()
{
	var viewurl = "{{$BASE_URL}}short_stays_payables_tracker.view_stage/random/" + Math.random();
	$(document).ready(function () {
		$.fancybox({
			'width': '90%',
			'height': '99%',
			'autoScale': false,
			'transitionIn': 'elastic',
			'transitionOut': 'elastic',
			'speedIn': 300,
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
	window.location.reload();
}
</script>

<style>
#fancybox-wrap {z-index:9999999;}
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
.wrapper1, .wrapper2{width: 100%; border: none 0px RED; overflow-x: scroll; overflow-y:hidden; scrollbar-color: yellow blue;}
.wrapper1{height: 20px; }
.div1 {width:1900px; height: 20px; }
.div2 {width:1900px; height: 1100px; overflow: auto;}
.multiselect { width: 280px; display:inline-block; }
.selectBox { position: relative; }
.selectBox select { width: 100%; font-weight: bold; }
.overSelect { position: absolute; left: 0; right: 0; top: 0; bottom: 0; }
#checkboxes2, #checkboxes3, #checkboxes4 {
	display: none;
	border: 1px #dadada solid;
	overflow-y:scroll;
}
#checkboxes2, #checkboxes4 { height: 150px; }
#checkboxes3 { height: 350px; }
#checkboxes2 label, #checkboxes3 label, #checkboxes4 label { display: block; }
#checkboxes2 label:hover, #checkboxes3 label:hover, #checkboxes4 label:hover { background-color: #1e90ff; }
</style>

<h3 class="page-title">{{$title}}</h3>
<br />

<script type="text/javascript">
$(function(){
	$(".wrapper1").scroll(function(){
		$(".wrapper2").scrollLeft($(".wrapper1").scrollLeft());
	});
	$(".wrapper2").scroll(function(){
		$(".wrapper1").scrollLeft($(".wrapper2").scrollLeft());
	});
});
</script>

<script>
var expanded = false;
function showCheckboxes2() {
	var checkboxes = document.getElementById("checkboxes2");
	if (!expanded) { checkboxes.style.display = "block"; expanded = true; }
	else { checkboxes.style.display = "none"; expanded = false; }
}
function showCheckboxes3() {
	var checkboxes = document.getElementById("checkboxes3");
	if (!expanded) { checkboxes.style.display = "block"; expanded = true; }
	else { checkboxes.style.display = "none"; expanded = false; }
}
function showCheckboxes4() {
	var checkboxes = document.getElementById("checkboxes4");
	if (!expanded) { checkboxes.style.display = "block"; expanded = true; }
	else { checkboxes.style.display = "none"; expanded = false; }
}
</script>

<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
<div style="float:left;text-align:left; margin-left:10px;">

<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /><br />
{{if !empty($sql) }}<input type="hidden" name="sql" value="{{$sql}}" /> {{/if}}

Supplier :
<datalist id='supplier'>
	{{foreach from=$companydetail key="key" item="item"}}
	<option value="{{$item.co_company_name}}">{{$item.co_company_name}}</option>
	{{/foreach}}
</datalist>
<input type="text" name="supplier_search" list='supplier' style="width:350px;" placeholder="Press any key to auto populate suppliers" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="border:1px solid #0CF; padding:4px; font-weight:bold;">NAFP : $ {{$totval|number_format:2:".":","}} </span>
<br />

Project :
<div class="multiselect">
	<div class="selectBox" onclick="showCheckboxes2()">
		<select><option>Select Project</option></select>
		<div class="overSelect"></div>
	</div>
	<div id="checkboxes2">
	{{foreach from=$projlist key="key" item="item"}}
		<label for="proj_{{$key}}">
		<input type="checkbox" id="proj_{{$key}}" name="project[{{$item.project_number}}]" value="{{$item.project_number}}" />{{$item.project_number}}</label>
	{{/foreach}}
	</div>
</div>
{{if $data3 }} <span style="color:#639; font-weight:bold;"> Project Searched : {{$data3}} </span> {{/if}}
<br />

Myobid :
<div class="multiselect">
	<div class="selectBox" onclick="showCheckboxes3()">
		<select><option>Select Myboid</option></select>
		<div class="overSelect"></div>
	</div>
	<div id="checkboxes3">
	{{foreach from=$myobidlist key="key" item="item"}}
		<label for="myob_{{$key}}">
		<input type="checkbox" id="myob_{{$key}}" name="myboid[{{$key}}]" value="{{$item.ssp_myobid}}" />{{$item.ssp_myobid}}</label>
	{{/foreach}}
	</div>
</div>
<br />

Myobid Broad Search:
<input type="text" name="myobid_broad_search" style="width:250px;" value="{{$myobid_broad}}" />
{{if $data4 }} <span style="color:#639; font-weight:bold;"> Myboid Searched : {{$data4}} </span> {{/if}}
<br />

Type :
<div class="multiselect">
	<div class="selectBox" onclick="showCheckboxes4()">
		<select><option>Select Type</option></select>
		<div class="overSelect"></div>
	</div>
	<div id="checkboxes4">
	{{foreach from=$typelist key="key" item="item"}}
		<label for="type_{{$key}}">
		<input type="checkbox" id="type_{{$key}}" name="type[{{$key}}]" value="{{$item.ssp_type}}" />{{$item.ssp_type}}</label>
	{{/foreach}}
	</div>
</div>
<br />

Invoice Number :
<input type="text" name="inv_no" style="width:250px;" value="{{$invoice_no}}" />

<input type="submit" value="Search" name="search_all" {{$class10}} />
{{if $data5 }} <span style="color:#639; font-weight:bold;"> Type Searched : {{$data5}} </span> {{/if}}

&nbsp; &nbsp;<input type="submit" value="Clear All Search/Filter" name="clearall" {{$class9}} />
&nbsp; &nbsp;<input type="button" name="stage_options" value="Invoice Stages Admin" onclick="javascript:add_stage();" />

&nbsp; &nbsp;<strong> Filter By : </strong>
<select name="inv_stg">
	<option value="">Show All</option>
	{{foreach from=$isdetail key="key3" item="item3"}}
	<option value="{{$item3.is_id}}" {{if $item3.is_id eq $inv_stg}} selected="selected" {{/if}}>{{$item3.is_option}}</option>
	{{/foreach}}
</select>
&nbsp; &nbsp;<input type="submit" value="Filter" name="filter" />

<br />

Search by P Or NP :
<select name="search_by_p_or_np">
	<option value="">Select P Or NP</option>
	<option value="Not Determined" {{if $search_by_p_or_np == 'Not Determined' }}selected{{/if}}>Not Determined</option>
	<option value="Project" {{if $search_by_p_or_np == 'Project' }}selected{{/if}}>Project</option>
	<option value="Non-Project" {{if $search_by_p_or_np == 'Non-Project' }}selected{{/if}}>Non-Project</option>
</select>

</div>

<div style="float:right; text-align:left;">
<input type="submit" value="Export To XLS" name="export" /> <br />
<input type="button" name="Add New" value="Add New" onclick="javascript:add_new();" />
</div>

</form>
</div>

<div class="wrapper1"><div class="div1"></div></div>

<div class="wrapper2">
<div class="div2 tableFixHead">
<table id="doclist-table" class="nav-back" width="100%">
	<thead>
	<tr>
		<th class="topmenu" align="center" valign="middle" width="2%">URN</th>
		<th class="topmenu" align="center" valign="middle" width="3%">Type</th>
		<th class="topmenu" align="center" valign="middle" width="4%">P Or NP</th>
		<th class="topmenu" align="center" valign="middle" width="4%">Project Number</th>
		<th class="topmenu" align="center" valign="middle" width="4%">Email Date</th>
		<th class="topmenu" align="center" valign="middle" width="4%">Invoice No</th>
		<th class="topmenu" align="center" valign="middle" width="5%">Supplier</th>
		<th class="topmenu" align="center" valign="middle" width="4%">Invoice</th>
		<th class="topmenu" align="center" valign="middle" width="5%">Invoice Date</th>
		<th class="topmenu" align="center" valign="middle" width="5%">Invoice Due Date</th>
		<th class="topmenu" align="center" valign="middle" width="5%">Invoice Value</th>
		<th class="topmenu" align="center" valign="middle" width="5%">US Invoice Value</th>
		<th class="topmenu" align="center" valign="middle" width="5%">Invoice Stage</th>
		<th class="topmenu" align="center" valign="middle" width="4%">MYOBID</th>
		<th class="topmenu" align="center" valign="middle" width="6%">Chart of Acc</th>
		<th class="topmenu" align="center" valign="middle" width="2%">Action</th>
	</tr>
	</thead>
	{{if $list}}
	<tbody>
	{{assign var=countn value=$numstartvounter}}
	{{foreach from=$list key="key" item="item"}}
	<tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
		<td>{{$item.ssp_urn}}</td>
		<td>{{$item.ssp_type}}</td>
		<td>
			<form name="pornp" method="post" action="">
				<select name="ssp_pornp[{{$item.ssp_id}}]" style="width:116px;" onchange="this.form.submit();">
					<option value="Not Determined" {{if $item.ssp_pornp == 'Not Determined'}}selected{{/if}}>Not Determined</option>
					<option value="Project" {{if $item.ssp_pornp == 'Project'}}selected{{/if}}>Project</option>
					<option value="Non-Project" {{if $item.ssp_pornp == 'Non-Project'}}selected{{/if}}>Non-Project</option>
				</select>
			</form>
		</td>
		<td>
			{{$item.ssp_project_number}}
			{{section name=addr start=2 loop=11}}
				{{assign var="idx" value=$smarty.section.addr.index}}
				{{assign var="field" value="ssp_project_number"|cat:$idx}}
				{{if $item[$field]}}, {{$item[$field]}}{{/if}}
			{{/section}}
		</td>
		<td>{{$item.ssp_email_date}}</td>
		<td>{{$item.ssp_invoice_number}}</td>
		<td>{{$item.ssp_supplier}}</td>
		<td>
			<div class="tooltip">
			{{if $item.ssp_invoice_doc}}
				<a href="/short_stays_payables_tracker.download_content?file_name={{$item.ssp_invoice_doc}}&module_name=short_stays_payables_tracker.home">Download</a>
				<span class="tooltiptext">{{$item.ssp_supplier}} - {{$item.ssp_project_number}} - {{$item.ssp_invoice_number}}</span>
			{{/if}}
			</div>
		</td>
		<td>{{$item.ssp_invoice_date}}</td>
		<td>{{$item.ssp_invoice_due_date}}</td>
		<td>{{$item.ssp_invoice_value}}</td>
		<td>{{$item.ssp_us_invoice_value}}</td>
		<td id="cond{{$item.ssp_id}}" style="background:{{$item.color_code}}">
			<select name="invoice_stage[{{$item.ssp_id}}]" onChange="update_stage({{$item.ssp_id}}, this.value)">
				<option value="0">Please Select</option>
				{{foreach from=$isdetail key="key2" item="item2"}}
				<option value="{{$item2.is_id}}" {{if $item2.is_id eq $item.ssp_invoice_stage}} selected="selected" {{/if}}>{{$item2.is_option}}</option>
				{{/foreach}}
			</select><br />
			<span style="color: #FFF;">{{$item.ssp_inv_stage_user}} <br />{{$item.ssp_inv_stage_date}}</span>
		</td>
		<td>{{$item.ssp_myobid}}</td>
		<td>
			<form name="recmet" method="post" action="">
				<input type="text" name="ssp_chartof_acc[{{$item.ssp_id}}]" value="{{$item.ssp_chartof_acc}}" style="width:60px;" />
				<input type="image" src="{{$BASE_URL}}images/save.png" alt="Save" title="Save">
			</form>
		</td>
		<td>
			<a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" class="various" title="Edit">
				<img style="height:20px; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/>
			</a>
			<a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}" onclick="javascript:if(!confirm('Are you sure want to delete the listing? Because it will delete all the document related to this listing.')) return false;" title="Delete">
				<img style="height:20px; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/>
			</a>
		</td>
	</tr>
	{{assign var=countn value=$countn+1}}
	{{/foreach}}
	</tbody>
	{{/if}}
</table>

<script type="text/javascript">
$(document).ready(function() {
	$(".various").fancybox({
		'width': '95%',
		'height': '90%',
		'autoScale': false,
		'transitionIn': 'elastic',
		'transitionOut': 'elastic',
		'speedIn': 300,
		'speedOut': 300,
		'overlayShow': true,
		'hideOnOverlayClick': false,
		'hideOnContentClick': false,
		'type': 'iframe',
		'scrolling': 'yes'
	});
});

function update_stage(id, value)
{
	var cond = '#cond' + id;
	$.ajax({
		type: "GET",
		url: "{{$BASE_URL}}short_stays_payables_tracker.update_stage/ssp_id/" + id + "/value/" + value,
		success: function(result) {
			$(cond).css("background", result);
		}
	});
}
</script>

{{if $last > 1}}
<table width="90%" border="0" cellpadding="0" cellspacing="0">
	<tr>
	{{if $list}}
	<td align="center"><div class='pagination'>
		{{if $pagenum == 1}} <span class='disabled'>&lt;&lt; previous</span> {{else}} <a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{math equation="x - y" x=$pagenum y=1}}" title="Previous">&lt;&lt; previous</a> {{/if}}
		{{if $pagenum != 1}} <span class="paginate"><a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/1" title="1 Page">1</a></span> {{else}}<span class='current'>1</span> {{/if}}
		{{if $pagenum != 2}} <span class="paginate"><a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/2" title="2 Page">2</a></span> {{else}}<span class='current'>2</span> {{/if}}
		{{if $paginateprev.0 > 3}} ... {{/if}}
		{{foreach from=$paginateprev key="page_key" item="page_num"}}
		{{if $page_num == $pagenum OR $page_num <= 2}}
		{{elseif $page_num == $lastone}}
		{{else}} <span class="paginate"><a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$page_num}}" title="{{$page_num}} Page">{{$page_num}}</a></span> {{/if}}
		{{/foreach}}
		{{foreach from=$paginatenext key="page_key" item="page_num2"}}
		{{if $page_num2 < $last AND $page_num2 != $lastone}}
		{{if $page_num2 == 1}}{{elseif $page_num2 == 2}}{{else}}
		{{if $page_num2 == $pagenum OR $page_num2 <= 0}} <span class='current'>{{$page_num2}}</span> {{else}} <a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$page_num2}}" title="{{$page_num2}} Page">{{$page_num2}}</a> {{/if}}
		{{/if}}
		{{/if}}
		{{/foreach}}
		{{if $page_num2 < $lasttow}} ... {{/if}}
		{{if $lastone == 1}}{{elseif $lastone == 2}}{{else}}
		{{if $pagenum == $lastone}} <span class='current'>{{$lastone}}</span> {{else}} <a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$lastone}}" title="{{$lastone}} Page">{{$lastone}}</a> {{/if}}
		{{/if}}
		{{if $last == 1}}{{elseif $last == 2}}{{else}}
		{{if $pagenum == $last}} <span class='current'>{{$last}}</span> {{else}} <a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$last}}" title="{{$last}} Page">{{$last}}</a> {{/if}}
		{{/if}}
		{{if $pagenum == $last}} <span class='disabled'>next &gt;&gt;</span> {{else}} <a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{math equation="x + y" x=$pagenum y=1}}" title="Next">next &gt;&gt;</a></div>
	{{/if}}
	</td>
	{{else}}
	<td align="center" height="300">Record Not found...</td>
	{{/if}}
	</tr>
</table>
{{/if}}
<br /><br />
</div>
</div>
