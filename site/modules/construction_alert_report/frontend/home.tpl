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

	.multiselect {
		width: 280px;
		display: inline-block;
	}

	.selectBox {
		position: relative;

	}

	.selectBox select {
		width: 100%;
		font-weight: bold;
	}

	.overSelect {
		position: absolute;
		left: 0;
		right: 0;
		top: 0;
		bottom: 0;
	}

	#checkboxes {
		display: none;
		border: 1px #dadada solid;
		height: 150px;
		overflow-y: scroll;
	}

	#checkboxes label {
		display: block;
	}

	#checkboxes label:hover {
		background-color: #1e90ff;
	}

	#list-table img {
		width: 100px;
	}
	#list-table td a {
		word-break: break-word;
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
		var viewurl = "{{$BASE_URL}}construction_alert_report.view_procedure" + "/random/" + Math.random();

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

	function view_email_template(id) {
		var viewurl = "{{$BASE_URL}}construction_alert_report.view_email_templates" + "/car_id/" + id;

		$(document).ready(function () {

			$.fancybox({

				'width': '95%',
				'height': '92%',
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
		var viewurl = "{{$BASE_URL}}construction_alert_report.viewpriority" + "/random/" + Math.random();

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

	function supplier_report() {
		var viewurl = "{{$BASE_URL}}construction_alert_report.view_scar" + "/random/" + Math.random();
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

	function customer_included() {
		var viewurl = "{{$BASE_URL}}construction_alert_report.view_cust_included" + "/random/" + Math.random();

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
		var viewurl = "{{$BASE_URL}}construction_alert_report.view_staff_included" + "/random/" + Math.random();

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
		var viewurl = "{{$BASE_URL}}construction_alert_report.view_type" + "/random/" + Math.random();

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


	var expanded = false;

	function showCheckboxes() {
		var checkboxes = document.getElementById("checkboxes");
		if (!expanded) {
			checkboxes.style.display = "block";
			expanded = true;
		} else {
			checkboxes.style.display = "none";
			expanded = false;
		}
	}
</script>

<div style="float:left; margin-left:3px; text-align:left;">
	<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" />
	<input type="button" name="proc_panel" value="Supplier Construction Alert Report" onclick="javascript:supplier_report();" />
	<input type="button" name="type_options" value="Type Options" onclick="javascript:add_type();" />
	<br />
	<input type="button" name="proc_panel" value="Customer Included Alerts" onclick="javascript:customer_included();" />
	<input type="button" name="proc_panel" value="Responsible Staff Panel" onclick="javascript:staff_included();" />
	<form name="filt" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
		Project :
		<datalist id='project'>
			{{foreach from=$projdetail key="key" item="item"}}
			<option value="{{$item.bsn_name}}" {{if $project eq $item.bsn_name}} selected="selected" {{/if}}>
				{{$item.bsn_name}}
			</option>
			{{/foreach}}
		</datalist>
		<input type="text" list='project' name="pf" style="width:300px" />
		<br />


		Suppliers :
		<datalist id='supplierlist'>
			{{foreach from=$supdetail key="key2" item="item2"}}
			<option value="{{$item2.co_company_name}}" {{if $bsnid eq $item2.bsn_id}} selected="selected" {{/if}}>
				{{$item2.co_company_name}}
			</option>
			{{/foreach}}
		</datalist>
		<input type="text" list='supplierlist' name="supplier" style="width:300px"
			value="{{$detail.car_supplier}}" />

		<br />

		Type : <select name="type" style="width:150px;">
			<option value="">Please Select</option>
			{{foreach from=$typedetail key="key6" item="item6"}}
			<option value="{{$item6.cp_type}}">{{$item6.cp_type}}</option>
			{{/foreach}}
		</select>
		<br />
		Urgency : <select name="urgency" style="width:150px;">
			<option value="">Please Select</option>
			{{foreach from=$todetail key="key4" item="item4"}}
			<option value="{{$item4.pr_id}}">{{$item4.pr_priority}}</option>
			{{/foreach}}
		</select>
		<br />
		Responsible Staff : <select name="res_staff" style="width:150px;">
			<option value="" selected="selected">Please Select</option>
			{{foreach from=$who key="key6" item="item6"}}
			<option value="{{$item6.cs_position}}">{{$item6.cs_position}}</option>
			{{/foreach}}
		</select>
		<br />
		Record Number : <input type="text" name="rec_no" style="width:100px" value="{{$detail.car_id}}" />
		<br />
		Status : <select name="car_status" style="width:100px;">
		<option value="" selected="selected">Please Select</option>
		{{foreach from = $statusdata key="key5" item="item5"}}
		<option value="{{$item5.to_option}}" {{if $item5.to_option eq $item.car_status}} selected="selected" {{/if}}>{{$item5.to_option}}</option>
		{{/foreach}}
		</select>
		<br>
		Created By : <input type="text" name="filter_car_created_by" style="width:100px" value="{{$filter_car_created_by}}" />
		<br>
		<!--<input type="submit" name="noContactAssigned" value="Filter By No Contacts Assigned " /> 
		<br>-->
		<input type="submit" name="filter" value="Search" /> &nbsp; &nbsp;&nbsp;&nbsp;
		<input type="submit" name="clear" value="Clear Search" /> &nbsp;&nbsp;&nbsp;&nbsp;
		<input type="submit" name="print" value="Merge Print" /> &nbsp;&nbsp;

		<span style="border:1px solid #0CF; padding:4px;"><strong>Open : {{$openData.tot_open}}</strong></span>&nbsp;&nbsp;
		<span style="border:1px solid #0CF; padding:4px;"><strong>24 Hours : {{$tot_tf.tf}}</strong></span>&nbsp;&nbsp;
		<span style="border:1px solid #0CF; padding:4px;"><strong>7 Days : {{$tot_seven.seven}}</strong></span>&nbsp;&nbsp;
	</form>
	<form name="filt2" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
		<input type="submit" name="noContactAssigned" value="Filter by No Supplier / Contact" /> 
        <input type="submit" name="noDueDate" value="Filter By No Due Date" /> 
       <!-- <input type="submit" name="noRevDueDate" value="Filter By No Revised Due Date" /> -->
        <input type="submit" name="clear" value="Clear Filter" />
	</form>
	<br>
</div>

<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
	<div style="float:right; text-align:right;">
		<input type="button" name="proc_panel" value="Email Templates" onclick="javascript:view_email_template();" />
		<input type="submit" name="hidden" value="Show Closed" />
		<input type="submit" name="open" value="Show Open" />
		<select name="sortby">
			<option value="">Please Select</option>
			<option value="1" {{if $sortby eq 1}} selected="selected" {{/if}}>Record Number</option>
			<option value="2" {{if $sortby eq 2}} selected="selected" {{/if}}>Project</option>
			<option value="3" {{if $sortby eq 3}} selected="selected" {{/if}}>Date</option>
			<option value="4" {{if $sortby eq 4}} selected="selected" {{/if}}>Supplier</option>
			<option value="5" {{if $sortby eq 5}} selected="selected" {{/if}}>Urgency</option>
		</select>
		<input type="submit" name="sort" value="Sort" />
		<input type="button" name="Add New " value="Add New"
			onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.detail}}');" /><br />
		<input type="button" name="priority" value="Edit Priority" onclick="javascript:add_priority();" />
	</div>
</form>

<div id="">
	<table id="list-table" class="nav-back" width="100%">
		<thead>
			<tr>
				<th class="topmenu" align="center" valign="middle" width="3%">Rec. No.</th>
				<th class="topmenu" align="center" valign="middle" width="15%">Project</th>
				<th class="topmenu" align="center" valign="middle" width="9%">Contact Info</th>
				<th class="topmenu" align="center" valign="middle" width="5%">Date</th>
				<th class="topmenu" align="center" valign="middle" width="9%">Alert</th>
				<th class="topmenu" align="center" valign="middle" width="5%">Include Supplier</th>
				<th class="topmenu" align="center" valign="middle" width="7%">Photos</th>
				<th class="topmenu" align="center" valign="middle" width="8%">Type</th>
				<th class="topmenu" align="center" valign="middle" width="8%">Update From Supplier</th>
				<th class="topmenu" align="center" valign="middle" width="8%">Notes</th>
				<th class="topmenu" align="center" valign="middle" width="5%">Urgency</th>
				<th class="topmenu" align="center" valign="middle" width="8%">Due Date</th>
              <!--  <th class="topmenu" align="center" valign="middle" width="8%">Revised Due Date</th>-->
				<th class="topmenu" align="center" valign="middle" width="8%">Include Customer</th>
				<th class="topmenu" align="center" valign="middle" width="8%">All Responsible Staff</th>
				<th class="topmenu" align="center" valign="middle" width="8%">Created By</th>
				<th class="topmenu" align="center" valign="middle" width="4%">Status</th>
				<th class="topmenu" align="center" valign="middle" width="9%">Action</th>
			</tr>
		</thead>
		<tbody>

			{{foreach from=$list key="key" item="item"}}


			<tr {{if $item.car_status eq 'Pending' }} bgcolor="#f7b900" {{else}} bgcolor="#FFFFFF" {{/if}}>

				<td>{{$item.car_id}}</td>
				<td>{{$item.car_project|stripslashes}}</td>
				<td>{{$item.bcust_fname}}&nbsp;{{$item.bcust_lname}}<br />{{$item.bcust_misc_moble}}</td>
				<td>{{$item.car_date}}</td>
				<td>{{$item.car_alert}}</td>
			
                <td {{if $item.no_contact_assigned eq '1' || empty($item.car_include_supplier)}} style="background-color: red;"{{/if}}>

					<form name="recmet2" method="post" action="">
						<input type="hidden" name="car_project" value="{{$item.car_project}}">
						<input type="hidden" name="car_alert" value='{{$item.car_alert}}'>

						{{$item.car_include_supplier}} <br /><br />
						<a href="{{$BASE_URL}}construction_alert_report.include_suppliers/car_id/{{$item.car_id}}/noContactAssigned/{{$item.no_contact_assigned}}"
							class="various kill_others">Include Supplier</a><br><br>
				</td>

				<td>
					{{if $item.car_image1}}
						<div style="text-align:center;">
							{{ if $item.car_image1_newdesign }}
								  <a href="/{{ $BASEFOLDER }}.download_content?file_name={{$item.car_image1}}&module_name={{ $BASEFOLDER }}.home" target="_blank">
                                <!--<img data-src="/{{ $BASEFOLDER }}.download_content?file_name={{$item.car_image1}}&module_name={{ $BASEFOLDER }}.home" class="lazy">-->
                               Photo 1</a>
							{{ else }}
								  <a href="{{$BASE_URL}}files/uploads/{{$item.car_image1}}" target="_blank"><img data-src="{{$BASE_URL}}files/uploads/{{$item.car_image1}}" class="lazy">Photo 1</a>
							{{ /if }}
						</div>
					{{/if}}
					{{if $item.car_image2}}
						<div style="text-align:center;">
							{{ if $item.car_image2_newdesign }}
								  <a href="/{{ $BASEFOLDER }}.download_content?file_name={{$item.car_image2}}&module_name={{ $BASEFOLDER }}.home" target="_blank">
                               <!-- <img data-src="/{{ $BASEFOLDER }}.download_content?file_name={{$item.car_image2}}&module_name={{ $BASEFOLDER }}.home" class="lazy">-->
                               Photo 2 </a>
							{{ else }}
								  <a href="{{$BASE_URL}}files/uploads/{{$item.car_image2}}" target="_blank"><img data-src="{{$BASE_URL}}files/uploads/{{$item.car_image2}}" class="lazy">Photo 2</a>
							{{ /if }}
						</div>
					{{/if}}
					{{if $item.car_image3}}
						<div style="text-align:center;">
							{{ if $item.car_image3_newdesign }}
								  <a href="/{{ $BASEFOLDER }}.download_content?file_name={{$item.car_image3}}&module_name={{ $BASEFOLDER }}.home" target="_blank">
                                <!--<img data-src="/{{ $BASEFOLDER }}.download_content?file_name={{$item.car_image3}}&module_name={{ $BASEFOLDER }}.home" class="lazy">-->
                               Photo 3</a>
							{{ else }}
								 <a href="{{$BASE_URL}}files/uploads/{{$item.car_image3}}" target="_blank"><img data-src="{{$BASE_URL}}files/uploads/{{$item.car_image3}}" class="lazy">Photo 3</a>
							{{ /if }}
						</div>
					{{/if}}
					{{if $item.car_image4}}
						<div style="text-align:center;">
							{{ if $item.car_image4_newdesign }}
								  <a href="/{{ $BASEFOLDER }}.download_content?file_name={{$item.car_image4}}&module_name={{ $BASEFOLDER }}.home" target="_blank">
                               <!-- <img data-src="/{{ $BASEFOLDER }}.download_content?file_name={{$item.car_image4}}&module_name={{ $BASEFOLDER }}.home" class="lazy">-->
                               Photo 4 </a>
							{{ else }}
								 <a href="{{$BASE_URL}}files/uploads/{{$item.car_image4}}" target="_blank"><img data-src="{{$BASE_URL}}files/uploads/{{$item.car_image4}}" class="lazy">Photo 4</a>
							{{ /if }}
						</div>
					{{/if}}
					{{if $item.car_image5}}
						<div style="text-align:center;">
							{{ if $item.car_image5_newdesign }}
								  <a href="/{{ $BASEFOLDER }}.download_content?file_name={{$item.car_image5}}&module_name={{ $BASEFOLDER }}.home" target="_blank">
                               <!-- <img data-src="/{{ $BASEFOLDER }}.download_content?file_name={{$item.car_image5}}&module_name={{ $BASEFOLDER }}.home" class="lazy">-->
                              Photo 5</a>
							{{ else }}
								 <a href="{{$BASE_URL}}files/uploads/{{$item.car_image5}}" target="_blank"><img data-src="{{$BASE_URL}}files/uploads/{{$item.car_image5}}" class="lazy">Photo 5</a>
							{{ /if }}
						</div>
					{{/if}}
				</td>
				<td>
					<select name="type" style="width:150px;" Onchange="update_type({{$item.car_id}},this.value)">
						<option value="">Please Select</option>
						{{foreach from=$typedetail key="key6" item="item6"}}
						<option value="{{$item6.cp_type}}" {{if $item.car_type eq $item6.cp_type}} selected="selected"
							{{/if}}>{{$item6.cp_type}}</option>
						{{/foreach}}
					</select>

					<script language="javascript">

						function update_type(id, value) {

							$.ajax({
								type: "GET",
								url: "{{$BASE_URL}}construction_alert_report.update_type/car_id/" + id + "/value/" + value,
								success: function (result) {
								}
							});

						}

					</script>

				</td>


				<td>{{if $item.car_comment || $item.supplier_upadate}}
					<a href="{{$BASE_URL}}construction_alert_report.view_update/car_id/{{$item.car_id}}" class="various">Show</a>
					{{/if}}
				</td>

				<td>
					<a href="{{$BASE_URL}}construction_alert_report.view_notes/car_id/{{$item.car_id}}" class="various">Notes</a>
					{{$item.notes_date}}
				</td>

				<td>
					<select name="{{$TABLE}}[car_urgency]" Onchange="update_urgency({{$item.car_id}},this.value)">
						<option value="150" {{if $detail.car_urgency=='' }}selected{{/if}}>Please Select</option>
						{{foreach from=$todetail key="key3" item="item3"}}
							<option value="{{$item3.pr_id}}" {{if $item.car_urgency == $item3.pr_id}}selected{{/if}}>{{$item3.pr_priority}}</option>
						{{/foreach}}
					</select>
					<script language="javascript">
						function update_urgency(id, value) {
							$.ajax({
								type: "GET",
								url: "{{$BASE_URL}}construction_alert_report.update_urgency/car_id/" + id + "/value/" + value,
								success: function (result) {
								}
							});
						}
					</script>
				</td>
				<td {{if $item.car_new_date != '' && $item.car_new_date|strtotime < "now"|strtotime}} bgcolor="#ff0000" {{/if}}>
					<input type="text" name="car_new_date[{{$item.car_id}}]" class="w16em dateformat-d-ds-m-ds-Y" id="demo_{{$item.car_id}}" value="{{$item.car_new_date}}" onblur="update_two({{$item.car_id}}, this.value);" onchange="update_two({{$item.car_id}}, this.value);" style="width:70px;">
					<div id="duedate_{{$item.car_id}}">
						{{if $item.car_new_date}}
						{{$item.car_new_date_updated_by}}<br/>{{$item.car_new_date_updated_at|date_format:"%d-%m-%Y"}}
						{{/if}}
					</div>
                    
                    <a href="{{$BASE_URL}}construction_alert_report.view_history/car_id/{{$item.car_id}}" class="various">View History</a>
                    
					<script>
						function update_two(id, value) {
							var duedate = "#duedate_"+id;
							$.ajax({
								type: "GET",
								url: "{{$BASE_URL}}construction_alert_report.update_due_date/car_id/" + id + "/value/" + value,
								success: function (result) {
									$(duedate).html(result);
								}
							});
						}
					</script>
                    
				</td>
                
                
                
              <!--  <td {{if $item.car_revised_new_date != '' && $item.car_revised_new_date|strtotime < "now"|strtotime}} bgcolor="#ff0000" {{/if}}> m
					<input type="text" name="car_revised_new_date[{{$item.car_id}}]" class="w16em dateformat-d-ds-m-ds-Y" id="demo2_{{$item.car_id}}" value="{{$item.car_revised_new_date}}" onblur="update_rev_date({{$item.car_id}}, this.value);" onchange="update_rev_date({{$item.car_id}}, this.value);" style="width:70px;">
					<div id="revduedate_{{$item.car_id}}">
						{{if $item.car_revised_new_date}}
						{{$item.car_revised_new_date_updated_by}}<br/>{{$item.car_revised_new_date_updated_at|date_format:"%d-%m-%Y"}}
						{{/if}}
					</div>
					<script>
						function update_rev_date(id, value) {
							var revduedate = "#revduedate_"+id;
							$.ajax({
								type: "GET",
								url: "{{$BASE_URL}}construction_alert_report.update_revised_due_date/car_id/" + id + "/value/" + value,
								success: function (result) {
									$(revduedate).html(result);
								}
							});
						}
					</script>
				</td>-->
                
                
				<td>
					<form name="recmet3" method="post" action="">
						<input type="hidden" name="include[{{$item.car_id}}]" value="No" />
						<label class="switch">
							<input class="switch-input" type="checkbox" name="include[{{$item.car_id}}]" value="Yes"
								onclick="this.form.submit();" {{if $item.car_include_cust eq 'Yes' }} checked="checked"
								{{/if}}>
							<span class="switch-label" data-on="Yes" data-off="No"></span>
							<span class="switch-handle"></span> <br />
						</label>
					</form>
				</td>
				<td>
					{{$item.car_resp_staff}}
					<a href="{{$BASE_URL}}construction_alert_report.select_staff/car_id/{{$item.car_id}}"
						class="various">Select Staff</a>

				</td>
				<td> {{$item.car_created_by}}</td>
                
		<td {{if $item.car_status eq 'Closed'}} style="background:#3C3" {{elseif $item.car_status eq 'Pending' }} style="background:#F93" {{else}} style="background:#F00" {{/if}} >
					{{if $item.car_status eq 'Pending'}}
						<a href="{{$BASE_URL}}construction_alert_report.status_approve/car_id/{{$item.car_id}}"
						class="various">Approve</a><br /><br />
				
					{{/if}}
                   
                    
                    <select name="type" style="width:150px;" Onchange="update_status({{$item.car_id}},this.value)">
											
						<option value="Open"    {{if $item.car_status eq 'Open'}} selected="selected" {{/if}}>Open</option>
                        <option value="Closed"  {{if $item.car_status eq 'Closed'}} selected="selected" {{/if}}>Closed</option>
                        <option value="Pending" {{if $item.car_status eq 'Pending'}} selected="selected" {{/if}}>Pending</option> 
					
					</select>

					 <div id="statusdu_{{$item.car_id}}">
					 {{$item.car_status_date}} <br /> {{$item.car_status_user}}
                     </div>
                    
					<script language="javascript">

						function update_status(id, value) {
							var statusdu = "#statusdu_"+id;
							$.ajax({
								type: "GET",
								url: "{{$BASE_URL}}construction_alert_report.update_status/car_id/" + id + "/value/" + value,
								success: function (result) {
										$(statusdu).html(result);
								}
							});
						}

					</script>

							<!-- {{if $item.car_approve}}{{$item.car_status}} {{elseif $item.resolved eq 1 }} Pending {{else}} {{$item.car_status}}{{/if}}-->
				</td>

				<td>  
                <form name="add_ae"  method ='post' action="">
                  Escalation Required  
                  <select name="type" style="width:100px;" Onchange="update_addtoesc({{$item.car_id}},this.value, this)">					
						<option value="0"  {{if $item.car_add_to_ae eq '0'}} selected="selected" {{/if}}>No</option>
                        <option value="1"  {{if $item.car_add_to_ae eq '1'}} selected="selected" {{/if}}>Yes</option>
				  </select>
                </form>
                
                <script language="javascript">

						function update_addtoesc(id, value, selectElement) 
						{
							var reason;
							if(value == 1) {
								 reason = prompt("Please enter the reason for required escalation:");
							}
							
							if(reason == '') {
								alert('Please enter the reason for escalation');
							    selectElement.value = '0';
							}
								var tana = '#tana'+id;		
	
								$.ajax({
									type: "GET",
									url: "{{$BASE_URL}}construction_alert_report.update_addtoesc/car_id/" + id + "/value/" + value + "/reason/" + reason,
									success: function (result) {
										$(tana).html(result);
										
										}
								});
							 
						}

				</script>
                    
                 <div id="tana{{$item.car_id}}"> {{if $item.car_add_to_ae eq '1'}}{{$item.car_escalation_date }}<br />{{$item.car_escalation_user}}{{/if}}</div>
                
                 <a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" class="various" title="Edit">
               			
						<img style="height:20px; width:20px;"
							src="{{$BASE_URL}}css/admin/images/edit.png" /></a>&nbsp;&nbsp;
					<a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}"
						onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete">
						<img style="height:20px; width:20px;"
							src="{{$BASE_URL}}css/admin/images/delete.png" /></a>&nbsp;&nbsp
					<!-- <a href="{{$BASE_URL}}construction_alert_report.highlight_row/{{$ID}}/{{$item.$ID}}/color/{{$item.car_row_color}}" title="Highlight Row">
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/highlightmarker.png"/></a>-->

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

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> -->
<script>
	document.addEventListener("DOMContentLoaded", function() {
		var lazyloadImages;    

		if ("IntersectionObserver" in window) {
			lazyloadImages = document.querySelectorAll(".lazy");
			var imageObserver = new IntersectionObserver(function(entries, observer) {
				entries.forEach(function(entry) {
					if (entry.isIntersecting) {
						var image = entry.target;
						image.src = image.dataset.src;
						image.classList.remove("lazy");
						imageObserver.unobserve(image);
					}
				});
			});

			lazyloadImages.forEach(function(image) {
				imageObserver.observe(image);
			});
		} else {  
			var lazyloadThrottleTimeout;
			lazyloadImages = document.querySelectorAll(".lazy");
			
			function lazyload () {
				if(lazyloadThrottleTimeout) {
					clearTimeout(lazyloadThrottleTimeout);
				}

				lazyloadThrottleTimeout = setTimeout(function() {
					var scrollTop = window.pageYOffset;
					lazyloadImages.forEach(function(img) {
						if(img.offsetTop < (window.innerHeight + scrollTop)) {
							img.src = img.dataset.src;
							img.classList.remove('lazy');
						}
					});
					if(lazyloadImages.length == 0) { 
						document.removeEventListener("scroll", lazyload);
						window.removeEventListener("resize", lazyload);
						window.removeEventListener("orientationChange", lazyload);
					}
				}, 20);
			}

			document.addEventListener("scroll", lazyload);
			window.addEventListener("resize", lazyload);
			window.addEventListener("orientationChange", lazyload);
		}
	});
	function trackedFetch(url, options) {
		const start = performance.now();
		return fetch(url, options).then(response => {
			const end = performance.now();
			requestLog.push({
				url,
				duration: (end - start).toFixed(2),
				status: response.status
			});
			return response;
		});
	}

	// const kill_others = document.querySelectorAll('.kill_others');

	// kill_others.forEach(element => {
	// 	element.addEventListener("click", function(){
	// 		console.log('clicked');
	// 		const originalOpen = XMLHttpRequest.prototype.open;
	// 		XMLHttpRequest.prototype.open = function (method, url, ...rest) {
	// 			console.log('XHR called:', method, url);
	// 			// return originalOpen.call(this, method, url, ...rest);
	// 		};
	// 	});
	// });
	// $(document).on('click', '.kill_others', function() {
	// 	console.log('this', $(this));
	// });
</script>