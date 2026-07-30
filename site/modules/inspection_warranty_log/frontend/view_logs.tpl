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
				'scrolling': 'yes',
				// 'showCloseButton': false,
				// 'onClosed': function() {
				// 	// Select elements inside the popup and change their click method
				// 	// $("#fancybox-close").off('click').on('click', function() {
				// 	// 	alert("New click logic executed!");
				// 	// });
				// 	console.log('working');
				// }
			});
		});
	}
</script>
<div align="center" style="min-height:350px; z-index:9999999;">
	<h3 class="page-title" style="margin: 30px 0;">{{ $MODULE_PLURAL }}</h3>
	<form name="detail" method="post" action="" enctype="multipart/form-data">
		<table id="list-table" width="99%">
			<tr>
				<th>Rec. No</th>
				<th>Problem</th>
				<th>Inspection Type</th>
				<th>Status</th>
				<!-- <th>Record Created in APP</th> -->
				<th>Triggered By</th>
				<th>Inspectors</th>
				<!-- <th>Notes</th> -->
				<th>Date Created</th>
				<th>Acceptance time stamp</th>
				<th>Cancellation time stamp</th>
				<th>Last Customer Login</th>
            </tr>
            {{ assign var=status_option_id value=$ATTRIBUTES.status.id }}
            {{ assign var=status_foreign_id value=$ATTRIBUTES.status.foreign_id }}
            {{ assign var=status_option_col value=$ATTRIBUTES.status.option_col }}            
            {{foreach from=$list key="key" item="item"}}
			<tr>
				<td>
					<a href="/warranty_log2.view_log_detail/wa_id/{{$item.wa_id}}" target="_blank">{{$item.wa_id}}</a>					
				</td>
				<td>{{$item.wa_problem}}</td>
				<td>{{$item.wa_inspection_type}}</td>
				<td>
					<div style="display: flex; flex-direction: column; gap: 8px;">
						<div>
							{{$item.inspection_status}}
							{{if $item.wa_is_inspection_fee_required_inspection_completed}}
								<br>
								{{$item.wa_is_inspection_fee_required_completed_date}}
							{{/if}}
						</div>
						<div>
							<p id="view_status_main{{$item.wa_id}}">
								<a
									href="javascript:void(0);"
									onclick="
										let view_status_at{{$item.wa_id}} = document.getElementById('view_status_at{{$item.wa_id}}');
										if(view_status_at{{$item.wa_id}}.style.display == 'none') {
											view_status_at{{$item.wa_id}}.style.display = 'block';
										}
										else {
											view_status_at{{$item.wa_id}}.style.display = 'none';
										}
										
									"
								>Status History</a>
							</p>
							<table id="view_status_at{{$item.wa_id}}" style="display: none; width: 100%;">
								{{$item.status_history_table}}
							</table>
						</div>
						{{if $item.inspection_schedule}}
							<div>
								<p id="view_schedule_main{{$item.wa_id}}">
									<a
										href="javascript:void(0);"
										onclick="
											let view_schedule_at{{$item.wa_id}} = document.getElementById('view_schedule_at{{$item.wa_id}}');
											if(view_schedule_at{{$item.wa_id}}.style.display == 'none') {
												view_schedule_at{{$item.wa_id}}.style.display = 'block';
											}
											else {
												view_schedule_at{{$item.wa_id}}.style.display = 'none';
											}
											
										"
									>View Schedule</a>
								</p>
								<p id="view_schedule_at{{$item.wa_id}}" style="display: none;">
									<strong style="color: blue;">{{$item.inspection_schedule}}</strong>
								</p>
							</div>
						{{/if}}	
					</div>
				</td>
				<!-- <td>Yes</td> -->
				<td>{{$item.wa_is_inspection_fee_required_user}}</td>
				<td>{{$item.warranty_log_inspectors}}</td>
				<!-- <td>
					<a href="{{$BASE_URL}}{{$BASEFOLDER}}.view_notes/wa_id/{{$item.wa_id}}" class="various">Notes</a>
				</td> -->
				<td style="white-space: nowrap;">{{$item.wa_is_inspection_fee_required_date}}</td>
				<td>{{$item.wa_is_inspection_fee_required_accepted_date}}</td>
				<td>{{$item.wa_is_inspection_fee_required_cancelled_date}}</td>
				<td>{{$item.last_login_date}}</td>
			</tr>
			{{/foreach}}
		</table>
        <br /><br />
		<input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
	</form>
</div>
<script>
	function closepop() {
		setTimeout('parent.close_win();', 500);
	}
	function allowNumbersOnly(e) {
		const charCode = (e.which) ? e.which : e.keyCode;
		// Allow numbers (48-57), backspace (8), delete (46), tab (9), enter (13), arrow keys (37-40)
		if ((charCode >= 48 && charCode <= 57) || (charCode >= 96 && charCode <= 105) || charCode === 8 || charCode === 46 || charCode === 9 || charCode === 13 || (charCode >= 37 && charCode <= 40)) {
			return true;
		} else {
			e.preventDefault(); // Prevent non-numeric characters
			return false;
		}
	}
    function callAjax(formData)
    {
        $.ajax({
            type: "POST",
            url: "{{$BASE_URL}}{{ $BASEFOLDER }}.ajax_handler",
            data: formData,
            dataType: "json",
            encode: true,
            success: function (data) {
                if (data.success) {
					if(formData.column == 'wa_inspection_acknowledgement_statement') {
						const id = formData.column + '_' + formData.primaryID;
						$('#' + id).remove();
					}
                }
                else {
                    alert('Some problem in updating the record');
                }
            }
        })
    }

    function updateRecord(primaryID, column, value)
    {
		const formData = {
            primaryID: primaryID,
            column: column,
            value: value,
            action: "updateRecord"
        };
        callAjax(formData);
    }

    function updateRecords(primaryID, column, className)
    {
        i = 0;
        let value = [];
        $('.' + className + ':checked').each(function () {
            value[i++] = $(this).val();
        });
        const formData = {
            primaryID: primaryID,
            column: column,
            value: JSON.stringify(value),
            action: "updateRecord"
        };
        callAjax(formData);
    }

    function displayToggle(record_id, c, t) {
        let activeStatus = 0;
        if ($(t).is(":checked")) {
            activeStatus = 1;
        }
        const formData = {
            r_ID: record_id,
            column: c,
            activeStatus: activeStatus,
            action: "displayToggle"
        };
        callAjax(formData);
    }
</script>