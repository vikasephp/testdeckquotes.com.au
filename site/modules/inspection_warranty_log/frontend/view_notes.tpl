<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>

<script>
	!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />

{{if $opr}}
<script type="text/javascript">
	window.location.href = "{{$BASE_URL}}{{$BASEFOLDER}}.view_logs/bsn_id/{{$bsn_id}}";
</script>
{{/if}}

<script type="application/javascript">
	function add_new(url) {
		//var viewurl = "{{$BASE_URL}}designer_tracker.detail"+ "/random/" + Math.random();	
		var viewurl = url;
		$(document).ready(function () {
			$.fancybox({
				'width': '99%',
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
<div align="center" style="min-height:350px; z-index:9999999;">
	<h3 class="page-title"><br />View Notes</h3>
	<form name="detail" method="post" action="" enctype="multipart/form-data">
		<div style="float:right; margin-right:10px; background: #09F; color:#FFF !important; padding:6px; margin-bottom:5px;">
			<a href="{{$BASE_URL}}warranty_log.add_notes/wa_id/{{$wa_id}}" class="various" title="Edit" style="color:#FFF; text-decoration:none; font-size:14px;">Add New Notes</a>
		</div>
		<table id="list-table" width="99%">
			<tr>
				<th width="4%">SrNo</th>
				<th width="55%">Notes</th>
				<th width="15%">Added By</th>
				<th width="8%">Date Added </th>
				<th>Due Date</th>
				<!-- <th>Attachment</th> -->
				<th>Resolved</th>
				<th width="10%">Notes From</th>
				<th width="8%">Action</th>
			</tr>
			{{if $dataN}}
				{{assign var="counter" value=1}}
				{{foreach from=$dataN key="keyN" item="itemN"}}
				<tr date-diff="{{$itemN.diff_date}}" {{if $itemN.resolved_status eq 1 }}style="background:#FFF;"{{elseif $itemN.diff_date lt 0 }} style="background:#F00;" {{/if}}>
					<td>{{$counter}}</td>
					<td>{{$itemN.notes}}</td>
					<td>
						<!--{{$itemN.added_by}}-->
						{{assign var=added_by value=$itemN.added_by}}
						{{$added_by|replace:"(Customer Enquiry)":""}}
					</td>
					<td>{{$itemN.date|date_format:"%d-%m-%Y"}}</td>
					<td>
						{{if $itemN.source_table != 'warranty_log_cgfbdirectcosts_notes' }}
						<!--{{$itemN.due_date|date_format:"%d-%m-%Y"}}-->
						<input type="text" name="due_date[{{$itemN.id}}]" value="{{$itemN.due_date|date_format:'%d-%m-%Y'}}"
								class="w16em dateformat-d-ds-m-ds-Y" id="demo2_{{$itemN.id}}"
								onfocus="update_due_date({{$itemN.id}}, this.value);" style="width:80px;" />
						{{if $itemN.source_table == 'warranty_log_notes' }}
						<script>
							function update_due_date(id, value) {
								$.ajax({
									type: "GET",
									url: "{{$BASE_URL}}warranty_log.update_due_date_wn/wn_id/" + id + "/value/" + value,
									success: function (result) {
									}
								});
							}
						</script>
						{{elseif $itemN.source_table == 'warranty_supplier_update' }}
						<script>
							function update_due_date(id, value) {
								$.ajax({
									type: "GET",
									url: "{{$BASE_URL}}warranty_log.update_due_date_ws/ws_id/" + id + "/value/" + value,
									success: function (result) {
									}
								});
							}
						</script>
						{{/if}}
						{{/if}}
					</td>
					<!-- <td>
						{{if $itemN.attachment}}
							<a href="/warranty_log.download_content?file_name={{$itemN.attachment}}&module_name=warranty_log.notes" target="_blank">Download 1</a>
						{{/if}}
						
						{{if $itemN.attachment2}}
							<a href="/warranty_log.download_content?file_name={{$itemN.attachment2}}&module_name=warranty_log.notes" target="_blank">Download 2</a>
						{{/if}}
						
						{{if $itemN.attachment3}}
							<a href="/warranty_log.download_content?file_name={{$itemN.attachment3}}&module_name=warranty_log.notes" target="_blank">Download 3</a>
						{{/if}}
						
						{{if $itemN.attachment4}}
							<a href="/warranty_log.download_content?file_name={{$itemN.attachment4}}&module_name=warranty_log.notes" target="_blank">Download 4</a>
						{{/if}}
						
						{{if $itemN.attachment5}}
							<a href="/warranty_log.download_content?file_name={{$itemN.attachment5}}&module_name=warranty_log.notes" target="_blank">Download 5</a>
						{{/if}}

						{{if $itemN.attachment6}}
							<a href="/warranty_log.download_content?file_name={{$itemN.attachment6}}&module_name=warranty_log.notes" target="_blank">Download 6</a>
						{{/if}}
					</td> -->
					<td>
						{{if $itemN.source_table != 'warranty_log_cgfbdirectcosts_notes' }}
						<form name="recmet3" method="post" action="">
							<input type="hidden" name="resolved[{{$itemN.id}}]" value="{{$itemN.resolved_status}}">
							<label class="switch">
								<input class="switch-input" type="checkbox" name="resolved[{{$itemN.id}}]"
									onclick="update_resolved({{$itemN.id}}, '{{$itemN.source_table}}', this.checked)" {{if $itemN.resolved_status eq 1
									}} checked="checked" {{/if}}>
								<span class="switch-label" data-on="Yes" data-off="No"></span>
								<span class="switch-handle"></span> <br>
							</label>
						</form>
						<script>
							function update_resolved(id, table, value) {
								var val = 0;
								if (value == true) { val = 1; }
								if (value == false) { val = 0; }
								$.ajax({
									type: "GET",
									url: "{{$BASE_URL}}warranty_log.update_resolved/id/" + id + "/table/"+ table + "/value/" + val,
									success: function (result) {
									}
								});
							}
						</script>
						{{/if}}
					</td>
					<td>
						{{if $itemN.source_table == 'warranty_log_cgfbdirectcosts_notes'}}
						CGFB Direct Cost
						{{elseif $itemN.source_table == 'warranty_supplier_update'}}
							{{assign var=added_by value=$itemN.added_by}}
							{{if $added_by|strpos:"Warranty Admin" !== false}}
								Warranty Admin
							{{else}}
								Supplier Notes
							{{/if}}
						{{elseif $itemN.source_table == 'warranty_log_notes'}}
						{{assign var=added_by value=$itemN.added_by}}
						{{if $added_by|strpos:"(Customer Enquiry)" !== false}}
							Customer Enquiry
						{{else}}
						{{/if}}

						{{/if}}
					</td>
					<td table="{{$itemN.source_table}}">
						{{if $itemN.source_table != 'warranty_supplier_update' && $itemN.source_table != 'warranty_log_cgfbdirectcosts_notes' }}
							<a href="{{$BASE_URL}}warranty_log.add_notes/wn_id/{{$itemN.id}}/wa_id/{{$wa_id}}"
								class="various" title="Edit">
								<img style="height:20px; width:20px;"
									src="{{$BASE_URL}}css/admin/images/edit.png" /></a>&nbsp;&nbsp;
							<a href="{{$BASE_URL}}warranty_log.delete_notes/wn_id/{{$itemN.id}}/wa_id/{{$wa_id}}"
								onclick="javascript:if(!confirm('Are you sure want to delete this Note?')) return false;"
								title="Delete"> <img style="height: 16px;; width:16px"
									src="{{$BASE_URL}}css/admin/images/deletecross.png" /></a>
						{{/if}}
					</td>
				</tr>
				{{assign var="counter" value=$counter+1}}
				{{/foreach}}
			{{/if}}
		</table>
		<br>
		<br>
		<input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
	</form>

	<script type="text/javascript">
		function closepop() {
			window.location.href = "{{$BASE_URL}}{{$BASEFOLDER}}.view_logs/bsn_id/{{$bsn_id}}";
		}
		// $(document).on('click', '#fancybox-close', function() {
		// 	closepop();
		// });
		// const close = document.getElementById("fancybox-close");
		// console.log(close);
		// close.addEventListener("click", closepop());
		// console.log($('#fancybox-wrap').contents().find('#fancybox-close').hide());
		// $('#fancybox-wrap').contents().find('#fancybox-close').on('click', closepop());
		// console.log($('#fancybox-frame').contents().find('#fancybox-close').on('click', closepop()));
	</script>

	<script type="text/javascript" language="javascript">
		var frmvalidator = new Validator("detail");
		frmvalidator.EnableMsgsTogether();
		//frmvalidator.addValidation("{{$TABLE}}[al_item]", "req", "Please specify item.");

	</script>
</div>

<script>
	//initSample();
</script>