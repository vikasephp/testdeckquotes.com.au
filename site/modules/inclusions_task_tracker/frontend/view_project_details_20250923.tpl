<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/default.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

<script> !window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

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


	.set2 {
		font-size: 10px !important;
		width: 60px !important;
		display: inline-block;
		padding-top: 1px !important;
		padding-bottom: 1px !important;
		padding-left: 1px !important;
		height: 25px !important;
	}

	.slidecontainer {
		width: 225px;
	}

	.slider {
		-webkit-appearance: none;
		width: 100%;
		height: 5px;
		background: #06F;
		outline: none;
		opacity: 0.7;
		-webkit-transition: .2s;
		transition: opacity .2s;
	}

	.slider:hover {
		opacity: 1;
	}

	.slider::-webkit-slider-thumb {
		-webkit-appearance: none;
		appearance: none;
		width: 5px;
		height: 25px;
		background: #F00;
		cursor: pointer;
	}

	.slider::-moz-range-thumb {
		width: 15px;
		height: 15px;
		background: #F00;
		cursor: pointer;
	}

	#fancybox-wrap {
		z-index: 9999999;
	}

	.tableFixHead {
		overflow-y: auto;
		height: 700px;
	}

	.tableFixHead thead th {
		position: sticky;
		top: 0;
		text-align: left;
	}

	table {
		border-collapse: collapse;
		width: 100%;
	}

	th {
		z-index: 9999;
	}

	#fancybox-wrap {
		z-index: 9999999;
	}
	.set3 {
		font-size: 12px !important;
		width: 50px !important;
		display: inline-block;
		padding: 3px !important;
		font-weight: bold;
		background: #0CF;
		color: #FFF;
	}
</style>
<script>
	function open_url(type, data = '') {
		let viewurl = '';
		if(type == 'view_qa') {
			viewurl = '/inclusions_task_tracker.view_qa/tid/' + data.id + '';
		}
		else if(type == 'update_subtask') {
			viewurl = '/business.subtask/bus_id/' + data.bus_id + '/tsid/5/tid/' + data.tid + '';
		}
		else if(type == 'update_task') {
			viewurl = '/business.taskedit/bus_id/' + data.bus_id + '/taskId/' + data.taskId + '';
			return false;
		}
		else if(type == 'view_result') {
			viewurl = '/inclusions_task_tracker.view_project_details_result' + '';
		}
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

<h3 class="page-title">{{$title}}</h3>

<div id="search_section" style="margin-top: 40px;">
	<form name="mlist" method="post" enctype="multipart/form-data">
		<div style="text-align: left; margin-left: 10px;">
			<label for="filter_keyword">UID or Task Name: </label>
			<input type="text" id="filter_keyword" name="filter_keyword" placeholder="Search By UID or Task Name" style="width: 300px" value="{{$filter_keyword}}">
			<input type="submit" value="Search" name="search_keyword" />
			<input type="submit" value="Clear" name="clear_search" />
			<div style="margin-left: 15px; display: inline-block;">
				<input type="submit" value="Show All" name="show_all" />
			</div>
		</div>
	</form>
</div>
<div style="border:1px solid black;width:auto;height:auto;overflow-y:hidden;overflow-x:scroll;">
	<div class="tableFixHead">
		<table id="doclist-table" class="nav-back" width="100%">
			<thead>
				<tr>
					<th class="topmenu" align="center" valign="middle" data-col="uid">UID</th>
					<th class="topmenu" align="center" valign="middle" data-col="result">Result</th>
					<th class="topmenu" align="center" valign="middle" data-col="status">Status</th>
					<th class="topmenu" align="center" valign="middle" data-col="seq">Seq</th>
					<th class="topmenu" align="center" valign="middle" data-col="sub_tasks">Sub Tasks</th>
					<th class="topmenu" align="center" valign="middle" data-col="position">Position</th>
					<th class="topmenu" align="center" valign="middle" data-col="task_name">Task Name</th>
					<th class="topmenu" align="center" valign="middle" data-col="linked_email">Linked Emails</th>
					<th class="topmenu" align="center" valign="middle" data-col="linked_msteams">Linked MSTEAMS</th>
					<th class="topmenu" align="center" valign="middle" data-col="qa">QA</th>
					<th class="topmenu" align="center" valign="middle" data-col="auto">Auto</th>
					<th class="topmenu" align="center" valign="middle" data-col="edit_task">Edit Task</th>
				</tr>
			</thead>
			<tbody>
				{{foreach from=$final_list key="index" item="row"}}
					<tr style="background: {{cycle values="#D3E8D6,WHITE"}}">
						<td data-col="uid">{{$row.uid}}</td>
						<td data-col="result">
							<input type="button" name="" value="View" onclick="open_url('view_result', {})">
						</td>
						<td data-col="status" style="white-space: nowrap; {{if $row.not_required == 1}}background: RED;{{/if}}">
							<form method="post">
								<input type="hidden" name="bt_id" value="{{$row.bt_id}}">
								<select name="task_status">
									<option value="">Not Completed</option>
									<option value="complete" {{if $row.is_completed == 1}}selected{{/if}}>Completed</option>
									<option value="not_required" {{if $row.not_required == 1}}selected{{/if}}>Not Required</option>
								</select>
								<input type="submit" value="Save" name="save_status" />
								<!-- <input type="submit" value="COMPLETE" name="complete_task" style="background: green;" onclick="return confirm('Are you sure you want to proceed?')" />
								<input type="submit" value="NOT REQUIRED" name="not_required_task" style="background: red;" onclick="return confirm('Are you sure you want to proceed?')" /> -->
							</form>
							{{if $row.not_required == 1}}
							<p style="margin-top: 10px; color: #fff;">
								{{if $row.not_required_at}}<span>{{$row.not_required_at}}</span>{{/if}}
								{{if $row.not_required_by}} | <span>{{$row.not_required_by}}</span>{{/if}}
							</p>
							{{/if}}
							
						</td>
						<td data-col="seq">{{$row.seq}}</td>
						<td data-col="sub_tasks">
							<a href="javascript:void(0);"
								onclick="open_url('update_subtask', {
									bus_id: {{$bsn_id}},
									tid: {{$row.uid}} 
								})"
							><img style="height: 20px; width:20px;" src="/css/admin/images/sub.png" title="Sub Task Edit"></a>
							<span style="margin-left: 10px;">{{$row.completed_subtasks}}/{{$row.total_subtasks}}</span>
						</td>
						<td data-col="position">Inclusion Coordinator</td>
						<td data-col="task_name">{{$row.task_name}}</td>
						<td data-col="linked_email">{{$row.linked_emails}}</td>
						<td data-col="linked_msteams">{{$row.linked_msteams}}</td>
						<td data-col="qa">
							<a href="javascript:void(0);" onclick="open_url('view_qa', { id:{{$row.uid}} })">
								<img style="height: 20px; width:20px;" src="/css/admin/images/qa.png" title="QA">
							</a>
						</td>
						<td data-col="auto">{{$row.auto}}</td>
						<td data-col="edit_task">
							<a href="javascript:void(0);"
								onclick="open_url('update_task', {
									bus_id:{{$bsn_id}},
									taskId: {{$row.bt_id}}
								})"								
							><img style="height: 20px;; width:20px" src="https://www.deckquotes.com.au/css/admin/images/edit.png" title="Task Edit"></a>
						</td>
					</tr>
				{{/foreach}}
			</tbody>
		</table>
	</div>
</div>
