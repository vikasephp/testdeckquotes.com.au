{{include file=$jdata}}
<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
{{if $opr }}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}
<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
<h3 class="page-title">Letter Email Log</h3>

<!-- Debug Information -->
<!-- <div style="background: #f0f0f0; padding: 10px; margin: 10px 0; text-align: left; font-size: 12px;">
<strong>Debug Info:</strong><br>
Record ID: {{php echo $this->_tpl_vars['recordId'] ?? 'NOT SET'; }}<br>
Total Records: {{php echo count($this->_tpl_vars['allLogEntries'] ?? 0); }}<br>
Current Page: {{$pagenum}}<br>
Page Size: 10<br>
Log Entries Count: {{php echo count($this->_tpl_vars['logEntries'] ?? 0); }}<br>
Last Page: {{$last}}<br>
SQL Query: {{php echo isset($this->_tpl_vars['debug_sql']) ? $this->_tpl_vars['debug_sql'] : 'NOT SET'; }}
</div> -->
<div style="float:right; margin-right:5%; margin-bottom:10px;">
 <input type="button" name="close" value="Close" onclick="parent.$.fancybox.close();" />
</div>

<!-- Email Log Entries -->
<script>
function show_log_email_content(logId) {
    // Create URL for fetching email content
    var viewurl = '{{$BASE_URL}}{{ $BASEFOLDER }}.get_email_content?log_id=' + logId;
    
    // Open modal popup
    $(document).ready(function () {
            $.fancybox({
                'width': '90%',
                'height': '91%',
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
                'scrolling': 'yes',
                'title': 'Email Content'
            });
        });
}
</script>
{{if $logEntries}}
<table id="list-table" class="nav-back" width="100%">
    <thead>
        <tr>
            <th class="topmenu" align="center" valign="middle" data-col="sr_no">Id</th>
			<th class="topmenu" align="center" valign="middle" width="7%">Email Code</th>
            <th class="topmenu" align="center" valign="middle" data-col="sent_datetime">Email Date</th>
            <th class="topmenu" align="center" valign="middle" data-col="recipient_details">From</th>
            <th class="topmenu" align="center" valign="middle" data-col="recipient_details">To</th>
            <th class="topmenu" align="center" valign="middle" data-col="cc_details">CC</th>
            <th class="topmenu" align="center" valign="middle" data-col="project_name_display">Project Name</th>
            <th class="topmenu" align="center" valign="middle" data-col="email_subject">Email Subject</th>
            <th class="topmenu" align="center" valign="middle" data-col="email_subject">Email Content</th>
            <th class="topmenu" align="center" valign="middle" data-col="attached_documents">All Attachments</th>
        </tr>
    </thead>
    <tbody>
        {{foreach from=$logEntries item=log}}
        <tr bgcolor="{{cycle values="#D3E8D6,WHITE" advance=true}}">
            <td>{{$log.letter_log_id}}</td>
            <td>{{$log.elog_eml_code}}</td>
            <td>{{$log.elog_date}}</td>
            <td>{{$log.elog_from}}</td>
            <td>
                {{foreach from=$log.elog_to_array item=recipient}}
                    {{$recipient.name}} - {{$recipient.email}}<br>
                {{/foreach}}
            </td>
            <td>
                {{foreach from=$log.elog_cc_array item=recipient}}
                    {{$recipient.name}} - {{$recipient.email}}<br>
                {{/foreach}}
            </td>
            <td>{{$log.elog_business}}</td>
            <td>{{$log.elog_subject}}</td>
            <td>
                <input type="button" name="View Content" value="View Content"
                    onclick="javascript:show_log_email_content({{$log.letter_log_id}});"
                    style="width:90px; height:18px; font-size:11px; line-height:17px !important; padding:0px !important" />
            </td>
            <td>
                <!-- Main File -->
                {{if $log.main_file_name}}
                    <strong>Uploaded File:</strong><br>
                    <!-- <a href="/{{$BASEFOLDER}}.download_content?file_name={{$log.main_file_name}}&module_name={{$BASEFOLDER}}.home" target="_blank" style="color: #0066cc;">📎 {{$log.main_file_name}}</a><br><br> -->
                    <a href="/{{$BASEFOLDER}}.download_content?file_name={{$log.main_file_name}}&module_name={{$BASEFOLDER}}.home" target="_blank" style="color: #0066cc;">📎Download</a><br><br>
                {{/if}}
                
                <!-- Additional Files -->
                {{if $log.additional_files_array}}
                    <strong>Additional Files:</strong><br>
                    {{foreach from=$log.additional_files_array item=file}}
                        <!-- <a href="/{{$BASEFOLDER}}.download_content?file_name={{$file|trim}}&module_name={{$BASEFOLDER}}.home" target="_blank" style="color: #0066cc;">📎 {{$file|trim}}</a><br> -->
                        <a href="/{{$BASEFOLDER}}.download_content?file_name={{$file|trim}}&module_name={{$BASEFOLDER}}.home" target="_blank" style="color: #0066cc;">📎Download</a><br>
                    {{/foreach}}
                    <br><br>
                {{/if}}
                
                <!-- Attachments -->
                {{if $log.attachments_array}}
                    <strong>Own Attachments:</strong><br>
                    {{foreach from=$log.attachments_array item=file}}
                        <!-- <a href="/{{$BASEFOLDER}}.download_content?file_name={{$file|trim}}&module_name={{$BASEFOLDER}}.home" target="_blank" style="color: #0066cc;">📎 {{$file|trim}}</a><br> -->
                        <a href="/{{$BASEFOLDER}}.download_content?file_name={{$file|trim}}&module_name={{$BASEFOLDER}}.home" target="_blank" style="color: #0066cc;">📎Download</a><br>
                    {{/foreach}}
                {{/if}}
            
            </td>
        </tr>
        {{/foreach}}
    </tbody>    
