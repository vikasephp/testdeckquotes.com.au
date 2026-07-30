<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

{{include file=$jdata}}
{{include file=$tiny_basic}}
<h3 class="page-title">{{$title}}</h3>

<style>
	#fancybox-wrap {
		z-index: 9999999;
	}
</style>

<script language="javascript">

	function add_procedure() {
		var viewurl = "{{$BASE_URL}}lateletter_report.view_procedure" + "/random/" + Math.random();

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

<table width="100%">

	<tr>
		<td style="width:50%">
			<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
				&nbsp;<input type="button" name="proc_panel" value="Procedure Panel"
					onclick="javascript:add_procedure();" /> <br />
				&nbsp; &nbsp; <strong>Search : </strong>
				<input type="text" name="keyword" value="{{$keyword}}" style="width:300px;"
					placeholder="Search for Address" />
				<input type="submit" value="Search" name="search" /> &nbsp;<input type="submit" name="clear_search"
					value="Clear Search" />
				&nbsp; &nbsp; <input type="submit" value="Show No Send" name="show_no_send" />
		</td>
		</form>

	</tr>
</table>

<div id="">
	<table id="list-table" class="nav-back" width="100%">
		<thead>
			<tr>

				<th class="topmenu" align="center" valign="middle" width="20%">Project</th>
				<th class="topmenu" align="center" valign="middle" width="10%">Customer Name</th>
				<th class="topmenu" align="center" valign="middle" width="8%">Status</th>
				<th class="topmenu" align="center" valign="middle" width="5%">Records</th>
				<th class="topmenu" align="center" valign="middle" width="12%">Stage</th>
				<th class="topmenu" align="center" valign="middle" width="6%">Amount Owed</th>
				<th class="topmenu" align="center" valign="middle" width="3%">Interest</th>
				<th class="topmenu" align="center" valign="middle" width="5%">Annual Interest</th>
				<th class="topmenu" align="center" valign="middle" width="3%">Days</th>
				<th class="topmenu" align="center" valign="middle" width="3%">Daily Interest</th>
				<th class="topmenu" align="center" valign="middle" width="6%">Days Late</th>
				<th class="topmenu" align="center" valign="middle" width="6%">Total</th>
				<th class="topmenu" align="center" valign="middle" width="6%">Total Amount</th>
				<th class="topmenu" align="center" valign="middle" width="5%">Invoice</th>
				<th class="topmenu" align="center" valign="middle" width="6%">Send</th>
				<th class="topmenu" align="center" valign="middle" width="9%">Letter</th>
				<th class="topmenu" align="center" valign="middle" width="10%">Auto Emailed</th>
				<th class="topmenu" align="center" valign="middle" width="5%">Notes</th>
			</tr>
		</thead>
		<tbody>
			{{assign var=countn value= $total}}
			{{foreach from=$list key="key" item="item"}}

			<tr bgcolor="#FFFFFF">


				<td><a href="{{$item.link}}" target="_blank">{{$item.bsn_name}}</a></td>
				<td>{{$item.customer}}</td>
				<td>{{$item.status}}</td>
				<td style="text-align:center;">{{$item.records}}</td>
				<td>{{$item.ppd_stage}}</td>
				<td>{{$item.ppd_hia_value}}</td>
				<td>14%</td>
				<td>${{$item.annual}}</td>
				<td>365</td>
				<td>{{$item.daily}}</td>
				<td>{{$item.days_late}} </td>
				<td>${{$item.total}}</td>
				<td>${{$item.total_amount}}</td>

				<td>{{if $item.ppd_invoice_sent}}
					<a href="/business.download_content_pp?file_name={{$item.ppd_invoice_sent}}&module_name=business.home"
						target="_blank">Download </a>
					{{/if}}
				</td>

				<td>
					<form name="recmet4" method="post" action="">
						<input type="hidden" name="send[{{$item.ppd_id}}]" value="0" />
						<label class="switch">
							<input class="switch-input" type="checkbox" name="send[{{$item.ppd_id}}]" value="1"
								onclick="this.form.submit();" {{if $item.ppd_default_int eq 1 }} checked="checked"
								{{/if}} />
							<span class="switch-label" data-on="Yes" data-off="No"></span>
							<span class="switch-handle"></span> <br />
						</label>

					</form>
					{{$item.ppd_send_user}} <br /> {{$item.ppd_send_date}}
				</td>
				<td>
					{{if $item.ppd_letter_to_be}}
					<a href="/business.download_content_pp?file_name={{$item.ppd_letter_to_be}}&module_name=business.home"
						target="_blank">Download </a>
					{{/if}}

				</td>
				<td> {{$item.ppd_email_date}}</td>

				<td><a href="{{$BASE_URL}}lateletter_report.notes/ppd_id/{{$item.ppd_id}}" class="various"
						style="color: #0C6;">Notes</a></td>
			</tr>
			{{assign var=countn value=$countn-1}}
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