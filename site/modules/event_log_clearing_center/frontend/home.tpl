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
.business-header:hover {
    background-color: #357ABD !important;
}

.business-header i {
    margin-right: 10px;
    font-size: 1.2em;
}

#list-table {
    width: 100% !important;
    border-collapse: collapse;
}

/* Hide event rows by default */
.event-row {
    display: none; 
}

/* Ensure the toggled rows behave like table rows, not blocks */
.event-row.is-visible {
    display: table-row !important;
}

.event-row td {
    padding: 10px 5px;
    background-color: #ffffff; 
    border-bottom: 1px solid #ddd;
}
.switch {
	margin-bottom: 0px !important;
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

<br><br>
<div style="margin-bottom: 15px; padding: 10px; display: flex; align-items: center; gap: 10px; flex-wrap: wrap;">

	<strong>Project:</strong>
    <input type="text" id="eventSearch" placeholder="Type Project Name" style="padding: 8px; width: 250px; border: 1px solid #ccc; border-radius: 4px;">
	
    <strong>Location:</strong>
    <select id="locationFilter" style="padding: 8px; border: 1px solid #ccc; border-radius: 4px;">
        <option value="">All</option>
        <option value="North">North</option>
        <option value="South">South</option>
    </select>
	
	<strong>Timestamp Date:</strong>
    <input type="text" id="tdateFilter" placeholder="dd-mm-yyyy" style="padding: 8px; width: 120px; border: 1px solid #ccc; border-radius: 4px;" class="w16em dateformat-d-ds-m-ds-Y dtpic">

    <strong>Sync Date:</strong>
    <input type="text" id="dateFilter" placeholder="dd-mm-yyyy" style="padding: 8px; width: 120px; border: 1px solid #ccc; border-radius: 4px;" class="w16em dateformat-d-ds-m-ds-Y dtpic">
    
    <button type="button" id="btnSearch">Search</button>
    <button type="button" id="btnClear">Clear</button>
    
    <span id="searchCount" style="margin-left: 10px; font-weight: bold; color: #555;"></span>
</div>


<div style="float:left; text-align:left;">
    &nbsp;<input type="button" value="Email History" onclick="javascript:open_popup('email_history');"><br/><br/>
</div>

<div class="filter-controls" style="margin-bottom: 15px;">
    <!-- Show All sets p_show to 1 -->
    <button type="button" id="btn-show-all" class="btn btn-primary">Show All (Including Hidden)</button>
	
	<button type="button" id="btn-show-hidden" class="btn btn-primary">Show Hidden</button>
    <!-- Clear/Reset sets p_show to 0 -->
    <button type="button" id="btn-clear-filter" class="btn btn-secondary">Clear</button>
</div>


    <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
                <th class="topmenu" align="center" valign="middle" data-col="sn" width="3%">S.N.</th>
                <th class="topmenu" align="center" valign="middle" data-col="event_date" width="15%">Project name</th>
                <th class="topmenu" align="center" valign="middle" data-col="event_date" width="30%">Event</th>
                <th class="topmenu" align="center" valign="middle" data-col="event_date" width="10%">Location</th>
                <th class="topmenu" align="center" valign="middle" data-col="start_date" width="8%">Original Start Date</th>
                <th class="topmenu" align="center" valign="middle" width="8%">Revised Start Date</th>
                <th class="topmenu" align="center" valign="middle" width="5%">Reason</th>
				<th class="topmenu" align="center" valign="middle" width="10%">Timestamp</th>
                <th class="topmenu" align="center" valign="middle">Sync</th>
                <th class="topmenu" align="center" valign="middle">Email Receive</th>
            </tr>
        </thead>
                <tbody>
                    {{ foreach from=$list item="business" name="bsn_loop" }}
                       {{ assign var="bsn_index" value=$smarty.foreach.bsn_loop.iteration }}
						<tr class="business-header" data-target="events-{{ $bsn_index }}" style="background-color: #f2f2f2; font-weight: bold;">
                        <td colspan="8" align="center" style="background-color: #63C1DB; color: white; padding: 6px 12px; font-weight: bold; font-size: 1.1em; text-transform: uppercase; letter-spacing: 1px; border-bottom: 2px solid #2C3E50;border-top: 2px solid #2C3E50;cursor: pointer;">
                            <i class="fa fa-plus-square toggle-icon"></i> {{ $business.business_name }}
                        </td>
						<td colspan="2" style="background-color: #63C1DB; color: white; padding: 6px 12px; font-weight: bold; font-size: 1.1em; text-transform: uppercase; letter-spacing: 1px; border-bottom: 2px solid #2C3E50;border-top: 2px solid #2C3E50;cursor: pointer;">

                              <form name="recmet3" method="post" action="">
                                    <label class="switch">
                                            <input class="switch-input manage_project_display" type="checkbox" name="report" {{if $business.elccp_bsn_id_status == 1 }}checked="checked"{{else}}  {{/if}} 

                                                data-project-status-id="{{$business.elccp_bsn_id_status}}" 
                                                id="btn-project-{{$business.bsn_id}}"
                                                data-project-id="{{$business.bsn_id}}" 
                                               
                                            >
                                        <span class="switch-label" data-on="Hide" data-off="show"></span>
                                        <span class="switch-handle"></span> <br>
                                    </label>
                              </form>

							</td>
                        </tr>

                        {{ foreach from=$business.business_events item="item" }}
                            <tr class="event-row events-{{ $bsn_index }}" style="display: none;" bgcolor="{{ cycle values='#D3E8D6,WHITE' advance=true }}">
                                <td>{{ counter }}</td>
                                <td class="event__project__name">{{ $business.business_name }}</td> 
                                <td class="event__name">{{ $item.event_name }}</td> 
                                <td>
                                    <!--<select name="location[{{$item.ID}}]" Onchange="update_location({{$item.ID}}, this.value)">
                                        <option>Please Select Location</option>
                                        <option value="North" {{if $item.elcc_location eq 'North'}}selected="selected"{{/if}}>North</option>
                                        <option value="South" {{if $item.elcc_location eq 'South'}}selected="selected"{{/if}}>South</option>
                                    </select>-->
									<select name="location[{{$item.ID}}]" Onchange="update_location(this)"
                                       class="location-dropdown" data-id="{{$item.ID}}"
                                       data-group-id="{{$business.bsn_id}}" data-group="group-{{$business.bsn_id}}"
                                    >
                                        <option value="">Please Select Location</option>
                                        <option value="North" {{if $item.elcc_location eq 'North'}}selected="selected"{{/if}}>North</option>
                                        <option value="South" {{if $item.elcc_location eq 'South'}}selected="selected"{{/if}}>South</option>
                                    </select>
                                </td>
                                <td align="center" class="revised-date-cell" data-info="{{ $item.fetch_revised_date }}">
                                    Checking...
                                </td>
                                <td>{{ $item.start_date }}</td> 
                                <td>
                                    <!--<textarea name="revise_reason[{{$item.ID}}]" rows="3" onkeyup="update_revise_reason({{$item.ID}}, this.value)" style="width: 98%;">{{$item.elcc_reason}}</textarea>-->
                                    <a href="{{$BASE_URL}}{{$BASEFOLDER}}.view_reason/elccn_row_id/{{ $item.ID }}" class="various">Notes</a>
                                </td>
								<td data-timestamp-date="{{$item.updated_at|date_format:'%d-%m-%Y'}}" class="timestamp-date">{{ $item.updated_at }}</td>
                                <td align="center">
                                    <button 
                                        data-sync-id="{{ $item.elcc_sync_status }}" 
                                        data-row-id="{{ $item.ID }}" 
                                        data-bsn-id="{{ $business.bsn_id }}"
										{{if $item.elcc_receive_email|default:1 != 0}}data-email-receive="1"
										{{else}}data-email-receive="0"
										{{/if}}
                                        class="enable__disable_rows"
                                    >
                                        {{ if $item.elcc_sync_status == 0 }}Sync{{ else }}Synced{{ /if }}
                                    </button>

                                    <div class="sync-info-container" style="margin-top: 5px; color: #666;">
										<!-- {{if isset($item.elcc_sync_updated_by) and isset($item.elcc_sync_updated_date)}} {{/if}} -->
										{{if $item.elcc_sync_updated_by and $item.elcc_sync_updated_date}}
                                            <div class="sync-user">
                                                <span class="sync-by-text">{{ $item.elcc_sync_updated_by }}</span>
                                            </div>
                                            <div class="sync-date">
                                                <span data-sync-date="{{$item.elcc_sync_updated_date|date_format:"%d-%m-%Y"}}" class="sync-date-text">{{$item.elcc_sync_updated_date|date_format:"%d-%m-%Y"}}</span>
                                            </div>
                                        {{else}}
                                            <div class="sync-status-placeholder">Not Synced</div>
										{{/if}}
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
                 function updateUrlParameter(param, value) {
                       let url = new URL(window.location.href);
                            if (value === null) {
                                // This removes the parameter completely
                                url.searchParams.delete(param);
                            } else {
                                url.searchParams.set(param, value);
                            }
                            window.location.href = url.toString();
                    }
                $(document).ready(function() {
                    // Function to update URL parameter and reload
                   

                    // Handle "Show All" click
                    $('#btn-show-all').click(function(event) {
                        updateUrlParameter('p_show', '1'); // show all
                    });
					
					$('#btn-show-hidden').click(function(event) {
						updateUrlParameter('p_show', 2) // show hidden
                    });

                    // Handle "Clear / Reset" click
                    $('#btn-clear-filter').click(function(event) {
                        updateUrlParameter('p_show', null); // clear parameters
                    });
 
                        // 1. Specific handler for the hide button
                        $('.manage_project_status').click(function(event) {
                            // This is the line that solves your problem:
                            event.stopPropagation(); 
                            
                           var projectId = $(this).attr('data-project-id');
                           console.log("Hide button clicked for ID: " + projectId);
                        });

                        // 2. Your existing row toggle logic
                        $('.business-header').click(function() {
                            var targetClass = $(this).attr('data-target');
                            var icon = $(this).find('.toggle-icon');
                            var $rows = $('.' + targetClass);

                            $rows.each(function() {
                                if ($(this).is(':visible')) {
                                    $(this).hide();
                                } else {
                                    $(this).css('display', 'table-row').hide().fadeIn(300);
                                }
                            });

                            // Icon rotation logic...
                            if (icon.hasClass('fa-plus-square')) {
                                icon.removeClass('fa-plus-square').addClass('fa-minus-square');
                            } else {
                                icon.removeClass('fa-minus-square').addClass('fa-plus-square');
                            }
                        });
                    });
				
				var updateTimer;
				/*function update_location(id, value) {
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
				}*/
				function update_location(element) {
                    var $el = $(element);
                    var selectedValue = $el.val();
                    
                    var bsn_id = $el.attr('data-group-id'); 
                    var groupName = $el.attr('data-group'); 

                    if (groupName && groupName !== "undefined") {
                        
                        var $group = $('select[data-group="' + groupName + '"]');
                        $group.val(selectedValue);

                        var idList = $group.map(function() { 
                            return $(this).attr('data-id'); 
                        }).get().join(',');

                        console.log("Preparing to sync Group:", bsn_id, "IDs:", idList, "Value:", selectedValue);

                        clearTimeout(updateTimer);
                        updateTimer = setTimeout(function() {
                            $.ajax({
                                type: "POST",
                                url: "{{$BASE_URL}}{{$BASEFOLDER}}.update_location",
                                data: {
                                    id_list: idList,
                                    value: selectedValue,
                                    bsn_id: bsn_id,
                                    t: new Date().getTime()
                                },
                                success: function(result) {
                                    console.log("Success! Group updated.");
                                    $group.css('border-color', '#27ae60');
                                    setTimeout(function() { $group.css('border-color', ''); }, 1000);
                                },
                                error: function(xhr) {
                                    console.error("AJAX Error:", xhr.statusText);
                                }
                            });
                        }, 500);
                    } else {
                        console.error("Critical Error: groupName is undefined. Check if data-group exists in HTML.");
                    }
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
					let $btn = $('.enable__disable_rows[data-row-id="' + id + '"]');
					let $td = $btn.closest('td');
					$td.css({'pointer-events': 'none','opacity': '0.6'});
					clearTimeout(updateEmailTimer);
					updateEmailTimer = setTimeout(function() {
						$.ajax({
							type: "POST",
							url: "{{$BASE_URL}}{{$BASEFOLDER}}.update_receive_email/elcc_row_id/" + id + "/value/" + email_value + "/time?t=" + new Date().getTime(),
							success: function(response) {
								//location.reload();
								$btn.attr('data-email-receive', email_value).data('email-receive', email_value);
								$td.css({'pointer-events': '', 'opacity': ''});
							},
							error: function(xhr) {
								$td.css({'pointer-events': '', 'opacity': ''});
							}
						});
					}, 80);
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
    
             // 1. Initialize Datepicker (Removed onSelect live trigger)
            if ($.fn.datepicker) {
                $("#dateFilter").datepicker({
                    dateFormat: "dd-mm-yy"
                });
				$("#tdateFilter").datepicker({
                    dateFormat: "dd-mm-yy"
                });
            }

            // 2. The Consolidated Search Function
            function performSearch() {
                var searchValue = $("#eventSearch").val().toLowerCase().trim();
                var locationValue = $("#locationFilter").val();
                var dateValue = $("#dateFilter").val().trim(); // Match dd-mm-yyyy
				var tdateValue = $("#tdateFilter").val().trim();
                
                var matchCount = 0;
                var $rows = $("#list-table tbody tr");

                $rows.hide();

                var $currentHeader = null;

                $rows.each(function() {
                    var $currentRow = $(this);
                    
                    // Skip/Identify Business Headers
                    if ($currentRow.find('td[colspan="8"]').length > 0) {
                        $currentHeader = $currentRow;
                    } else {
                        // Criteria 1: Project Name
                        var eventText = $currentRow.find('.event__name').text().toLowerCase();
                        var nameMatches = (searchValue === "" || eventText.indexOf(searchValue) > -1);
                        
                        // Criteria 2: Location
                        var rowLocation = $currentRow.find('select[name^="location"]').val();
                        var locationMatches = (locationValue === "" || rowLocation === locationValue);

                        // Criteria 3: Sync Date (from your data-sync-date attribute)
                        var rowDate = $currentRow.find('.sync-date-text').attr('data-sync-date');
                        var dateMatches = (dateValue === "" || (rowDate && rowDate === dateValue));
						
						var tsrowDate = $currentRow.find('.timestamp-date').attr('data-timestamp-date');
						var tsdateMatches = (tdateValue === "" || (tsrowDate && tsrowDate === tdateValue));

                        if (nameMatches && locationMatches && dateMatches && tsdateMatches) {
                            $currentRow.show();
                            matchCount++;
                            if ($currentHeader) $currentHeader.show();
                        }
                    }
                });

                $("#searchCount").text(matchCount + " event(s) found");
            }

            // 3. ONLY run search when the Search Button is clicked
            $("#btnSearch").click(function() {
                performSearch();
            });

            // Also run search if user presses "Enter" in the search box
            $("#eventSearch").keypress(function(e) {
                if (e.which == 13) {
                    performSearch();
                    return false; 
                }
            });

            // 4. Update Clear button to reset everything and show all rows
            $("#btnClear").click(function() {
                $("#eventSearch, #dateFilter, #tdateFilter").val("");
                $("#locationFilter").val("");
                
                if ($.fn.datepicker) {
                    $("#dateFilter, #tdateFilter").datepicker("setDate", null);
                }
                
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
        //var newStatus = 1;
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
					if(newStatus == 1){
						$btn.text("Synced");
					}else{
						$btn.text("Sync");
					}
					$btn.removeAttr("disabled");
                } else {
                    alert("Update failed: " + response.message);
                }
            },
            error: function(xhr, status, error) {
				console.log("STATUS:", status);
				console.log("ERROR:", error);
				console.log("RESPONSE:", xhr.responseText);

				alert(xhr.responseText);
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

    $(".business-header .manage_project_display").change(function(event) {
        // Prevent the row toggle from firing if the switch is inside a header
        event.stopPropagation();

        var $input = $(this);
        var project_id = $input.attr("data-project-id");
        
        // The NEW status we want to save is based on whether it is checked or not
        // If checked = 1 (Hide), If unchecked = 0 (Show)
        var status_to_send = $input.is(':checked') ? 1 : 0;
        
        // Disable to prevent double-clicks during AJAX
      //  $input.attr("disabled", "disabled");

        $.ajax({
            type: "POST",
            url: "{{$BASE_URL}}{{$BASEFOLDER}}.action",
            data: { 
                action: 'manage_project_status',
                project_id: project_id,
                project_status_id: status_to_send // Send what the user just toggled to
            },
            dataType: "json",
            success: function(response) {
                 $input.removeAttr("disabled");
                if(response.success) {
                    // Update the attribute to match the new database state
                    $input.attr("data-project-status-id", response.new_status);
                    
                    // Ensure the checkbox matches the response (safety check)
                    $input.prop('checked', response.new_status == 1);
                } else {
                    alert("Update failed. Reverting...");
                    // Revert the toggle if the database update failed
                    $input.prop('checked', !$input.is(':checked'));
                }
            },
            error: function() {
                alert("Connection error. Reverting...");
                $input.prop('checked', !$input.is(':checked'));  $input.removeAttr("disabled");
            },
            complete: function() {
                $input.removeAttr("disabled");
            }
        });
    });
});
</script>

