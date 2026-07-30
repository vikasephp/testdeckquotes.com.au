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
		var viewurl = "{{$BASE_URL}}latest_merge_plan.view_procedure" + "/random/" + Math.random();

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

<form name="sort" method="post" action="">
	<div style="float:left; text-align:left;">
		&nbsp;&nbsp;<input type="button" name="proc_panel" value="Procedure Panel"
			onclick="javascript:add_procedure();" /> <br />
		&nbsp;&nbsp;<strong>Search By Project Name :</strong>&nbsp;&nbsp;
		<input type="text" name="{{$TABLE}}[keyword]" value="{{$keyword}}" style="width:300px;"
			placeholder="Enter project name after dash(-)" />
		&nbsp;
		<input type="submit" value="Search" name="searchproj" />
		<input type="submit" value="Clear Search" name="clear" />
	</div>
</form>

<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
	<!-- <div style="float:left;">
    &nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" />
  </div> -->
	<div style="float:right;">
		<input type="button" name="Add New " value="Add New"
			onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.detail}}');" />
	</div>
</form>

<div id="">
	<table id="list-table" class="nav-back" width="100%">
		<thead>
			<tr>
				<th class="topmenu" align="center" valign="middle" width="20%">Project</th>
				<th class="topmenu" align="center" valign="middle" width="7%">Plans </th>
				<th class="topmenu" align="center" valign="middle" width="15%">Status</th>
				<th class="topmenu" align="center" valign="middle" width="7%">Active Checklist</th>
				<th class="topmenu" align="center" valign="middle" width="7%">Checklist Number</th>
				<th class="topmenu" align="center" valign="middle" width="7%">Total Plans</th>
				<th class="topmenu" align="center" valign="middle" width="7%">Link To plan</th>
				<th class="topmenu" align="center" valign="middle" width="7%">Sync With Proposal Checklist</th>
				<th class="topmenu" align="center" valign="middle" width="7%" data-col="blocked_plan">Blocked Plan</th>


				<!--      <th class="topmenu" align="center" valign="middle" width="8%">Action</th>-->
			</tr>
		</thead>
		<tbody>

			{{assign var=countn value= $total}}
			{{foreach from=$list key="key" item="item"}}

			<tr bgcolor="#FFFFFF">


				<td>{{$item.lm_bsn_name}}</td>
				<td><span class="lm_doc_date_uploaded__ff" id="r__id_{{$item.lm_id}}"> {{$item.lm_doc_date_uploaded}}
					</span>

					{{if $item.lm_doc_date_uploaded != "Latest"}}

					<div id="update_elemnt_date_block">
						<button class="update_elemnt_date" data-id="" type="button">Update Date</button>
						<input style="display:none;" onchange="update_date('{{$item.lm_id}}',this)" type="date" />
					</div>
					{{/if}}
				</td>
				<td>{{$item.status}}</td>
				<td>{{$item.act_chk}}</td>
				<td>{{$item.lm_checklist_number}}</td>
				<td>{{$item.tot_plan}}</td>

				<td>
					{{if $item.lm_doc_file_name}}
					<a href="/latest_merge_plan.download_content?file_name={{$item.lm_doc_file_name}}&module_name=latest_merge_plan.home"
						target="_blank">Download</a>
					{{/if}}
				</td>

				<td>
					<form name="syn" method="post" action="" style="float: left;">
						<input type="hidden" name="chkno" value="{{$item.lm_checklist_number}}" />
						<input type="hidden" name="project" value="{{$item.lm_bsn_name}}" />
						<input type="hidden" name="lm_id" value="{{$item.lm_id}}" />
						<input type="submit" name="sync" value="Sync"
							onclick="javascript:if(!confirm('Are you sure want to Synchronize This plan to Proposal Checklist?')) return false;" />
						<br />
						{{$item.lm_sync_date}} <br /> {{$item.lm_sync_user}}
					</form>
					<a style="margin-left: 10px;" href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}"
						onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete">
						<img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png" />
					</a>
				</td>

				<td data-col="blocked_plan">
                    <label class="switch" for="lm_blocked_plan[{{ $item.$ID }}]">
						<input id="lm_blocked_plan[{{ $item.$ID }}]" class="switch-input" {{ if $item.lm_blocked_plan == 1 }}checked{{ /if }} onchange="displayToggle('{{ $item.$ID }}', 'lm_blocked_plan', this)" type="checkbox" />
						<span class="switch-label" data-on="Yes" data-off="No"></span>
						<span class="switch-handle"></span> <br />
					</label>
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

<script>

	function update_date(record_id, t) {
		var currentDate = t.value;
		console.log("record_id ::" + record_id + " currentDate ::" + currentDate);

		var date_c = currentDate;
		var formData = {
			r_ID: record_id,
			date: currentDate,
			action: "update_mergeplan_date"
		};

		$.ajax({
			type: "POST",
			url: "{{$BASE_URL}}latest_merge_plan.ajax_handler",
			data: formData,
			dataType: "json",
			encode: true,
			success: function (data) {
				date_arr = date_c.split("-"); console.log(date_arr);
				var new_date = date_arr[2] + "-" + date_arr[1] + "-" + date_arr[0];
				$("#r__id_" + record_id).text(new_date);
				console.log('you are under success');
			}
		})
	}
	$(".update_elemnt_date").click(function () {
		$(this).next().slideToggle();
	})

	function displayToggle(record_id, c, t) {
        let activeStatus = 0;
        if ($(t).is(":checked")) {
            activeStatus = 1;
        }
        const formData = {
            r_ID: record_id,
            column: c,
            activeStatus: activeStatus,
            action: "displayToggle"
        };
        $.ajax({
            type: "POST",
            url: "{{$BASE_URL}}{{ $BASEFOLDER }}.ajax_handler",
            data: formData,
            dataType: "json",
            encode: true,
            success: function (data) {
                if (data.success == true) {
                    
                    // alert('You have successfully updated the record');
                }
                else {
                    alert('Some problem in updating the record');
                }
            }
        })
    }
</script>