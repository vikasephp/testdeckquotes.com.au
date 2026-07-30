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
			<a href="{{$BASE_URL}}{{ $BASEFOLDER }}.{{ $ATTRIBUTES.topic_type.add_fle_name }}" class="various" title="Add" style="color:#FFF; text-decoration:none; font-size:14px;">
				Add New {{ $ATTRIBUTES.topic_type.name }}
			</a>
		</div>
		<table id="list-table" width="99%">
			<tr>
				<th>S.N.</th>
				<th>Option</th>
				<th>Action</th>
            </tr>
			{{if $resultdata}}
            {{foreach from=$resultdata key="key" item="item"}}
			<tr>
				<td>{{ counter }}</td>
				<td>
					{{ assign var=option_col value=$ATTRIBUTES.topic_type.option_col }}
					{{ $item.$option_col }}
				</td>
				<td>
                    <a href="{{ $BASE_URL }}{{ $BASEFOLDER }}.{{ $ATTRIBUTES.topic_type.add_fle_name }}/{{ $primary_id }}/{{ $item.$primary_id }}" class="various" title="Edit"><img style="height:20px; width:20px;" src="{{ $BASE_URL }}css/admin/images/edit.png" alt="" /></a>
					<a href="{{ $BASE_URL }}{{ $BASEFOLDER }}.{{ $ATTRIBUTES.topic_type.delete_fle_name }}/{{ $primary_id }}/{{ $item.$primary_id }}" onclick="javascript:if(!confirm('Are you sure you want to delete the record?')) return false;" title="Delete"><img style="height: 16px;; width:16px" src="{{ $BASE_URL }}css/admin/images/deletecross.png" alt="" /></a>
				</td>
			</tr>
			{{/foreach}}
			{{else}}
			<tr>
				<td colspan="3" style="text-align:center;">No Data Available</td>
			</tr>
			{{/if}}
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