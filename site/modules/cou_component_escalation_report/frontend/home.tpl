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
		var viewurl = "{{$BASE_URL}}{{$BASEFOLDER}}.view_procedure" + "/random/" + Math.random();
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
	
	function cou_completion() {
		var viewurl = "{{$BASE_URL}}cou_component_document_report.view_cou_completion" + "/random/" + Math.random();
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
	
	function walkthrough_completed() {
		var viewurl = "{{$BASE_URL}}cou_component_document_report.view_walkthrough_completed" + "/random/" + Math.random();
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
	function open_popup(type) {
		let viewurl = '';
		if (type == 'send_email') {
			viewurl = "{{$BASE_URL}}{{$BASEFOLDER}}.send_email";
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
	function update_escalation_flag(id, value) {
		$.ajax({
			type: "GET",
			url: "{{$BASE_URL}}cou_component_escalation_report.home/update_escalation/1/bsn_id/" + id + "/value/" + value,
			success: function () {
				window.location.reload();
			}
		});
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
		overflow-x: auto;
		max-width: 2100px;
	}

	.tableFixHead thead th {
		position: sticky;
		top: 0;
		text-align: left;
		z-index: 9999 !important;
	}

	table {
		border-collapse: collapse;
		width: 100%;
	}

	/* th {
		z-index: 9999;
	} */

	.frozen-column {
		position: sticky;
		left: 0; /* Sticks the column to the left edge */
		background-color: #f2f2f2; 
		color: #000;
		/* background-color: inherit; */
		/* color: inherit; */
		/*z-index: 9998 !important;*/
		z-index: 99 !important;
	}
	#doclist-table th {
		z-index: 1 !important;
	}
	.escalation_data table {
		border-collapse: collapse;
	}
	.escalation_data table th, .escalation_data table td {
		border: 1px solid #000;
		padding: 5px;
	}
	.escalation_data {
		margin-bottom: 20px;
		margin-left: 100px;
	}
</style>

<h3 class="page-title">{{$title}}</h3>
<br />
<form name="mlist" method="post" enctype="multipart/form-data" style="margin: 0 0 20px 0; display: flex; flex-direction: row; align-items: end; justify-content: space-between;">
	<div style="display: flex; flex-direction: row; gap: 8px; align-items: end;">
		<div style="margin-left: 10px; text-align: left;">
			<div style="margin-bottom: 8px;">
				<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" />
			</div>
			<div>
				<strong>Project Search : </strong>
				<datalist id='bsnaddress'>
				{{foreach from=$busdetail key="key_bsnaddr" item="item_bsnaddr"}}
				<option value="{{$item_bsnaddr.bsn_address}}">
				{{$item_bsnaddr.bsn_address}}
				</option>
				{{/foreach}}
				</datalist>
				<input type="text" name="project_search" value="{{$project_search}}" list="bsnaddress" style="width:400px;" placeholder="Search for Address">
				<input type="submit" value="Search" name="search" /> &nbsp;<input type="submit" name="clear_search" value="Clear Search">
			</div>
		</div>
		<div class="escalation_data">
			<table style="font-size: 12px;">
				<tbody>
					<tr><th colspan="2" style="font-size: 14px;">Escalation Data</th></tr>
					{{foreach from=$escalation_data_table key="column1" item="column2"}}
					<tr>
						<td>{{$column1}}</td><td>{{$column2}}</td>
					</tr>
					{{/foreach}}
				</tbody>
			</table>
		</div>
	</div>
	<div style="display: flex; flex-direction: row; gap: 8px; justify-content: flex-end; margin-right: 10px;">
		<input type="button" name="proc_panel_email" value="Send Email" onclick="javascript:open_popup('send_email');" />
	</div>
</form>
<div style="clear:both;"></div>
<div style="float:left; width:100%; margin-top: 15px;">
<form name="mlist_table" method="post" enctype="multipart/form-data">
		<div class="div2 tableFixHead">
			<table id="doclist-table" class="nav-back" width="100%">
				<thead>
					<tr>
						<th class="topmenu frozen-column" align="center" valign="middle" width="14%" style="z-index: 100 !important;">Project Address</th>
						<th class="topmenu" align="center" valign="middle" width="10%">Escalation Required</th>
						<th class="topmenu" align="center" valign="middle" width="3%">Construction Alerts</th>
						<th class="topmenu" align="center" valign="middle" width="3%">Customer Walkthrough</th>
						<th class="topmenu" align="center" valign="middle" width="3%">Inspections Records</th>
						<th class="topmenu" align="center" valign="middle" width="3%">Application for COU Submitted</th>
						<th class="topmenu" align="center" valign="middle" width="3%">Icon Water Condition</th>
						<th class="topmenu" align="center" valign="middle" width="3%">Tree Protection Condition</th>
						<th class="topmenu" align="center" valign="middle" width="3%">Driveway</th>
						<th class="topmenu" align="center" valign="middle" width="3%">Pier Inspection Certificate</th>
						<th class="topmenu" align="center" valign="middle" width="3%">Survey ID Document</th>
						<th class="topmenu" align="center" valign="middle" width="6%">Termite protection Certificate - Penetrations</th>
						<th class="topmenu" align="center" valign="middle" width="6%">Termite Protection Certificate - Perimeter </th>
						<th class="topmenu" align="center" valign="middle" width="6%">Glazing Certificate - Shower Screens </th>
						<th class="topmenu" align="center" valign="middle" width="6%">Glazing Certificate - Windows</th>
						<th class="topmenu" align="center" valign="middle" width="6%">Glazing Certificate- Glass Wardrobe Doors</th>
						<th class="topmenu" align="center" valign="middle" width="6%">Glazing Certificate- Glass Mirror & Splashback</th>
						<th class="topmenu" align="center" valign="middle" width="6%">Glazing Certificate- Skylight</th>
						<th class="topmenu" align="center" valign="middle" width="6%">Glazing Certificate- Glass Balustrade</th>
						<th class="topmenu" align="center" valign="middle" width="6%">Wall and Roof Frames Detail Plans</th>
						<th class="topmenu" align="center" valign="middle" width="6%">Framing Installation Certificate - Signed by Builder</th>
						<th class="topmenu" align="center" valign="middle" width="6%">Insulation Certificate</th>
						<th class="topmenu" align="center" valign="middle" width="6%">Insulation Installation Certificate - Signed by builder</th>
						<th class="topmenu" align="center" valign="middle" width="6%">Under Slab Insulation Certificate</th>
						<th class="topmenu" align="center" valign="middle" width="6%">Waterproofing Certificate</th>
						<th class="topmenu" align="center" valign="middle" width="6%">Smoke Alarm Certificate</th>
						<th class="topmenu" align="center" valign="middle" width="6%">Condensation Management Roof Ventilation Installation Certificate</th>
						<th class="topmenu" align="center" valign="middle" width="6%">Slip Resistance Certificate - Interior Stairs</th>
						<th class="topmenu" align="center" valign="middle" width="6%">Slip Resistance Certificate - Exterior Stairs and Landing</th>
						<th class="topmenu" align="center" valign="middle" width="6%">Fire Rated Certificate</th>
						<th class="topmenu" align="center" valign="middle" width="6%">Fireplace Installation Certificate</th>
						<th class="topmenu" align="center" valign="middle" width="6%">Application of certificate of occupancy - signed by customer</th>
						<th class="topmenu" align="center" valign="middle" width="6%">Certificate of Electrical Safety - Electrician</th>
						<th class="topmenu" align="center" valign="middle" width="6%">Certificate of Electrical Safety - Air Conditioning</th>
						<th class="topmenu" align="center" valign="middle" width="6%">Asbestos Clearance Certificate</th>
						<th class="topmenu" align="center" valign="middle" width="6%">Plumbing Final Confirmation</th>
						<th class="topmenu" align="center" valign="middle" width="6%">Box Gutter Certificate</th>
						<th class="topmenu" align="center" valign="middle" width="6%">Post-Construction Dilapidation Report</th>
						<th class="topmenu" align="center" valign="middle" width="6%">Driveway/Verge Crossing Formwork Inspection Report</th>
						<th class="topmenu" align="center" valign="middle" width="6%">Amended Development Approval</th>
						<th class="topmenu" align="center" valign="middle" width="6%">Building Approval Amendment Authorisation</th>
						<th class="topmenu" align="center" valign="middle" width="6%">Amended Drainage Plan</th>
					</tr>
				</thead>
				{{if $list}}
				<tbody>
					{{foreach from=$list key="key" item="item"}}
					<tr bgcolor="{{cycle values=" #D3E8D6,WHITE" advance=true}}">
						<td class="frozen-column">
							<a href="{{$item.link}}" target="blank">{{$item.bsn_address}}</a>
						</td>
						<td {{if $item.bsn_cou_escalation_required eq 'Yes'}} style="background:#F00;" {{/if}}>
							<select name="escalation_required" onchange="update_escalation_flag({{$item.bsn_id}}, this.value)">
								<option value="Yes" {{if $item.bsn_cou_escalation_required eq 'Yes'}}selected="selected"{{/if}}>Yes</option>
								<option value="No" {{if $item.bsn_cou_escalation_required neq 'Yes'}}selected="selected"{{/if}}>No</option>
							</select>
							<div>
								{{$item.bsn_cou_escalation_user}}<br />
								{{$item.bsn_cou_escalation_date}}
							</div>
							<div style="margin-top:8px;">
								<a href="{{$BASE_URL}}cou_component_escalation_report.view_esc_notes/bsn_id/{{$item.bsn_id}}" class="various">Notes</a>
								<p>{{$item.esc_notes_text}}</p>
								<p style="font-weight: bold; margin-top: 4px;">{{$item.esc_notes_user}}</p>
								<p style="font-weight: bold;">{{$item.esc_notes_date}}</p>
							</div>
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
								{{assign var=ccdr_id value=$item.ccdr_ids[172]}}
								{{if $ccdr_id}}
									{{assign var=suppliers value=$cou_component_document_report_companies.$ccdr_id}}
									{{foreach from=$suppliers key="index" item="row"}}
										{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
										<p style="margin: 6px 0; padding: 0;">
											<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
										</p>
									{{/foreach}}
								{{/if}}
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
								{{assign var=ccdr_id value=$item.ccdr_ids[169]}}
								{{if $ccdr_id}}
									{{assign var=suppliers value=$cou_component_document_report_companies.$ccdr_id}}
									{{foreach from=$suppliers key="index" item="row"}}
										{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
										<p style="margin: 6px 0; padding: 0;">
											<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
										</p>
									{{/foreach}}
								{{/if}}
								<p style="margin: 0; padding: 0; margin-top: 10px;">
									<a href="/cou_component_document_report.include_suppliers/ccdr_bsn_id/{{$item.bsn_id}}/ccdr_doc_id/169" class="various">Include Suppliers</a>
								</p>
							</div>
						</td>
						<td {{if $item.bt_complete eq 1}} style="background:#00CC33;" {{else}} style="background:#F00;" {{/if}}> 	
                            
                            
                       <!-- <form name="recmet3" method="post" action="">
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
							{{$item.bs_cou_appl_date}}<br />{{$item.bs_cou_appl_user}} {{/if}}-->
                            
                            
                            <form name="recmet3" method="post" action="">
								<input type="hidden" name="application[{{$item.bsn_id}}]" value="0" />
								<label class="switch">
									<input class="switch-input" type="checkbox" disabled="disabled" name="application[{{$item.bsn_id}}]"
										value="1" onclick="this.form.submit();" {{if $item.bt_complete eq 1
										}} checked="checked" {{/if}}>
									<span class="switch-label" data-on="Yes" data-off="No"></span>
									<span class="switch-handle"></span> <br />
								</label>
							</form>
							{{if $item.bt_complete eq 1 }}
							{{$item.bt_completed_date}}<br />{{$item.user_name}} {{/if}}
						</td>

						<td data-col="icon-water-condition" style="background:#999;" id="cond627{{$item.bsn_id}}">
							{{if $item.doc_file_name_627}}
							<a href="/cou_component_document_report.download_content?file_name={{$item.doc_file_name_627}}&module_name=cou_component_document_report.home">Download</a>
							{{/if}}
							{{if $item.doc_file_name_627 && $item.doc_not_required_627 eq 0}}
							{{else}}
								<select name="cou627[{{$item.bsn_id}}]"
									onChange="update_req_notreq_627({{$item.bsn_id}}, this.value)">
									<option value="0" {{if $item.doc_not_required_627 eq 0 }} selected="selected"
										{{/if}}>Required</option>
									<option value="1" {{if $item.doc_not_required_627 eq 1 }} selected="selected"
										{{/if}}>Not Required</option>
								</select>
								<script>
									function update_req_notreq_627(id, value) {
										var cond627 = '#cond627' + id;

										$.ajax({
											type: "GET",
											url: "{{$BASE_URL}}cou_component_document_report.update_req_notreq/bsn_id_627/" + id + "/value_627/" + value,
											success: function (result) {
											}
											
										});
									}
								</script>
							{{/if}}
							<div style="margin-top: 15px;">
								{{assign var=ccdr_id value=$item.ccdr_ids[627]}}
								{{if $ccdr_id}}
									{{assign var=suppliers value=$cou_component_document_report_companies.$ccdr_id}}
									{{foreach from=$suppliers key="index" item="row"}}
										{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
										<p style="margin: 6px 0; padding: 0;">
											<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
										</p>
									{{/foreach}}
								{{/if}}
								<p style="margin: 0; padding: 0; margin-top: 10px;">
									<a href="/cou_component_document_report.include_suppliers/ccdr_bsn_id/{{$item.bsn_id}}/ccdr_doc_id/627" class="various">Include Suppliers</a>
								</p>
							</div>
						</td>

						<td data-col="tree-protection-condition" style="background:#999;" id="cond382{{$item.bsn_id}}">
							{{if $item.doc_file_name_382}}
							<a href="/cou_component_document_report.download_content?file_name={{$item.doc_file_name_382}}&module_name=cou_component_document_report.home">Download</a>
							{{/if}}
							{{if $item.doc_file_name_382 && $item.doc_not_required_382 eq 0}}
							{{else}}
								<select name="cou382[{{$item.bsn_id}}]"
									onChange="update_req_notreq_382({{$item.bsn_id}}, this.value)">
									<option value="0" {{if $item.doc_not_required_382 eq 0 }} selected="selected"
										{{/if}}>Required</option>
									<option value="1" {{if $item.doc_not_required_382 eq 1 }} selected="selected"
										{{/if}}>Not Required</option>
								</select>
								<script>
									function update_req_notreq_382(id, value) {
										var cond382 = '#cond382' + id;

										$.ajax({
											type: "GET",
											url: "{{$BASE_URL}}cou_component_document_report.update_req_notreq/bsn_id_382/" + id + "/value_382/" + value,
											success: function (result) {
											}
										});
									}
								</script>
							{{/if}}
							<div style="margin-top: 15px;">
								{{assign var=ccdr_id value=$item.ccdr_ids[382]}}
								{{if $ccdr_id}}
									{{assign var=suppliers value=$cou_component_document_report_companies.$ccdr_id}}
									{{foreach from=$suppliers key="index" item="row"}}
										{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
										<p style="margin: 6px 0; padding: 0;">
											<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
										</p>
									{{/foreach}}
								{{/if}}
								<p style="margin: 0; padding: 0; margin-top: 10px;">
									<a href="/cou_component_document_report.include_suppliers/ccdr_bsn_id/{{$item.bsn_id}}/ccdr_doc_id/382" class="various">Include Suppliers</a>
								</p>
							</div>
						</td>

						<td data-col="driveway" style="background:#999" id="cond272{{$item.bsn_id}}">
							{{if $item.doc_file_name_272}}
							<a href="/cou_component_document_report.download_content?file_name={{$item.doc_file_name_272}}&module_name=cou_component_document_report.home">Download</a>
							{{/if}}
							{{if $item.doc_file_name_272 && $item.doc_not_required_272 eq 0}}
							{{else}}
								<select name="cou272[{{$item.bsn_id}}]"
									onChange="update_req_notreq_272({{$item.bsn_id}}, this.value)">
									<option value="0" {{if $item.doc_not_required_272 eq 0 }} selected="selected"
										{{/if}}>Required</option>
									<option value="1" {{if $item.doc_not_required_272 eq 1 }} selected="selected"
										{{/if}}>Not Required</option>
								</select>
								<script>
									function update_req_notreq_272(id, value) {
										var cond272 = '#cond272' + id;

										$.ajax({
											type: "GET",
											url: "{{$BASE_URL}}cou_component_document_report.update_req_notreq/bsn_id_272/" + id + "/value_272/" + value,
											success: function (result) {
											}
										});
									}
								</script>
							{{/if}}
							<div style="margin-top: 15px;">
								{{assign var=ccdr_id value=$item.ccdr_ids[272]}}
								{{if $ccdr_id}}
									{{assign var=suppliers value=$cou_component_document_report_companies.$ccdr_id}}
									{{foreach from=$suppliers key="index" item="row"}}
										{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
										<p style="margin: 6px 0; padding: 0;">
											<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
										</p>
									{{/foreach}}
								{{/if}}
								<p style="margin: 0; padding: 0; margin-top: 10px;">
									<a href="/cou_component_document_report.include_suppliers/ccdr_bsn_id/{{$item.bsn_id}}/ccdr_doc_id/272" class="various">Include Suppliers</a>
								</p>
							</div>
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
								{{assign var=ccdr_id value=$item.ccdr_ids[653]}}
								{{if $ccdr_id}}
									{{assign var=suppliers value=$cou_component_document_report_companies.$ccdr_id}}
									{{foreach from=$suppliers key="index" item="row"}}
										{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
										<p style="margin: 6px 0; padding: 0;">
											<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
										</p>
									{{/foreach}}
								{{/if}}
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
								{{assign var=ccdr_id value=$item.ccdr_ids[261]}}
								{{if $ccdr_id}}
									{{assign var=suppliers value=$cou_component_document_report_companies.$ccdr_id}}
									{{foreach from=$suppliers key="index" item="row"}}
										{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
										<p style="margin: 6px 0; padding: 0;">
											<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
										</p>
									{{/foreach}}
								{{/if}}
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
								{{assign var=ccdr_id value=$item.ccdr_ids[155]}}
								{{if $ccdr_id}}
									{{assign var=suppliers value=$cou_component_document_report_companies.$ccdr_id}}
									{{foreach from=$suppliers key="index" item="row"}}
										{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
										<p style="margin: 6px 0; padding: 0;">
											<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
										</p>
									{{/foreach}}
								{{/if}}
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
								{{assign var=ccdr_id value=$item.ccdr_ids[295]}}
								{{if $ccdr_id}}
									{{assign var=suppliers value=$cou_component_document_report_companies.$ccdr_id}}
									{{foreach from=$suppliers key="index" item="row"}}
										{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
										<p style="margin: 6px 0; padding: 0;">
											<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
										</p>
									{{/foreach}}
								{{/if}}
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
								{{assign var=ccdr_id value=$item.ccdr_ids[413]}}
								{{if $ccdr_id}}
									{{assign var=suppliers value=$cou_component_document_report_companies.$ccdr_id}}
									{{foreach from=$suppliers key="index" item="row"}}
										{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
										<p style="margin: 6px 0; padding: 0;">
											<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
										</p>
									{{/foreach}}
								{{/if}}
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
								{{assign var=ccdr_id value=$item.ccdr_ids[156]}}
								{{if $ccdr_id}}
									{{assign var=suppliers value=$cou_component_document_report_companies.$ccdr_id}}
									{{foreach from=$suppliers key="index" item="row"}}
										{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
										<p style="margin: 6px 0; padding: 0;">
											<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
										</p>
									{{/foreach}}
								{{/if}}
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
								{{assign var=ccdr_id value=$item.ccdr_ids[735]}}
								{{if $ccdr_id}}
									{{assign var=suppliers value=$cou_component_document_report_companies.$ccdr_id}}
									{{foreach from=$suppliers key="index" item="row"}}
										{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
										<p style="margin: 6px 0; padding: 0;">
											<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
										</p>
									{{/foreach}}
								{{/if}}
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
								{{assign var=ccdr_id value=$item.ccdr_ids[736]}}
								{{if $ccdr_id}}
									{{assign var=suppliers value=$cou_component_document_report_companies.$ccdr_id}}
									{{foreach from=$suppliers key="index" item="row"}}
										{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
										<p style="margin: 6px 0; padding: 0;">
											<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
										</p>
									{{/foreach}}
								{{/if}}
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
								{{assign var=ccdr_id value=$item.ccdr_ids[737]}}
								{{if $ccdr_id}}
									{{assign var=suppliers value=$cou_component_document_report_companies.$ccdr_id}}
									{{foreach from=$suppliers key="index" item="row"}}
										{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
										<p style="margin: 6px 0; padding: 0;">
											<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
										</p>
									{{/foreach}}
								{{/if}}
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
								{{assign var=ccdr_id value=$item.ccdr_ids[738]}}
								{{if $ccdr_id}}
									{{assign var=suppliers value=$cou_component_document_report_companies.$ccdr_id}}
									{{foreach from=$suppliers key="index" item="row"}}
										{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
										<p style="margin: 6px 0; padding: 0;">
											<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
										</p>
									{{/foreach}}
								{{/if}}
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
								{{assign var=ccdr_id value=$item.ccdr_ids[289]}}
								{{if $ccdr_id}}
									{{assign var=suppliers value=$cou_component_document_report_companies.$ccdr_id}}
									{{foreach from=$suppliers key="index" item="row"}}
										{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
										<p style="margin: 6px 0; padding: 0;">
											<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
										</p>
									{{/foreach}}
								{{/if}}
								<p style="margin: 0; padding: 0; margin-top: 10px;">
									<a href="/cou_component_document_report.include_suppliers/ccdr_bsn_id/{{$item.bsn_id}}/ccdr_doc_id/289" class="various">Include Suppliers</a>
								</p>
							</div>
						</td>
						<td {{if $item.doc_file_name_678}} style="background:#00CC33;" {{elseif
							$item.doc_not_required_678 eq 0}} style="background:#F00;" {{else}}
							style="background:#999;" {{/if}} id="cond32{{$item.bsn_id}}">
							{{if $item.doc_file_name_678}}
							<a href="/cou_component_document_report.download_content?file_name={{$item.doc_file_name_678}}&module_name=cou_component_document_report.home">Download</a>
							{{else}}
								<select name="cou32[{{$item.bsn_id}}]"
									onChange="update_req_notreq_32({{$item.bsn_id}}, this.value)">
									<option value="0" {{if $item.doc_not_required_678 eq 0 }} selected="selected"
										{{/if}}>Required</option>
									<option value="1" {{if $item.doc_not_required_678 eq 1 }} selected="selected"
										{{/if}}>Not Required</option>
								</select>
								<script>
									function update_req_notreq_32(id, value) {
										var cond32 = '#cond32' + id;

										$.ajax({
											type: "GET",
											url: "{{$BASE_URL}}cou_component_document_report.update_req_notreq/bsn_id_32/" + id + "/value_32/" + value,
											success: function (result) {

												if (value == 0) {
													$(cond32).css("background", "#F00");
												} else {
													$(cond32).css("background", "#999");
												}
											}

										});
									}
								</script>
							{{/if}}
							<div style="margin-top: 15px;">
								{{assign var=ccdr_id value=$item.ccdr_ids[678]}}
								{{if $ccdr_id}}
									{{assign var=suppliers value=$cou_component_document_report_companies.$ccdr_id}}
									{{foreach from=$suppliers key="index" item="row"}}
										{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
										<p style="margin: 6px 0; padding: 0;">
											<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
										</p>
									{{/foreach}}
								{{/if}}
								<p style="margin: 0; padding: 0; margin-top: 10px;">
									<a href="/cou_component_document_report.include_suppliers/ccdr_bsn_id/{{$item.bsn_id}}/ccdr_doc_id/678" class="various">Include Suppliers</a>
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
								{{assign var=ccdr_id value=$item.ccdr_ids[162]}}
								{{if $ccdr_id}}
									{{assign var=suppliers value=$cou_component_document_report_companies.$ccdr_id}}
									{{foreach from=$suppliers key="index" item="row"}}
										{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
										<p style="margin: 6px 0; padding: 0;">
											<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
										</p>
									{{/foreach}}
								{{/if}}
								<p style="margin: 0; padding: 0; margin-top: 10px;">
									<a href="/cou_component_document_report.include_suppliers/ccdr_bsn_id/{{$item.bsn_id}}/ccdr_doc_id/162" class="various">Include Suppliers</a>
								</p>
							</div>
						</td>
						<td data-col="iic_signed_by_builder" {{if $item.doc_file_name_679}} style="background:#00CC33;" {{elseif
							$item.doc_not_required_679 eq 0}} style="background:#F00;" {{else}}
							style="background:#999;" {{/if}} id="cond31{{$item.bsn_id}}">
							{{if $item.doc_file_name_679}}
							<a href="/cou_component_document_report.download_content?file_name={{$item.doc_file_name_679}}&module_name=cou_component_document_report.home">Download</a>
							{{else}}
								<select name="cou31[{{$item.bsn_id}}]"
									onChange="update_req_notreq_31({{$item.bsn_id}}, this.value)">
									<option value="0" {{if $item.doc_not_required_679 eq 0 }} selected="selected"
										{{/if}}>Required</option>
									<option value="1" {{if $item.doc_not_required_679 eq 1 }} selected="selected"
										{{/if}}>Not Required</option>
								</select>
								<script>
									function update_req_notreq_31(id, value) {
										var cond31 = '#cond31' + id;

										$.ajax({
											type: "GET",
											url: "{{$BASE_URL}}cou_component_document_report.update_req_notreq/bsn_id_31/" + id + "/value_31/" + value,
											success: function (result) {

												if (value == 0) {
													$(cond31).css("background", "#F00");
												} else {
													$(cond31).css("background", "#999");
												}
											}

										});
									}
								</script>
							{{/if}}
							<div style="margin-top: 15px;">
								{{assign var=ccdr_id value=$item.ccdr_ids[679]}}
								{{if $ccdr_id}}
									{{assign var=suppliers value=$cou_component_document_report_companies.$ccdr_id}}
									{{foreach from=$suppliers key="index" item="row"}}
										{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
										<p style="margin: 6px 0; padding: 0;">
											<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
										</p>
									{{/foreach}}
								{{/if}}
								<p style="margin: 0; padding: 0; margin-top: 10px;">
									<a href="/cou_component_document_report.include_suppliers/ccdr_bsn_id/{{$item.bsn_id}}/ccdr_doc_id/679" class="various">Include Suppliers</a>
								</p>
							</div>
						</td>
						
						{{if $item.doc_file_name_795 && $item.doc_not_required_795 eq 1}}
							{{assign var="bgcolor" value="#999"}}
						{{elseif $item.doc_file_name_795 && $item.doc_not_required_795 eq 0}}
							{{assign var="bgcolor" value="#00CC33"}}
						{{elseif empty($item.doc_file_name_795) && $item.doc_not_required_795 eq 1}}
							{{assign var="bgcolor" value="#999"}}
						{{elseif empty($item.doc_file_name_795) && $item.doc_not_required_795 eq 0}}
							{{assign var="bgcolor" value="#F00"}}
						{{/if}}
						<td data-col="us_insulation_certificate" style="background:{{$bgcolor}}" id="cond795{{$item.bsn_id}}">
							{{if $item.doc_file_name_795}}
							<a href="/cou_component_document_report.download_content?file_name={{$item.doc_file_name_795}}&module_name=cou_component_document_report.home">Download</a>
							{{/if}}
							{{if $item.doc_file_name_795 && $item.doc_not_required_795 eq 0}}
							{{else}}
								<select name="cou795[{{$item.bsn_id}}]"
									onChange="update_req_notreq_795({{$item.bsn_id}}, this.value)">
									<option value="0" {{if $item.doc_not_required_795 eq 0 }} selected="selected"
										{{/if}}>Required</option>
									<option value="1" {{if $item.doc_not_required_795 eq 1 }} selected="selected"
										{{/if}}>Not Required</option>
								</select>
								<script>
									function update_req_notreq_795(id, value) {
										var cond795 = '#cond795' + id;

										$.ajax({
											type: "GET",
											url: "{{$BASE_URL}}cou_component_document_report.update_req_notreq/bsn_id_795/" + id + "/value_795/" + value,
											success: function (result) {

												if (value == 0) {
													$(cond795).css("background", "#F00");
												} else {
													$(cond795).css("background", "#999");
												}
											}

										});
									}
								</script>
							{{/if}}
							<div style="margin-top: 15px;">
								{{assign var=ccdr_id value=$item.ccdr_ids[795]}}
								{{if $ccdr_id}}
									{{assign var=suppliers value=$cou_component_document_report_companies.$ccdr_id}}
									{{foreach from=$suppliers key="index" item="row"}}
										{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
										<p style="margin: 6px 0; padding: 0;">
											<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
										</p>
									{{/foreach}}
								{{/if}}
								<p style="margin: 0; padding: 0; margin-top: 10px;">
									<a href="/cou_component_document_report.include_suppliers/ccdr_bsn_id/{{$item.bsn_id}}/ccdr_doc_id/795" class="various">Include Suppliers</a>
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
								{{assign var=ccdr_id value=$item.ccdr_ids[163]}}
								{{if $ccdr_id}}
									{{assign var=suppliers value=$cou_component_document_report_companies.$ccdr_id}}
									{{foreach from=$suppliers key="index" item="row"}}
										{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
										<p style="margin: 6px 0; padding: 0;">
											<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
										</p>
									{{/foreach}}
								{{/if}}
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
								{{assign var=ccdr_id value=$item.ccdr_ids[296]}}
								{{if $ccdr_id}}
									{{assign var=suppliers value=$cou_component_document_report_companies.$ccdr_id}}
									{{foreach from=$suppliers key="index" item="row"}}
										{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
										<p style="margin: 6px 0; padding: 0;">
											<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
										</p>
									{{/foreach}}
								{{/if}}
								<p style="margin: 0; padding: 0; margin-top: 10px;">
									<a href="/cou_component_document_report.include_suppliers/ccdr_bsn_id/{{$item.bsn_id}}/ccdr_doc_id/296" class="various">Include Suppliers</a>
								</p>
							</div>
						</td>
						<td {{if $item.doc_file_name_788}} style="background:#00CC33;" {{elseif
							$item.doc_not_required_788 eq 0}} style="background:#F00;" {{else}}
							style="background:#999;" {{/if}} id="cond788{{$item.bsn_id}}">
							{{if $item.doc_file_name_788}}
							<a href="/cou_component_document_report.download_content?file_name={{$item.doc_file_name_788}}&module_name=cou_component_document_report.home">Download</a>
							{{else}}
								<select name="cou788[{{$item.bsn_id}}]"
									onChange="update_req_notreq_788({{$item.bsn_id}}, this.value)">
									<option value="0" {{if $item.doc_not_required_788 eq 0 }} selected="selected"
										{{/if}}>Required</option>
									<option value="1" {{if $item.doc_not_required_788 eq 1 }} selected="selected"
										{{/if}}>Not Required</option>
								</select>
								<script>
									function update_req_notreq_788(id, value) {
										var cond788 = '#cond788' + id;

										$.ajax({
											type: "GET",
											url: "{{$BASE_URL}}cou_component_document_report.update_req_notreq/bsn_id_788/" + id + "/value_788/" + value,
											success: function (result) {

												if (value == 0) {
													$(cond788).css("background", "#F00");
												} else {
													$(cond788).css("background", "#999");
												}
											}

										});
									}
								</script>
							{{/if}}
							<div style="margin-top: 15px;">
								{{assign var=ccdr_id value=$item.ccdr_ids[788]}}
								{{if $ccdr_id}}
									{{assign var=suppliers value=$cou_component_document_report_companies.$ccdr_id}}
									{{foreach from=$suppliers key="index" item="row"}}
										{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
										<p style="margin: 6px 0; padding: 0;">
											<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
										</p>
									{{/foreach}}
								{{/if}}
								<p style="margin: 0; padding: 0; margin-top: 10px;">
									<a href="/cou_component_document_report.include_suppliers/ccdr_bsn_id/{{$item.bsn_id}}/ccdr_doc_id/788" class="various">Include Suppliers</a>
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
								{{assign var=ccdr_id value=$item.ccdr_ids[713]}}
								{{if $ccdr_id}}
									{{assign var=suppliers value=$cou_component_document_report_companies.$ccdr_id}}
									{{foreach from=$suppliers key="index" item="row"}}
										{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
										<p style="margin: 6px 0; padding: 0;">
											<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
										</p>
									{{/foreach}}
								{{/if}}
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
								{{assign var=ccdr_id value=$item.ccdr_ids[714]}}
								{{if $ccdr_id}}
									{{assign var=suppliers value=$cou_component_document_report_companies.$ccdr_id}}
									{{foreach from=$suppliers key="index" item="row"}}
										{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
										<p style="margin: 6px 0; padding: 0;">
											<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
										</p>
									{{/foreach}}
								{{/if}}
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
								{{assign var=ccdr_id value=$item.ccdr_ids[739]}}
								{{if $ccdr_id}}
									{{assign var=suppliers value=$cou_component_document_report_companies.$ccdr_id}}
									{{foreach from=$suppliers key="index" item="row"}}
										{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
										<p style="margin: 6px 0; padding: 0;">
											<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
										</p>
									{{/foreach}}
								{{/if}}
								<p style="margin: 0; padding: 0; margin-top: 10px;">
									<a href="/cou_component_document_report.include_suppliers/ccdr_bsn_id/{{$item.bsn_id}}/ccdr_doc_id/739" class="various">Include Suppliers</a>
								</p>
							</div>
						</td>
						<td data-col="fic" {{if $item.doc_file_name_777}} style="background:#00CC33;" {{elseif
							$item.doc_not_required_777 eq 0}} style="background:#F00;" {{else}}
							style="background:#999;" {{/if}} id="cond33{{$item.bsn_id}}">
							{{if $item.doc_file_name_777}}
							<a href="/cou_component_document_report.download_content?file_name={{$item.doc_file_name_777}}&module_name=cou_component_document_report.home">Download</a>
							{{else}}
								<select name="cou33[{{$item.bsn_id}}]"
									onChange="update_req_notreq_33({{$item.bsn_id}}, this.value)">
									<option value="0" {{if $item.doc_not_required_777 eq 0 }} selected="selected"
										{{/if}}>Required</option>
									<option value="1" {{if $item.doc_not_required_777 eq 1 }} selected="selected"
										{{/if}}>Not Required</option>
								</select>
								<script>
									function update_req_notreq_33(id, value) {
										var cond33 = '#cond33' + id;

										$.ajax({
											type: "GET",
											url: "{{$BASE_URL}}cou_component_document_report.update_req_notreq/bsn_id_33/" + id + "/value_33/" + value,
											success: function (result) {

												if (value == 0) {
													$(cond33).css("background", "#F00");
												} else {
													$(cond33).css("background", "#999");
												}
											}

										});
									}
								</script>
							{{/if}}
							<div style="margin-top: 15px;">
								{{assign var=ccdr_id value=$item.ccdr_ids[777]}}
								{{if $ccdr_id}}
									{{assign var=suppliers value=$cou_component_document_report_companies.$ccdr_id}}
									{{foreach from=$suppliers key="index" item="row"}}
										{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
										<p style="margin: 6px 0; padding: 0;">
											<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
										</p>
									{{/foreach}}
								{{/if}}
								<p style="margin: 0; padding: 0; margin-top: 10px;">
									<a href="/cou_component_document_report.include_suppliers/ccdr_bsn_id/{{$item.bsn_id}}/ccdr_doc_id/777" class="various">Include Suppliers</a>
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
								{{assign var=ccdr_id value=$item.ccdr_ids[274]}}
								{{if $ccdr_id}}
									{{assign var=suppliers value=$cou_component_document_report_companies.$ccdr_id}}
									{{foreach from=$suppliers key="index" item="row"}}
										{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
										<p style="margin: 6px 0; padding: 0;">
											<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
										</p>
									{{/foreach}}
								{{/if}}
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
								{{assign var=ccdr_id value=$item.ccdr_ids[294]}}
								{{if $ccdr_id}}
									{{assign var=suppliers value=$cou_component_document_report_companies.$ccdr_id}}
									{{foreach from=$suppliers key="index" item="row"}}
										{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
										<p style="margin: 6px 0; padding: 0;">
											<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
										</p>
									{{/foreach}}
								{{/if}}
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
								{{assign var=ccdr_id value=$item.ccdr_ids[167]}}
								{{if $ccdr_id}}
									{{assign var=suppliers value=$cou_component_document_report_companies.$ccdr_id}}
									{{foreach from=$suppliers key="index" item="row"}}
										{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
										<p style="margin: 6px 0; padding: 0;">
											<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
										</p>
									{{/foreach}}
								{{/if}}
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
								{{assign var=ccdr_id value=$item.ccdr_ids[318]}}
								{{if $ccdr_id}}
									{{assign var=suppliers value=$cou_component_document_report_companies.$ccdr_id}}
									{{foreach from=$suppliers key="index" item="row"}}
										{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
										<p style="margin: 6px 0; padding: 0;">
											<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
										</p>
									{{/foreach}}
								{{/if}}
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
								{{assign var=ccdr_id value=$item.ccdr_ids[749]}}
								{{if $ccdr_id}}
									{{assign var=suppliers value=$cou_component_document_report_companies.$ccdr_id}}
									{{foreach from=$suppliers key="index" item="row"}}
										{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
										<p style="margin: 6px 0; padding: 0;">
											<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
										</p>
									{{/foreach}}
								{{/if}}
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
								{{assign var=ccdr_id value=$item.ccdr_ids[626]}}
								{{if $ccdr_id}}
									{{assign var=suppliers value=$cou_component_document_report_companies.$ccdr_id}}
									{{foreach from=$suppliers key="index" item="row"}}
										{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
										<p style="margin: 6px 0; padding: 0;">
											<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
										</p>
									{{/foreach}}
								{{/if}}
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
								{{assign var=ccdr_id value=$item.ccdr_ids[691]}}
								{{if $ccdr_id}}
									{{assign var=suppliers value=$cou_component_document_report_companies.$ccdr_id}}
									{{foreach from=$suppliers key="index" item="row"}}
										{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
										<p style="margin: 6px 0; padding: 0;">
											<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
										</p>
									{{/foreach}}
								{{/if}}
								<p style="margin: 0; padding: 0; margin-top: 10px;">
									<a href="/cou_component_document_report.include_suppliers/ccdr_bsn_id/{{$item.bsn_id}}/ccdr_doc_id/691" class="various">Include Suppliers</a>
								</p>
							</div>
						</td>
						<td {{if $item.doc_file_name_783}} style="background:#00CC33;" {{elseif
							$item.doc_not_required_783 eq 0}} style="background:#F00;" {{else}}
							style="background:#999;" {{/if}} id="cond34{{$item.bsn_id}}">
							{{if $item.doc_file_name_783}}
							<a href="/cou_component_document_report.download_content?file_name={{$item.doc_file_name_783}}&module_name=cou_component_document_report.home">Download</a>
							{{else}}
								<select name="cou34[{{$item.bsn_id}}]"
									onChange="update_req_notreq_34({{$item.bsn_id}}, this.value)">
									<option value="0" {{if $item.doc_not_required_783 eq 0 }} selected="selected"
										{{/if}}>Required</option>
									<option value="1" {{if $item.doc_not_required_783 eq 1 }} selected="selected"
										{{/if}}>Not Required</option>
								</select>
								<script>
									function update_req_notreq_34(id, value) {
										var cond34 = '#cond34' + id;

										$.ajax({
											type: "GET",
											url: "{{$BASE_URL}}cou_component_document_report.update_req_notreq/bsn_id_34/" + id + "/value_34/" + value,
											success: function (result) {

												if (value == 0) {
													$(cond34).css("background", "#F00");
												} else {
													$(cond34).css("background", "#999");
												}
											}

										});
									}
								</script>
							{{/if}}
							<div style="margin-top: 15px;">
								{{assign var=ccdr_id value=$item.ccdr_ids[783]}}
								{{if $ccdr_id}}
									{{assign var=suppliers value=$cou_component_document_report_companies.$ccdr_id}}
									{{foreach from=$suppliers key="index" item="row"}}
										{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
										<p style="margin: 6px 0; padding: 0;">
											<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
										</p>
									{{/foreach}}
								{{/if}}
								<p style="margin: 0; padding: 0; margin-top: 10px;">
									<a href="/cou_component_document_report.include_suppliers/ccdr_bsn_id/{{$item.bsn_id}}/ccdr_doc_id/783" class="various">Include Suppliers</a>
								</p>
							</div>
						</td>
						<td {{if $item.doc_file_name_657}} style="background:#00CC33;" {{elseif
							$item.doc_not_required_657 eq 0}} style="background:#F00;" {{else}}
							style="background:#999;" {{/if}} id="cond657{{$item.bsn_id}}">
							{{if $item.doc_file_name_657}}
							<a href="/cou_component_document_report.download_content?file_name={{$item.doc_file_name_657}}&module_name=cou_component_document_report.home">Download</a>
							{{else}}
								<select name="cou657[{{$item.bsn_id}}]"
									onChange="update_req_notreq_657({{$item.bsn_id}}, this.value)">
									<option value="0" {{if $item.doc_not_required_657 eq 0 }} selected="selected"
										{{/if}}>Required</option>
									<option value="1" {{if $item.doc_not_required_657 eq 1 }} selected="selected"
										{{/if}}>Not Required</option>
								</select>
								<script>
									function update_req_notreq_657(id, value) {
										var cond657 = '#cond657' + id;

										$.ajax({
											type: "GET",
											url: "{{$BASE_URL}}cou_component_document_report.update_req_notreq/bsn_id_657/" + id + "/value_657/" + value,
											success: function (result) {

												if (value == 0) {
													$(cond657).css("background", "#F00");
												} else {
													$(cond657).css("background", "#999");
												}
											}

										});
									}
								</script>
							{{/if}}
							<div style="margin-top: 15px;">
								{{assign var=ccdr_id value=$item.ccdr_ids[657]}}
								{{if $ccdr_id}}
									{{assign var=suppliers value=$cou_component_document_report_companies.$ccdr_id}}
									{{foreach from=$suppliers key="index" item="row"}}
										{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
										<p style="margin: 6px 0; padding: 0;">
											<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
										</p>
									{{/foreach}}
								{{/if}}
								<p style="margin: 0; padding: 0; margin-top: 10px;">
									<a href="/cou_component_document_report.include_suppliers/ccdr_bsn_id/{{$item.bsn_id}}/ccdr_doc_id/657" class="various">Include Suppliers</a>
								</p>
							</div>
						</td>
						<td {{if $item.doc_file_name_637}} style="background:#00CC33;" {{elseif
							$item.doc_not_required_637 eq 0}} style="background:#F00;" {{else}}
							style="background:#999;" {{/if}} id="cond20{{$item.bsn_id}}">
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
								{{assign var=ccdr_id value=$item.ccdr_ids[637]}}
								{{if $ccdr_id}}
									{{assign var=suppliers value=$cou_component_document_report_companies.$ccdr_id}}
									{{foreach from=$suppliers key="index" item="row"}}
										{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
										<p style="margin: 6px 0; padding: 0;">
											<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
										</p>
									{{/foreach}}
								{{/if}}
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
								{{assign var=ccdr_id value=$item.ccdr_ids[149]}}
								{{if $ccdr_id}}
									{{assign var=suppliers value=$cou_component_document_report_companies.$ccdr_id}}
									{{foreach from=$suppliers key="index" item="row"}}
										{{assign var=ccdrc_co_id value=$row.ccdrc_co_id}}
										<p style="margin: 6px 0; padding: 0;">
											<a href="/cou_component_document_report.show-contacts/ccdrcc_ccdrc_id/{{$row.ccdrc_id}}" class="various kill_others">{{$co_company_names.$ccdrc_co_id}}</a>
										</p>
									{{/foreach}}
								{{/if}}
								<p style="margin: 0; padding: 0; margin-top: 10px;">
									<a href="/cou_component_document_report.include_suppliers/ccdr_bsn_id/{{$item.bsn_id}}/ccdr_doc_id/149" class="various">Include Suppliers</a>
								</p>
							</div>
						</td>
					</tr>
					{{assign var=countn value=$countn-1}}
					{{/foreach}}
				</tbody>
				{{/if}}
			</table>
		</div>
</form>
	</div>
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