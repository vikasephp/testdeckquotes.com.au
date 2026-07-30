<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
{{include file=$jdata}}
{{include file=$tiny_basic}}
<h3 class="page-title">{{$title}}</h3>
<br />
<style>
	.set {
		font-size: 10px !important;
		width: 25px !important;
		display: inline-block;
		padding-top: 1px !important;
		padding-bottom: 1px !important;
		padding-left: 1px !important;
		height: 25px !important;
	}

	.dtpic {
		width: 65px !important;
		padding-top: 1px !important;
		padding-bottom: 1px !important;
		margin-bottom: 10px !important;
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
</style>

<script language="javascript">

	function add_procedure() {
		var viewurl = "{{$BASE_URL}}variations_report.view_procedure" + "/random/" + Math.random();

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
		var viewurl = "{{$BASE_URL}}variations_report.view_status" + "/random/" + Math.random();

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
		var viewurl = "{{$BASE_URL}}variations_report.view_type" + "/random/" + Math.random();

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

	function add_plans() {
		var viewurl = "{{$BASE_URL}}variations_report.view_plans" + "/random/" + Math.random();

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


<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">

	<div style="float:left; text-align:left;">
		&nbsp; &nbsp;<input type="button" name="proc_panel" value="Procedure Panel"
			onclick="javascript:add_procedure();" />
		&nbsp; &nbsp;<input type="button" name="status_options" value="Status Admin"
			onclick="javascript:add_status();" />
		&nbsp; &nbsp;<input type="button" name="type_options" value="Type Admin" onclick="javascript:add_type();" />
		&nbsp; &nbsp;<input type="button" name="plans_options" value="Plans Admin" onclick="javascript:add_plans();" />
		<br />

		&nbsp; &nbsp; <strong>Search : </strong>
		<input type="text" name="address" style="width:300px;" placeholder="Search for Address" />
		<input type="submit" value="Search" name="search" /> &nbsp;<input type="submit" name="clear_search"
			value="Clear Search" /> <br />
		&nbsp; &nbsp;<strong> Filter By Status : </strong>
		<select name="status" />
		<option value="0">Show All</option>
		{{foreach from = $statusData key="key3" item="item3"}}
		<option value="{{$item3.st_option}}">{{$item3.st_option}}</option>
		{{/foreach}}
		</select>
		&nbsp; &nbsp;<input type="submit" value="Filter" name="filter" />
		&nbsp;<input type="submit" name="clear" value="Clear Filter" />

		&nbsp; &nbsp;<strong> Filter By Financial: </strong>
		<select name="fin_search">
			<option value="">Please Select</option>
			<option value="1">Yes</option>
			<option value="2">No</option>
		</select>
		&nbsp; &nbsp;<input type="submit" value="Filter" name="fin_filter" />
		&nbsp;<input type="submit" name="clear" value="Clear Filter" />

		&nbsp; &nbsp;<strong> Filter By Invoice Created: </strong>
		<select name="inv_search">
			<option value="">Please Select</option>
			<option value="1" {{ if $inv_search eq 1 }}selected{{ /if }}>Yes</option>
			<option value="2" {{ if $inv_search eq 2 }}selected{{ /if }}>No</option>
		</select>
		&nbsp; &nbsp;<input type="submit" value="Filter" name="inv_filter" />
		&nbsp;<input type="submit" name="clear" value="Clear Filter" />

	</div>
	<div style="float:right">
		<input type="button" value="Export To XLS"
			onclick="document.location.href='{{$BASE_URL}}variations_report.home/export/1'" /> &nbsp;
	</div>
</form>

<div style="float:left; width:100%;" class="tableFixHead">
	<table id="list-table" class="nav-back" width="100%">
		<thead>
			<tr>
				<th class="topmenu" align="center" valign="middle" width="4%">Variations Id</th>
				<th class="topmenu" align="center" valign="middle" width="20%">Project Name</th>
				<th class="topmenu" align="center" valign="middle" width="20%">Document Name</th>
				<th class="topmenu" align="center" valign="middle" width="8%">Financial</th>
				<th class="topmenu" align="center" valign="middle" width="8%">Link To PDF File</th>
				<th class="topmenu" align="center" valign="middle" width="8%">Plans and Package</th>
				<th class="topmenu" align="center" valign="middle" width="8%">Signed Doc Uploaded Date</th>
				<th class="topmenu" align="center" valign="middle" width="8%">Signed by Customer Date</th>
				<th class="topmenu" align="center" valign="middle" width="8%">Linked To Signed PDF</th>
				<th class="topmenu" align="center" valign="middle" width="8%">Variation Date</th>
				<th class="topmenu" align="center" valign="middle" width="8%">Invoice Created</th>
				<th class="topmenu" align="center" valign="middle" width="8%">Value of Variations</th>
				<th class="topmenu" align="center" valign="middle" width="8%">Linked To Project </th>
				<th class="topmenu" align="center" valign="middle" width="8%">Linked to Progress Pass </th>
				<th class="topmenu" align="center" valign="middle" width="8%">Status</th>
				<th class="topmenu" align="center" valign="middle" width="8%">Schedule Update</th>

			</tr>
		</thead>
		<tbody>
			{{foreach from=$list key="key" item="item"}}
			<tr bgcolor="{{cycle values=" #D3E8D6,WHITE" advance=true}}">
				<td>{{$item.va_id}}</td>
				<td><a href="{{$item.link}}" target="_blank">{{$item.bsn_name}}</a></td>
				<td>{{$item.va_doc_name}}</td>
				<td>
					<form name="recmet5" method="post" action="">
						<input type="hidden" name="financial[{{$item.va_id}}]" value="0" />
						<label class="switch">
							<input class="switch-input" type="checkbox" name="financial[{{$item.va_id}}]" value="1" onclick="this.form.submit();" {{if $item.va_financial eq 1 }} checked="checked" {{/if}} />
							<span class="switch-label" data-on="Yes" data-off="No"></span>
							<span class="switch-handle"></span> <br />
						</label>
					</form>
				</td>
				<!--<td>{{$item.va_date|date_format:'%d-%m-%Y'}}</td>-->
				<td style="text-align:center;">
					{{if $item.va_pdf}}
						<!--<a href="https://deckquote.s3.amazonaws.com/files/variations_doc/{{$item.va_pdf}}" target="_blank">Link</a>-->
						<a href="/variations_report.download_content?file_name={{$item.va_pdf}}&module_name=variations_report.home" target="_blank">Link</a>
					{{/if}}
				</td>
				<td>
					<form name="recmet4" method="post" action="">
						<select name="plans[{{$item.va_id}}]" onChange="update_plans({{$item.va_id}}, this.value)" />
							<option value="0" {{if $item.va_plans eq 0}} selected="selected" {{/if}}>Please Select </option>
							{{foreach from = $plansData key="key5" item="item5"}}
								<option value="{{$item5.vp_id}}" {{if $item5.vp_id eq $item.va_plans}} selected="selected" {{/if}}>
									{{$item5.vp_option}}
								</option>
							{{/foreach}}
						</select>
					</form>
					<script>
						function update_plans(id, value) {
							$.ajax({
								type: "GET",
								url: "{{$BASE_URL}}variations_report.update_plans/va_id/" + id + "/value/" + value,
								success: function (result) {

								}
							});
						}
					</script>
				</td>
				<td>{{$item.va_signed_date}}</td>
				<td>{{$item.va_sign_cust_date}}</td>
				<td style="text-align:center;">
					{{if $item.va_signed}}
						<!--<a href="https://deckquote.s3.amazonaws.com/files/variations_doc/{{$item.va_signed}}" target="_blank">Link</a>-->
						<a href="/variations_report.download_content?file_name={{$item.va_signed}}&module_name=variations_report.home" target="_blank">Link</a>
					{{/if}}
				</td>
				<td>
					<input type="text" name="vardate[{{$item.va_id}}]" class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo_{{$item.va_id}}" value="{{$item.va_variation_date}}" onfocus="update_var_date({{$item.va_id}}, this.value);" />
					<script>
						function update_var_date(id, value) {
							$.ajax({
								type: "GET",
								url: "{{$BASE_URL}}variations_report.update_var_date/va_id/" + id + "/value/" + value,
								success: function (result) {
								}
							});
						}
					</script>
				</td>
				<td>
					<form name="recmet4" method="post" action="">
						<input type="hidden" name="update_inv_created[{{$item.va_id}}]" value="0" />
						<label class="switch">
							<input class="switch-input" type="checkbox" name="update_inv_created[{{$item.va_id}}]"
								value="1" onclick="this.form.submit();" {{if $item.va_inv_created eq 1 }}
								checked="checked" {{/if}} />
							<span class="switch-label" data-on="Yes" data-off="No"></span>
							<span class="switch-handle"></span> <br />
						</label>
					</form>
					{{if $item.va_inv_created eq 1 }} {{$item.va_inv_cr_user}}<br />{{$item.va_inv_cr_date}} {{/if}}
				</td>
				<td>
					<input type="text" name="value_var" value="{{$item.va_values}}" onkeyup="update_value({{$item.va_id}}, this.value);" />
					<script>
						function update_value(id, value) {
							$.ajax({
								type: "GET",
								url: "{{$BASE_URL}}variations_report.update_value/va_id/" + id + "/value/" + value,
								success: function (result) {
								}
							});
						}
					</script>
				</td>
				<td>
					<form name="recmet4" method="post" action="">
						<input type="hidden" name="linked_project[{{$item.va_id}}]" value="0" />
						<label class="switch">
							<input class="switch-input" type="checkbox" name="linked_project[{{$item.va_id}}]" value="1"
								onclick="this.form.submit();" {{if $item.va_link_project eq 1 }} checked="checked"
								{{/if}} />
							<span class="switch-label" data-on="Yes" data-off="No"></span>
							<span class="switch-handle"></span> <br />
						</label>
					</form>
					{{if $item.va_link_project  eq 1 }}
					{{$item.va_link_project_user}}<br />{{$item.va_link_project_date}} {{/if}}
				</td>


				<td>
					<form name="recmet4" method="post" action="">
						<input type="hidden" name="linked_pass[{{$item.va_id}}]" value="0" />
						<label class="switch">
							<input class="switch-input" type="checkbox" name="linked_pass[{{$item.va_id}}]" value="1"
								onclick="this.form.submit();" {{if $item.va_link_pr_pass eq 1 }} checked="checked"
								{{/if}} />
							<span class="switch-label" data-on="Yes" data-off="No"></span>
							<span class="switch-handle"></span> <br />
						</label>
					</form>
					{{if $item.va_link_pr_pass  eq 1 }}
					{{$item.va_link_pr_pass_user}}<br />{{$item.va_link_pr_pass_date}} {{/if}}
				</td>

				</td>


				<td>

					<form name="recmet2" method="post" action="">
						<select name="status[{{$item.va_id}}]" onChange="update_status({{$item.va_id}}, this.value)" />
						<option value="0" {{if $item.va_status eq 0}} selected="selected" {{/if}}>Please Select
						</option>
						{{foreach from = $statusData key="key3" item="item3"}}
						<option value="{{$item3.st_option}}" {{if $item3.st_option eq $item.va_status}}
							selected="selected" {{/if}}>{{$item3.st_option}}</option>
						{{/foreach}}

						</select>
					</form>

					<div id="cond{{$item.va_id}}">{{$item.va_status_user}}<br />{{$item.va_status_date}} </div>

					<script>
						function update_status(id, value) {
							var cond = '#cond' + id;

							$.ajax({
								type: "GET",
								url: "{{$BASE_URL}}variations_report.update_status/va_id/" + id + "/value/" + value,
								success: function (result) {
									$(cond).html(result);
								}

							});
						}
					</script>


				</td>
				<td>

					<form name="recmet5" method="post" action="">
						<input type="hidden" name="schedule[{{$item.va_id}}]" value="0" />
						<label class="switch">
							<input class="switch-input" type="checkbox" name="schedule[{{$item.va_id}}]" value="1"
								onclick="this.form.submit();" {{if $item.va_schedule_up eq 1 }} checked="checked"
								{{/if}} />
							<span class="switch-label" data-on="Yes" data-off="No"></span>
							<span class="switch-handle"></span> <br />
						</label>
					</form>
				</td>

			</tr>
			{{/foreach}}
		</tbody>
	</table>

	{{if $last > 1}}
	<table width="90%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			{{if $list}}
			<td align="center">
				<div class='pagination'>
					{{if $pagenum == 1}}
					<span class='disabled'>&#171; previous</span>
					{{else}}
						<a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{math equation=" x - y"
							x=$pagenum y=1}}" title="Previous">&#171; previous</a>
						{{/if}}

						{{if $pagenum != 1}}
						<span class="paginate"><a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/1"
								title="{{$page_num}} Page">1</a></span>
						{{else}}<span class='current'>1</span>
							{{/if}}{{if $pagenum != 2}}
							<span class="paginate"><a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/2"
									title="{{$page_num}} Page">2</a></span>
							{{else}}<span class='current'>2</span>
								{{/if}}
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
										{{if $page_num2 == $pagenum OR $page_num2 <= 0}}
										<span class='current'> {{$page_num2}}</span>
										{{else}}
											<a class="pagination"
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
												{{if $pagenum == $lastone }}
												<span class='current'>{{$lastone}}</span>
												{{else}}
													<a class="pagination"
														href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$lastone}}"
														title="{{$lastone}} Page">{{$lastone}}</a>
													{{/if}}
													{{/if}}
													{{if $last == 1}}
													{{elseif $last == 2}}
													{{else}}
														{{if $pagenum == $last}}
														<span class='current'>{{$last}}</span>
														{{else}}
															<a class="pagination"
																href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{$last}}"
																title="{{$last}} Page">{{$last}}</a>
															{{/if}}
															{{/if}}
															{{if $pagenum == $last}}
															<span class='disabled'>next &#187;</span>
															{{else}}
																<a class="pagination"
																	href="{{$BASE_URL}}{{$XFA.home}}/pagenum/{{math equation="
																	x + y" x=$pagenum y=1}}" title="Next">next
																	&#187;</a>
				</div>
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