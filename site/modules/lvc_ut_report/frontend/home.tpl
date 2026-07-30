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
		var viewurl = "{{$BASE_URL}}lvc_ut_report.view_procedure" + "/random/" + Math.random();
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
		var viewurl = "{{$BASE_URL}}lvc_ut_report.view_type" + "/random/" + Math.random();
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
	function add_lvc_type() {
		var viewurl = "{{$BASE_URL}}lvc_ut_report.view_lvc_type" + "/random/" + Math.random();
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
	<div style="float:left;">
		&nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" />
		&nbsp; &nbsp;<input type="button" name="type_options" value="Type Admin" onclick="javascript:add_type();" />
		&nbsp; &nbsp;<input type="button" name="lvc_type_options" value="LVC Type Admin"
			onclick="javascript:add_lvc_type();" />
		<!--&nbsp; &nbsp; &nbsp; &nbsp;<strong> Filter By : </strong> 
      <select name="status"/>
        <option value="0">Show All</option>
        {{foreach from = $statusData key="key3" item="item3"}}
        <option value="{{$item3.st_id}}" {{if $item3.st_id eq $status}} selected="selected" {{/if}}>{{$item3.st_option}}</option>
        {{/foreach}}
        </select> 
        &nbsp; &nbsp;<input type="submit" value="Filter" name="filter" />   
        &nbsp;<input type="submit" name="clear" value = "Clear Filter" />    
-->
	</div>
	<div style="float:right;">
		<input type="submit" name="hidden" value="Show Hidden" />
		<input type="button" name="Add New " value="Add New"
			onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.detail}}');" />
	</div>
