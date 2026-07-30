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

	function close_win() {
		$.fancybox.close();
		window.location.reload();
	}
</script>

<script type="text/javascript">

	function add_letter() {
		var viewurl = "{{$BASE_URL}}planning_task_tracker.viewletter" + "/random/" + Math.random();
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

	function add_pc() {
		var viewurl = "{{$BASE_URL}}planning_task_tracker.view_pc" + "/random/" + Math.random();
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
		var viewurl = "{{$BASE_URL}}planning_task_tracker.viewtype" + "/random/" + Math.random();
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

	function add_project_type() {
		var viewurl = "{{$BASE_URL}}planning_task_tracker.view_project_type" + "/random/" + Math.random();
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

	function add_phr(bsn_id) {
		var viewurl = "{{$BASE_URL}}planning_task_tracker.add_phr" + "/bsn_id/" + bsn_id;
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
		var viewurl = "{{$BASE_URL}}planning_task_tracker.view_procedure" + "/random/" + Math.random();
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
		var viewurl = "{{$BASE_URL}}planning_task_tracker.project_panel" + "/random/" + Math.random();

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

	.set3 {
		font-size: 12px !important;
		width: 50px !important;
		display: inline-block;
		padding: 3px !important;
		font-weight: bold;
		background: #0CF;
		color: #FFF;
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
		width: 11680px;
		height: 20px;
	}

	.div2 {
		width: 11990px;
		overflow: auto;
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

	.slidecontainer {
		width: 225px;
	}

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

	.grid-container {
		display: grid;
		grid-template-columns: 1fr 1fr;
		grid-gap: 20px;
	}

	.ent {
		padding: 3px;
		font-weight: bold;
		margin-bottom: 4px;
		border-radius: 5px;
		color: #06F;
	}
</style>

<h3 class="page-title">{{$title}}</h3>
<br />

<form name="mlist" method="post" enctype="multipart/form-data">
	<div
		style="float:left; text-align: left; margin-left:10px;  text-align:left; display:grid; grid-template-columns: 1fr 1fr;">
		<div style="margin-right:10px;">
			<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" />
			&nbsp;<input type="button" name="Add New" value="Plans Changed Admin" onclick="javascript:add_pc();" />
			&nbsp;<input type="button" name="Add New" value="Letter Text Admin" onclick="javascript:add_letter();" />
			&nbsp;<input type="button" name="Add New" value="Add Sub Status" onclick="javascript:add_type();" />
			&nbsp;<input type="button" name="Add New" value="Project Type Admin"
				onclick="javascript:add_project_type();" />
			<br />
			<input type="submit" value="Management Report" name="management" />
			&nbsp; <input type="button" name="Add New" value="Project Management Panel"
				onclick="javascript:proj_panel();" />
			&nbsp;<input type="submit" value="Sort By HIA Days" name="sort_hia" />
			<!--&nbsp;<input type= "submit" name="redlight" title="Save" value="Filter Red Light Projects">
&nbsp;<input type= "submit" name="amberlight" title="Save" value="Filter Amber Light Projects"> &nbsp; &nbsp;-->
			<br />
			&nbsp;<select name="bs_ptt_sub_status_filter"
				Onchange="update_sub_status({{$item.bs_business_id}},this.value)" />
			{{foreach from=$sub_status key="key" item="item2"}}
			<option value="{{$item2.pst_id}}" {{if $item2.pst_id eq $ss}} selected="selected" {{/if}}>
				{{$item2.pst_status}}
			</option>
			{{/foreach}}
			</select>

			<input type="submit" name="filter_ss" title="filter" value="Filter Sub Status">
			&nbsp;<input type="submit" name="clear" value="Clear All Filter">
			<br />
			&nbsp;<strong>Project search :</strong> <input type="text" name="searchkey" style="width:200px;" />
			<input type="submit" value="Search Project" name="proj_search" />&nbsp;
			&nbsp;<input type="submit" name="clear" value="Clear Search">


			&nbsp; &nbsp; <input type="submit" value="Add Tasks" name="add_task" /> <br />

			<strong>Latest Meeting Agenda :</strong> <input type="text" name="meeting_agenda" value="{{$ma_ma_doc}}"
				style="width:600px;" />
			<input type="Submit" name="ptt_ma" value="Save" />
			{{$ma_user}} &nbsp; &nbsp;{{$ma_date}}
		</div>
		<div style="width:18%;">
			<table border="1" style="font-weight:bold;" cellpadding="3">
				<tr>
					<td></td>
					<td>Traffic Light</td>
				</tr>
				<tr>
					<td>Red</td>
					<td><input type="submit" name="redlight" title="Save" value="{{$dataRed}}"
							style="background:#F00 !important;"></td>
				</tr>
				<tr>
					<td>Ambar</td>
					<td><input type="submit" name="amberlight" title="Save" value="{{$dataAmbar}}"
							style="background: #F90 !important;"></td>
				</tr>
				<tr>
					<td>Green</td>
					<td><input type="submit" name="greenlight" title="Save" value="{{$dataGreen}}"
							style="background: #0C0 !important;"></td>
				</tr>
			</table> <br />

		</div>
	</div>



	<div style="float:right;">
		<input type="submit" value="Print All Reports" name="printall" />
		<input type="button" value="Export To XLS"
			onclick="document.location.href='{{$BASE_URL}}{{$XFA.home}}/export/1'" /> &nbsp;
	</div>
	<br />
	<div class="wrapper1">
		<div class="div1">
		</div>
	</div>

	<!--<div class="wrapper2">
    <div class="div2 tableFixHead">-->

	<div style="border:1px solid black;width:auto;height:auto;overflow-y:hidden;overflow-x:scroll;">

		<!--<p style="width:300%;">-->
		<div class="div2 tableFixHead">

			<table id="doclist-table" class="nav-back" width="100%">
				<thead>
					<tr>
						<th class="topmenu" align="center" valign="middle" style="width:5px;">SrNo</th>
						<th class="topmenu" align="center" valign="middle" style="width:110px;">Address</th>
						<th class="topmenu" align="center" valign="middle" style="width:90px;">Checklist</th>
						<!--     <th class="topmenu" align="center" valign="middle" style="width:110px;">Number Of Projects</th>-->
						<th class="topmenu" align="center" valign="middle" style="width:110px;">View Project</th>

						<th class="topmenu" align="center" valign="middle" style="width:110px;">Sub Status</th>
						<th class="topmenu" align="center" valign="middle" style="width:50px;">Order</th>
						<th class="topmenu" align="center" valign="middle" style="width:50px;">Days At Sub Status</th>
						<th class="topmenu" align="center" valign="middle" style="width:50px;">Add To Post HIA Report
						</th>
						<th class="topmenu" align="center" valign="middle" style="width:50px;">Operational Plans
							Implemented</th>
						<th class="topmenu" align="center" valign="middle" style="width:50px;">Planning Plans</th>
						<th class="topmenu" align="center" valign="middle" style="width:50px;">DA Docs </th>
						<th class="topmenu" align="center" valign="middle" style="width:50px;">BA Docs </th>
						<th class="topmenu" align="center" valign="middle" style="width:50px;">Entities</th>
						<th class="topmenu" align="center" valign="middle" style="width:110px;">D Type</th>
						<th class="topmenu" align="center" valign="middle" style="width:15px;">Planning Manager</th>

						<th class="topmenu" align="center" valign="middle" style="width:10px;">Latest Merged Plas OP
						</th>

						<th class="topmenu" align="center" valign="middle" style="width:10px;">Document Click<br />Link
						</th>
						<th class="topmenu" align="center" valign="middle" style="width:5px;">HIA Days</th>
						<th class="topmenu" align="center" valign="middle" style="width:150px;">Letter Text</th>
						<th class="topmenu" align="center" valign="middle" style="width:195px;" data-col="original_gcn">Original GCN</th>
						<th class="topmenu" align="center" valign="middle" style="width:195px;" data-col="latest_gcn">Latest GCN</th>
						<th class="topmenu" align="center" valign="middle" style="width:195px;">Day Difference</th>
						<!--<th class="topmenu" align="center" valign="middle" style="width:110px;">Last Spoken</th>-->
						<th class="topmenu" align="center" valign="middle" style="width:110px;">7 Day Task Report</th>
						<th class="topmenu" align="center" valign="middle" style="width:110px;">Task Count</th>
						<th class="topmenu" align="center" valign="middle" style="width:5px;">Upload Weekly Letter</th>
						<th class="topmenu" align="center" valign="middle" style="width:490px;">Traffic Light</th>
						<th class="topmenu" align="center" valign="middle" style="width:150px;">Plans Changed</th>
						<!--<th class="topmenu" align="center" valign="middle" style="width:150px;">Letter Text</th>-->

						{{foreach from=$colhead key="keyh" item="itemh"}}
						<th class="topmenu" align="center" valign="middle" style="width:100px;">{{$itemh.bst_task_id}}
						</th>
						{{/foreach}}
						<th class="topmenu" align="center" valign="middle" style="width:110px;">Percentage Completed
						</th>

						<th class="topmenu" align="center" valign="middle" style="width:195px;">Task Completed %</th>
						<th class="topmenu" align="center" valign="middle" style="width:110px;">Combined Report Function
						</th>
						<th class="topmenu" align="center" valign="middle" style="width:110px;">Weekly Update Letter
						</th>
						<th class="topmenu" align="center" valign="middle" style="width:110px;">Alert Report</th>
						<th class="topmenu" align="center" valign="middle" style="width:110px;">PDF Calendar</th>
						<th class="topmenu" align="center" valign="middle" style="width:110px;">Address</th>

					</tr>
				</thead>

				{{if $list}}
				<tbody>
					<td colspan="23"></td>
					{{foreach from=$colhead key="keyp" item="itemp"}}
					<td><input type="text" name="{{$itemp.bst_task_id}}" value="{{$itemp.bst_ptt_summary}}"
							style="width:100px;" onkeyup="update_ts({{$itemp.bst_task_id}},this.value)" /></td>
					{{/foreach}}
					<script>

						function update_ts(id, value) {
							$.ajax({
								type: "GET",
								url: "{{$BASE_URL}}planning_task_tracker.update_ts/bst_task_id/" + id + "/value/" + value,
								success: function (result) {
								}
							});
						}
					</script>
					<td colspan="10"></td>


					{{assign var=countn value= $total}}

					{{foreach from=$list key="key" item="item"}}
					<tr bgcolor="{{cycle values=" #D3E8D6,WHITE" advance=true}}">
						<td> {{$countn}} </td>
						<td><strong>{{$item.bcust_fname}} &nbsp; {{$item.bcust_lname}}</strong> <br />
							<a href="{{$item.link}}" target="_blank">{{$item.bsn_address}}</a>
						</td>

						<td>{{foreach from=$item.checklist key="keyc" item="itemc"}}
							{{$itemc.dpn_unique_id}}<br />
							{{/foreach}}
						</td>

						<!--       <td> 
       <select name="num_proj[{{$item.bsn_id}}]" onchange="update_num_projects({{$item.bsn_id}},this.value)">
       <option value="0" >Select</option>
       <option value="1" {{if $item.bs_ptt_num_project eq 1 }} selected="selected" {{/if}}>1</option>
       <option value="2" {{if $item.bs_ptt_num_project eq 2 }} selected="selected" {{/if}}>2</option>
       <option value="3" {{if $item.bs_ptt_num_project eq 3 }} selected="selected" {{/if}}>3</option>
       <option value="4" {{if $item.bs_ptt_num_project eq 4 }} selected="selected" {{/if}}>4</option>
       <option value="5" {{if $item.bs_ptt_num_project eq 5 }} selected="selected" {{/if}}>5</option>
       </select>
       <script>
	   
		function update_num_projects(id,value)
		{
			$.ajax({
				
				   type: "GET",
				   url: "{{$BASE_URL}}planning_task_tracker.update_num_projects/bs_business_id/"+id+"/value/"+value,
					   success: function(result){
						  
					}
					
				});
		}
	</script>  
       </td>-->


						<td>
							<a href='{{$BASE_URL}}planning_task_tracker.view_project/bsn_id/{{$item.bsn_id}}'
								target="_blank" class="set3" style="color:#FFF;" />View Project
						</td>

						<td>
							<form name="tana" method="post" action="">
								<select name="bs_ptt_sub_status[{{$item.bs_business_id}}]"
									Onchange="this.form.submit();" />
								{{foreach from=$sub_status key="key" item="item2"}}
								<option value="{{$item2.pst_id}}" {{if $item.bs_ptt_sub_status eq $item2.pst_id}}
									selected="selected" {{/if}}>
									{{$item2.pst_status}}
								</option>
								{{/foreach}}
								</select>
							</form>
							<div id="usr{{$item.bs_business_id}}">
								{{$item.bs_ptt_sub_status_date}}<br />{{$item.bs_ptt_sub_status_user}} </div>
							<script>

								function update_sub_status(id, value) {
									var tana = "#usr" + id;
									$.ajax({

										type: "GET",
										url: "{{$BASE_URL}}planning_task_tracker.update_sub_status/bs_business_id/" + id + "/value/" + value,
										success: function (result) {
											$(tana).html(result);
										}

									});
								}
							</script>
						</td>

						<td>{{$item.bs_ptt_sub_status_order}}</td>
						<td>{{$item.substatus_days}}</td>
						<td>
							<input type="button" name="Add New" value="Add To Post Hia" class="set2"
								style="width:95px !important;" onclick="javascript:add_phr({{$item.bsn_id}});" /> <br />
							{{$item.bs_ptt_atop_user}} <br />
							{{$item.bs_ptt_atop_date}}

						</td>
						<td>
							{{if $item.bsn_ptt_opi eq 1}}
							<form name="recmet3" method="post" action="">
								<input type="hidden" name="opi[{{$item.bsn_id}}]" value="0" />
								<label class="switch">
									<input class="switch-input" type="checkbox" name="opi[{{$item.bsn_id}}]" value="1"
										onclick="this.form.submit();" {{if $item.bsn_ptt_opi eq 1 }} checked="checked"
										{{/if}} />
									<span class="switch-label" data-on="Yes" data-off="No"></span>
									<span class="switch-handle"></span> <br />
								</label>

								{{if $item.bsn_ptt_opi eq 1}}
								{{$item.bsn_ptt_opi_date}}<br />{{$item.bsn_ptt_opi_user}}{{/if}}

								{{else}}

									<form name="recmet3" method="post" action="">
										<input type="hidden" name="opi[{{$item.bsn_id}}]" value="0" />
										<label class="switch">
											<input class="switch-input" type="checkbox" name="opi[{{$item.bsn_id}}]"
												value="1" onclick="this.form.submit();" {{if $item.bsn_ptt_override eq 1
												}} checked="checked" {{/if}} />
											<span class="switch-label" data-on="Yes" data-off="No"></span>
											<span class="switch-handle"></span> <br />
										</label>

										{{if $item.bsn_ptt_override eq 1}} {{$item.bsn_ptt_override_user}}{{/if}}

										{{/if}}

										<input type="hidden" name="bsn_id" value="{{$item.bsn_id}}" />
										<input type="submit" name="override" value="Override" class="set2" />
									</form>
						</td>

						<td>
							<form name="recmet3" method="post" action="">
								<input type="hidden" name="plan_plans[{{$item.bsn_id}}]" value="0" />
								<label class="switch">
									<input class="switch-input" type="checkbox" name="plan_plans[{{$item.bsn_id}}]"
										value="1" onclick="update_plan_plans({{$item.bsn_id}},this.checked);" {{if
										$item.bsn_ptt_planning_plans eq 1 }} checked="checked" {{/if}} />
									<span class="switch-label" data-on="Yes" data-off="No"></span>
									<span class="switch-handle"></span> <br />
								</label>
								<div id="pp{{$item.bsn_id}}"> {{if $item.bsn_ptt_planning_plans eq 1}}
									{{$item.bsn_ptt_pp_user}}<br />{{$item.bsn_ptt_pp_date}}{{/if}}</div>

								<script>

									function update_plan_plans(id, value) {
										var val;

										if (value == true) { val = 1; } else { val = 0; }

										var tana2 = "#pp" + id;
										$.ajax({
											type: "GET",
											url: "{{$BASE_URL}}planning_task_tracker.update_plan_plans/bsn_id/" + id + "/value/" + val,
											success: function (result) {
												$(tana2).html(result);
											}
										});
									}

								</script>

						</td>

						<td>{{$item.totalDAll}}/{{$item.totalDA}}</td>
						<td>{{$item.totalBAll}}/{{$item.totalBA}}</td>

						<td>

							{{foreach from = $item.datawa key="key27" item="item27"}}

							{{if $item27.dpn_water_ref ne 'Not Required' }}

							<div class="ent" {{if $item27.dpn_water_ref eq 'Fails' }} style="background: #F00;" {{elseif
								$item27.dpn_water_ref eq 'Requested and Waiting For Entity' }} style="background: #FF0;"
								{{elseif $item27.dpn_water_ref eq 'Not Requested' }} style="background:#0CF;" {{elseif
								$item27.dpn_water_ref eq 'Passed With Conditions' }} style="background: #3F0;" {{else}}
								style="background: #FFF;" {{/if}}>

								{{if $item.doc_file_name_627}}
								<a href="/planning_task_tracker.download_content?file_name={{$item.doc_file_name_627}}&module_name=planning_task_tracker.home"
									target="_blank" style="text-decoration: none;">Water_{{$item27.dpn_unique_id}}</a>
								{{else}}
									Water_{{$item27.dpn_unique_id}}
									{{/if}}
							</div>

							{{/if}}

							{{/foreach}}



							{{foreach from = $item.datawa key="key28" item="item28"}}

							{{if $item28.dpn_electric_ref ne 'Not Required' }}
							<div class="ent" {{if $item28.dpn_electric_ref eq 'Fails' }} style="background: #F00;"
								{{elseif $item28.dpn_electric_ref eq 'Requested and Waiting For Entity' }}
								style="background: #FF0;" {{elseif $item28.dpn_electric_ref eq 'Not Requested' }}
								style="background:#0CF;" {{elseif $item28.dpn_electric_ref eq 'Passed With Conditions'
								}} style="background: #3F0;" {{else}} style="background: #FFF;" {{/if}}>
								{{if $item28.doc_file_name_628}}
								<a href="/planning_task_tracker.download_content?file_name={{$item.doc_file_name_628}}&module_name=planning_task_tracker.home"
									target="_blank"
									style="text-decoration: none;">Electric_{{$item28.dpn_unique_id}}</a>
								{{else}} Electric_{{$item28.dpn_unique_id}}
									{{/if}}
							</div>

							{{/if}}
							{{/foreach}}


							{{foreach from = $item.datawa key="key29" item="item29"}}

							{{if $item29.dpn_gas_ref ne 'Not Required' }}

							<div class="ent" {{if $item29.dpn_gas_ref eq 'Fails' }} style="background: #F00;" {{elseif
								$item29.dpn_gas_ref eq 'Requested and Waiting For Entity' }} style="background: #FF0;"
								{{elseif $item29.dpn_gas_ref eq 'Not Requested' }} style="background:#0CF;" {{elseif
								$item29.dpn_gas_ref eq 'Passed With Conditions' }} style="background: #3F0;" {{else}}
								style="background: #FFF;" {{/if}}>
								{{if $item.doc_file_name_629}}
								<a href="/planning_task_tracker.download_content?file_name={{$item.doc_file_name_629}}&module_name=planning_task_tracker.home"
									target="_blank" style="text-decoration: none;">Gas_{{$item29.dpn_unique_id}}</a>
								{{else}} Gas_{{$item29.dpn_unique_id}}
									{{/if}}
							</div>

							{{/if}}
							{{/foreach}}

							{{foreach from = $item.datawa key="key30" item="item30"}}
							{{if $item30.dpn_storm_ref ne 'Not Required' }}

							<div class="ent" {{if $item30.dpn_storm_ref eq 'Fails' }} style="background: #F00;" {{elseif
								$item30.dpn_storm_ref eq 'Requested and Waiting For Entity' }} style="background: #FF0;"
								{{elseif $item30.dpn_storm_ref eq 'Not Requested' }} style="background:#0CF;" {{elseif
								$item30.dpn_storm_ref eq 'Passed With Conditions' }} style="background: #3F0;" {{else}}
								style="background: #FFF;" {{/if}}>
								{{if $item.doc_file_name_630}}
								<a href="/planning_task_tracker.download_content?file_name={{$item.doc_file_name_630}}&module_name=planning_task_tracker.home"
									target="_blank" style="text-decoration: none;">Storm_{{$item30.dpn_unique_id}}</a>
								{{else}} Storm_{{$item30.dpn_unique_id}}

									{{/if}}
							</div>
							{{/if}}
							{{/foreach}}



							{{foreach from = $item.datawa key="key31" item="item31"}}
							{{if $item31.dpn_heritage_ref ne 'Not Required' }}

							<div class="ent" {{if $item31.dpn_heritage_ref eq 'Fails' }} style="background: #F00;"
								{{elseif $item31.dpn_heritage_ref eq 'Requested and Waiting For Entity' }}
								style="background: #FF0;" {{elseif $item31.dpn_heritage_ref eq 'Not Requested' }}
								style="background:#0CF;" {{elseif $item31.dpn_heritage_ref eq 'Passed With Conditions'
								}} style="background: #3F0;" {{else}} style="background: #FFF;" {{/if}}>
								{{if $item.doc_file_name_716}}
								<a href="/planning_task_tracker.download_content?file_name={{$item.doc_file_name_716}}&module_name=planning_task_tracker.home"
									target="_blank"
									style="text-decoration: none;">Heritage_{{$item31.dpn_unique_id}}</a>
								{{else}} Heritage_{{$item31.dpn_unique_id}}

									{{/if}}
							</div>
							{{/if}}
							{{/foreach}}


							{{foreach from = $item.datawa key="key32" item="item32"}}
							{{if $item32.dpn_heritage_ref ne 'Not Required' }}

							<div class="ent" {{if $item32.dpn_heritage_ref eq 'Fails' }} style="background: #F00;"
								{{elseif $item32.dpn_heritage_ref eq 'Requested and Waiting For Entity' }}
								style="background: #FF0;" {{elseif $item32.dpn_heritage_ref eq 'Not Requested' }}
								style="background:#0CF;" {{elseif $item32.dpn_heritage_ref eq 'Passed With Conditions'
								}} style="background: #3F0;" {{else}} style="background: #FFF;" {{/if}}>
								{{if $item.doc_file_name_717}}
								<a href="/planning_task_tracker.download_content?file_name={{$item.doc_file_name_717}}&module_name=planning_task_tracker.home"
									target="_blank" style="text-decoration: none;">Tree_{{$item32.dpn_unique_id}}</a>
								{{else}} Tree_{{$item32.dpn_unique_id}}

									{{/if}}
							</div>
							{{/if}}
							{{/foreach}}

						<td>
							<select name="ptt_d_type[{{$item.bsn_id}}]"
								Onchange="update_d_type({{$item.bsn_id}},this.value)">
								<option value="DA" {{if $item.bsn_ptt_d_type eq 'DA' }} selected="selected" {{/if}}> DA
								</option>
								<option value="BA" {{if $item.bsn_ptt_d_type eq 'BA' }} selected="selected" {{/if}}> BA
								</option>
								<option value="TBC" {{if $item.bsn_ptt_d_type eq 'TBC' }} selected="selected" {{/if}}>
									TBC </option>
								<option value="ED" {{if $item.bsn_ptt_d_type eq 'ED' }} selected="selected" {{/if}}> ED
								</option>
							</select>

							<script>
								function update_d_type(id, value) {
									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}/planning_task_tracker.update_d_type/bsn_id/" + id + "/value/" + value,
										success: function (result) {
										}
									});
								}
							</script>

						</td>

						<td>{{$item.prd_name}} </td>
						<!--<td style="text-align:center;" ><a href = "{{$item.link}}" target="blank">Link</a></td>-->

						<td>
							{{if $item.doc_file_name_491}}
							<a href="/planning_task_tracker.download_content?file_name={{$item.doc_file_name_491}}&module_name=planning_task_tracker.home"
								target="_blank">
								Download</a><br /> {{$item.doc_date_uploaded_491}}
							{{/if}}
						</td>

						<td style="text-align:center;"><a href="{{$item.link2}}" target="blank">Link</a></td>
						<td> {{$item.dayscount}} </td>
						<td>
							<select name="letter[{{$item.bs_customers_id}}]"
								Onchange="update_letter({{$item.bs_customers_id}},this.value)">
								{{foreach from=$letterData key="key2" item="item2"}}
								<option value="{{$item2.lt_code}}" {{if $item2.lt_code eq $item.bcust_ptt_letter_text}}
									selected="selected" {{/if}}>{{$item2.lt_code}}</option>
								{{/foreach}}
							</select>
							<div id="usr2{{$item.bs_customers_id}}">
								{{$item.bcust_ptt_letter_text_date}}<br />{{$item.bcust_ptt_letter_text_user}} </div>
							<script>

								function update_letter(id, value) {
									var tana2 = "#usr2" + id;
									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}planning_task_tracker.update_lettertext/id/" + id + "/value/" + value,
										success: function (result) {
											$(tana2).html(result);
										}
									});
								}

							</script>

						</td>
						<td data-col="original_gcn">
							<form name="mlist_o" method="post" action="">
								<input type="text" name="bsn_orginal_csbd[{{$item.bsn_id}}]"
									class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo1_{{$item.bsn_id}}"
									value="{{$item.bsn_orginal_csbd}}" />
								<input type="submit" value="Set" name="original" class="set" />
							</form>
							{{if $item.bsn_orginal_csbd}} {{$item.bsn_original_csbd_date}} <br />
							{{$item.bsn_original_csbd_user}} {{/if}}
						</td>
						<td data-col="latest_gcn">
							<form name="mlist_l" method="post" action="">
								<input type="text" name="bsn_latest_csbd[{{$item.bsn_id}}]"
									class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo2_{{$item.bsn_id}}"
									value="{{$item.bsn_latest_csbd}}" />
								<input type="submit" value="Set" name="latest" class="set" />
							</form>
							{{if $item.bsn_latest_csbd}} {{$item.bsn_latest_csbd_date}} <br />
							{{$item.bsn_latest_csbd_user}} {{/if}}

						</td>
						<td> {{$item.dd}}</td>
						<!--         <td> m
             <form name="mlist_Ls" method="post" action="" >
              <input type="text" name="bs_ptt_last_spoken[{{$item.bsn_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo22_{{$item.bsn_id}}" value="{{$item.bs_ptt_last_spoken}}"  /> 
             <input type="submit" value="Set" name="last_spoken" class="set" /> 
             </form> 
             {{if $item.bs_ptt_last_spoken}} {{$item.bs_ptt_last_spoken_date}} <br /> {{$item.bs_ptt_last_spoken_user}} {{/if}}      
    
         </td>-->


						<td><input type="button" value="Print"
								onclick="document.location.href='{{$BASE_URL}}{{$XFA.home}}/print/{{$item.bsn_id}}'" />
						</td>
						<td>{{$item.out_c}}</td>
						<td>
							<form name="mlist123" method="post" enctype="multipart/form-data">
								<input type="hidden" name="bsn_id" value="{{$item.bsn_id}}" />
								<input type="file" name="pr_letter" /><br />
								{{if $item.bc_ptt_letter}}
								<div style="text-align:center;">

									<a href="/planning_task_tracker.download_content_wl?file_name={{$item.bc_ptt_letter}}&module_name=planning_task_tracker.home"
										target="_blank">
										Download</a>
								</div> {{/if}}
								<input type="submit" name="savedata" title="Save" value="Upload" class="set2"> &nbsp;
							</form>
						</td>

						{{ if $item.bs_traffic_light eq 1}}
						<td style="background:#00CC33; width:350px;">
							<a href="{{$BASE_URL}}planning_task_tracker.colorbox/bsn_id/{{$item.bsn_id}}"
								class="various">Color</a>
							<br /><br />{{$item.bs_tl_user}}<br />{{$item.bs_tl_date}}<br />
							<a href="{{$BASE_URL}}planning_task_tracker.reason/bsn_id/{{$item.bsn_id}}"
								class="various">Read</a>
						</td>
						{{ elseif  $item.bs_traffic_light eq 2}}
						<td style="background: #ff7f27;width:350px;">
							<a href="{{$BASE_URL}}planning_task_tracker.colorbox/bsn_id/{{$item.bsn_id}}"
								class="various">Color</a>
							<br /><br />{{$item.bs_tl_user}}<br />{{$item.bs_tl_date}}<br />
							<a href="{{$BASE_URL}}planning_task_tracker.reason/bsn_id/{{$item.bsn_id}}"
								class="various">Read</a>
						</td>
						{{ elseif  $item.bs_traffic_light eq 3}}
						<td style="background: #F00;width:350px;">
							<a href="{{$BASE_URL}}planning_task_tracker.colorbox/bsn_id/{{$item.bsn_id}}"
								class="various">Color</a>
							<br /><br />{{$item.bs_tl_user}}<br />{{$item.bs_tl_date}}<br />
							<a href="{{$BASE_URL}}planning_task_tracker.reason/bsn_id/{{$item.bsn_id}}"
								class="various">Read</a>
						</td>
						{{ elseif  $item.bs_traffic_light eq 4}}
						<td style="background:#FFFF00;width:350px;">
							<a href="{{$BASE_URL}}planning_task_tracker.colorbox/bsn_id/{{$item.bsn_id}}"
								class="various">Color</a>
							<br /><br />{{$item.bs_tl_user}}<br />{{$item.bs_tl_date}}<br />
							<a href="{{$BASE_URL}}planning_task_tracker.reason/bsn_id/{{$item.bsn_id}}"
								class="various">Read</a>
						</td>
						{{else }}
							<td>
								<a href="{{$BASE_URL}}planning_task_tracker.colorbox/bsn_id/{{$item.bsn_id}}"
									class="various">Color</a>
							</td>
							{{/if}}

							<td>

								<select name="plans[{{$item.bs_business_id}}]"
									Onchange="update_pc({{$item.bs_business_id}},this.value)">

									<option value="0">Please Select</option>
									{{foreach from=$pcData key="key3" item="item3"}}
									<option value="{{$item3.pc_id}}" {{if $item3.pc_id eq $item.bs_ptt_pc_option}}
										selected="selected" {{/if}}>{{$item3.pc_option}}</option>
									{{/foreach}}
								</select>
								<div id="usr3{{$item.bs_business_id}}">
									{{$item.bs_ptt_pc_user}}<br />{{$item.bs_ptt_pc_date}} </div>
								<script>

									function update_pc(id, value) {
										//alert(id);
										//alert(value);	
										var tana3 = "#usr3" + id;
										$.ajax({
											type: "GET",
											url: "{{$BASE_URL}}planning_task_tracker.update_pc/id/" + id + "/value/" + value,
											success: function (result) {
												$(tana3).html(result);
											}
										});
									}

								</script>

							</td>



							{{foreach from=$item.task key="keyh" item="itemh"}}
							{{if $itemh}}
							{{if $itemh eq  'N / R'}}
							<th valign="middle" style="width:100px; background:#0CF;">
								<a href="{{$BASE_URL}}business.taskdetail/bsn_id/{{$item.bsn_id}}/uid/{{$keyh}}"
									target="_blank">{{$itemh}}</a>
							</th>
							{{else}}
								<th valign="middle" style="background:#0C0;">
									<a href="{{$BASE_URL}}business.taskdetail/bsn_id/{{$item.bsn_id}}/uid/{{$keyh}}"
										target="_blank">{{$itemh}}</a>
								</th>
								{{/if}}

								{{else}}
									<th align="center" valign="middle" style="width:100px;">
										<a href="{{$BASE_URL}}business.taskdetail/bsn_id/{{$item.bsn_id}}/uid/{{$keyh}}"
											target="_blank">View<br />Task</a>
									</th>
									{{/if}}

									{{/foreach}}

									<td>

										<div class="slidecontainer">
											<input type="range" min="0" max="100" value="{{$item.bsn_per_complete}}"
												class="slider" id="myRange_{{$countn}}"
												Onchange="update({{$item.bsn_id}},this.value)">
											<p>%: <span id="demo_{{$item.bsn_id}}"></span></p>
										</div>

										<script>
											var slider = document.getElementById("myRange_{{$countn}}");
											var output{{ $item.bsn_id }} = document.getElementById("demo_{{$item.bsn_id}}");