</table>
{{else}}
<p align="center" style="padding:43px;font-size: 13px;">
    <em>No email logs found for this letter.</em>
</p>
{{/if}}
</div>

<!-- Pagination -->
{{if $logEntries}}
</table>
{{/if}}

<script>
$(document).ready(function() {
    // Build pagination dynamically like home.tpl
    var baseUrl = "{{$BASE_URL}}{{$BASEFOLDER}}.letter_log/record_id/{{$recordId}}";
    var last = {{$last}};
    var pagenum = {{$pagenum}};
    
    var paginationHtml = '<div class="pagination">';
    
    // Previous link
    if (pagenum == 1) {
        paginationHtml += '<span class="disabled">« previous</span>';
    } else {
        paginationHtml += '<a class="pagination" href="' + baseUrl + '/pagenum/' + (pagenum - 1) + '" title="Previous">« previous</a>';
    }
    
    // Page numbers - generate all pages dynamically
    for (var i = 1; i <= last; i++) {
        if (i == pagenum) {
            paginationHtml += '<span class="current">' + i + '</span>';
        } else {
            paginationHtml += '<a class="pagination" href="' + baseUrl + '/pagenum/' + i + '" title="Page ' + i + '">' + i + '</a>';
        }
    }
    
  
    // Next link
    if (pagenum == last) {
        paginationHtml += '<span class="disabled">next »</span>';
    } else {
        paginationHtml += '<a class="pagination" href="' + baseUrl + '/pagenum/' + (pagenum + 1) + '" title="Next">next »</a>';
    }
    
    paginationHtml += '</div>';
    // Insert pagination after the table
    if ({{$logEntries}}) {
        $('table#list-table').after('<table cellpadding="5" cellspacing="0" style="width:95%; margin-top:10px;"><tr><td align="center">' + paginationHtml + '</td></tr></table>');
    }
});
</script>
