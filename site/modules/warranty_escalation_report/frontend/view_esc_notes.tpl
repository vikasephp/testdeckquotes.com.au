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
	<h3 class="page-title"><br />View Escalation Notes</h3>
	<form name="detail" method="post" action="" enctype="multipart/form-data">
		<div style="float:right; margin-right:10px; background: #09F; color:#FFF !important; padding:6px; margin-bottom:5px;">
			<a href="{{$BASE_URL}}{{$BASEFOLDER}}.add_esc_notes/wa_id/{{$wa_id}}" class="various" title="Edit" style="color:#FFF; text-decoration:none; font-size:14px;">Add New Escalation Notes</a>
		</div>
		<table id="list-table" width="99%">
			<tr>
				<th width="4%">SrNo</th>
				<th width="48%">Notes</th>
				<th width="9%">Attachment</th>
				<th width="13%">Added By</th>
				<th width="8%">Date Added </th>
				<th width="8%">Action</th>
			</tr>
			{{if $data}}
				{{assign var="esc_count" value=1}}
				{{foreach from=$data key="keyN" item="itemN"}}
				<tr>
					<td>{{$esc_count}}</td>
					<td>{{$itemN.elsn_notes}}</td>
					<td>
						{{if $itemN.elsn_attachment_1}}
						<a href="{{$BASE_URL}}{{$BASEFOLDER}}.download_content?file_name={{$itemN.elsn_attachment_1}}&module_name=warranty_escalation_attachment.home" title="{{$itemN.elsn_attachment_1}}" target="_blank" style="display: block;">Download</a>
						{{/if}}
						{{if $itemN.elsn_attachment_2}}
						<a href="{{$BASE_URL}}{{$BASEFOLDER}}.download_content?file_name={{$itemN.elsn_attachment_2}}&module_name=warranty_escalation_attachment.home" title="{{$itemN.elsn_attachment_2}}" target="_blank" style="display: block;">Download</a>
						{{/if}}
					</td>
					<td>
						{{$itemN.user_name}}
					</td>
					<td>{{$itemN.elsn_created_at|date_format:"%d-%m-%Y"}}</td>
					<td>
						<a href="{{$BASE_URL}}{{$BASEFOLDER}}.add_esc_notes/wa_id/{{$wa_id}}/elsn_id/{{$itemN.elsn_id}}" class="various" title="Edit"><img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png" /></a>&nbsp;&nbsp;
						<a href="{{$BASE_URL}}{{$BASEFOLDER}}.delete_esc_notes/wa_id/{{$wa_id}}/elsn_id/{{$itemN.elsn_id}}"
								onclick="javascript:if(!confirm('Are you sure want to delete this Note?')) return false;"
								title="Delete"> <img style="height: 16px;; width:16px" src="{{$BASE_URL}}css/admin/images/deletecross.png" /></a>
					</td>
				</tr>
				{{assign var="esc_count" value=$esc_count+1}}
				{{/foreach}}
			{{else}}
				<tr>
					<td colspan="5" style="text-align:center;">No Notes Available</td>
				</tr>
			{{/if}}
		</table>
		<br>
		<br>
		<input type="button" name="btnCancelDetail" value="Close" onclick="javascript:parent.$.fancybox.close();" class="vsml" />
	</form>

	<script type="text/javascript">
		function closepop() {
			setTimeout('parent.close_win();', 500);
		}
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