output{ { $item.bsn_id } }.innerHTML = slider.value;

											slider.oninput = function () {
  output{ { $item.bsn_id } }.innerHTML = this.value;
											}


											function update(id, value) {
												//alert(id);
												$.ajax({
													type: "GET",
													url: "{{$BASE_URL}}/design_report.update_per/bsn_id/" + id + "/value/" + value,
													success: function (result) {
													}
												});
											}

										</script>



									<td>Completed Task: {{$item.completed}}%
										<br />Not Req. Task : {{$item.notreq }}%
									</td>

									</td>
									<td> {{if $item.bc_ptt_letter eq ''}}<span style="color: #F00;"> Weekly Letter Not
											Uploaded </span>
										{{elseif $item.bc_planning_task_report eq ''}}<span style="color: #F00;"> 7 Day
											Task Report Not Generated</span>
										{{else}}
											<input type="button" value="Merge"
												onclick="document.location.href='{{$BASE_URL}}{{$XFA.home}}/merge/{{$item.bsn_id}}'" />
											{{/if}}
									</td>
									<td> </td>
									<td> </td>
									<td> </td>
									<td><strong>{{$item.bcust_fname}} &nbsp; {{$item.bcust_lname}}</strong> <br />
										{{$item.bsn_address}}
									</td>

					</tr>
					{{assign var=countn value=$countn-1}}
					{{/foreach}}
				</tbody>

				{{/if}}
			</table>
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
<!--</p>-->
</div>