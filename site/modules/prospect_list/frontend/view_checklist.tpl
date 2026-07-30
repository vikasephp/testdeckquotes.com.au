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

	/*.tableFixHead {
		overflow-y: auto;
		height: 700px;
	}*/

    .tableFixHead table {
        width: 100%;
    }

	.tableFixHead thead th {
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

	.tableFixHead thead th {
		position: sticky;
		top: 0;
		text-align: left;
	}

	table {
		border-collapse: collapse;
		width: 100%;
	}

	th {
		z-index: 9999;
	}
	.text-left {
		text-align: left;
	}
	.inner-tab-title {
		margin: 0;
	}
	.table-heading-content {
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
</style>

<script>
	$(document).ready(function () {
		$(".various").fancybox({
			'width': '95%',
			'height': '90%',
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
	
	function open_url(type) {
		let viewurl = '';
		if (type == 'add_finance_detail') {
			viewurl = "{{$BASE_URL}}{{$BASEFOLDER}}.add_financial_report/bsn_id/{{$bsn_id}}/random/" + Math.random();
        }
		else if (type == 'add_invoices_detail') {
			viewurl = "{{$BASE_URL}}{{$BASEFOLDER}}.add_invoices_report/bsn_id/{{$bsn_id}}/random/" + Math.random();
        }
		else if (type == 'lead_procedure') {
			viewurl = "{{$BASE_URL}}{{$BASEFOLDER}}.view_lead_procedure/bsn_id/{{$bsn_id}}/random/" + Math.random();
        }
		else if (type == 'onboarding_procedure') {
			viewurl = "{{$BASE_URL}}{{$BASEFOLDER}}.view_onboarding_procedure/bsn_id/{{$bsn_id}}/random/" + Math.random();
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

<div id="search_section" style="margin-top: 40px;">
	<form name="mlist" method="post" enctype="multipart/form-data">
		
	</form>
</div>
<div>
	<div class="tableFixHead">
        <table>
            <thead>
                <tr>
                    <th>
                        <ul id="tabs" class="shadetabs" style="text-align: center;">
                            <li><a href="#" rel="lead_generation" class="selected">Lead Generation</a></li>
                            <li><a href="#" rel="onboarding" class="">Onboarding</a></li>
                            <li><a href="#" rel="relevant_documents" class="">Relevant Documents</a></li>
                            <li><a href="#" rel="finance" class="">Finance</a></li>
                        </ul>
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <div style="border: 1px solid gray; width: 100%; margin-bottom: 1em; padding: 10px;">
                            <div id="lead_generation" class="tabcontent">
                                <h2 class="tab-title">Lead Generation</h2>
								{{include file=$lead_template}}
                            </div>
                            <div id="onboarding" class="tabcontent">
                                <h2 class="tab-title">Onboarding</h2>
								{{include file=$onboarding_template}}
                            </div>
                            <div id="relevant_documents" class="tabcontent">
                                <h2 class="tab-title">Relevant Documents</h2>
							
                            </div>
                            <div id="finance" class="tabcontent">
                                <h2 class="tab-title">Finance</h2>
								{{include file=$finance_template}}
								{{include file=$invoices_template}}
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



<!-- Store Active Tab -->
<script>
document.addEventListener('DOMContentLoaded', function() {

    const lastTab = localStorage.getItem('activeTab');
	console.log("Last Tab is "+lastTab);
    if (lastTab) {
        openTab(lastTab);
    }

    document.querySelectorAll('#tabs a').forEach(tab => {
        tab.addEventListener('click', function(e) {
            e.preventDefault();
            const rel = this.getAttribute('rel');
            localStorage.setItem('activeTab', rel);
            openTab(rel);
        });
    });

});

function openTab(tabId) {

    document.querySelectorAll('.tabcontent').forEach(div => {
        div.style.display = 'none';
    });

    document.querySelectorAll('#tabs a').forEach(a => {
        a.classList.remove('selected');
    });

    const content = document.getElementById(tabId);
    if (content) {
        content.style.display = 'block';
    }

    const activeTab = document.querySelector('#tabs a[rel="' + tabId + '"]');
	console.log("Active tab is ", activeTab);
    if (activeTab) {
        activeTab.classList.add('selected');
    }
}
</script>
