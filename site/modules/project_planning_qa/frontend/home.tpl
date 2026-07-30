<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
{{include file=$jdata}}
{{include file=$tiny_basic}}
<h3 class="page-title">{{$title}}</h3>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<script type="text/javascript">
	function add_procedure() {
		var viewurl = "{{$BASE_URL}}project_planning_qa.view_procedure" + "/random/" + Math.random();
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

	.AttachmentForm .fileToUploadBtn {
		margin-top: 10px;
	}

	.progress-bar {
		display: -ms-flexbox;
		display: flex;
		-ms-flex-direction: column;
		flex-direction: column;
		-ms-flex-pack: center;
		justify-content: center;
		overflow: hidden;
		color: #fff;
		text-align: center;
		white-space: nowrap;
		background-color: #28a745;
		transition: width .6s ease;
		font-size: 16px;
		text-align: center;
	}

	.progress {
		margin-top: 15px;
	}

	.element_status .alert-success {
		color: green;
	}
</style>
<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
	<div style="float:left; text-align:left;">
		&nbsp;<input type="button" name="proc_panel" value="Procedure Panel"
			onclick="javascript:add_procedure();" /><br />
		&nbsp;<strong>Search:</strong>&nbsp;&nbsp;
		<input type="text" name="searchkey" style="width:400px;" placeholder="" />
		&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="submit" value="Search" name="searchaddr" />
		<input type="submit" value="Clear Search" name="clearsearch" />
	</div>
	<div style="float:right;">
		<input type="submit" value="Show Hidden" name="show_hidden" />
		<input type="button" name="Add New " value="Add New" onclick="javascript:add_new('{{$BASE_URL}}project_planning_qa.detail_addnew');" />
		<!-- <br>
		<input type="submit" value="Sync Project QA" name="sync_project_qa" /> -->
	</div>
</form>
<div id="">
	<table id="list-table" class="nav-back" width="100%">
		<thead>
			<tr>
				<th class="topmenu" align="center" valign="middle" width="15%">Project Address</th>
				<th class="topmenu" align="center" valign="middle" width="10%">Customer Name</th>
				<th class="topmenu" align="center" valign="middle" width="20%">Question</th>
				<th class="topmenu" align="center" valign="middle" width="20%">Attachment For Enquries</th>
				<th class="topmenu" align="center" valign="middle" width="20%">Answer</th>
				<th class="topmenu" align="center" valign="middle" width="10%">Attachments For Answers</th>
				<th class="topmenu" align="center" valign="middle" width="6%">Que Date</th>
				<th class="topmenu" align="center" valign="middle" width="6%">Method</th>
				<th class="topmenu" align="center" valign="middle" width="6%">Who and When Answered</th>
				<th class="topmenu" align="center" valign="middle" width="8%">Action</th>
			</tr>
		</thead>
		<tbody>
			{{foreach from=$list key="key" item="item"}}
			<tr bgcolor="#FFFFFF">
				<td>{{$item.bsn_name}}</td>
				<td>{{$item.bcust_fname}} {{$bcust_lname}}</td>
				<td>{{$item.bqa_que}}</td>
				<td>
					{{if $item.bqa_attachment_ques_1}}
					<div style="text-align:center;">
						<a href="/project_planning_qa.download_content?file_name={{$item.bqa_attachment_ques_1}}&module_name=business_qa.home"
							target="_blank">Attachment 1</a>
					</div>
					{{/if}}
					{{if $item.bqa_attachment_ques_2}}
					<div style="text-align:center;">
						<a href="/project_planning_qa.download_content?file_name={{$item.bqa_attachment_ques_2}}&module_name=business_qa.home"
							target="_blank">Attachment 2</a>
					</div>
					{{/if}}
					{{if $item.bqa_attachment_ques_3}}
					<div style="text-align:center;">
						<a href="/project_planning_qa.download_content?file_name={{$item.bqa_attachment_ques_3}}&module_name=business_qa.home"
							target="_blank">Attachment 3</a>
					</div>
					{{/if}}
					{{if $item.bqa_attachment_ques_4}}
					<div style="text-align:center;">
						<a href="/project_planning_qa.download_content?file_name={{$item.bqa_attachment_ques_4}}&module_name=business_qa.home"
							target="_blank">Attachment 4</a>
					</div>
					{{/if}}
					{{if $item.bqa_attachment_ques_5}}
					<div style="text-align:center;">
						<a href="/project_planning_qa.download_content?file_name={{$item.bqa_attachment_ques_5}}&module_name=business_qa.home"
							target="_blank">Attachment 5</a>
					</div>
					{{/if}}
				</td>
				<td>{{$item.bqa_ans}}</td>
				<td>
					{{if $item.bqa_attachment_ans_1}}
					<div style="text-align:center;">
						<a href="/project_planning_qa.download_content?file_name={{$item.bqa_attachment_ans_1}}&module_name=business_qa.home"
							target="_blank">Attachment 1</a>
					</div>
					{{/if}}
					{{if $item.bqa_attachment_ans_2}}
					<div style="text-align:center;">
						<a href="/project_planning_qa.download_content?file_name={{$item.bqa_attachment_ans_2}}&module_name=business_qa.home"
							target="_blank">Attachment 2</a>
					</div>
					{{/if}}
					{{if $item.bqa_attachment_ans_3}}
					<div style="text-align:center;">
						<a href="/project_planning_qa.download_content?file_name={{$item.bqa_attachment_ans_3}}&module_name=business_qa.home"
							target="_blank">Attachment 3</a>
					</div>
					{{/if}}
					{{if $item.bqa_attachment_ans_4}}
					<div style="text-align:center;">
						<a href="/project_planning_qa.download_content?file_name={{$item.bqa_attachment_ans_4}}&module_name=business_qa.home"
							target="_blank">Attachment 4</a>
					</div>
					{{/if}}
					{{if $item.bqa_attachment_ans_5}}
					<div style="text-align:center;">
						<a href="/project_planning_qa.download_content?file_name={{$item.bqa_attachment_ans_5}}&module_name=business_qa.home"
							target="_blank">Attachment 5</a>
					</div>
					{{/if}}
				</td>
				<td>{{$item.bqa_created_date}}</td>
				<td>
					<select name="method" Onchange="update_method({{$item.bqa_id}},this.value)">
						<option value="">Pleaes Select</option>
						<option value="Phone" {{if $item.bqa_method eq "Phone" }} selected="selected" {{/if}}>Phone</option>
						<option value="Email" {{if $item.bqa_method eq 'Email' }} selected="selected" {{/if}}>Email</option>
						<option value="Website" {{if $item.bqa_method eq 'Website' }} selected="selected" {{/if}}>Website
						</option>
					</select>
					<script>
						function update_method(id, value) {
							$.ajax({
								type: "GET",
								url: "{{$BASE_URL}}project_planning_qa.update_method/id/" + id + "/value/" + value,
								success: function (result) {
								}
							});
						}
					</script>
				</td>
				<td>{{$item.answer_user}}<br />{{$item.bqa_ans_date}}</td>
				<td> <a href="{{$BASE_URL}}{{$XFA.detail}}/bqa_id/{{$item.bqa_id}}" class="various" title="Edit">
						<img style="height:20px; width:20px;"
							src="{{$BASE_URL}}css/admin/images/edit.png" /></a>&nbsp;&nbsp;
					<a href="{{$BASE_URL}}{{$XFA.delete}}/bqa_id/{{$item.bqa_id}}"
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
<script>
	$(document).ready(function () {
		$(".manage_staff_member select").change(function () {
			// $(this).parents(".manage_staff_member").attr("style","pointer-events: none;opacity: 0.7;");
			var currentThis = $(this);
			var divId = $(this).find("option:selected").data("div-id");
			var staffMemberId = $(this).find("option:selected").data("id");
			var staffMemberName = $(this).find("option:selected").data("name");
			var bsnId = $(this).find("option:selected").data("bsnid");
			var questionId = $(this).find("option:selected").data("questionid");
			// console.log("questionId :: "+questionId);console.log("bsnId :: "+bsnId);
			var postData = { "action": "manageStaffMember", "divId": divId, "staffMemberId": staffMemberId, "staffMemberName": staffMemberName, "bsnId": bsnId, "questionId": questionId };
			$.ajax({
				type: 'POST',
				url: '/project_planning_qa.ajax_functions',
				data: postData,
				error: function (xhr, textStatus, errorThrown) {
					console.log("ERROR : ", errorThrown);
					console.log("ERROR : ", xhr);
					console.log("ERROR : ", textStatus);
				},
				success: function (resp) {
					// $(this).parents(".manage_staff_member").attr("style","pointer-events: none;opacity: 0.7;");
					$("#" + resp.div_id + " .element_status").html('<span class="alert-success">Record has been updated successfully.</span>');
					console.log("success");
				}
			});
		})
	})
</script>