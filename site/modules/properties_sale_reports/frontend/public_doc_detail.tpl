<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />

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
	<h3 class="page-title"><br />Public Documents</h3>
	<form name="detail" method="post" action="" enctype="multipart/form-data">
		<div style="float:right; margin-right:10px; background: #09F; color:#FFF !important; padding:6px; margin-bottom:5px;">
			<a href="{{$BASE_URL}}{{ $BASEFOLDER }}.add_public_doc/bsn_id/{{$bsn_id}}" class="various" title="Edit" style="color:#FFF; text-decoration:none; font-size:14px;">Add New Public Document</a>
		</div>
		<table id="list-table" width="99%">
			<tr>
				<th width="30%">Document</th>
				<th width="20%">Uploaded Document</th>
				<th width="20%">Link </th>
				<th width="20%">Uploaded By </th>
				<th width="10%">Action</th>
			</tr>
			{{if $public_doc}}
			{{foreach from=$public_doc key="key" item="item"}}
			<tr>
				<td>{{$item.psrpd_doc_name}}</td>
				<td>
					{{if $item.psrpd_file}}
						<a href="{{$BASE_URL}}{{$BASEFOLDER}}.download_content?file_name={{$item.psrpd_file}}&module_name=properties_sale_reports.view_project" target="_blank" title="{{$item.psrpd_file}}">View/Download</a><br/>
						{{$item.psrpd_file_uploaded_by}}<br/>
						{{$item.psrpd_file_uploaded_at|date_format:"%d-%m-%Y"}}
					{{/if}}
				</td>
				<td style="text-align:center;">
					{{if $item.psrpd_doc_link}}
					<a href="{{$item.psrpd_doc_link}}" target="_blank">MSTeams Link</a>
					{{/if}}
				</td>
				<td>
					{{$item.psrpd_updated_by}}
					<br/>{{$item.psrpd_updated_date}}
				</td>
				<td>
					<a href="{{$BASE_URL}}{{ $BASEFOLDER }}.add_public_doc/psrpd_id/{{$item.psrpd_id}}/bsn_id/{{$bsn_id}}" class="various" title="Edit"><img style="height: 20px; width: 20px;" src="{{$BASE_URL}}css/admin/images/edit.png" /></a>
					<a href="{{$BASE_URL}}{{ $BASEFOLDER }}.delete_public_doc/psrpd_id/{{$item.psrpd_id}}/bsn_id/{{$bsn_id}}" onclick="javascript:if(!confirm('Are you sure want to delete this Public Document?')) return false;" title="Delete"> <img style="height: 16px; width:16px" src="{{$BASE_URL}}css/admin/images/deletecross.png" /></a>
				</td>
			</tr>
			{{/foreach}}
			{{else}}
			<tr>
				<td colspan="4" style="text-align:center">No Data Available</td>
			</tr>
			{{/if}}
		</table>
		<br />
		<br />
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
		frmvalidator.addValidation("{{$TABLE}}[al_item]", "req", "Please specify item.");

	</script>
</div>
