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
		var viewurl = "{{$BASE_URL}}complete_task_tracker.alerts" + "/bsn_id/" + bsn_id;

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
		var viewurl = "{{$BASE_URL}}complete_task_tracker.viewletter" + "/random/" + Math.random();
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
		var viewurl = "{{$BASE_URL}}complete_task_tracker.addfeedback" + "/bsn_id/" + bsn_id;


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
		var viewurl = "{{$BASE_URL}}complete_task_tracker.view_procedure" + "/random/" + Math.random();

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

	$(document).ready(function() {
		$('#toggleColumnSlider').attr('checked', 'checked');
		$('.other-column').hide();
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
		/* width: 4680px; */
		height: 20px;
	}

	.div2 {
		/* width: 4680px; */
		overflow: auto;
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
</style>

<h3 class="page-title">{{$title}}</h3>
<br />

<form name="mlist" method="post" enctype="multipart/form-data">
	<div style="display: flex; justify-content: space-between; align-items: end;">
		<div style="margin-left: 10px; text-align: left;">
			<div style="display: inline-block;">
				<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" />
				<span style="margin-left: 10px;"> NOTE: In order to save position responsible (below view task) please first add the complete status task in a project</span>
			</div>
			<div style="display: inline-block; vertical-align: bottom; margin-left: 50px;">
				<a href="javascript:void(0)" style="color: #000; text-decoration: none; line-height: 29px;" onclick="$('#toggleColumnSlider').removeAttr('checked').change()">Original View</a>
				<label class="switch" for="toggleColumnSlider" style="display: inline-block; margin: 0;">
					<input class="switch-input" onchange="toggleColumn()" id="toggleColumnSlider" type="checkbox">
					<span class="switch-label" data-on="" data-off=""></span>
					<span class="switch-handle"></span>
				</label>
				<a href="javascript:void(0)" style="color: #000; text-decoration: none; line-height: 29px;" onclick="$('#toggleColumnSlider').attr('checked', 'checked').change()">Slim View</a>
			</div>
		</div>
		<div style="margin-right: 10px; float: right;">
			<div>
				<input type="button" value="Export To XLS" onclick="document.location.href='{{$BASE_URL}}{{$XFA.home}}/export/1'" />
			</div>
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
						<th class="topmenu" align="center" valign="middle" style="width:140px;">Address</th>
						<th class="topmenu" align="center" valign="middle" style="width:10px;">Link</th>
						<th class="topmenu" align="center" valign="middle" style="width:5px;" data-col="project_view_details">Project View Details</th>
						<!--  <th class="topmenu" align="center" valign="middle" style="width:5px;">Days at <br />Status</th>
        				<th class="topmenu" align="center" valign="middle" style="width:50px;">Occupancy Date</th>-->
						{{foreach from=$colhead key="keyh" item="itemh"}}
						<th class="topmenu other-column" align="center" valign="middle" style="width:100px;">{{$itemh.bst_task_id}}
						</th>
						{{/foreach}}
						<th class="topmenu" align="center" valign="middle" style="width:145px;">Task Completed %</th>
						<th class="topmenu" align="center" valign="middle" style="width:110px;">Address</th>
					</tr>
				</thead>
				{{if $list}}
				<tbody>
					<tr class="other-column">
						<td colspan="4"></td>
						{{foreach from=$colhead key="keyp" item="itemp"}}
						<td>
							<input type="text" name="{{$itemp.bst_task_id}}" value="{{$itemp.bst_ptt_summary}}" style="width:100px;" onkeyup="update_ts({{$itemp.bst_task_id}},this.value)" />
						{{/foreach}}
							<script>
								function update_ts(id, value) {
									$.ajax({
										type: "GET",
										url: "{{$BASE_URL}}complete_task_tracker.update_ts/bst_task_id/" + id + "/value/" + value,
										success: function (result) {
										}
									});
								}
							</script>
						</td>
						<td colspan="9"></td>
					</tr>
					{{assign var=countn value= $total}}
					{{foreach from=$list key="key" item="item"}}
					<tr bgcolor="{{cycle values=" #D3E8D6,WHITE" advance=true}}">
						<td>{{$countn}} </td>
						<td>
							<strong>{{$item.bcust_fname}} &nbsp; {{$item.bcust_lname}}</strong>
							<br />
							{{$item.bsn_address}}
						</td>
						<td style="text-align: center;">
							<a href="{{$item.link}}" target="blank">Link</a>
						</td>
						<td data-col="project_view_details">
						<a href="/complete_task_tracker.view_project_details/bsn_id/{{$item.bsn_id}}" class="set3" style="color:#FFF;" target="_blank">View Project</a>
					</td>
						{{foreach from=$item.data.task key="keyh" item="itemh"}}
							{{if $itemh}}
								{{if $itemh eq  'N / R'}}
								<th class="other-column" valign="middle" style="width:100px;">
									<a href="{{$BASE_URL}}business.taskdetail/bsn_id/{{$item.bsn_id}}/uid/{{$keyh}}">{{$itemh}}</a>
									<br />
									<input type="text" name="resper" onkeyup="update_posresp({{$item.bsn_id}},{{$keyh}},this.value)" value="{{$item.data.per[$keyh]}}" />
								</th>
								{{else}}
								<th class="other-column" valign="middle" style="background:#0C0;">
									<a href="{{$BASE_URL}}business.taskdetail/bsn_id/{{$item.bsn_id}}/uid/{{$keyh}}">{{$itemh}}</a>
									<br />
									<input type="text" name="resper" onkeyup="update_posresp({{$item.bsn_id}},{{$keyh}},this.value)" value="{{$item.data.per[$keyh]}}" />
								</th>
								{{/if}}
							{{else}}
							<th class="other-column" align="center" valign="middle" style="width:100px;">
								<a href="{{$BASE_URL}}business.taskdetail/bsn_id/{{$item.bsn_id}}/uid/{{$keyh}}">View Task</a>
								<br />
								<br />
								<input type="text" name="resper" onkeyup="update_posresp({{$item.bsn_id}},{{$keyh}},this.value)" value="{{$item.data.per[$keyh]}}" />
							</th>
							{{/if}}
						{{/foreach}}
						<script>
							function update_posresp(bid, tid, value) {
								$.ajax({
									type: "GET",
									url: "{{$BASE_URL}}complete_task_tracker.update_posresp/bsn_id/" + bid + "/task_id/" + tid + "/value/" + value,
									success: function (result) {
									}
								});
							}
						</script>
						<td style="white-space: nowrap;">
							Completed Task: {{$item.completed}}%
							<br />
							Not Req. Task : {{$item.notreq }}%
						</td>
						<td>
							<strong>{{$item.bcust_fname}} &nbsp; {{$item.bcust_lname}}</strong>
							<br />
							{{$item.bsn_address}}
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