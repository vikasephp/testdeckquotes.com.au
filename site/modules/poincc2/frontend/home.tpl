<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

<script>
	!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />

<script type="text/javascript">
	function showlert(po_id) {
		var viewurl = "{{$BASE_URL}}poincc2.alert" + "/po_id/" + po_id;

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
</script>

<script type="text/javascript">
	$(document).ready(function () {
		/*
		*   Examples - images
		*/
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



	function add_procedure() {
		var viewurl = "{{$BASE_URL}}poincc2.view_procedure" + "/random/" + Math.random();

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



	function add_new() {
		var viewurl = "{{$BASE_URL}}poincc2.detail" + "/random/" + Math.random();
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

	function add_stage() {
		var viewurl = "{{$BASE_URL}}poincc2.view_stage" + "/random/" + Math.random();

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

	function view_list() {
		var viewurl = "{{$BASE_URL}}poincc2.merged_invoice_list" + "/random/" + Math.random();

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
	
	function view_approver() {
		var viewurl = "{{$BASE_URL}}poincc2.view_approver" + "/random/" + Math.random();

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

	function close_win() {
		$.fancybox.close();
		window.location.reload();
	}
</script>

<style>
	#fancybox-wrap {
		z-index: 9999999;
	}

	.tooltip {
		position: relative;
		/* display: inline-block;*/
		border: 0px solid !important;
		margin-top: 5px;

	}

	.tooltip .tooltiptext {
		visibility: hidden;
		width: 500px;
		background-color: black;
		color: #fff;
		text-align: center;
		border-radius: 6px;
		padding: 5px 5px;
		display: block;
		margin-left: 20px;

		/* Position the tooltip */
		position: absolute;
		z-index: 1;
	}

	.tooltip:hover .tooltiptext {
		visibility: visible;
	}

	.dtpic {
		width: 65px !important;
		padding-top: 1px !important;
		padding-bottom: 1px !important;
	}

	.show_remainingCredits span.show_info {
		font-size: 14px;
		color: #000;
	}

	.set {
		font-size: 10px !important;
		width: 25px !important;
		display: inline-block;
		padding-top: 1px !important;
		padding-bottom: 1px !important;
		padding-left: 1px !important;
		height: 25px !important;
	}


	.wrapper1,
	.wrapper2 {
		width: 100%;
		border: none 0px RED;
		overflow-x: scroll;
		overflow-y: hidden;
		scrollbar-color: yellow blue;
	}

	.wrapper1 {
		height: 20px;
	}

	.wrapper2 {}

	.div1 {
		width: 2280px;
		height: 20px;
	}

	.div2 {
		width: 2280px;
		height: 1100px;
		overflow: auto;
	}



	.multiselect {
		width: 280px;
		display: inline-block;
	}


	.multiselect3 {
		width: 200px;
		display: inline-block;
	}


	.selectBox {
		position: relative;

	}

	.selectBox select {
		width: 100%;
		font-weight: bold;
	}

	.overSelect {
		position: absolute;
		left: 0;
		right: 0;
		top: 0;
		bottom: 0;
	}

	#checkboxes {
		display: none;
		border: 1px #dadada solid;
		height: 150px;
		overflow-y: scroll;
	}

	#checkboxes label {
		display: block;
	}

	#checkboxes label:hover {
		background-color: #1e90ff;
	}


	#checkboxes1 {
		display: none;
		border: 1px #dadada solid;
		height: 150px;
		overflow-y: scroll;
	}

	#checkboxes1 label {
		display: block;
	}

	#checkboxes1 label:hover {
		background-color: #1e90ff;
	}

	.show_remainingCredits {
		margin-right: 30px;
	}

	#checkboxes2 {
		display: none;
		border: 1px #dadada solid;
		height: 150px;
		overflow-y: scroll;
	}

	#checkboxes2 label {
		display: block;
	}

	#checkboxes2 label:hover {
		background-color: #1e90ff;
	}

	#checkboxes3 {
		display: none;
		border: 1px #dadada solid;
		height: 350px;
		overflow-y: scroll;
	}

	#checkboxes3 label {
		display: block;
	}

	#checkboxes3 label:hover {
		background-color: #1e90ff;
	}

	#checkboxes4 {
		display: none;
		border: 1px #dadada solid;
		height: 150px;
		overflow-y: scroll;
	}

	#checkboxes4 label {
		display: block;
	}

	#checkboxes4 label:hover {
		background-color: #1e90ff;
	}


	#checkboxes5 {
		display: none;
		border: 1px #dadada solid;
		height: 150px;
		overflow-y: scroll;
	}

	#checkboxes5 label {
		display: block;
	}

	#checkboxes5 label:hover {
		background-color: #1e90ff;
	}



	.blink-bg {
		color: #fff;
		padding: 6px;
		display: inline-block;
		border-radius: 3px;
		animation: blinkingBackground 2s infinite;
	}

	@keyframes blinkingBackground {
		0% {
			background-color: #10c018;
		}

		25% {
			background-color: #1056c0;
		}

		50% {
			background-color: #ef0a1a;
		}

		75% {
			background-color: #254878;
		}

		100% {
			background-color: #04a1d5;
		}
	}

	.success_color {
		color: green !important;
	}

	.error_color {
		color: red !important;
	}
