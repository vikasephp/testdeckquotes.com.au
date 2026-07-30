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
		var viewurl = "{{$BASE_URL}}site_progress_report.view_procedure" + "/random/" + Math.random();

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


	function add_task() {
		var viewurl = "{{$BASE_URL}}site_progress_report.view_task" + "/random/" + Math.random();

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

	function showContent(bsnID, taskID) {
		var viewurl = "{{$BASE_URL}}{{$BASEFOLDER}}.attachments-and-comments?bsn_id=" + bsnID + '&task_id=' + taskID;
		// console.log(viewurl);
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
	<div style="float:left; text-align:left;">
		<div>
			<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" />
			<input type="button" name="component" value="Edit Task Name" onclick="javascript:add_task();" />
		</div>
		<div>
			<input type="text" name="address" style="width:250px;" placeholder="Search for Address" />
			<select name="sp_task_name">
				<option value="0">Select Task</option>
				{{foreach from=$cdetail key="key2" item="item2"}}
				<option value="{{$item2.tn_id}}">{{$item2.tn_name}}</option>
				{{/foreach}}
			</select>
			<input type="submit" value="Search" name="search" />
			<input type="submit" name="clear" value="Clear Search" />
		</div>
	</div>

	<div style="float:right; margin-right:20px;">
		<input type="button" name="Add New " value="Add New"
			onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.detail}}');" />
	</div>
</form>

<div id="">
	<table id="list-table" class="nav-back" width="100%">
		<thead>
			<tr>
				<th class="topmenu" align="center" valign="middle" width="5%">SrNo</th>
				<th class="topmenu" align="center" valign="middle" width="15%">Project Address</th>
				<th class="topmenu" align="center" valign="middle" width="15%">Task Name</th>
				<th class="topmenu" align="center" valign="middle" width="15%">Attachments and Comments</th>
				<th class="topmenu" align="center" valign="middle" width="15%">Print Merge</th>
				<!-- <th class="topmenu" align="center" valign="middle" width="10%">Action</th> -->
			</tr>
		</thead>
		<tbody>
			{{assign var=countn value= $total}}
			{{foreach from=$list key="key" item="item"}}
			<tr bgcolor="#FFFFFF">
				<td>{{counter}}</td>
				<td><a href="{{$item.link}}" target="_blank">{{$item.sp_project}}</a></td>
				<td>{{ $item.sp_task_name }}</td>
				<td>
					<input type="button" name="Link" value="Link" onclick="javascript:showContent({{$item.sp_bsn_id}}, {{ $item.sp_task_id }});" style="width:75px; height:18px; font-size:11px; line-height:17px !important; padding:0px !important" />
				</td>
				<td>
					TBD
					<form method="POST" style="display: none;">
						<input type="hidden" name="sp_bsn_id" value="{{ $item.sp_bsn_id }}">
						<input type="hidden" name="sp_task_id" value="{{ $item.sp_task_id }}">
						<input type="submit" name="print_merge" value="Merge" style="width:75px; height:18px; font-size:11px; line-height:17px !important; padding:0px !important" />
					</form>
				</td>
				<!-- <td>
					<a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" class="various" title="Edit"><img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png" /></a>
					<a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png" /></a>
				</td> -->
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