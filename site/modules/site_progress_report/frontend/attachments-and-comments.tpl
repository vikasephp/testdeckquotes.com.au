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
	<h3 class="page-title"><br />{{ $MODULE_PLURAL }}</h3>
	<form name="detail" method="post" action="" enctype="multipart/form-data">
		<table id="list-table" width="99%">
			<tr>
				<th width="65%">Attachments & Comments</th>
				<th>Status</th>
				<th>Date Submitted</th>
				<th>Submitted By</th>
            </tr>
            {{foreach from=$records key="key" item="item"}}
			<tr>
				<td>
					{{if $item.site_progress_report_attachments}}
						<table width="100%">
							<!-- <tr>
								<th width="20%">Attachment</th>
								<th width="80%">Comment</th>
							</tr> -->
							{{assign var=site_progress_report_attachments value=$item.site_progress_report_attachments}}
							{{foreach from=$site_progress_report_attachments key="index" item="site_progress_report_attachment"}}
								<tr>
									<td width="20%">
										{{if $site_progress_report_attachment.spra_attachment}}
											<a href="/site_progress_report.download_content?file_name={{$site_progress_report_attachment.spra_attachment}}&module_name=site_progress_report.home" target="_blank">Download</a>
										{{/if}}
									</td>
									<td width="70%">{{$site_progress_report_attachment.spra_comment}}</td>
									<td data-col="action" width="10%">
										<a href="{{$BASE_URL}}site_progress_report.edit_attachment_comment/spra_id/{{$site_progress_report_attachment.spra_id}}/spra_sp_id/{{$site_progress_report_attachment.spra_sp_id}}" class="various" title="Edit"><img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png" alt=""></a>
										<a href="{{$BASE_URL}}site_progress_report.delete_attachment_comment/spra_id/{{$site_progress_report_attachment.spra_id}}/spra_sp_id/{{$site_progress_report_attachment.spra_sp_id}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/delete.png" alt=""></a>
									</td>
								</tr>
							{{/foreach}}
						
						</table>
					{{else}}
						<span style="text-align: center; color: red;">No Record</span>
					{{/if}}
				</td>
				<td>
					{{if $item.sp_sprs_id > 0}}
					{{foreach from=$data_status key="key_st" item="item_st"}}
						{{if $item_st.sprs_id eq $item.sp_sprs_id}}
							{{$item_st.sprs_option}}
						{{/if}}
					{{/foreach}}
					{{/if}}
				</td>
				<td>{{$item.sp_created_at}}</td>
				<td>{{$item.sp_created_by}}</td>
			</tr>
			{{/foreach}}
		</table>
        <br />
        <br />
		<input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
	</form>
	<script type="text/javascript">
		function closepop() {
			setTimeout('parent.close_win();', 500);
		}
	</script>
	<script type="text/javascript" language="javascript">
		var frmvalidator = new Validator("detail");
		frmvalidator.EnableMsgsTogether();
		frmvalidator.addValidation("{{$TABLE}}[al_item]", "req", "Please specify item.");
	</script>
</div>
<script>
	initSample();
</script>