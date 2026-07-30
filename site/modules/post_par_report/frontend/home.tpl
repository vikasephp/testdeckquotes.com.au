<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/default.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/tree/simpletreemenu.js"></script>

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/rangeslider/rangeSlider.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/rangeslider/rangeSlider.js"></script>

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tree/simpletree.css" />
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

		function close_win() {
			$.fancybox.close();
			window.location.reload();
		}
	});
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
				var viewurl = "{{$BASE_URL}}post_par_report.view_procedure" + "/random/" + Math.random();

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
	#fancybox-wrap {
		z-index: 9999999;
	}

	.tableFixHead {
		overflow-y: auto;
		height: 100px;
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

<form name="mlist" method="post">

	<div style="float:left; text-align:left;">
		&nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" />
		<br />
		&nbsp; &nbsp; <strong>Search:</strong>&nbsp;&nbsp;
		<input type="text" name="searchkey" value="{{$searchkey}}" style="width:400px;" placeholder="Enter address" />
		&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="submit" value="Search" name="searchaddr" />
		<input type="submit" value="Clear Search" name="clear" />
	</div>

	<div style="float:right;">
		<input type="submit" name="saverating" title="Save" value="Update Star Raring"> &nbsp; &nbsp;&nbsp;

		<input type="submit" name="download" value="Download Pdf" />


	</div>


	<div style="float:left; width:100%;">
		<table id="doclist-table" class="nav-back tableFixHead" width="100%">
			<thead>
				<tr>
					<th class="topmenu" align="center" valign="middle" width="3%">SrNo</th>
					<th class="topmenu" align="center" valign="middle" width="15%">Address</th>
					<th class="topmenu" align="center" valign="middle" width="3%">Contacts</th>
					<th class="topmenu" align="center" valign="middle" width="3%">Link</th>
					<th class="topmenu" align="center" valign="middle" width="3%">Appointment Date</th>

					<th class="topmenu" align="center" valign="middle" width="3%">Day Count</th>
					<th class="topmenu" align="center" valign="middle" width="15%">Star Ranking</th>
					<th class="topmenu" align="center" valign="middle" width="15%">Par Recording</th>
					<th class="topmenu" align="center" valign="middle" width="5%">Budget</th>
					<th class="topmenu" align="center" valign="middle" width="5%">Add Feedback</th>





					<th class="topmenu" align="center" valign="middle" width="7%">Add To Report</th>


				</tr>
				{{if $list}}
			<tbody>

				<!--{{assign var=countn value= $numstartvounter}}-->
				{{assign var=countn value= $total2}}

				{{foreach from=$list key="key" item="item"}}
				<tr bgcolor="{{cycle values=" #D3E8D6,WHITE" advance=true}}">
					<td> {{$countn}} </td>
					<td>{{$item.bsn_address}}</td>
					<td> <a href="{{$BASE_URL}}js/vcard/index.php?fname={{$item.bcust_fname}}&lname={{$item.bcust_lname}}&email1={{$item.bcust_misc_email1}}&email2={{$item.bcust_misc_email2}}&mobile={{$item.bcust_misc_moble}}&business={{$item.bcust_misc_business}}&home={{$item.bcust_misc_home}}"
							class="action_new" title="Download Vcard"><img style="height: 17px; width:22px"
								src="{{$BASE_URL}}images/vcard.png" /></a> </td>
					<td style="text-align:center;"><a href="{{$item.link}}" target="blank">Link</a></td>
					<td>{{$item.pardel}} </td>

					<td>{{$item.dayscount}} </td>
					<td>
						<style>
							output {
								display: inline-block;
								font-size: 15px;
								font-weight: bold;
								text-align: center;
								width: 300px;
							}
						</style>

						<div style="width:100%; margin-top:15px;">


							<input type="range" name="rating[{{$item.bsn_id}}]" value="{{$item.bsn_rating}}" min="0"
								max="5" data-rangeSlider>

							<output></output>

						</div>

						<script>
			(function () {

				var selector = '[data-rangeSlider]',
					elements = document.querySelectorAll(selector);

				// Example functionality to demonstrate a value feedback
				function valueOutput(element) {
					var value = element.value,
						output = element.parentNode.getElementsByTagName('output')[0];
					output.innerHTML = value;
				}

				for (var i = elements.length - 1; i >= 0; i--) {
					valueOutput(elements[i]);
				}

				Array.prototype.slice.call(document.querySelectorAll('input[type="range"]')).forEach(function (el) {
					el.addEventListener('input', function (e) {
						valueOutput(e.target);
					}, false);
				});


				// Basic rangeSlider initialization
				rangeSlider.create(elements, {

					// Callback function
					onInit: function () {
					},

					// Callback function
					onSlideStart: function (value, percent, position) {
						console.info('onSlideStart', 'value: ' + value, 'percent: ' + percent, 'position: ' + position);
					},

					// Callback function
					onSlide: function (value, percent, position) {
						console.log('onSlide', 'value: ' + value, 'percent: ' + percent, 'position: ' + position);
					},

					// Callback function
					onSlideEnd: function (value, percent, position) {
						console.warn('onSlideEnd', 'value: ' + value, 'percent: ' + percent, 'position: ' + position);
					}
				});

			})();
						</script>


					</td>

					<td>
						{{if $item.datarm}}
						{{foreach from=$item.datarm key="key" item="item2"}}
						<a href="{{$BASE_URL}}files/recorded_meetings/{{$item2.rm_original_file}}"
							target="_blank">{{$item2.rm_meeting_file}}</a> <br>


							{{/foreach}}
							{{/if}}


					</td>



					<td>{{$item.bsn_advert_text}} </td>


					<td> <input type="button" name="feedback" value="Add Feedback"
							onclick="javascript:addfeedback({{$item.bsn_id}});"
							style="width:90px; height:20px; font-size:11px; line-height:17px !important; padding:0px !important" />
					</td>





					<td>
						<input type="hidden" name="hide[{{$item.bsn_id}}]" value="0" />
						<label class="switch">
							<input class="switch-input" type="checkbox" name="pdf[{{$item.bsn_id}}]" value="1" />
							<span class="switch-label" data-on="Yes" data-off="No"></span>
							<span class="switch-handle"></span> <br />
						</label>

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
<table id="doclist-table" width="100%" bgcolor="#d3e8d6">
	<thead>

		<tr>
			<td colspan="2">&nbsp;</td>
		</tr>
	</thead>
</table>
</div>