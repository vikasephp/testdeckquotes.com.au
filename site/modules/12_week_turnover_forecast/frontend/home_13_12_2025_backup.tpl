<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
{{include file=$jdata}}
{{include file=$tiny_basic}}
<script>
    !window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
<script>

    function open_popup(type) {
        let viewurl = '';
        if (type == 'manage_procedure') {
            viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.view_procedure" + "/random/" + Math.random();
        }
        $(document).ready(function () {
            $.fancybox({
                'width': '90%',
                'height': '99%',
                'autoScale': false,
                'transitionIn': 'elastic',
                'transitionOut': 'elastic',
                'speedIn': 400,
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
<style>
.textarea {
	width: 90%;
}
.select {
	width: 100%;
}
.xray_summary_table table {
	border-collapse: collapse;
	font-size: 13px;
	font-weight: bold;
}
.xray_summary_table table td {
	border: 1px solid #000;
	padding: 5px;
}
</style>
<h3 class="page-title">{{$title}}</h3>
<br />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

<div class="xray_summary_table">
	<table>
		<tbody>
			<tr>
				<td>Value of leads in Design stage and likely to sign</td><td>TBD</td>
			</tr>
			<tr>
				<td>Value of work in the Planning and Preparation stage</td><td>TBD</td>
			</tr>
			<tr>
				<td>Value of work in Construction but not invoiced yet</td><td>TBD</td>
			</tr>
		</tbody>
	</table>
</div>
<br />
<br />

<form name="mlist" method="post" enctype="multipart/form-data">
    <div style="float:left; text-align:left;">
        <div>
            <input type="button" name="sr_proc_panel" value="Procedure Panel" onclick="javascript:open_popup('manage_procedure');" style="display:none;">
        </div>
    </div>
    <div style="float: right; text-align: right;">
        <div></div>
    </div>
</form>

<div id="">
    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
                <th class="topmenu" align="center" valign="middle">Week Period</th>
                <th class="topmenu" align="center" valign="middle">Customer Design</th>
                <th class="topmenu" align="center" valign="middle">Planning Deposits</th>
                <th class="topmenu" align="center" valign="middle">Progress Payments</th>
                <th class="topmenu" align="center" valign="middle">Inclusions/ Variations</th>
                <th class="topmenu" align="center" valign="middle">Completed Projects</th>
				<th class="topmenu" align="center" valign="middle">Rental Weetangera</th>
				<th class="topmenu" align="center" valign="middle">Total Turnover</th>
				<th class="topmenu" align="center" valign="middle">Reliability Slider</th>
            </tr>
        </thead>
        <tbody>
            {{ if $weeklyData }}
            {{ foreach from=$weeklyData key="key" item="item" }}
            <tr bgcolor="{{ cycle values='#D3E8D6,WHITE' advance=true }}">
                <td>{{$item.start_date}} - {{$item.end_date}}</td>
				<td>{{$item.cda_value_sum}}</td>
				<td>{{$item.planning_value_sum}}</td>
				<td>$0</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
            </tr>
            {{ /foreach }}
            {{ else }}
            <tr bgcolor="WHITE">
                <td colspan="9" style="text-align: center;">No Data Available</td>
            </tr>
            {{/if}}
        </tbody>
    </table>
</div>