</style>

<h3 class="page-title">{{$title}}</h3>

{{if $po_number_assign_alert eq 'true' }} <span style="color:#549933; font-weight:bold;font-size: 16px;">PO number have
	been assigned to the pdf's Successfully.</span> {{/if}}
<br />

<script type="text/javascript">
	$(function () {
		$(".wrapper1").scroll(function () {
			$(".wrapper2")
				.scrollLeft($(".wrapper1").scrollLeft());
		});
		$(".wrapper2").scroll(function () {
			$(".wrapper1")
				.scrollLeft($(".wrapper2").scrollLeft());
		});
	});
</script>


<script>
	var expanded = false;

	function showCheckboxes() {
		var checkboxes = document.getElementById("checkboxes");
		if (!expanded) {
			checkboxes.style.display = "block";
			expanded = true;
		} else {
			checkboxes.style.display = "none";
			expanded = false;
		}
	}

	function showCheckboxes1() {
		var checkboxes = document.getElementById("checkboxes1");
		if (!expanded) {
			checkboxes.style.display = "block";
			expanded = true;
		} else {
			checkboxes.style.display = "none";
			expanded = false;
		}
	}

	function showCheckboxes2() {
		var checkboxes = document.getElementById("checkboxes2");
		if (!expanded) {
			checkboxes.style.display = "block";
			expanded = true;
		} else {
			checkboxes.style.display = "none";
			expanded = false;
		}
	}

	function showCheckboxes3() {
		var checkboxes = document.getElementById("checkboxes3");
		if (!expanded) {
			checkboxes.style.display = "block";
			expanded = true;
		} else {
			checkboxes.style.display = "none";
			expanded = false;
		}
	}

	function showCheckboxes4() {
		var checkboxes = document.getElementById("checkboxes4");
		if (!expanded) {
			checkboxes.style.display = "block";
			expanded = true;
		} else {
			checkboxes.style.display = "none";
			expanded = false;
		}
	}

	function showCheckboxes5() {
		var checkboxes = document.getElementById("checkboxes5");
		if (!expanded) {
			checkboxes.style.display = "block";
			expanded = true;
		} else {
			checkboxes.style.display = "none";
			expanded = false;
		}
	}

</script>



