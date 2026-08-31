<script>
	function close_win() {
		$.fancybox.close();
		var conf = confirm('Are you sure want to Reload The Page?');
		if (conf == true) {
			//window.location.href = window.location.href;
			window.location.reload(true);
		}
	}
</script>
<script>
	!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

<script type="text/javascript">
	$(document).ready(function () {
		/*
		*   Examples - images
		*/
		$(".various").fancybox({
			'width': '90%',
			'height': '85%',
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
</script>


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

	.set3 {
		font-size: 10px !important;
		width: 120px !important;
		display: inline-block;
		padding-top: 1px !important;
		padding-bottom: 1px !important;
		padding-left: 1px !important;
		height: 25px !important;
		margin-top: 7px;
	}

	.dtpic {
		width: 65px !important;
		padding-top: 1px !important;
		padding-bottom: 1px !important;
	}

	#fancybox-wrap {
		z-index: 9999999;
	}

	.myselect {
		width: 100px;
		overflow: hidden;
		text-overflow: ellipsis;
	}

	.myselect option {
		white-space: nowrap;
		width: 100% border-bottom: 1px #ccc solid;
		/* This doesn't work. */
	}
	#list-table td a.custom_logview {
		color: #fff;
		padding: 2px 10px;
		display: flex;
		border-radius: 5px;
		align-items: anchor-center;
		justify-content: center;
		width: 70px;
		height: 25px;
		font-family: inherit;
		font-weight: 500;
		text-transform: uppercase;
		text-decoration: auto;
		background: url(/css/default/images/button1_bg.gif) top repeat-x;
	}
	.cgfb_resp_total table {
		border-collapse: collapse;
	}
	.cgfb_resp_total table td {
		border: 1px solid #000;
		padding: 5px;
	}
</style>

<script language="javascript">
	function open_popup(type) {
        let viewurl = '';
        if (type == 'manage_procedure') {
            viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.view_procedure" + "/random/" + Math.random();
        }
        else if (type == 'view_workmanship_defect') {
            viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.view_workmanship_defect" + "/random/" + Math.random();
        }
		else if (type == 'view_customer_action') {
            viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.view_customer_action" + "/random/" + Math.random();
        }
		else if (type == 'view_wl_history_notes') {
            viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.view_wl_history_notes" + "/random/" + Math.random();
        }
		else if (type == 'view_wl_whynotrespexpl_history') {
            viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.view_wl_whynotrespexpl_history" + "/random/" + Math.random();
        }
        
        $(document).ready(function () {
            $.fancybox({
                'width': '90%',
                'height': '99%',
                'autoScale': false,
                'transitionIn': 'elastic',
                'transitionOut': 'elastic',
                'speedIn': 400,
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

	function add_new(url) {

		$(document).ready(function () {

			$.fancybox({

				'width': '90%',
				'height': '85%',
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
				'href': url,
				'scrolling': 'yes'
			});
		});
	}


	function add_task() {
		var viewurl = "{{$BASE_URL}}warranty_log.viewtask" + "/random/" + Math.random();

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


	function add_checklist() {
		var viewurl = "{{$BASE_URL}}warranty_log.view_checklist" + "/random/" + Math.random();

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

	function add_priority() {
		var viewurl = "{{$BASE_URL}}warranty_log.viewpriority" + "/random/" + Math.random();

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


	function proj_management() {
		var viewurl = "{{$BASE_URL}}warranty_log.proj_management" + "/random/" + Math.random();

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
		var viewurl = "{{$BASE_URL}}warranty_log.view_procedure" + "/random/" + Math.random();

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
		var viewurl = "{{$BASE_URL}}warranty_log.view_type" + "/random/" + Math.random();

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

	function add_liability() {
		var viewurl = "{{$BASE_URL}}warranty_log.view_liability" + "/random/" + Math.random();

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



	function edit_tr(wa_id) {
		var viewurl = "{{$BASE_URL}}trade_responsibility.detail" + "/wa_id/" + wa_id;

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

	function trade_report() {
		var viewurl = "{{$BASE_URL}}warranty_log.view_tr" + "/random/" + Math.random();

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
	
	function projects_open_log() {
		var viewurl = "{{$BASE_URL}}warranty_log.view_projects_open_log" + "/random/" + Math.random();

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

	function staff_included() {
		var viewurl = "{{$BASE_URL}}warranty_log.view_staff_included" + "/random/" + Math.random();

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
	function hot_button(bsn_id, bcust_id, wa_id) {


		var viewurl = "{{$BASE_URL}}warranty_log.hot_button" + "/bcust_id/" + bcust_id + "/bsn_id/" + bsn_id + "/wa_id/" + wa_id;

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

	function add_area() {
		var viewurl = "{{$BASE_URL}}warranty_log.view_area" + "/random/" + Math.random();

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

	function add_cgfb() {
		var viewurl = "{{$BASE_URL}}warranty_log.view_cgfb_resp" + "/random/" + Math.random();

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

	function add_why_not() {
		var viewurl = "{{$BASE_URL}}warranty_log.view_why_not" + "/random/" + Math.random();

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

	document.addEventListener('DOMContentLoaded', function () {

		var scheduling = document.getElementById('search_by_scheduling');
		var dateDiv = document.getElementById('specific_schedule_date_div');
		var dateInput = document.getElementById('specific_schedule_date');

		scheduling.addEventListener('change', function () {

			if (this.value === 'Specific Scheduled Date') {
				dateDiv.style.display = 'block';
			} else {
				dateDiv.style.display = 'none';
				dateInput.value = '';
			}

		});

	});
</script>

<table width="100%">
	<tr>
		<td>

			<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">

				<div style="float:left; margin-left:8px;">
					<div class="left-float-content" style="display: inline-block;">
						<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" title="Displays all procedure names and their corresponding links" />
						<input type="button" name="proc_panel" value="Workmanship Defect Type" onclick="javascript:open_popup('view_workmanship_defect');" title="Admin panel for managing warranty defect types"/>
						<!-- <input type="button" name="customer_action" value="List of Customer Action" onclick="javascript:open_popup('view_customer_action');" title="Admin panel for managing customer action"/> -->
						<input type="button" name="proc_panel" value="Trades Report Panel" onclick="javascript:trade_report();" />
						<input type="button" name="proc_open_log" value="Projects with Open Log" onclick="javascript:projects_open_log();" />
						<br />
						<strong> Project : </strong>
						<datalist id='project'>
							{{foreach from=$project_data key="key" item="item"}}
							<option value="{{$item.wa_project}}">
								{{$item.wa_project}}
							</option>
							{{/foreach}}
						</datalist>

						<input type="text" list='project' name="project_name" style="width:300px" placeholder="Enter Address"
							value="{{$search_project}}" />
						<br />

						<strong> Type : </strong>
						<select name="warranty_type">
							<option value="">Select Type </option>
							{{foreach from = $typedetail key="key4" item="item4"}}
							<option value="{{$item4.wt_type_option}}" {{if $item4.wt_type_option eq $item.wa_type}}
								selected="selected" {{/if}}>{{$item4.wt_type_option}}</option>
							{{/foreach}}
						</select>
						<br />
						<strong> Rec. Number : </strong> <input type="text" name="recno" placeholder="Enter Rec.No" value="{{$recno}}" />
						<br />
						<strong> Status : </strong>
						<select name="warranty_status">
							<option value="">Select Status </option>
							<option value="Open" {{if $warranty_status eq "Open" }} selected="selected" {{/if}}>Open
							</option>
							<option value="Closed" {{if $warranty_status eq "Closed" }} selected="selected" {{/if}}>Closed
							</option>
							<option value="Pending" {{if $warranty_status eq "Pending" }} selected="selected" {{/if}}>
								Pending</option>

						</select>
						<br />
						
						<strong> CGFB Responsible : </strong>
						<select name="search_by_cgfb_responsible">
							<option value=""></option>
							<option value="NIL" {{if $cgfb_responsible eq 'NIL'}} selected="selected" {{/if}}>Please Select </option>
							{{foreach from =$cgfbdetail key="key6" item="item6"}}
							<option value="{{$item6.wc_id}}" {{if $cgfb_responsible eq $item6.wc_id}} selected="selected" {{/if}}>{{$item6.wc_cgfb_option}}</option>
							{{/foreach}}
						</select>
						<br />
						
						<strong> Workmanship Defect : </strong>
						<select name="search_by_workmanship_defect">
							<option value=""></option>
							<option value="NIL" {{if $workmanship_defect eq 'NIL'}} selected="selected" {{/if}}>Please Select </option>
							{{foreach from=$workmanshipDefect key="keyWD" item="itemWD"}}
							<option value="{{$itemWD.wlwd_id}}" {{if $workmanship_defect eq $itemWD.wlwd_id}} selected="selected" {{/if}}>{{$itemWD.wlwd_name}}</option>
							{{/foreach}}
						</select>
						<br />
						
						<strong> Supplier Search : </strong>
						<datalist id='alloc_supplier'>
							{{foreach from=$supdetail key="key_supp" item="item_supp"}}
							<option value="{{$item_supp.co_company_name}}">
								{{$item_supp.co_company_name}}
							</option>
							{{/foreach}}
						</datalist>
						<input type="text" list='alloc_supplier' name="alloc_supplier" style="width:200px" placeholder="Select Supplier"
							value="{{$alloc_supplier}}" />
						<br/>
						
						<strong> Scheduling Filter Search : </strong>
						<select name="search_by_scheduling" id="search_by_scheduling">
							<option value="">Please Select </option>
							<option value="Scheduled Today" {{if $search_by_scheduling eq 'Scheduled Today'}} selected="selected" {{/if}}>Scheduled Today</option>
							<option value="Unscheduled Logs" {{if $search_by_scheduling eq 'Unscheduled Logs'}} selected="selected" {{/if}}>Unscheduled Logs</option>
							<option value="Overdue Scheduled Logs" {{if $search_by_scheduling eq 'Overdue Scheduled Logs'}} selected="selected" {{/if}}>Overdue Scheduled Logs</option>
							<option value="Specific Scheduled Date" {{if $search_by_scheduling eq 'Specific Scheduled Date'}} selected="selected" {{/if}}>Specific Scheduled Date</option>
						</select>

						<input type="submit" name="search" value="Search" title="Search for any record or apply filters" />
						<input type="submit" name="clear" value="Clear All Search" title="Clears all search results and applied filters" /> 
						
						<div id="specific_schedule_date_div"
							{{if $search_by_scheduling neq 'Specific Scheduled Date'}}style="display:none;"{{/if}}>
							<br>
							<strong>Select Date:</strong>
							<input type="date" name="specific_schedule_date" id="specific_schedule_date" value="{{$specific_schedule_date}}">
						</div> <br>
					</div>
					&nbsp;&nbsp;
					<div class="cgfb_resp_total" style="display: inline-block;">
						<table style="font-size: 12px;">
							<tbody>
							<tr><td colspan="2" style="font-size: 14px;">CFGB Responsibility</td></tr>
							<tr>
								<td>Please select</td><td>{{$cgfb_resp_please_select}}</td>
							</tr>
							<tr>
								<td>Yes </td><td>{{$cgfb_resp_1_count}}</td>
							</tr>
							<tr>
								<td>Further Investigation</td><td>{{$cgfb_resp_2_count}}</td>
							</tr>
							<tr>
								<td>No</td><td>{{$cgfb_resp_3_count}}</td>
							</tr>
							<tr>
								<td>Total</td><td>{{$total_open_or_pending}}</td>
							</tr>
							</tbody>
						</table>
					</div>
					&nbsp;&nbsp;
					<div class="cgfb_resp_total" style="display: inline-block;">
						<table style="font-size: 12px;">
							<tbody>
							<tr><td colspan="2" style="font-size: 14px;">Workmanship Defect Type</td></tr>
							<tr>
								<td>Please select</td><td>{{$workmanship_please_select}}</td>
							</tr>
							<tr>
								<td>Minor </td><td>{{$workmanship_minor}}</td>
							</tr>
							<tr>
								<td>Major</td><td>{{$workmanship_major}}</td>
							</tr>
							<tr>
								<td>Equipment</td><td>{{$workmanship_equipment}}</td>
							</tr>
							<tr>
								<td>Total</td><td>{{$total_workmanship}}</td>
							</tr>
							</tbody>
						</table>
					</div>
					<br />

					<div style="border:1px solid #F00;  padding:10px; background: #CCC; width:30%; margin-bottom:10px;display: inline-block;">
						<input type="radio" value="1" name="oc" checked="checked" /> Open &nbsp; &nbsp
						<input type="radio" value="2" name="oc" {{if $oc eq 2}} checked="checked" {{/if}}> Closed
						&nbsp; &nbsp
						<input type="submit" name="sevenday" value="7 Day Report" title="Generates a PDF report of open and closed records from the last 7 days" /><br />
					</div>
					&nbsp;&nbsp;
					<input type="button" name="wa_log_notes_history" value="Warranty Log Notes History" onclick="javascript:open_popup('view_wl_history_notes');" title="History of notes added in the warranty log 2.0 for all projects">
					&nbsp;&nbsp;
					<input type="button" name="wl_whynotrespexpl_history" value="Warranty Log Why Not Responsible Explained History" onclick="javascript:open_popup('view_wl_whynotrespexpl_history');" title="History of all Why Not Responsible Explained for all projects">
					<br />
					<input type="submit" name="print" value="Print Merge – All" title="Generates a PDF of all open and closed records. Attachment links are included in the PDF" />
					&nbsp;&nbsp;
					<input type="submit" name="printallimgthumb" value="Print Merge – All - Photos" title="Generates a PDF of all open and closed records. Attachment images are displayed as thumbnails" />
					&nbsp;&nbsp;
					<span style="border:1px solid #0CF; padding:3px;"> Open Logs : {{$tot_open.open}}</span>
					&nbsp;&nbsp;
					<span style="border:1px solid #0CF; padding:3px;">7 Day Logs : {{$tot_seven.seven}}</span>
					&nbsp;&nbsp;
					<span style="border:1px solid #0CF; padding:3px;">90 Day + Logs : {{$tot_ninety.ninety}}</span>
					&nbsp;&nbsp;
					<span style="border:1px solid #0CF; padding:3px;">Pending Logs : {{$tot_pending.pending}}</span>
					&nbsp;&nbsp;
					<span style="border:1px solid #0CF; padding:3px;">Unallocated Logs : {{$tot_unallocated.total_unallocated}}</span>
					&nbsp;&nbsp;
					<span style="border:1px solid #0CF; padding:3px;">Post Walkthrough Logs : {{$post_walkthrough_count}}</span>
					&nbsp;&nbsp;
					<span style="border:1px solid #0CF; padding:3px;">Walkthrough Logs : {{$walkthrough_log_count}}</span>
					<br />
					
					<input type="submit" name="printOP" value="Print Merge – Open and Pending" style="background:#00CC33;" title="Generates a PDF of open and pending records. Attachment links are included in the PDF" />
					&nbsp;&nbsp;
					<input type="submit" name="printOPimgthumb" value="Print Merge – Open and Pending - Photos" style="background:#00CC33;" title="Generates a PDF of open and pending records. Attachment images are displayed as thumbnails" />
					<br />

					{{if $filepath}}
					{{foreach from=$filepath key="keyP" item="itemP"}}

					<strong>Download &nbsp; &nbsp;</strong><a href="{{$itemP}}" target="_blank">{{$itemP}}</a> <br />
					{{/foreach}}
					{{/if}}

				</div>


				<div style="float:right; text-align:right;">

					<input type="submit" name="clear" value="Clear Filter" title="Clears any applied filters or sorting options" />
					<input type="submit" name="filter_unallocated_logs" value="Unallocated Logs" title="Displays logs that are not assigned to any supplier" />
					<input type="submit" name="closedonly" value="Closed Logs Only" title="Displays only closed logs" />
					<input type="button" name="Add New" value="Task List" onclick="javascript:add_task();" />
					<br />

					<input type="submit" name="sortNotesDueDate" value="Sort By Notes due Date" title="Displays records with notes that have a due date" />
					<input type="submit" name="sort_proj" value="Sort By Project" title="Sorts records according to their respective projects" />
					<input type="submit" name="sort_date" value="Sort By Date" title="Displays the most recently added records at the top" />
					<input type="submit" name="openclose" value="Open and Closed Logs" title="Displays all open and closed logs for any project or in general" />
					<input type="button" name="Add New " value="Add New" title="Add a new log entry to the report" onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.detail}}');" />
				</div>
			</form>
		</td>
	</tr>
</table>

<div id="">
	<table id="list-table" class="nav-back" width="100%">
		<thead>
			<tr>
				<th class="topmenu" align="center" valign="middle" width="10%">Rec. No.</th>
				<th class="topmenu" align="center" valign="middle" width="05%">Log View</th>
				<th class="topmenu" align="center" valign="middle" width="10%">Schedule Date</th>
				<th class="topmenu" align="center" valign="middle" width="05%" data-col="total_open">Total Open</th>
				<th class="topmenu" align="center" valign="middle" width="10%">WWW</th>
				<th class="topmenu" align="center" valign="middle" width="10%">Problem</th>
				<th class="topmenu" align="center" valign="middle" width="15%">Project</th>
				<th class="topmenu" align="center" valign="middle" width="10%">Type</th>
				<th class="topmenu" align="center" valign="middle" width="10%">CGFB Responsible</th>
				<th class="topmenu" align="center" valign="middle" width="10%">Days Count</th>
				<th class="topmenu" align="center" valign="middle" width="10%" data-col="signed_warranty_agreement">Signed Warranty Agreement</th>
				<th class="topmenu" align="center" valign="middle" width="20%">Notes</th>
				<th class="topmenu" align="center" valign="middle" width="10%">Action</th>
			</tr>
		</thead>
		<tbody>

			{{foreach from=$list key="key" item="item"}}

			<tr {{if $item.wa_include_supplier eq '' }}bgcolor="#F00" {{elseif $item.wa_include_supplier neq '' and $item.wa_selected eq 1 }} bgcolor="#ababab" {{else}} bgcolor='{{cycle values="#D3E8D6,WHITE" advance=true}}' {{/if}}>
				<td>{{$item.wa_id}}</td>
				<td>
					<a class="custom_logview" href="{{$BASE_URL}}warranty_log2.view_log_detail/wa_id/{{$item.wa_id}}" target="_blank">Log View</a>
					{{if $item.wa_attention_req eq 'Yes'}}
						<img style="height:26px; width:26px; margin: 0 auto;display: block; padding-top: 4px;" src="{{$BASE_URL}}css/admin/images/attention_sign2.png" title="Urgent Attention is Required"/>
					{{/if}}
				</td>
				<td style="background:{{$item.supplier_background_color}};">
					<input type="text" name="dt" class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo452_{{$item.wa_id}}" value="{{$item.wa_schedule_date}}" onchange="update_schedule_date({{$item.wa_id}}, 'wa_schedule_date', this.value);" onblur="update_schedule_date({{$item.wa_id}}, 'wa_schedule_date', this.value);"/>
					<div id="sd_{{$item.wa_id}}">
					{{if $item.wa_schedule_date and $item.wa_schedule_date_by}}
						{{$item.wa_schedule_date_by}}<br/>{{$item.wa_schedule_date_at|date_format:"%d-%m-%Y"}}
					{{/if}}
					</div>
					<script>
					function update_schedule_date(id, column, value) {
						value = encodeURIComponent(value);
						var sd = "#sd_"+id;
						$.ajax({
							type: 'POST',
							url: "{{$BASE_URL}}warranty_log.update_schedule_date/wa_id/" + id + "/column/" + column + "/value/" + value,
							success: function(response) {
								console.log("Date saved:", response);
								$(sd).html(response);
							},
							error: function(xhr) {
								console.error("Error saving date:", xhr.responseText);
							}
						});
					}
					</script>
				</td>
				<td data-col="total_open">{{$item.total_open_logs}}</td>
				<td>
					{{$item.www_link}}
				</td>
				<td style="min-width: 400px; max-width: 400px;">{{$item.wa_problem|stripslashes}}</td>
				<td style="white-space: nowrap;">
					{{$item.project_link}}
				</td>				
				<td>
					<select name="{{$TABLE}}[wa_type]" Onchange="update_type({{$item.wa_id}},this.value)">
						<option value='NA' {{if $item.wa_type eq 'NA' }} selected="selected" {{/if}}>Please Select
						</option>
						{{foreach from = $typedetail key="key4" item="item4"}}
						<option value="{{$item4.wt_type_option}}" {{if $item4.wt_type_option eq $item.wa_type}}
							selected="selected" {{/if}}>{{$item4.wt_type_option}}
						</option>
						{{/foreach}}
					</select>

					<script>

						function update_type(id, value) {

							$.ajax({
								type: "GET",
								url: "{{$BASE_URL}}warranty_log.update_type/wa_id/" + id + "/value/" + value,
								success: function (result) {
								}
							});
						}
					</script>
				</td>				
				<td>
					<select name="{{$TABLE}}[wa_cgfb_resp]" Onchange="update_cgfb({{$item.wa_id}},this.value)">
						<option value="-1" {{if $item.wa_cgfb_resp eq -1}} selected="selected" {{/if}}>Please Select
						</option>
						{{foreach from = $cgfbdetail key="key6" item="item6"}}
						<option value="{{$item6.wc_id}}" {{if $item6.wc_id eq $item.wa_cgfb_resp}} selected="selected"
							{{/if}}>{{$item6.wc_cgfb_option}}
						</option>
						{{/foreach}}
					</select>
					<div id="cond{{$item.wa_id}}">{{$item.wa_cgfb_user}}<br />{{$item.wa_cgfb_date}} </div>
					<script>
						function update_cgfb(id, value) {
							var cond = '#cond' + id;
							$.ajax({
								type: "GET",
								url: "{{$BASE_URL}}warranty_log.update_cgfb/wa_id/" + id + "/value/" + value,
								success: function (result) {
									$(cond).html(result);
								}
							});
						}
					</script>
					<a href="{{$BASE_URL}}warranty_log.cgfb_notes/wa_id/{{$item.wa_id}}" class="various">Notes</a>
				</td>
				<td>{{$item.dayscount}}</td>
				<td data-col="signed_warranty_agreement" style="white-space: nowrap;">{{$item.signed_warranty_agreement}}</td>
				<td style="min-width: 400px; max-width: 400px;" class="notesContent" {{if $item.cell_red eq 1}} style="background:#F00;" {{/if}}>
					<div style="width: 100%; overflow: auto;">
						{{$item.notes_text}}
						<br>
						<a href="{{$BASE_URL}}warranty_log.view_notes/wa_id/{{$item.wa_id}}" class="various">Notes</a>
						{{$item.notes_date}}
					</div>
				</td>

				<td> <a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" class="various" title="Edit">
						<img style="height:20px; width:20px;"
							src="{{$BASE_URL}}css/admin/images/edit.png" /></a>&nbsp;&nbsp;
					<a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}"
						onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;"
						title="Delete">
						<img style="height:20px; width:20px;"
							src="{{$BASE_URL}}css/admin/images/delete.png" /></a>&nbsp;&nbsp
					<a href="{{$BASE_URL}}{{$XFA.replay}}/{{$ID}}/{{$item.$ID}}" class="various" title="Replay">
						<img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/sub.png" /></a>
					<form name="single" method="post" action="">
						<input type="hidden" name="wa_id" value="{{$item.wa_id}}" />

						<input type="submit" name="single_log"
							style="background-image:url({{$BASE_URL}}css/admin/images/print.png); width:20px; height:20px;"
							value=" ">
					</form>
				</td>
			</tr>
			{{/foreach}}
		</tbody>
	</table>

	{{if $notfound}}
	<div style="font-size:18px; color:#F00; padding-top:10px;"><strong>{{$notfound}}</strong></div>{{/if}}

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