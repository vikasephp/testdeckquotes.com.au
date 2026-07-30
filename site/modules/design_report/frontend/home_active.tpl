<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
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
		var viewurl = "{{$BASE_URL}}design_report.view_procedure" + "/random/" + Math.random();

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

	function add_type() {
		var viewurl = "{{$BASE_URL}}design_report.viewtype" + "/random/" + Math.random();

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

	function proj_panel() {
		var viewurl = "{{$BASE_URL}}design_report.project_panel" + "/random/" + Math.random();

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

	function close_win2() {
		$.fancybox.close();
		//window.location.reload();
	}

</script>


<script type="text/javascript">
	function addfeedback(bsn_id) {
		var viewurl = "{{$BASE_URL}}design_report.addfeedback" + "/bsn_id/" + bsn_id;

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
	function add_letter() {
		var viewurl = "{{$BASE_URL}}design_report.viewletter" + "/random/" + Math.random();
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
	function viewfeedback(bsn_id) {
		var viewurl = "{{$BASE_URL}}design_report.viewfeedback" + "/bsn_id/" + bsn_id;

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
<style>
	body {
		style="border:1px solid #F00;"
	}

	.tooltip:hover .tooltiptext {
		visibility: visible;
	}

	.dtpic {
		width: 65px !important;
		padding-top: 1px !important;
		padding-bottom: 1px !important;
	}

	.set {
		font-size: 10px !important;
		width: 31px !important;
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
		width: 5490px;
		height: 20px;
	}

	.div2 {
		width: 5790px;
		overflow: auto;
	}

	.tableFixHead {
		overflow-y: auto;
		height: 1200px;
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

	#fancybox-wrap {
		z-index: 9999999;
	}
	#doclist-table th {
		z-index: 1 !important;
	}
</style>

<h3 class="page-title">Designs Report - ACTIVE</h3>
<br />

<form name="sort" method="post">
	<div style="float:left; text-align: left; margin-left:10px; text-align:left">

		&nbsp; &nbsp;<input type="button" name="proc_panel" value="Procedure Panel"
			onclick="javascript:add_procedure();" />
		<input type="button" name="Add New" value="Letter Text Admin" onclick="javascript:add_letter();" />
		<input type="button" name="Add New" value="Type Admin" onclick="javascript:add_type();" />
		<input type="button" name="Add New" value="Project Management Panel" onclick="javascript:proj_panel();" />
		<input type="submit" name="dmr" value="Design Management Report" />
		<br />

		<div style="float:left;"> &nbsp; <strong>Search:</strong>&nbsp;&nbsp;
			<input type="text" name="searchkey" value="{{$searchkey}}" style="width:400px;"
				placeholder="Search By Checklist Number" />
			&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="submit" value="Search" name="searchaddr" />
			<input type="submit" value="Clear Search" name="clear" />

			<span style="color:#0C9; font-weight:bold; border:2px solid #0C9; padding:4px; margin-left:20px;"> ACTIVE :
				{{$active}} </span>

		</div>
		<br />

		<div style="float:left;padding-left:10px;">
			<strong>Sort Order</strong>
			<select name="sortorder">
				<option value="1" {{if $ascdsc eq 1 }} selected="selected" {{/if}}> Ascending </option>
				<option value="2" {{if $ascdsc eq 2 }} selected="selected" {{/if}}> Descending </option>
			</select>
			<strong>Sort By :</strong>
			<input type="submit" value="Design Agreement Signed Date " name="dasd" />
			<input type="submit" value="Sort By Designer" name="sortbydesigner" />
			<input type="submit" value="Test" name="print_merge" />
			&nbsp; &nbsp; <span style="border:1px solid #0CF; padding:3px;"> 7 Days Design Agreements signed : {{$designagreement_data_weekly.weekly_total}} </span>
			&nbsp; &nbsp; <span style="border:1px solid #0CF; padding:3px;"> YTD Design Agreements signed  : {{$designagreement_data_ytd.ytd_total}} </span>
		</div>
		<br />
		<div style="float:left;padding-left:10px;">

			<strong>Select Designer</strong>
			<select name="design">
				{{foreach from=$des_data key="keyd" item="itemd"}}
				<option value="{{$itemd.prd_name}}" {{if $ascdsc eq 1 }} selected="selected" {{/if}}>
					{{$itemd.prd_name}} </option>
				{{/foreach}}
			</select>
			<input type="submit" value="Search" name="searchdesigner" />
			&nbsp;
			<strong>Select Type</strong>
			<select name="type">
				{{foreach from=$typeData key="key9" item="item9"}}
				<option value="{{$item9.dr_id}}" {{if $ascdsc eq 1 }} selected="selected" {{/if}}> {{$item9.dr_type}}
				</option>
				{{/foreach}}
			</select>
			<input type="submit" value="Search" name="searchtype" />

			<input type="submit" value="Show Reno Only" name="reno_only" />
			<input type="submit" value="Clear Search" name="clear" />

			<span style="padding-left:40px;">
				<!--Design Report for : &nbsp;<a href="{{$BASE_URL}}design_report.yana">Yana</a>
				&nbsp;<a href="{{$BASE_URL}}design_report.jamie">Jamie</a>
				&nbsp;<a href="{{$BASE_URL}}design_report.clare">Clare</a>-->
				<input type="submit" value="Red Light Filter" name="red_light" style="background:#F00;" />
			</span>
			<span style="display:inline-flex; font-weight:bold; vertical-align:middle;"> &nbsp; &nbsp; &nbsp; &nbsp;
				Last Audit : &nbsp;
				<form name="law" method="post" action="">
					<input type="hidden" name="audit_whole[{{$wlaData.la_id}}]" value="0" />
					<label class="switch">
						<input class="switch-input" type="checkbox" name="audit_whole[{{$wlaData.la_id}}]" value="1"
							onclick="this.form.submit();" {{if $wlaData.la_last_audit eq 1 }} checked="checked"
							{{/if}}>
						<span class="switch-label" data-on="Yes" data-off="No"></span>
						<span class="switch-handle"></span> <br />
					</label>
				</form>
				{{if $wlaData.la_last_audit  eq 1 }} Date : &nbsp;{{ $wlaData.la_last_audit_date}} &nbsp; &nbsp;&nbsp;
				Who : {{ $wlaData.la_last_audit_user}} {{/if}}
			</span>
		</div>
	</div>
</form>

<form name="mlist" method="post">
	<div style="float:right;">
		<!--<input type= "submit" name="savepercent" title="Save" value="Update % Completed"> &nbsp; &nbsp;-->
		<input type="button" value="Export To XLS"
			onclick="document.location.href='{{$BASE_URL}}design_report.home_active/export/1'" /> &nbsp;
		<!--<input type="submit" value="Show Hidden" name="unhide"  />-->
		<!--<input type="submit" value="Save Move to Inactive" name="hideupdate"  />-->
		<br />

	</div> &nbsp; &nbsp;

	<br />
	<div class="wrapper1">
		<div class="div1">
		</div>
	</div>
	<div style="border:1px solid black;width:auto;height:auto;overflow-y:hidden;overflow-x:scroll;">
		<!--<div class="wrapper2">-->
		<div class="div2 tableFixHead">
			<table id="doclist-table" class="nav-back" width="100%">
				<thead>
					<tr>
						<th class="topmenu" align="center" valign="middle" width="2%">Rating</th>
						<th class="topmenu" align="center" valign="middle" width="3%">Relevant Checklist Numbers</th>
						<th class="topmenu" align="center" valign="middle" width="3%">Type</th>
						<th class="topmenu" align="center" valign="middle" width="11%">Customer Details</th>
						<th class="topmenu" align="center" valign="middle" width="13%" data-col="customer_objectives">Customer<br>Objectives</th>
						<th class="topmenu" align="center" valign="middle" width="4%">Project Address <br />Same As<br /> Customer Address</th>
						<th class="topmenu" align="center" valign="middle" width="3%">Contacts</th>
						<th class="topmenu" align="center" valign="middle" width="3%">Link</th>
						<th class="topmenu" align="center" valign="middle" width="3%">Design <br />Agreement $$</th>
						<th class="topmenu" align="center" valign="middle" width="4%">Building File</th>
						<th class="topmenu" align="center" valign="middle" width="3%">Survey Status</th>
						<th class="topmenu" align="center" valign="middle" width="3%">Survey Details</th>
						<th class="topmenu" align="center" valign="middle" width="3%">Survey Uploaded</th>
						<th class="topmenu" align="center" valign="middle" width="3%">DWG Uploaded</th>
						<th class="topmenu" align="center" valign="middle" width="3%">Survey Implemented</th>
						<th class="topmenu" align="center" valign="middle" width="3%">Aerial Inspection Completed</th>
						<th class="topmenu" align="center" valign="middle" width="3%">RR</th>
						<th class="topmenu" align="center" valign="middle" width="3%">Scan</th>
						<th class="topmenu" align="center" valign="middle" width="3%">Reno Only</th>
						<th class="topmenu" align="center" valign="middle" width="4%">Type</th>
						<th class="topmenu" align="center" valign="middle" width="4%">What</th>
						<th class="topmenu" align="center" valign="middle" width="5%">Design <br />Agreement<br />
							Signed Date </th>
						<th class="topmenu" align="center" valign="middle" width="8%">First Meeting Date</th>
						<th class="topmenu" align="center" valign="middle" width="4%">Day Count</th>
						<th class="topmenu" align="center" valign="middle" width="7%">Designer</th>
						<th class="topmenu" align="center" valign="middle" width="7%">Overseas Architect</th>
						<th class="topmenu" align="center" valign="middle" width="7%">Commencement Plans</th>
						<th class="topmenu" align="center" valign="middle" width="7%">Latest Merge Meeting Notes</th>
						<th class="topmenu" align="center" valign="middle" width="10%">Where are we at?</th>
						<th class="topmenu" align="center" valign="middle" width="7%">% Completed</th>
						<th class="topmenu" align="center" valign="middle" width="7%">Letter Text</th>
						<th class="topmenu" align="center" valign="middle" width="7%">Plans Attached to Letter</th>
						<th class="topmenu" align="center" valign="middle" width="7%">Sales Letter</th>
						<th class="topmenu" align="center" valign="middle" width="7%">Customer<br />Budget</th>
						<th class="topmenu" align="center" valign="middle" width="5%">SQM</th>
						<th class="topmenu" align="center" valign="middle" width="14%">Estimate Build Cost</th>
						<th class="topmenu" align="center" valign="middle" width="14%">Likely site scope value</th>
						<th class="topmenu" align="center" valign="middle" width="7%">Estimated Renovation Cost</th>
						<th class="topmenu" align="center" valign="middle" width="7%">Unit Title Costs</th>
						<th class="topmenu" align="center" valign="middle" width="12%">Last Meeting</th>
						<th class="topmenu" align="center" valign="middle" width="8%">Number Of Days</th>
						<th class="topmenu" align="center" valign="middle" width="4%">Alerts</th>
						<th class="topmenu" align="center" valign="middle" width="7%">Target Design Sign Off</th>
						<th class="topmenu" align="center" valign="middle" width="7%" data-col="dpn_dr_general_hours">General Hours</th>
						<th class="topmenu" align="center" valign="middle" width="7%" data-col="dpn_dr_cust_des_hour">Customer Designer Hours</th>
						<th class="topmenu" align="center" valign="middle" width="7%" data-col="dpn_dr_overhour">Overseas Architect Hours</th>
						<th class="topmenu" align="center" valign="middle" width="7%" data-col="total_hours">Total Hours</th>
						<th class="topmenu" align="center" valign="middle" width="7%">Sign off sent date</th>
						<th class="topmenu" align="center" valign="middle" width="7%">Pricing Red Light</th>
						<th class="topmenu" align="center" valign="middle" width="4%">Proposal<br />Checklist</th>
						<th class="topmenu" align="center" valign="middle" width="4%">Latest<br />Mrged Plans</th>
						<th class="topmenu" align="center" valign="middle" width="4%">Last Spoken</th>
						<th class="topmenu" align="center" valign="middle" width="4%">Plan Rev No.</th>
						<th class="topmenu" align="center" valign="middle" width="4%">Latest<br />Client Letter</th>
						<th class="topmenu" align="center" valign="middle" width="4%">Survey Latest</th>
						<th class="topmenu" align="center" valign="middle" width="4%">Sales Follow Up</th>
						<th class="topmenu" align="center" valign="middle" width="4%">Customer Details </th>
						<th class="topmenu" align="center" valign="middle" width="4%">Last Audit </th>
						<th class="topmenu" align="center" valign="middle" width="4%">Next Schedule Meeting </th>
						<th class="topmenu" align="center" valign="middle" width="4%">Add To Utility Report</th>
						<th class="topmenu" align="center" valign="middle" width="12%">Move to Inactive </th>
						<th class="topmenu" align="center" valign="middle" width="12%">Add To Construction Pipeline Report</th>
					</tr>
				</thead>
				{{if $list}}
				<tbody>

					<!--{{assign var=countn value= $numstartvounter}}-->
					{{assign var=countn value= $total}}

					{{foreach from=$list key="key" item="item"}}


					<tr {{if $item.dpn_dr_per_complete eq 100}} bgcolor="#99CC99" {{else}} bgcolor="{{cycle values="
						#dceff5,WHITE" advance=true}} {{/if}}">
						<td>

							<select name="rating[{{$item.chknoData}}]"
								Onchange="update_rating({{$item.chknoData|ltrim:'0'}},this.value)">
								<option value="1" {{if $item.dpn_dr_rating eq 1}} selected="selected" {{/if}}> 1
								</option>
								<option value="2" {{if $item.dpn_dr_rating eq 2}} selected="selected" {{/if}}> 2
								</option>
								<option value="3" {{if $item.dpn_dr_rating eq 3}} selected="selected" {{/if}}> 3
								</option>
								<option value="4" {{if $item.dpn_dr_rating eq 4}} selected="selected" {{/if}}> 4
								</option>
								<option value="5" {{if $item.dpn_dr_rating eq 5}} selected="selected" {{/if}}> 5
								</option>
								<option value="6" {{if $item.dpn_dr_rating eq 6}} selected="selected" {{/if}}> 6
								</option>
								<option value="7" {{if $item.dpn_dr_rating eq 7}} selected="selected" {{/if}}> 7
								</option>
								<option value="8" {{if $item.dpn_dr_rating eq 8}} selected="selected" {{/if}}> 8
								</option>
								<option value="9" {{if $item.dpn_dr_rating eq 9}} selected="selected" {{/if}}> 9
								</option>
								<option value="10" {{if $item.dpn_dr_rating eq 10}} selected="selected" {{/if}}> 10
								</option>
							</select>

							<script language="javascript">

								function update_rating(id, value) {

									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_report.update_rating/dpn_unique_id/" + id + "/value/" + value,
										success: function (result) {
										}
									});

								}

							</script>

						</td>

						<td> {{$item.chknoData}} </td>
						<td> <select name="type[{{$item.chknoData}}]"
								Onchange="update_type_new({{$item.chknoData|ltrim:'0'}},this.value)">
								<option value="0">Please Select</option>
								{{foreach from=$typeData key="keyt" item="itemt"}}
								<option value="{{$itemt.dr_id}}" {{if $itemt.dr_id eq $item.dpn_dr_type_new}}
									selected="selected" {{/if}}>{{$itemt.dr_type}}</option>
								{{/foreach}}
							</select>
							<script language="javascript">
								function update_type_new(id, value) {
									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_report.update_type_new/dpn_unique_id/" + id + "/value/" + value,
										success: function (result) {
										}
									});
								}
							</script>
						</td>
						<td>
							<strong>{{$item.bcust_fname}} &nbsp; {{$item.bcust_lname}}</strong>
							<br />
							{{$item.bsn_address}}
						</td>
						<td data-col="customer_objectives">
							<a href="{{$BASE_URL}}design_report.customer_objectives/dpn_unique_id/{{$item.dpn_unique_id}}" class="various">
								<strong>Read</strong>
							</a>
							{{ if $item.dpn_customer_objectives_date }}
								<br>
								<strong style="white-space: nowrap;">Last Updated:</strong>
								<br>
								{{ $item.dpn_customer_objectives_date|date_format:"%d/%m/%Y" }}
								<br>
								{{ $item.dpn_customer_objectives_user }}
							{{ /if }}
						</td>

						<td><input type="checkbox" {{if $item.bsn_address_same eq 1}} checked="checked" {{/if}}
								readonly="readonly" /> </td>
						<td> <a href="{{$BASE_URL}}js/vcard/index.php?fname={{$item.bcust_fname}}&lname={{$item.bcust_lname}}&email1={{$item.bcust_misc_email1}}&email2={{$item.bcust_misc_email2}}&mobile={{$item.bcust_misc_moble}}&business={{$item.bcust_misc_business}}&home={{$item.bcust_misc_home}}"
								class="action_new" title="Download Vcard"><img style="height: 17px; width:22px"
									src="{{$BASE_URL}}images/vcard.png" /></a> </td>

						<td style="text-align:center;"><a href="{{$item.link}}" target="blank">Link</a></td>
						<td>
							<input type="text" name="desagr[{{$item.chknoData}}]" value="{{$item.dpn_dr_deagree}}"
								onkeyup="update_da_currency({{$item.chknoData|ltrim:'0'}},this.value)"
								style="width:50px;" />

							<script>

								function update_da_currency(id, value) {

									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_report.update_design_agree_curr/dpn_unique_id/" + id + "/value/" + value,
										success: function (result) {
										}
									});
								}

							</script>
						</td>
						<td>
							<select name="bsn_building_file[{{$item.chknoData}}]"
								Onchange="update_building_file({{$item.chknoData|ltrim:'0'}},this.value)">
								<option value="" {{if $item.dpn_dr_building_file eq '' }} selected="selected" {{/if}}>
								</option>
								<option value="Yes" {{if $item.dpn_dr_building_file eq 'Yes' }} selected="selected"
									{{/if}}> Yes </option>
								<option value="Ordered" {{if $item.dpn_dr_building_file eq 'Ordered' }}
									selected="selected" {{/if}}> Ordered </option>
								<option value="NA" {{if $item.dpn_dr_building_file eq 'NA' }} selected="selected"
									{{/if}}> NA </option>
							</select>

							<script>

								function update_building_file(id, value) {

									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_report.update_building_file/dpn_unique_id/" + id + "/value/" + value,
										success: function (result) {
										}
									});

								}

							</script>

						</td>


						<td>
							<select name="survey[{{$item.chknoData}}]"
								Onchange="update_survey({{$item.chknoData|ltrim:'0'}},this.value)">
								<option value="TBC" {{if $item.dpn_dr_survey eq 'TBC' }} selected="selected" {{/if}}>TBC
								</option>
								<option value="Requested" {{if $item.dpn_dr_survey eq 'Requested' }} selected="selected"
									{{/if}}>Requested</option>
								<option value="Client" {{if $item.dpn_dr_survey eq 'Client' }} selected="selected"
									{{/if}}>Client</option>
								<option value="CGFB" {{if $item.dpn_dr_survey eq 'CGFB' }} selected="selected" {{/if}}>
									CGFB</option>
								<option value="Uploaded" {{if $item.dpn_dr_survey eq 'Uploaded' }} selected="selected"
									{{/if}}>Received/Uploaded </option>
								<option value="Refused" {{if $item.dpn_dr_survey eq 'Refused' }} selected="selected"
									{{/if}}>Refused</option>
								<option value="Not required" {{if $item.dpn_dr_survey eq 'Not required' }}
									selected="selected" {{/if}}>Not required</option>
							</select><br />


							<input type="text" name="dpn_dr_surveydt[{{$item.chknoData}}]"
								class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo33_{{$item.chknoData}}"
								value="{{$item.dpn_dr_surveydt}}"
								onfocus="update_two({{$item.chknoData|ltrim:'0'}}, this.value);" />

							<!-- <input type="submit" value="Set" name="survey" class="set" />-->

							<script>

								function update_survey(id, value) {
									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_report.update_survey/cs_id/" + id + "/value/" + value,
										success: function (result) {
										}
									});
								}

								function update_two(id, value) {
									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_report.update_survey/cs_id2/" + id + "/value2/" + value,
										success: function (result) {
										}
									});

								}

							</script>

						</td>
						<td>
							<form name="surdet" method="post" action="">
								Surveyor :<input type="text" name="surveyor[{{$item.chknoData}}]"
									value="{{$item.dpn_dr_surveyor|urldecode}}" style="width:70px;"
									onkeyup="update_surveyor({{$item.chknoData|ltrim:'0'}},this.value)" />
								Who :<input type="text" name="who[{{$item.chknoData}}]"
									value="{{$item.dpn_dr_who_provided}}" style="width:70px;"
									onkeyup="update_who({{$item.chknoData|ltrim:'0'}},this.value)" />
								Date :<input type="text" name="cdate[{{$item.chknoData}}]"
									class="w16em dateformat-d-ds-m-ds-Y dtpic"
									id="demo44_{{$item.chknoData}}{{$item.bsn_id}}"
									value="{{$item.dpn_dr_sur_comp_date}}"
									onfocus="update_three({{$item.chknoData|ltrim:'0'}}, this.value);" />
								<!-- <input type="submit" value="Save" name="survey_details" class="set" />-->
							</form>

							<script>
								function update_three(id, value) {

									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_report.update_survey/cno/" + id + "/dt/" + value,
										success: function (result) {
										}
									});
								}

								function update_surveyor(id, value) {

									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_report.update_survey/cnos/" + id + "/sur/" + value,
										success: function (result) {
										}
									});
								}

								function update_who(id, value) {
									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_report.update_survey/cnow/" + id + "/who/" + value,
										success: function (result) {
										}
									});
								}

							</script>


						</td>
						<td>{{if $item.survey_uploaded}}
							<!--<a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.survey_uploaded}}" target="_blank">Link</a>-->
							<a href="/design_report.download_content?file_name={{$item.survey_uploaded}}&module_name=design_report.home_active"
								target="_blank">Link</a>
							{{/if}}
						</td>
						<td>
							{{if $item.checklist179_file}}
							<!-- <a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.checklist179_file}}" target="_blank">Link</a>-->
							<a href="/design_report.download_content?file_name={{$item.checklist179_file}}&module_name=design_report.home_active"
								target="_blank">Link</a>
							{{/if}}
						</td>


						{{if $item.dpn_dr_survey_imple eq 'No'}}
						<td style="background:#F00">
							{{else}}
						<td>
							{{/if}}
							<a href="{{$BASE_URL}}design_report.txtmsg/dpn_unique_id/{{$item.chknoData|ltrim:'0'}}"
								class="various">
								<img src="{{$BASE_URL}}images/textmsgyellow.png" /></a> &nbsp;
							<select name="sur_imp" onchange="update_sur_imp({{$item.chknoData|ltrim:'0'}},this.value)">
								<option value="No" {{if $item.dpn_dr_survey_imple eq 'No' }} selected="selected"
									{{/if}}>No</option>
								<option value="Yes" {{if $item.dpn_dr_survey_imple eq 'Yes' }} selected="selected"
									{{/if}}>Yes</option>
							</select> <br />
							{{if $item.dpn_dr_survey_imple eq 'Yes' }}{{$item.dpn_dr_survey_imp_user}} <br />
							{{$item.dpn_dr_survey_date}}
							{{/if}}
							<script>

								function update_sur_imp(id, value) {
									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_report.update_sur_imp/dpn_unique_id/" + id + "/value/" + value,
										success: function (result) {
										}
									});
								}
							</script>

						</td>

						<td>{{$item.tasklist303}}</td>
						<td>

							<select name="renovation_report[{{$item.chknoData}}]"
								Onchange="rr_update({{$item.chknoData|ltrim:'0'}},this.value)">
								<option value="NO" {{if $item.dpn_dr_rr eq 'NO' }} selected="selected" {{/if}}> NO
								</option>
								<option value="YES" {{if $item.dpn_dr_rr eq 'YES' }} selected="selected" {{/if}}> YES
								</option>
							</select>

							<script>

								function rr_update(id, value) {
									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_report.update_renovation_report/dpn_unique_id/" + id + "/value/" + value,
										success: function (result) {
										}
									});
								}
							</script>
						</td>

						<td>
							<form name="recmet30" method="post" action="">
								<input type="hidden" name="scan[{{$item.chknoData}}]" value="0" />
								<label class="switch">
									<input class="switch-input" type="checkbox" name="scan[{{$item.chknoData}}]"
										value="1" onclick="this.form.submit();" {{if $item.dpn_dr_scan eq 1 }}
										checked="checked" {{/if}}>
									<span class="switch-label" data-on="Yes" data-off="No"></span>
									<span class="switch-handle"></span> <br />
								</label>
							</form>
						</td>

						<td>
							<form name="recmet3" method="post" action="">
								<input type="hidden" name="renoonly[{{$item.chknoData}}]" value="0" />
								<label class="switch">
									<input class="switch-input" type="checkbox" name="renoonly[{{$item.chknoData}}]"
										value="1" onclick="this.form.submit();" {{if $item.dpn_dr_renoonly eq 1 }}
										checked="checked" {{/if}}>
									<span class="switch-label" data-on="Yes" data-off="No"></span>
									<span class="switch-handle"></span> <br />
								</label>
							</form>
						</td>



						<td>

							<select name="bsn_project_type[{{$item.chknoData}}]"
								Onchange="update_project_type({{$item.chknoData|ltrim:'0'}},this.value)">
								<option value="CD" {{if $item.dpn_dr_type eq 'CD' }} selected="selected" {{/if}}> CD
								</option>
								<option value="MD" {{if $item.dpn_dr_type eq 'MD' }} selected="selected" {{/if}}> MD
								</option>
								<option value="PR" {{if $item.dpn_dr_type eq 'PR' }} selected="selected" {{/if}}> PR
								</option>
								<option value="CR" {{if $item.dpn_dr_type eq 'CR' }} selected="selected" {{/if}}> CR
								</option>
								<option value="DO" {{if $item.dpn_dr_type eq 'DO' }} selected="selected" {{/if}}> DO
								</option>
								<option value="Redesign" {{if $item.dpn_dr_type eq 'Redesign' }} selected="selected"
									{{/if}}>Redesign </option>
								<option value="Other" {{if $item.dpn_dr_type eq 'Other' }} selected="selected" {{/if}}>
									Other </option>
							</select>

							<script>

								function update_project_type(id, value) {

									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_report.update_project_type/dpn_unique_id/" + id + "/value/" + value,
										success: function (result) {
										}
									});

								}

							</script>

						</td>

						<td>

							<select name="design_type[{{$item.chknoData}}]"
								Onchange="udt({{$item.chknoData|ltrim:'0'}},this.value)">
								<option value="SR" {{if $item.dpn_dr_what eq 'SR' }} selected="selected" {{/if}}>SR</option>
                                <option value="DE" {{if $item.dpn_dr_what eq 'DE' }} selected="selected" {{/if}}>DE</option>
								<option value="FPE" {{if $item.dpn_dr_what eq 'FPE' }} selected="selected" {{/if}}>FPE</option>
                				<option value="DO" {{if $item.dpn_dr_what eq 'DO' }} selected="selected" {{/if}}>DO</option>
                                <option value="UT" {{if $item.dpn_dr_what eq 'UT' }} selected="selected" {{/if}}>UT</option>
							</select>

							<script>

								function udt(id, value) {

									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_report.update_design_type/dpn_unique_id/" + id + "/value/" + value,
										success: function (result) {
										}
									});
								}

							</script>

						</td>
						<td>{{$item.checklist45}} </td>
						<td>
							<input type="text" name="dpn_dr_first_meeting_date[{{$item.chknoData}}]"
								class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo1_{{$item.chknoData}}"
								value="{{$item.dpn_dr_first_meeting_date}}"
								onfocus="update_fmd({{$item.chknoData|ltrim:'0'}}, this.value);" />

							<script>

								function update_fmd(id, value) {

									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_report.update_survey/fmd_id/" + id + "/fmd_value/" + value,
										success: function (result) {
										}
									});
								}

							</script>
							<!--<input type="submit" value="Set" name="myob" class="set" />-->
						</td>


						<td>{{$item.dayscount}} </td>
						<td> {{$item.dpn_customer_designer}}</td>
						<td>{{$item.osarchi}} </td>
						<td> {{if $item.checklist53_file}}
							<!--<a href="https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.checklist53_file}}" target="_blank">Download</a>-->
							<a href="/design_report.download_content?file_name={{$item.checklist53_file}}&module_name=design_report.home_active"
								target="_blank">Download</a>
							<br />
							{{$item.checklist53}}
							{{/if}}
						</td>
						<td>{{$item.checklist54}} </td>


						<td> <input type="text" name="whereare[{{$item.chknoData}}]"
								value="{{$item.dpn_dr_wherewe|urldecode}}"
								onkeyup="update_where_are({{$item.chknoData|ltrim:'0'}},this.value)" />

							<script>

								function update_where_are(id, value) {

									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_report.update_where_we_are/dpn_unique_id/" + id + "/value/" + value,
										success: function (result) {
										}
									});
								}

							</script>

						</td>

						<td>

							<form name="perc" method="post" action="">
								<input type="text" name="percentage[{{$item.chknoData}}]"
									value="{{$item.dpn_dr_per_complete}}"
									Onchange="update2({{$item.chknoData|ltrim:'0'}},this.value)" style="width:50px;" />

							</form>

							<script>

								function update2(id, value) {

									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_report.update_per2/dpn_unique_id/" + id + "/value/" + value,
										success: function (result) {
										}
									});

								}


							</script>


						</td>


						<td>
							<input type="text" name="letertext[{{$item.chknoData}}]"
								value="{{$item.dpn_dr_letter_text}}"
								Onchange="update_letter_text2({{$item.chknoData|ltrim:'0'}},this.value)"
								style="width:50px;" />

							<script>


								function update_letter_text2(id, value) {

									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_report.update_letter_text2/dpn_unique_id/" + id + "/value/" + value,
										success: function (result) {
										}
									});
								}

							</script>

						</td>


						<td>
							<form name="recmet3" method="post" action="">
								<input type="hidden" name="plan[{{$item.chknoData}}]" value="0" />
								<label class="switch">
									<input class="switch-input" type="checkbox" name="plan[{{$item.chknoData}}]"
										value="1" onclick="this.form.submit();" {{if $item.dpn_dr_plan_attached eq 1 }}
										checked="checked" {{/if}}>
									<span class="switch-label" data-on="Yes" data-off="No"></span>
									<span class="switch-handle"></span> <br />
								</label>
							</form>
						</td>
						<td>
							<form name="recmet10" method="post" action="">
								<input type="hidden" name="salesletter[{{$item.chknoData}}]" value="0" />
								<label class="switch">
									<input class="switch-input" type="checkbox" name="salesletter[{{$item.chknoData}}]"
										value="1" onclick="this.form.submit();" {{if $item.dpn_dr_sales_letter eq 1 }}
										checked="checked" {{/if}}>
									<span class="switch-label" data-on="Yes" data-off="No"></span>
									<span class="switch-handle"></span> <br />
								</label>
							</form>
						</td>


						<td>
							<form name="esti" method="post" action="">
								<input type="text" name="cust_budget[{{$item.chknoData}}]"
									value="{{$item.dpn_dr_cust_budget}}" style="width:80px" />
								<input type="submit" value="Save" name="savebudget" class="set" />
								{{ if $item.dpn_dr_cust_budget}}
								{{$item.dpn_dr_budg_user}}<br />{{$item.dpn_dr_budg_date}} {{/if}}
							</form>
						</td>

						<td>

							<input type="text" name="sqm[{{$item.chknoData}}]" value="{{$item.dpn_dr_sqm}}"
								onkeyup="update_sqm2({{$item.chknoData|ltrim:'0'}},this.value)" style="width:50px" />

							<script>


								function update_sqm2(id, value) {

									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_report.update_sqm2/dpn_unique_id/" + id + "/value/" + value,
										success: function (result) {
										}
									});
								}

							</script>

						</td>

						<td data-col="estimate_build_cost">
							<a href="{{$BASE_URL}}design_report.txtmsg_ec/dpn_unique_id/{{$item.chknoData|ltrim:'0'}}"
								class="various">
								{{if $item.dpn_dr_ebc_comm}}<img src="{{$BASE_URL}}images/textmsgyellow.png" />
								{{else}}<img src="{{$BASE_URL}}images/textmsgblue.png" />{{/if}}

							</a>

							<input type="text" name="estimate[{{$item.chknoData}}]"
								value="{{$item.dpn_dr_estimate_cost|urldecode}}"
								onkeyup="update_estimate_cost2({{$item.chknoData|ltrim:'0'}},this.value)"
								style="width:150px" />
							<select name="est_cname" onchange="update_cname({{$item.chknoData}}, 'dpn_dr_est_cname', this.value)">
								<option value="">Please Select Name</option>
								{{foreach from=$data_cname key="key_cname" item="item_cname"}}
								<option value="{{$item_cname.de_id}}" {{if $item.dpn_dr_est_cname eq $item_cname.de_id}}selected="selected"{{/if}}>{{$item_cname.de_name}}</option>
								{{/foreach}}
							</select>
							<span title="planningapprovalcanberra">REV</span>
							<input type="text" name="estimate_cmt[{{$item.chknoData}}]"
								value="{{$item.dpn_dr_ec_cmt|urldecode}}"
								onkeyup="update_estimate_cmt({{$item.chknoData|ltrim:'0'}},this.value)"
								style="width: 120px;" /> <br>
							<!--{{$item.dpn_dr_ec_date}}-->
							<input type="text" name="ebc[{{$item.chknoData}}]" class="w16em dateformat-d-ds-m-ds-Y dtpic"
								id="ebc_{{$item.chknoData}}" value="{{$item.dpn_dr_ec_date}}"
								onchange="update_ebc_date({{$item.chknoData|ltrim:'0'}}, 'dpn_dr_ec_date', this.value);"
								onblur="update_ebc_date({{$item.chknoData|ltrim:'0'}}, 'dpn_dr_ec_date', this.value);" />

							<script>

								function update_estimate_cost2(id, value) {

									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_report.update_estimate_cost2/dpn_unique_id/" + id + "/value/" + value,
										success: function (result) {
										}
									});
								}

								function update_estimate_cmt(id, value) {

									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_report.update_estimate_cost2/dpn_unique_id_cmt/" + id + "/value/" + value,
										success: function (result) {
										}
									});
								}
								
								function update_ebc_date(id, column, value) {
									value = encodeURIComponent(value);
									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_report.update_ebc_date/dpn_unique_id/" + id + "/column/"+ column +"/value/" + value,
										success: function (result) {
										}
									});
								}
								
								function update_cname(id, column, value) {
									if (value === '' || value === null || value === undefined) {
										value = 0;
									}
									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_report.update_cname/dpn_unique_id/" + id + "/column/"+ column +"/value/" + value,
										success: function (result) {
										}
									});
								}

							</script>

						</td>

						<td data-col="likely_site_scope_value">

							<a href="{{$BASE_URL}}design_report.txtmsg_lsv/dpn_unique_id/{{$item.chknoData|ltrim:'0'}}"
								class="various">
								{{if $item.dpn_dr_likey_comm}}<img src="{{$BASE_URL}}images/textmsgyellow.png" />
								{{else}}<img src="{{$BASE_URL}}images/textmsgblue.png" />{{/if}}

							</a>


							<input type="text" name="likelyvalue[{{$item.chknoData}}]"
								value="{{$item.dpn_dr_likely_value|urldecode}}"
								onkeyup="update_likely_value2({{$item.chknoData|ltrim:'0'}},this.value)"
								style="width:150px !important;" />
							<select name="likely_cname" onchange="update_cname({{$item.chknoData}}, 'dpn_dr_likely_cname', this.value)">
								<option value="">Please Select Name</option>
								{{foreach from=$data_cname key="key_cname" item="item_cname"}}
								<option value="{{$item_cname.de_id}}" {{if $item.dpn_dr_likely_cname eq $item_cname.de_id}}selected="selected"{{/if}}>{{$item_cname.de_name}}</option>
								{{/foreach}}
							</select>
							<span title="planningapprovalcanberra">REV </span><input type="text"
								name="likely_com[{{$item.chknoData}}]" value="{{$item.dpn_dr_likely_cmt|urldecode}}"
								onkeyup="update_likely_cmt({{$item.chknoData|ltrim:'0'}},this.value)"
								style="width: 120px;" /> <br />
							<!--{{$item.dpn_dr_likely_date}}-->
							<input type="text" name="likely[{{$item.chknoData}}]" class="w16em dateformat-d-ds-m-ds-Y dtpic"
								id="likely_{{$item.chknoData}}" value="{{$item.dpn_dr_likely_date}}"
								onchange="update_likely_date({{$item.chknoData|ltrim:'0'}}, 'dpn_dr_likely_date', this.value);"
								onblur="update_likely_date({{$item.chknoData|ltrim:'0'}}, 'dpn_dr_likely_date', this.value);" />


							<script>


								function update_likely_value2(id, value) {

									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_report.update_likely_value2/dpn_unique_id/" + id + "/value/" + value,
										success: function (result) {
										}
									});
								}

								function update_likely_cmt(id, value) {

									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_report.update_likely_value2/dpn_unique_id_cmt/" + id + "/value/" + value,
										success: function (result) {
										}
									});
								}
								
								function update_likely_date(id, column, value) {
									value = encodeURIComponent(value);
									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_report.update_ebc_date/dpn_unique_id/" + id + "/column/"+ column +"/value/" + value,
										success: function (result) {
										}
									});
								}
								
								function update_cname(id, column, value) {
									if (value === '' || value === null || value === undefined) {
										value = 0;
									}
									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_report.update_cname/dpn_unique_id/" + id + "/column/"+ column +"/value/" + value,
										success: function (result) {
										}
									});
								}

							</script>

						</td>

						<td data-col="estimated_renovation_cost">

							<a href="{{$BASE_URL}}design_report.txtmsg_erc/dpn_unique_id/{{$item.chknoData|ltrim:'0'}}"
								class="various">
								{{if $item.dpn_dr_erc_comm}}<img src="{{$BASE_URL}}images/textmsgyellow.png" />
								{{else}}<img src="{{$BASE_URL}}images/textmsgblue.png" />{{/if}}
							</a>


							<input type="text" name="reno_cost[{{$item.chknoData}}]"
								value="{{$item.dpn_dr_erc|urldecode}}"
								onkeyup="update_reno_cost({{$item.chknoData|ltrim:'0'}},this.value)"
								style="width:150px;" />
							<select name="likely_cname" onchange="update_cname({{$item.chknoData}}, 'dpn_dr_reno_cname', this.value)">
								<option value="">Please Select Name</option>
								{{foreach from=$data_cname key="key_cname" item="item_cname"}}
								<option value="{{$item_cname.de_id}}" {{if $item.dpn_dr_reno_cname eq $item_cname.de_id}}selected="selected"{{/if}}>{{$item_cname.de_name}}</option>
								{{/foreach}}
							</select>
							<span title="planningapprovalcanberra">REV </span><input type="text"
								name="reno_com[{{$item.chknoData}}]" value="{{$item.dpn_dr_erc_cmt|urldecode}}"
								onkeyup="update_reno_cmt({{$item.chknoData|ltrim:'0'}},this.value)"
								style="width: 120px;" /> <br />
								
							<!--{{$item.dpn_dr_erc_date}}-->
							<input type="text" name="reno[{{$item.chknoData}}]" class="w16em dateformat-d-ds-m-ds-Y dtpic"
								id="reno_{{$item.chknoData}}" value="{{$item.dpn_dr_erc_date}}"
								onchange="update_reno_date({{$item.chknoData|ltrim:'0'}}, 'dpn_dr_erc_date', this.value);"
								onblur="update_reno_date({{$item.chknoData|ltrim:'0'}}, 'dpn_dr_erc_date', this.value);" />
								
							<script>

								function update_reno_cost(id, value) {

									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_report.update_renovation_cost/dpn_unique_id/" + id + "/value/" + value,
										success: function (result) {
										}
									});
								}

								function update_reno_cmt(id, value) {

									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_report.update_renovation_cost/dpn_unique_id_cmt/" + id + "/value/" + value,
										success: function (result) {
										}
									});
								}
								
								function update_reno_date(id, column, value) {
									value = encodeURIComponent(value);
									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_report.update_ebc_date/dpn_unique_id/" + id + "/column/"+ column +"/value/" + value,
										success: function (result) {
										}
									});
								}
								
								function update_cname(id, column, value) {
									if (value === '' || value === null || value === undefined) {
										value = 0;
									}
									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_report.update_cname/dpn_unique_id/" + id + "/column/"+ column +"/value/" + value,
										success: function (result) {
										}
									});
								}

							</script>

						</td>

						<td data-col="unit_title_costs">

							<a href="{{$BASE_URL}}design_report.txtmsg_re/dpn_unique_id/{{$item.chknoData|ltrim:'0'}}"
								class="various">
								{{if $item.dpn_dr_re_comm}}<img src="{{$BASE_URL}}images/textmsgyellow.png" />
								{{else}}<img src="{{$BASE_URL}}images/textmsgblue.png" />{{/if}}


							</a>
							<input type="text" name="reno_extn[{{$item.chknoData}}]" value="{{$item.dpn_dr_r_plus_e}}"
								onkeyup="update_reno_extn2({{$item.chknoData|ltrim:'0'}},this.value)"
								style="width:150px" />
							<select name="ut_cname" onchange="update_cname({{$item.chknoData}}, 'dpn_dr_ut_cname', this.value)">
								<option value="">Please Select Name</option>
								{{foreach from=$data_cname key="key_cname" item="item_cname"}}
								<option value="{{$item_cname.de_id}}" {{if $item.dpn_dr_ut_cname eq $item_cname.de_id}}selected="selected"{{/if}}>{{$item_cname.de_name}}</option>
								{{/foreach}}
							</select>
							<span title="planningapprovalcanberra">REV </span><input type="text"
								name="ut_com[{{$item.chknoData}}]" value="{{$item.dpn_dr_ut_cmt|urldecode}}"
								onkeyup="update_ut_cmt({{$item.chknoData|ltrim:'0'}},this.value)"
								style="width: 120px;" /> <br />
							<input type="text" name="ut[{{$item.chknoData}}]" class="w16em dateformat-d-ds-m-ds-Y dtpic"
								id="ut_{{$item.chknoData}}" value="{{$item.dpn_dr_ut_date}}"
								onchange="update_ut_date({{$item.chknoData|ltrim:'0'}}, 'dpn_dr_ut_date', this.value);"
								onblur="update_ut_date({{$item.chknoData|ltrim:'0'}}, 'dpn_dr_ut_date', this.value);" />


							<script>

								function update_reno_extn2(id, value) {

									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_report.update_reno_extn/dpn_unique_id/" + id + "/value/" + value,
										success: function (result) {
										}
									});
								}

								function update_ut_cmt(id, value) {

									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_report.update_reno_extn/dpn_unique_id_cmt/" + id + "/value/" + value,
										success: function (result) {
										}
									});
								}

								function update_ut_date(id, column, value) {
									value = encodeURIComponent(value);
									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_report.update_ebc_date/dpn_unique_id/" + id + "/column/"+ column +"/value/" + value,
										success: function (result) {
										}
									});
								}

								function update_cname(id, column, value) {
									if (value === '' || value === null || value === undefined) {
										value = 0;
									}
									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_report.update_cname/dpn_unique_id/" + id + "/column/"+ column +"/value/" + value,
										success: function (result) {
										}
									});
								}

							</script>

						</td>


						<td> {{$item.checklist54}}</td>
						<td> {{$item.days}}</td>

						<td>

							<input type="text" name="alerts[{{$item.chknoData}}]"
								value="{{$item.dpn_dr_alerts|urldecode}}"
								onkeyup="update_alerts({{$item.chknoData|ltrim:'0'}},this.value)" />

							<script>

								function update_alerts(id, value) {

									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_report.update_alerts/dpn_unique_id/" + id + "/value/" + value,
										success: function (result) {
										}
									});
								}

							</script>


						</td>
						<td>
							<!--    <input type="text" name="bsn_target_signoff_date[{{$item.bsn_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo2_{{$item.bsn_id}}" value="{{$item.bsn_target_signoff_date}}" onfocus = "update_tar_sign({{$item.bsn_id}}, this.value);" /> -->
							<input type="text" name="ssod[{{$item.chknoData}}]" class="w16em dateformat-d-ds-m-ds-Y dtpic"
								id="demo200_{{$item.chknoData}}" value="{{$item.dpn_dr_tdso_dt}}"
								onfocus="update_tar_sign({{$item.chknoData|ltrim:'0'}}, this.value);" />

							<script>

								function update_tar_sign(id, value) {

									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_report.update_survey/cno_t/" + id + "/value_t/" + value,
										success: function (result) {
										}
									});
								}

							</script>

						</td>

						<td data-col="dpn_dr_general_hours">
							<input type="text" name="general_hours[{{$item.chknoData}}]" class="h1{{$item.dpn_bsn_id}}" id="h1{{$item.chknoData|ltrim:'0'}}" value="{{$item.dpn_dr_general_hours}}" onkeyup="update_gen_hours({{$item.chknoData|ltrim:'0'}}, this.value, {{$item.dpn_bsn_id}})" style="width:40px" />
							<div id="gh{{$item.chknoData|ltrim:'0'}}" class="gh{{$item.dpn_bsn_id}}">
								{{$item.dpn_dr_gen_hour_date}}<br>{{$item.dpn_dr_gen_hour_user}}
							</div>

							<script>
								function update_gen_hours(id, value, bsn_id) {
									var one = "#h1" + id;
									var two = "#h2" + id;
									var three = "#h3" + id;
									var tot = "#th" + id;
									//var  t = parseInt($(one).val()) + parseInt($(two).val()) + parseInt($(three).val());
									var t = ($(one).val() * 1) + ($(two).val() * 1) + ($(three).val() * 1);
									$(tot).val(t);
									var tana10 = "#gh" + id;

									$('.h1' + bsn_id).val($(one).val());
									$('.h2' + bsn_id).val($(two).val());
									$('.h3' + bsn_id).val($(three).val());
									$('.th' + bsn_id).val($(tot).val());
									$('.gh' + bsn_id).val($(tana10).val());

									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_report.update_general_hours/dpn_bsn_id/" + bsn_id + "/value/" + value,
										success: function (result) {
											$(tana10).html(result);

											$('.gh' + bsn_id).html(result);
										}
									});
								}
							</script>
						</td>
						<td data-col="dpn_dr_cust_des_hour">
							<input type="text" name="cust_design_hours[{{$item.chknoData}}]" class="h2{{$item.dpn_bsn_id}}" id="h2{{$item.chknoData|ltrim:'0'}}" value="{{$item.dpn_dr_cust_des_hour}}" onkeyup="update_cdh({{$item.chknoData|ltrim:'0'}}, this.value, {{$item.dpn_bsn_id}})" style="width:40px">
							<div id="usr{{$item.chknoData|ltrim:'0'}}" class="usr{{$item.dpn_bsn_id}}">
								{{$item.dpn_dr_cdh_date}}<br>{{$item.dpn_dr_cdh_user}}
							</div>
							<script>
								function update_cdh(id, value, bsn_id) {

									var one = "#h1" + id;
									var two = "#h2" + id;
									var three = "#h3" + id;
									var tot = "#th" + id;
									var t = ($(one).val() * 1) + ($(two).val() * 1) + ($(three).val() * 1);
									$(tot).val(t);
									var tana = "#usr" + id;

									$('.h1' + bsn_id).val($(one).val());
									$('.h2' + bsn_id).val($(two).val());
									$('.h3' + bsn_id).val($(three).val());
									$('.th' + bsn_id).val($(tot).val());
									$('.usr' + bsn_id).val($(tana).val());

									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_report.update_cust_design_hours/dpn_bsn_id/" + bsn_id + "/value/" + value,
										success: function (result) {
											$(tana).html(result);

											$('.usr' + bsn_id).html(result);
										}
									});
								}
							</script>
						</td>
						<td data-col="dpn_dr_overhour">
							<input type="text" name="overseas_hours[{{$item.chknoData}}]" class="h3{{$item.dpn_bsn_id}}" id="h3{{$item.chknoData|ltrim:'0'}}" value="{{$item.dpn_dr_overhour}}" onkeyup="update_oah({{$item.chknoData|ltrim:'0'}}, this.value, {{$item.dpn_bsn_id}})" style="width:40px">
							<div id="usr2{{$item.chknoData|ltrim:'0'}}" class="usr2{{$item.dpn_bsn_id}}">
								{{$item.dpn_dr_oah_date}}<br>{{$item.dpn_dr_oah_user}}
							</div>
							<script>
								function update_oah(id, value, bsn_id) {
									var one = "#h1" + id;
									var two = "#h2" + id;
									var three = "#h3" + id;
									var tot = "#th" + id;
									var t = ($(one).val() * 1) + ($(two).val() * 1) + ($(three).val() * 1);
									$(tot).val(t);
									var tana2 = "#usr2" + id;

									$('.h1' + bsn_id).val($(one).val());
									$('.h2' + bsn_id).val($(two).val());
									$('.h3' + bsn_id).val($(three).val());
									$('.th' + bsn_id).val($(tot).val());
									$('.usr2' + bsn_id).val($(tana2).val());

									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_report.update_over_archi_hours/dpn_bsn_id/" + bsn_id + "/value/" + value,
										success: function (result) {
											$(tana2).html(result);

											$('.usr2' + bsn_id).html(result);
										}
									});
								}
							</script>
						</td>
						<td data-col="total_hours">
							<input type="text" name="total_hours[{{$item.chknoData}}]" class="th{{$item.dpn_bsn_id}}" id="th{{$item.chknoData|ltrim:'0'}}" value="{{$item.total_hours}}" onchange="update_tot_hours({{$item.chknoData|ltrim:'0'}}, this.value, {{$item.dpn_bsn_id}})" style="width:40px" />
							<script>
								function update_tot_hours(id, value, bsn_id) {
									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_report.update_total_hours/dpn_bsn_id/" + bsn_id + "/value/" + value,
										success: function (result) {
										}
									});
								}
							</script>
						</td>

						<td>
							<input type="text" name="bsn_sign_off_sent_date[{{$item.chknoData}}]"
								class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo5_{{$item.chknoData}}"
								value="{{$item.dpn_dr_sign_off_sent_date}}"
								onfocus="update_sign_off_date({{$item.chknoData|ltrim:'0'}},this.value)" />
							<!--<input type="submit" value="Set" name="signoff" class="set" />-->

							<script>

								function update_sign_off_date(id, value) {

									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_report.update_survey/sign_off_id/" + id + "/value_so/" + value,
										success: function (result) {
										}
									});
								}

							</script>

						</td>


						{{ if $item.dpn_dr_traffic_light eq 1}}
						<td style="background:#00CC33" ;>
							<a href="{{$BASE_URL}}design_report.colorbox/chk_no/{{$item.chknoData}}"
								class="various">Color</a>
							<br /><br />{{$item.dpn_dr_tl_user}}<br />{{$item.dpn_dr_tl_date}}<br />
							<a href="{{$BASE_URL}}design_report.reason/chk_no/{{$item.chknoData}}"
								class="various">Read</a>
						</td>
						{{ elseif  $item.dpn_dr_traffic_light eq 2}}
						<td style="background: #ff7f27" ;>
							<a href="{{$BASE_URL}}design_report.colorbox/chk_no/{{$item.chknoData}}"
								class="various">Color</a>
							<br /><br />{{$item.dpn_dr_tl_user}}<br />{{$item.dpn_dr_tl_date}}<br />
							<a href="{{$BASE_URL}}design_report.reason/chk_no/{{$item.chknoData}}"
								class="various">Read</a>
						</td>
						{{ elseif  $item.dpn_dr_traffic_light eq 3}}
						<td style="background: #F00" ;>
							<a href="{{$BASE_URL}}design_report.colorbox/chk_no/{{$item.chknoData}}"
								class="various">Color</a>
							<br /><br />{{$item.dpn_dr_tl_user}}<br />{{$item.dpn_dr_tl_date}}<br />
							<a href="{{$BASE_URL}}design_report.reason/chk_no/{{$item.chknoData}}"
								class="various">Read</a>
						</td>
						{{else }}
						<td>
							<a href="{{$BASE_URL}}design_report.colorbox/chk_no/{{$item.chknoData}}"
								class="various">Color</a>
						</td>
						{{/if}}



						<td>{{$item.prochklist}} </td>
						<td>

							{{$item.lmp_date}}
							{{if $item.lmp_date}}<br />
							<!-- <a href = "https://deckquote.s3.amazonaws.com/files/document_check_list_files/{{$item.lmp_doc_file_name}}" target="_blank">Download</a>-->
							<a href="/design_report.download_content?file_name={{$item.lmp_doc_file_name}}&module_name=design_report.home_active"
								target="_blank">Download</a>
							{{/if}}

						</td>

						<td>
							<form name="mlist_Ls" method="post" action="">
								<input type="text" name="dpn_dr_last_spoken[{{$item.chknoData}}]"
									class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo22_{{$item.chknoData}}"
									value="{{$item.dpn_dr_last_spoken}}" />
								<input type="submit" value="Set" name="last_spoken" class="set" />
							</form>
							{{if $item.dpn_dr_last_spoken}} {{$item.dpn_dr_last_spoken_date}} <br />
							{{$item.dpn_dr_last_spoken_user}} {{/if}}

						</td>
						<td>
							<input type="text" name="total_hours[{{$item.chknoData}}]"
								id="th{{$item.chknoData|ltrim:'0'}}" value="{{$item.dpn_dr_plan_revno}}"
								onchange="update_plan({{$item.chknoData|ltrim:'0'}},this.value)"
								style="width:40px" />

							<script>

								function update_plan(id, value) {

									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_report.update_plan/dpn_unique_id/" + id + "/value/" + value,
										success: function (result) {
										}
									});
								}

							</script>

						</td>
						<td>
						
							{{if $item.client_letter_458}}
								<a href="{{$BASE_URL}}design_report.download_content?file_name={{$item.client_letter_458}}&module_name=design_report.home_active" title="{{$item.client_letter_458}}" target="_blank">Download</a>
							{{/if}} 
						 
							<!--<form name="pw" method="post" enctype="multipart/form-data">
								<input type="hidden" name="dpn_unique_id" value="{{$item.chknoData}}" />
								<input type="file" name="letter" /><br />
								{{if $item.dpn_dr_latest_letter}}
								<div style="text-align:center;">
									<a href="/design_report.download_content_up?file_name={{$item.dpn_dr_latest_letter}}&module_name=design_report.home_active"
										target="_blank">Download</a>

									<a href="{{$BASE_URL}}design_report.delete_w/dpn_unique_id/{{$item.chknoData}}"
										onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;"
										title="Delete"><img src="{{$BASE_URL}}/images/delete_icon.png"
											width="20" /></a>

								</div> {{/if}}
								<input type="submit" name="upload_letter" title="Save" value="Upload" class="set2">
								&nbsp;
							</form>-->
						</td>

						<td>

							<form name="pw" method="post" enctype="multipart/form-data">
								<input type="hidden" name="dpn_unique_id" value="{{$item.chknoData}}" />
								<input type="file" name="custsurvey" /><br />
								{{if $item.dpn_dr_cust_survey}}
								<div style="text-align:center;">
									<!--<a href="https://deckquote.s3.amazonaws.com/files/uploads/{{$item.dpn_dr_cust_survey}}" target="_blank">Download</a>-->
									<a href="/design_report.download_content_up?file_name={{$item.dpn_dr_cust_survey}}&module_name=design_report.home_active"
										target="_blank">Download</a>


									<a href="{{$BASE_URL}}design_report.delete_cs/dpn_unique_id/{{$item.chknoData}}"
										onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;"
										title="Delete"><img src="{{$BASE_URL}}/images/delete_icon.png"
											width="20" /></a>

								</div> {{/if}}
								<input type="submit" name="upload_cu_survey" title="Save" value="Upload"
									class="set2"> &nbsp;
							</form>

						</td>

						<td>
							<input type="button" name="Alert" value="Add Feedback"
								onclick="javascript:addfeedback({{$item.bsn_id}});"
								style="width:90px; height:20px; font-size:11px; line-height:17px !important; padding:0px !important" /><br />
							<input type="button" name="Alert" value="View Feedback"
								onclick="javascript:viewfeedback({{$item.bsn_id}});"
								style="width:90px; height:20px; font-size:11px; line-height:17px !important; padding:0px !important" />
						</td>


						<td> <strong>{{$item.bcust_fname}} &nbsp; {{$item.bcust_lname}}</strong> <br />
							{{$item.bsn_address}}
						</td>


						<td>
							<input type="text" name="dpn_dr_last_audit[{{$item.dbp_unique_id}}]"
								class="w16em dateformat-d-ds-m-ds-Y dtpic"
								id="demo442_{{$item.chknoData}}{{$item.bsn_id}}" value="{{$item.dpn_dr_last_audit}}"
								onfocus="update_last_audit({{$item.chknoData|ltrim:'0'}}, this.value);" />
							{{if $item.dpn_dr_last_audit}} {{$item.dpn_dr_last_audit_user}} {{/if}}
							<script>

								function update_last_audit(id, value) {

									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}design_report.update_last_audit/dpn_unique_id/" + id + "/value/" + value,
										success: function (result) {
										}
									});
								}

							</script>


						</td>
						<td>
							<select style="width: 225px;" name="bsn_sales_next_meeting_where" onchange="updateRecord('{{ $item.bsn_id }}', 'dpn_dr_next_meeting', this.value)">
								<option value="">Select</option>
								<option value="Initial Design Meeting(IDM)" {{ if $item.dpn_dr_next_meeting == 'Initial Design Meeting(IDM)' }}selected="selected"{{ /if }}>Initial Design Meeting(IDM)</option>
								<option value="Followup Design Meeting(FDM)" {{ if $item.dpn_dr_next_meeting == 'Followup Design Meeting(FDM)' }}selected="selected"{{ /if }}>Followup Design Meeting(FDM)</option>
								<option value="Kick Off Design Meeting(KDM)" {{ if $item.dpn_dr_next_meeting == 'Kick Off Design Meeting(KDM)' }}selected="selected"{{ /if }}>Kick Off Design Meeting(KDM)</option>
								<option value="Proposal Delivery Appoitment(PDA)" {{ if $item.dpn_dr_next_meeting == 'Proposal Delivery Appoitment(PDA)' }}selected="selected"{{ /if }}>Proposal Delivery Appoitment(PDA)</option>
								<option value="Presentation Design Meeting(PDM)" {{ if $item.dpn_dr_next_meeting == 'Presentation Design Meeting(PDM)' }}selected="selected"{{ /if }}>Presentation Design Meeting(PDM)</option>
							</select>
							<br>
							<input type="text" name="dpn_dr_next_date" class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo452_{{$item.chknoData}}{{$item.bsn_id}}" onfocus="updateRecord('{{ $item.bsn_id }}', 'dpn_dr_next_date', this.value)" value="{{$item.dpn_dr_next_date}}">
							<br>
							<input type="text" name="dpn_dr_next_time" placeholder="Time" value="{{$item.dpn_dr_next_time}}" onkeyup="updateRecord('{{ $item.bsn_id }}', 'dpn_dr_next_time', this.value)">
							<br>
							<input style="width: 225px;" type="text" name="dpn_dr_next_location" placeholder="Location" value="{{$item.dpn_dr_next_location}}" onkeyup="updateRecord('{{ $item.bsn_id }}', 'dpn_dr_next_location', this.value)">
							<br>
							<textarea style="width: 225px;" name="dpn_dr_next_link" placeholder="Link" onkeyup="updateRecord('{{ $item.bsn_id }}', 'dpn_dr_next_link', this.value)">{{$item.dpn_dr_next_link}}</textarea>
						</td>
						<td>
							<form name="utilityform" method="post" action="">
								<input type="hidden" name="utility[{{$item.chknoData}}]" value="0" />
								<label class="switch">
									<input class="switch-input" type="checkbox" name="utility[{{$item.chknoData}}]"
										value="1" onclick="this.form.submit();" {{if $item.dpn_err_add eq 1 }}
										checked="checked" {{/if}}>
									<span class="switch-label" data-on="Yes" data-off="No"></span>
									<span class="switch-handle"></span> <br />
						</td>
						<td>

							<input type="hidden" name="hide[{{$item.chknoData}}]" value="0" />
							<label class="switch">

								<!--<input class="switch-input" type="checkbox"  name="hide[{{$item.chknoData}}_{{$item.bs_customers_id}}]" {{if $item.dpn_dr_hide eq 1 }} checked="checked" {{/if}} /> -->
								<input class="switch-input" type="checkbox" value="1" name="hide[{{$item.chknoData}}]" onclick="this.form.submit();" {{if $item.dpn_dr_hide eq 1 }} checked="checked" {{/if}}>
								<span class="switch-label" data-on="Yes" data-off="No"></span>
								<span class="switch-handle"></span> <br />
							</label>

						</td>
						<td>
							<form name="showincpr" method="post" action="">
								<input type="hidden" name="incpr[{{$item.bsn_id}}]" value="0" />
								<label class="switch">
									<input class="switch-input" type="checkbox" name="incpr[{{$item.bsn_id}}]" value="1" onclick="this.form.submit();" {{if $item.bsn_showin_cpr eq 1 }} checked="checked" {{/if}}>
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
			<div class='pagination'> {{if $pagenum == 1}} <span class='disabled'>
					<< previous</span>
						{{else}} <a class="pagination" href="{{$BASE_URL}}{{$XFA.home_active}}/pagenum/{{math equation="
								x - y" x=$pagenum y=1}}" title="Previous">
								<< previous</a> {{/if}}

									{{if $pagenum != 1}} <span class="paginate"><a class="pagination"
											href="{{$BASE_URL}}{{$XFA.home_active}}/pagenum/1"
											title="{{$page_num}} Page">1</a></span>
									{{else}}<span class='current'>1</span> {{/if}}{{if $pagenum != 2}} <span
											class="paginate"><a class="pagination"
												href="{{$BASE_URL}}{{$XFA.home_active}}/pagenum/2"
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
													{{if $page_num2 == $pagenum OR $page_num2 <= 0}} <span
														class='current'> {{$page_num2}}</span>
													{{else}} <a class="pagination"
															href="{{$BASE_URL}}{{$XFA.home_active}}/pagenum/{{$page_num2}}"
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
															{{if $pagenum == $lastone }} <span
																class='current'>{{$lastone}}</span>
															{{else}} <a class="pagination"
																	href="{{$BASE_URL}}{{$XFA.home_active}}/pagenum/{{$lastone}}"
																	title="{{$lastone}} Page">{{$lastone}}</a> {{/if}}
																{{/if}}
																{{if $last == 1}}
																{{elseif $last == 2}}
																{{else}}
																	{{if $pagenum == $last}} <span
																		class='current'>{{$last}}</span>
																	{{else}} <a class="pagination"
																			href="{{$BASE_URL}}{{$XFA.home_active}}/pagenum/{{$last}}"
																			title="{{$last}} Page">{{$last}}</a> {{/if}}
																		{{/if}}
																		{{if $pagenum == $last}} <span
																			class='disabled'>next >></span>
																		{{else}} <a class="pagination"
																				href="{{$BASE_URL}}{{$XFA.home_active}}/pagenum/{{math equation="
																				x + y" x=$pagenum y=1}}"
																				title="Next">next >></a></div>
			{{/if}}
		</td>
		{{else}}
			<td align="center" height="300">Record Not found... </td>
			{{/if}}
	</tr>
</table>
{{/if}}

</div>
</div>

<script>
	function updateRecord(primaryID, column, value, updateRecord = false) {
        const formData = {
            primaryID: primaryID,
            column: column,
            value: value,
            action: "updateNextMeeting"
        };
        $.ajax({
            type: "POST",
            url: "{{$BASE_URL}}{{ $BASEFOLDER }}.ajax_handler",
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
	function update_next_date(id, value) {
		$.ajax({
			type: "GET",
			url: "{{$BASE_URL}}design_report.update_next/dpn_unique_id_nd/" + id + "/value/" + value,
			success: function (result) {
			}
		});
	}

	function update_next_time(id, value) {
		$.ajax({
			type: "GET",
			url: "{{$BASE_URL}}design_report.update_next/dpn_unique_id_nt/" + id + "/value/" + value,
			success: function (result) {
			}
		});
	}

	function update_next_location(id, value) {
		$.ajax({
			type: "GET",
			url: "{{$BASE_URL}}design_report.update_next/dpn_unique_id_nl/" + id + "/value/" + value,
			success: function (result) {
			}
		});
	}
</script>