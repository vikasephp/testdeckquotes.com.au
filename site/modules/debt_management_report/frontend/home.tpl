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
		var viewurl = "{{$BASE_URL}}debt_management_report.view_procedure" + "/random/" + Math.random();
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
	function open_popup(type) {
        let viewurl = '';
        if(type == 'manage_jurisdiction'){
			viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.view_jurisdiction" + "/random/" + Math.random();
        }
        else if(type == 'manage_action'){
			viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.view_action" + "/random/" + Math.random();
        }
        else if(type == 'manage_type'){
			viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.view_type" + "/random/" + Math.random();
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
<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
	<div style="float: left; text-align: left;">
		&nbsp;
		<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" />
		<input type="button" name="Add New" value="Jurisdictions" onclick="javascript:open_popup('manage_jurisdiction');" />
        <input type="button" name="Add New" value="Actions" onclick="javascript:open_popup('manage_action');" />
        <input type="button" name="Type" value="Type" onclick="javascript:open_popup('manage_type');" />
		<br>
		&nbsp;
		<strong> Filter By : </strong>
		<select name="status" />
		<option value="">Please Select </option>
		<option value="Contacted" {{if $item.dm_status eq 'Contacted' }} selected="selected" {{/if}}>Contacted</option>
		<option value="ACAT Form Lodged" {{if $item.dm_status eq 'ACAT Form Lodged' }} selected="selected" {{/if}}>ACAT
			Form Lodged</option>
		<option value="ACAT In Progress" {{if $item.dm_status eq 'ACAT In Progress' }} selected="selected" {{/if}}>ACAT
			In Progress</option>
		<option value="Resolved" {{if $item.dm_status eq 'Resolved' }} selected="selected" {{/if}}>Resolved</option>
		</select>
		&nbsp; &nbsp;<input type="submit" value="Filter" name="filter" />
		&nbsp;<input type="submit" name="clear" value="Clear Filter" />
	</div>
	<div style="float:right;">
		<input type="submit" value="Show Hidden" name="show_hidden" /> 
		<input type="button" name="Add New " value="Add New"
			onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.detail}}');" />
	</div>
