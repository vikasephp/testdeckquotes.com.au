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
    <table cellpadding="0" cellspacing="0" class="table" id="list-table" style="margin-bottom: 30px; width: 800px;">
		<thead>
			<tr>
				<th width="25%">Title</th>
				<th width="75%">Details</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>Rec. No.</td>
				<td>{{$data_log.wa_id}}</td>
			</tr>
			<tr>
				<td>Project</td>
				<td>{{$projectLink}}</td>
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
				<td>Walkthrough Date</td>
				<td>{{$walkthrough_date|date_format:"%d-%m-%Y"}}</td>
			</tr>
			<tr>
				<td>CGFB Responsible</td>
				<td>
					<select name="{{$TABLE}}[wa_cgfb_resp]" Onchange="update_cgfb({{$data_log.wa_id}},this.value)">
						<option value="-1" {{if $data_log.wa_cgfb_resp eq -1}} selected="selected" {{/if}}>Please Select
						</option>
						{{foreach from=$cgfbdetail key="key6" item="item6"}}
						<option value="{{$item6.wc_id}}" {{if $item6.wc_id eq $data_log.wa_cgfb_resp}} selected="selected"
							{{/if}}>{{$item6.wc_cgfb_option}}
						</option>
						{{/foreach}}
					</select>
					<div id="cond{{$item.wa_id}}">{{$data_log.wa_cgfb_user}}<br />{{$data_log.wa_cgfb_date}} </div>

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
					<a href="{{$BASE_URL}}warranty_log.cgfb_notes/wa_id/{{$data_log.wa_id}}" class="various">Notes</a>
				</td>
			</tr>
			<tr>
				<td>Why Not Responsible</td>
				<td>
					<select name="{{$TABLE}}[wa_why_not]" class="myselect"
						Onchange="update_why_not({{$data_log.wa_id}},this.value)">
						<option value="0" {{if $data_log.wa_why_not eq 0}} selected="selected" {{/if}}>Please Select
						</option>
						{{foreach from = $whynotdetail key="key7" item="item7"}}
						<option value="{{$item7.ww_id}}" {{if $item7.ww_id eq $data_log.wa_why_not}} selected="selected"
							{{/if}}>{{$item7.ww_option}}
						</option>
						{{/foreach}}
					</select>
					<div id="why{{$data_log.wa_id}}">{{$data_log.wa_why_not_user}}<br />{{$data_log.wa_why_not_date}} </div>

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
			</tr>
			<tr>
				<td>Include Trades</td>
				<td {{if $wa_selected eq 1}} style="background:#F00;" {{/if}}>
					{{$data_log.wa_include_supplier}}<br/><br/>
					<a href="{{$BASE_URL}}warranty_log.include_suppliers/wa_id/{{$data_log.wa_id}}"
							class="various">Include Trades</a><br /><br />
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
					{{$item.task_name}}<br />
					<a href="{{$BASE_URL}}warranty_log.view_checklist_status/wa_id/{{$data_log.wa_id}}"
							class="various">{{$tot_cd}}/{{$tot_chk}}</a>
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
				<td>Update from Supplier</td>
				<td>
					{{if $data_log.wa_comment || $supplier_upadate}}
					<a href="{{$BASE_URL}}warranty_log.view_update/wa_id/{{$data_log.wa_id}}" class="various">Show</a><br/>
					{{$update_date|date_format:"%d-%m-%Y"}}
					{{/if}}
				</td>
			</tr>
			<tr>
				<td>Tenanted</td>
				<td>{{$data_log.wa_tenanted}}</td>
			</tr>
			<tr>
				<td>Date</td>
				<td>{{$data_log.wa_date}}<br />{{$data_log.wa_user}}</td>
			</tr>
			<tr>
				<td>Days Count</td>
				<td>{{$dayscount}}</td>
			</tr>
			<tr>
				<td>Problem</td>
				<td>{{$data_log.wa_problem}}</td>
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
					{{$notes_text}}<br />
					<a href="{{$BASE_URL}}warranty_log.view_notes/wa_id/{{$data_log.wa_id}}" class="various">Notes</a>
					{{$notes_date}}
				</td>
			</tr>
			<tr>
				<td>Responsible Position</td>
				<td>
					{{$data_log.wa_resp_staff}}
					<a href="{{$BASE_URL}}warranty_log.select_staff/wa_id/{{$data_log.wa_id}}" class="various">Select Staff</a>
				</td>
			</tr>
			<tr>
				<td>Customer Enquiry</td>
				<td {{if $enquiry_pen eq 1 }} style="background: #FF0 ;" {{/if}}>
					<a href="{{$BASE_URL}}warranty_log.view_enquiry/wa_id/{{$data_log.wa_id}}" class="various">Enquiry</a>
				</td>
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
				<td>Variation Required</td>
				<td>
					<form name="recmet3" method="post" action="">
						<!--<input type="hidden" name="variation[{{$data_log.wa_id}}]"  />-->
						<label class="switch">
							<input class="switch-input" type="checkbox" name="variation[{{$data_log.wa_id}}]"
								onclick="update_variation({{$data_log.wa_id}},this.checked);" {{if $data_log.wa_variation eq
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
			</tr>
			<tr>
				<td>Outstanding Invoices</td>
				<td style="pointer-events: none;">
					<label class="switch">
						<input class="switch-input" type="checkbox" name="outstanding_invoices[{{$data_log.wa_id}}]" {{if $data_log.outstanding_invoices eq 1 }} checked="checked" {{/if}} disabled>
						<span class="switch-label" data-on="Yes" data-off="No"></span>
						<span class="switch-handle"></span> <br>
					</label>
				</td>
			</tr>
			<tr>
				<td>Project Balance</td>
				<td>{{$project_balance}}</td>
			</tr>
			<tr>
				<td>Invoices paid</td>
				<td>
					<form name="recmet3" method="post" action="">
						<!--<input type="hidden" name="invoices_paid[{{$data_log.wa_id}}]"  />-->
						<label class="switch">
							<input class="switch-input" type="checkbox" name="invoices_paid[{{$data_log.wa_id}}]"
								onclick="update_invoices_paid({{$data_log.wa_id}},this.checked);" {{if $data_log.wa_invoices_paid eq
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
			</tr>
			<tr>
				<td>Accountability</td>
				<td>
					<input type="button" name="Alert" value="Hot Button"
					onclick="javascript:hot_button({{$bs_business_id}},{{$bs_customers_id}},{{$data_log.wa_id}});" style="width:90px; height:20px; font-size:11px; line-height:17px !important; padding:0px !important" />
				</td>
			</tr>
		<tbody>
    </table>

    <script type="text/javascript">
        function closepop() {
            setTimeout('parent.close_win();', 500);
        }
    </script>
    <script>
        //initSample();
    </script>
</div>