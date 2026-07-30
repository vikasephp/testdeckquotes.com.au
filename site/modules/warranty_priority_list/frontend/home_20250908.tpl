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
</style>

<script language="javascript">

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


</script>


<table width="100%">
	<tr>
		<td>

			<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">

				<div style="float:left; margin-left:8px;">
					<input type="button" name="proc_panel" value="Procedure Panel"
						onclick="javascript:add_procedure();" />
					<input type="button" name="priority" value="Project Management"
						onclick="javascript:proj_management();" />
					<input type="button" name="type_options" value="Type Options" onclick="javascript:add_type();" />
					<input type="button" name="proc_panel" value="Trades Report Panel"
						onclick="javascript:trade_report();" />
					<input type="button" name="proc_panel" value="Responsible Position Panel"
						onclick="javascript:staff_included();" />
					<input type="button" name="liability" value="Liability Options"
						onclick="javascript:add_liability();" />
					<input type="button" name="checklist" value="Checklist Admin"
						onclick="javascript:add_checklist();" />
					<input type="button" name="type_options" value="Area Options" onclick="javascript:add_area();" />
					<input type="button" name="cgfb" value="CGFB Responsible Admin" onclick="javascript:add_cgfb();" />
					<input type="button" name="cgfb" value="Why Not Responsible Admin"
						onclick="javascript:add_why_not();" />

					<br />
					<strong> Project : </strong>
					<datalist id='project'>
						{{foreach from=$project_data key="key" item="item"}}
						<option value="{{$item.wa_project}}">
							{{$item.wa_project}}
						</option>
						{{/foreach}}
					</datalist>

					<input type="text" list='project' name="project_name" style="width:300px"
						value="{{$search_project}}" />
					<br />
					<strong> Supplier Search : </strong>
					<datalist id='supplierlist'>
						{{foreach from=$supdetail key="key2" item="item2"}}
						<option value="{{$item2.co_company_name}}">
							{{$item2.co_company_name}}
						</option>
						{{/foreach}}
					</datalist>
					<input type="text" list='supplierlist' name="supp_name" style="width:300px" /> <br />

					<strong> Type : </strong>
					<select name="warranty_type">
						<option value="">Please Select </option>
						{{foreach from = $typedetail key="key4" item="item4"}}
						<option value="{{$item4.wt_type_option}}" {{if $item4.wt_type_option eq $item.wa_type}}
							selected="selected" {{/if}}>{{$item4.wt_type_option}}</option>
						{{/foreach}}
					</select>
					<br />
					<strong> Rec. Number : </strong> <input type="text" name="recno" />
					<br />
					<strong> Status : </strong>
					<select name="warranty_status">
						<option value="">Please Select</option>
						<option value="Open" {{if $warranty_status eq "Open" }} selected="selected" {{/if}}>Open
						</option>
						<option value="Closed" {{if $warranty_status eq "Closed" }} selected="selected" {{/if}}>Closed
						</option>
						<option value="Pending" {{if $warranty_status eq "Pending" }} selected="selected" {{/if}}>
							Pending</option>


					</select>

					<br />

					<strong> Priority : </strong>

					<select name="priority">
						<option value="">Please Select </option>
						{{foreach from = $prdetail key="key7" item="item7"}}
						<option value="{{$item7.pr_id}}" {{if $item7.pr_id eq $search_by_priority}} selected="selected"
							{{/if}}>{{$item7.pr_priority}}</option>
						{{/foreach}}
					</select>

					<br />

					<strong> Responsible Staff : </strong>
					<select name="search_by_rs">
						<option value="">Please Select </option>
						{{foreach from = $rsdetail key="key5" item="item5"}}
						<option value="{{$item5.cs_position}}" {{if $res_staff eq $item5.cs_position}}
							selected="selected" {{/if}}>{{$item5.cs_position}}</option>
						{{/foreach}}
					</select>
					
					<br />
					
					<strong> CGFB Responsible :</strong>
					<select name="search_by_cgfb_responsible">
						<option value="NIL">Please Select </option>
						{{foreach from =$cgfbdetail key="key6" item="item6"}}
						<option value="{{$item6.wc_id}}" {{if $cgfb_responsible eq $item6.wc_id}} selected="selected" {{/if}}>{{$item6.wc_cgfb_option}}</option>
						{{/foreach}}
					</select>

					<input type="submit" name="search" value="Search" />
					<input type="submit" name="clear" value="Clear All Search" /> <br />
					<!--<strong>Enter Rec. Number : </strong> <input type="text" name="recno" /> <input type="submit" name="search_rec" value="Search" /> <br />-->

					<div style="border:1px solid #F00;  padding:10px; background: #CCC; width:30%; margin-bottom:10px;">
						<input type="radio" value="1" name="oc" checked="checked" /> Open &nbsp; &nbsp
						<input type="radio" value="2" name="oc" {{if $oc eq 2}} checked="checked" {{/if}} /> Closed
						&nbsp; &nbsp
						<input type="submit" name="sevenday" value="7 Day Report" /><br />
					</div>
					<input type="submit" name="print" value="Print Merge – All" />
					&nbsp;&nbsp;
					<input type="submit" name="printallimgthumb" value="Print Merge – All - Photos" />
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
					<br />
					<!--<strong> Supplier Search  : </strong> <input type="text" name="supp_name" width="100" /> <input type="submit" name="supplier_o" value = "Search" />-->
					<input type="submit" name="printOP" value="Print Merge – Open and Pending" style="background:#00CC33;" />
					&nbsp;&nbsp;
					<input type="submit" name="printOPimgthumb" value="Print Merge – Open and Pending - Photos" style="background:#00CC33;" />
					<br />

					{{if $filepath}}
					{{foreach from=$filepath key="keyP" item="itemP"}}

					<strong>Download &nbsp; &nbsp;</strong><a href="{{$itemP}}" target="_blank">{{$itemP}}</a> <br />
					{{/foreach}}
					{{/if}}

				</div>


				<div style="float:right; text-align:right;">

					<input type="submit" name="clear" value="Clear Filter" />
					<input type="submit" name="filter_unallocated_logs" value="Unallocated Logs" />
					<input type="submit" name="closedonly" value="Closed Logs Only" />
					<input type="button" name="Add New" value="Task List" onclick="javascript:add_task();" />
					<input type="button" name="priority" value="Edit Priority" onclick="javascript:add_priority();" />
					<br />

					<div style="border:1px solid #F00; display:inline-block; padding:10px; background: #CCC;">
						<strong> Select Priority : </strong>
						<select name="filter_by_priority">
							<option value="">Please Select </option>
							{{foreach from = $prdetail key="key4" item="item4"}}
							<option value="{{$item4.pr_id}}" {{if $item4.pr_id eq $pr}} selected="selected" {{/if}}>
								{{$item4.pr_priority}}</option>
							{{/foreach}}
						</select>
						<input type="submit" name="filter_priority" value="Filter By Priority" />
						<input type="submit" name="print_filter" value="Print Merge For Filter by Priority - Open"
							style="background:#F00;" />
					</div>
					<input type="submit" name="filter_variation" value="Filter by Variation required" />
					<input type="submit" name="sortNotesDueDate" value="Sort By Notes due Date" />
					<input type="submit" name="sort_proj" value="Sort By Project" />
					<input type="submit" name="sort_date" value="Sort By Date" />
					<input type="submit" name="openclose" value="Open and Closed Logs" />
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
				<th class="topmenu" align="center" valign="middle" width="10%">Project</th>
				<th class="topmenu" align="center" valign="middle" width="15%">Contact Info</th>
				<th class="topmenu" align="center" valign="middle" width="5%">Walkthrough Date</th>
				<th class="topmenu" align="center" valign="middle" width="5%">CGFB Responsible</th>
				<th class="topmenu" align="center" valign="middle" width="5%">Why Not Responsible</th>
				<th class="topmenu" align="center" valign="middle" width="5%">Include Trades</th>

				<th class="topmenu" align="center" valign="middle" width="5%">Traffic Light</th>
				<th class="topmenu" align="center" valign="middle" width="5%">Checklist</th>
				<th class="topmenu" align="center" valign="middle" width="5%">Priority</th>
				<th class="topmenu" align="center" valign="middle" width="5%">Type</th>
				<!--<th class="topmenu" align="center" valign="middle" width="5%">Area</th>-->

				<th class="topmenu" align="center" valign="middle" width="5%">Update from Supplier</th>
				<th class="topmenu" align="center" valign="middle" width="5%">Tenanted</th>
				<th class="topmenu" align="center" valign="middle" width="5%">Date</th>
				<th class="topmenu" align="center" valign="middle" width="5%">Days Count</th>
				<th class="topmenu" align="center" valign="middle" width="18%">Problem</th>

				<th class="topmenu" align="center" valign="middle" width="9%">Problem Photo</th>
				<!--<th class="topmenu" align="center" valign="middle" width="18%">Solutions</th> -->
				<th class="topmenu" align="center" valign="middle" width="9%">Video Files</th>
				<th class="topmenu" align="center" valign="middle" width="23%">Notes</th>
				<th class="topmenu" align="center" valign="middle" width="8%">Responsible Position</th>
				<th class="topmenu" align="center" valign="middle" width="4%">Customer Enquiry</th>
				<th class="topmenu" align="center" valign="middle" width="4%">Status</th>
				<th class="topmenu" align="center" valign="middle" width="4%">Variation Required</th>
				<th class="topmenu" align="center" valign="middle" width="4%">Outstanding Invoices</th>
				<th class="topmenu" align="center" valign="middle" width="4%">Project Balance</th>
				<th class="topmenu" align="center" valign="middle" width="4%">Invoices paid</th>
				<th class="topmenu" align="center" valign="middle" width="4%" style="display: none;">Liability Accepted</th>
				<th class="topmenu" align="center" valign="middle" width="4%" style="display: none;">Who's Paying</th>
				<th class="topmenu" align="center" valign="middle" width="4%">Accountability</th>
				<th class="topmenu" align="center" valign="middle" width="9%">Action</th>
			</tr>
		</thead>
		<tbody>

			{{foreach from=$list key="key" item="item"}}

			<tr {{if $item.wa_status eq 'Pending' }} bgcolor="#f7b900" {{elseif $item.wa_include_supplier eq '' }}
				bgcolor="#F00" {{else}} bgcolor="#FFFFFF" {{/if}}>

				<td>{{$item.wa_id}}</td>
				<td>{{$item.wa_project|stripslashes}}</td>
				<td>{{$item.bcust_fname}}&nbsp;{{$item.bcust_lname}}<br />{{$item.bcust_misc_moble}}<br /><br />
					<a href="{{$BASE_URL}}warranty_log.log_history/wa_project/{{$item.wa_project}}" class="various">Log
						History</a>

				</td>
				<td> {{$item.bt_completed_date_254}}
					<!--  <input type="text" name="wa_walkd[{{$item.wa_id}}]"  class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo33_{{$item.wa_id}}" value="{{$item.wa_walkthrough_date}}" onfocus ="update_walkthrough_date({{$item.wa_id}}, this.value);"  /> 
        
					<script>
					
					function update_walkthrough_date(id,value)
					{
						$.ajax({
							type: "GET",
							url: "{{$BASE_URL}}warranty_log.update_walkthrough_date/wa_id/"+id+"/value/"+value,
								success: function(result){
								}
							});
					}
					
					</script>-->
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

				<td>
					<select name="{{$TABLE}}[wa_why_not]" class="myselect"
						Onchange="update_why_not({{$item.wa_id}},this.value)">
						<option value="0" {{if $item.wa_why_not eq 0}} selected="selected" {{/if}}>Please Select
						</option>
						{{foreach from = $whynotdetail key="key7" item="item7"}}
						<option value="{{$item7.ww_id}}" {{if $item7.ww_id eq $item.wa_why_not}} selected="selected"
							{{/if}}>{{$item7.ww_option}}
						</option>
						{{/foreach}}
					</select>
					<div id="why{{$item.wa_id}}">{{$item.wa_why_not_user}}<br />{{$item.wa_why_not_date}} </div>

					<script>

						function update_why_not(id, value) {

							var why = '#why' + id;
							$.ajax({
								type: "GET",
								url: "{{$BASE_URL}}warranty_log.update_why_not/wa_id/" + id + "/value/" + value,
								success: function (result) {
									$(why).html(result);
								}
							});
						}

					</script>

				</td>

				<td {{if $item.wa_selected eq 1}} style="background:#F00;" {{/if}}>
					<form name="recmet2" method="post" action="">
						<input type="hidden" name="car_project" value="{{$item.car_project}}" />
						<input type="hidden" name="car_alert" value="{{$item.car_alert}}" />

						{{$item.wa_include_supplier}} <br /><br />
						<a href="{{$BASE_URL}}warranty_log.include_suppliers/wa_id/{{$item.wa_id}}"
							class="various">Include Trades</a><br /><br />

					</form>
				</td>

				{{ if $item.wa_tl eq 1}}
				<td style="background:#00CC33; color:#FFF" ;>
					<a href="{{$BASE_URL}}warranty_log.colorbox/wa_id/{{$item.wa_id}}" class="various">Color</a>
					<br /><br />{{$item.wa_tl_user}}<br />{{$item.wa_tl_date}}<br />
					<a href="{{$BASE_URL}}warranty_log.reason/wa_id/{{$item.wa_id}}" class="various">Read</a>
				</td>
				{{ elseif  $item.wa_tl eq 2}}
				<td style="background: #ff7f27; color:#FFF" ;>
					<a href="{{$BASE_URL}}warranty_log.colorbox/wa_id/{{$item.wa_id}}" class="various">Color</a>
					<br /><br />{{$item.wa_tl_user}}<br />{{$item.wa_tl_date}}<br />
					<a href="{{$BASE_URL}}warranty_log.reason/wa_id/{{$item.wa_id}}" class="various">Read</a>
				</td>
				{{ elseif  $item.wa_tl eq 3}}
				<td style="background: #F00; color:#FFF" ;>
					<a href="{{$BASE_URL}}warranty_log.colorbox/wa_id/{{$item.wa_id}}" class="various">Color</a>
					<br /><br />{{$item.wa_tl_user}}<br />{{$item.wa_tl_date}}<br />
					<a href="{{$BASE_URL}}warranty_log.reason/wa_id/{{$item.wa_id}}" class="various">Read</a>
				</td>
				{{else }}
					<td>
						<a href="{{$BASE_URL}}warranty_log.colorbox/wa_id/{{$item.wa_id}}" class="various">Color</a>
					</td>
					{{/if}}


					<td style="text-align:center;">
						{{$item.task_name}}<br />
						<a href="{{$BASE_URL}}warranty_log.view_checklist_status/wa_id/{{$item.wa_id}}"
							class="various">{{$item.tot_cd}}/{{$tot_chk}}</a>
					</td>
					<td>
						<select name="{{$TABLE}}[wa_priority]" Onchange="update_priority({{$item.wa_id}},this.value)">
							<option value="-1" {{if $item.wa_priority eq -1}} selected="selected" {{/if}}>Please Select
							</option>
							{{foreach from = $prdetail key="key4" item="item4"}}
							<option value="{{$item4.pr_id}}" {{if $item4.pr_id eq $item.wa_priority}}
								selected="selected" {{/if}}>{{$item4.pr_priority}}</option>
							{{/foreach}}
						</select>

						<script>

							function update_priority(id, value) {

								$.ajax({
									type: "GET",
									url: "{{$BASE_URL}}warranty_log.update_priority/wa_id/" + id + "/value/" + value,
									success: function (result) {
									}
								});
							}
						</script>


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

					<!--<td>

						<select name="{{$TABLE}}[wa_area]" Onchange="update_area({{$item.wa_id}},this.value)">
							<option value="-1" {{if $item.wa_area eq -1}} selected="selected" {{/if}}>Please Select
							</option>
							{{foreach from = $areadetail key="key5" item="item5"}}
							<option value="{{$item5.wa_id}}" {{if $item5.wa_id eq $item.wa_area}} selected="selected"{{/if}}>{{$item5.wa_area_option}}</option>
							{{/foreach}}
						</select>

						<script>

							function update_area(id, value) {

								$.ajax({
									type: "GET",
									url: "{{$BASE_URL}}warranty_log.update_area/wa_id/" + id + "/value/" + value,
									success: function (result) {
									}
								});
							}
						</script>


					</td> -->


					<td> {{if $item.wa_comment || $item.supplier_upadate}}
						<a href="{{$BASE_URL}}warranty_log.view_update/wa_id/{{$item.wa_id}}" class="various">Show</a>
						{{$item.update_date}}
						{{/if}}
					</td>
					<td>{{$item.wa_tenanted}}</td>

					<td>{{$item.wa_date}}<br />{{$item.wa_user}}</td>
					<td>{{$item.dayscount}}</td>
					<td>{{$item.wa_problem|stripslashes}}</td>

					<td>
						{{if $item.wa_image_1}}
						<div style="text-align:center;">
							<!-- Photo 1 :  <a href="https://deckquote.s3.amazonaws.com/files/warranty_log/{{$item.wa_image_1}}" target="_blank">Download</a>-->
							Photo 1 : <a href="/warranty_log.download_content?file_name={{$item.wa_image_1}}&module_name=warranty_log.home
