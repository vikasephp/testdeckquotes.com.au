<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
{{include file=$jdata}}
{{include file=$tiny_basic}}
<script>
    !window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>
<style>
button[type=button], button {
    padding: 5px 5px;
    height: 27px;
    border-top: 1px solid #5C5C5C;
    border-left: 1px solid #5C5C5C;
    border-bottom: 1px solid rgba(0, 0, 0, 0.1);
    border-right: 1px solid rgba(0, 0, 0, 0.1);
    border-radius: 4px;
    -moz-border-radius: 4px;
    -khtml-border-radius: 4px;
    -webkit-border-radius: 4px;
    width: auto;
    margin-bottom: 5px;
    background: url('/css/default/images/button1_bg.gif') top repeat-x;
    font-size: 14px;
    color: #fff;
    line-height: 25px;
    text-decoration: none;
    text-transform: uppercase;
    padding: 0 10px;
    position: relative;
    cursor: pointer;
    font-style: italic;
}
</style>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>

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
		else if (type == 'email_history') {
            viewurl = "{{$BASE_URL}}{{ $BASEFOLDER }}.email_history" + "/random/" + Math.random();
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
<br />
<form name="mlist" method="post" enctype="multipart/form-data">
    <div style="float:left; text-align:left;">
		&nbsp;<input type="button" value="Procedure Panel" onclick="javascript:open_popup('manage_procedure');" />
    </div>
</form>

<div id="">

<br>
<div style="padding: 10px; display: flex; align-items: center; gap: 10px;">
    <strong>Search Project:</strong>
    <input type="text" id="eventSearch" placeholder="Type Project Name" style="padding: 8px; width: 300px; border: 1px solid #ccc; border-radius: 4px;">
	
	<br/>
	
	<strong>Location:</strong>
    <select id="locationFilter" style="padding: 8px; border: 1px solid #ccc; border-radius: 4px;">
        <option value="">All</option>
        <option value="North">North</option>
        <option value="South">South</option>
    </select>
	
	<br/>

    <strong>Sync Date:</strong>
    <input type="text" id="dateFilter" placeholder="dd-mm-yyyy" style="padding: 8px; width: 120px; border: 1px solid #ccc; border-radius: 4px;">
    
    <button type="button" id="btnSearch">Search</button>
    
    <button type="button" id="btnClear">Clear</button>
    
    <span id="searchCount" style="margin-left: 10px; font-weight: bold; color: #555;"></span>
</div>

<div style="float:left; text-align:left;">
	&nbsp;<input type="button" value="Email History - TBD" onclick="javascript:open_popup('email_history');"><br/><br/>
</div>


    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
                <th class="topmenu" align="center" valign="middle" data-col="sn" width="3%">S.N.</th>
                <th class="topmenu" align="center" valign="middle" data-col="event_date" width="15%">Project name</th>
                <th class="topmenu" align="center" valign="middle" data-col="event_date" width="30%">Event</th>
				<th class="topmenu" align="center" valign="middle" data-col="event_date" width="10%">Location</th>
                <th class="topmenu" align="center" valign="middle" data-col="start_date" width="8%">Start Date</th>
				<th class="topmenu" align="center" valign="middle" width="8%">Revised Date</th>
				<th class="topmenu" align="center" valign="middle" width="10%">Updated Date</th>
				<th class="topmenu" align="center" valign="middle" width="5%">Reason</th>
				<th class="topmenu" align="center" valign="middle">Sync</th>
				<th class="topmenu" align="center" valign="middle">Email Receive<br/>TBD</th>
            </tr>
        </thead>
				<tbody>
				    {{ foreach from=$list item="business" }}
				       <!--  <tr style="background-color: #f2f2f2; font-weight: bold;">
				           <td colspan="8" align="center" style="text-align: center;background-color: #4A90E2; color: white; padding: 12px; font-weight: bold; font-size: 1.1em; text-transform: uppercase; letter-spacing: 1px; border-bottom: 2px solid #2C3E50;">
                            <i class="fa fa-building"></i> BUSINESS: {{ $business.business_name }} (ID: {{ $business.bsn_id }})
                        </td>
				        </tr> -->


				        {{ foreach from=$business.business_events item="item" }}
				            <tr bgcolor="{{ cycle values='#D3E8D6,WHITE' advance=true }}">
				                <td>{{ counter }}</td>
                                <td class="event__project__name">{{ $business.business_name }}</td> 
				                <td class="event__name">{{ $item.event_name }}</td> 
				                <td>
				                    <select name="location[{{$item.ID}}]" Onchange="update_location({{$item.ID}}, this.value)">
				                        <option>Please Select Location</option>
				                        <option value="North" {{if $item.elcc_location eq 'North'}}selected="selected"{{/if}}>North</option>
				                        <option value="South" {{if $item.elcc_location eq 'South'}}selected="selected"{{/if}}>South</option>
				                    </select>
				                </td>
				                <td align="center" class="revised-date-cell" data-info="{{ $item.fetch_revised_date }}">
				                    Checking...
				                </td>
				                <td>{{ $item.start_date }}</td> 
				                <td>{{ $item.updated_at }}</td>
				                <td>
				                    <!--<textarea name="revise_reason[{{$item.ID}}]" rows="3" onkeyup="update_revise_reason({{$item.ID}}, this.value)" style="width: 98%;">{{$item.elcc_reason}}</textarea>-->
									<a href="{{$BASE_URL}}{{$BASEFOLDER}}.view_reason/elccn_row_id/{{ $item.ID }}" class="various">Notes</a>
				                </td>
				               <td align="center">
                                    <button 
                                        data-sync-id="{{ $item.elcc_sync_status }}" 
                                        data-row-id="{{ $item.ID }}" 
										data-bsn-id="{{ $business.bsn_id }}"
										data-email-receive="{{$item.elcc_receive_email}}"
                                        class="enable__disable_rows"
										{{ if $item.elcc_sync_status == 1 }}disabled{{/if}}
                                    >
                                        {{ if $item.elcc_sync_status == 0 }}Sync{{ else }}Synced{{ /if }}
                                    </button>

                                    <div class="sync-info-container" style="margin-top: 5px; color: #666;">
                                        {{ if $item.elcc_sync_updated_by != "" }}
                                            <div class="sync-user">
                                                <span class="sync-by-text">{{ $item.elcc_sync_updated_by }}</span>
                                            </div>
                                            <div class="sync-date">
                                                <span class="sync-date-text">{{$item.elcc_sync_updated_date|date_format:"%d-%m-%Y"}}</span>
                                            </div>
                                        {{ else }}
                                            <div class="sync-status-placeholder">Not Synced</div>
                                        {{ /if }}
                                    </div>
                                </td>
								<td>
									<form name="recmet3" method="post" action="">
										<label class="switch">
											<input class="switch-input" type="checkbox" name="report" {{if $item.elcc_receive_email|default:1 != 0}}checked="checked"{{/if}} onclick="update_receive_email({{$item.ID}}, this.checked)">
											<span class="switch-label" data-on="Yes" data-off="No"></span>
											<span class="switch-handle"></span> <br>
										</label>
									</form>
								</td>
				            </tr>
				        {{ /foreach }}
				    {{ /foreach }}
				</tbody>
    </table>

</div>

			<script>
				    var updateTimer;
				    function update_location(id, value) {
				        clearTimeout(updateTimer);
				        updateTimer = setTimeout(function() {
				            value = encodeURIComponent(value);
				            $.ajax({
				                type: "GET",
				                url: "{{$BASE_URL}}{{$BASEFOLDER}}.update_location/elcc_row_id/" + id + "/value/" + value + "?t=" + new Date().getTime(),
				                success: function(result){ console.log("Location Updated:", id); },
				                error: function(xhr){ console.error("Error:", xhr.statusText); }
				            });
				        }, 500);
				    }

				    let reasonTimeout;
				    function update_revise_reason(id, value) {
				        clearTimeout(reasonTimeout);
				        reasonTimeout = setTimeout(function() {
				            $.ajax({
				                type: 'POST',
				                url: "{{$BASE_URL}}{{$BASEFOLDER}}.update_revise_reason/elcc_row_id/" + id + "/value/" + encodeURIComponent(value),
				                success: function(response) { console.log("Reason Saved:", id); },
				                error: function(xhr) { console.error("Error saving reason"); }
				            });
				        }, 500);
				    }
					
					var updateEmailTimer;
				    function update_receive_email(id, isChecked) {
						let email_value = isChecked ? 1 : 0;
				        clearTimeout(updateEmailTimer);
				        updateEmailTimer = setTimeout(function() {
				            $.ajax({
				                type: "POST",
				                url: "{{$BASE_URL}}{{$BASEFOLDER}}.update_receive_email/elcc_row_id/" + id + "/value/" + email_value + "/time?t=" + new Date().getTime(),
								success: function(response) {
									location.reload();
								},
				                error: function(xhr) { }
				            });
				        }, 510);
				    }
				</script>
<script type="text/javascript">
$(document).ready(function() {
    // Variable to track if the process should continue
    var isProcessing = true;
    var $cells = $('.revised-date-cell');
    var index = 0;

    function processNext() {

        console.log("processNextprocessNext");
        // Exit if we've reached the end or if the process was cancelled
        if (index >= $cells.length || !isProcessing) return; 

        var cell = $cells.eq(index); 
        var combinedId = cell.attr('data-info');

        // Skip empty IDs
        if (!combinedId || combinedId.trim() === "") {
            cell.html('<span style="color: #999;">-</span>');
            index++;
            processNext();
            return;
        }

        $.ajax({
            url: "{{$BASE_URL}}{{ $BASEFOLDER }}.get_revision_history",
            type: 'POST',
            data: { ids: combinedId },
            dataType: 'json',
            timeout: 8000, 
            success: function(response) {
                if (response && response.success && response.previous_date) {
                    // Highlight the revision in red as per your design
                    cell.html('<span>' + response.previous_date + '</span>');
                } else {
                    cell.html('<span style="color: #888;">No Revision</span>');
                }
            },
            error: function(xhr, status) {
                if (status === 'timeout') {
                    cell.html('<span style="color: #f0ad4e;">Timed Out</span>');
                } else {
                    cell.html('<span style="color: #cc0000;">Failed</span>');
                }
            },
            complete: function() {
                index++;
                // 150ms is perfect for Smartsheet's 300 requests per minute limit
                if (isProcessing) {
                    setTimeout(processNext, 150); 
                }
            }
        });
    }

    // Clean up if the user leaves the page to stop background requests
   /* $(window).on('beforeunload', function() {
        isProcessing = false;
    });*/

    processNext();
});
</script>

<script type="text/javascript">
$(document).ready(function() {
    
    function performSearch() {
        var value = $("#eventSearch").val().toLowerCase().trim();
        var matchCount = 0;
        var $rows = $("#list-table tbody tr");

        // If search is empty, show everything and exit
        if (value === "") {
            $rows.show();
            $("#searchCount").text("");
            return;
        }

        // Hide everything first
        $rows.hide();

        var $currentHeader = null;
        var businessHasMatch = false;

        $rows.each(function() {
            var $currentRow = $(this);
            
            // We check for the td with colspan="8"
            if ($currentRow.find('td[colspan="10"]').length > 0) {
			
                $currentHeader = $currentRow;
                businessHasMatch = false; 

            } else {
			
                var eventText = $currentRow.find('.event__name').text().toLowerCase();

                if (eventText.indexOf(value) > -1) {
                    $currentRow.show();
                    matchCount++;
                    businessHasMatch = true;
                    
                    if ($currentHeader) {
                        $currentHeader.show();
                    }
                }
            }
        });

        $("#searchCount").text(matchCount + " event(s) found");
    }

    // Bind actions using basic jQuery 1.4 syntax
    $("#btnSearch").click(function() {
        performSearch();
    });

    $("#eventSearch").keypress(function(e) {
        if (e.which == 13) {
            performSearch();
            return false; 
        }
    });

    $("#btnClear").click(function() {
        $("#eventSearch").val("");
        $("#list-table tbody tr").show();
        $("#searchCount").text("");
    });
});


$(document).ready(function() {
    
    $(".enable__disable_rows").click(function() {
        var $btn = $(this);
        var rowId = $btn.attr("data-row-id");
        var currentSyncStatus = $btn.attr("data-sync-id");
		var bsn_id = $btn.attr("data-bsn-id");
		var emailReceive = $btn.attr("data-email-receive");
        
        var newStatus = (currentSyncStatus == "1") ? 0 : 1;
        var loadingText = (newStatus == 1) ? "Syncing..." : "Unsyncing...";

        $btn.attr("disabled", "disabled").text(loadingText);

        $.ajax({
            type: "POST",
            url: "{{$BASE_URL}}{{$BASEFOLDER}}.action",
            data: { 
                action: 'sync_row',
                elcc_row_id: rowId,
                status_to_set: newStatus,
				bsn_id: bsn_id,
				emailReceive: emailReceive
            },
            dataType: "json",
            success: function(response) {
                if(response.success) {
                    $btn.attr("data-sync-id", newStatus);
                    
                    if (newStatus == 1) {
                        $btn.text("Synced")
                            .css({"background-color": "#27ae60", "color": "white", "border": "none"});
                    } else {
                        $btn.text("Sync")
                            .css({"background-color": "", "color": "", "border": ""});
                    }
                    
                } else {
                    alert("Update failed: " + response.message);
                }
            },
            error: function() {
                alert("Error: Could not reach the server action.");
            },
            complete: function() {
                $btn.removeAttr("disabled");
                if ($btn.attr("data-sync-id") == "0") {
                    $btn.text("Sync");
                } else {
                    $btn.text("Synced");
                }
            }
        });
    });
});
</script>