</form>
<div id="">
	<table id="list-table" class="nav-back" width="100%">
		<thead>
			<tr>
				<th class="topmenu" style="text-align: center;" valign="middle" width="3%" data-col="unique_id">Unique Id</th>
				<th class="topmenu" style="text-align: center;" valign="middle" width="15%" data-col="project">Project</th>
				<th class="topmenu" style="text-align: center;" valign="middle" width="7%" data-col="total_value">Total Value</th>
				<th class="topmenu" style="text-align: center;" valign="middle" width="7%" data-col="invoice">Invoice</th>
				<th class="topmenu" style="text-align: center;" valign="middle" width="7%" data-col="invoice_value">Invoice Value</th>
				<th class="topmenu" style="text-align: center;" valign="middle" width="7%" data-col="email_first">Email First</th>
				<th class="topmenu" style="text-align: center;" valign="middle" width="7%" data-col="email_second">Email Second</th>
				<th class="topmenu" style="text-align: center;" valign="middle" width="7%" data-col="phone_call">Phone Call</th>
				<!-- <th class="topmenu" style="text-align: center;" valign="middle" width="7%" data-col="dmp">DMP</th> -->
				<th class="topmenu" style="text-align: center;" valign="middle" width="7%" data-col="last_contact_date">Last Contact Date</th>
				<th class="topmenu" style="text-align: center;" valign="middle" width="7%" data-col="next_contact_date">Next Contact Date</th>
				<th class="topmenu" style="text-align: center;" valign="middle" width="8%" data-col="jurisdiction">Jurisdiction</th>
				<th class="topmenu" style="text-align: center;" valign="middle" width="10%" data-col="new_action">Action</th>
				<th class="topmenu" style="text-align: center;" valign="middle" width="10%" data-col="status">Status</th>
				<th class="topmenu" style="text-align: center;" valign="middle" width="10%" data-col="type_of_invoice_due">Type Of Invoice Due</th>
				<th class="topmenu" style="text-align: center;" valign="middle" width="5%" data-col="notes">Notes</th>
				<th class="topmenu" style="text-align: center;" valign="middle" width="8%" data-col="correspondence">MSTEAM</th>
				<th class="topmenu" style="text-align: center;" valign="middle" width="8%" data-col="supporting_documents">Supporting Document</th>
				<th class="topmenu" style="text-align: center;" valign="middle" width="8%" data-col="acat_documents">ACAT Document</th>
				<th class="topmenu" style="text-align: center;" valign="middle" width="8%" data-col="type">Type</th>
				<th class="topmenu" style="text-align: center;" valign="middle" width="8%" data-col="late_letter_report">Late Letter Report</th>
				<th class="topmenu" style="text-align: center;" valign="middle" width="8%" data-col="hide">Hide</th>
				<th class="topmenu" style="text-align: center;" valign="middle" width="8%" data-col="action">Action</th>
			</tr>
		</thead>
		<tbody>
			{{assign var=countn value= $total}}
			{{foreach from=$list key="key" item="item"}}
			<tr bgcolor="#FFFFFF">
				<td data-col="unique_id">{{counter}}</td>
				<td data-col="project">{{$item.dm_bsn_name}}</td>
				<td data-col="total_value">
					<!--${{$item.dm_total_value|number_format:2:".":","}}-->
					{{$item.dm_total_value}}
				</td>
				<td data-col="invoice">
					{{if $item.dm_invoice}}
					<a href="/debt_management_report.download_content?file_name={{$item.dm_invoice}}&module_name=debt_management_report.home" target="_blank">Download</a>
					{{/if}}
				</td>
				<td data-col="invoice_value">{{$item.dm_invoice_value}}</td>
				<td data-col="email_first">
					<form name="recmet3" method="post" action="">
						<input type="hidden" name="first_email[{{$item.dm_id}}]" value="0" />
						<label class="switch">
							<input class="switch-input" type="checkbox" name="first_email[{{$item.dm_id}}]" value="1"
								onclick="this.form.submit();" {{if $item.dm_first_email eq 1 }} checked="checked"
								{{/if}} />
							<span class="switch-label" data-on="Yes" data-off="No"></span>
							<span class="switch-handle"></span> <br />
						</label>
					</form>
					{{ if $item.dm_first_email eq 1 }}
						{{ if $item.dm_first_email_user }}
							<p><strong>User:</strong> {{ $item.dm_first_email_user }}</p>
						{{ /if }}
						{{ if $item.dm_first_email_date }}
							<p><strong>Date:</strong>{{ $item.dm_first_email_date }}</p>
						{{ /if }}
					{{ /if }}
				</td>
				<td data-col="email_second">
					<form name="recmet4" method="post" action="">
						<input type="hidden" name="second_email[{{$item.dm_id}}]" value="0" />
						<label class="switch">
							<input class="switch-input" type="checkbox" name="second_email[{{$item.dm_id}}]" value="1"
								onclick="this.form.submit();" {{if $item.dm_second_email eq 1 }} checked="checked"
								{{/if}} />
							<span class="switch-label" data-on="Yes" data-off="No"></span>
							<span class="switch-handle"></span> <br />
						</label>
					</form>
					{{ if $item.dm_second_email eq 1 }}
						{{ if $item.dm_second_email_user }}
							<p><strong>User:</strong> {{ $item.dm_second_email_user }}</p>
						{{ /if }}
						{{ if $item.dm_second_email_date }}
							<p><strong>Date:</strong>{{ $item.dm_second_email_date }}</p>
						{{ /if }}
					{{ /if }}
				</td>
				<td data-col="phone_call">
					<form name="recmet5" method="post" action="">
						<input type="hidden" name="phone_call[{{$item.dm_id}}]" value="0" />
						<label class="switch">
							<input class="switch-input" type="checkbox" name="phone_call[{{$item.dm_id}}]" value="1"
								onclick="this.form.submit();" {{if $item.dm_phone_call eq 1 }} checked="checked"
								{{/if}} />
							<span class="switch-label" data-on="Yes" data-off="No"></span>
							<span class="switch-handle"></span> <br />
						</label>
					</form>
					{{ if $item.dm_phone_call eq 1 }}
						{{ if $item.dm_phone_call_user }}
							<p><strong>User:</strong> {{ $item.dm_phone_call_user }}</p>
						{{ /if }}
						{{ if $item.dm_phone_call_date }}
							<p><strong>Date:</strong>{{ $item.dm_phone_call_date }}</p>
						{{ /if }}
					{{ /if }}
				</td>
				<!-- <td data-col="dmp">
					{{ if $item.td_dmp eq 1 }}YES{{ else }}NO{{ /if }}
				</td> -->
				<td data-col="last_contact_date">
					<input type="text" name="last[{{$item.dm_id}}]" class="w16em dateformat-d-ds-m-ds-Y dtpic"
						id="demo_{{$item.dm_id}}" value="{{$item.dm_last_contact_date }}"
						onfocus="update_last_contact({{$item.dm_id}}, this.value);" />
					<script>
						function update_last_contact(id, value) {
							$.ajax({
								type: "GET",
								url: "{{$BASE_URL}}debt_management_report.update_last_contact/dm_id/" + id + "/value/" + value,
								success: function (result) {
								}
							});
						}
					</script>
				</td>
				<td data-col="next_contact_date">
					<input type="text" name="next[{{$item.dm_id}}]" class="w16em dateformat-d-ds-m-ds-Y dtpic"
						id="demo2_{{$item.dm_id}}" value="{{$item.dm_next_contact_date}}"
						onfocus="update_next_contact({{$item.dm_id}}, this.value);" />
					<script>
						function update_next_contact(id, value) {
							$.ajax({
								type: "GET",
								url: "{{$BASE_URL}}debt_management_report.update_next_contact/dm_id/" + id + "/value/" + value,
								success: function (result) {
								}
							});
						}
					</script>
				</td>
				<td data-col="jurisdiction">
					<select name="{{$TABLE}}[dm_jurisdiction_id]" onchange="updateRecord('{{ $item.$ID }}', 'dm_jurisdiction_id', this.value)">
						<option value="0">Please Select</option>
                        {{ foreach from=$jurisdictiondata key="key" item="item2" }}
                        <option value="{{ $item2.$JURISDICTION_ID }}" {{if $item.dm_jurisdiction_id eq $item2.$JURISDICTION_ID}} selected="selected" {{/if}}>{{ $item2.dmj_option }}</option>
                        {{ /foreach }}
					</select>
				</td>
				<td data-col="new_action">
					<select name="{{$TABLE}}[dm_action_id]" onchange="updateRecord('{{ $item.$ID }}', 'dm_action_id', this.value)">
						<option value="0">Please Select</option>
                        {{ foreach from=$actiondata key="key2" item="item2" }}
                        <option value="{{ $item2.$ACTION_ID }}" {{if $item.dm_action_id eq $item2.$ACTION_ID}} selected="selected" {{/if}}>{{ $item2.dma_option }}</option>
                        {{ /foreach }}
					</select>
					{{ if !empty($item.dm_action_user_name) }}
						<p><strong>User:</strong> {{ $item.dm_action_user_name }}</p>
					{{ /if }}
					{{ if !empty($item.dm_action_date) and ($item.dm_action_date != 000-00-00) }}
						<p><strong>Date:</strong> {{ $item.dm_action_date|date_format:"%d-%m-%Y" }}</p>
					{{ /if }}
				</td>
				<td data-col="status">
					<select name="{{$TABLE}}[dm_status]" Onchange="update_status({{$item.dm_id}},this.value)">
						<option value="">Please Select </option>
						<option value="Contacted" {{if $item.dm_status eq 'Contacted' }} selected="selected" {{/if}}>
							Contacted</option>
						<option value="ACAT Form Lodged" {{if $item.dm_status eq 'ACAT Form Lodged' }}
							selected="selected" {{/if}}>ACAT Form Lodged</option>
						<option value="ACAT In Progress" {{if $item.dm_status eq 'ACAT In Progress' }}
							selected="selected" {{/if}}>ACAT In Progress</option>
						<option value="Resolved" {{if $item.dm_status eq 'Resolved' }} selected="selected" {{/if}}>
							Resolved</option>
						<option value="In Discussion With Clients" {{if $item.dm_status eq 'In Discussion With Clients' }} selected="selected" {{/if}}>
						    In Discussion With Clients
						</option>
					</select>
					<script>
						function update_status(id, value) {
							$.ajax({
								type: "GET",
								url: "{{$BASE_URL}}debt_management_report.update_status/dm_id/" + id + "/value/" + value,
								success: function (result) {
								}
							});
						}
					</script>
				</td>
				<td data-col="type_of_invoice_due">
					<select name="{{$TABLE}}[dm_type_invoice_due]" Onchange="update_status({{$item.dm_id}},this.value)">
						<option value="">Please Select</option>
                        {{ foreach from=$invoiceType key="key3" item="item3" }}
                        <option value="{{ $item3.it_type }}" {{if $item3.it_type eq $item.dm_type_invoice_due }} selected="selected" {{/if}}>{{ $item3.it_type }}</option>
                        {{ /foreach }}
					</select>
					<script>
						function update_status(id, value) {
							$.ajax({
								type: "GET",
								url: "{{$BASE_URL}}debt_management_report.update_invoice_type/dm_id/" + id + "/value/" + value,
								success: function (result) {
								}
							});
						}
					</script>
				</td>
				<td data-col="notes">
					<a href="{{$BASE_URL}}debt_management_report.notes/dm_id/{{$item.dm_id}}" class="various">Notes</a>
				</td>
				<td data-col="correspondence">
					{{if $item.dm_corresspondace}}
					<!-- <a href="/debt_management_report.download_content?file_name={{$item.dm_corresspondace}}&module_name=debt_management_report.home" target="_blank">Download</a> -->
					<a href="{{ $item.dm_corresspondace }}" target="_blank">Link</a>
					{{/if}}
				</td>
				<td data-col="supporting_documents">
					{{if $item.dm_support_doc}}
					<a href="/debt_management_report.download_content?file_name={{$item.dm_support_doc}}&module_name=debt_management_report.home" target="_blank">Download</a>
					{{/if}}
				</td>
				<td data-col="acat_documents">
					{{if $item.dm_acat_doc_link}}
					<a href="{{$item.dm_acat_doc_link}}" target="_blank">Link</a>
					{{/if}}
				</td>
				<td data-col="type">
				    <select name="{{$TABLE}}[dm_type_id]" onchange="updateRecord('{{ $item.$ID }}', 'dm_type_id', this.value)">
						<option value="0">Please Select</option>
                        {{ foreach from=$typedata key="key" item="itemType" }}
                        <option value="{{ $itemType.dmt_id }}" {{if $item.dm_type_id eq $itemType.dmt_id}} selected="selected" {{/if}}>{{ $itemType.dmt_option }}</option>
                        {{ /foreach }}
					</select>
				</td>
				<td data-col="late_letter_report">TBD</td>
				<td data-col="hide">
					<label class="switch" for="dm_hide{{ $item.dm_id }}">
						<input id="dm_hide{{ $item.dm_id }}" class="switch-input" {{ if $item.dm_hide == 1 }}checked{{ /if }} onchange="displayToggle('{{ $item.dm_id }}', 'dm_hide', this)" type="checkbox" />
						<span class="switch-label" data-on="Yes" data-off="No"></span>
						<span class="switch-handle"></span> <br />
					</label>
				</td>
				<td data-col="action">
					<a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" class="various" title="Edit">
						<img style="height:20px; width:20px;"
							src="{{$BASE_URL}}css/admin/images/edit.png" /></a>&nbsp;&nbsp;
					<a href="{{$BASE_URL}}{{$XFA.delete}}/{{$ID}}/{{$item.$ID}}"
						onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete">
						<img style="height:20px; width:20px;"
							src="{{$BASE_URL}}css/admin/images/delete.png" /></a>&nbsp;&nbsp
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
			<td style="text-align: center;">
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
				<td style="text-align: center;" height="300">Record Not found... </td>
				{{/if}}
		</tr>
	</table>
	{{/if}}
</div>

<script>
	function updateRecord(primaryID, column, value) {
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
                    // alert('You have successfully updated the record');
                }
                else {
                    alert('Some problem in updating the record');
                }
            }
        })
    }

	function displayToggle(record_id, c, t) {
        console.log(record_id, c, t);
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
        console.log(formData);
        $.ajax({
            type: "POST",
            url: "{{$BASE_URL}}{{ $BASEFOLDER }}.ajax_handler",
            data: formData,
            dataType: "json",
            encode: true,
            success: function (data) {
                if (data.success == true) {
					//location.reload();
					const url = window.location;
					window.location = url;
                    // alert('You have successfully updated the record');
                }
                else {
                    alert('Some problem in updating the record');
                }
            }
        })
    }
</script>