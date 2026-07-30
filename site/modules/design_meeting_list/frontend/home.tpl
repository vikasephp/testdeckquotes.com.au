<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
{{include file=$jdata}}
{{include file=$tiny_basic}}

<script>
	!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />

<h3 class="page-title">{{$title}}</h3>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

<style>
	.dtpic {
		width: 65px !important;
		padding-top: 1px !important;
		padding-bottom: 1px !important;
		margin-bottom: 10px !important;
	}

	.dt {
		border: 1px solid #CCC;
		padding: 8px;
		margin-top: 15px !important;
	}

	#fancybox-wrap {
		z-index: 9999999;
	}
</style>

<script type="text/javascript">
	$(document).ready(function () {
		/*
		*   Examples - images
		*/
		$(".various").fancybox({
			'width': '95%',
			'height': '95%',
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
		var viewurl = "{{$BASE_URL}}design_meeting_list.view_procedure" + "/random/" + Math.random();

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

<h3 class="page-title">Design Meeting List</h3>
<br />

<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
	<div style="float:left;">
		&nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" />
	</div>
</form>

<div id="">
	<table id="list-table" class="nav-back" width="100%">
		<thead>
			<tr>
				<th class="topmenu" align="center" valign="middle" width="25%">Relevant Checklist Numbers</th>
				<th class="topmenu" align="center" valign="middle" width="25%">Type</th>
				<th class="topmenu" align="center" valign="middle" width="25%">Customer Details</th>
				<th class="topmenu" align="center" valign="middle" width="25%">TNext Schedule Meeting</th>
			</tr>
		</thead>
		<tbody>
			{{assign var=countn value= $total}}
			{{foreach from=$list key="key" item="item"}}
			<tr bgcolor="#FFFFFF">
				<td> {{$item.chknoData}} </td>
				<td>
					<select name="type[{{$item.chknoData}}]"
						Onchange="update_type_new({{$item.chknoData|ltrim:'0'}},this.value)">
						<option value="0">Please Select</option>
						{{foreach from=$typeData key="keyt" item="itemt"}}
						<option value="{{$itemt.dr_id}}" {{if $itemt.dr_id eq $item.dpn_dr_type_new}}
							selected="selected" {{/if}}>{{$itemt.dr_type}}</option>
						{{/foreach}}
					</select>
					
				</td>
				<td>
					<strong>{{$item.bcust_fname}} &nbsp; {{$item.bcust_lname}}</strong>
					<br />
					{{$item.bsn_address}}
				</td>
				<td>
					<input type="text" name="dt" class="w16em dateformat-d-ds-m-ds-Y dtpic"
						id="demo452_{{$item.chknoData}}{{$item.bsn_id}}"
						onfocus="update_next_date({{$item.chknoData|ltrim:'0'}}, this.value);"
						value="{{$item.dpn_dr_next_date}}" />
					<br />
					<input type="text" name="tim" placeholder="Time" value="{{$item.dpn_dr_next_time}}"
						onkeyup="update_next_time({{$item.chknoData|ltrim:'0'}}, this.value);" />
					<br />
					<input type="text" name="location" placeholder="Location" value="{{$item.dpn_dr_next_location}}"
						onkeyup="update_next_location({{$item.chknoData|ltrim:'0'}}, this.value);" />
				</td>
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
								title="{{$pagenum}} Page">1</a></span>
						{{else}}<span class='current'>1</span>
							{{/if}}{{if $pagenum != 2}}
							<span class="paginate"><a class="pagination" href="{{$BASE_URL}}{{$XFA.home}}/pagenum/2"
									title="{{$pagenum}} Page">2</a></span>
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

<script language="javascript">
	function update_type_new(id, value) {
		$.ajax({
			type: "GET",
			url: "{{$BASE_URL}}design_report.update_type_new/dpn_unique_id/" + id + "/value/" + value,
			success: function (result) {
			}
		});
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