<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<script>
	!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
{{if $opr}}
<script type="text/javascript">
	setTimeout('parent.close_win();', 500);
</script>
{{/if}}
<style>
	.send_section {
		display: none;
		width: 500px;
		margin: auto;
		border: 1px solid silver;
		padding: 10px;
		margin-top: 20px;
	}

	.send_section h3 {
		margin-bottom: 10px;
	}
	input[type="time"] {
		padding: 5px 5px;
		font: 1em/1.2em Arial, Helvetica, sans-serif;
		color: #5C5C5C;
		border-top: 1px solid #5C5C5C;
		border-left: 1px solid #5C5C5C;
		border-bottom: 1px solid rgba(0, 0, 0, 0.1);
		border-right: 1px solid rgba(0, 0, 0, 0.1);
		background: #f0f0f0;
		border-radius: 4px;
		-moz-border-radius: 4px;
		-khtml-border-radius: 4px;
		-webkit-border-radius: 4px;
		width: auto;
		margin-bottom: 5px;
	}
</style>
<div align="center" style="min-height: 350px; z-index: 9999999; margin-top: 50px;">
	<form name="detail" method="post" action="" enctype="multipart/form-data">
		<table id="list-table" width="100%">
			<input type="hidden" name="task[{{ $primary_id }}]" value="{{$detail.$primary_id}}" />
			{{if $error}}
				<tr>
					<th colspan="2" style="color:red;">{{$error}}</th>
				</tr>
			{{else $success}}
				<tr>
					<th colspan="2" style="color:green;">{{$success}}</th>
				</tr>
			{{/if}}
			<tr>
				<th>To</th>
				<td>
					<!-- <div class="bsearch_scroll_div">
						<ul style="margin: 0; padding: 0;">
							{{foreach from=$contacts key="index" item="row"}}
								<li>
									<input type="checkbox" name="{{$TABLE}}[to1][]" value="{{$row.cs_id}}">
									{{$row.cs_first_name}} {{$row.cs_surname}} ({{$row.cs_primary_email}})
								</li>
							{{/foreach}}
						</ul>
					</div> -->
					<input type="text" id="send_to" name="to" placeholder="Enter email addresses, separated by commas" style="width:650px;" />
				</td>
			</tr>
			<tr>
				<th>CC</th>
				<td>
					<!-- <div class="bsearch_scroll_div">
						<ul style="margin: 0; padding: 0;">
							{{foreach from=$contacts key="index" item="row"}}
								<li>
									<input type="checkbox" name="{{$TABLE}}[cc1][]" value="{{$row.cs_id}}">
									{{$row.cs_first_name}} {{$row.cs_surname}} ({{$row.cs_primary_email}})
								</li>
							{{/foreach}}
						</ul>
					</div> -->
					<input type="text" id="send_cc" name="cc" placeholder="Enter email addresses, separated by commas" style="width:650px;" />
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<h3 class="page-title">Email Preview</h3>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					{{$email_content}}
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align:center;">
					<input type="submit" name="send_now" value="Send Now" class="vsml" />
					<input type="button" id="send_later_one_time_btn" value="Schedule One-Time Send" class="vsml" />
					<input type="button" id="send_later_recurring_btn" value="Recurring Schedule" class="vsml" />
					<input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
					<div id="send_later_one_time_section" class="send_section">
						<h3>Schedule One-Time Send</h3>
						<div>
							<input type="text" name="send_later_one_time_date" class="w16em dateformat-d-ds-m-ds-Y dtpic" value="">
							<input type="time" name="send_later_one_time_time" value="">
							<input type="submit" name="send_later_one_time" value="Submit" class="vsml" />
						</div>
					</div>
					<div id="send_later_recurring_section" class="send_section">
						<h3>Recurring Schedule</h3>
						<div>
							<select name="send_later_recurring_type" onchange="updateRecurringFields(this.value)">
								<option value="daily">Daily</option>
								<option value="weekly">Weekly</option>
							</select>
							<select name="send_later_recurring_day" style="display: none;">
								<option value="sunday">Sunday</option>
								<option value="monday">Monday</option>
								<option value="tuesday">Tuesday</option>
								<option value="wednesday">Wednesday</option>
								<option value="thursday">Thursday</option>
								<option value="friday">Friday</option>
								<option value="saturday">Saturday</option>
							</select>
							<input type="time" name="send_later_recurring_time" value="">
							<input type="submit" name="send_later_recurring" value="Submit" class="vsml" />
						</div>
					</div>
				</td>
			</tr>
		</table>
	</form>
	<div style="margin-top: 40px;">
		<h3 class="page-title">Send Email List</h3>
		<table id="list-table" class="nav-back" width="100%">
			<thead>
				<tr>
					<th class="topmenu" align="center" valign="middle" width="10%" data-col="id">ID</th>
					<th class="topmenu" align="center" valign="middle" width="05%" data-col="to">To</th>
					<th class="topmenu" align="center" valign="middle" width="05%" data-col="cc">CC</th>
					<th class="topmenu" align="center" valign="middle" width="10%" data-col="email_type">Email Type</th>
					<th class="topmenu" align="center" valign="middle" width="10%" data-col="send_type">Send Type</th>
					<th class="topmenu" align="center" valign="middle" width="10%" data-col="send_date">Send Date/Day/Time</th>
					<th class="topmenu" align="center" valign="middle" width="10%" data-col="action">Action</th>
				</tr>
			</thead>
			<tbody>
				{{if $emails}}
					{{foreach from=$emails key="index" item="row"}}
						<tr>
							<td data-col="id">{{$row.were_id}}</td>
							<td data-col="to">{{$row.were_to}}</td>
							<td data-col="cc">{{$row.were_cc}}</td>
							<td data-col="email_type">{{$row.email_type}}</td>
							<td data-col="send_type">{{$row.send_type}}</td>
							<td data-col="send_date">{{$row.send_date}}</td>
							<td data-col="action">
								<!-- <a href="{{ $BASE_URL }}{{ $BASEFOLDER }}.send_email/were_id/{{$row.were_id}}" class="various" title="Edit"><img style="height:20px; width:20px;" src="{{ $BASE_URL }}css/admin/images/edit.png" alt="" /></a> -->
								<a href="{{$BASE_URL}}{{$BASEFOLDER}}.send_email/delete/{{$row.were_id}}" onclick="javascript:if(!confirm('Are you sure you want to delete the record?')) return false;" title="Delete"><img style="height: 16px;; width:16px" src="{{$BASE_URL}}css/admin/images/deletecross.png" alt="" /></a>
							</td>
						</tr>
					{{/foreach}}
				{{else}}
					<tr>
						<td colspan="7" align="center">No records found</td>
					</tr>
				{{/if}}
			</tbody>
		</table>
	</div>
</div>

<script>
	const send_later_one_time_btn = document.getElementById('send_later_one_time_btn');
	const send_later_recurring_btn = document.getElementById('send_later_recurring_btn');

	const send_later_one_time_section = document.getElementById('send_later_one_time_section');
	const send_later_recurring_section = document.getElementById('send_later_recurring_section');

	send_later_one_time_btn.addEventListener('click', () => {
		send_later_one_time_section.style.display = 'block';
		send_later_recurring_section.style.display = 'none';
	});

	send_later_recurring_btn.addEventListener('click', () => {
		send_later_recurring_section.style.display = 'block';
		send_later_one_time_section.style.display = 'none';
		updateRecurringFields();
	});

	function updateRecurringFields() {
		const select = document.querySelector('select[name="send_later_recurring_type"]');
		const value = select.value;
		const daySelect = document.querySelector('select[name="send_later_recurring_day"]');
		const timeInput = document.querySelector('input[name="send_later_recurring_time"]');

		if (value === 'daily') {
			daySelect.style.display = 'none';
		} else if(value === 'weekly') {
			daySelect.style.display = 'inline-block';
		}
	}

	function closepop() {
		setTimeout('parent.close_win();', 500);
	}
</script>