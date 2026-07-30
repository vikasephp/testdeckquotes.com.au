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
.slidecontainer {
    padding: 20px 0 10px;
}
.slider {
	-webkit-appearance: none;
	width: 100%;
	height: 5px;
	background: #06F ;
	outline: none;
	opacity: 0.7;
	-webkit-transition: .2s;
	transition: opacity .2s;
}
.slider:hover {
	opacity: 1;
}
.slider::-webkit-slider-thumb {
	-webkit-appearance: none;
	appearance: none;
	width: 10px;
	height: 20px;
	background: #F00 ;
	cursor: pointer;
}
.slider::-moz-range-thumb {
	width: 10px;
	height: 15px;
	background: #F00;
	cursor: pointer;
}
</style>
<h3 class="page-title">{{$title}}</h3>
<br />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

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
            {{ if $weekPeriod }}
            {{ foreach from=$weekPeriod key="key" item="item" }}
            <tr bgcolor="{{ cycle values='#D3E8D6,WHITE' advance=true }}">
                <td>{{$item.label}}</td>
				<td>${{$item.customer_design_total|number_format:2}}</td>
				<td>${{$item.planning_deposit_total|number_format:2}}</td>
				<td>${{$item.progress_payment_total|number_format:2}}</td>
				<td>${{$item.inclusions_variations_total|number_format:2}}</td>
				<td>${{$item.completed_projects_total|number_format:2}}</td>
				<td>
				{{if $item.rental_weetangera > 0}}
					${{$item.rental_weetangera|number_format:2}}
				{{/if}}
				</td>
				<td>${{$item.total_turnover|number_format:2}}</td>
				<td style="min-width: 100px; padding: 0 10px;">
					<div class="slidecontainer">
						{{assign var="week_reliability_per_week" value=0}}
						{{assign var="week_reliability_user" value=""}}
						{{assign var="week_reliability_date" value=""}}
						{{foreach from=$weekly_data key="key1" item="item1"}}
						{{if $item1.week_period_id eq $item.start_ts}}
							{{assign var="week_reliability_per_week" value=$item1.week_reliability_per_week}}
							{{assign var="week_reliability_user" value=$item1.week_reliability_user}}
							{{assign var="week_reliability_date" value=$item1.week_reliability_date}}
						{{/if}}
						{{/foreach}}
						<input type="range" min="0" max="100" value="{{$week_reliability_per_week}}" class="slider" id="weekly_reliability_slider{{$item.start_ts}}" onchange="update({{$item.start_ts}}, this.value)">
						<p style="margin-top:5px;padding: 0;">
							%: <span id="reliability{{ $item.start_ts }}">{{$week_reliability_per_week}}</span>
						</p>
						<div id="changed_per_list_{{$item.start_ts}}" style="margin-top: 2px;">
							{{if $week_reliability_user}} {{$week_reliability_user}} {{/if}}
							{{if $week_reliability_date}}<br/>{{$week_reliability_date}}{{/if}}
						</div>
						
						<script>
							var slider = document.getElementById("weekly_reliability_slider{{$item.start_ts}}");
							var output{{$item.start_ts}} = document.getElementById("reliability{{ $item.start_ts }}");
							output{{$item.start_ts}}.innerHTML = slider.value;
							slider.oninput = function () {
								output{{$item.start_ts}}.innerHTML = this.value;
							}
							function update(id, value) {
								$.ajax({
									type: "GET",
									url: "{{$BASE_URL}}{{$BASEFOLDER}}.update_per_reliability/start_ts/" + id + "/value/" + value,
									dataType: "json",
									success: function (result) {
										var html = '';
										if(result.week_reliability_user) {
											html += result.week_reliability_user;
										}
										if(result.week_reliability_date) {
											html += '<br/>' + result.week_reliability_date;
										}
										$('#changed_per_list_' + id).html(html);
									}
								});
							}
						</script>
					</div>    
				</td>
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
<br />
<br />
<div class="xray_summary_table">
	<table>
		<tbody>
			<tr>
				<td>Value of leads in Design stage and likely to sign</td>
				<td>{{$totalProjectValueForDesign}}</td>
			</tr>
			<tr>
				<td>Value of work in the Planning and Preparation stage</td>
				<td>{{$totalProjectValueForPlanning}}</td>
			</tr>
			<tr>
				<td>Value of work in Construction but not invoiced yet</td>
				<td>{{$totalUninvoicedConstructionValue}}</td>
			</tr>
		</tbody>
	</table>
</div>
<br />