<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
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
	<h3 class="page-title" style="margin: 30px 0;">COMPLETED INSEPECTION LOGS</h3>
	<div name="detail" method="post" action="" enctype="multipart/form-data">
		<table id="list-table" width="99%">
			<tr>
				<th>Rec. No</th>
				<th>Project</th>
				<th>Problem</th>
				<th>Inspection Type</th>
				<th>Inspectors</th>
				<th>Inspection timestamp</th>
				<th>Mark as Closed</th>
            </tr>
            {{foreach from=$list key="key" item="item"}}
			<tr>
				<td>
					<a href="/warranty_log2.view_log_detail/wa_id/{{$item.wa_id}}" target="_blank">{{$item.wa_id}}</a>					
				</td>
				<td>{{$item.wa_project}}</td>
				<td>{{$item.wa_problem}}</td>
				<td>{{$item.wa_inspection_type}}</td>
				<td>{{$item.warranty_log_inspectors}}</td>
				<td>{{$item.wa_is_inspection_fee_required_completed_date}}</td>
				<td>
					<form name="recmet3" method="post" action="">
						<input type="hidden" name="wa_status[{{$item.wa_id}}]" value="Open" />
						<label class="switch">
							<input type="checkbox" class="switch-input" name="wa_status[{{$item.wa_id}}]" value="Closed" onclick="this.form.submit();" {{if $item.wa_status == 'Closed'}} checked="checked" {{/if}}>
							<span class="switch-label" data-on="Yes" data-off="No"></span>
							<span class="switch-handle"></span>
						</label>
					</form>
				</td>
			</tr>
			{{/foreach}}
		</table>
        <br /><br />
		<input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
	</div>
</div>
<script>
	function closepop() {
		setTimeout('parent.close_win();', 500);
	}
</script>