<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
	<div style="float:left;text-align:left; margin-left:10px;">

		<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /><br />
		{{if !empty($sql) }}<input type="hidden" name="sql" value="{{$sql}}" /> {{/if}}


		Supplier :
		<datalist id='supplier'>
			{{foreach from=$companydetail key="key" item="item"}}
			<option value="{{$item.co_company_name}}" {{if $detail.co_company_name eq $item.co_company_name}}
				selected="selected" {{/if}}>
				{{$item.co_company_name}}
			</option>
			{{/foreach}}
		</datalist>
		<input type="text" name="supplier_search" list='supplier' style="width:350px;"
			placeholder="Press any key to auto populate suppliers" />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="border:1px solid #0CF; padding:4px; font-weight:bold;">NAFP :
			$ {{$totval|number_format:2:".":","}} </span>
		<br />
		<!---------Project Search--------------->
		Project :
		<div class="multiselect">
			<div class="selectBox" onclick="showCheckboxes2()">
				<select>
					<option>Select Project</option>
				</select>
				<div class="overSelect"></div>
			</div>
			<div id="checkboxes2">

				{{foreach from=$projlist key="key" item="item"}}
				<label for="one{{$item.po_id}}">
					<input type="checkbox" id="one_{{$item.project}}" name="project[{{$item.project}}]"
						value="{{$item.project_number}}" />{{$item.project_number}}</label>
				{{/foreach}}
			</div>
		</div>

		<!--<input type="submit" value="Search" name="search_project"   {{$class7}} /> -->
		{{if $data3 }} <span style="color:#639; font-weight:bold;"> Project Searched : {{$data3}} </span> {{/if}}

		<br />
		<!---------Myboid Search--------------->
		Myobid :
		<div class="multiselect">
			<div class="selectBox" onclick="showCheckboxes3()">
				<select>
					<option>Select Myboid</option>
				</select>
				<div class="overSelect"></div>
			</div>
			<div id="checkboxes3">

				{{foreach from=$myobidlist key="key" item="item"}}
				<label for="one{{$item.po_id}}">
					<input type="checkbox" id="one_{{$item.po_id}}" name="myboid[{{$item.po_id}}]"
						value="{{$item.po_myobid}}" />{{$item.po_myobid}}</label>
				{{/foreach}}
			</div>
		</div>
		<br />

		Myobid Broad Search:
		<input type="text" name="myobid_broad_search" style="width:250px;" />


		{{if $data4 }} <span style="color:#639; font-weight:bold;"> Myboid Searched : {{$data4}} </span> {{/if}}

		<!---------Myobid Search Ends--------------->

		<br />


		<!---------Type Search--------------->

		Type :
		<div class="multiselect">
			<div class="selectBox" onclick="showCheckboxes4()">
				<select>
					<option>Select Type</option>
				</select>
				<div class="overSelect"></div>
			</div>
			<div id="checkboxes4">

				{{foreach from=$typelist key="key" item="item"}}
				<label for="one{{$item.po_id}}">
					<input type="checkbox" id="one_{{$item.po_id}}" name="type[{{$item.po_id}}]"
						value="{{$item.po_type}}" />{{$item.po_type}}</label>
				{{/foreach}}
			</div>
		</div>
		<br />
		
		Search by Approver : 
		<select name="search_by_approver">
			<option value="">Select Approver</option>
			{{foreach from=$ipapprover key="key_ip" item="item_ip"}}
			<option value="{{$item_ip.ip_id}}" {{if $item_ip.ip_id eq $search_by_approver}} selected="selected" {{/if}}>
				{{$item_ip.ip_name}}
			</option>
			{{/foreach}}
			</select>
		<br/>

		Invoice Number :
		<input type="text" name="inv_no" style="width:250px;" />

		<input type="submit" value="Search" name="search_all" {{$class10}} />
		{{if $data5 }} <span style="color:#639; font-weight:bold;"> Type Searched : {{$data5}} </span> {{/if}}

		&nbsp; &nbsp;<input type="submit" value="Clear All Search/Filter" name="clearall" {{$class9}} />
		&nbsp; &nbsp;<input type="button" name="stage_options" value="Invoice Stages Admin"
			onclick="javascript:add_stage();" />

		&nbsp; &nbsp;<strong> Filter By : </strong>

		<select name="inv_stg" />
		<option value="">Show All</option>
		{{foreach from = $isdetail key="key3" item="item3"}}
		<option value="{{$item3.is_id}}" {{if $item3.is_id eq $inv_stg}} selected="selected" {{/if}}>
			{{$item3.is_option}}
		</option>
		{{/foreach}}
		</select>
		&nbsp; &nbsp;<input type="submit" value="Filter" name="filter" />
		&nbsp; &nbsp;<input type="submit" value="Show rows with alerts" name="showalert" {{$class11}} />
		<br />

		Invoice Date Search :<input type="text" name="dt_date1" id="dt1" value="{{$dt_date1_ss}}"
			class="w16em dateformat-d-ds-m-ds-Y" style="width:70px;" /> TO
		<input type="text" name="dt_date2" id="dt2" value="{{$dt_date2_ss}}" class="w16em dateformat-d-ds-m-ds-Y"
			style="width:70px;" />
		&nbsp; &nbsp;<input type="submit" value="Search" name="date_search" /> 
		&nbsp; <input type="button" name="stage_options" value="Approver Admin" onclick="javascript:view_approver();"> <br />

		Invoice Due Date Search :<input type="text" name="dt_due_date1" value="{{$due_dt1_ss}}" id="ddt1"
			class="w16em dateformat-d-ds-m-ds-Y" style="width:70px;" /> TO
		<input type="text" name="dt_due_date2" id="ddt2" value="{{$due_dt2_ss}}" class="w16em dateformat-d-ds-m-ds-Y"
			style="width:70px;" />
		&nbsp; &nbsp;<input type="submit" value="Search" name="due_date_search" />
		<br/>
		
		Search by P Or NP :
		<select name="search_by_p_or_np" />
			<option value="">Select P Or NP</option>
			<option value="Not Determined" {{if $search_by_p_or_np == 'Not Determined' }}selected{{/if}}>Not Determined</option>
			<option value="Project" {{if $search_by_p_or_np == 'Project' }}selected{{/if}}>Project</option>
			<option value="Non-Project" {{if $search_by_p_or_np == 'Non-Project' }}selected{{/if}}>Non-Project</option>
		</select>
		

	</div>


	<div style="float:right; text-align:left;">

		<input type="submit" value="Merge Invoices Pdf" name="merge" {{$class6}} id="submitBtn" /><br /><br />

		<input type="submit" value="Start Download and Assign PO Number" name="start_download_and_assign_po_number"
			{{$class8}} id="start_download_and_assign_po_number" /><br /><br />

		{{ if $cron_job_response.status }}
		<div class="show_remainingCredits">
			{{ if $cron_job_response.status eq 'error'}}
			<span class="show_info error_color" style="font-weight: bold;">{{ $cron_job_response.message }}</span>
			{{ else }}
			<span class="show_info success_color" style="font-weight: bold;">{{ $cron_job_response.message }}</span>
			{{ /if }}
		</div>
		<br /><br />
		{{ /if }}

		<!--
		<input type="submit" value="Clear database for PO files" name="clear_database_for_PO_files" {{$class8}}   id ="clear_database_for_PO_files"/><br />
		-->
		<div class="show_remainingCredits">
			<!--
			<input type="submit" value="download_files_for_po_number" name="download_files_for_po_number"    id ="download_files_for_po_number"/>
			-->
			<span class="show_info">Total files :: {{$total_files_for_po_records}} / </span>
			<span class="show_info">Total Downloaded files :: {{$total_po_downloaded_files}} </span>
		</div>
		<br />
		<div class="show_remainingCredits">
			<!--
			<input type="submit" value="Assign PO number" name="assign_po_number" {{$class7}}   id ="submitBtn"/>
			-->
			<span class="show_info">Remaining Credits :: {{$remainingCredits}}</span>
			<span class="show_info">Total files :: {{$total_files_for_po_records}} / </span>
			<span class="show_info">Total files having PO number :: {{$total_po_number_files}}</span>
		</div>
		<br /><br />
		<!--<input type="submit" value="Merge Match PO PDF" name="merge__po_number_pdf" {{$class8}}   id ="submitBtn"/><br /><br /> -->
		<input type="submit" value="Download all files as zip" name="download_all_files_as_zip" {{$class8}}
			id="dafaz_submitBtn" /><br /><br />
		<input type="button" name="merge_inv_list" value="Printed/Saved Merged Report"
			onclick="javascript:view_list();" /> <br />
		<input type="submit" value="Export To XLS" name="export" /> <br />
		<input type="button" name="Add New " value="Add New" onclick="javascript:add_new();" />
	</div>
	<img src="{{$BASE_URL}}images/loading2.gif" id="show" style="display:none;" />

	{{if $download eq 'true' }}
	<a href="{{$BASE_URL}}files/merged_poincc2/{{$fn}}" target="_blank">
		<span class="blink-bg">Click here to show merged pdf</a> </span>
	{{/if}}


	<script type="text/javascript" language="javascript">

		$(document).ready(function () {

			$("#submitBtn").click(function () {

				$('#show').css('display', 'block');
			});

			{ { if $total_po_files_for_zip eq "No file" } } alert("Please click on 'download files for PO Number' button to downloads the pdf files as zip"); { {/if } }
		});

	</script>

