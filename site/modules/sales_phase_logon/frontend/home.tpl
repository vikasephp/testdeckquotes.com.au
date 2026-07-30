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


	function add_procedure() {
		var viewurl = "{{$BASE_URL}}sales_phase_logon.view_procedure" + "/random/" + Math.random();

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
</style>

<h3 class="page-title">{{$title}}</h3>
<br />
<form name="mlist" method="post" enctype="multipart/form-data">

	<div style="float:left; text-align:left;">
		&nbsp; &nbsp; <input type="button" name="proc_panel" value="Procedure Panel"
			onclick="javascript:add_procedure();" /> <br />
		&nbsp; &nbsp;<input type="text" name="address" style="width:350px;" placeholder="Search for Business Name" />
		<input type="submit" value="Search" name="search" /> &nbsp;<input type="submit" name="clear"
			value="Clear Search" />
	</div>
	<div style="float:right; margin-right:10px;">
		<input type="submit" name="hidden" value="Show Hidden" />
	</div>

	</div>
	<div style="float:left; width:100%;">
		<table id="doclist-table" class="nav-back" width="100%">
			<thead>
				<tr>
					<th class="topmenu" align="center" valign="middle" width="3%">SrNo</th>

					<th class="topmenu" align="center" valign="middle" width="14%">Project Address</th>
					<th class="topmenu" align="center" valign="middle" width="3%">Users</th>
					<th class="topmenu" align="center" valign="middle" width="3%">Status</th>
					<th class="topmenu" align="center" valign="middle" width="3%">Project Type</th>
					<th class="topmenu" align="center" valign="middle" width="10%">User </th>
					<th class="topmenu" align="center" valign="middle" width="3%">Link</th>

					<th class="topmenu" align="center" valign="middle" width="3%">Mobile</th>
					<th class="topmenu" align="center" valign="middle" width="3%">Email</th>
					<th class="topmenu" align="center" valign="middle" width="3%">Last Logged On</th>
					<th class="topmenu" align="center" valign="middle" width="3%">Hide</th>
					<th class="topmenu" align="center" valign="middle" width="3%">Control Button<br />Sales Phase</th>

				</tr>
				{{if $list}}
			<tbody>

				<!--{{assign var=countn value= $numstartvounter}}-->
				{{assign var=countn value= $total}}

				{{foreach from=$list key="key" item="item"}}
				<tr bgcolor="{{cycle values=" #D3E8D6,WHITE" advance=true}}">
					<td> {{counter}} </td>
					<td>{{$item.bsn_name}}</td>
					<td style="text-align:center;">{{$item.users}}</td>
					<td>{{$item.status}}</td>
					<td>{{$item.pt_name}}</td>
					<td>{{$item.bcust_fname}} &nbsp;{{$item.bcust_lname}}</td>
					<td><a href="{{$item.link}}" target="blank">Link</a></td>

					<td>{{$item.bcust_misc_moble}}</td>
					<td>{{$item.bcust_misc_email1}}</td>
					<td>{{$item.last_logged_on}}</td>
					<td>
						<form name="recmet3" method="post" action="">
							<input type="hidden" name="hide[{{$item.bs_business_id}}]" value="0" />
							<label class="switch">
								<input class="switch-input" type="checkbox" name="hide[{{$item.bs_business_id}}]"
									value="1" onclick="this.form.submit();" {{if $item.bs_sales_phase_hide eq 1 }}
									checked="checked" {{/if}} />
								<span class="switch-label" data-on="Yes" data-off="No"></span>
								<span class="switch-handle"></span> <br />
							</label>
						</form>
					</td>

					<td>
						<form name="recmet3" method="post" action="">
							<input type="hidden" name="sales[{{$item.bs_business_id}}]" value="0" />
							<label class="switch">
								<input type="checkbox" class="switch-input" name="sales[{{$item.bs_business_id}}]" value="1" onclick="this.form.submit();" {{if $item.bsn_pa_sales_flag eq 1 }} checked="checked" {{/if}} />
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