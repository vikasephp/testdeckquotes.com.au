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

	
	function open_popup(type) {
        let viewurl = '';
		if (type == 'add_procedure') {
			viewurl = "{{$BASE_URL}}quote_management_report.view_procedure" + "/random/" + Math.random();
        }
        else if (type == 'edit_component') {
            viewurl = "{{$BASE_URL}}quote_management_report.view_edit_project" + "/random/" + Math.random();
        }
		else if (type == 'add_component') {
            viewurl = "{{$BASE_URL}}quote_management_report.view_component" + "/random/" + Math.random();
        }
		else if (type == 'view_quote_status') {
            viewurl = "{{$BASE_URL}}quote_management_report.view_quote_status" + "/random/" + Math.random();
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
</script>

<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
	<div style="display: flex; justify-content: space-between; align-items: end;">
		<div style="text-align: left; margin-left: 10px;">
			<div>
				<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:open_popup('add_procedure');" />
				<input type="button" name="component" value="Edit Component" onclick="javascript:open_popup('add_component');" />
				<input type="button" name="edit_project" value="Edit Project" onclick="javascript:open_popup('edit_component');" />
				<input type="button" name="quote_status" value="Edit Quote Status" onclick="javascript:open_popup('view_quote_status');" />
			</div>
			<div>
				<input type="text" list="project" name="address" style="width:350px;" placeholder="Search for Address" value="{{$address}}" />
				<datalist id='project'>
					{{foreach from=$project_address key="key" item="item_pro"}}
					<option value="{{$item_pro.qm_project}}">{{$item_pro.qm_project}}</option>
					{{/foreach}}
				</datalist>
			</div>
			<div>
				<input type="text" list="position_list" name="position" style="width:350px;" placeholder="Search for Position" value="{{$position}}" />
				<datalist id='position_list'>
					{{foreach from=$position_list key="key" item="item_posi"}}
					<option value="{{$item_posi.qb_sup_position}}">{{$item_posi.qb_sup_position}}</option>
					{{/foreach}}
				</datalist>
			</div>
			<div>
				<input type="text" list="cdetail" name="component" style="width:350px;" placeholder="Search by Component" value="{{$component}}" />
				<datalist id='cdetail'>
					{{foreach from=$cdetail key="index" item="row"}}
					<option value="{{$row.qb_component}}">{{$row.qb_component}}</option>
					{{/foreach}}
				</datalist>
			</div>
			<div>
				<select name="due_date" style="width: 361px;">
					<option value="0">Due Date</option>
					<option value="1">Overdue</option>
					<option value="2">Due within 2 weeks</option>
					<option value="3">All</option>
				</select>
			</div>
			<div>
				<select name="quote_status" style="width: 361px;">
					<option value="">Please Select Quote Status</option>
					{{foreach from=$quote_management_report_status key="index" item="row"}}
						<option value="{{$row.qmrs_id}}" {{if $row.qmrs_id == $quote_status}}selected{{/if}}>{{$row.qmrs_name}}</option>
					{{/foreach}}
				</select>
				<input type="submit" value="Search" name="search" />
				<input type="submit" name="clear" value="Clear Search" />
			</div>
		</div>
		<div style="text-align: right; margin-right: 10px;">
			<div>
				<input type="button" value="Export To XLS" onclick="document.location.href='{{$BASE_URL}}{{$XFA.home}}/export/1'" />
				<input type="submit" name="show_all_quotes" value="Show All" />
				<!--<input type="submit" name="approved_quotes" value="Show Approved Quotes" />-->
				<input type="submit" name="show_hidden_quotes" value="Show Hidden Quotes" />
				<!--<input type="button" name="Add New " value="Add New" onclick="javascript:add_new('{{$BASE_URL}}{{$XFA.detail}}');" />-->
			</div>
		</div>
	</div>	
</form>

<div id="">
	<table id="list-table" class="nav-back" width="100%">
		<thead>
			<tr>
				<th class="topmenu" align="center" valign="middle" width="3%">SrNo</th>
				<th class="topmenu" align="center" valign="middle" width="15%">Project Address</th>
				<th class="topmenu" align="center" valign="middle" width="8%">Project Type</th>
				<th class="topmenu" align="center" valign="middle" width="5%">Starting<br /> Onsite Date </th>
				<th class="topmenu" align="center" valign="middle" width="6%">Component</th>
				<!-- <th class="topmenu" align="center" valign="middle" width="6%">Required</th> -->
				<th class="topmenu" align="center" valign="middle" width="6%" data-col="procedure">Procedure</th>
				<th class="topmenu" align="center" valign="middle" width="6%">Email Link</th>
				<th class="topmenu" align="center" valign="middle" width="6%">QA</th>
				<!-- <th class="topmenu" align="center" valign="middle" width="15%">Quote Descriptions</th> -->
				<th class="topmenu" align="center" valign="middle" width="10%" data-col="suppliers">Suppliers</th>
				<th class="topmenu" align="center" valign="middle" width="5%">Attachments </th>
				<th class="topmenu" align="center" valign="middle" width="10%">Quote Number </th>
				<th class="topmenu" align="center" valign="middle" width="10%">PO Number </th>
				<th class="topmenu" align="center" valign="middle" width="7%">Project Component Due Date </th>
				<th class="topmenu" align="center" valign="middle" width="7%">Responsible Position </th>
				<th class="topmenu" align="center" valign="middle" width="5%" data-col="qm_qmrs_id">Quote Status</th>
				<th class="topmenu" align="center" valign="middle" width="5%">Action</th>
			</tr>
		</thead>
		<tbody>
			{{assign var=countn value= $total}}
			{{foreach from=$list key="key" item="item"}}
			<tr bgcolor="#FFFFFF" id="row_{{$item.qm_id}}">
				<td>{{$item.qm_id}}</td>
				<td><a href="{{$item.link}}" target="_blank">{{$item.qm_project}}</a></td>
				<td>{{$item.project_type}}</td>
				<td>{{$item.bsn_starting_onsite_date}} </td>
				<td>
					{{foreach from = $cdetail key="key2" item="item2"}}
						{{if $item2.qb_id eq $item.qm_component }}{{$item2.qb_component}}{{/if}}
					{{/foreach}}
				</td>				
				<!-- <td style="text-align:center;">
					{{if $item.qm_component_action eq 1}}Yes{{elseif $item.qm_component_action eq 2}}No{{/if}}
				</td> -->
				<td data-col="procedure">
					{{$item.qb_component_procedure_link}}
				</td>
				<td data-col="email_code">{{$item.emcode_link}}</td>
				<td data-col="qa" style="text-align: center; background: {{$item.qa_color}}">
					<a href="{{$BASE_URL}}{{$BASEFOLDER}}.view_qmr_qa/{{$ID}}/{{$item.$ID}}" class="various">QA</a>
				</td>
				<td data-col="suppliers" style="background-color: {{$item.suppliers_color}}">
					{{foreach from=$item.suppliers key="index" item="row"}}
						{{assign var=qmrc_co_id value=$row.qmrc_co_id}}
						<a href="{{$BASE_URL}}{{$BASEFOLDER}}.show-contacts/qmrcc_qmrc_id/{{$row.qmrc_id}}" class="various kill_others">{{$co_company_names.$qmrc_co_id}}</a>
						<br>
					{{/foreach}}
					<br>
					<a href="{{$BASE_URL}}{{$BASEFOLDER}}.include_suppliers/{{$ID}}/{{$item.$ID}}" class="various kill_others">Include Supplier</a>
				</td>
				<td style="background-color: {{$item.attachment_color}}">
					{{if $item.qm_attachment_1}}
					<a href="/quote_management_report.download_content?file_name={{$item.qm_attachment_1}}&module_name=quote_management_report.home">Download</a><br />
					<small style="color: #666; font-size: 11px;">{{$item.qm_attachment_1_date|date_format:"%d-%m-%Y"}}</small><br />
					{{/if}}
					
					{{if $item.qm_attachment_2}}
					<a href="/quote_management_report.download_content?file_name={{$item.qm_attachment_2}}&module_name=quote_management_report.home">Download</a><br />
						<small style="color: #666; font-size: 11px;">{{$item.qm_attachment_2_date|date_format:"%d-%m-%Y"}}</small><br />
					{{/if}}
					
					{{if $item.qm_attachment_3}}
					<a href="/quote_management_report.download_content?file_name={{$item.qm_attachment_3}}&module_name=quote_management_report.home">Download</a><br />
					<small style="color: #666; font-size: 11px;">{{$item.qm_attachment_3_date|date_format:"%d-%m-%Y"}}</small><br />
					{{/if}}
					
					{{if $item.qm_attachment_4}}
					<a href="/quote_management_report.download_content?file_name={{$item.qm_attachment_4}}&module_name=quote_management_report.home">Download</a><br />
					<small style="color: #666; font-size: 11px;">{{$item.qm_attachment_4_date|date_format:"%d-%m-%Y"}}</small><br />
					{{/if}}
					
					{{if $item.qm_attachment_5}}
					<a href="/quote_management_report.download_content?file_name={{$item.qm_attachment_5}}&module_name=quote_management_report.home">Download</a><br />
					<small style="color: #666; font-size: 11px;">{{$item.qm_attachment_5_date|date_format:"%d-%m-%Y"}}</small>
					{{/if}}
				</td>
				<td>{{$item.qm_quote_number}}</td>
				<td>{{$item.qm_po_number}}</td>
				<td>{{$item.due_date}}</td>

				<td>{{$item.res_position}}<br />{{$item.res_email}}</td>
				<td
					data-col="qm_qmrs_id"
					id="qm_qmrs_id{{ $item.$ID }}"
					style="background-color: {{$item.qm_qmrs_id_color}}"
				>
					<select name="qm_qmrs_id{{ $item.$ID }}" onchange="updateRecord('{{ $item.$ID }}', 'qm_qmrs_id', this.value, true)" data-selected="{{$item.qmrs_name}}">
					{{foreach from=$quote_management_report_status key="index" item="row"}}
						<option data-text="{{$row.qmrs_name}}" value="{{$row.qmrs_id}}" {{if $row.qmrs_id == $item.qm_qmrs_id}}selected{{/if}}>{{$row.qmrs_name}}</option>
					{{/foreach}}
					</select>
					{{$item.qa_name_date}}
				</td>

				<td> <a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$item.$ID}}" class="various" title="Edit">
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
	function updateRecord(primaryID, column, value, updateRecord = false) {
        const formData = {
            primaryID: primaryID,
            column: column,
            value: value,
            action: "updateRecord"
        };
		const uniqueID = column + primaryID;
		if(column == 'qm_qmrs_id') {
			const selectElement = $('select[name="' + uniqueID + '"]');
			const lastSelectedText = selectElement.attr('data-selected');
			const selectedOption = $('select[name="' + uniqueID + '"] option:selected');
			const selectedText = selectedOption.text();
			console.log(lastSelectedText, selectedText);
			if(selectedText == 'Rejected') {
				const confirmation = confirm('Would you like to hide this quote?');
				console.log(confirmation);
				if(!confirmation) {
					$('select[name="' + uniqueID + '"] option[data-text="' + lastSelectedText + '"]').attr('selected', 'selected');
					return;
				}
			}
			$.ajax({
				type: "POST",
				url: "{{$BASE_URL}}{{ $BASEFOLDER }}.ajax_handler",
				data: formData,
				dataType: "json",
				encode: true,
				success: function (data) {
					if (data.success == true) {
						if(updateRecord){
							if(column == 'qm_qmrs_id') {
								let bgcolor = 'white';
								if(selectedText == 'Rejected') {
									bgcolor = '{{$rejected_color}}';
								}
								else if(selectedText == 'Approved') {
									bgcolor = '{{$approved_color}}';
								}
								else if(selectedText == 'Pending') {
									bgcolor = '{{$pending_color}}';
								}
								else if(selectedText == 'Unprocessed') {
									bgcolor = '{{$unprocessed_color}}';
								}
								else if(selectedText == 'Complete') {
									bgcolor = '{{$complete_color}}';
								}
								else if(selectedText == 'No Quote') {
									bgcolor = '{{$no_quote_color}}';
								}
								else if(selectedText == 'Unknown Component') {
									bgcolor = '{{$unknown_component_color}}';
								}
								else if(selectedText == 'Quote Received') {
									bgcolor = '{{$quote_received_color}}';
								}

								const show_hidden_quotes = '{{ $show_hidden_quotes }}';
								const rowID = '#row_' + primaryID;
								if(selectedText == 'Rejected') {
									if(show_hidden_quotes == '') {
										$(rowID).hide();
									}
								}
								else {
									if(show_hidden_quotes != '') {
										$(rowID).hide();
									}
								}
								$('#' + uniqueID).css('background-color', bgcolor);
								selectElement.attr('data-selected', selectedText);
							}
						}
					}
					else {
						alert('Some problem in updating the record');
					}
				}
			});
		}
        
    }
</script>