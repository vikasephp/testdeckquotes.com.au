<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/default.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/tree/simpletreemenu.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tree/simpletree.css" />
{{include file=$jdata}}
{{include file=$tiny_basic}}
<script>

	!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');

</script>

<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />

<script type="text/javascript">
	function toggleDiv(divId) {
		$("#" + divId).toggle();
	}
</script>

<script type="text/javascript">

	$(document).ready(function () {

		/*

		*   Examples - images

		*/

		$(".various").fancybox({
			'width': '90%',
			'height': '99%',
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


	function show_log_email_content(lid) {
		var viewurl = "{{$BASE_URL}}emaillibrary.show-log-email-content/elog_id/" + lid;

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

<h3 class="page-title">Email Log</h3>

<div style="float:left; width:100%;">


	<form name="mshort" action="" method="post">
		<div style="float:left; margin-left:2%;">
			<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Search:</strong>&nbsp;&nbsp;</span>
			<input type="text" name="{{$TABLE}}[keyword]" value="{{$keyword}}" style="width:400px;" />
			&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="submit" value="Search" name="search" />

			Sort By :
			<input type="submit" value="Id" name="id" />
			<input type="submit" value="Email Code" name="ecode" />
			<input type="submit" value="Date Sent" name="datesent" />
			<input type="submit" value="From" name="from" />
			<input type="submit" value="To" name="to" />
			<input type="submit" value="Project Name" name="forbusiness" />
			<input type="submit" value="Project Docs" name="pdocs" />
			<input type="submit" value="Template Docs" name="tdocs" />
		</div><br />
		<div style="float:left; margin-left:2%; margin-top: 5px;">
			<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Search by Project Name:</strong>&nbsp;&nbsp;</span>
			<input type="text" name="project_name" value="" style="width:400px;" />
			&nbsp;&nbsp;
			<input type="submit" value="Search" name="search" />
			&nbsp;&nbsp;<input type="submit" name="clear" value="Clear Search">
		</div>
	</form>


	<table id="doclist-table" class="nav-back" width="99%">

		<thead>

			<tr>
				<th class="topmenu" align="center" valign="middle" width="3%">ID</th>
				<th class="topmenu" align="center" valign="middle" width="7%">Email Code</th>
				<th class="topmenu" align="center" valign="middle" width="7%">Date Sent </th>
				<th class="topmenu" align="center" valign="middle" width="7%">From </th>
				<th class="topmenu" align="center" valign="middle" width="8%">To </th>
				<th class="topmenu" align="center" valign="middle" width="8%">CC </th>
				<th class="topmenu" align="center" valign="middle" width="18%">Project Name</th>
				<th class="topmenu" align="center" valign="middle" width="18%">Email Subject</th>
				<th class="topmenu" align="center" valign="middle" width="10%">Email Content</th>
				<th class="topmenu" align="center" valign="middle" width="23%">All Attachments</th>
				<th class="topmenu" align="center" valign="middle" width="23%">Template Docs</th>
				<th class="topmenu" align="center" valign="middle" width="23%">Custom Id</th>

				<th class="topmenu" align="center" valign="middle" width="7%">Action</th>
			</tr>

			{{if $list}}

		<tbody>

			<form name="mlist" method="post">

				{{assign var=countn value= $numstartvounter}}

				{{foreach from=$list key="key" item="item"}}

				<tr bgcolor="{{cycle values=" #D3E8D6,WHITE" advance=true}}">

					<td>{{$item.elog_id}}</td>
					<td>{{$item.elog_eml_code}}
					<td>{{$item.elog_date}}</td>
					<td>{{$item.elog_from}}</td>
					<td>
						{{$item.elog_to}}
						{{if $item.elog_to_secondary}}
						<br />
						{{$item.elog_to_secondary}}
						{{/if}}
						{{if $item.elog_to_email3}}
						<br />
						{{$item.elog_to_email3}}
						{{/if}}
						{{if $item.elog_to_email4}}
						<br />
						{{$item.elog_to_email4}}
						{{/if}}
						{{if $item.elog_to_email5}}
						<br />
						{{$item.elog_to_email5}}
						{{/if}}
					</td>
					<td>{{$item.elog_cc}}</td>
					<td>{{$item.elog_business}}</td>
					<td>{{$item.elog_subject|stripslashes}}</td>

					<td>
						<input type="button" name="View Content" value="View Content"
							onclick="javascript:show_log_email_content({{$item.elog_id}});"
							style="width:90px; height:18px; font-size:11px; line-height:17px !important; padding:0px !important" />
					</td>

					<td class="all_attachment">
						{{$item.elog_doc_attached_new}}
						{{$item.elog_temp_attached_new}}
						{{$item.elog_image_new}}
						{{$item.elog_attach1_new}}
						{{$item.elog_attach2_new}}
						{{$item.elog_attach3_new}}
					</td>
					<td>
						{{$item.elog_temp_attached_new}}
					</td>
					<td>
						{{$item.custom_id}}
					</td>

					<td>



						<a href="{{$BASE_URL}}emaillibrary.deletelog/elog_id/{{$item.elog_id}}"
							onclick="javascript:if(!confirm('Are you sure want to delete this email log.')) return false;"
							title="Delete"><img style="height: 20px;; width:20px"
								src="{{$BASE_URL}}css/admin/images/delete.png" /></a>



					</td>

				</tr>

				{{assign var=countn value=$countn+1}}

				{{/foreach}}

		</tbody>


		</form>

		{{/if}}

	</table>

	{{if $last > 1}}

	<table width="90%" border="0" cellpadding="0" cellspacing="0">

		<tr> {{if $list}}

			<td align="center">
				<div class='pagination'> {{if $pagenum == 1}} <span class='disabled'>
						<< previous</span>
							{{else}} <a class="pagination"
									href="{{$BASE_URL}}emaillibrary.email_log_ms/pagenum/{{math equation=" x - y"
									x=$pagenum y=1}}" title="Previous">
									<< previous</a> {{/if}}



										{{if $pagenum != 1}} <span class="paginate"><a class="pagination"
												href="{{$BASE_URL}}emaillibrary.email_log_ms/pagenum/1"
												title="{{$page_num}} Page">1</a></span>
										{{else}}<span class='current'>1</span> {{/if}}{{if $pagenum != 2}} <span
												class="paginate"><a class="pagination"
													href="{{$BASE_URL}}emaillibrary.email_log_ms/pagenum/2"
													title="{{$page_num}} Page">2</a></span>
											{{else}}<span class='current'>2</span> {{/if}}

												{{if $paginateprev.0 > 3}}

												...

												{{/if}}

												{{foreach from=$paginateprev key="page_key" item="page_num"}}

												{{if $page_num == $pagenum OR $page_num <= 2}}

												{{elseif $page_num == $lastone}}



												{{else}} <span class="paginate"><a class="pagination"
															href="{{$BASE_URL}}emaillibrary.email_log_ms/pagenum/{{$page_num}}"
															title="{{$page_num}} Page">{{$page_num}}</a></span> {{/if}}

													{{/foreach}}



													{{foreach from=$paginatenext key="page_key" item="page_num2"}}

													{{if $page_num2 < $last AND $page_num2 != $lastone}}

													{{if $page_num2 == 1}}

													{{elseif $page_num2 == 2}}

													{{else}}

														{{if $page_num2 == $pagenum OR $page_num2 <= 0}} <span
															class='current'> {{$page_num2}}</span>
														{{else}} <a class="pagination"
																href="{{$BASE_URL}}emaillibrary.email_log_ms/pagenum/{{$page_num2}}"
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

																{{if $pagenum == $lastone }} <span
																	class='current'>{{$lastone}}</span>
																{{else}} <a class="pagination"
																		href="{{$BASE_URL}}emaillibrary.email_log_ms/pagenum/{{$lastone}}"
																		title="{{$lastone}} Page">{{$lastone}}</a>
																	{{/if}}

																	{{/if}}

																	{{if $last == 1}}

																	{{elseif $last == 2}}

																	{{else}}

																		{{if $pagenum == $last}} <span
																			class='current'>{{$last}}</span>
																		{{else}} <a class="pagination"
																				href="{{$BASE_URL}}emaillibrary.email_log_ms/pagenum/{{$last}}"
																				title="{{$last}} Page">{{$last}}</a>
																			{{/if}}

																			{{/if}}

																			{{if $pagenum == $last}} <span
																				class='disabled'>next >></span>
																			{{else}} <a class="pagination"
																					href="{{$BASE_URL}}emaillibrary.email_log_ms/pagenum/{{math equation="
																					x + y" x=$pagenum y=1}}"
																					title="Next">next >></a></div>

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