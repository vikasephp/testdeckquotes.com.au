<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

{{include file=$jdata}}
{{include file=$tiny_basic}}
<h3 class="page-title">{{$title}}</h3>
<!-- {{if $record_exist neq ''}}
	<div class="error_msg page-title" style="color: red;">
		{{$record_exist}}
	</div>
{{/if}} -->

<style>
	.set2 {
		font-size: 10px !important;
		width: 60px !important;
		display: inline-block;
		padding-top: 1px !important;
		padding-bottom: 1px !important;
		padding-left: 1px !important;
		height: 25px !important;
		margin-top: 7px;
	}

	.dtpic {
		width: 60px !important;
		padding-top: 1px !important;
		padding-bottom: 1px !important;
	}

	#fancybox-wrap {
		z-index: 9999999;
	}
</style>

<script language="javascript">
	function add_type() {
		var viewurl = "{{$BASE_URL}}30_days_rec_report.viewtype" + "/random/" + Math.random();

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
		var viewurl = "{{$BASE_URL}}30_days_rec_report.view_procedure" + "/random/" + Math.random();

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

	function showreason(td_id) {
		var viewurl = "{{$BASE_URL}}30_days_rec_report.notes" + "/td_id/" + td_id;

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
		<td>

			<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post" enctype="multipart/form-data">
				<div style="float:left;">
					<input type="button" name="proc_panel" value="Procedure Panel"
						onclick="javascript:add_procedure();" />
					<input type="button" name="Add New" value="Add Type Options" onclick="javascript:add_type();" />
					<br />
					<input type="submit" name="sort_date" value="Sort By Days" />
					<input type="submit" name="sort_value" value="Sort By Values" />
					<input type="submit" name="red" value="Filter By Red" /><br />
					<input type="submit" name="green" value="Filter By Green" />
					<input type="submit" name="amber" value="Filter By Amber" />
					<input type="submit" name="clear" value="Clear Filter" /> &nbsp;&nbsp;
					<strong>Total : </strong> <input type="text" readonly="readonly" value="${{$total}}"
						style="width:90px;" />
					<input type="submit" name="last_audited" value="Last Audited" />
					<strong> {{$ladata.la_date}} &nbsp; &nbsp; {{$ladata.la_who}} </strong> |

					&nbsp; &nbsp; <strong>File:</strong><input type="file" name="upload_file" style="width:80px;" />
					<input type="submit" name="upload" value="upload" />
					<strong>
					{{if $updata.td_file_name}}
					
						<a href="/30_days_rec_report.download_content_file?file_name={{$updata.td_file_name}}&module_name=30_days_rec_report.home"
							target="_blank" />Download</a> &nbsp; &nbsp;
                     
						&nbsp; {{$updata.td_user}} &nbsp; &nbsp; {{$updata.td_date}}{{/if}} </strong> 
                    <input type="button" value="Export To XLS" onclick="document.location.href='{{$BASE_URL}}30_days_rec_report.home/export/1'" /> &nbsp;     
                        <br />

					&nbsp;&nbsp; <strong>Search : </strong>
					<input type="text" name="keyword" value="{{$keyword}}" style="width:400px;"
						placeholder="Search for Address" />
					<input type="submit" value="Search" name="search" /> &nbsp;<input type="submit" name="clear_search"
						value="Clear Search" />
				</div>

				<div style="float:right;">
					<input type="submit" name="show_pc_pa" value="Project Commencement & Planning Approvals" />
					<input type="submit" value="Print" name="print" />
					<input type="submit" name="hidden" value="Show Hidden" />
					<input type="button" name="Add New " value="Add New"
						onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.detail}}');" />
				</div>
			</form>
		</td>
	</tr>
</table>

