<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
{{include file=$jdata}}
{{include file=$tiny_basic}}
<h3 class="page-title">{{$title}}</h3>

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

	#fancybox-wrap {
		z-index: 9999999;
	}
</style>

<script type="text/javascript">
	function add_procedure() {
		var viewurl = "{{$BASE_URL}}timeline_report.view_procedure" + "/random/" + Math.random();

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


<div style="float:left; text-align:left;">
	&nbsp;&nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" />
	<br />
	&nbsp;&nbsp;<input type="button" name="Add New" value="Add New Letter Code"
		onclick="javascript:add_new('{{$BASE_URL}}timeline_report.add_letter_code');" /> &nbsp;
	<input type="button" name="edit_cat" value="Edit Letter Code"
		onclick="javascript:add_new('{{$BASE_URL}}timeline_report.edit_letter_code');" />&nbsp;
	<input type="button" name="view_letter" value="View Letter"
		onclick="javascript:add_new('{{$BASE_URL}}timeline_report.view_letter');" />
</div>

<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
	<div style="float:right;">
		<input type="submit" name="show_open" value="Open" />
		<input type="submit" name="show_close" value="Closed" />
		<input type="button" name="Add New " value="Add New" onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.detail}}');" />
	</div>
</form>


<div id="">
	<table id="list-table" class="nav-back" width="100%">
		<thead>
			<tr>
				<th class="topmenu" align="center" valign="middle" width="3%">Rec. No.</th>
				<th class="topmenu" align="center" valign="middle" width="15%">Project</th>
				<th class="topmenu" align="center" valign="middle" width="10%">Who is requesting</th>
				<th class="topmenu" align="center" valign="middle" width="5%">Letter</th>
				<th class="topmenu" align="center" valign="middle" width="5%">Days Delayed</th>
				<th class="topmenu" align="center" valign="middle" width="6%">Revised Commencement Date</th>
				<th class="topmenu" align="center" valign="middle" width="6%">Revised Completion Date</th>
				<th class="topmenu" align="center" valign="middle" width="9%">Send Pathway</th>
				<th class="topmenu" align="center" valign="middle" width="10%">Letter Uploaded</th>
				<th class="topmenu" align="center" valign="middle" width="8%">When letter emailed</th>
				<th class="topmenu" align="center" valign="middle" width="4%">Notes</th>
				<th class="topmenu" align="center" valign="middle" width="4%">Evidence</th>
				<th class="topmenu" align="center" valign="middle" width="4%">Status</th>
				<th class="topmenu" align="center" valign="middle" width="4%">Save And Sync Days</th>
				<th class="topmenu" align="center" valign="middle" width="5%">Action</th>
			</tr>
		</thead>
		<tbody>

			{{foreach from=$list key="key" item="item"}}

			<tr bgcolor="#FFFFFF">

				<td>{{counter}}</td>
				<td>{{$item.tc_project}}</td>
				<td>{{$item.tc_who_req}}</td>
				<td>{{$item.tc_letter_code}}</td>
				<td>{{$item.tc_days_delay}}</td>
				<td>{{$item.tc_rev_comm_date }}</td>
				<td>{{$item.tc_rev_comp_date}}</td>
				<td>{{$item.tc_send_pathway}}</td>

				<td>
					{{if $item.tc_letter_upload}}
					<div style="text-align:center;">

						<a href="/timeline_report.download_content?file_name={{$item.tc_letter_upload}}&module_name=timeline_report.home"
							target="_blank">Download</a>
					</div>
					{{/if}}

				</td>
				<td>{{$item.tc_letter_email}} {{if $item.tc_letter_email}} <br /> By : {{$item.tc_email_user}}{{/if}}
				</td>
				<td>{{if $item.tc_notes}}
					<a href="{{$BASE_URL}}timeline_report.view_notes/tc_id/{{$item.tc_id}}" class="various">View
						Notes</a>
					{{/if}}
				</td>
				<td>
					{{if $item.tc_evidence}}
					<div style="text-align:center;">
						<!--<a href="https://deckquote.s3.amazonaws.com/files/uploads/{{$item.tc_evidence}}" target="_blank">Download</a>-->
						<a href="/timeline_report.download_content?file_name={{$item.tc_evidence}}&module_name=timeline_report.home"
							target="_blank">Download</a>

					</div>
					{{/if}}

				<td> {{$item.tc_status}}</td>

				<td>
					<form name="recmet3" method="post" action="">
						<input type="hidden" name="sync" value="{{$item.tc_id}}" />
						<label class="switch">
							<input class="switch-input" type="checkbox" name="sync" value="{{$item.tc_id}}"
								onclick="this.form.submit();" {{if $item.tc_sync eq 1 }} checked="checked" {{/if}} />
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