" target="_blank">Download</a>

						</div>
						{{/if}}

						{{if $item.wa_image_2}}
						<div style="text-align:center;">
							<!-- Photo 2 :  <a href="https://deckquote.s3.amazonaws.com/files/warranty_log/{{$item.wa_image_2}}" target="_blank">Download</a>-->
							Photo 2 : <a href="/warranty_log.download_content?file_name={{$item.wa_image_2}}&module_name=warranty_log.home
" target="_blank">Download</a>


						</div>
						{{/if}}

						{{if $item.wa_image_3}}
						<div style="text-align:center;">
							<!--Photo 3 :  <a href="https://deckquote.s3.amazonaws.com/files/warranty_log/{{$item.wa_image_3}}" target="_blank">Download</a>-->
							Photo 3 : <a href="/warranty_log.download_content?file_name={{$item.wa_image_3}}&module_name=warranty_log.home
" target="_blank">Download</a>

						</div>
						{{/if}}

						{{if $item.wa_image_4}}
						<div style="text-align:center;">
							<!--       Photo 4 :  <a href="https://deckquote.s3.amazonaws.com/files/warranty_log/{{$item.wa_image_4}}" target="_blank">Download</a>-->
							Photo 4 : <a href="/warranty_log.download_content?file_name={{$item.wa_image_4}}&module_name=warranty_log.home
