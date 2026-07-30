<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/rangeslider/rangeSlider.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/rangeslider/rangeSlider.js"></script>

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

<script> !window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');</script>
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


	function show_alert(bsn_id) {
		var viewurl = "{{$BASE_URL}}inclusions_report.alerts" + "/bsn_id/" + bsn_id;

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
		var viewurl = "{{$BASE_URL}}inclusions_task_tracker.viewletter" + "/random/" + Math.random();
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

	function add_procedure() {
		var viewurl = "{{$BASE_URL}}inclusions_task_tracker.view_procedure" + "/random/" + Math.random();

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

<script>
	function update_notes(bsn_id) {
		var viewurl = "{{$BASE_URL}}inclusions_task_tracker.edit_notes/bsn_id/" + bsn_id;
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

	function view_changed_per(bsn_id) {
		var viewurl = "{{$BASE_URL}}inclusions_task_tracker.view_changed_per/bsn_id/" + bsn_id;
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

	function choices_7_day(bsn_id) {
		var viewurl = "{{$BASE_URL}}inclusions_task_tracker.choices_7_day";
		window.open(viewurl, "_blank");
		return false;
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

	function view_uid() {
		var viewurl = "{{$BASE_URL}}inclusions_task_tracker.uid";
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

	function view_traffic_light() {
		let viewurl = '/inclusions_task_tracker.view_traffic_light_rules';
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


	.set2 {
		font-size: 10px !important;
		width: 60px !important;
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
		width: 100%;
		height: 20px;
	}

	.div2 {
		width: 100%;
		overflow: auto;
	}

	/* .slidecontainer {
		width: 225px;
	} */

	.slider {
		-webkit-appearance: none;
		width: 100%;
		height: 5px;
		background: #06F;
		outline: none;
		opacity: 0.7;
		-webkit-transition: .2s;
		transition: opacity .2s;
	}

	.slider:hover {
		opacity: 1;
	}

	.slider::-webkit-slider-thumb {
		-webkit-appearance: none;
		appearance: none;
		width: 5px;
		height: 25px;
		background: #F00;
		cursor: pointer;
	}

	.slider::-moz-range-thumb {
		width: 15px;
		height: 15px;
		background: #F00;
		cursor: pointer;
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

	#fancybox-wrap {
		z-index: 9999999;
	}
	.set3 {
		font-size: 12px !important;
		width: 50px !important;
		display: inline-block;
		padding: 3px !important;
		font-weight: bold;
		background: #0CF;
		color: #FFF;
	}
	/* .switch {
		width: 125px;
	}
	.switch-input:checked ~ .switch-handle {
		left: auto;
		right: 4px;
	} */
</style>
<script>
	$(document).ready(function() {
		$('#toggleColumnSlider').removeAttr('checked');
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

<h3 class="page-title">{{$title}}</h3>
<br />

<form name="mlist" method="post" enctype="multipart/form-data">
	<div style="display: flex; justify-content: space-between; align-items: end;">
		<div style="margin-left: 10px; text-align: left;">
			<div style="display: inline-block;">
				<div style="margin-bottom: 5px;">
					<span>Project: </span>
					<input type="text" list="project_list" name="filter_project" style="width: 300px" value="{{$filter_project}}">
					<datalist id="project_list">
						{{foreach from=$project_list key="index" item="project_name"}}
						<option>{{$project_name}}</option>
						{{/foreach}}
					</datalist>
					<input type="submit" value="Search Project" name="search_project" />
					<input type="submit" value="Clear Search" name="clear_search" />
					<input type="button" name="" value="UID" onclick="view_uid();" />
				</div>
				<div style="margin-bottom: 5px;">
					<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" />
					<input type="button" name="Add New" value="Letter Text Admin" onclick="javascript:add_letter();" />
					<input type="submit" value="Add Tasks" name="add_task" />
					<input type="button" name="" value="% choices 7 day" onclick="choices_7_day();" />
				</div>
				<div>
					<span style="margin-bottom: 5px;">Inclusion Coordinator: </span>
					<div class="bsearch_scroll_div" style="margin-bottom: 5px; max-height: 75px; height: auto;">
						<ul style="margin: 0; padding: 0;">
							{{foreach from=$person_responsible_detail key="index" item="row"}}
								<li><input type="checkbox" name="filter_person_responsible_detail[]" value="{{$row.prd_name}}" {{$row.checked}}>{{$row.prd_name}}</li>
							{{/foreach}}
						</ul>
					</div>
					<div>
						<input type="submit" value="Search By Inclusion Coordinator" name="search_person_responsible_detail" style="margin: 0;">
						<input type="submit" value="Clear Search" name="clear_search" style="margin: 0;">
					</div>
				</div>
			</div>			
			<div style="display: inline-block; vertical-align: bottom; margin-left: 10px;">
				<div style="width: 140px;">
					<table border="1" style="font-weight: bold; margin-bottom: 5px;" cellpadding="3">
						<tr>
							<td></td>
							<td>Traffic Light</td>
						</tr>
						<tr>
							<td>Red</td>
							<td><input type="submit" name="bs_traffic_light_incl_red" title="Save" value="{{$bs_traffic_light_incl_red_data}}" style="background:#F00 !important;"></td>
						</tr>
						<tr>
							<td>Amber</td>
							<td><input type="submit" name="bs_traffic_light_incl_amber" title="Save" value="{{$bs_traffic_light_incl_amber_data}}" style="background: #F90 !important;"></td>
						</tr>
						<tr>
							<td>Green</td>
							<td><input type="submit" name="bs_traffic_light_incl_green" title="Save" value="{{$bs_traffic_light_incl_green_data}}" style="background: #0C0 !important;"></td>
						</tr>
					</table>
					<div>
						<input type="button" value="Rules" onclick="javascript:view_traffic_light();" />
					</div>
				</div>
			</div>
			<div style="display: inline-block; vertical-align: bottom; margin-left: 50px;">
				<a href="javascript:void(0)" style="color: #000; text-decoration: none; line-height: 29px;" onclick="$('#toggleColumnSlider').removeAttr('checked').change()">Original View</a>
				<label class="switch" for="toggleColumnSlider" style="display: inline-block; margin: 0;">
					<input class="switch-input" onchange="toggleColumn()" id="toggleColumnSlider" type="checkbox">
					<span class="switch-label" data-on="" data-off=""></span>
					<span class="switch-handle"></span>
				</label>
				<a href="javascript:void(0)" style="color: #000; text-decoration: none; line-height: 29px;" onclick="$('#toggleColumnSlider').attr('checked', 'checked').change()">Slim View</a>
				<!-- <input type="range" min="0" max="1" value="0" class="slider" style="width: 30px;" onchange="toggleColumn()" id="toggleColumnSlider"> -->
			</div>
		</div>
		<div style="margin-right: 10px; text-align: right;">
			<input type="submit" value="Print All Reports" name="printall" />
			<input type="button" value="Export To XLS" onclick="document.location.href='{{$BASE_URL}}{{$XFA.home}}/export/1'" /> &nbsp;
		</div>
	</div>
		

	<div class="wrapper1">
		<div class="div1">
		</div>
	</div>

	<div style="border:1px solid black;width:auto;height:auto;overflow-y:hidden;overflow-x:scroll;">
		<div class="div2 tableFixHead">
			<table id="doclist-table" class="nav-back" width="100%">
				<thead>
					<tr>
						<th class="topmenu" align="center" valign="middle" style="width:5px;">SrNo</th>
						<th class="topmenu" align="center" valign="middle" style="min-width: 110px;">Address</th>
						<th class="topmenu" align="center" valign="middle" style="width:15px;">Inclusion Coordinator</th>
						<th class="topmenu" align="center" valign="middle" style="width:15px;" data-col="calculator">Calculator</th>
						<th class="topmenu" align="center" valign="middle" style="width:15px;" data-col="renovation_calculator">Renovation Calculator</th>
						<th class="topmenu" align="center" valign="middle" style="width:10px;">Document Click<br />Link</th>
						<th class="topmenu" align="center" valign="middle" style="width:5px;">Days at <br />Status</th>
						<th class="topmenu" align="center" valign="middle" style="width:5px;" data-col="notes">Notes</th>
						<th class="topmenu" align="center" valign="middle" style="width:5px;" data-col="project_view_details">Project View Details</th>
						<th class="topmenu" align="center" valign="middle" style="width:5px;">Traffic Light</th>
						<th class="topmenu" align="center" valign="middle" style="width:5px;" data-col="letter_text">Letter Text</th>
						<th class="topmenu" align="center" valign="middle" style="width:110px; white-space: nowrap;">% Of Choices Made</th>
						<th class="topmenu" align="center" valign="middle" style="width:195px; white-space: nowrap;">Task Completed %</th>
						{{foreach from=$colhead key="keyh" item="itemh"}}
						<th class="topmenu other-column" align="center" valign="middle" style="width:100px;">{{$itemh.bst_task_id}}
						</th>
						{{/foreach}}
						<th class="topmenu" align="center" valign="middle" style="width:110px;" data-col="latest_onsite_date">Latest Onsite Date</th>
						<th class="topmenu" align="center" valign="middle" style="width:110px;">Weekly Update Letter</th>
						<th class="topmenu" align="center" valign="middle" style="width:110px;">Address</th>
						<th class="topmenu" align="center" valign="middle" style="width:110px;">Print</th>
					</tr>
				</thead>
				<tbody>
					{{if $list}}
					<tr class="other-column">
						<td colspan="13"></td>
						{{foreach from=$colhead key="keyp" item="itemp"}}
						<td>
							<input type="text" name="{{$itemp.bst_task_id}}" value="{{$itemp.bst_ptt_summary}}" style="width:100px;" onkeyup="update_ts({{$itemp.bst_task_id}},this.value)">
							{{/foreach}}
							<script>
								function update_ts(id, value) {
									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}inclusions_task_tracker.update_ts/bst_task_id/" + id + "/value/" + value,
										success: function (result) {
										}
									});
								}
							</script>
						</td>
						<td colspan="4"></td>
					</tr>
					{{assign var=countn value= $total}}
					{{foreach from=$list key="key" item="item"}}
					<tr bgcolor="{{cycle values=" #D3E8D6,WHITE" advance=true}}">
						<td> {{$countn}} </td>
						<td>
							<strong>{{$item.bcust_fname}} &nbsp; {{$item.bcust_lname}}</strong>
							<br>
							<a href="{{$item.link}}" target="blank">{{$item.bsn_address}}</a>							
						</td>
						<td>{{$item.prd_name}} </td>
						<td data-col="calculator">{{$item.calculator}}</td>
						<td data-col="renovation_calculator">{{$item.renovation_calculator}}</td>
						<td style="text-align:center;"><a href="{{$item.link2}}" target="blank">Link</a></td>
						<td>{{$item.dayscount}} </td>
						<td data-col="notes">
							<input type="button" name="edit_notes" value="Notes" onclick="update_notes('{{$item.bsn_id}}')" />
						</td>
						<td data-col="project_view_details">
							<a href="/inclusions_task_tracker.view_project_details/bsn_id/{{$item.bsn_id}}" class="set3" style="color:#FFF;" target="_blank">View Project</a>
						</td>
						{{ if $item.bs_traffic_light_incl eq 1}}
						<td style="background:#00CC33; color:#FFF; white-space: nowrap;">
							<a href="{{$BASE_URL}}inclusions_task_tracker.colorbox/bsn_id/{{$item.bsn_id}}" class="various">Color</a>
							<br />
							<br />
							{{$item.bs_tl_user_incl}}
							<br />
							{{$item.bs_tl_date_incl}}
							<br />
							<a href="{{$BASE_URL}}inclusions_task_tracker.reason/bsn_id/{{$item.bsn_id}}" class="various">Read</a>
						</td>
						{{ elseif  $item.bs_traffic_light_incl eq 2}}
						<td style="background: #ff7f27; color:#FFF; white-space: nowrap;">
							<a href="{{$BASE_URL}}inclusions_task_tracker.colorbox/bsn_id/{{$item.bsn_id}}" class="various">Color</a>
							<br />
							<br />
							{{$item.bs_tl_user_incl}}
							<br />
							{{$item.bs_tl_date_incl}}
							<br />
							<a href="{{$BASE_URL}}inclusions_task_tracker.reason/bsn_id/{{$item.bsn_id}}" class="various">Read</a>
						</td>
						{{ elseif  $item.bs_traffic_light_incl eq 3}}
						<td style="background: #F00; color:#FFF; white-space: nowrap;">
							<a href="{{$BASE_URL}}inclusions_task_tracker.colorbox/bsn_id/{{$item.bsn_id}}" class="various">Color</a>
							<br /><br />
							{{$item.bs_tl_user_incl}}
							<br />
							{{$item.bs_tl_date_incl}}
							<br />
							<a href="{{$BASE_URL}}inclusions_task_tracker.reason/bsn_id/{{$item.bsn_id}}" class="various">Read</a>
						</td>
						{{else }}
						<td>
							<a href="{{$BASE_URL}}inclusions_task_tracker.colorbox/bsn_id/{{$item.bsn_id}}" class="various">Color</a>
						</td>
						{{/if}}

						<td data-col="letter_text" style="white-space: nowrap;">
							<select name="letter[{{$item.bsn_id}}]" onchange="update_letter({{$item.bsn_id}},this.value)">
								{{foreach from=$letterData key="key2" item="item2"}}
								<option value="{{$item2.lt_code}}" {{if $item2.lt_code eq $item.bcust_itt_letter_text}} selected="selected" {{/if}}>
									{{$item2.lt_code}}
								</option>
								{{/foreach}}
							</select>
							<div>
								<a href="{{$BASE_URL}}inclusions_task_tracker.letter_text_read/lt_code/{{$item.bcust_itt_letter_text}}" class="various">Read</a>
							</div>
							<div id="letter_text_details_{{$item.bsn_id}}">
								{{if $item.bcust_itt_letter_text_user}}
									<p style="margin-top: 4px;">{{$item.bcust_itt_letter_text_user}}</p>
								{{/if}}
								{{if $item.bcust_itt_letter_text_date}}
									<p style="margin-top: 2px;">{{$item.bcust_itt_letter_text_date}}</p>
								{{/if}}
							</div>

							<script>
								function update_letter(id, value) {
									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}inclusions_task_tracker.update_lettertext/id/" + id + "/value/" + value,
										success: function (result) {
											$('#letter_text_details_' + id).html(result);
										}
									});
								}
							</script>
						</td>
						<td>
							<div class="slidecontainer">
								<input type="range" min="0" max="100" value="{{$item.bsn_per_complete}}" class="slider" id="myRange_{{$countn}}" onchange="update({{$item.bsn_id}}, this.value)">
								<p style="margin-top: 10px;">%: <span id="demo_{{$item.bsn_id}}"></span></p>
								<div id="changed_per_list_{{$item.bsn_id}}">
									{{if $item.changed_per_list_user}}
										<p style="margin-top: 2px;">{{$item.changed_per_list_user}}</p>
									{{/if}}
									{{if $item.changed_per_list_date}}
										<p style="margin-top: 2px;">{{$item.changed_per_list_date}}</p>
									{{/if}}
								</div>											
							</div>
							<script>
								var slider = document.getElementById("myRange_{{$countn}}");
								var output{{ $item.bsn_id }} = document.getElementById("demo_{{$item.bsn_id}}");
								output{{ $item.bsn_id }}.innerHTML = slider.value;
								slider.oninput = function () {
									output{{ $item.bsn_id }}.innerHTML = this.value;
								}
								function update(id, value) {
									//alert(id);
									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}/designer_tracker.update_per/bsn_id/" + id + "/value/" + value + "/from/inclusion_task",
										success: function (result) {
											$('#changed_per_list_' + id).html(result);
										}
									});
								}
							</script>
						</td>
						<td style="white-space: nowrap;">
							Completed Task: {{$item.completed}}%
							<br />
							Not Req. Task : {{$item.notreq }}%
						</td>
						{{foreach from=$item.task key="keyh" item="itemh"}}
							{{if $itemh}}
								{{if $itemh eq  'N / R'}}
								<th class="other-column" valign="middle" style="width:100px;">
									<a href="{{$BASE_URL}}business.taskdetail/bsn_id/{{$item.bsn_id}}/uid/{{$keyh}}">{{$itemh}}</a>
								</th>
								{{else}}
								<th class="other-column" valign="middle" style="background:#0C0;">
									<a 	href="{{$BASE_URL}}business.taskdetail/bsn_id/{{$item.bsn_id}}/uid/{{$keyh}}">{{$itemh}}</a>
								</th>
								{{/if}}
							{{else}}
							<th class="other-column" align="center" valign="middle" style="width:100px;">
								<a href="{{$BASE_URL}}business.taskdetail/bsn_id/{{$item.bsn_id}}/uid/{{$keyh}}">View<br />Task</a>
							</th>
							{{/if}}
						{{/foreach}}
						<td data-col="latest_onsite_date">
							<form name="ccd" method="post" action="" id="myForm3"
								enctype="multipart/form-data">
								<input type="text" name="bsn_incl_cc_date[{{$item.bsn_id}}]"
									class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo3_{{$item.bsn_id}}"
									value="{{$item.bsn_incl_cc_date}}" />
								<input type="submit" value="Set" name="latest" class="set" />
							</form>
						</td>
						<td>
							<form name="mlist123" method="post" enctype="multipart/form-data">
								<input type="hidden" name="bsn_id" value="{{$item.bsn_id}}" />
								<input type="file" name="in_letter" /><br />
								{{if $item.bc_incl_letter}}
								<div style="text-align:center;">
									<!--<a href="{{$BASE_URL}}files/uploads/{{$item.bc_incl_letter}}" target="_blank">Download</a>-->
									<a href="/inclusions_task_tracker.download_content?file_name={{$item.bc_incl_letter}}&module_name=inclusions_task_tracker.home"
										target="_blank">Download</a>
								</div> {{/if}}
								<input type="submit" name="savedata" title="Save" value="Upload"
									class="set2"> &nbsp;
							</form>
						</td>
						<td>
							<p>
								<strong>{{$item.bcust_fname}} &nbsp; {{$item.bcust_lname}}</strong>
							</p>
							<p>
								{{$item.bsn_address}}
							</p>
						</td>
						<td>
							<input type="button" value="Print" onclick="document.location.href='{{$BASE_URL}}{{$XFA.home}}/print/{{$item.bsn_id}}'" />
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
{{/if}} <br />
<br />

</div>
</div>