<div id="">
	<table id="list-table" class="nav-back" width="100%">
		<thead>
			<tr>
				<th class="topmenu" align="center" valign="middle" width="3%">Rec. No.</th>
				<th class="topmenu" align="center" valign="middle" width="15%">Project</th>
				<th class="topmenu" align="center" valign="middle" width="10%">Contact Info</th>
				<th class="topmenu" align="center" valign="middle" width="5%">Link</th>
				<th class="topmenu" align="center" valign="middle" width="5%">Value $</th>
				<th class="topmenu" align="center" valign="middle" width="5%">Due Date</th>
				<th class="topmenu" align="center" valign="middle" width="5%">Last Spoken</th>
				<th class="topmenu" align="center" valign="middle" width="5%">Days </th>
				<th class="topmenu" align="center" valign="middle" width="5%">Traffic Light</th>
				<th class="topmenu" align="center" valign="middle" width="8%">Reason</th>
				<th class="topmenu" align="center" valign="middle" width="8%">COU</th>
				<th class="topmenu" align="center" valign="middle" width="8%">Warranty</th>
				<th class="topmenu" align="center" valign="middle" width="8%">DMP</th>
				<th class="topmenu" align="center" valign="middle" width="8%">Weekly Statement</th>
				<th class="topmenu" align="center" valign="middle" width="10%">Invoice Type</th>
				<th class="topmenu" align="center" valign="middle" width="9%">Invoice Number</th>
				<th class="topmenu" align="center" valign="middle" width="8%">Document</th>
				<th class="topmenu" align="center" valign="middle" width="8%">Last Emailed Date</th>
				<th class="topmenu" align="center" valign="middle" width="8%">Last Spoken Date</th>
				<th class="topmenu" align="center" valign="middle" width="8%">Correspondance</th>
				<th class="topmenu" align="center" valign="middle" width="8%">Add to Our claims</th>
				<th class="topmenu" align="center" valign="middle" width="8%">Remove From Report</th>
				<th class="topmenu" align="center" valign="middle" width="9%">Action</th>
			</tr>
		</thead>
		<tbody>

			{{foreach from=$list key="key" item="item"}}

			<tr bgcolor="#FFFFFF">

				<td>{{$item.td_id}}</td>
				<td><a href="{{$item.link}}" target="_blank">{{$item.td_project_name}}</a></td>
				<td>{{$item.customer}}</td>
				<td><a href="{{$item.link}}" target="_blank">Link</a></td>
				<td>{{$item.td_value}}</td>
				<td>{{$item.td_due_date}}</td>
				<td>{{$item.td_last_spoken}}</td>
				<td>{{$item.dayscount}}</td>

				{{ if $item.td_traffic_light eq 1}}
				<td style="background:#00CC33" ;>
					<a href="{{$BASE_URL}}30_days_rec_report.colorbox/td_id/{{$item.td_id}}" class="various">Color</a>
					<br /><br />{{$item.td_tl_user}}<br />{{$item.td_tl_date}}<br />
					<a href="{{$BASE_URL}}30_days_rec_report.reason/td_id/{{$item.td_id}}" class="various">Read</a>
				</td>
				{{ elseif  $item.td_traffic_light eq 2}}
				<td style="background: #ff7f27" ;>
					<a href="{{$BASE_URL}}30_days_rec_report.colorbox/td_id/{{$item.td_id}}" class="various">Color</a>
					<br /><br />{{$item.td_tl_user}}<br />{{$item.td_tl_date}}<br />
					<a href="{{$BASE_URL}}30_days_rec_report.reason/td_id/{{$item.td_id}}" class="various">Read</a>
				</td>
				{{ elseif  $item.td_traffic_light eq 3}}
				<td style="background: #F00" ;>
					<a href="{{$BASE_URL}}30_days_rec_report.colorbox/td_id/{{$item.td_id}}" class="various">Color</a>
					<br /><br />{{$item.td_tl_user}}<br />{{$item.td_tl_date}}<br />
					<a href="{{$BASE_URL}}30_days_rec_report.reason/td_id/{{$item.td_id}}" class="various">Read</a>
				</td>
				{{else }}
					<td>
						<a href="{{$BASE_URL}}30_days_rec_report.colorbox/td_id/{{$item.td_id}}"
							class="various">Color</a>
					</td>
					{{/if}}

					<td><input type="button" name="vr" value="View Reason"
							onclick="javascript:showreason({{$item.td_id}});"
							style="width:90px; height:20px; font-size:11px; line-height:17px !important; padding:0px !important" />
						{{if $item.td_reason}} {{$item.td_reason_date}}{{/if}}
					</td>

					<td>
						{{if $item.checklist173}}
						<a
							href="/30_days_rec_report.download_content_cou?file_name={{$item.checklist173}}&module_name=30_days_rec_report.home">Download</a>
						{{/if}}
					</td>
					<td style="text-align:center;">{{$item.total_log}}</td>

					<td>
						<form name="recmet3" method="post" action="">
							<input type="hidden" name="dmp[{{$item.td_id}}]" value="0" />
							<input type="hidden" name="dmp[bsn_name]" value="{{ $item.td_project_name }}" />
							<label class="switch">
								<input class="switch-input" type="checkbox" name="dmp[{{$item.td_id}}]" value="1"
									onclick="this.form.submit();" {{if $item.td_dmp eq 1 }} checked="checked" {{/if}} />
								<span class="switch-label" data-on="Yes" data-off="No"></span>
								<span class="switch-handle"></span> <br />
							</label>
							{{if $item.td_dmp eq 1}} {{$item.td_dmp_date}} <br />{{$item.td_dmp_user}} {{/if}}
						</form>
					</td>

					<td>
						<form name="recmet3" method="post" action="">
							<input type="hidden" name="ws[{{$item.td_id}}]" value="0" />
							<label class="switch">
								<input class="switch-input" type="checkbox" name="ws[{{$item.td_id}}]" value="1"
									onclick="this.form.submit();" {{if $item.td_weekly_statement eq 1 }}
									checked="checked" {{/if}} />
								<span class="switch-label" data-on="Yes" data-off="No"></span>
								<span class="switch-handle"></span> <br />
							</label>
							{{if $item.td_weekly_statement  eq 1}} {{$item.td_ws_date}} <br />{{$item.td_ws_user}}
							{{/if}}
						</form>

					</td>

					<td>{{$item.td_invoice_type}}</td>
					<td>{{$item.td_invoice_number}}</td>
					<td>{{if $item.td_document}}
						<!-- <a href="https://deckquote.s3.amazonaws.com/files/uploads/{{$item.td_document}}" target="_blank"/>-->
						<a href="/30_days_rec_report.download_content?file_name={{$item.td_document}}&module_name=30_days_rec_report.home"
							target="_blank" />
						Download{{/if}}
					</td>
					<td>
						<input type="text" name="email[{{$item.td_id}}]" class="w16em dateformat-d-ds-m-ds-Y dtpic"
							id="demo33_{{$item.td_id}}" value="{{$item.td_last_email_date}}"
							onfocus="update_email({{$item.td_id}}, this.value);" />

						<script language="javascript">

							function update_email(id, value) {
								$.ajax({
									type: "GET",
									url: "{{$BASE_URL}}30_days_rec_report.update_email/td_id/" + id + "/value/" + value,
									success: function (result) {
									}
								});

							}  
						</script>
					</td>
					<td>

						<input type="text" name="spoken[{{$item.td_id}}]" class="w16em dateformat-d-ds-m-ds-Y dtpic"
							id="demo44_{{$item.td_id}}" value="{{$item.td_last_spoken_date}}"
							onfocus="update_spoken({{$item.td_id}}, this.value);" />

						<script language="javascript">

							function update_spoken(id, value) {
								$.ajax({
									type: "GET",
									url: "{{$BASE_URL}}30_days_rec_report.update_spoken/td_id/" + id + "/value/" + value,
									success: function (result) {
									}
								});

							}    
						</script>

					</td>



					<td>{{if $item.td_correspondance}}
						<!--  <a href="https://deckquote.s3.amazonaws.com/files/uploads/{{$item.td_correspondance}}" target="_blank"/>-->
						<a href="/30_days_rec_report.download_content?file_name={{$item.td_correspondance}}&module_name=30_days_rec_report.home"
							target="_blank" />
						Download{{/if}}
					</td>

					<td>
						<form name="recmet3" method="post" action="">
							<input type="hidden" name="add_to_our_claims[{{$item.td_id}}]" value="0" />
							<label class="switch">
								<input class="switch-input" type="checkbox" name="add_to_our_claims[{{$item.td_id}}]" value="1"
									onclick="this.form.submit();" {{if $item.td_add_to_our_claims eq 1 }} checked="checked"
									{{/if}} />
								<span class="switch-label" data-on="Yes" data-off="No"></span>
								<span class="switch-handle"></span> <br />
							</label>
						</form>
						{{if $item.td_add_to_our_claims eq 1 }}
						{{$item.td_add_to_our_claims_by}}
						<br/>{{$item.td_add_to_our_claims_at|date_format:"%d-%m-%Y"}}
						{{/if}}
					</td>
					
					<td>
						<form name="recmet3" method="post" action="">
							<input type="hidden" name="hide[{{$item.td_id}}]" value="0" />
							<label class="switch">
								<input class="switch-input" type="checkbox" name="hide[{{$item.td_id}}]" value="1"
									onclick="this.form.submit();" {{if $item.td_hide eq 1 }} checked="checked"
									{{/if}} />
								<span class="switch-label" data-on="Yes" data-off="No"></span>
								<span class="switch-handle"></span> <br />
							</label>
						</form>
					</td>

					<td> <a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" class="various" title="Edit">
							<img style="height:20px; width:20px;"
								src="{{$BASE_URL}}css/admin/images/edit.png" /></a>&nbsp;&nbsp;
						<a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}"
							onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;"
							title="Delete">
							<img style="height:20px; width:20px;"
								src="{{$BASE_URL}}css/admin/images/delete.png" /></a>&nbsp;&nbsp

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