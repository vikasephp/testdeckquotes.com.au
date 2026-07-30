<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/default.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

<script>
	!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
<script type="text/javascript">
	$(document).ready(function () {
		/*
		*   Examples - images
		*/
		$(".various").fancybox({
			'width': '98%',
			'height': '95%',
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
		var viewurl = "{{$BASE_URL}}cou_component_document_report.view_procedure" + "/random/" + Math.random();
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

	function add_status() {
		var viewurl = "{{$BASE_URL}}cou_component_document_report.view_status" + "/random/" + Math.random();
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

	function add_letter() {
		var viewurl = "{{$BASE_URL}}cou_component_document_report.viewletter" + "/random/" + Math.random();
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

	$(document).ready(function() {
		// $('#toggleColumnSlider').attr('checked', 'checked');
		// $('.other-column').hide();
		$('#toggleColumnSlider').removeAttr('checked');
		$('.other-column').show();
	});
	function toggleColumn() {
		const slider = $('#toggleColumnSlider');
		console.log(slider.is(":checked"));
		if(slider.is(":checked")) {
			$('.other-column').hide();
		}
		else {
			$('.other-column').show();
		}
	}
</script>

<style>
	.dtpic {
		width: 65px !important;
		padding-top: 1px !important;
		padding-bottom: 1px !important;
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

	#fancybox-wrap {
		z-index: 9999999;
	}

	.tableFixHead {
		overflow-y: auto;
		height: 700px;
	}

	.tableFixHead thead th {
		position: sticky;
		top: 0;
		text-align: left;
	}

	table {
		border-collapse: collapse;
		width: 100%;
	}

	th {
		z-index: 9999;
	}
</style>

<h3 class="page-title">{{$title}}</h3>
<br />
<form name="mlist" method="post" enctype="multipart/form-data">
	<div style="display: flex; justify-content: space-between; align-items: end;">
		<div style="margin-left: 10px; text-align: left;">
			<div>
				<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();">
				<input type="submit" name="filter_comp" value="Show Complete Status">
				<input type="submit" name="filter_const" value="Show Construction Status">
				<input type="button" name="status_options" value="Sub Status Admin" onclick="javascript:add_status();">
				<input type="button" name="Add New" value="Letter Text Admin" onclick="javascript:add_letter();">
				<span style="color:#0C9; font-weight:bold; border:2px solid #0C9; padding:4px; margin-left:20px;"> ACTIVE : {{$active}} </span>
			</div>
			<div>
				<strong>Project Search : </strong>
				<input type="text" name="keyword" value="{{$keyword}}" style="width:400px;" placeholder="Search for Address">
				<input type="submit" value="Search" name="search" /> &nbsp;<input type="submit" name="clear_search" value="Clear Search">
				<input type="submit" name="print" value="Merge Print">
			</div>
			<div>
				<strong> Filter By Status: </strong>
				<select name="status">
					<option value="0">Show All</option>
					{{foreach from = $stfilter key="key3" item="item3"}}
						<option value="{{$item3.st_id}}" {{if $item3.st_id eq $status}} selected="selected" {{/if}}>{{$item3.st_name}}</option>
					{{/foreach}}
				</select>
				<input type="submit" value="Filter" name="filter_status">
				<input type="submit" name="clear_search" value="Clear Filter">
				<strong style="margin-left: 5px;"> Filter By Sub Status: </strong>
				<select name="substatus">
					<option value="0">Show All</option>
					{{foreach from = $statusData key="key4" item="item4"}}
						<option value="{{$item4.st_id}}" {{if $item4.st_id eq $status}} selected="selected" {{/if}}>{{$item4.st_option}}</option>
					{{/foreach}}
				</select>
				<input type="submit" value="Filter" name="filter_substatus">
				<input type="submit" name="clear_search" value="Clear Filter">
				<div style="display: inline-block; vertical-align: bottom; margin-left: 50px;">
					<a href="javascript:void(0)" style="color: #000; text-decoration: none; line-height: 29px;" onclick="$('#toggleColumnSlider').removeAttr('checked').change()">Show More</a>
					<label class="switch" for="toggleColumnSlider" style="display: inline-block; margin: 0;">
						<input class="switch-input" onchange="toggleColumn()" id="toggleColumnSlider" type="checkbox">
						<span class="switch-label" data-on="" data-off=""></span>
						<span class="switch-handle"></span>
					</label>
					<a href="javascript:void(0)" style="color: #000; text-decoration: none; line-height: 29px;" onclick="$('#toggleColumnSlider').attr('checked', 'checked').change()">Show Less</a>
				</div>
			</div>
			<div>
				<strong>Filter By Urgency: </strong>
				<select name="bsn_cou_urgency">
					<option value="">Show All</option>
					<option value="High" {{ if $bsn_cou_urgency == 'High' }} selected="selected" {{/if}}>High</option>
					<option value="Medium" {{ if $bsn_cou_urgency == 'Medium' }} selected="selected" {{/if}}>Medium</option>
					<option value="Low" {{ if $bsn_cou_urgency == 'Low' }} selected="selected" {{/if}}>Low</option>
				</select>
				<input type="submit" value="Filter" name="filter_bsn_cou_urgency">
				<input type="submit" name="clear_search" value="Clear Filter">
			</div>
		</div>
		<div style="margin-right: 10px; text-align: right;">
			<input type="submit" value="Show Hidden" name="unhide" />
		</div>
	</div>

	<div style="float:left; width:100%;">
		<div class="div2 tableFixHead">
			<table id="doclist-table" class="nav-back" width="100%">
				<thead>
					<tr>
						<th class="topmenu" align="center" valign="middle" width="3%">SrNo</th>
						<th class="topmenu" align="center" valign="middle" width="14%">Project Address</th>
						<th class="topmenu" align="center" valign="middle" width="3%">QA</th>
						<th class="topmenu" align="center" valign="middle" width="3%">Block</th>
						<th class="topmenu" align="center" valign="middle" width="3%">Section</th>
						<th class="topmenu" align="center" valign="middle" width="3%">HIA Days</th>
						<th class="topmenu" align="center" valign="middle" width="3%">Traffic Light</th>
						<th class="topmenu other-column" align="center" valign="middle" width="3%" data-col="building_approval">Building Approval</th>
						<th class="topmenu other-column" align="center" valign="middle" width="3%">Commencement Notice</th>
						<th class="topmenu other-column" align="center" valign="middle" width="3%">BA stamped plans</th>
						<th class="topmenu other-column" align="center" valign="middle" width="3%">Latest Merged Plans</th>
						<th class="topmenu other-column" align="center" valign="middle" width="3%" data-col="urgency">Urgency</th>
						<th class="topmenu other-column" align="center" valign="middle" width="3%">Certificate of Occupancy</th>
						<th class="topmenu other-column" align="center" valign="middle" width="3%">Link</th>
						<th class="topmenu other-column" align="center" valign="middle" width="3%">Status</th>
						<th class="topmenu other-column" align="center" valign="middle" width="3%">Customer Has<br />Taken The Occupancy</th>
						<th class="topmenu other-column" align="center" valign="middle" width="3%">Sub Status</th>
						<th class="topmenu other-column" align="center" valign="middle" width="3%">What is holding up your COO</th>
						<th class="topmenu other-column" align="center" valign="middle" width="3%">COO Compliance Advice</th>
						<th class="topmenu other-column" align="center" valign="middle" width="3%">Weekly Update Letters </th>
						<th class="topmenu other-column" align="center" valign="middle" width="3%">Weekly Letter to be sent</th>
						<th class="topmenu other-column" align="center" valign="middle" width="3%">Letter Text</th>
						<th class="topmenu other-column" align="center" valign="middle" width="3%">Notes</th>
						<th class="topmenu other-column" align="center" valign="middle" width="3%" data-col="construction_alerts">Construction Alerts</th>
						<th class="topmenu" align="center" valign="middle" width="3%">Customer Walkthrough</th>
						<th class="topmenu" align="center" valign="middle" width="3%">Inspections Records</th>
						<th class="topmenu" align="center" valign="middle" width="3%">COU application sent to certifier</th>
						<th class="topmenu" align="center" valign="middle" width="3%" data-col="pier_inspection_certficate">Pier Inspection Certificate</th>
						<th class="topmenu" align="center" valign="middle" width="3%" data-col="survey_id_document">Survey ID Document</th>
						<th class="topmenu" align="center" valign="middle" width="6%">Termite protection Certificate - Penetrations</th>
						<th class="topmenu" align="center" valign="middle" width="6%">Termite Protection Certificate - Perimeter </th>
						<th class="topmenu" align="center" valign="middle" width="6%">Glazing Certificate - Shower Screens </th>
						<th class="topmenu" align="center" valign="middle" width="6%">Glazing Certificate - Windows</th>
						<th class="topmenu" align="center" valign="middle" width="6%">Glazing Certificate- Glass Wardrobe Doors</th>
						<th class="topmenu" align="center" valign="middle" width="6%">Glazing Certificate- Glass Mirror & Splashback</th>
						<th class="topmenu" align="center" valign="middle" width="6%">Glazing Certificate- Skylight</th>
						<th class="topmenu" align="center" valign="middle" width="6%">Glazing Certificate- Glass Balustrade</th>
						<th class="topmenu" align="center" valign="middle" width="6%">Wall and Roof Frames Detail Plans</th>
						<th class="topmenu" align="center" valign="middle" width="6%">Insulation Certificate</th>
						<th class="topmenu" align="center" valign="middle" width="6%">Waterproofing Certificate</th>
						<th class="topmenu" align="center" valign="middle" width="6%">Smoke Alarm Certificate</th>
						<th class="topmenu" align="center" valign="middle" width="6%">Slip Resistance Certificate - Interior Stairs</th>
						<th class="topmenu" align="center" valign="middle" width="6%">Slip Resistance Certificate - Exterior Stairs and Landing</th>
						<th class="topmenu" align="center" valign="middle" width="6%">Fire Rated Certificate</th>
						<th class="topmenu" align="center" valign="middle" width="6%">Application of certificate of occupancy - signed by customer</th>
						<th class="topmenu" align="center" valign="middle" width="6%">Certificate of Electrical Safety - Electrician</th>
						<th class="topmenu" align="center" valign="middle" width="6%">Certificate of Electrical Safety - Air Conditioning</th>
						<th class="topmenu" align="center" valign="middle" width="6%">Asbestos Clearance Certificate</th>
						<th class="topmenu" align="center" valign="middle" width="6%">Final Plumbing Certificate</th>
						<th class="topmenu" align="center" valign="middle" width="6%">Box Gutter Certificate</th>
						<th class="topmenu" align="center" valign="middle" width="6%">Post-Construction Dilapidation Report</th>
						<th class="topmenu" align="center" valign="middle" width="6%">Building Approval Amendment Authorisation</th>
						<th class="topmenu" align="center" valign="middle" width="6%">Amended Drainage Plan</th>
						<th class="topmenu" align="center" valign="middle" width="6%">Has Been Removed From Warranty List</th>
						<th class="topmenu" align="center" valign="middle" width="6%">Remove From Report</th>
					</tr>
				</thead>
				{{if $list}}
				<tbody>
					{{assign var=countn value= $total}}

					{{foreach from=$list key="key" item="item"}}
					<tr bgcolor="{{cycle values=" #D3E8D6,WHITE" advance=true}}">
						<td> {{counter}} </td>
						<td>{{$item.bsn_address}}</td>

						<td {{if $item.cs_ch_user}} style="background: #0C3;" {{/if}}>
							<a href="{{$BASE_URL}}cou_component_document_report.qa_ch/bsn_id/{{$item.bsn_id}}"
								class="various">QA</a><br />
							<!--{{if $item.cs_ch_user}} {{$item.cs_ch_user}} <br />{{$item.cs_ch_date}} {{/if}}-->
						</td>
						<td>{{$item.bsn_cd_block}}</td>
						<td>{{$item.bsn_cd_section}}</td>
						<td>{{$item.dayscount}}</td>
						{{ if $item.bs_cou_traffic_light  eq 1}}
						<td style="background:#00CC33; color:#FFF" ;>
							<a href="{{$BASE_URL}}cou_component_document_report.colorbox/bsn_id/{{$item.bsn_id}}"
								class="various">Color</a>
							<br /><br />{{$item.bs_cou_tl_user }}<br />{{$item.bs_cou_tl_date}}<br />
							<a href="{{$BASE_URL}}cou_component_document_report.reason/bsn_id/{{$item.bsn_id}}"
								class="various">Read</a>
						</td>
						{{ elseif  $item.bs_cou_traffic_light  eq 2}}
						<td style="background: #ff7f27; color:#FFF" ;>
							<a href="{{$BASE_URL}}cou_component_document_report.colorbox/bsn_id/{{$item.bsn_id}}"
								class="various">Color</a>
							<br /><br />{{$item.bs_cou_tl_user}}<br />{{$item.bs_cou_tl_date}}<br />
							<a href="{{$BASE_URL}}cou_component_document_report.reason/bsn_id/{{$item.bsn_id}}"
								class="various">Read</a>
						</td>
						{{ elseif  $item.bs_cou_traffic_light  eq 3}}
						<td style="background: #F00; color:#FFF" ;>
							<a href="{{$BASE_URL}}cou_component_document_report.colorbox/bsn_id/{{$item.bsn_id}}"
								class="various">Color</a>
							<br /><br />{{$item.bs_cou_tl_user}}<br />{{$item.bs_cou_tl_date}}<br />
							<a href="{{$BASE_URL}}cou_component_document_report.reason/bsn_id/{{$item.bsn_id}}"
								class="various">Read</a>
						</td>
						{{else }}
						<td>
							<a href="{{$BASE_URL}}cou_component_document_report.colorbox/bsn_id/{{$item.bsn_id}}"
								class="various">Color</a>
						</td>
						{{/if}}
						<td class="other-column" data-col="building_approval" {{if $item.doc_file_name_232}} style="background:#00CC33;" {{elseif
							$item.doc_not_required_232 eq 0}} style="background:#F00;" {{else}}
							style="background:#999;" {{/if}} id="cond1{{$item.bsn_id}}">
							{{if $item.doc_file_name_232}}
							<a href="/cou_component_document_report.download_content?file_name={{$item.doc_file_name_232}}&module_name=cou_component_document_report.home">Download</a>
							{{else}}
								<select name="cou32[{{$item.bsn_id}}]"
									onChange="update_req_notreq_1({{$item.bsn_id}}, this.value)">
									<option value="0" {{if $item.doc_not_required_232 eq 0 }} selected="selected"
										{{/if}}>Required</option>
									<option value="1" {{if $item.doc_not_required_232 eq 1 }} selected="selected"
										{{/if}}>Not Required</option>
								</select>
							{{/if}}
							<div style="margin-top: 15px;">
								{{foreach from=$item.suppliers_232 key="index" item="row"}}
									{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
									<p style="margin: 6px 0; padding: 0;">
										<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
									</p>
								{{/foreach}}
								<p style="margin: 0; padding: 0; margin-top: 10px;">
									<a href="/cou_component_document_report.include_suppliers/ccdr_bsn_id/{{$item.bsn_id}}/ccdr_doc_id/232" class="various">Include Suppliers</a>
								</p>
							</div>
						</td>
						<td class="other-column" {{if $item.doc_file_name_235}} style="background:#00CC33;" {{elseif
							$item.doc_not_required_235 eq 0}} style="background:#F00;" {{else}}
							style="background:#999;" {{/if}} id="cond1{{$item.bsn_id}}">
							{{if $item.doc_file_name_235}}
							<a href="/cou_component_document_report.download_content?file_name={{$item.doc_file_name_235}}&module_name=cou_component_document_report.home">Download</a>
							{{else}}
								<select name="cou35[{{$item.bsn_id}}]"
									onChange="update_req_notreq_1({{$item.bsn_id}}, this.value)">
									<option value="0" {{if $item.doc_not_required_235 eq 0 }} selected="selected"
										{{/if}}>Required</option>
									<option value="1" {{if $item.doc_not_required_235 eq 1 }} selected="selected"
										{{/if}}>Not Required</option>
								</select>
							{{/if}}
							<div style="margin-top: 15px;">
								{{foreach from=$item.suppliers_235 key="index" item="row"}}
									{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
									<p style="margin: 6px 0; padding: 0;">
										<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
									</p>
								{{/foreach}}
								<p style="margin: 0; padding: 0; margin-top: 10px;">
									<a href="/cou_component_document_report.include_suppliers/ccdr_bsn_id/{{$item.bsn_id}}/ccdr_doc_id/235" class="various">Include Suppliers</a>
								</p>
							</div>
						</td>
						<td class="other-column" {{if $item.doc_file_name_231}} style="background:#00CC33;" {{elseif
							$item.doc_not_required_231 eq 0}} style="background:#F00;" {{else}}
							style="background:#999;" {{/if}} id="cond1{{$item.bsn_id}}">
							{{if $item.doc_file_name_231}}
							<a href="/cou_component_document_report.download_content?file_name={{$item.doc_file_name_231}}&module_name=cou_component_document_report.home">Download</a>
							{{else}}
								<select name="cou1[{{$item.bsn_id}}]"
									onChange="update_req_notreq_1({{$item.bsn_id}}, this.value)">
									<option value="0" {{if $item.doc_not_required_231 eq 0 }} selected="selected"
										{{/if}}>Required</option>
									<option value="1" {{if $item.doc_not_required_231 eq 1 }} selected="selected"
										{{/if}}>Not Required</option>
								</select>
								<script>
									function update_req_notreq_1(id, value) {
										var cond1 = '#cond1' + id;

										$.ajax({
											type: "GET",
											url: "{{$BASE_URL}}cou_component_document_report.update_req_notreq/bsn_id_1/" + id + "/value_1/" + value,
											success: function (result) {

												if (value == 0) {
													$(cond1).css("background", "#F00");
												} else {
													$(cond1).css("background", "#999");
												}
											}

										});
									}
								</script>
							{{/if}}
							<div style="margin-top: 15px;">
								{{foreach from=$item.suppliers_231 key="index" item="row"}}
									{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
									<p style="margin: 6px 0; padding: 0;">
										<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
									</p>
								{{/foreach}}
								<p style="margin: 0; padding: 0; margin-top: 10px;">
									<a href="/cou_component_document_report.include_suppliers/ccdr_bsn_id/{{$item.bsn_id}}/ccdr_doc_id/231" class="various">Include Suppliers</a>
								</p>
							</div>
						</td>
						<td class="other-column" {{if $item.doc_file_name_491}} style="background:#00CC33;" {{elseif
							$item.doc_not_required_491 eq 0}} style="background:#F00;" {{else}}
							style="background:#999;" {{/if}} id="cond2{{$item.bsn_id}}">
							{{if $item.doc_file_name_491}}
							<a href="/cou_component_document_report.download_content?file_name={{$item.doc_file_name_491}}&module_name=cou_component_document_report.home">Download</a>
							{{else}}
								<select name="cou1[{{$item.bsn_id}}]"
									onChange="update_req_notreq_2({{$item.bsn_id}}, this.value)">
									<option value="0" {{if $item.doc_not_required_491 eq 0 }} selected="selected"
										{{/if}}>Required</option>
									<option value="1" {{if $item.doc_not_required_491 eq 1 }} selected="selected"
										{{/if}}>Not Required</option>
								</select>
								<script>
									function update_req_notreq_2(id, value) {
										var cond2 = '#cond2' + id;

										$.ajax({
											type: "GET",
											url: "{{$BASE_URL}}cou_component_document_report.update_req_notreq/bsn_id_2/" + id + "/value_2/" + value,
											success: function (result) {

												if (value == 0) {
													$(cond2).css("background", "#F00");
												} else {
													$(cond2).css("background", "#999");
												}
											}

										});
									}
								</script>
							{{/if}}
							<div style="margin-top: 15px;">
								{{foreach from=$item.suppliers_491 key="index" item="row"}}
									{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
									<p style="margin: 6px 0; padding: 0;">
										<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
									</p>
								{{/foreach}}
								<p style="margin: 0; padding: 0; margin-top: 10px;">
									<a href="/cou_component_document_report.include_suppliers/ccdr_bsn_id/{{$item.bsn_id}}/ccdr_doc_id/491" class="various">Include Suppliers</a>
								</p>
							</div>
						</td>
						<td class="other-column" data-col="urgency">
							<select name="{{$TABLE}}[bsn_cou_urgency]" style="width: auto;" onchange="updateRecord('{{ $item.bsn_id }}', 'bsn_cou_urgency', this.value)">
								<option value="">Select Urgency</option>
								<option value="High" {{ if $item.bsn_cou_urgency == 'High' }} selected="selected" {{ /if }}>High</option>
								<option value="Medium" {{ if $item.bsn_cou_urgency == 'Medium' }} selected="selected" {{ /if }}>Medium</option>
								<option value="Low" {{ if $item.bsn_cou_urgency == 'Low' }} selected="selected" {{ /if }}>Low</option>
							</select>
						</td>
						<td class="other-column">
							{{if $item.doc_file_name_173}}
							<a href="/cou_component_document_report.download_content?file_name={{$item.doc_file_name_173}}&module_name=cou_component_document_report.home">Download</a>
							<br />
							{{$item.doc_date_uploaded_173}}
							{{/if}}
							<div style="margin-top: 15px;">
								{{foreach from=$item.suppliers_173 key="index" item="row"}}
									{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
									<p style="margin: 6px 0; padding: 0;">
										<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
									</p>
								{{/foreach}}
								<p style="margin: 0; padding: 0; margin-top: 10px;">
									<a href="/cou_component_document_report.include_suppliers/ccdr_bsn_id/{{$item.bsn_id}}/ccdr_doc_id/173" class="various">Include Suppliers</a>
								</p>
							</div>
						</td>
						<td class="other-column" style="text-align:center;"><a href="{{$item.link}}" target="blank">Link</a></td>
						<td class="other-column">{{$item.status}}</td>
						<td class="other-column">
							<form name="recmet3" method="post" action="">
								<input type="hidden" name="occupancy[{{$item.bs_business_id}}]" value="0" />
								<label class="switch">
									<input class="switch-input" type="checkbox"
										name="occupancy[{{$item.bs_business_id}}]" value="1"
										onclick="this.form.submit();" {{if $item.bs_cou_cust_occupancy eq 1 }}
										checked="checked" {{/if}}>
									<span class="switch-label" data-on="Yes" data-off="No"></span>
									<span class="switch-handle"></span> <br />
								</label>
							</form>
						</td>
						<td class="other-column">
							<form name="st" method="post" action="">
								<select name="sub_status[{{$item.bsn_id}}]" onchange="this.form.submit();">
									{{foreach from=$statusData key="key2" item="item2"}}
									<option value="{{$item2.st_id}}" {{if $item.bs_cou_sub_status eq $item2.st_id }}
										selected="selected" {{/if}}>{{$item2.st_option}}</option>
									{{/foreach}}
								</select>
								{{$item.bs_cou_sub_sta_date}}
							</form>
						</td>
						<td class="other-column">
							<textarea rows="4" cols="40" id="{{$item.bs_business_id}}" style="overflow-y: scroll;">{{$item.bs_what_is_holding}}</textarea>
							<div id="hold{{$item.bs_business_id}}">
								{{$item.bs_holding_user}}
								<br />
								{{$item.bs_holding_date}}
							</div>
							<script>
								$(document).ready(function () {
									$("#{{$item.bs_business_id}}").keyup(function () {
										update_holding_coo({{ $item.bs_business_id }}, this.value);
									});
								});
								function update_holding_coo(id, value) {
									var hold = '#hold' + id;
									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}cou_component_document_report.update_holding_coo/bs_business_id/" + id + "/value/" + value,
										success: function (result) {
											$(hold).html(result);
										}
									});
								}
							</script>
						</td>
						<td class="other-column">
							<form name="ca" method="post" enctype="multipart/form-data">
								<input type="hidden" name="bs_business_id" value="{{$item.bs_business_id}}" />
								<input type="file" name="compliance" /><br />
								{{if $item.bs_cou_comp_advice}}
								<div style="text-align:center;">
									<a href="/cou_component_document_report.download_content_we?file_name={{$item.bs_cou_comp_advice}}&module_name=cou_component_document_report.home"
										target="_blank">Download</a>

									<a href="{{$BASE_URL}}cou_component_document_report.delete_comp/bs_business_id/{{$item.bs_business_id}}"
										onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;"
										title="Delete"><img src="{{$BASE_URL}}/images/delete_icon.png"
											width="20" /></a>
									<br />{{if $item.bs_cou_comp_advice}}{{$item.bs_cou_comp_user}}<br />{{$item.bs_cou_comp_date}}
									{{/if}}
								</div> {{/if}}
								<input type="submit" name="save_compliance" title="Save" value="Upload"
									class="set2"> &nbsp;
							</form>

						</td>
						<td class="other-column">
							<form name="cal" method="post" enctype="multipart/form-data">
								<input type="hidden" name="bs_business_id" value="{{$item.bs_business_id}}" />
								<input type="file" name="weekly" /><br />
								{{if $item.bs_cou_weekly}}
								<div style="text-align:center;">
									<a href="/cou_component_document_report.download_content_we?file_name={{$item.bs_cou_weekly}}&module_name=cou_component_document_report.home" target="_blank">Download</a>
									<a href="{{$BASE_URL}}cou_component_document_report.delete_cal/bs_business_id/{{$item.bs_business_id}}"
										onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;"
										title="Delete"><img src="{{$BASE_URL}}/images/delete_icon.png"
											width="20" /></a>
									<br />{{if $item.bs_cou_weekly}}{{$item.bs_cou_weekly_user}}<br />{{$item.bs_cou_weekly_date}}
									{{/if}}
								</div> {{/if}}
								<input type="submit" name="save_weekly" title="Save" value="Upload" class="set2">
								&nbsp;
							</form>
						</td>
						<td class="other-column">
							<form name="recmet3" method="post" action="">
								<input type="hidden" name="letter_tobe[{{$item.bs_business_id}}]" value="0" />
								<label class="switch">
									<input class="switch-input" type="checkbox"
										name="letter_tobe[{{$item.bs_business_id}}]" value="1"
										onclick="this.form.submit();" {{if $item.bs_cou_letter_tobe eq 1 }}
										checked="checked" {{/if}}>
									<span class="switch-label" data-on="Yes" data-off="No"></span>
									<span class="switch-handle"></span> <br />
								</label>
							</form>
						</td>
						<td class="other-column">
							<select name="letter[{{$item.bs_business_id}}]"
								Onchange="update_letter({{$item.bs_business_id}},this.value)">
								<option value="">Please Select</option>
								{{foreach from=$letterData key="key2" item="item2"}}
								<option value="{{$item2.lt_code}}" {{if $item2.lt_code eq $item.bs_cou_letter_text}}
									selected="selected" {{/if}}>{{$item2.lt_code}}
								</option>
								{{/foreach}}
							</select>
							<div id="usr2{{$item.bs_business_id}}">
								{{$item.bs_cou_letter_text_date}}<br />{{$item.bs_cou_letter_text_user}} </div>
							<script>

								function update_letter(id, value) {
									var tana2 = "#usr2" + id;
									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}cou_component_document_report.update_lettertext/id/" + id + "/value/" + value,
										success: function (result) {
											$(tana2).html(result);
										}
									});
								}

							</script>
						</td>
						<td class="other-column">
							<textarea rows="4" cols="40" id="notes{{$item.bs_business_id}}"
								style="overflow-y: scroll;">{{$item.bs_cou_notes}}</textarea>
							<div id="cond{{$item.bs_business_id}}">{{$item.bs_cou_notes_user}}
								<br />{{$item.bs_cou_notes_date}} </div>

							<script>
								$(document).ready(function () {
									$("#notes{{$item.bs_business_id}}").keyup(function () {
										update_notes({{ $item.bs_business_id }}, this.value);
									});
								});
								function update_notes(id, value) {

									var cond = '#cond' + id;
									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}cou_component_document_report.update_notes/bs_business_id/" + id + "/value/" + value,
										success: function (result) {
											$(cond).html(result);
										}
									});
								}

							</script>

						</td>
						<td class="other-column" data-col="construction_alerts">
							<a href="{{$BASE_URL}}cou_component_document_report.view_construction_alert/bsn_id/{{$item.bsn_id}}"
								class="various">Construction Alert</a>
						</td>
						<td {{if $item.doc_file_name_172}} style="background:#00CC33;" {{elseif
							$item.doc_not_required_172 eq 0}} style="background:#F00;" {{else}}
							style="background:#999;" {{/if}} id="cond3{{$item.bsn_id}}">
							{{if $item.doc_file_name_172}}
							<a href="/cou_component_document_report.download_content?file_name={{$item.doc_file_name_172}}&module_name=cou_component_document_report.home">Download</a>
							{{else}}
								<select name="cou3[{{$item.bsn_id}}]"
									onChange="update_req_notreq_3({{$item.bsn_id}}, this.value)">
									<option value="0" {{if $item.doc_not_required_172 eq 0 }} selected="selected"
										{{/if}}>Required</option>
									<option value="1" {{if $item.doc_not_required_172 eq 1 }} selected="selected"
										{{/if}}>Not Required</option>
								</select>
								<script>
									function update_req_notreq_3(id, value) {
										var cond3 = '#cond3' + id;

										$.ajax({
											type: "GET",
											url: "{{$BASE_URL}}cou_component_document_report.update_req_notreq/bsn_id_3/" + id + "/value_3/" + value,
											success: function (result) {

												if (value == 0) {
													$(cond3).css("background", "#F00");
												} else {
													$(cond3).css("background", "#999");
												}
											}

										});
									}
								</script>
							{{/if}}
							<div style="margin-top: 15px;">
								{{foreach from=$item.suppliers_172 key="index" item="row"}}
									{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
									<p style="margin: 6px 0; padding: 0;">
										<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
									</p>
								{{/foreach}}
								<p style="margin: 0; padding: 0; margin-top: 10px;">
									<a href="/cou_component_document_report.include_suppliers/ccdr_bsn_id/{{$item.bsn_id}}/ccdr_doc_id/172" class="various">Include Suppliers</a>
								</p>
							</div>
						</td>
						<td {{if $item.doc_file_name_169}} style="background:#00CC33;" {{elseif
							$item.doc_not_required_169 eq 0}} style="background:#F00;" {{else}}
							style="background:#999;" {{/if}} id="cond4{{$item.bsn_id}}">
							{{if $item.doc_file_name_169}}
							<a href="/cou_component_document_report.download_content?file_name={{$item.doc_file_name_169}}&module_name=cou_component_document_report.home">Download</a>
							{{else}}
								<select name="cou4[{{$item.bsn_id}}]"
									onChange="update_req_notreq_4({{$item.bsn_id}}, this.value)">
									<option value="0" {{if $item.doc_not_required_169 eq 0 }} selected="selected"
										{{/if}}>Required</option>
									<option value="1" {{if $item.doc_not_required_169 eq 1 }} selected="selected"
										{{/if}}>Not Required</option>
								</select>
								<script>
									function update_req_notreq_4(id, value) {
										var cond4 = '#cond4' + id;

										$.ajax({
											type: "GET",
											url: "{{$BASE_URL}}cou_component_document_report.update_req_notreq/bsn_id_4/" + id + "/value_4/" + value,
											success: function (result) {

												if (value == 0) {
													$(cond4).css("background", "#F00");
												} else {
													$(cond4).css("background", "#999");
												}
											}

										});
									}
								</script>
							{{/if}}
							<div style="margin-top: 15px;">
								{{foreach from=$item.suppliers_169 key="index" item="row"}}
									{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
									<p style="margin: 6px 0; padding: 0;">
										<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
									</p>
								{{/foreach}}
								<p style="margin: 0; padding: 0; margin-top: 10px;">
									<a href="/cou_component_document_report.include_suppliers/ccdr_bsn_id/{{$item.bsn_id}}/ccdr_doc_id/169" class="various">Include Suppliers</a>
								</p>
							</div>
						</td>
						<td>
							<form name="recmet3" method="post" action="">
								<input type="hidden" name="application[{{$item.bsn_id}}]" value="0" />
								<label class="switch">
									<input class="switch-input" type="checkbox" name="application[{{$item.bsn_id}}]"
										value="1" onclick="this.form.submit();" {{if $item.bs_cou_application eq 1
										}} checked="checked" {{/if}}>
									<span class="switch-label" data-on="Yes" data-off="No"></span>
									<span class="switch-handle"></span> <br />
								</label>
							</form>
							{{if $item.bs_cou_application eq 1 }}
							{{$item.bs_cou_appl_date}}<br />{{$item.bs_cou_appl_user}} {{/if}}
						</td>							
						<td data-col="pier_inspection_certficate" style="background: {{ $item.doc_653_background }}" id="cond653_{{$item.bsn_id}}">
							{{ if $item.doc_file_name_653 }}
								<a href="/cou_component_document_report.download_content?file_name={{$item.doc_file_name_653}}&module_name=cou_component_document_report.home" target="_blank">Download</a>
							{{ else }}
								<select name="cou653[{{ $item.bsn_id }}]" onChange="update_req_notreq_653({{ $item.bsn_id }}, this.value)">
									<option value="0" {{if $item.doc_not_required_653 eq 0 }} selected="selected" {{/if}}>Required</option>
									<option value="1" {{if $item.doc_not_required_653 eq 1 }} selected="selected" {{/if}}>Not Required</option>
								</select>
							{{ /if }}
							<div style="margin-top: 15px;">
								{{foreach from=$item.suppliers_653 key="index" item="row"}}
									{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
									<p style="margin: 6px 0; padding: 0;">
										<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
									</p>
								{{/foreach}}
								<p style="margin: 0; padding: 0; margin-top: 10px;">
									<a href="/cou_component_document_report.include_suppliers/ccdr_bsn_id/{{$item.bsn_id}}/ccdr_doc_id/653" class="various">Include Suppliers</a>
								</p>
							</div>
						</td>
						<td data-col="survey_id_document" {{if $item.doc_file_name_261}} style="background:#00CC33;" {{elseif
							$item.doc_not_required_261 eq 0}} style="background:#F00;" {{else}}
							style="background:#999;" {{/if}} id="cond6{{$item.bsn_id}}">
							{{if $item.doc_file_name_261}}
							<a href="/cou_component_document_report.download_content?file_name={{$item.doc_file_name_261}}&module_name=cou_component_document_report.home">Download</a>
							{{else}}
							<select name="cou6[{{$item.bsn_id}}]"
								onChange="update_req_notreq_6({{$item.bsn_id}}, this.value)">
								<option value="0" {{if $item.doc_not_required_261 eq 0 }} selected="selected" {{/if}}>Required</option>
								<option value="1" {{if $item.doc_not_required_261 eq 1 }} selected="selected" {{/if}}>Not Required</option>
							</select>
							<script>
								function update_req_notreq_6(id, value) {
									var cond6 = '#cond6' + id;

									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}cou_component_document_report.update_req_notreq/bsn_id_6/" + id + "/value_6/" + value,
										success: function (result) {

											if (value == 0) {
												$(cond6).css("background", "#F00");
											} else {
												$(cond6).css("background", "#999");
											}
										}

									});
								}
							</script>
							{{/if}}
							<div style="margin-top: 15px;">
								{{foreach from=$item.suppliers_261 key="index" item="row"}}
									{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
									<p style="margin: 6px 0; padding: 0;">
										<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
									</p>
								{{/foreach}}
								<p style="margin: 0; padding: 0; margin-top: 10px;">
									<a href="/cou_component_document_report.include_suppliers/ccdr_bsn_id/{{$item.bsn_id}}/ccdr_doc_id/261" class="various">Include Suppliers</a>
								</p>
							</div>
						</td>
						<td {{if $item.doc_file_name_155}} style="background:#00CC33;" {{elseif
							$item.doc_not_required_155 eq 0}} style="background:#F00;" {{else}}
							style="background:#999;" {{/if}} id="cond7{{$item.bsn_id}}">
							{{if $item.doc_file_name_155}}
							<a href="/cou_component_document_report.download_content?file_name={{$item.doc_file_name_155}}&module_name=cou_component_document_report.home">Download</a>
							{{else}}
								<select name="cou7[{{$item.bsn_id}}]"
									onChange="update_req_notreq_7({{$item.bsn_id}}, this.value)">
									<option value="0" {{if $item.doc_not_required_155 eq 0 }} selected="selected"
										{{/if}}>Required</option>
									<option value="1" {{if $item.doc_not_required_155 eq 1 }} selected="selected"
										{{/if}}>Not Required</option>
								</select>
								<script>
									function update_req_notreq_7(id, value) {
										var cond7 = '#cond7' + id;
										$.ajax({
											type: "GET",
											url: "{{$BASE_URL}}cou_component_document_report.update_req_notreq/bsn_id_7/" + id + "/value_7/" + value,
											success: function (result) {
												if (value == 0) {
													$(cond7).css("background", "#F00");
												} else {
													$(cond7).css("background", "#999");
												}
											}
										});
									}
								</script>
							{{/if}}
							<div style="margin-top: 15px;">
								{{foreach from=$item.suppliers_155 key="index" item="row"}}
									{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
									<p style="margin: 6px 0; padding: 0;">
										<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
									</p>
								{{/foreach}}
								<p style="margin: 0; padding: 0; margin-top: 10px;">
									<a href="/cou_component_document_report.include_suppliers/ccdr_bsn_id/{{$item.bsn_id}}/ccdr_doc_id/155" class="various">Include Suppliers</a>
								</p>
							</div>
						</td>
						<td {{if $item.doc_file_name_295}} style="background:#00CC33;" {{elseif
							$item.doc_not_required_295 eq 0}} style="background:#F00;" {{else}}
							style="background:#999;" {{/if}} id="cond8{{$item.bsn_id}}">
							{{if $item.doc_file_name_295}}
							<a href="/cou_component_document_report.download_content?file_name={{$item.doc_file_name_295}}&module_name=cou_component_document_report.home">Download</a>
							{{else}}
								<select name="cou8[{{$item.bsn_id}}]"
									onChange="update_req_notreq_8({{$item.bsn_id}}, this.value)">
									<option value="0" {{if $item.doc_not_required_295 eq 0 }} selected="selected"
										{{/if}}>Required</option>
									<option value="1" {{if $item.doc_not_required_295 eq 1 }} selected="selected"
										{{/if}}>Not Required</option>
								</select>
								<script>
									function update_req_notreq_8(id, value) {
										var cond8 = '#cond8' + id;
										$.ajax({
											type: "GET",
											url: "{{$BASE_URL}}cou_component_document_report.update_req_notreq/bsn_id_8/" + id + "/value_8/" + value,
											success: function (result) {

												if (value == 0) {
													$(cond8).css("background", "#F00");
												} else {
													$(cond8).css("background", "#999");
												}
											}

										});
									}
								</script>
							{{/if}}
							<div style="margin-top: 15px;">
								{{foreach from=$item.suppliers_295 key="index" item="row"}}
									{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
									<p style="margin: 6px 0; padding: 0;">
										<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
									</p>
								{{/foreach}}
								<p style="margin: 0; padding: 0; margin-top: 10px;">
									<a href="/cou_component_document_report.include_suppliers/ccdr_bsn_id/{{$item.bsn_id}}/ccdr_doc_id/295" class="various">Include Suppliers</a>
								</p>
							</div>
						</td>
						<td {{if $item.doc_file_name_413}} style="background:#00CC33;" {{elseif
							$item.doc_not_required_413 eq 0}} style="background:#F00;" {{else}}
							style="background:#999;" {{/if}} id="cond9{{$item.bsn_id}}">
							{{if $item.doc_file_name_413}}
							<a href="/cou_component_document_report.download_content?file_name={{$item.doc_file_name_413}}&module_name=cou_component_document_report.home">Download</a>
							{{else}}
								<select name="cou9[{{$item.bsn_id}}]"
									onChange="update_req_notreq_9({{$item.bsn_id}}, this.value)">
									<option value="0" {{if $item.doc_not_required_413 eq 0 }} selected="selected"
										{{/if}}>Required</option>
									<option value="1" {{if $item.doc_not_required_413 eq 1 }} selected="selected"
										{{/if}}>Not Required</option>
								</select>
								<script>
									function update_req_notreq_9(id, value) {
										var cond9 = '#cond9' + id;
										$.ajax({
											type: "GET",
											url: "{{$BASE_URL}}cou_component_document_report.update_req_notreq/bsn_id_9/" + id + "/value_9/" + value,
											success: function (result) {
												if (value == 0) {
													$(cond9).css("background", "#F00");
												} else {
													$(cond9).css("background", "#999");
												}
											}
										});
									}
								</script>
							{{/if}}
							<div style="margin-top: 15px;">
								{{foreach from=$item.suppliers_413 key="index" item="row"}}
									{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
									<p style="margin: 6px 0; padding: 0;">
										<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
									</p>
								{{/foreach}}
								<p style="margin: 0; padding: 0; margin-top: 10px;">
									<a href="/cou_component_document_report.include_suppliers/ccdr_bsn_id/{{$item.bsn_id}}/ccdr_doc_id/413" class="various">Include Suppliers</a>
								</p>
							</div>
						</td>
						<td {{if $item.doc_file_name_156}} style="background:#00CC33;" {{elseif
							$item.doc_not_required_156 eq 0}} style="background:#F00;" {{else}}
							style="background:#999;" {{/if}} id="cond10{{$item.bsn_id}}">
							{{if $item.doc_file_name_156}}
							<a href="/cou_component_document_report.download_content?file_name={{$item.doc_file_name_156}}&module_name=cou_component_document_report.home">Download</a>
							{{else}}
								<select name="cou10[{{$item.bsn_id}}]"
									onChange="update_req_notreq_10({{$item.bsn_id}}, this.value)">
									<option value="0" {{if $item.doc_not_required_156 eq 0 }} selected="selected"
										{{/if}}>Required</option>
									<option value="1" {{if $item.doc_not_required_156 eq 1 }} selected="selected"
										{{/if}}>Not Required</option>
								</select>
								<script>
									function update_req_notreq_10(id, value) {
										var cond10 = '#cond10' + id;
										$.ajax({
											type: "GET",
											url: "{{$BASE_URL}}cou_component_document_report.update_req_notreq/bsn_id_10/" + id + "/value_10/" + value,
											success: function (result) {
												if (value == 0) {
													$(cond10).css("background", "#F00");
												} else {
													$(cond10).css("background", "#999");
												}
											}
										});
									}
								</script>
							{{/if}}
							<div style="margin-top: 15px;">
								{{foreach from=$item.suppliers_156 key="index" item="row"}}
									{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
									<p style="margin: 6px 0; padding: 0;">
										<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
									</p>
								{{/foreach}}
								<p style="margin: 0; padding: 0; margin-top: 10px;">
									<a href="/cou_component_document_report.include_suppliers/ccdr_bsn_id/{{$item.bsn_id}}/ccdr_doc_id/156" class="various">Include Suppliers</a>
								</p>
							</div>
						</td>
						<td {{if $item.doc_file_name_735}} style="background:#00CC33;" {{elseif
							$item.doc_not_required_735 eq 0}} style="background:#F00;" {{else}}
							style="background:#999;" {{/if}} id="cond21{{$item.bsn_id}}">
							{{if $item.doc_file_name_735}}
							<a href="/cou_component_document_report.download_content?file_name={{$item.doc_file_name_735}}&module_name=cou_component_document_report.home">Download</a>
							{{else}}
								<select name="cou21[{{$item.bsn_id}}]"
									onChange="update_req_notreq_21({{$item.bsn_id}}, this.value)">
									<option value="0" {{if $item.doc_not_required_735 eq 0 }} selected="selected"
										{{/if}}>Required</option>
									<option value="1" {{if $item.doc_not_required_735 eq 1 }} selected="selected"
										{{/if}}>Not Required</option>
								</select>
								<script>
									function update_req_notreq_21(id, value) {
										var cond21 = '#cond21' + id;
										$.ajax({
											type: "GET",
											url: "{{$BASE_URL}}cou_component_document_report.update_req_notreq/bsn_id_21/" + id + "/value_21/" + value,
											success: function (result) {
												if (value == 0) {
													$(cond21).css("background", "#F00");
												} else {
													$(cond21).css("background", "#999");
												}
											}
										});
									}
								</script>
							{{/if}}
							<div style="margin-top: 15px;">
								{{foreach from=$item.suppliers_735 key="index" item="row"}}
									{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
									<p style="margin: 6px 0; padding: 0;">
										<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
									</p>
								{{/foreach}}
								<p style="margin: 0; padding: 0; margin-top: 10px;">
									<a href="/cou_component_document_report.include_suppliers/ccdr_bsn_id/{{$item.bsn_id}}/ccdr_doc_id/735" class="various">Include Suppliers</a>
								</p>
							</div>
						</td>
						<td {{if $item.doc_file_name_736}} style="background:#00CC33;" {{elseif
							$item.doc_not_required_736 eq 0}} style="background:#F00;" {{else}}
							style="background:#999;" {{/if}} id="cond22{{$item.bsn_id}}">
							{{if $item.doc_file_name_736}}
							<a href="/cou_component_document_report.download_content?file_name={{$item.doc_file_name_736}}&module_name=cou_component_document_report.home">Download</a>
							{{else}}
								<select name="cou22[{{$item.bsn_id}}]"
									onChange="update_req_notreq_22({{$item.bsn_id}}, this.value)">
									<option value="0" {{if $item.doc_not_required_736 eq 0 }} selected="selected"
										{{/if}}>Required</option>
									<option value="1" {{if $item.doc_not_required_736 eq 1 }} selected="selected"
										{{/if}}>Not Required</option>
								</select>
								<script>
									function update_req_notreq_22(id, value) {
										var cond22 = '#cond22' + id;
										$.ajax({
											type: "GET",
											url: "{{$BASE_URL}}cou_component_document_report.update_req_notreq/bsn_id_22/" + id + "/value_22/" + value,
											success: function (result) {
												if (value == 0) {
													$(cond22).css("background", "#F00");
												} else {
													$(cond22).css("background", "#999");
												}
											}
										});
									}
								</script>
							{{/if}}
							<div style="margin-top: 15px;">
								{{foreach from=$item.suppliers_736 key="index" item="row"}}
									{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
									<p style="margin: 6px 0; padding: 0;">
										<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
									</p>
								{{/foreach}}
								<p style="margin: 0; padding: 0; margin-top: 10px;">
									<a href="/cou_component_document_report.include_suppliers/ccdr_bsn_id/{{$item.bsn_id}}/ccdr_doc_id/736" class="various">Include Suppliers</a>
								</p>
							</div>
						</td>
						<td {{if $item.doc_file_name_737}} style="background:#00CC33;" {{elseif
							$item.doc_not_required_737 eq 0}} style="background:#F00;" {{else}}
							style="background:#999;" {{/if}} id="cond26{{$item.bsn_id}}">
							{{if $item.doc_file_name_737}}
							<a href="/cou_component_document_report.download_content?file_name={{$item.doc_file_name_737}}&module_name=cou_component_document_report.home">Download</a>
							{{else}}
								<select name="cou26[{{$item.bsn_id}}]"
									onChange="update_req_notreq_26({{$item.bsn_id}}, this.value)">
									<option value="0" {{if $item.doc_not_required_737 eq 0 }} selected="selected"
										{{/if}}>Required</option>
									<option value="1" {{if $item.doc_not_required_737 eq 1 }} selected="selected"
										{{/if}}>Not Required</option>
								</select>
								<script>
									function update_req_notreq_26(id, value) {
										var cond26 = '#cond26' + id;
										$.ajax({
											type: "GET",
											url: "{{$BASE_URL}}cou_component_document_report.update_req_notreq/bsn_id_26/" + id + "/value_26/" + value,
											success: function (result) {
												if (value == 0) {
													$(cond26).css("background", "#F00");
												} else {
													$(cond26).css("background", "#999");
												}
											}
										});
									}
								</script>
							{{/if}}
							<div style="margin-top: 15px;">
								{{foreach from=$item.suppliers_737 key="index" item="row"}}
									{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
									<p style="margin: 6px 0; padding: 0;">
										<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
									</p>
								{{/foreach}}
								<p style="margin: 0; padding: 0; margin-top: 10px;">
									<a href="/cou_component_document_report.include_suppliers/ccdr_bsn_id/{{$item.bsn_id}}/ccdr_doc_id/737" class="various">Include Suppliers</a>
								</p>
							</div>
						</td>
						<td {{if $item.doc_file_name_738}} style="background:#00CC33;" {{elseif
							$item.doc_not_required_738 eq 0}} style="background:#F00;" {{else}}
							style="background:#999;" {{/if}} id="cond23{{$item.bsn_id}}">
							{{if $item.doc_file_name_738}}
							<a href="/cou_component_document_report.download_content?file_name={{$item.doc_file_name_738}}&module_name=cou_component_document_report.home">Download</a>
							{{else}}
								<select name="cou23[{{$item.bsn_id}}]"
									onChange="update_req_notreq_23({{$item.bsn_id}}, this.value)">
									<option value="0" {{if $item.doc_not_required_738 eq 0 }} selected="selected"
										{{/if}}>Required</option>
									<option value="1" {{if $item.doc_not_required_738 eq 1 }} selected="selected"
										{{/if}}>Not Required</option>
								</select>
								<script>
									function update_req_notreq_23(id, value) {
										var cond23 = '#cond23' + id;
										$.ajax({
											type: "GET",
											url: "{{$BASE_URL}}cou_component_document_report.update_req_notreq/bsn_id_23/" + id + "/value_23/" + value,
											success: function (result) {
												if (value == 0) {
													$(cond23).css("background", "#F00");
												} else {
													$(cond23).css("background", "#999");
												}
											}
										});
									}
								</script>
							{{/if}}
							<div style="margin-top: 15px;">
								{{foreach from=$item.suppliers_738 key="index" item="row"}}
									{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
									<p style="margin: 6px 0; padding: 0;">
										<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
									</p>
								{{/foreach}}
								<p style="margin: 0; padding: 0; margin-top: 10px;">
									<a href="/cou_component_document_report.include_suppliers/ccdr_bsn_id/{{$item.bsn_id}}/ccdr_doc_id/738" class="various">Include Suppliers</a>
								</p>
							</div>
						</td>
						<td {{if $item.doc_file_name_289}} style="background:#00CC33;" {{elseif
							$item.doc_not_required_289 eq 0}} style="background:#F00;" {{else}}
							style="background:#999;" {{/if}} id="cond11{{$item.bsn_id}}">
							{{if $item.doc_file_name_289}}
							<a href="/cou_component_document_report.download_content?file_name={{$item.doc_file_name_289}}&module_name=cou_component_document_report.home">Download</a>
							{{else}}
								<select name="cou11[{{$item.bsn_id}}]"
									onChange="update_req_notreq_11({{$item.bsn_id}}, this.value)">
									<option value="0" {{if $item.doc_not_required_289 eq 0 }} selected="selected"
										{{/if}}>Required</option>
									<option value="1" {{if $item.doc_not_required_289 eq 1 }} selected="selected"
										{{/if}}>Not Required</option>
								</select>
								<script>
									function update_req_notreq_11(id, value) {
										var cond11 = '#cond11' + id;
										$.ajax({
											type: "GET",
											url: "{{$BASE_URL}}cou_component_document_report.update_req_notreq/bsn_id_11/" + id + "/value_11/" + value,
											success: function (result) {
												if (value == 0) {
													$(cond11).css("background", "#F00");
												} else {
													$(cond11).css("background", "#999");
												}
											}
										});
									}
								</script>
							{{/if}}
							<div style="margin-top: 15px;">
								{{foreach from=$item.suppliers_289 key="index" item="row"}}
									{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
									<p style="margin: 6px 0; padding: 0;">
										<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
									</p>
								{{/foreach}}
								<p style="margin: 0; padding: 0; margin-top: 10px;">
									<a href="/cou_component_document_report.include_suppliers/ccdr_bsn_id/{{$item.bsn_id}}/ccdr_doc_id/289" class="various">Include Suppliers</a>
								</p>
							</div>
						</td>
						<td {{if $item.doc_file_name_162}} style="background:#00CC33;" {{elseif
							$item.doc_not_required_162 eq 0}} style="background:#F00;" {{else}}
							style="background:#999;" {{/if}} id="cond12{{$item.bsn_id}}">
							{{if $item.doc_file_name_162}}
							<a href="/cou_component_document_report.download_content?file_name={{$item.doc_file_name_162}}&module_name=cou_component_document_report.home">Download</a>
							{{else}}
								<select name="cou12[{{$item.bsn_id}}]"
									onChange="update_req_notreq_12({{$item.bsn_id}}, this.value)">
									<option value="0" {{if $item.doc_not_required_162 eq 0 }} selected="selected"
										{{/if}}>Required</option>
									<option value="1" {{if $item.doc_not_required_162 eq 1 }} selected="selected"
										{{/if}}>Not Required</option>
								</select>
								<script>
									function update_req_notreq_12(id, value) {
										var cond12 = '#cond12' + id;

										$.ajax({
											type: "GET",
											url: "{{$BASE_URL}}cou_component_document_report.update_req_notreq/bsn_id_12/" + id + "/value_12/" + value,
											success: function (result) {

												if (value == 0) {
													$(cond12).css("background", "#F00");
												} else {
													$(cond12).css("background", "#999");
												}
											}

										});
									}
								</script>
							{{/if}}
							<div style="margin-top: 15px;">
								{{foreach from=$item.suppliers_162 key="index" item="row"}}
									{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
									<p style="margin: 6px 0; padding: 0;">
										<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
									</p>
								{{/foreach}}
								<p style="margin: 0; padding: 0; margin-top: 10px;">
									<a href="/cou_component_document_report.include_suppliers/ccdr_bsn_id/{{$item.bsn_id}}/ccdr_doc_id/162" class="various">Include Suppliers</a>
								</p>
							</div>
						</td>
						<td {{if $item.doc_file_name_163}} style="background:#00CC33;" {{elseif
							$item.doc_not_required_163 eq 0}} style="background:#F00;" {{else}}
							style="background:#999;" {{/if}} id="cond13{{$item.bsn_id}}">
							{{if $item.doc_file_name_163}}
							<a href="/cou_component_document_report.download_content?file_name={{$item.doc_file_name_163}}&module_name=cou_component_document_report.home">Download</a>
							{{else}}
								<select name="cou13[{{$item.bsn_id}}]"
									onChange="update_req_notreq_13({{$item.bsn_id}}, this.value)">
									<option value="0" {{if $item.doc_not_required_163 eq 0 }} selected="selected"
										{{/if}}>Required</option>
									<option value="1" {{if $item.doc_not_required_163 eq 1 }} selected="selected"
										{{/if}}>Not Required</option>
								</select>
								<script>
									function update_req_notreq_13(id, value) {
										var cond13 = '#cond13' + id;

										$.ajax({
											type: "GET",
											url: "{{$BASE_URL}}cou_component_document_report.update_req_notreq/bsn_id_13/" + id + "/value_13/" + value,
											success: function (result) {

												if (value == 0) {
													$(cond13).css("background", "#F00");
												} else {
													$(cond13).css("background", "#999");
												}
											}

										});
									}
								</script>
							{{/if}}
							<div style="margin-top: 15px;">
								{{foreach from=$item.suppliers_163 key="index" item="row"}}
									{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
									<p style="margin: 6px 0; padding: 0;">
										<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
									</p>
								{{/foreach}}
								<p style="margin: 0; padding: 0; margin-top: 10px;">
									<a href="/cou_component_document_report.include_suppliers/ccdr_bsn_id/{{$item.bsn_id}}/ccdr_doc_id/163" class="various">Include Suppliers</a>
								</p>
							</div>
						</td>
						<td {{if $item.doc_file_name_296}} style="background:#00CC33;" {{elseif
							$item.doc_not_required_296 eq 0}} style="background:#F00;" {{else}}
							style="background:#999;" {{/if}} id="cond14{{$item.bsn_id}}">
							{{if $item.doc_file_name_296}}
							<a href="/cou_component_document_report.download_content?file_name={{$item.doc_file_name_296}}&module_name=cou_component_document_report.home">Download</a>
							{{else}}
								<select name="cou14[{{$item.bsn_id}}]"
									onChange="update_req_notreq_14({{$item.bsn_id}}, this.value)">
									<option value="0" {{if $item.doc_not_required_296 eq 0 }} selected="selected"
										{{/if}}>Required</option>
									<option value="1" {{if $item.doc_not_required_296 eq 1 }} selected="selected"
										{{/if}}>Not Required</option>
								</select>
								<script>
									function update_req_notreq_14(id, value) {
										var cond14 = '#cond14' + id;

										$.ajax({
											type: "GET",
											url: "{{$BASE_URL}}cou_component_document_report.update_req_notreq/bsn_id_14/" + id + "/value_14/" + value,
											success: function (result) {

												if (value == 0) {
													$(cond14).css("background", "#F00");
												} else {
													$(cond14).css("background", "#999");
												}
											}

										});
									}
								</script>
							{{/if}}
							<div style="margin-top: 15px;">
								{{foreach from=$item.suppliers_296 key="index" item="row"}}
									{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
									<p style="margin: 6px 0; padding: 0;">
										<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
									</p>
								{{/foreach}}
								<p style="margin: 0; padding: 0; margin-top: 10px;">
									<a href="/cou_component_document_report.include_suppliers/ccdr_bsn_id/{{$item.bsn_id}}/ccdr_doc_id/296" class="various">Include Suppliers</a>
								</p>
							</div>
						</td>
						<td {{if $item.doc_file_name_713}} style="background:#00CC33;" {{elseif
							$item.doc_not_required_713 eq 0}} style="background:#F00;" {{else}}
							style="background:#999;" {{/if}} id="cond24{{$item.bsn_id}}">
							{{if $item.doc_file_name_713}}
							<a href="/cou_component_document_report.download_content?file_name={{$item.doc_file_name_713}}&module_name=cou_component_document_report.home">Download</a>
							{{else}}
								<select name="cou24[{{$item.bsn_id}}]"
									onChange="update_req_notreq_24({{$item.bsn_id}}, this.value)">
									<option value="0" {{if $item.doc_not_required_713 eq 0 }} selected="selected"
										{{/if}}>Required</option>
									<option value="1" {{if $item.doc_not_required_713 eq 1 }} selected="selected"
										{{/if}}>Not Required</option>
								</select>
								<script>
									function update_req_notreq_24(id, value) {
										var cond24 = '#cond24' + id;

										$.ajax({
											type: "GET",
											url: "{{$BASE_URL}}cou_component_document_report.update_req_notreq/bsn_id_24/" + id + "/value_24/" + value,
											success: function (result) {

												if (value == 0) {
													$(cond24).css("background", "#F00");
												} else {
													$(cond24).css("background", "#999");
												}
											}

										});
									}
								</script>
							{{/if}}
							<div style="margin-top: 15px;">
								{{foreach from=$item.suppliers_713 key="index" item="row"}}
									{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
									<p style="margin: 6px 0; padding: 0;">
										<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
									</p>
								{{/foreach}}
								<p style="margin: 0; padding: 0; margin-top: 10px;">
									<a href="/cou_component_document_report.include_suppliers/ccdr_bsn_id/{{$item.bsn_id}}/ccdr_doc_id/713" class="various">Include Suppliers</a>
								</p>
							</div>
						</td>
						<td {{if $item.doc_file_name_714}} style="background:#00CC33;" {{elseif
							$item.doc_not_required_714 eq 0}} style="background:#F00;" {{else}}
							style="background:#999;" {{/if}} id="cond25{{$item.bsn_id}}">
							{{if $item.doc_file_name_714}}
							<a href="/cou_component_document_report.download_content?file_name={{$item.doc_file_name_714}}&module_name=cou_component_document_report.home">Download</a>
							{{else}}
								<select name="cou25[{{$item.bsn_id}}]"
									onChange="update_req_notreq_25({{$item.bsn_id}}, this.value)">
									<option value="0" {{if $item.doc_not_required_714 eq 0 }} selected="selected"
										{{/if}}>Required</option>
									<option value="1" {{if $item.doc_not_required_714 eq 1 }} selected="selected"
										{{/if}}>Not Required</option>
								</select>
								<script>
									function update_req_notreq_25(id, value) {
										var cond25 = '#cond25' + id;

										$.ajax({
											type: "GET",
											url: "{{$BASE_URL}}cou_component_document_report.update_req_notreq/bsn_id_25/" + id + "/value_25/" + value,
											success: function (result) {

												if (value == 0) {
													$(cond25).css("background", "#F00");
												} else {
													$(cond25).css("background", "#999");
												}
											}

										});
									}
								</script>
							{{/if}}
							<div style="margin-top: 15px;">
								{{foreach from=$item.suppliers_714 key="index" item="row"}}
									{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
									<p style="margin: 6px 0; padding: 0;">
										<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
									</p>
								{{/foreach}}
								<p style="margin: 0; padding: 0; margin-top: 10px;">
									<a href="/cou_component_document_report.include_suppliers/ccdr_bsn_id/{{$item.bsn_id}}/ccdr_doc_id/714" class="various">Include Suppliers</a>
								</p>
							</div>
						</td>
						<td {{if $item.doc_file_name_739}} style="background:#00CC33;" {{elseif
							$item.doc_not_required_739 eq 0}} style="background:#F00;" {{else}}
							style="background:#999;" {{/if}} id="cond28{{$item.bsn_id}}">
							{{if $item.doc_file_name_739}}
							<a href="/cou_component_document_report.download_content?file_name={{$item.doc_file_name_739}}&module_name=cou_component_document_report.home">Download</a>
							{{else}}
								<select name="cou28[{{$item.bsn_id}}]"
									onChange="update_req_notreq_28({{$item.bsn_id}}, this.value)">
									<option value="0" {{if $item.doc_not_required_739 eq 0 }} selected="selected"
										{{/if}}>Required</option>
									<option value="1" {{if $item.doc_not_required_739 eq 1 }} selected="selected"
										{{/if}}>Not Required</option>
								</select>
								<script>
									function update_req_notreq_28(id, value) {
										var cond28 = '#cond28' + id;

										$.ajax({
											type: "GET",
											url: "{{$BASE_URL}}cou_component_document_report.update_req_notreq/bsn_id_28/" + id + "/value_28/" + value,
											success: function (result) {

												if (value == 0) {
													$(cond28).css("background", "#F00");
												} else {
													$(cond28).css("background", "#999");
												}
											}

										});
									}
								</script>
							{{/if}}
							<div style="margin-top: 15px;">
								{{foreach from=$item.suppliers_739 key="index" item="row"}}
									{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
									<p style="margin: 6px 0; padding: 0;">
										<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
									</p>
								{{/foreach}}
								<p style="margin: 0; padding: 0; margin-top: 10px;">
									<a href="/cou_component_document_report.include_suppliers/ccdr_bsn_id/{{$item.bsn_id}}/ccdr_doc_id/739" class="various">Include Suppliers</a>
								</p>
							</div>
						</td>
						<td {{if $item.doc_file_name_274}} style="background:#00CC33;" {{elseif
							$item.doc_not_required_274 eq 0}} style="background:#F00;" {{else}}
							style="background:#999;" {{/if}} id="cond17{{$item.bsn_id}}">
							{{if $item.doc_file_name_274}}
							<a href="/cou_component_document_report.download_content?file_name={{$item.doc_file_name_274}}&module_name=cou_component_document_report.home">Download</a>
							{{else}}
								<select name="cou17[{{$item.bsn_id}}]"
									onChange="update_req_notreq_17({{$item.bsn_id}}, this.value)">
									<option value="0" {{if $item.doc_not_required_274 eq 0 }} selected="selected"
										{{/if}}>Required</option>
									<option value="1" {{if $item.doc_not_required_274 eq 1 }} selected="selected"
										{{/if}}>Not Required</option>
								</select>
								<script>
									function update_req_notreq_17(id, value) {
										var cond17 = '#cond17' + id;

										$.ajax({
											type: "GET",
											url: "{{$BASE_URL}}cou_component_document_report.update_req_notreq/bsn_id_17/" + id + "/value_17/" + value,
											success: function (result) {

												if (value == 0) {
													$(cond17).css("background", "#F00");
												} else {
													$(cond17).css("background", "#999");
												}
											}

										});
									}
								</script>
							{{/if}}
							<div style="margin-top: 15px;">
								{{foreach from=$item.suppliers_274 key="index" item="row"}}
									{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
									<p style="margin: 6px 0; padding: 0;">
										<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
									</p>
								{{/foreach}}
								<p style="margin: 0; padding: 0; margin-top: 10px;">
									<a href="/cou_component_document_report.include_suppliers/ccdr_bsn_id/{{$item.bsn_id}}/ccdr_doc_id/274" class="various">Include Suppliers</a>
								</p>
							</div>
						</td>
						<td {{if $item.doc_file_name_294}} style="background:#00CC33;" {{elseif
							$item.doc_not_required_294 eq 0}} style="background:#F00;" {{else}}
							style="background:#999;" {{/if}} id="cond15{{$item.bsn_id}}">
							{{if $item.doc_file_name_294}}
							<a href="/cou_component_document_report.download_content?file_name={{$item.doc_file_name_294}}&module_name=cou_component_document_report.home">Download</a>
							{{else}}
								<select name="cou15[{{$item.bsn_id}}]"
									onChange="update_req_notreq_15({{$item.bsn_id}}, this.value)">
									<option value="0" {{if $item.doc_not_required_294 eq 0 }} selected="selected"
										{{/if}}>Required</option>
									<option value="1" {{if $item.doc_not_required_294 eq 1 }} selected="selected"
										{{/if}}>Not Required</option>
								</select>
								<script>
									function update_req_notreq_15(id, value) {
										var cond15 = '#cond15' + id;

										$.ajax({
											type: "GET",
											url: "{{$BASE_URL}}cou_component_document_report.update_req_notreq/bsn_id_15/" + id + "/value_15/" + value,
											success: function (result) {

												if (value == 0) {
													$(cond15).css("background", "#F00");
												} else {
													$(cond15).css("background", "#999");
												}
											}

										});
									}
								</script>
							{{/if}}
							<div style="margin-top: 15px;">
								{{foreach from=$item.suppliers_294 key="index" item="row"}}
									{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
									<p style="margin: 6px 0; padding: 0;">
										<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
									</p>
								{{/foreach}}
								<p style="margin: 0; padding: 0; margin-top: 10px;">
									<a href="/cou_component_document_report.include_suppliers/ccdr_bsn_id/{{$item.bsn_id}}/ccdr_doc_id/294" class="various">Include Suppliers</a>
								</p>
							</div>
						</td>
						<td {{if $item.doc_file_name_167}} style="background:#00CC33;" {{elseif
							$item.doc_not_required_167 eq 0}} style="background:#F00;" {{else}}
							style="background:#999;" {{/if}} id="cond16{{$item.bsn_id}}">
							{{if $item.doc_file_name_167}}
							<a href="/cou_component_document_report.download_content?file_name={{$item.doc_file_name_167}}&module_name=cou_component_document_report.home">Download</a>
							{{else}}
								<select name="cou16[{{$item.bsn_id}}]"
									onChange="update_req_notreq_16({{$item.bsn_id}}, this.value)">
									<option value="0" {{if $item.doc_not_required_167 eq 0 }} selected="selected"
										{{/if}}>Required</option>
									<option value="1" {{if $item.doc_not_required_167 eq 1 }} selected="selected"
										{{/if}}>Not Required</option>
								</select>
								<script>
									function update_req_notreq_16(id, value) {
										var cond16 = '#cond16' + id;

										$.ajax({
											type: "GET",
											url: "{{$BASE_URL}}cou_component_document_report.update_req_notreq/bsn_id_16/" + id + "/value_16/" + value,
											success: function (result) {

												if (value == 0) {
													$(cond16).css("background", "#F00");
												} else {
													$(cond16).css("background", "#999");
												}
											}

										});
									}
								</script>
							{{/if}}
							<div style="margin-top: 15px;">
								{{foreach from=$item.suppliers_167 key="index" item="row"}}
									{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
									<p style="margin: 6px 0; padding: 0;">
										<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
									</p>
								{{/foreach}}
								<p style="margin: 0; padding: 0; margin-top: 10px;">
									<a href="/cou_component_document_report.include_suppliers/ccdr_bsn_id/{{$item.bsn_id}}/ccdr_doc_id/167" class="various">Include Suppliers</a>
								</p>
							</div>
						</td>
						<td {{if $item.doc_file_name_318}} style="background:#00CC33;" {{elseif
							$item.doc_not_required_318 eq 0}} style="background:#F00;" {{else}}
							style="background:#999;" {{/if}} id="cond30{{$item.bsn_id}}">
							{{if $item.doc_file_name_318}}
							<a href="/cou_component_document_report.download_content?file_name={{$item.doc_file_name_318}}&module_name=cou_component_document_report.home">Download</a>
							{{else}}
								<select name="cou30[{{$item.bsn_id}}]"
									onChange="update_req_notreq_30({{$item.bsn_id}}, this.value)">
									<option value="0" {{if $item.doc_not_required_318 eq 0 }} selected="selected"
										{{/if}}>Required</option>
									<option value="1" {{if $item.doc_not_required_318 eq 1 }} selected="selected"
										{{/if}}>Not Required</option>
								</select>
								<script>
									function update_req_notreq_30(id, value) {

										var cond30 = '#cond30' + id;

										$.ajax({
											type: "GET",
											url: "{{$BASE_URL}}cou_component_document_report.update_req_notreq/bsn_id_30/" + id + "/value_30/" + value,
											success: function (result) {

												if (value == 0) {
													$(cond30).css("background", "#F00");
												} else {
													$(cond30).css("background", "#999");
												}
											}

										});
									}
								</script>
							{{/if}}
							<div style="margin-top: 15px;">
								{{foreach from=$item.suppliers_318 key="index" item="row"}}
									{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
									<p style="margin: 6px 0; padding: 0;">
										<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
									</p>
								{{/foreach}}
								<p style="margin: 0; padding: 0; margin-top: 10px;">
									<a href="/cou_component_document_report.include_suppliers/ccdr_bsn_id/{{$item.bsn_id}}/ccdr_doc_id/318" class="various">Include Suppliers</a>
								</p>
							</div>
						</td>
						<td {{if $item.doc_file_name_749}} style="background:#00CC33;" {{elseif
							$item.doc_not_required_749 eq 0}} style="background:#F00;" {{else}}
							style="background:#999;" {{/if}} id="cond29{{$item.bsn_id}}">
							{{if $item.doc_file_name_749}}
							<a href="/cou_component_document_report.download_content?file_name={{$item.doc_file_name_749}}&module_name=cou_component_document_report.home">Download</a>
							{{else}}
								<select name="cou29{{$item.bsn_id}}]"
									onChange="update_req_notreq_29({{$item.bsn_id}}, this.value)">
									<option value="0" {{if $item.doc_not_required_749 eq 0 }} selected="selected"
										{{/if}}>Required</option>
									<option value="1" {{if $item.doc_not_required_749 eq 1 }} selected="selected"
										{{/if}}>Not Required</option>
								</select>
								<script>
									function update_req_notreq_29(id, value) {

										var cond29 = '#cond29' + id;

										$.ajax({
											type: "GET",
											url: "{{$BASE_URL}}cou_component_document_report.update_req_notreq/bsn_id_29/" + id + "/value_29/" + value,
											success: function (result) {

												if (value == 0) {
													$(cond29).css("background", "#F00");
												} else {
													$(cond29).css("background", "#999");
												}
											}

										});
									}
								</script>
							{{/if}}
							<div style="margin-top: 15px;">
								{{foreach from=$item.suppliers_749 key="index" item="row"}}
									{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
									<p style="margin: 6px 0; padding: 0;">
										<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
									</p>
								{{/foreach}}
								<p style="margin: 0; padding: 0; margin-top: 10px;">
									<a href="/cou_component_document_report.include_suppliers/ccdr_bsn_id/{{$item.bsn_id}}/ccdr_doc_id/749" class="various">Include Suppliers</a>
								</p>
							</div>
						</td>
						<td {{if $item.doc_file_name_626}} style="background:#00CC33;" {{elseif
							$item.doc_not_required_626 eq 0}} style="background:#F00;" {{else}}
							style="background:#999;" {{/if}} id="cond27{{$item.bsn_id}}">
							{{if $item.doc_file_name_626}}
							<a href="/cou_component_document_report.download_content?file_name={{$item.doc_file_name_626}}&module_name=cou_component_document_report.home">Download</a>
							{{else}}
								<select name="cou27{{$item.bsn_id}}]"
									onChange="update_req_notreq_27({{$item.bsn_id}}, this.value)">
									<option value="0" {{if $item.doc_not_required_626 eq 0 }} selected="selected"
										{{/if}}>Required</option>
									<option value="1" {{if $item.doc_not_required_626 eq 1 }} selected="selected"
										{{/if}}>Not Required</option>
								</select>
								<script>
									function update_req_notreq_27(id, value) {
										var cond27 = '#cond27' + id;

										$.ajax({
											type: "GET",
											url: "{{$BASE_URL}}cou_component_document_report.update_req_notreq/bsn_id_27/" + id + "/value_27/" + value,
											success: function (result) {

												if (value == 0) {
													$(cond27).css("background", "#F00");
												} else {
													$(cond27).css("background", "#999");
												}
											}

										});
									}
								</script>
							{{/if}}
							<div style="margin-top: 15px;">
								{{foreach from=$item.suppliers_626 key="index" item="row"}}
									{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
									<p style="margin: 6px 0; padding: 0;">
										<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
									</p>
								{{/foreach}}
								<p style="margin: 0; padding: 0; margin-top: 10px;">
									<a href="/cou_component_document_report.include_suppliers/ccdr_bsn_id/{{$item.bsn_id}}/ccdr_doc_id/626" class="various">Include Suppliers</a>
								</p>
							</div>
						</td>
						<td {{if $item.doc_file_name_691}} style="background:#00CC33;" {{elseif
							$item.doc_not_required_691 eq 0}} style="background:#F00;" {{else}}
							style="background:#999;" {{/if}} id="cond19{{$item.bsn_id}}">
							{{if $item.doc_file_name_691}}
							<a href="/cou_component_document_report.download_content?file_name={{$item.doc_file_name_691}}&module_name=cou_component_document_report.home">Download</a>
							{{else}}
								<select name="cou19[{{$item.bsn_id}}]"
									onChange="update_req_notreq_19({{$item.bsn_id}}, this.value)">
									<option value="0" {{if $item.doc_not_required_691 eq 0 }} selected="selected"
										{{/if}}>Required</option>
									<option value="1" {{if $item.doc_not_required_691 eq 1 }} selected="selected"
										{{/if}}>Not Required</option>
								</select>
								<script>
									function update_req_notreq_19(id, value) {
										var cond19 = '#cond19' + id;

										$.ajax({
											type: "GET",
											url: "{{$BASE_URL}}cou_component_document_report.update_req_notreq/bsn_id_19/" + id + "/value_19/" + value,
											success: function (result) {

												if (value == 0) {
													$(cond19).css("background", "#F00");
												} else {
													$(cond19).css("background", "#999");
												}
											}

										});
									}
								</script>
							{{/if}}
							<div style="margin-top: 15px;">
								{{foreach from=$item.suppliers_691 key="index" item="row"}}
									{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
									<p style="margin: 6px 0; padding: 0;">
										<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
									</p>
								{{/foreach}}
								<p style="margin: 0; padding: 0; margin-top: 10px;">
									<a href="/cou_component_document_report.include_suppliers/ccdr_bsn_id/{{$item.bsn_id}}/ccdr_doc_id/691" class="various">Include Suppliers</a>
								</p>
							</div>
						</td>
						<td {{if $item.doc_file_name_637}} style="background:#00CC33;" {{elseif
							$item.doc_not_required_637 eq 0}} style="background:#F00;" {{else}}
							style="background:#999;" {{/if}} id="cond19{{$item.bsn_id}}">
							{{if $item.doc_file_name_637}}
							<a href="/cou_component_document_report.download_content?file_name={{$item.doc_file_name_637}}&module_name=cou_component_document_report.home">Download</a>
							{{else}}
								<select name="cou20[{{$item.bsn_id}}]"
									onChange="update_req_notreq_20({{$item.bsn_id}}, this.value)">
									<option value="0" {{if $item.doc_not_required_637 eq 0 }} selected="selected"
										{{/if}}>Required</option>
									<option value="1" {{if $item.doc_not_required_637 eq 1 }} selected="selected"
										{{/if}}>Not Required</option>
								</select>
								<script>
									function update_req_notreq_20(id, value) {
										var cond20 = '#cond20' + id;

										$.ajax({
											type: "GET",
											url: "{{$BASE_URL}}cou_component_document_report.update_req_notreq/bsn_id_20/" + id + "/value_20/" + value,
											success: function (result) {

												if (value == 0) {
													$(cond20).css("background", "#F00");
												} else {
													$(cond20).css("background", "#999");
												}
											}

										});
									}
								</script>
							{{/if}}
							<div style="margin-top: 15px;">
								{{foreach from=$item.suppliers_637 key="index" item="row"}}
									{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
									<p style="margin: 6px 0; padding: 0;">
										<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
									</p>
								{{/foreach}}
								<p style="margin: 0; padding: 0; margin-top: 10px;">
									<a href="/cou_component_document_report.include_suppliers/ccdr_bsn_id/{{$item.bsn_id}}/ccdr_doc_id/637" class="various">Include Suppliers</a>
								</p>
							</div>
						</td>
						<td {{if $item.doc_file_name_149}} style="background:#00CC33;" {{elseif
							$item.doc_not_required_149 eq 0}} style="background:#F00;" {{else}}
							style="background:#999;" {{/if}} id="cond18{{$item.bsn_id}}">
							{{if $item.doc_file_name_149}}
							<a href="/cou_component_document_report.download_content?file_name={{$item.doc_file_name_149}}&module_name=cou_component_document_report.home">Download</a>
							{{else}}
								<select name="cou18[{{$item.bsn_id}}]"
									onChange="update_req_notreq_18({{$item.bsn_id}}, this.value)">
									<option value="0" {{if $item.doc_not_required_149 eq 0 }} selected="selected"
										{{/if}}>Required</option>
									<option value="1" {{if $item.doc_not_required_149 eq 1 }} selected="selected"
										{{/if}}>Not Required</option>
								</select>
								<script>
									function update_req_notreq_18(id, value) {
										var cond18 = '#cond18' + id;

										$.ajax({
											type: "GET",
											url: "{{$BASE_URL}}cou_component_document_report.update_req_notreq/bsn_id_18/" + id + "/value_18/" + value,
											success: function (result) {

												if (value == 0) {
													$(cond18).css("background", "#F00");
												} else {
													$(cond18).css("background", "#999");
												}
											}

										});
									}
								</script>
							{{/if}}
							<div style="margin-top: 15px;">
								{{foreach from=$item.suppliers_149 key="index" item="row"}}
									{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
									<p style="margin: 6px 0; padding: 0;">
										<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
									</p>
								{{/foreach}}
								<p style="margin: 0; padding: 0; margin-top: 10px;">
									<a href="/cou_component_document_report.include_suppliers/ccdr_bsn_id/{{$item.bsn_id}}/ccdr_doc_id/149" class="various">Include Suppliers</a>
								</p>
							</div>
						</td>
						<td>
							<form name="recmet3" method="post" action="">
								<input type="hidden" name="rem_war[{{$item.bs_business_id}}]" value="0" />
								<label class="switch">
									<input class="switch-input" type="checkbox"
										name="rem_war[{{$item.bs_business_id}}]" value="1"
										onclick="this.form.submit();" {{if $item.bs_cou_remove_warranty eq 1 }}
										checked="checked" {{/if}}>
									<span class="switch-label" data-on="Yes" data-off="No"></span>
									<span class="switch-handle"></span> <br />
								</label>
							</form>
						</td>
						<td>
							<form name="recmet3" method="post" action="">
								<input type="hidden" name="hide[{{$item.bsn_id}}]" value="0" />
								<label class="switch">
									<input class="switch-input" type="checkbox" name="hide[{{$item.bsn_id}}]"
										value="1" onclick="this.form.submit();" {{if $item.bs_cou_hide eq 1 }}
										checked="checked" {{/if}}>
									<span class="switch-label" data-on="Yes" data-off="No"></span>
									<span class="switch-handle"></span> <br />
								</label>
							</form>
						</td>
					</tr>
					{{assign var=countn value=$countn-1}}
					{{/foreach}}
				</tbody>
				{{/if}}
			</table>
		</div>
	</div>
</form>
{{if $last > 1}}
<table width="90%" border="0" cellpadding="0" cellspacing="0">
	<tr> {{if $list}}
		<td align="center">
			<div class='pagination'> {{if $pagenum == 1}} <span class='disabled'>� previous</span>
				{{else}} <a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{math equation=" x - y"
						x=$pagenum y=1}}" title="Previous">� previous</a> {{/if}}

					{{if $pagenum != 1}} <span class="paginate"><a class="pagination"
							href="{{$BASE_URL}}{{$XFA.home}}/pagenum/1" title="{{$page_num}} Page">1</a></span>
					{{else}}<span class='current'>1</span> {{/if}}{{if $pagenum != 2}} <span class="paginate"><a
								class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/2"
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
										title="{{$page_num}} Page">{{$page_num}}</a></span> {{/if}}
								{{/foreach}}

								{{foreach from=$paginatenext key="page_key" item="page_num2"}}
								{{if $page_num2 < $last AND $page_num2 != $lastone}}
								{{if $page_num2 == 1}}
								{{elseif $page_num2 == 2}}
								{{else}}
									{{if $page_num2 == $pagenum OR $page_num2 <= 0}} <span class='current'>
										{{$page_num2}}</span>
									{{else}} <a class="pagination"
											href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$page_num2}}"
											title="{{$page_num2}} Page">{{$page_num2}}</a> {{/if}}
										{{/if}}
										{{/if}}
										{{/foreach}}
										{{if $page_num2 < $lasttow}}
										...
										{{/if}}
										{{if $lastone == 1}}
										{{elseif $lastone == 2}}
										{{else}}
											{{if $pagenum == $lastone }} <span class='current'>{{$lastone}}</span>
											{{else}} <a class="pagination"
													href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$lastone}}"
													title="{{$lastone}} Page">{{$lastone}}</a> {{/if}}
												{{/if}}
												{{if $last == 1}}
												{{elseif $last == 2}}
												{{else}}
													{{if $pagenum == $last}} <span class='current'>{{$last}}</span>
													{{else}} <a class="pagination"
															href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$last}}"
															title="{{$last}} Page">{{$last}}</a> {{/if}}
														{{/if}}
														{{if $pagenum == $last}} <span class='disabled'>next �</span>
														{{else}} <a class="pagination"
																href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{math equation="
																x + y" x=$pagenum y=1}}" title="Next">next �</a>
			</div>
			{{/if}}
		</td>
		{{else}}
			<td align="center" height="300">Record Not found... </td>
			{{/if}}
	</tr>
</table>
{{/if}}
<script>
	function updateRecord(primaryID, column, value, updateRecord = false) {
        const formData = {
            primaryID: primaryID,
            column: column,
            value: value,
            action: "updateRecord"
        };
        $.ajax({
            type: "POST",
            url: "{{$BASE_URL}}cou_component_document_report.ajax_handler",
            data: formData,
            dataType: "json",
            encode: true,
            success: function (data) {
                if (data.success == true) {
                    if(updateRecord){
                        $('#' + column + primaryID).text(value);
                    }
                }
                else {
                    alert('Some problem in updating the record');
                }
            }
        })
    }

	function update_req_notreq_653(id, value) {
		const element = '#cond653_' + id;
		$.ajax({
			type: "GET",
			url: "{{$BASE_URL}}cou_component_document_report.update_req_notreq/bsn_id_653/" + id + "/value_653/" + value,
			success: function (result) {
				if (value == 0) {
					$(element).css("background", "#F00");
				} else {
					$(element).css("background", "#999");
				}
			},
			error: function(error) {
				console.error(error);
			}
		});
	}
</script>