<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
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


	function add_procedure() {
		var viewurl = "{{$BASE_URL}}xray_overview_report.view_procedure" + "/random/" + Math.random();

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

	function add_sbc() {
		var viewurl = "{{$BASE_URL}}xray_overview_report.view_sbc" + "/random/" + Math.random();

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

	.bn {
		padding: 3px !important;
		font-size: 12px !important;
		text-transform: capitalize !important;
		background: none !important;
		border: none !important;
		color: #09C !important;
		font-weight: bold !important;
	}
</style>

<h3 class="page-title">{{$title}}</h3>
<br />
<form name="mlist" method="post" enctype="multipart/form-data">

	<div style="float:left; text-align:left;">
		&nbsp; &nbsp; <input type="button" name="proc_panel" value="Procedure Panel"
			onclick="javascript:add_procedure();" />
		<input type="submit" name="hidden" value="Show Hidden" />
		<input type="button" name="Add New" value="Special Bank Condition Admin" onclick="javascript:add_sbc();" />
		<br />
		&nbsp; &nbsp <strong>Search : </strong>
		<input type="text" name="keyword" value="{{$keyword}}" style="width:300px;" placeholder="Search for Address" />
		<input type="submit" value="Search" name="search" /> &nbsp;<input type="submit" name="clear_search"
			value="Clear Search" />

		&nbsp; &nbsp;<strong> Filter By : </strong>

		<select name="status_search" />
		<option value="">Show All</option>
		<option value="2">Planning Approvals</option>
		<option value="5">Inclusions</option>
		<option value="6">Pre Construction</option>
		<option value="3">Construction</option>
		<option value="4">Complete</option>
		</select>
		&nbsp; &nbsp;<input type="submit" value="Filter" name="filter" />
		<input type="submit" value="Clear Filter" name="clear" />

	</div>
	<!--<div style="float:right;"> 
<input type="button" value="Export To XLS" onclick="document.location.href='{{$BASE_URL}}xray_report.home/export/1'" /> &nbsp;
</div>-->

	</div>
	<div style="float:left; width:100%;" class="tableFixHead">
		<table id="doclist-table" class="nav-back" width="100%">
			<thead>
				<tr>
					<th class="topmenu" align="center" valign="middle" width="3%">SrNo</th>
					<th class="topmenu" align="center" valign="middle" width="12%">Project Address</th>
					<th class="topmenu" align="center" valign="middle" width="10%">Status</th>
					<th class="topmenu" align="center" valign="middle" width="10%">Special Conditions</th>
					<th class="topmenu" align="center" valign="middle" width="10%">Special Bank conditions</th>
					<th class="topmenu" align="center" valign="middle" width="10%">Total Variation</th>
					<th class="topmenu" align="center" valign="middle" width="8%">Hide</th>

					<th class="topmenu" align="center" valign="middle" width="7%">Deposit - Invoiced</th>
					<th class="topmenu" align="center" valign="middle" width="7%">Deposit - Paid</th>

					<th class="topmenu" align="center" valign="middle" width="7%">Planning Approvals Submitted- Invoiced
					</th>
					<th class="topmenu" align="center" valign="middle" width="7%">Planning Approvals Submitted - Paid
					</th>

					<th class="topmenu" align="center" valign="middle" width="7%">Floor Systems Complete - Invoiced
					</th>
					<th class="topmenu" align="center" valign="middle" width="7%">Floor Systems Complete - Paid</th>

					<th class="topmenu" align="center" valign="middle" width="7%">Wall and Roof Frames Complete -
						Invoiced</th>
					<th class="topmenu" align="center" valign="middle" width="7%">Wall and Roof Frames Complete - Paid
					</th>

					<th class="topmenu" align="center" valign="middle" width="7%">Close Up Complete - Invoiced</th>
					<th class="topmenu" align="center" valign="middle" width="7%">Close Up Complete - Paid</th>

					<th class="topmenu" align="center" valign="middle" width="7%">Fixing Complete - Invoiced</th>
					<th class="topmenu" align="center" valign="middle" width="7%">Fixing Complete - Paid </th>

					<th class="topmenu" align="center" valign="middle" width="7%">Painting Complete - Invocie</th>
					<th class="topmenu" align="center" valign="middle" width="7%">Painting Complete - Paid</th>


					<th class="topmenu" align="center" valign="middle" width="7%">Project Completion - Invoice</th>
					<th class="topmenu" align="center" valign="middle" width="7%">Project Completion - Paid</th>

				</tr>
				{{if $list}}
			<tbody>

				<!--{{assign var=countn value= $numstartvounter}}-->
				{{assign var=countn value= $total}}

				{{foreach from=$list key="key" item="item"}}
				<tr bgcolor="{{cycle values=" #D3E8D6,WHITE" advance=true}}">
					<td> {{counter}} </td>
					<td><a href="{{$item.link}}" target="_blank">{{$item.bsn_name}}</a></td>
					<td>{{$item.status}}</td>
					<td style="text-align:center;">{{$item.total_sc}}<br />
						<form name="sc" method="post" action="">
							<input type="hidden" name="bsn_id" value="{{$item.bs_business_id}}" />
							<input type="submit" name="special_cond" value="Download Special Condition" class="bn" />
						</form>

					</td>
					<td>
						<select name="sbc[{{$item.bs_business_id}}]" onchange="update_sbc({{$item.bsn_id}},this.value)">
							<option value="0">Please Select</option>
							{{foreach from=$sbcdata key="key1" item="item1"}}
							<option value="{{$item1.sb_id}}" {{if $item1.sb_id eq $item.bsn_xor_sbc}}
								selected="selected" {{/if}}>{{$item1.sb_option}}</option>
							{{/foreach}}
						</select>
						<script language="javascript">

							function update_sbc(id, value) {
								$.ajax({
									type: "GET",
									url: "{{$BASE_URL}}xray_overview_report.update_sbc/bsn_id/" + id + "/value/" + value,
									success: function (result) {
									}
								});

							}  
						</script>
						<a href="{{$BASE_URL}}xray_overview_report.notes/bsn_id/{{$item.bsn_id}}"
							class="various">Add/View Notes</a>


					</td>
					<td style="text-align:center;">{{$item.total_var}}
						<form name="var" method="post" action="">
							<input type="hidden" name="bsn_id" value="{{$item.bs_business_id}}" />
							<input type="submit" name="variations" value="Download Variations" class="bn" />
						</form>
					</td>

					<td>
						<form name="recmet3" method="post" action="">
							<input type="hidden" name="hide[{{$item.bs_business_id}}]" value="0" />
							<label class="switch">
								<input class="switch-input" type="checkbox" name="hide[{{$item.bs_business_id}}]"
									value="1" onclick="this.form.submit();" {{if $item.bs_xor_hide eq 1 }}
									checked="checked" {{/if}} />
								<span class="switch-label" data-on="Yes" data-off="No"></span>
								<span class="switch-handle"></span> <br />
							</label>
						</form>
					</td>

					<td>{{$item.ppd_hia_value_1}}</td>
					<td>{{$item.ppd_value_1}} </td>

					<td {{if $item.ppd_invoice_sent}} style="background: #0C6;" {{/if}}>{{$item.ppd_hia_value_2}}<br />
						{{if $item.ppd_invoice_sent}}Yes Invoiced {{/if}}
					</td>

					<td>{{$item.ppd_value_2}}</td>

					<td {{if $item.ppd_invoice_sent_3}} style="background: #0C6;" {{/if}}>
						{{$item.ppd_hia_value_3}}<br />
						{{if $item.ppd_invoice_sent_3}}Yes Invoiced {{/if}}
					</td>
					<td>{{$item.ppd_value_3}} </td>

					<td {{if $item.ppd_invoice_sent_4}} style="background: #0C6;" {{/if}}>{{$item.ppd_hia_value_4}}
						{{if $item.ppd_invoice_sent_4}}Yes Invoiced {{/if}}
					</td>


					<td>{{$item.ppd_value_4}} </td>

					<td {{if $item.ppd_invoice_sent_5}} style="background: #0C6;" {{/if}}>
						{{$item.ppd_hia_value_5}}<br />
						{{if $item.ppd_invoice_sent_5}}Yes Invoiced {{/if}}
					</td>
					<td>{{$item.ppd_value_5}} </td>

					<td {{if $item.ppd_invoice_sent_6}} style="background: #0C6;" {{/if}}>
						{{$item.ppd_hia_value_6}}<br />
						{{if $item.ppd_invoice_sent_6}}Yes Invoiced {{/if}}
					</td>
					<td>{{$item.ppd_value_6}} </td>

					<td {{if $item.ppd_invoice_sent_7}} style="background: #0C6;" {{/if}}>
						{{$item.ppd_hia_value_7}}<br />
						{{if $item.ppd_invoice_sent_7}}Yes Invoiced {{/if}}
					</td>
					<td>{{$item.ppd_value_7}} </td>

					<td {{if $item.ppd_invoice_sent_8}} style="background: #0C6;" {{/if}}>
						{{$item.ppd_hia_value_8}}<br />
						{{if $item.ppd_invoice_sent_8}}Yes Invoiced {{/if}}
					</td>
					<td>{{$item.ppd_value_8}} </td>

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