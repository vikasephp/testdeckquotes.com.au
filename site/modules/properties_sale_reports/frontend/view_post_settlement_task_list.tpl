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
<div align="center" style="min-height:350px; z-index:9999999;">
	<h3 class="page-title"><br />{{ $page_title }}</h3>
	<form name="detail" method="post" action="" enctype="multipart/form-data">
		<div
			style="float:right; margin-right:10px; background: #09F; color:#FFF !important; padding:6px; margin-bottom:5px;">
			<a href="{{$BASE_URL}}{{ $BASEFOLDER }}.{{ $ATTRIBUTES.post_settlement_task_list.add_fle_name }}" class="various" title="Add" style="color:#FFF; text-decoration:none; font-size:14px;">
				Add New {{ $ATTRIBUTES.post_settlement_task_list.name }}
			</a>
		</div>
		<table id="list-table" width="99%">
			<tr>
				<th style="display:none;">UID</th>
				<th>Sequence</th>
				<th>Procedure Link</th>
				<th>Task Description</th>
				<th>Person Responsible</th>
				<th>Action</th>
            </tr>
			{{if $resultdata}}
            {{foreach from=$resultdata key="key" item="item"}}
			<tr>
				<td style="display:none;">
					{{ assign var=psrlctl_uid value=$ATTRIBUTES.post_settlement_task_list.id }}
					{{ $item.$psrlctl_uid }}
				</td>
				<td>
					{{ assign var=psrlctl_seq value=$ATTRIBUTES.post_settlement_task_list.seq }}
					{{ $item.$psrlctl_seq }}
				</td>
				<td>
					{{ assign var=psrlctl_procedure_link value=$ATTRIBUTES.post_settlement_task_list.procedure_link }}
					{{if $item.$psrlctl_procedure_link}}
					<a href="{{$item.$psrlctl_procedure_link}}" target="_blank">Link</a>
					{{/if}}
				</td>
				<td>
					{{ assign var=psrlctl_task_description value=$ATTRIBUTES.post_settlement_task_list.task_description }}
					{{ $item.$psrlctl_task_description }}
				</td>
				<td>
					{{ assign var=psrlctl_person_responsible value=$ATTRIBUTES.post_settlement_task_list.person_responsible }}
					{{ $item.$psrlctl_person_responsible }}
				</td>
				<td>
                    <a href="{{ $BASE_URL }}{{ $BASEFOLDER }}.{{ $ATTRIBUTES.post_settlement_task_list.add_fle_name }}/{{ $primary_id }}/{{ $item.$primary_id }}" class="various" title="Edit"><img style="height:20px; width:20px;" src="{{ $BASE_URL }}css/admin/images/edit.png" alt="" /></a>
					<a href="{{ $BASE_URL }}{{ $BASEFOLDER }}.{{ $ATTRIBUTES.post_settlement_task_list.delete_fle_name }}/{{ $primary_id }}/{{ $item.$primary_id }}" onclick="javascript:if(!confirm('Are you sure you want to delete the record?')) return false;" title="Delete"><img style="height: 16px;; width:16px" src="{{ $BASE_URL }}css/admin/images/deletecross.png" alt="" /></a>
				</td>
			</tr>
			{{/foreach}}
			{{else}}
			<tr>
				<td colspan="5" style="text-align:center;">No Data</td>
			</tr>
			{{/if}}
		</table>
        <br />
        <br />
		<input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
	</form>
	<script type="text/javascript">
		function closepop() {
			setTimeout(function() {
				parent.$.fancybox.close();
			}, 500);
		}
	</script>
	<script type="text/javascript" language="javascript">
		var frmvalidator = new Validator("detail");
		frmvalidator.EnableMsgsTogether();
	</script>
</div>
<script>
	initSample();
</script>