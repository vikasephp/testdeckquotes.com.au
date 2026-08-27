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
</style>
<script>
	function open_url(type, data = '') {
		let viewurl = '';
		if(type == 'view_qa') {
			viewurl = '/construction_task_tracker.view_qa/tid/' + data.id + '';
		}
		else if(type == 'update_subtask') {
			viewurl = '/business.subtask/bus_id/' + data.bus_id + '/tsid/5/tid/' + data.tid + '';
		}
		else if(type == 'update_task') {
			viewurl = '/business.taskedit/bus_id/' + data.bus_id + '/taskId/' + data.taskId + '';
		}
		else if(type == 'view_result') {
			viewurl = '/construction_task_tracker.view_project_details_result' + '';
		}
		else if (type == 'detail_invoice') {
            viewurl = "{{$BASE_URL}}properties_sale_reports.add_detail_invoice/bsn_id/{{$bsn_id}}/" + "/random/" + Math.random();
        }
		else if (type == 'invoice_type') {
			viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.{{ $ATTRIBUTES.invoice_type.view_fle_name }}" + "/random/" + Math.random();
        }
		else if (type == 'lead_conversion_task_list') {
			viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.{{ $ATTRIBUTES.lead_conversion_task_list.view_fle_name }}" + "/random/" + Math.random();
        }
		else if (type == 'lead_conversion_task_list_specific') {
			viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.{{ $ATTRIBUTES.lead_conversion_task_list_specific.view_fle_name }}" +"/bsn_id/{{$bsn_id}}" + "/random/" + Math.random() ;
        }
		else if (type == 'prep_market_task_list') {
			viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.{{ $ATTRIBUTES.prep_market_task_list.view_fle_name }}" + "/random/" + Math.random();
        }
		else if (type == 'prep_market_task_list_specific') {
			viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.{{ $ATTRIBUTES.prep_market_task_list_specific.view_fle_name }}" + "/bsn_id/{{$bsn_id}}" + "/random/" + Math.random();
        }
		else if (type == 'prop_sale_task_list') {
			viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.{{ $ATTRIBUTES.prop_sale_task_list.view_fle_name }}" + "/random/" + Math.random();
        }
		else if (type == 'prop_sale_task_list_specific') {
			viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.{{ $ATTRIBUTES.prop_sale_task_list_specific.view_fle_name }}" + "/bsn_id/{{$bsn_id}}" + "/random/" + Math.random();
        }
		else if (type == 'exchange_task_list') {
			viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.{{ $ATTRIBUTES.exchange_task_list.view_fle_name }}" + "/random/" + Math.random();
        }
		else if (type == 'exchange_task_list_specific') {
			viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.{{ $ATTRIBUTES.exchange_task_list_specific.view_fle_name }}" + "/bsn_id/{{$bsn_id}}" + "/random/" + Math.random();
        }
		else if (type == 'post_settlement_task_list') {
			viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.{{ $ATTRIBUTES.post_settlement_task_list.view_fle_name }}" + "/random/" + Math.random();
        }
		else if (type == 'post_settlement_task_list_specific') {
			viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.{{ $ATTRIBUTES.post_settlement_task_list_specific.view_fle_name }}" + "/bsn_id/{{$bsn_id}}" + "/random/" + Math.random();
        }
		else if (type == 'under_offer_detail') {
			viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.under_offer_detail" + "/bsn_id/{{$bsn_id}}" + "/random/" + Math.random();
        }
		else if (type == 'enquiries_detail') {
			viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.enquiries_detail" + "/bsn_id/{{$bsn_id}}" + "/random/" + Math.random();
        }
		else if (type == 'enquiry_email') {
			viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.enquiry_email_preview" + "/bsn_id/{{$bsn_id}}" + "/random/" + Math.random();
        }
		else if (type == 'document_email') {
			viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.enquiry_email_document" + "/bsn_id/{{$bsn_id}}" + "/psre_id/" + data + "/random/" + Math.random();
        }
		else if (type == 'public_doc_detail') {
			viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.public_doc_detail" + "/bsn_id/{{$bsn_id}}" + "/random/" + Math.random();
        }
		else if (type == 'enquiry_sms_template') {
			viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.view_enquiry_sms_template" + "/bsn_id/{{$bsn_id}}" + "/random/" + Math.random();
        }
		else if (type == 'send_sms') {
			viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.enquiry_send_sms" + "/bsn_id/{{$bsn_id}}" + "/psre_id/" + data + "/random/" + Math.random();
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
	
	$(document).ready(function() {
		$(".various").fancybox({
			'width': '90%',
			'height': '90%',
			'autoScale': false,
			 'transitionIn' : 'elastic',
			 'transitionOut' : 'elastic',
			 'speedIn' : 300,
			 'speedOut' : 300,
			 'overlayShow' : true,
			 'hideOnOverlayClick':false,
			 'hideOnContentClick':false,
			 'type': 'iframe',
			 'scrolling': 'yes' 
		});
	});
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
                            <li><a href="#" rel="lead_conversion" class="selected">Lead Conversion</a></li>
                            <li><a href="#" rel="preparing_for_market" class="">Preparing for Market</a></li>
                            <li><a href="#" rel="property_for_sale" class="">Property for Sale (Campaign)</a></li>
                            <li><a href="#" rel="exchange" class="">Exchange</a></li>
                            <li><a href="#" rel="post_settlement" class="">Post Settlement</a></li>
                            <li><a href="#" rel="invoices" class="">Invoices</a></li>
                            <li><a href="#" rel="public_documents" class="">Documents</a></li>
							<li><a href="#" rel="under_offer" class="">Under Offer</a></li>
							<li><a href="#" rel="enquiries" class="">Enquiries</a></li>
							<li><a href="#" rel="sms_history" class="">SMS History</a></li>
                        </ul>
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <div style="border: 1px solid gray; width: 100%; margin-bottom: 1em; padding: 10px;">
                            <div id="lead_conversion" class="tabcontent">
                                <h2 class="tab-title">Lead Conversion</h2>
								{{include file=$lead_conversion}}
                            </div>
                            <div id="preparing_for_market" class="tabcontent">
                                <h2 class="tab-title">Preparing for Market</h2>
								{{include file=$preparing_for_market}}
                            </div>
                            <div id="property_for_sale" class="tabcontent">
                                <h2 class="tab-title">Property for Sale (Campaign)</h2>
								{{include file=$property_for_sale}}
                            </div>
                            <div id="exchange" class="tabcontent">
                                <h2 class="tab-title">Exchange</h2>
								{{include file=$exchange}}
                            </div>
                            <div id="post_settlement" class="tabcontent">
                                <h2 class="tab-title">Post Settlement</h2>
								{{include file=$post_settlement}}
                            </div>
                            <div id="invoices" class="tabcontent">
                                <h2 class="tab-title">Invoices</h2>
								{{include file=$invoice_template}}
                            </div>
                            <div id="public_documents" class="tabcontent">
                                <h2 class="tab-title">Documents</h2>
								{{include file=$document}}
							</div>
							<div id="under_offer" class="tabcontent">
                                <h2 class="tab-title">Under Offer</h2>
								{{include file=$under_offer}}
                            </div>
							<div id="enquiries" class="tabcontent">
                                <h2 class="tab-title">Enquiries</h2>
								{{include file=$enquiries}}
                            </div>
							<div id="sms_history" class="tabcontent">
                                <h2 class="tab-title">Buyer SMS History</h2>
								{{include file=$sms_history}}
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

<script>
    function callAjax(formData)
    {
        $.ajax({
            type: "POST",
            url: "{{$BASE_URL}}{{ $BASEFOLDER }}.update_invoice_type",
            data: formData,
            dataType: "json",
            encode: true,
            success: function (data) {
                if (data.success == true) {
                    // alert('You have successfully updated the record');
                }
                else {
                    alert('Some problem in updating the record');
                }
            }
        })
    }

    function updateInvoice(primaryID, column, value)
    {
        const formData = {
            primaryID: primaryID,
            column: column,
            value: value,
            action: "updateInvoice"
        };
        callAjax(formData);
    }
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