" target="_blank">Download</a>

						</div>
						{{/if}}

						{{if $item.wa_image_5}}
						<div style="text-align:center;">
							<!--Photo 5 :  <a href="https://deckquote.s3.amazonaws.com/files/warranty_log/{{$item.wa_image_5}}" target="_blank">Download</a>-->
							Photo 5 : <a href="/warranty_log.download_content?file_name={{$item.wa_image_5}}&module_name=warranty_log.home
" target="_blank">Download</a>
						</div>
						{{/if}}

					</td>

					<!--   <td>{{$item.wa_solutions|stripslashes}}</td>-->

					<td>
						{{if $item.wa_video}}
						<!--  <a href="https://deckquote.s3.amazonaws.com/files/warranty_log/{{$item.wa_video}}" target="_blank">Download</a>-->
						<a href="/warranty_log.download_content?file_name={{$item.wa_video}}&module_name=warranty_log.home
" target="_blank">Download</a>
						{{/if}}
					</td>

					<td {{if $item.cell_red eq 1}} style="background:#F00;" {{/if}}> {{$item.notes_text}}<br />
						<a href="{{$BASE_URL}}warranty_log.view_notes/wa_id/{{$item.wa_id}}" class="various">Notes</a>
						{{$item.notes_date}}
					</td>

					<td>

						{{$item.wa_resp_staff}}
						<a href="{{$BASE_URL}}warranty_log.select_staff/wa_id/{{$item.wa_id}}" class="various">Select
							Staff</a>

					</td>



					<td {{if $item.enquiry_pen eq 1 }} style="background: #FF0 ;" {{/if}}>
						<a href="{{$BASE_URL}}warranty_log.view_enquiry/wa_id/{{$item.wa_id}}"
							class="various">Enquiry</a>
					</td>


					<td>
						{{if $item.wa_status eq 'Pending'}}
						<a href="{{$BASE_URL}}warranty_log.status_approve/wa_id/{{$item.wa_id}}"
							class="various">{{$item.wa_status}}
							{{else}}
								{{$item.wa_status}}
								{{if $item.wa_status eq 'Closed'}}<br />{{$item.wa_status_date}} {{/if}}
								{{/if}}

					</td>

					<td>
						<form name="recmet3" method="post" action="">
							<!--<input type="hidden" name="variation[{{$item.wa_id}}]"  />-->
							<label class="switch">
								<input class="switch-input" type="checkbox" name="variation[{{$item.wa_id}}]"
									onclick="update_variation({{$item.wa_id}},this.checked);" {{if $item.wa_variation eq
									1 }} checked="checked" {{/if}} />
								<span class="switch-label" data-on="Yes" data-off="No"></span>
								<span class="switch-handle"></span> <br />
							</label>
						</form>

						<script>

							function update_variation(id, value) {
								var val = 0;
								if (value == true) { val = 1; }
								if (value == false) { val = 0; }
								$.ajax({
									type: "GET",
									url: "{{$BASE_URL}}warranty_log.update_variation/wa_id/" + id + "/value/" + value,
									success: function (result) {
									}
								});
							}
						</script>
					</td>

					<td style="pointer-events: none;">
						<label class="switch">
							<input class="switch-input" type="checkbox" name="outstanding_invoices[{{$item.wa_id}}]" {{if $item.outstanding_invoices eq 1 }} checked="checked" {{/if}} disabled>
							<span class="switch-label" data-on="Yes" data-off="No"></span>
							<span class="switch-handle"></span> <br>
						</label>
					</td>
					
					<td>{{$item.project_balance}}</td>
					
					<td>
						<form name="recmet3" method="post" action="">
							<!--<input type="hidden" name="invoices_paid[{{$item.wa_id}}]"  />-->
							<label class="switch">
								<input class="switch-input" type="checkbox" name="invoices_paid[{{$item.wa_id}}]"
									onclick="update_invoices_paid({{$item.wa_id}},this.checked);" {{if $item.wa_invoices_paid eq
									1 }} checked="checked" {{/if}} />
								<span class="switch-label" data-on="Yes" data-off="No"></span>
								<span class="switch-handle"></span> <br />
							</label>
						</form>

						<script>

							function update_invoices_paid(id, value) {
								var val = 0;
								if (value == true) { val = 1; }
								if (value == false) { val = 0; }
								$.ajax({
									type: "GET",
									url: "{{$BASE_URL}}warranty_log.update_invoices_paid/wa_id/" + id + "/value/" + value,
									success: function (result) {
									}
								});
							}
						</script>
					</td>
					
					<td style="display: none;">
						<select name="{{$TABLE}}[wa_lia_acc]" Onchange="update_la({{$item.wa_id}},this.value)">
							<option value="-1" {{if $item.wa_type eq -1}} selected="selected" {{/if}}>Please Select
							</option>
							{{foreach from = $liadetail key="key5" item="item5"}}
							<option value="{{$item5.wl_id}}" {{if $item5.wl_id eq $item.wa_lia_acc}} selected="selected"
								{{/if}}>{{$item5.wl_liability_option}}
							</option>
							{{/foreach}}
						</select>


						<script>

							function update_la(id, value) {

								$.ajax({
									type: "GET",
									url: "{{$BASE_URL}}warranty_log.update_la/wa_id/" + id + "/value/" + value,
									success: function (result) {
									}
								});
							}
						</script>
					</td>
					<td style="display: none;">
						{{$item.wa_whos_paying}} <br /><br />
						<a href="{{$BASE_URL}}warranty_log.include_suppliers_whos/wa_id/{{$item.wa_id}}"
							class="various">Include Trades</a><br /><br />
					</td>

					<td><input type="button" name="Alert" value="Hot Button"
							onclick="javascript:hot_button({{$item.bs_business_id}},{{$item.bs_customers_id}},{{$item.wa_id}});"
							style="width:90px; height:20px; font-size:11px; line-height:17px !important; padding:0px !important" />
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