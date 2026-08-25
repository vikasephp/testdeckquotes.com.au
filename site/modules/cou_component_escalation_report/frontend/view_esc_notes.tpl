<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />
<script>
	!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />

<div align="center" style="min-height:350px; z-index:9999999;">
	<h3 class="page-title"><br />View Escalation Notes</h3>
	<form name="detail" method="post" action="" enctype="multipart/form-data">
		<div style="float:right; margin-right:10px; background: #09F; color:#FFF !important; padding:6px; margin-bottom:5px;">
			<a href="{{$BASE_URL}}{{$BASEFOLDER}}.add_esc_notes/bsn_id/{{$bsn_id}}" class="various" title="Add" style="color:#FFF; text-decoration:none; font-size:14px;">Add New Escalation Notes</a>
		</div>
		<table id="list-table" width="99%">
			<tr>
				<th width="4%">SrNo</th>
				<th width="40%">Notes</th>
				<th width="18%">Images / Files</th>
				<th width="13%">Added By</th>
				<th width="10%">Date Added</th>
				<th width="8%">Action</th>
			</tr>
			{{if $data}}
				{{assign var="esc_count" value=1}}
				{{foreach from=$data key="keyN" item="itemN"}}
				<tr>
					<td>{{$esc_count}}</td>
					<td>{{$itemN.ccen_notes}}</td>
					<td>
						{{foreach from=$itemN.attachments key="keyA" item="itemA"}}
							<a href="{{$BASE_URL}}{{$BASEFOLDER}}.download_content?file_name={{$itemA.ccena_file_name}}&module_name=cou_component_escalation_attachment.home" title="{{$itemA.ccena_file_name}}" target="_blank" style="display: block;">
								{{if $itemA.ccena_type eq 'image'}}Image{{else}}File{{/if}}: Download
							</a>
						{{/foreach}}
					</td>
					<td>{{$itemN.user_name}}</td>
					<td>{{$itemN.ccen_created_at|date_format:"%d-%m-%Y"}}</td>
					<td>
						<a href="{{$BASE_URL}}{{$BASEFOLDER}}.add_esc_notes/bsn_id/{{$bsn_id}}/ccen_id/{{$itemN.ccen_id}}" class="various" title="Edit"><img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png" /></a>&nbsp;&nbsp;
						<a href="{{$BASE_URL}}{{$BASEFOLDER}}.delete_esc_notes/bsn_id/{{$bsn_id}}/ccen_id/{{$itemN.ccen_id}}"
							onclick="javascript:if(!confirm('Are you sure want to delete this Note?')) return false;"
							title="Delete"> <img style="height: 16px; width:16px" src="{{$BASE_URL}}css/admin/images/deletecross.png" /></a>
					</td>
				</tr>
				{{assign var="esc_count" value=$esc_count+1}}
				{{/foreach}}
			{{else}}
				<tr>
					<td colspan="6" style="text-align:center;">No Notes Available</td>
				</tr>
			{{/if}}
		</table>
		<br>
		<input type="button" name="btnCancelDetail" value="Close" onclick="javascript:parent.$.fancybox.close();" class="vsml" />
	</form>
</div>
