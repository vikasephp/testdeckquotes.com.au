<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tabview/tabcontent.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/tabview/tabcontent.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />

<style>
	#fancybox-wrap {
		z-index: 9999999;
	}

	.tabContent {
		overflow-y: auto;
		height: 700px;
	}

    .tableFixHead table, .tabContent table {
        width: 100%;
    }

	.tabContent thead th {
		position: sticky;
		top: 0;
		text-align: left;
        z-index: 99;
	}

	#fancybox-wrap {
		z-index: 9999999;
	}
    ul#tabs li {
        display: inline-block;
        margin-bottom: 1px;
    }
    ul#tabs li a {
        margin: 0 1px;
        padding: 2px 15px 4px;
        border-color: #000;
    }
    ul#tabs li a.selected {
        color: #000;
        padding: 2px 15px 5px;
    }
    .tab-title {
        font-size: 1.5rem;
        text-align: center;
        margin: 15px 0 30px;
    }
	.table-title {
		font-size: 1.2rem;
		margin: 10px 0 10px;
		display: inline-block;
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
	.tabContent {
		overflow-y: auto;
		height: 700px;
		overflow-x: auto;
		max-width: 2100px;
	}
	.frozen-column {
		position: sticky;
		left: 0;
		z-index: 9998 !important;
	}
	#list-table th.frozen-column:nth-child(2), #list-table td.frozen-column:nth-child(2) {
		left: 36px;
	}
	#list-table th.frozen-column:nth-child(3), #list-table td.frozen-column:nth-child(3) {
		left: 247px;
	}
	#list-table td.frozen-column:nth-child(1), #list-table td.frozen-column:nth-child(2), #list-table td.frozen-column:nth-child(3) {
		z-index: 99999 !important;
		background-color: #fff;
	}
</style>

<script type="text/javascript">
	$(document).ready(function () {
		/*
		*   Examples - images
		*/
		$(".various").fancybox({
			'width': '95%',
			'height': '95%',
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

	function open_popup(type) {
        let viewurl = '';
        if (type == 'manage_procedure') {
            viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.view_procedure" + "/random/" + Math.random();
        }
        else if (type == 'manage_status') {
            viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.{{ $ATTRIBUTES.status.view_file_name }}" + "/random/" + Math.random();
        }
        else if (type == 'manage_schedule_datetime') {
            viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.{{ $ATTRIBUTES.schedule_datetime.view_file_name }}" + "/random/" + Math.random();
        }
        $(document).ready(function () {
            $.fancybox({
                'width': '90%',
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

<h3 class="page-title">{{$title}}</h3>
<br/>
<div class="xray_summary_table">
	<table>
		<tbody>
			<tr>
				<td>Value of leads in Design stage and likely to sign</td><td>{{$totalProjectValueForDesign}}</td>
			</tr>
			<tr>
				<td>Value of work in the Planning and Preparation stage</td><td>{{$totalProjectValueForPlanning}}</td>
			</tr>
			<tr>
				<td>Value of work in Construction but not invoiced yet</td><td>{{$totalUninvoicedConstructionValue}}</td>
			</tr>
		</tbody>
	</table>
</div>

<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
	<div style="display: flex; justify-content: space-between;">
		<div style="text-align: left;">
			<input type="button" value="Procedure Panel" onclick="javascript:open_popup('manage_procedure');" />
			&nbsp;&nbsp;<input type="button" value="Export To Excel" onclick="document.location.href='{{$BASE_URL}}{{$XFA.home}}/export/1'" />
		</div>
	</div>
</form>

<div>
	<div class="tableFixHead">
		<table>
			<thead>
				<tr>
					<th>
						
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<div style="border: 1px solid gray; width: 100%; margin-bottom: 1em; padding: 10px;">
							<div class="tabContent" style="display: block; padding: 0;">
								<!-- {{if $project_type == 'construction'}}
									<h2 class="tab-title">Projects under Construction</h2>
									{{include file=$project_under_construction list=$final_list thead=$thead}}
								{{elseif $project_type == 'planning_and_preparation'}}
									<h2 class="tab-title">Projects under Planning and Preparation</h2>
									{{include file=$project_under_planning_and_preparation list=$final_list thead=$thead}}
								{{elseif $project_type == 'design_stage_and_like_to_sign'}}
									<h2 class="tab-title">Projects under Design Stage and Likely to Sign</h2>
									{{include file=$project_under_design_stage_and_sign list=$final_list thead=$thead}}
								{{/if}} -->
								{{include file=$project_table list=$final_list thead=$thead}}
							</div>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
