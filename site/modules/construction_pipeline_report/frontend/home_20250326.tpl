<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/default.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/tree/simpletreemenu.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tree/simpletree.css" />
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
			'width': '75%',
			'height': '75%',
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


	function show_notes(ssid) {
		var viewurl = "{{$BASE_URL}}street_sign.show-notes-content" + "/ss_id/" + ssid;

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
		var viewurl = "{{$BASE_URL}}street_sign.detail" + "/random/" + Math.random();
		$(document).ready(function () {
			$.fancybox({
				'width': '78%',
				'height': '80%',
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

	function add_procedure() {
		var viewurl = "{{$BASE_URL}}construction_pipeline_report.view_procedure" + "/random/" + Math.random();

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

	function add_sn() {
		var viewurl = "{{$BASE_URL}}construction_pipeline_report.view_sn" + "/random/" + Math.random();
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

	function pm_could() {
		var viewurl = "{{$BASE_URL}}construction_pipeline_report.pm_could_start" + "/random/" + Math.random();
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

	function pm_onsite() {
		var viewurl = "{{$BASE_URL}}construction_pipeline_report.pm_onsite" + "/random/" + Math.random();
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


<script type="text/javascript">
	function addfeedback(bsn_id) {
		var viewurl = "{{$BASE_URL}}planning_assesment_quickreport.addfeedback" + "/bsn_id/" + bsn_id;


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
		var viewurl = "{{$BASE_URL}}construction_pipeline_report.view_type" + "/random/" + Math.random();

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
</style>

<h3 class="page-title">{{$title}}</h3>
<br />
<form name="mlist" method="post" enctype="multipart/form-data">

	<div style="float:left; text-align:left;">
		&nbsp; &nbsp; <input type="button" name="proc_panel" value="Procedure Panel"
			onclick="javascript:add_procedure();" />
		&nbsp; <input type="button" name="Add New" value="Project Type" onclick="javascript:add_type();" />
		&nbsp;<input type="button" name="Add New" value="Sth/Nth Admin" onclick="javascript:add_sn();" />
		&nbsp;<input type="submit" name="sortby_csd" value="Sort by Could Start Build Date" /> <br />
		&nbsp; &nbsp; <input type="button" name="pm1" value="Project Management - Could Start"
			onclick="javascript:pm_could();" />
		&nbsp;<input type="button" name="pm2" value="Project Management - Onsite" onclick="javascript:pm_onsite();" />
		&nbsp;&nbsp; <span style="border:1px solid #0CF; padding:3px;"> HIA : {{$hia}} </span>
		&nbsp;&nbsp; <span style="border:1px solid #0CF; padding:3px;"> No HIA : {{$nohia}} </span>
		&nbsp;&nbsp; <span style="border:1px solid #0CF; padding:3px;"> Commencement Notice : {{$tot_com_notice}} </span>
		
	</div>
	<div style="float:right; text-align:right;">
		<input type="submit" name="reset" title="Reset" value="Reset">
		<input type="button" value="Export To XLS"
			onclick="document.location.href='{{$BASE_URL}}construction_pipeline_report.home/export/1'" /> &nbsp;
		<input type="submit" name="hbyes" title="hb" value="Show Home Builder YES Only">
		<input type="submit" name="sortlikely" title="Sort" value="Sort By Likely Comm. Date"> <br />
		<input type="submit" name="savedata" title="Save" value="Upload Construction Comm. Letter">
		&nbsp;<input type="submit" value="Show Hidden" name="unhide" />
		&nbsp;<input type="submit" value="Show UnHidden" name="unhidden" />
	</div>

	</div>
	<div style="float:left; width:100%;">
		<table id="doclist-table" class="nav-back" width="100%">
			<thead>
				<tr>
					<th class="topmenu" align="center" valign="middle" width="3%">SrNo</th>
					<th class="topmenu" align="center" valign="middle" width="6%">Hide From Report</th>
					<th class="topmenu" align="center" valign="middle" width="14%" data-col="project_address">Project Address</th>
					<!-- <th class="topmenu" align="center" valign="middle" width="3%">Link</th> -->
					<th class="topmenu" align="center" valign="middle" width="3%">HIA Sign Date</th>
					<!-- <th class="topmenu" align="center" valign="middle" width="3%">Likley hia Sign Date</th> -->
					<th class="topmenu" align="center" valign="middle" width="3%">Sth/Nth </th>
					<th class="topmenu" align="center" valign="middle" width="3%">Status's</th>
					<th class="topmenu" align="center" valign="middle" width="3%">Project Type</th>
					<!-- <th class="topmenu" align="center" valign="middle" width="8%">Construction Commencement<br /> Letter -->
					</th>
					<!--<th class="topmenu" align="center" valign="middle" width="8%">Plans Audited</th>-->
					<th class="topmenu" align="center" valign="middle" width="8%">Sub Status</th>
					<th class="topmenu" align="center" valign="middle" width="3%">Government commencement notice date</th>
					<th class="topmenu" align="center" valign="middle" width="3%" data-col="commencement_day_difference">Commencement Day difference</th>
					<th class="topmenu" align="center" valign="middle" width="3%">Planning Traffic Light</th>
					<!-- <th class="topmenu" align="center" valign="middle" width="3%">Likely to Commence Construction Date From the Inclusions Task Tracker </th> -->
					<th class="topmenu" align="center" valign="middle" width="3%">Inclusions Traffic Light </th>
					<th class="topmenu" align="center" valign="middle" width="8%">Amount Deposit Paid</th>
					<th class="topmenu" align="center" valign="middle" width="8%" data-col="commencement_notice">Commencement Notice</th>
					<th class="topmenu" align="center" valign="middle" width="8%" data-col="latest_planning_letter">Latest Planning Letter</th>
					<th class="topmenu" align="center" valign="middle" width="8%" data-col="latest_inclusions_letter">Latest Inclusions Letter</th>
					<th class="topmenu" align="center" valign="middle" width="8%">Original onsite starting date</th>
					<th class="topmenu" align="center" valign="middle" width="8%">Latest Onsite Date</th>
					<th class="topmenu" align="center" valign="middle" width="3%">Day Count</th>
					<th class="topmenu" align="center" valign="middle" width="3%" data-col="change_log">Change Log</th>
					<th class="topmenu" align="center" valign="middle" width="7%">Last QAed by Construction Leader</th>
					<th class="topmenu" align="center" valign="middle" width="8%">Commencement Meeting Booked</th>
					<th class="topmenu" align="center" valign="middle" width="8%">Move to Construction in Progress
						Report</th>


				</tr>
				{{if $list}}
			<tbody>

				<!--{{assign var=countn value= $numstartvounter}}-->
				{{assign var=countn value= $total}}

				{{foreach from=$list key="key" item="item"}}
				<tr bgcolor="{{cycle values=" #D3E8D6,WHITE" advance=true}}">
					<td> {{$countn}} </td>
					<td>
						<form name="recmet" method="post" action="">
							<input type="hidden" name="hide[{{$item.bsn_id}}]" value="0" />
							<label class="switch">
								<input class="switch-input" type="checkbox" name="hide[{{$item.bsn_id}}]" value="1"
									onclick="this.form.submit();" {{if $item.bs_cpr_hide eq 1 }} checked="checked"
									{{/if}} />
								<span class="switch-label" data-on="Yes" data-off="No"></span>
								<span class="switch-handle"></span> <br />
							</label>
						</form>


					</td>

					<td data-col="project_address">
						<a href="{{$item.link}}" target="blank">{{$item.bsn_address}}</a>
					</td>
					<!-- <td style="text-align:center;"><a href="{{$item.link}}" target="blank">Link</a></td> -->
					<td> {{$item.doc_date_uploaded}}</td>
					<!-- <td>

						<form name="lhsd" method="post" action="">
							<input type="text" name="bs_cpr_lik_hia_date[{{$item.bsn_id}}]"
								class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo10_{{$item.bs_customers_id}}"
								value="{{$item.bs_cpr_lik_hia_date}}" />
							<input type="submit" value="Set" name="likelyhia" class="set" />
						</form>
						{{if $item.bs_cpr_lik_hia_date}} {{$item.bs_cpr_lik_hia_user}} {{/if}}
					</td> -->

					<td>

						<select name="sn[{{$item.bsn_id}}]" Onchange="update_sn({{$item.bsn_id}},this.value)">
							{{foreach from=$snData key="keysn" item="itemsn"}}
							<option value="{{$itemsn.sn_id}}" {{if $itemsn.sn_id eq $item.bs_cpr_sn}}
								selected="selected" {{/if}}>{{$itemsn.sn_option}}</option>
							{{/foreach}}
						</select>

						<script>

							function update_sn(id, value) {

								$.ajax({
									type: "GET",
									url: "{{$BASE_URL}}construction_pipeline_report.update_sn_th/id/" + id + "/value/" + value,
									success: function (result) {
									}
								});
							}

						</script>


					</td>

					<td>{{$item.status}}</td>
					<td>
						<select name="proj_type" Onchange="update_ptype({{$item.bsn_id}},this.value)" style="width: 180px;">
							<option value="">Please Select </option>
							{{foreach from = $typedata key="keyt" item="itemt"}}
							<option value="{{$itemt.to_id}}" {{if $itemt.to_id eq $item.bsn_cip_proj_type}}
								selected="selected" {{/if}}>{{$itemt.to_type_option}}</option>
							{{/foreach}}
						</select>

						<script>

							function update_ptype(id, value) {

								$.ajax({
									type: "GET",
									url: "{{$BASE_URL}}construction_pipeline_report.update_type/bsn_id/" + id + "/value/" + value,
									success: function (result) {
									}
								});
							}
						</script>

					</td>

					<!-- <td>
						<input type="file" name="cpr_cc_letter[{{$item.bsn_id}}]" /><br />
						{{if $item.bs_cpr_cc_letter}}
						<div style="text-align:center;">
							<a href="/construction_pipeline_report.download_content?file_name={{$item.bs_cpr_cc_letter}}&module_name=construction_pipeline_report.home"
								target="_blank">Download</a>
						</div> {{/if}}
					</td> -->
					<!--<td>
      
        
							<form name ="recmet3" method="post" action="">
							<input type="hidden" name="plans[{{$item.bsn_id}}]" value="0" />
						<label class="switch">
						<input class="switch-input" type="checkbox"  name="plans[{{$item.bsn_id}}]" value="1"  onclick="this.form.submit();" {{if $item.bs_cpr_plans_audited eq 1 }} checked="checked" {{/if}} />
							<span class="switch-label" data-on="Yes" data-off="No"></span> 
							<span class="switch-handle"></span> <br />
						</label> 
						</form>        
						{{if $item.bs_cpr_plans_audited eq 1 }} {{$item.bs_cpr_plans_audited_user}} <br /> {{$item.bs_cpr_plans_audited_date}} {{/if}}
						</td>-->

					<td>
						<select name="sub" Onchange="update_substatus({{$item.bsn_id}},this.value)" style="width: 180px;">
							<option value="1" {{if $item.bs_cpr_sub_status eq 1}} selected="selected" {{/if}}>
								Commencement and warranty received</option>
							<option value="2" {{if $item.bs_cpr_sub_status eq 2}} selected="selected" {{/if}}>Warranty
								received, commencement applied for</option>
							<option value="3" {{if $item.bs_cpr_sub_status eq 3}} selected="selected" {{/if}}>Warranty
								applied for</option>
							<option value="4" {{if $item.bs_cpr_sub_status eq 4}} selected="selected" {{/if}}>No
								warranty applied for</option>
						</select>

						<script>

							function update_substatus(id, value) {

								$.ajax({
									type: "GET",
									url: "{{$BASE_URL}}construction_pipeline_report.update_substatus/bsn_id/" + id + "/value/" + value,
									success: function (result) {
									}
								});
							}
						</script>

					</td>


					<td>
						{{ $item.bsn_latest_csbd }}
						{{ if $item.bsn_latest_csbd }}
							<br>
							<br>
							<strong>User:</strong> {{ $item.bsn_latest_csbd_user }}
							<br />
							<strong>Date:</strong> {{ $item.bsn_latest_csbd_date }}
						{{ /if }}
					</td>

					<td data-col="commencement_day_difference">
						{{if ($item.bsn_orginal_csbd) and ($item.bsn_latest_csbd) }}
							{{assign var=num1 value=$item.bsn_orginal_csbd|@strtotime}}
							{{assign var=num2 value=$item.bsn_latest_csbd|@strtotime}}
							{{assign var=diff value=$num2-$num1}}
							{{assign var=final value=$diff/86400}}
							{{$final|string_format:"%d"}}
						{{/if}}
					</td>

					{{ if $item.bs_traffic_light eq 1}}
					<td style="background:#00CC33" ;><br /><br />{{$item.bs_tl_user}}<br />{{$item.bs_tl_date}}<br />
						<a href="{{$BASE_URL}}construction_pipeline_report.reason/bsn_id/{{$item.bsn_id}}/a/1"
							class="various">Read</a><br />
						<a href="{{$BASE_URL}}construction_pipeline_report.show_update_notes/bsn_id/{{$item.bsn_id}}"
							class="various">Notes</a>
					</td>
					{{ elseif  $item.bs_traffic_light eq 2}}
					<td style="background: #ff7f27" ;><br /><br />{{$item.bs_tl_user}}<br />{{$item.bs_tl_date}}<br />
						<a href="{{$BASE_URL}}construction_pipeline_report.reason/bsn_id/{{$item.bsn_id}}/a/1"
							class="various">Read</a><br />
						<a href="{{$BASE_URL}}construction_pipeline_report.show_update_notes/bsn_id/{{$item.bsn_id}}"
							class="various">Notes</a>
					</td>
					{{ elseif  $item.bs_traffic_light eq 3}}
					<td style="background: #F00" ;><br /><br />{{$item.bs_tl_user}}<br />{{$item.bs_tl_date}}<br />
						<a href="{{$BASE_URL}}construction_pipeline_report.reason/bsn_id/{{$item.bsn_id}}/a/1"
							class="various">Read</a><br />
						<a href="{{$BASE_URL}}construction_pipeline_report.show_update_notes/bsn_id/{{$item.bsn_id}}"
							class="various">Notes</a>
					</td>
					{{ elseif  $item.bs_traffic_light eq 4}}
					<td style="background: #FFFF00" ;><br /><br />{{$item.bs_tl_user}}<br />{{$item.bs_tl_date}}<br />
						<a href="{{$BASE_URL}}construction_pipeline_report.reason/bsn_id/{{$item.bsn_id}}/a/1"
							class="various">Read</a><br />
						<a href="{{$BASE_URL}}construction_pipeline_report.show_update_notes/bsn_id/{{$item.bsn_id}}"
							class="various">Notes</a>
					</td>
					{{else }}

						<td></td>
						{{/if}}

						<!-- <td>{{$item.bsn_incl_cc_date}} </td> -->


						{{ if $item.bs_traffic_light_incl eq 1}}
						<td style="background:#00CC33" ;>
							<br />{{$item.bs_tl_user_incl}}<br />{{$item.bs_tl_date_incl}}<br>
							<a href="{{$BASE_URL}}construction_pipeline_report.reason/bsn_id/{{$item.bsn_id}}/a/2"
								class="various">Read</a>
						</td>
						{{ elseif  $item.bs_traffic_light_incl eq 2}}
						<td style="background: #ff7f27" ;>
							<br />{{$item.bs_tl_user_incl}}<br />{{$item.bs_tl_date_incl}}<br />
							<a href="{{$BASE_URL}}construction_pipeline_report.reason/bsn_id/{{$item.bsn_id}}/a/2"
								class="various">Read</a>
						</td>

						{{ elseif  $item.bs_traffic_light_incl eq 3}}
						<td style="background: #F00" ;>
							<br />{{$item.bs_tl_user_incl}}<br />{{$item.bs_tl_date_incl}}<br />
							<a href="{{$BASE_URL}}construction_pipeline_report.reason/bsn_id/{{$item.bsn_id}}/a/2"
								class="various">Read</a>
						</td>
						{{else }}
							<td></td>
							{{/if}}

							<td>
								<form name="form1" method="post" action="">
									<input type="text" name="amt_depo_date[{{$item.bsn_id}}]"
										value="{{$item.bs_cpr_amt_depo_paid}}"
										onkeyup="update_amt_depopaid({{$item.bsn_id}},this.value)"
										style="width:70px;" />
									{{$item.bs_cpr_paid_user}}<br />
									<input type="text" name="bs_cpr_paid_date[{{$item.bsn_id}}]"
										class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo4_{{$item.bs_customers_id}}"
										value="{{$item.bs_cpr_paid_date}}" />
									<input type="submit" value="Set" name="amtpaid" class="set" /><br />
								</form>


								<script>

									function update_amt_depopaid(id, value) {

										$.ajax({
											type: "GET",
											url: "{{$BASE_URL}}construction_pipeline_report.update_amt_depo_paid/bsn_id/" + id + "/value/" + value,
											success: function (result) {
											}
										});
									}
								</script>
							</td>
							<td data-col="commencement_notice">
								{{if $item.commencement_notice}}
									<a href="/construction_pipeline_report.download_content?file_name={{$item.commencement_notice}}&module_name=business.home" target="_blank">Link</a>
								{{/if}}
							</td>
							<td data-col="latest_planning_letter">
								{{if $item.latest_planning_letter}}
									<a href="/construction_pipeline_report.download_content?file_name={{$item.latest_planning_letter}}&module_name=business.home" target="_blank">Link</a>
								{{/if}}
							</td>
							<td data-col="latest_inclusions_letter">
								{{if $item.latest_inclusions_letter}}
									<a href="/construction_pipeline_report.download_content?file_name={{$item.latest_inclusions_letter}}&module_name=business.home" target="_blank">Link</a>
								{{/if}}
							</td>
							
							
							<!-- <td>

								<form name="hia" method="post" action="">
									<input type="text" name="hia[{{$item.bcust_id}}]"
										value="{{$item.bcust_cpr_hia_value}}"
										onkeyup="update_hia({{$item.bcust_id}},this.value)" />
								</form>

								<script>

									function update_hia(id, value) {

										$.ajax({
											type: "GET",
											url: "{{$BASE_URL}}construction_pipeline_report.update_hia_value/bcust_id/" + id + "/value/" + value,
											success: function (result) {
											}
										});
									}
								</script>

							</td> -->
							<td>
								<form name="original_starting_date" method="post" action="">
									<input type="text" name="bs_original_starting_date[{{$item.bsn_id}}]"
										class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo5_{{$item.bs_customers_id}}"
										value="{{$item.bs_original_starting_date}}" />
									<input type="submit" value="Set" name="original_starting_date" class="set" />
								</form>
								{{if $item.bs_original_starting_doc}}
									<a href="/construction_pipeline_report.download_content?file_name={{$item.bs_original_starting_doc}}&module_name=business.home" target="_blank">Download</a>
								{{/if}}								
								<br>
								{{if $item.bs_original_starting_user}} <strong>User:</strong> {{$item.bs_original_starting_user}} {{/if}}
							</td>
							<td>
								<form name="pbd" method="post" action="">
									<input type="text" name="bsn_starting_onsite_date[{{$item.bsn_id}}]"
										class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo2_{{$item.bs_customers_id}}"
										value="{{$item.bsn_starting_onsite_date}}" />
									<input type="submit" value="Set" name="pbd" class="set" />
								</form>
								{{if $item.bsn_starting_onsite_date}} {{$item.bsn_onsite_user}} {{/if}}
							</td>

							<td data-day-count>
								{{if ($item.bs_original_starting_date) and ($item.bsn_starting_onsite_date) }}
								{{assign var=num1 value=$item.bsn_starting_onsite_date|@strtotime}}
								{{assign var=num2 value=$item.bs_original_starting_date|@strtotime}}
								{{assign var=diff value=$num1-$num2}}
								{{assign var=final value=$diff/86400}}
								{{$final|string_format:"%d"}}
								{{/if}}
							</td>
							<td data-col="change_log">
								<table>
									<tr>
										<th>Date Changed</th>
										<th>Onsite Day</th>
										<th>Day</th>
									</tr>
									{{ foreach from=$item.change_log key="index" item="row" }}
									<tr>
										<td>
											{{ if $row.cprol_log_date }}
											{{ $row.cprol_log_date|date_format:"%d-%m-%Y" }}
											{{ /if }}
										</td>
										<td>
											{{ if $row.cprol_onsite_date }}
											{{ $row.cprol_onsite_date|date_format:"%d-%m-%Y" }}
											{{ /if }}
										</td>
										<td>
											{{ if $index eq 0 }}
												0
											{{ else }}
												{{ assign var=pre_index value=$index-1 }}
												<!-- {{ $item.change_log[$pre_index].cprol_log_date }} -->
												{{ assign var=num1 value=$item.change_log[$pre_index].cprol_onsite_date|@strtotime }}
												{{ assign var=num2 value=$row.cprol_onsite_date|@strtotime }}
												{{ assign var=diff value=$num2-$num1 }}
												{{ assign var=final value=$diff/86400 }}
												{{ $final|string_format:"%d" }}
											{{ /if }}											
										</td>
									</tr>
									{{ /foreach }}
								</table>
							</td>
							<td>

								<form name="qaed" method="post" action="">
									<input type="text" name="bs_last_qaed[{{$item.bsn_id}}]"
										class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo3_{{$item.bs_customers_id}}"
										value="{{$item.bs_last_qaed}}" />
									<input type="submit" value="Set" name="qaed" class="set" /><br />
									{{if $item.bs_last_qaed}}{{$item.bs_last_qaed_user}}{{/if}}<br />
									{{$item.bs_last_qaed_currentdt}}
								</form>


							</td>

							<!-- <td> 
         
							<form name = "owc" method="post" action="">
								<input type="text" name="bs_cpr_owc_hbg[{{$item.bsn_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo3_{{$item.bs_customers_id}}" value="{{$item.bs_cpr_owc_hbg}}"  /> 
								<input type="submit" value="Set" name="owc" class="set" />
							</form> 
							
							</td>-->
							<td {{if $item.bs_meeting_status eq 0}}style="background: #F00" {{elseif
								$item.bs_meeting_status eq 1 }}style="background:#00CC33" {{/if}}>
								<select name="meeting_status"
									Onchange="update_meetingstatus({{$item.bsn_id}},this.value)">
									<option value="0" {{if $item.bs_meeting_status eq 0}} selected="selected" {{/if}}>No
									</option>
									<option value="1" {{if $item.bs_meeting_status eq 1}} selected="selected" {{/if}}>
										Yes</option>
								</select>

								<script>
									function update_meetingstatus(id, value) {
										$.ajax({
											type: "GET",
											url: "{{$BASE_URL}}construction_pipeline_report.update_meetingstatus/bsn_id/" + id + "/value/" + value,
											success: function (result) {
												window.location.reload();
											}
										});
									}
								</script>
							</td>

							<td>
								<form name="recmet22" method="post" action="">
									<input type="hidden" name="move[{{$item.bsn_id}}]" value="0" />
									<label class="switch">
										<input class="switch-input" type="checkbox" name="move[{{$item.bsn_id}}]"
											value="1" onclick="this.form.submit();" {{if $item.bs_con_pro_report eq 1 }}
											checked="checked" {{/if}} />
										<span class="switch-label" data-on="Yes" data-off="No"></span>
										<span class="switch-handle"></span> <br />

									</label>
								</form>

							</td>

				</tr>
				{{assign var=countn value=$countn-1}}
				{{/foreach}}
			</tbody>

</form>
{{/if}}
</table>

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
{{/if}} <br />
<br />
<table id="doclist-table" width="100%" bgcolor="#d3e8d6">
	<thead>

		<tr>
			<td colspan="2">&nbsp;</td>
		</tr>
	</thead>
</table>
</div>