</form>
<div id="">
	<table id="list-table" class="nav-back" width="100%">
		<thead>
			<tr>
				<th class="topmenu" align="center" valign="middle" width="3%">Unique Id</th>
				<th class="topmenu" align="center" valign="middle" width="8%">Type </th>
				<th class="topmenu" align="center" valign="middle" width="8%">Payment Option </th>
				<th class="topmenu" align="center" valign="middle" width="25%">Project Address</th>
				<th class="topmenu" align="center" valign="middle" width="8%">Suburb</th>
				<th class="topmenu" align="center" valign="middle" width="5%">Block Sqm</th>
				<th class="topmenu" align="center" valign="middle" width="5%">LVC Type</th>
				<th class="topmenu" align="center" valign="middle" width="7%">Fee $</th>
				<th class="topmenu" align="center" valign="middle" width="7%">Crown Lease Document</th>
				<th class="topmenu" align="center" valign="middle" width="7%">LVC Letter</th>
				<th class="topmenu" align="center" valign="middle" width="7%">Market Assessment</th>
				<th class="topmenu" align="center" valign="middle" width="7%">MA To Be Sent</th>
				<th class="topmenu" align="center" valign="middle" width="7%">Emailed Client</th>
				<th class="topmenu" align="center" valign="middle" width="5%">Courier Client</th>
				<th class="topmenu" align="center" valign="middle" width="5%">Hide</th>
				<th class="topmenu" align="center" valign="middle" width="8%">Action</th>
			</tr>
		</thead>
		<tbody>
			{{assign var=countn value= $total}}
			{{foreach from=$list key="key" item="item"}}
			<tr bgcolor="#FFFFFF">
				<td>{{$item.lv_id}}</td>
				<td>
					<form name="recmet2" method="post" action="">
						<select name="{{$TABLE}}[lv_type]" onChange="update_type({{$item.lv_id}}, this.value)">
							<option value="0">Please Select</option>
							{{foreach from=$typedetail key="key2" item="item2"}}
							<option value="{{$item2.lt_id}}" {{if $item2.lt_id eq $item.lv_type}} selected="selected"
								{{/if}}>{{$item2.lt_option}}</option>
							{{/foreach}}
						</select>
					</form>
					<script>
						function update_type(id, value) {
							$.ajax({
								type: "GET",
								url: "{{$BASE_URL}}lvc_ut_report.update_type/lv_id/" + id + "/value/" + value,
								success: function (result) {
								}
							});
						}
					</script>
				</td>
				<td>{{$item.lv_payment_option}}</td>
				<td><a href="{{$item.link}}" target="_blank">{{$item.lv_project_address}}</a></td>
				<td>{{$item.bsn_suburb}}</td>
				<td> {{$item.bs_paqr_sqm}}
				<td>
					<form name="recmet2" method="post" action="">
						<select name="lvc_type[{{$item.lv_id}}]"
							onChange="update_lvc_type({{$item.lv_id}}, this.value)" />
						<option value="0" {{if $item.sp_www eq -1}} selected="selected" {{/if}}>Please Select </option>
						{{foreach from = $lvcdetail key="key3" item="item3"}}
						<option value="{{$item3.lv_id}}" {{if $item3.lv_id eq $item.lv_lvc_type}} selected="selected"
							{{/if}}>{{$item3.lv_option}}</option>
						{{/foreach}}
						</select>
					</form>
					<div id="cond{{$item.sp_id}}">{{$item.po_inv_stage_user}}<br />{{$item.po_inv_stage_date}} </div>
					<script>
						function update_lvc_type(id, value) {
							//var cond = '#cond'+id;
							$.ajax({
								type: "GET",
								url: "{{$BASE_URL}}lvc_ut_report.update_lvc_type/lv_id/" + id + "/value/" + value,
								success: function (result) {
									// $(cond).html(result);
								}
							});
						}
					</script>
				</td>
				<td>{{$item.lv_fee }} </td>
				<td>
					{{if $item.doc_file_name}}
					<a href="/lvc_ut_report.download_content?file_name={{$item.doc_file_name}}&module_name=lvc_ut_report.home"
						target="_blank">
						Download</a>{{/if}}
				</td>
				<td>{{if $item.doc_file_name_707}}
					<a href="/lvc_ut_report.download_content?file_name={{$item.doc_file_name_707}}&module_name=lvc_ut_report.home"
						target="_blank">
						Download</a>{{/if}}
				</td>
				<td>
					{{if $item.lv_ma}}
						<a href="{{ $item.lv_ma }}" target="_blank">Link</a>
					{{/if}}
				</td>
				<td>
					<form name="sent_ma_form" method="post" action="">
						<input type="hidden" name="lv_sent_ma[{{$item.lv_id}}]" value="0" />
						<label class="switch">
							<input class="switch-input" type="checkbox" name="lv_sent_ma[{{$item.lv_id}}]" value="1" onclick="this.form.submit();"
								{{if $item.lv_sent_ma eq 1 }} checked="checked" {{/if}}
							/>
							<span class="switch-label" data-on="Yes" data-off="No"></span>
							<span class="switch-handle"></span> <br />
						</label>
					</form>
					{{ if $item.lv_sent_ma == 1 }}
						<span>User: {{ $item.lv_sent_ma_user }}</span>
						<br>
						<span>Date: {{ $item.lv_sent_ma_date|date_format:'%d-%m-%Y' }}</span>
					{{ /if }}
				</td>
				<td>
					<form name="recmet3" method="post" action="">
						<input type="hidden" name="emailed[{{$item.lv_id}}]" value="0" />
						<label class="switch">
							<input class="switch-input" type="checkbox" name="emailed[{{$item.lv_id}}]" value="1"
								onclick="this.form.submit();" {{if $item.lv_emailed_client eq 1 }} checked="checked"
								{{/if}} />
							<span class="switch-label" data-on="Yes" data-off="No"></span>
							<span class="switch-handle"></span> <br />
						</label>
					</form>
				</td>
				<td>
					<form name="recmet4" method="post" action="">
						<input type="hidden" name="courier[{{$item.lv_id}}]" value="0" />
						<label class="switch">
							<input class="switch-input" type="checkbox" name="courier[{{$item.lv_id}}]" value="1"
								onclick="this.form.submit();" {{if $item.lv_courier_client eq 1 }} checked="checked"
								{{/if}} />
							<span class="switch-label" data-on="Yes" data-off="No"></span>
							<span class="switch-handle"></span> <br />
						</label>
					</form>
				</td>
				<td>
					<form name="recmet4" method="post" action="">
						<input type="hidden" name="hide[{{$item.lv_id}}]" value="0" />
						<label class="switch">
							<input class="switch-input" type="checkbox" name="hide[{{$item.lv_id}}]" value="1"
								onclick="this.form.submit();" {{if $item.lv_hide eq 1 }} checked="checked" {{/if}} />
							<span class="switch-label" data-on="Yes" data-off="No"></span>
							<span class="switch-handle"></span> <br />
						</label>
					</form>
				</td>
				<td> <a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" class="various" title="Edit">
						<img style="height:20px; width:20px;"
							src="{{$BASE_URL}}css/admin/images/edit.png" /></a>&nbsp;&nbsp;
					<a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}"
						onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete">
						<img style="height:20px; width:20px;"
							src="{{$BASE_URL}}css/admin/images/delete.png" /></a>&nbsp;&nbsp
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