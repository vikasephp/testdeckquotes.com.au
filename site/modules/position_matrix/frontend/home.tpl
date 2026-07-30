<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/default.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/tree/simpletreemenu.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tree/simpletree.css" />
<script>
	!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />

<style>
	#fancybox-wrap {
		z-index: 9999999;
	}

	#fancybox-content {
		z-index: 999999 !important;
	}
</style>

<script type="text/javascript">
	$(document).ready(function () {
		/*
		*   Examples - images
		*/
		$(".various").fancybox({
			'width': '96%',
			'height': '90%',
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

	function add_new() {
		var viewurl = "{{$BASE_URL}}position_matrix.detail" + "/random/" + Math.random();
		$(document).ready(function () {
			$.fancybox({
				'width': '96%',
				'height': '90%',
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
		var viewurl = "{{$BASE_URL}}position_matrix.view_procedure" + "/random/" + Math.random();

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

	function add_explanation() {
		var viewurl = "{{$BASE_URL}}position_matrix.view_explanation" + "/random/" + Math.random();

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

	var getcurrenturl = "{{$BASE_URL}}{{$XFA.home}}?mlbs_id="; // The server-side script

	function handleHttpupdatelist() {
		if (http.readyState == 4) {
			if (http.status == 200) {
				var results = http.responseText;
				if (results != '') {

					window.location.reload();
					closeTop();
				}
			}
		}
	}

	function updatelist(id) {

		var mlbs_last_buyer_feedback = document.getElementById(id + '_mlbs_last_buyer_feedback').value;
		var mlbs_completedby = document.getElementById(id + '_mlbs_completedby').value;
		var mlbs_update_date = document.getElementById(id + '_mlbs_update_date').value;
		var mlbs_notes = document.getElementById(id + '_mlbs_notes').value;
		var businessurl = getcurrenturl + id + '&mlbs_completedby=' + mlbs_completedby + '&mlbs_update_date=' + mlbs_update_date + '&mlbs_last_buyer_feedback=' + mlbs_last_buyer_feedback + '&mlbs_notes=' + mlbs_notes + '&random=' + Math.random();

		http.open("GET", businessurl, true);
		http.onreadystatechange = handleHttpupdatelist;
		http.send(null);
		showTop();
	}

	//////////////////////////////////////////////////
	function getHTTPObject() {
		var xmlhttp;

		if (window.XMLHttpRequest) {
			xmlhttp = new XMLHttpRequest();
		}
		else if (window.ActiveXObject) {
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
			if (!xmlhttp) {
				xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
			}
		}
		return xmlhttp;
	}
	var http = getHTTPObject();
	// We create the HTTP Object

	function close_win() {
		$.fancybox.close();
		window.location.reload();
	}
</script>



<h3 class="page-title">{{$title}}</h3>
<br />

<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
	<div style="float:left;">
		&nbsp;&nbsp;<input type="button" name="proc_panel" value="Procedure Panel"
			onclick="javascript:add_procedure();" />
		<input type="button" name="proc_panel" value="Explanation" onclick="javascript:add_explanation();" />
		{{foreach from=$position_matrix_type key="index" item="pmt"}}
			<input type="submit" name="search_type[{{$pmt.pmt_id}}]" value="View {{$pmt.pmt_name}} Position">
		{{/foreach}}
		<input type="submit" name="reset" value="Reset">
	</div>

	<div style="float:right;">
		<input type="submit" name="openclose" value="Show Only Open Position" />
		<input type="submit" name="all" value="Show All" />
		<input type="button" name="Add New " value="Add New" onclick="javascript:add_new();" />
	</div>
</form>
<div style="float:left; width:100%;">
	<table id="doclist-table" class="nav-back" width="100%">
		<thead>
			<tr>
				<th class="topmenu" align="center" valign="middle">Sr.No.</th>
				<th class="topmenu" align="center" valign="middle" width="10%">Position</th>
				<th class="topmenu" align="center" valign="middle" width="10%">Position Explained</th>
				<th class="topmenu" align="center" valign="middle" width="20%">Award</th>
				<th class="topmenu" align="center" valign="middle" width="5%" data-col="pm_type_id">Type</th>
				<th class="topmenu" align="center" valign="middle" width="5%">Website Link</th>
				<th class="topmenu" align="center" valign="middle" width="4%">Open Position</th>
				<th class="topmenu" align="center" valign="middle" width="5%">Rectuitment Text</th>
				<th colspan="2" class="topmenu" align="center" valign="middle" width="7%">
					Key Result Statement
					<table>
						<tr>
							<th>Master Document</th>
							<th>Public Document</th>
						</tr>
					</table>
				</th>
				<th class="topmenu" align="center" valign="middle" width="7%">Position Agreement </th>
				<th colspan="2" class="topmenu" align="center" valign="middle" width="10%">
					Letter Of Offer
					<table>
						<tr>
							<th>Master Document</th>
							<th>Public Document</th>
						</tr>
					</table>
				</th>
				<th colspan="2" class="topmenu" align="center" valign="middle" width="7%">
					Training Plan
					<table>
						<tr>
							<th>Master Document</th>
							<th>Public Document</th>
						</tr>
					</table>
				</th>
				<th colspan="2" class="topmenu" align="center" valign="middle" width="7%">
					Position Manual
					<table>
						<tr>
							<th>Master Document</th>
							<th>Public Document</th>
						</tr>
					</table>
				</th>
				<th colspan="2" class="topmenu" align="center" valign="middle" width="10%">
					Story of the Business
					<table>
						<tr>
							<th>Master Document</th>
							<th>Public Document</th>
						</tr>
					</table>
				</th>
				<th class="topmenu" align="center" valign="middle" width="10%">
					Custom Document
					<!--<table><tr><th>Master Document</th><th>Public Document</th></tr></table>-->
				</th>
				<th colspan="2" class="topmenu" align="center" valign="middle" width="10%">
					Survey Link
					<table>
						<tr>
							<th>General Availability</th>
							<th>Position Specific</th>
						</tr>
					</table>
				</th>
				<th class="topmenu" align="center" valign="middle" width="7%">Extra Doc</th>
				<th class="topmenu" align="center" valign="middle" width="7%">Links</th>

				<th class="topmenu" align="center" valign="middle" width="5%">Action</th>
			</tr>
		</thead>
		{{if $list}}
		<tbody>
			<form name="mlist" method="post">
				{{assign var=countn value= $numstartvounter}}
				{{foreach from=$list key="key" item="item"}}
				<tr bgcolor="{{cycle values='#D3E8D6,WHITE' advance=true}}">

					<td>{{$countn}}</td>
					<td>{{$item.p_name}}</td>
					<td>
						<a href="{{$BASE_URL}}{{$BASEFOLDER}}.view_position_explained/p_id/{{$item.p_id}}" class="various">View</a>
					</td>
					<td> <a href="{{$item.pm_award}}" target="_blank">{{$item.pm_award}} </a></td>
					<td data-col="pm_type_id">
						<select onchange="updateRecord('{{ $item.$ID }}', 'pm_type_id', this.value)">
							<option value="0">Select Type</option>
							{{foreach from=$position_matrix_type key="index" item="pmt"}}
								<option value="{{$pmt.pmt_id}}" {{if $pmt.pmt_id == $item.pm_type_id}}selected{{/if}}>{{$pmt.pmt_name}}</option>
							{{/foreach}}
						</select>
					</td>
					<!--<td> {{if $item.pm_open_position eq 1 }} Yes {{else}} No {{/if}} </td>-->
					<td><a href="https://recruitments.deckquotes.com.au/pm/{{$item.pm_position}}/position/{{$item.p_name|lower|replace:' ':'-'}}"
							target="_blank">Link</a></td>
					{{if $item.pm_open_position eq 1 }}
					<td style="background:#FF3"> </td>
					{{else}}
						<td> </td> {{/if}}

						{{if $item.pm_recruitment_text_link}}
						<td style="text-align:center;"><a href="{{$item.pm_recruitment_text_link}}"
								target="_blank">Link</a></td>
						{{elseif $item.pm_recruitment_text}}
						<td style="text-align:center;">
							<a
								href="/position_matrix.download_content?file_name={{$item.pm_recruitment_text}}&module_name=position_matrix.home">Download</a>
						</td>

						{{else}}
							<td style="background:#F00; color:#FFF; text-align:center"></td>
							{{/if}}


							{{if $item.pm_key_result_stm_link}}
							<td style="text-align:center;min-width:75px;"><a href="{{$item.pm_key_result_stm_link}}"
									target="_blank">Link</a></td>
							<td {{if !$item.pm_key_result_stm_link_public}}style="background:#F00;min-width: 75px;"
								{{else}}style="text-align:center;min-width: 75px;" {{/if}}>
								{{if $item.pm_key_result_stm_link_public}}<a
									href="{{$item.pm_key_result_stm_link_public}}" target="_blank">Link</a>
								{{else}}&nbsp;{{/if}}
							</td>
							{{elseif $item.pm_key_result_stm}}
							<td style="text-align:center;">
								<!--     <a href ="https://deckquote.s3.amazonaws.com/files/meeting_minutes_doc/{{$item.pm_key_result_stm}}?dummy={{$ran}}" target="_blank">Download </a> -->
								<a
									href="/position_matrix.download_content?file_name={{$item.pm_key_result_stm}}&module_name=position_matrix.home">Download</a>

							</td>
							{{else}}
								<td style="background:#F00; color:#FFF;text-align:center;min-width:75px;"></td>
								<td {{if !$item.pm_key_result_stm_link_public}}style="background:#F00;min-width: 75px;"
									{{else}}style="min-width: 75px;" {{/if}}>
									{{if $item.pm_key_result_stm_link_public}}<a
										href="{{$item.pm_key_result_stm_link_public}}" target="_blank">Link</a>
									{{else}}&nbsp;{{/if}}
								</td>
								{{/if}}

								{{if $item.pm_pos_agreement_link}}
								<td style="text-align:center;"><a href="{{$item.pm_pos_agreement_link}}"
										target="_blank">Link</a></td>
								{{elseif $item.pm_pos_agreement}}
								<td style="text-align:center;">
									<!--<a href ="https://deckquote.s3.amazonaws.com/files/meeting_minutes_doc/{{$item.pm_pos_agreement}}?dummy={{$ran}}" target="_blank">Download </a>-->

									<a
										href="/position_matrix.download_content?file_name={{$item.pm_pos_agreement}}&module_name=position_matrix.home">Download</a>
								</td>
								{{else}}
									<td style="background:#F00; color:#FFF;text-align:center"></td>
									{{/if}}


									{{if $item.pm_letter_of_offer_link}}
									<td style="text-align:center;min-width:75px;" data-col="off-letter-link">
										<a href="{{$item.pm_letter_of_offer_link}}" target="_blank">Link</a>
									</td>
									<td {{if
										!$item.pm_letter_of_offer_link_public}}style="background:#F00;min-width: 75px;"
										{{else}}style="min-width: 75px;" {{/if}}>
										{{if $item.pm_letter_of_offer_link_public}}<a
											href="{{$item.pm_letter_of_offer_link_public}}" target="_blank">Link</a>
										{{else}}&nbsp;{{/if}}
									</td>
									{{elseif $item.pm_letter_of_offer}}
									<td style="text-align:center;">
										<!--<a href ="https://deckquote.s3.amazonaws.com/files/meeting_minutes_doc/{{$item.pm_letter_of_offer}}?dummy={{$ran}}" target="_blank">Download</a>-->
										<a
											href="/position_matrix.download_content?file_name={{$item.pm_letter_of_offer}}&module_name=position_matrix.home">Download</a>
									</td>
									{{else}}
										<td style="background:#F00; color:#FFF;text-align:center;min-width: 75px;"" data-col="
											off-letter-link"></td>
										<td {{if
											!$item.pm_letter_of_offer_link_public}}style="background:#F00;min-width: 75px;"
											{{else}}style="min-width: 75px;" {{/if}}>
											{{if $item.pm_letter_of_offer_link_public}}<a
												href="{{$item.pm_letter_of_offer_link_public}}" target="_blank">Link</a>
											{{else}}&nbsp;{{/if}}
										</td>
										{{/if}}


										{{if $item.pm_training_plan_link}}
										<td style="text-align:center;min-width: 75px;"><a
												href="{{$item.pm_training_plan_link}}" target="_blank">Link</a></td>
										<td {{if
											!$item.pm_training_plan_link_public}}style="background:#F00;min-width: 75px;"
											{{else}}style="min-width: 75px;" {{/if}}>
											{{if $item.pm_training_plan_link_public}}<a
												href="{{$item.pm_training_plan_link_public}}" target="_blank">Link</a>
											{{else}}&nbsp;{{/if}}
										</td>
										{{elseif $item.pm_training_plan}}
										<td style="text-align:center;">
											<!--<a href ="https://deckquote.s3.amazonaws.com/files/meeting_minutes_doc/{{$item.pm_training_plan}}?dummy={{$ran}}" target="_blank">Download</a>-->

											<a
												href="/position_matrix.download_content?file_name={{$item.pm_training_plan}}&module_name=position_matrix.home">Download</a>
										</td>
										{{else}}
											<td style="background:#F00; color:#FFF;text-align:center;min-width: 75px;">
											</td>
											<td {{if
												!$item.pm_training_plan_link_public}}style="background:#F00;min-width: 75px;"
												{{else}}style="min-width: 75px;" {{/if}}>
												{{if $item.pm_training_plan_link_public}}<a
													href="{{$item.pm_training_plan_link_public}}"
													target="_blank">Link</a>
												{{else}}&nbsp;{{/if}}
											</td>
											{{/if}}

											<td style="min-width:75px;text-align:center;">
												{{if $item.pm_position_manual}} <a href="{{$item.pm_position_manual}}"
													target="_blank">Link </a>{{/if}}
											</td>
											<td style="min-width:75px;text-align:center;">
												{{if $item.pm_position_manual_public}} <a
													href="{{$item.pm_position_manual_public}}" target="_blank">Link
												</a>{{/if}}
											</td>

											<td style="min-width: 75px;">{{if $item.pm_story_business_link}} <a
													href="{{$item.pm_story_business_link}}" target="_blank">Link
												</a>{{/if}}</td>
											<td style="min-width: 75px;">{{if $item.pm_story_business_link_public}} <a
													href="{{$item.pm_story_business_link_public}}" target="_blank">Link
												</a>{{/if}}</td>

											<td style="min-width: 75px; text-align:center;">
												<a href="{{$BASE_URL}}{{$XFA.multiple_doc_col}}/{{$ID}}/{{$item.$ID}}"
													class="various" title="Edit">Add</a>
											</td>
											<!--
												<td style="min-width: 75px;">{{if $item.pm_custom_development_link}} <a href="{{$item.pm_custom_development_link}}" target="_blank">Link </a>{{/if}}</td>
												<td style="min-width: 75px;">{{if $item.pm_custom_development_link_public}} <a href="{{$item.pm_custom_development_link_public}}" target="_blank">Link </a>{{/if}}</td>-->

											<td style="min-width: 75px;">{{if $item.pm_survey_link}} <a
													href="{{$item.pm_survey_link}}" target="_blank">Link </a>{{/if}}
											</td>
											<td style="min-width: 75px;">{{if $item.pm_survey_link_public}} <a
													href="{{$item.pm_survey_link_public}}" target="_blank">Link
												</a>{{/if}}</td>


											<td>
												{{if $item.pm_extra_doc1}}

												<a
													href="/position_matrix.download_content?file_name={{$item.pm_extra_doc1}}&module_name=position_matrix.home">Download</a>
												{{/if}}
												{{if $item.pm_extra_doc2}}
												<a
													href="/position_matrix.download_content?file_name={{$item.pm_extra_doc2}}&module_name=position_matrix.home">Download</a>{{/if}}
												{{if $item.pm_extra_doc3}}
												<a
													href="/position_matrix.download_content?file_name={{$item.pm_extra_doc3}}&module_name=position_matrix.home">Download</a>{{/if}}
												{{if $item.pm_extra_doc4}}
												<a
													href="/position_matrix.download_content?file_name={{$item.pm_extra_doc4}}&module_name=position_matrix.home">Download</a>{{/if}}
												{{if $item.pm_extra_doc5}}
												<a
													href="/position_matrix.download_content?file_name={{$item.pm_extra_doc5}}&module_name=position_matrix.home">Download</a>{{/if}}
												{{if $item.pm_extra_doc6}}
												<a
													href="/position_matrix.download_content?file_name={{$item.pm_extra_doc6}}&module_name=position_matrix.home">Download</a>{{/if}}
												{{if $item.pm_extra_doc7}}
												<a
													href="/position_matrix.download_content?file_name={{$item.pm_extra_doc7}}&module_name=position_matrix.home">Download</a>{{/if}}
												{{if $item.pm_extra_doc8}}
												<a
													href="/position_matrix.download_content?file_name={{$item.pm_extra_doc8}}&module_name=position_matrix.home">Download</a>{{/if}}
												{{if $item.pm_extra_doc9}}
												<a
													href="/position_matrix.download_content?file_name={{$item.pm_extra_doc9}}&module_name=position_matrix.home">Download</a>{{/if}}
												{{if $item.pm_extra_doc10}}
												<a
													href="/position_matrix.download_content?file_name={{$item.pm_extra_doc10}}&module_name=position_matrix.home">Download</a>{{/if}}
											</td>


											<td>
												{{if $item.pm_link1}} <a href="{{$item.pm_link1}}"
													target="_blank">Link</a>&nbsp;{{/if}}
												{{if $item.pm_link2}} <a href="{{$item.pm_link2}}"
													target="_blank">Link</a>&nbsp;{{/if}}
												{{if $item.pm_link3}} <a href="{{$item.pm_link3}}"
													target="_blank">Link</a>&nbsp;{{/if}}
												{{if $item.pm_link4}} <a href="{{$item.pm_link4}}"
													target="_blank">Link</a>&nbsp;{{/if}}
												{{if $item.pm_link5}} <a href="{{$item.pm_link5}}"
													target="_blank">Link</a>&nbsp;{{/if}}
												{{if $item.pm_link6}} <a href="{{$item.pm_link6}}"
													target="_blank">Link</a>{{/if}}

											</td>


											<td><a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}"
													class="various" title="Edit"> <img style="height: 20px;; width:20px"
														src="{{$BASE_URL}}css/admin/images/edit.png" /></a>
												<!-- {{if $USER_GROUP == 'Administrators'}} -->
												<a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}"
													onclick="javascript:if(!confirm('Are you sure want to delete this.')) return false;"
													title="Delete"><img style="height: 20px;; width:20px"
														src="{{$BASE_URL}}css/admin/images/delete.png" /></a>
												<!--   {{/if}}-->
											</td>
				</tr>
				{{assign var=countn value=$countn+1}}
				{{/foreach}}
			</form>
		</tbody>
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
															{{if $pagenum == $last}} <span class='disabled'>next
																�</span>
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
	{{/if}}
</div>

<script>
	function updateRecord(primaryID, column, value, updateRecord = false) {
        const formData = {
            primaryID: primaryID,
            column: column,
            value: value,
            action: "updateRecord"
        };
        $.ajax({
            type: "POST",
            url: "{{$BASE_URL}}{{ $BASEFOLDER }}.ajax_handler",
            data: formData,
            dataType: "json",
            encode: true,
            success: function (data) {
                if (data.success == true) {
                    if(updateRecord){
                        $('#' + column + primaryID).text(value);
                    }
                }
                else {
                    alert('Some problem in updating the record');
                }
            }
        })
    }
</script>