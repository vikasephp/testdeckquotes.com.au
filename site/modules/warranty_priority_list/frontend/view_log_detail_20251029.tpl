<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

<script> !window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
<style>
.sameLineWrapper {
    display: flex;
    gap: 10px;
	align-items: center;
}
.sameLine {
    flex: 1;
}
select {
	width: 200px;
	white-space: normal;
}
select option {
	white-space: normal;
	word-break: break-word;
}
td a {
    text-align: left;
    font-size: 12px;
    color: #333333;
    padding: 0px;
}

{{if $data_log.wa_status eq 'Pending' }} 
#list-table tr td:nth-child(2) {
	background: #f7b900;
}	 
{{elseif $data_log.wa_include_supplier eq '' }}
#list-table tr td:nth-child(2) {
	background: #F00;
}
{{else}}
#list-table tr td:nth-child(2) {
	background: #FFFFFF;
}
{{/if}}				
</style>

<script type="text/javascript">
$(document).ready(function () {
	/*
	*   Examples - images
	*/
	$(".various").fancybox({
		'width': '75%',
		'height': '75%',
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
</script>
	
{{if $opr}}
<script type="text/javascript">
    setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<div align="center" style="min-height:350px; padding-top: 40px;">
    <h3 class="page-title">Log View</h3>
    <table cellpadding="0" cellspacing="0" class="table" id="list-table" style="margin-bottom: 30px; width: 900px;">
		<thead>
			<tr>
				<th width="22%">Title</th>
				<th width="78%">Details</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>Rec. No.</td>
				<td>{{$data_log.wa_id}}</td>
			</tr>
			<tr>
				<td>Status</td>
				<td>
					{{if $data_log.wa_status eq 'Pending'}}
						<a href="{{$BASE_URL}}warranty_log.status_approve/wa_id/{{$data_log.wa_id}}" class="various">{{$data_log.wa_status}} </a>
					{{else}}
						{{$data_log.wa_status}}
						{{if $data_log.wa_status eq 'Closed'}}<br />{{$data_log.wa_status_date|date_format:"%d-%m-%Y"}} {{/if}}
					{{/if}}
				</td>
			</tr>
			<tr>
				<td>Project</td>
				<td>{{$projectLink}}</td>
			</tr>
			<tr>
				<td>Walkthrough Date</td>
				<td>{{$walkthrough_date|date_format:"%d-%m-%Y"}}</td>
			</tr>
			<tr>
				<td>Problem</td>
				<td>{{$data_log.wa_problem}}</td>
			</tr>
			<tr>
				<td>Date</td>
				<td>
					{{$data_log.wa_date}}
					<br />
					{{$data_log.wa_user}}
				</td>
			</tr>
			<tr>
				<td>Days Count</td>
				<td>{{$dayscount}}</td>
			</tr>
			<tr>
				<td>Type</td>
				<td>
					<select name="{{$TABLE}}[wa_type]" Onchange="update_type({{$data_log.wa_id}},this.value)">
						<option value='NA' {{if $data_log.wa_type eq 'NA' }} selected="selected" {{/if}}>Please Select
						</option>
						{{foreach from = $typedetail key="key4" item="item4"}}
						<option value="{{$item4.wt_type_option}}" {{if $item4.wt_type_option eq $data_log.wa_type}}
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
			</tr>
			<tr>
				<td>Workmanship Defect Type</td>
				<td>
					<select name="{{$TABLE}}[wa_wlwd_id]" onchange="updateRecord('{{ $data_log.$ID }}', 'wa_wlwd_id', this.value)">
                        <option value="0">Please Select</option>
                        {{ assign var=option_col value=$ATTRIBUTES.workmanship_defect.option_col }}
                        {{ assign var=option_id value=$ATTRIBUTES.workmanship_defect.id }}
                        {{ foreach from=$warranty_log_workmanship_defect key="index" item="row" }}
                            <option value="{{ $row.$option_id }}" {{ if $row.$option_id eq $data_log.wa_wlwd_id }} selected="selected" {{/if}}>{{ $row.$option_col }}</option>
                        {{ /foreach }}
                    </select>
				</td>
			</tr>
			<tr>
				<td>CGFB Responsible</td>
				<td>
					<div style="width: 200px;">
						<select name="{{$TABLE}}[wa_cgfb_resp]" Onchange="update_cgfb({{$data_log.wa_id}},this)" style="width: 100%;">
							<option value="-1" {{if $data_log.wa_cgfb_resp eq -1}} selected="selected" {{/if}}>Please Select</option>
							{{foreach from=$cgfbdetail key="key6" item="item6"}}
							<option value="{{$item6.wc_id}}" {{if $item6.wc_id eq $data_log.wa_cgfb_resp}} selected="selected"{{/if}}>
								{{$item6.wc_cgfb_option}}
							</option>
							{{/foreach}}
						</select>
						<div id="cond{{$item.wa_id}}" style="display: flex; justify-content: space-between;">
							<span>{{$data_log.wa_cgfb_user}}</span>
							<span>{{$data_log.wa_cgfb_date}}</span>
						</div>
						<script>
							function update_cgfb(id, element) {
								const value = element.value;
								const selectedIndex = element.selectedIndex;
								const text = element.options[selectedIndex].text;
								
								const cond = '#cond' + id;
								$.ajax({
									type: "GET",
									url: "{{$BASE_URL}}warranty_log.update_cgfb/wa_id/" + id + "/value/" + value,
									success: function (result) {
										$(cond).html(result);
										if(text == 'No') {
											// $('#wa_cgfb_resp_no_div').show();
										}
									}
								});
							}
						</script>
						<div id="wa_cgfb_resp_no_div" style="display: none;">
							<textarea rows="4"></textarea>
							<input type="button" value="Print">
						</div>
						<div style="margin-top: 10px;">
							<div class="notes-section">
								<textarea id="wa_cgfb_notes_{{$data_log.wa_id}}" name="notes[wa_cgfb_notes]" cols="50" rows="7">{{$data_log.wa_cgfb_notes|escape}}</textarea>
								<button type="submit" onclick="update_savecgfb_notes({{$data_log.wa_id}})">Update</button>
							</div>
							<script>
							function update_savecgfb_notes(wa_id) {
								const note_value = document.getElementById('wa_cgfb_notes_' + wa_id).value;

								$.ajax({
									type: 'POST',
									url: "{{$BASE_URL}}warranty_log2.save_cgfb_notes",
									data: {
										notes: {
											wa_id: wa_id,
											wa_cgfb_notes: note_value
										}
									},
									success: function(response) {
										console.log("Saved successfully:", response);
									},
									error: function(xhr) {
										console.error("Error saving:", xhr.responseText);
									}
								});
							}
							</script>
							<a href="{{$BASE_URL}}warranty_log2.cgfb_notes/wa_id/{{$data_log.wa_id}}" class="various" style="display:none">Notes</a>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>Why Not Responsible</td>
				<td>
					<div style="width: 100%;">
						<select name="{{$TABLE}}[wa_why_not]" class="myselect" onchange="update_why_not({{$data_log.wa_id}},this.value)" style="width: 100%;" {{foreach from=$whynotdetail key="key7" item="item7"}}{{if $item7.ww_id eq $data_log.wa_why_not}}title="{{$item7.ww_option}}"{{/if}}{{/foreach}}}>
							<option value="0" {{if $data_log.wa_why_not eq 0}} selected="selected" {{/if}}>Please Select</option>
							{{foreach from = $whynotdetail key="key7" item="item7"}}
							<option value="{{$item7.ww_id}}" {{if $item7.ww_id eq $data_log.wa_why_not}} selected="selected"{{/if}} title="{{$item7.ww_option}}">
								{{$item7.ww_option}}
							</option>
							{{/foreach}}
						</select>
						<div id="why{{$item.wa_id}}" style="display: flex; justify-content: space-between;">
							<span>{{$data_log.wa_why_not_user}}<br/>{{$data_log.wa_why_not_date}}</span>
						</div>
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
					</div>
				</td>
			</tr>
			<tr>
				<td>Why Not Responsible Explained</td>
				<td>
					<div class="notes-section">
						<textarea id="wa_why_not_expl_{{$data_log.wa_id}}" name="notes[wa_why_not_resp_expl]" cols="50" rows="7">{{$data_log.wa_why_not_resp_expl|escape}}</textarea><br/>
						<button type="submit" onclick="update_why_not_expl({{$data_log.wa_id}})">Update</button>
					</div>
					<script>
					function update_why_not_expl(wa_id) {
						const note_value = document.getElementById('wa_why_not_expl_' + wa_id).value;

						$.ajax({
							type: 'POST',
							url: "{{$BASE_URL}}warranty_log2.update_why_not_expl",
							data: {
								notes: {
									wa_id: wa_id,
									wa_why_not_resp_expl: note_value
								}
							},
							success: function(response) {
								console.log("Saved successfully:", response);
							},
							error: function(xhr) {
								console.error("Error saving:", xhr.responseText);
							}
						});
					}
					</script>
				</td>
			</tr>
			<tr>
				<td>Inspection Required</td>
				<td>
					<select onchange="update_inspection_required({{$data_log.wa_id}}, this.value)">
						<option value="">Select</option>
						<option value="Yes" {{if $data_log.wa_inspection_required == 'Yes'}}selected{{/if}}>Yes</option>
						<option value="No" {{if $data_log.wa_inspection_required == 'No'}}selected{{/if}}>No</option>
					</select>
					<p>
						<input type="button" name="Alert" value="Hot Button">
					</p>
				</td>
				<script>
					function update_inspection_required(id, value) {
						// var cond = '#cond' + id;
						$.ajax({
							type: "GET",
							url: "{{$BASE_URL}}warranty_log.update_inspection_required/wa_id/" + id + "/value/" + value,
							success: function (result) {
								// $(cond).html(result);
							}
						});
					}
				</script>
			</tr>
			<tr>
				<td>Responsible Position</td>
				<td>
					{{$data_log.wa_resp_staff}}
					<a href="{{$BASE_URL}}warranty_log.select_staff/wa_id/{{$data_log.wa_id}}" class="various">Select Staff</a>
				</td>
			</tr>
			<tr>
				<td>Include Trades</td>
				<td {{if $wa_selected eq 1}} style="background:#F00;" {{/if}}>
					{{$data_log.wa_include_supplier}}
					<br/>
					<br/>
					<a href="{{$BASE_URL}}warranty_log.include_suppliers/wa_id/{{$data_log.wa_id}}" class="various">Include Trades</a>
				</td>
			</tr>
			<tr>
				<td>Require Escalation</td>
				<td>
					<select name="{{$TABLE}}[wa_priority]" Onchange="update_priority({{$data_log.wa_id}},this.value)">
						<option value="-1" {{if $data_log.wa_priority eq -1}} selected="selected" {{/if}}>Please Select
						</option>
						{{foreach from = $prdetail key="key4" item="item4"}}
						<option value="{{$item4.pr_id}}" {{if $item4.pr_id eq $data_log.wa_priority}}
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
			</tr>
			<tr>
				<td>Escalation Action</td>
				<td>
					<a href="{{$BASE_URL}}warranty_log2.update_escalation_action/wa_id/{{$data_log.wa_id}}" class="various">Notes</a>
				</td>
			</tr>
			<tr>
				<td>Traffic Light</td>
				<td {{ if $data_log.wa_tl eq 1}}style="background:#00CC33; color:#FFF" {{ elseif $data_log.wa_tl eq 2}} style="background: #ff7f27; color:#FFF" {{ elseif $data_log.wa_tl eq 3}} style="background: #F00; color:#FFF" {{else }} {{/if}}>
					<a href="{{$BASE_URL}}warranty_log.colorbox/wa_id/{{$data_log.wa_id}}" class="various">Color</a>
					<br /><br />{{$data_log.wa_tl_user}}<br />{{$data_log.wa_tl_date}}<br />
					<a href="{{$BASE_URL}}warranty_log.reason/wa_id/{{$data_log.wa_id}}" class="various">Read</a>
				</td>
			</tr>
			<tr>
				<td>Checklist</td>
				<td>
					{{$item.task_name}}
					<br />
					<a href="{{$BASE_URL}}warranty_log.view_checklist_status/wa_id/{{$data_log.wa_id}}" class="various">{{$tot_cd}}/{{$tot_chk}}</a>
				</td>
			</tr>
			<tr>
				<td>Update from Supplier</td>
				<td>
					{{if $data_log.wa_comment || $supplier_upadate}}
					<a href="{{$BASE_URL}}warranty_log.view_update/wa_id/{{$data_log.wa_id}}" class="various">Show</a><br/>
					{{$update_date|date_format:"%d-%m-%Y"}}
					{{/if}}
				</td>
			</tr>
			<tr>
				<td>WWW Supplier</td>
				<td>
					<input type="button" value="WWW Supplier" onclick="window.open('{{$BASE_URL}}sales_phase_logon.warranty/bsn_id/{{$bsn_id}}', '_blank')">
				</td>
			</tr>
			<tr>
				<td>Problem Photo</td>
				<td>
					{{if $data_log.wa_image_1}}
					<div>
						Photo 1 : <a href="/warranty_log.download_content?file_name={{$data_log.wa_image_1}}&module_name=warranty_log.home" target="_blank">Download</a>
					</div>
					{{/if}}
					{{if $data_log.wa_image_2}}
					<div>
						Photo 2 : <a href="/warranty_log.download_content?file_name={{$data_log.wa_image_2}}&module_name=warranty_log.home" target="_blank">Download</a>
					</div>
					{{/if}}
					{{if $data_log.wa_image_3}}
					<div>
						Photo 3 : <a href="/warranty_log.download_content?file_name={{$data_log.wa_image_3}}&module_name=warranty_log.home" target="_blank">Download</a>
					</div>
					{{/if}}
					{{if $data_log.wa_image_4}}
					<div>
						Photo 4 : <a href="/warranty_log.download_content?file_name={{$data_log.wa_image_4}}&module_name=warranty_log.home" target="_blank">Download</a>
					</div>
					{{/if}}
					{{if $data_log.wa_image_5}}
					<div>
						Photo 5 : <a href="/warranty_log.download_content?file_name={{$data_log.wa_image_5}}&module_name=warranty_log.home" target="_blank">Download</a>
					</div>
					{{/if}}
				</td>
			</tr>
			<tr>
				<td>Video Files</td>
				<td>
					{{if $data_log.wa_video}}
					<a href="/warranty_log.download_content?file_name={{$data_log.wa_video}}&module_name=warranty_log.home" target="_blank">Download</a>
					{{/if}}
				</td>
			</tr>
			<tr>
				<td>Notes</td>
				<td {{if $cell_red eq 1}} style="background:#F00;" {{/if}}>
					{{$notes_text}}
					<br />
					<a href="{{$BASE_URL}}warranty_log.view_notes/wa_id/{{$data_log.wa_id}}" class="various">Notes</a>
					{{$notes_date}}
				</td>
			</tr>			
			<tr>
				<td>Customer Enquiry</td>
				<td {{if $enquiry_pen eq 1 }} style="background: #FF0 ;" {{/if}}>
					<a href="{{$BASE_URL}}warranty_log.view_enquiry/wa_id/{{$data_log.wa_id}}" class="various">Enquiry</a>
				</td>
			</tr>			
			<tr>
				<td>Links</td>
				<td>
					{{if $file_491}}
						<a href="/warranty_log2.download_content?file_name={{$file_491}}&module_name=business.home"
							class="action_checklist" title="{{$file_491}}"
							target="_blank" style="display: block;">{{$doc_name_491|truncate:"70"}}</a>
					{{/if}}
					
					{{if $file_65}}
						<a href="/warranty_log2.download_content?file_name={{$file_65}}&module_name=business.home"
							class="action_checklist" title="{{$file_65}}"
							target="_blank" style="display: block;">{{$doc_name_65|truncate:"70"}}</a>
					{{/if}}
					
					{{if $file_440}}
						<a href="/warranty_log2.download_content?file_name={{$file_440}}&module_name=business.home"
							class="action_checklist" title="{{$file_440}}"
							target="_blank" style="display: block;">{{$doc_name_440|truncate:"70"}}</a>
					{{/if}}
					
					{{if $file_142}}
						<a href="/warranty_log2.download_content?file_name={{$file_142}}&module_name=business.home"
							class="action_checklist" title="{{$file_142}}"
							target="_blank" style="display: block;">{{$doc_name_142|truncate:"70"}}</a>
					{{/if}}
					
					{{if $file_615}}
						<a href="/warranty_log2.download_content?file_name={{$file_615}}&module_name=business.home"
							class="action_checklist" title="{{$file_615}}"
							target="_blank" style="display: block;">{{$doc_name_615|truncate:"70"}}</a>
					{{/if}}
					
					{{if $file_527}}
						<a href="/warranty_log2.download_content?file_name={{$file_527}}&module_name=business.home"
							class="action_checklist" title="{{$file_527}}"
							target="_blank" style="display: block;">{{$doc_name_527|truncate:"70"}}</a>
					{{/if}}
				</td>
			</tr>
			<tr>
				<td>Variation Required</td>
				<td>
					<form name="recmet3" method="post" action="">
						<!--<input type="hidden" name="variation[{{$data_log.wa_id}}]"  />-->
						<label class="switch">
							<input class="switch-input" type="checkbox" name="variation[{{$data_log.wa_id}}]"
								onclick="update_variation({{$data_log.wa_id}},this.checked);" {{if $data_log.wa_variation eq
								1 }} checked="checked" {{/if}}>
							<span class="switch-label" data-on="Yes" data-off="No"></span>
							<span class="switch-handle"></span>
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
			</tr>
			<tr>
				<td>Amount Owed</td>
				<td>
					<p style="margin: 0; padding: 0;">{{$amount_owed}}</p>
					<p style="margin: 0; padding: 0;"><a href="/business.detail/bsn_id/{{$bsn_id}}#country2600" target="_blank">Link</a></p>
				</td>
			</tr>
			<tr>
				<td>Accountability</td>
				<td>
					<input type="button" name="Alert" value="Hot Button"
					onclick="javascript:hot_button({{$bs_business_id}},{{$bs_customers_id}},{{$data_log.wa_id}});" style="width:90px; height:20px; font-size:11px; line-height:17px !important; padding:0px !important">
				</td>
			</tr>
			<tr>
				<td>Google Review</td>
				<td>TBD</td>
			</tr>
			<tr>
				<td>Customer Signed Warranty and Lifetime Workmanship Guarantee - Zoho Sign Live Link</td>
				<td>
					{{if $file_778}}
						<a href="{{$file_778}}" class="action_checklist" target="_blank" style="display: block;">Link</a>
					{{/if}}
				</td>
			</tr>
			<tr>
				<td>Customer Signed Warranty and Lifetime Workmanship Guarantee - Signed</td>
				<td>
					{{if $file_779}}
						<a href="/warranty_log2.download_content?file_name={{$file_779}}&module_name=business.home" class="action_checklist" title="{{$file_779}}" target="_blank" style="display: block;">Download</a>
						{{if $date_uploaded_779}}
							<br>
							{{$date_uploaded_779|date_format:"%d-%m-%Y"}}
						{{/if}}
					{{/if}}
				</td>
			</tr>
			<tr>
				<td>Contact Info</td>
				<td>
					{{$contact_info}}
					<br /><br />
					<a href="{{$BASE_URL}}warranty_log.log_history/wa_project/{{$data_log.wa_project}}" class="various">Log History</a>
				</td>
			</tr>
			<tr>
				<td>Tenanted</td>
				<td>{{$data_log.wa_tenanted}}</td>
			</tr>
			<tr>
				<td>Total Open Logs</td>
				<td>{{$total_open_logs}}</td>
			</tr>
		<tbody>
    </table>

    <script type="text/javascript">
        function closepop() {
            setTimeout('parent.close_win();', 500);
        }
    </script>
    <script>
        function callAjax(formData)
		{
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

		function updateRecord(primaryID, column, value)
		{
			const formData = {
				primaryID: primaryID,
				column: column,
				value: value,
				action: "updateRecord"
			};
			callAjax(formData);
		}
    </script>
</div>