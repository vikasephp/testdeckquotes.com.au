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

<h3 class="page-title" style="margin-bottom: 50px;">{{$title}}</h3>

<form name="mshort" action="{{$BASE_URL}}{{$XFA.home}}" method="post">
	<div style="display: flex; justify-content: space-between;">
		<div style="text-align: left;">
			<!-- <input type="button" value="Procedure Panel" onclick="javascript:open_popup('manage_procedure');" /> -->
		</div>
	</div>
</form>

<div>
	<div class="tableFixHead">
		<table>
			<thead>
				<tr>
					<th>
						<ul id="tabs" class="shadetabs" style="text-align: center;">
							<li><a href="javascript:void(0);" rel="warranty_log" class="selected">Warranty Log</a></li>
							<li><a href="javascript:void(0);" rel="warranty_website">Warranty Website</a></li>
							<li><a href="javascript:void(0);" rel="inspection_app">Inspection App</a></li>
						</ul>
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<div style="border: 1px solid gray; width: 100%; margin-bottom: 1em; padding: 10px;">
							<div id="warranty_log" class="tabcontent">
								<h2 class="tab-title">Warranty Log</h2>
								{{include file=$warranty_log}}
							</div>
							<div id="warranty_website" class="tabcontent">
								<h2 class="tab-title">Warranty Website</h2>
								{{include file=$warranty_website}}
							</div>
							<div id="inspection_app" class="tabcontent">
								<h2 class="tab-title">Inspection App</h2>
								{{include file=$inspection_app}}
							</div>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>

<script>
    animatedcollapse.addDiv('michael1', 'fade=1');
    animatedcollapse.init();

    const tabs = new ddtabcontent("tabs");
    tabs.setpersist(true);
    tabs.setselectedClassTarget("link"); //"link" or "linkparent"
    tabs.init();
</script>
	