</form>
</div>


<!--<div style="float:right;"> <input type="button" name="Add New " value="Add New" onclick="javascript:add_new();" /> </div>-->


<div class="wrapper1">
	<div class="div1">
	</div>
</div>

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
					<th class="topmenu" align="center" valign="middle" width="5%">PO Number</th>
					<th class="topmenu" align="center" valign="middle" width="6%">Value of PO</th>
					<th class="topmenu" align="center" valign="middle" width="6%">Chart of Acc</th>
					<th class="topmenu" align="center" valign="middle" width="4%">Linked Purchase Order</th>
					<th class="topmenu" align="center" valign="middle" width="5%">Alert</th>
					<th class="topmenu" align="center" valign="middle" width="5%">Approver</th>
					<th class="topmenu" align="center" valign="middle" width="5%">Date of Approval</th>
					<th class="topmenu" align="center" valign="middle" width="2%">Action</th>
				</tr>
			</thead>
			{{if $list}}
			<tbody>
				<form name="mlist" method="post">
					{{assign var=countn value= $numstartvounter}}
					{{foreach from=$list key="key" item="item"}}
					<tr bgcolor="{{cycle values=" #D3E8D6,WHITE" advance=true}}">
						<td>{{$item.po_urn}}</td>
						<td>{{$item.po_type}}</td>

						<td>

							<form name="pornp" method="post" action="">
								<select name="po_pornp[{{$item.po_id}}]" style="width:116px;"
									onchange="this.form.submit();" />
								<option value="Not Determined" {{if $item.po_pornp=='Not Determined' }}selected{{/if}}>
									Not Determined</option>
								<option value="Project" {{if $item.po_pornp=='Project' }}selected{{/if}}>Project
								</option>
								<option value="Non-Project" {{if $item.po_pornp=='Non-Project' }}selected{{/if}}>
									Non-Project</option>
								</select>
							</form>

						</td>


						<td>
							{{$item.po_project_number}}
							{{section name=addr start=2 loop=11}}

								{{assign var="idx" value=$smarty.section.addr.index}}
								{{assign var="field" value="po_project_number"|cat:$idx}}
								
								{{if $item[$field]}}, 
								{{$item[$field]}}
								{{/if}}

							{{/section}}
						</td>
						<td>{{$item.po_email_date}}</td>
						<td>{{$item.po_invoice_number}}</td>
						<td>{{$item.po_supplier}}</td>
						<td>
							<div class="tooltip">
								{{if $item.po_invoice_doc}}
								<a
									href="/poincc2.download_content?file_name={{$item.po_invoice_doc}}&module_name=poincc2.home">Download</a>
								<span class="tooltiptext">{{$item.po_supplier}} - {{$item.po_po_value}} -
									{{$item.po_project_number}} - {{$item.po_invoice_number}}</span>
								{{/if}}
							</div>

						</td>
						<td>{{$item.po_invoice_date}}</td>
						<td>{{$item.po_invoice_due_date}}</td>
						<td>{{$item.po_invoice_value}}</td>
						<td>{{$item.po_us_invoice_value}}</td>

						<td id="cond{{$item.po_id}}" style="background:{{$item.color_code}}">

							<form name="recmet2" method="post" action="">
								<select name="invoice_stage[{{$item.po_id}}]"
									onChange="update_stage({{$item.po_id}}, this.value)" />

								<option value="0" {{if $item.wa_priority eq -1}} selected="selected" {{/if}}>Please
									Select </option>
								{{foreach from = $isdetail key="key2" item="item2"}}
								<option value="{{$item2.is_id}}" {{if $item2.is_id eq $item.po_invoice_stage}}
									selected="selected" {{/if}}>{{$item2.is_option}}</option>
								{{/foreach}}

								</select> <br />
								<span style="color: #FFF;">{{$item.po_inv_stage_user}}
									<br />{{$item.po_inv_stage_date}}</span>

							</form>
						</td>

						<script>
							function update_stage(id, value) {
								var cond = '#cond' + id;

								$.ajax({
									type: "GET",
									url: "{{$BASE_URL}}poincc2.update_stage/po_id/" + id + "/value/" + value,
									success: function (result) {

										$(cond).css("background", result);

									}

								});
							}
						</script>

						<td> {{$item.po_myobid}} </td>





						<!--        <td>
       m
        {{if $item.po_purchase_order_doc}}
        <a href="/poincc2.download_content?file_name={{$item.po_purchase_order_doc}}&module_name=poincc2.home" >Download</a>{{/if}}
        </td>-->

						<td> {{$item.po_purchase_order_no}}</td>
						<td style="color: white; background-color:{{if $item.po_invoice_value eq $item.po_po_value}}green {{else}}red{{/if}}"> {{$item.po_po_value}}</td>

						<td>
							<form name="recmet" method="post" action="" id="myForm">
								<input type="text" name="po_chartof_acc[{{$item.po_id}}]"
									value="{{$item.po_chartof_acc}}" style="width:60px;" />
								<input type=image src="{{$BASE_URL}}images/save.png" alt="Save" title="Save">
							</form>
						</td>
						<td>{{if $item.po_purchase_order_no}} Yes
							{{else}} No {{/if}}
						</td>
						{{if !empty($item.po_alert_text)}}
						<td style="background:#F00;">
							{{else}}
						<td>
							{{/if}}
							<input type="button" name="Alert" value="Read Alert"
								onclick="javascript:showlert({{$item.po_id}});"
								style="width:90px; height:20px; font-size:11px; line-height:17px !important; padding:0px !important" />
						</td>
						<td>
							<select name="search_by_approver" onchange="update_approver({{$item.po_id}}, this.value)">
								<option value="">Select Approver</option>
								{{foreach from=$ipapprover key="key_ips" item="item_ips"}}
								<option value="{{$item_ips.ip_id}}" {{if $item_ips.ip_id eq $item.po_inv_approver}} selected="selected" {{/if}}>
								{{$item_ips.ip_name}}
								</option>
								{{/foreach}}
							</select>
							<script>
							function update_approver(id, value) {
								$.ajax({
									type: 'POST',
									url: "{{$BASE_URL}}poincc2.update_approver/po_id/" + id + "/value/" + value,
									success: function(response) {
										console.log("Saved successfully:", response);
										//window.location.reload();
									},
									error: function(xhr) {
										console.error("Error saving:", xhr.responseText);
									}
								});
							}
							</script>
						</td>
						<td>
							<input type="text" name="dt" class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo452_{{$item.$ID}}" value="{{$item.po_inv_approval_date}}" onchange="update_approval_date({{$item.$ID}}, 'po_inv_approval_date', this.value);" onblur="update_approval_date({{$item.$ID}}, 'po_inv_approval_date', this.value);"/>
							<script>
							function update_approval_date(id, column, value) {
								value = encodeURIComponent(value);
								$.ajax({
									type: 'POST',
									url: "{{$BASE_URL}}poincc2.update_approval_date/po_id/" + id + "/column/" + column + "/value/" + value,
									success: function(response) {
										console.log("Date saved:", response);
									},
									error: function(xhr) {
										console.error("Error saving date:", xhr.responseText);
									}
								});
							}
							</script>
						</td>
						<td><a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" class="various" title="Edit">
								<img style="height: 20px;; width:20px"
									src="{{$BASE_URL}}css/admin/images/edit.png" /></a>
							<!-- {{if $USER_GROUP == 'Administrators'}} -->
							<a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}"
								onclick="javascript:if(!confirm('Are you sure want to delete the listing? Because it will delete all the document related to this listing.')) return false;"
								title="Delete"><img style="height: 20px;; width:20px"
									src="{{$BASE_URL}}css/admin/images/delete.png" /></a>
							<!--   {{/if}}-->
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
				<td align="center">
					<div class='pagination'> {{if $pagenum == 1}} <span class='disabled'>
							<< previous</span>
								{{else}} <a class="pagination"
										href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{math equation=" x - y" x=$pagenum
										y=1}}" title="Previous">
										<< previous</a> {{/if}}

											{{if $pagenum != 1}} <span class="paginate"><a class="pagination"
													href="{{$BASE_URL}}{{$XFA.home}}/pagenum/1"
													title="{{$page_num}} Page">1</a></span>
											{{else}}<span class='current'>1</span> {{/if}}{{if $pagenum != 2}} <span
													class="paginate"><a class="pagination"
														href="{{$BASE_URL}}{{$XFA.home}}/pagenum/2"
														title="{{$page_num}} Page">2</a></span>
												{{else}}<span class='current'>2</span> {{/if}}
													{{if $paginateprev.0 > 3}}
													...
													{{/if}}
													{{foreach from=$paginateprev key="page_key" item="page_num"}}
													{{if $page_num == $pagenum OR $page_num <= 2}}
													{{elseif $page_num == $lastone}}

													{{else}} <span class="paginate"><a class="pagination"
																href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$page_num}}"
																title="{{$page_num}} Page">{{$page_num}}</a></span>
														{{/if}}
														{{/foreach}}

														{{foreach from=$paginatenext key="page_key" item="page_num2"}}
														{{if $page_num2 < $last AND $page_num2 != $lastone}}
														{{if $page_num2 == 1}}
														{{elseif $page_num2 == 2}}
														{{else}}
															{{if $page_num2 == $pagenum OR $page_num2 <= 0}} <span
																class='current'> {{$page_num2}}</span>
															{{else}} <a class="pagination"
																	href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$page_num2}}"
																	title="{{$page_num2}} Page">{{$page_num2}}</a>
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
																	{{if $pagenum == $lastone }} <span
																		class='current'>{{$lastone}}</span>
																	{{else}} <a class="pagination"
																			href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$lastone}}"
																			title="{{$lastone}} Page">{{$lastone}}</a>
																		{{/if}}
																		{{/if}}
																		{{if $last == 1}}
																		{{elseif $last == 2}}
																		{{else}}
																			{{if $pagenum == $last}} <span
																				class='current'>{{$last}}</span>
																			{{else}} <a class="pagination"
																					href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$last}}"
																					title="{{$last}} Page">{{$last}}</a>
																				{{/if}}
																				{{/if}}
																				{{if $pagenum == $last}} <span
																					class='disabled'>next >></span>
																				{{else}} <a class="pagination"
																						href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{math equation="
																						x + y" x=$pagenum y=1}}"
																						title="Next">next >></a></div>
					{{/if}}
				</td>
				{{else}}
					<td align="center" height="300">Record Not found... </td>
					{{/if}}
			</tr>
		</table>
		{{/if}} <br />
		<br />

	</div>
</div>