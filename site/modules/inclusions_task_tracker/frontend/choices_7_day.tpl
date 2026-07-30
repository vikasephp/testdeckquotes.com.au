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
</script>
	
{{if $opr}}
<script type="text/javascript">
    setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<div align="center" style="min-height:350px; padding-top: 40px;">
    <h3 class="page-title">Changed Percentage</h3>
    <table cellpadding="0" cellspacing="0" class="table" id="list-table" style="margin-bottom: 30px;">
        <tr>
            <th>Project</th>
			<th>CCM</th>
            <th>Last Week</th>
            <th>This Week</th>
            <th>Improvement</th>
			<th>% Override</th>
        </tr>
        {{foreach from=$final_list key="index" item="row"}}
        <tr>
            <td>{{$row.project}}</td>
			<td>{{$row.ccm}}</td>
            <td>{{$row.last_week_per}}</td>
            <td>{{$row.this_week_per}}</td>
            <td>{{$row.difference_per}}</td>
			<td>
				<div class="sameLineWrapper">
					<div class="sameLine">
						<form name="recmet2" method="post" action="" style="margin: 0 auto;">
							<input type="hidden" name="percent_override[{{$row.bsn_id}}]" value="0" />
							<label class="switch" style="margin: 0 0 2px 0;">
								<input class="switch-input" type="checkbox" name="percent_override[{{$row.bsn_id}}]" value="1"
									onclick="this.form.submit();" {{if $row.percent_override eq 1 }}
									checked="checked" {{/if}}>
								<span class="switch-label" data-on="Yes" data-off="No"></span>
								<span class="switch-handle"></span> <br>
							</label>
						</form>
					</div>
					<div class="sameLine">
						<a href='/inclusions_task_tracker.update_percent_override_notes/bsn_id/{{$row.bsn_id}}' class="various">Notes</a>
					</div>
				</div>
				{{if $row.percent_override eq 1 }}
				 <div class="">{{$row.override_username}} - {{$row.override_date}}</div>
				{{/if}}
			</td>

        </tr>
        {{/foreach}}
    </table>

    <script type="text/javascript">
        function closepop() {
            setTimeout('parent.close_win();', 500);
        }
    </script>
    <script>
        initSample();
    </script>
</div>