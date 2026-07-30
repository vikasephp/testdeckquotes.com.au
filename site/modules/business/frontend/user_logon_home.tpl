<link rel="stylesheet" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<style>
    .custom-table th {
        border: 1px solid #C1DAD7;
        border-collapse: collapse;
        text-align: center;
        font-weight: bold;
        font-size: 11px;
        height: 32px;
        font: "Trebuchet MS", Verdana, Arial, Helvetica;
        background-color: #CCCCCC;
    }

    .custom-table td {
        border: 1px solid #C1DAD7;
        border-collapse: collapse;
        font-weight: normal;
        font-size: 11px;
        text-align: left;
        font-family: Verdana, Arial, Helvetica, sans-serif;
        padding: 6px !important;
    }
</style>
<table cellpadding="0" cellspacing="0" width="100%" class="custom-table">
    <thead>
        <tr>
            <th>S.N.</th>
            <th>Website</th>
            <th>Linked to GCONS</th>
            <th>Username</th>
            <th>Password</th>
            <th>Lock</th>
            <th>Last Activity</th>
            <th>Control Panel Planning Approvals</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>1</td>
            <td>
                <a href="https://www.canberragrannyflatbuilders.com.au/" target="_blank">canberragrannyflatbuilders.com.au</a>
            </td>
            <td>NO</td>
            <td>{{$cgdb_username}}</td>
            <td>{{$cgdb_password}}</td>
            <td>TBD</td>
            <td>TBD</td>
            <td>TBD</td>
        </tr>
        <tr>
            <td>2</td>
            <td>
                <a href="https://planningapprovalscanberra.com.au/" target="_blank">planningapprovalscanberra.com.au</a>
            </td>
            <td>YES</td>
            <td>{{$sister_username}}</td>
            <td>{{$sister_password}}</td>
            <td>
                <label class="switch" style="margin: 0;">
                    <input class="switch-input" type="checkbox" value="1" onclick="toggleValues({{$bcust_id}}, 'bs_planning_login_flag', this)" {{if $bs_planning_login_flag == 0}}checked{{/if}}>
                    <span class="switch-label" data-on="Yes" data-off="No"></span>
                    <span class="switch-handle"></span>
                </label>
            </td>
            <td>{{$planning_latest_activity}}</td>
            <td>
                <a href="javascript:void(0);" onclick="javascript:parent.openPopup('{{$planning_link}}')">LINK</a>
            </td>
        </tr>
        <tr>
            <td>3</td>
            <td>
                <a href="https://warrantyreport.com.au/" target="_blank">warrantyreport.com.au</a>
            </td>
            <td>YES</td>
            <td>{{$sister_username}}</td>
            <td>{{$sister_password}}</td>
            <td>
                <label class="switch" style="margin: 0;">
                    <input class="switch-input" type="checkbox" value="1" onclick="toggleValues({{$bcust_id}}, 'bs_warranty_login_flag', this)" {{if $bs_warranty_login_flag == 0}}checked{{/if}}>
                    <span class="switch-label" data-on="Yes" data-off="No"></span>
                    <span class="switch-handle"></span>
                </label>
            </td>
            <td>{{$warranty_latest_activity}}</td>
            <td>TBD</td>
        </tr>
        <tr>
            <td>4</td>
            <td>
                <a href="https://constructioncalendar.com.au/" target="_blank">constructioncalendar.com.au</a>
            </td>
            <td>NO</td>
            <td>{{$sister_username}}</td>
            <td>{{$sister_password}}</td>
            <td>
                <label class="switch" style="margin: 0;">
                    <input class="switch-input" type="checkbox" value="1" onclick="toggleValues({{$bcust_id}}, 'bs_calendar_login_flag', this)" {{if $bs_calendar_login_flag == 0}}checked{{/if}}>
                    <span class="switch-label" data-on="Yes" data-off="No"></span>
                    <span class="switch-handle"></span>
                </label>
            </td>
            <td>{{$calendar_latest_activity}}</td>
            <td>TBD</td>
        </tr>
        <tr>
            <td>5</td>
            <td>
                <a href="https://constructionalerts.com.au/" target="_blank">constructionalerts.com.au</a>
            </td>
            <td>YES</td>
            <td>{{$sister_username}}</td>
            <td>{{$sister_password}}</td>
            <td>
                <label class="switch" style="margin: 0;">
                    <input class="switch-input" type="checkbox" value="1" onclick="toggleValues({{$bcust_id}}, 'bs_alert_login_flag', this)" {{if $bs_alert_login_flag == 0}}checked{{/if}}>
                    <span class="switch-label" data-on="Yes" data-off="No"></span>
                    <span class="switch-handle"></span>
                </label>
            </td>
            <td>{{$alert_latest_activity}}</td>
            <td>TBD</td>
        </tr>
    </tbody>
</table>
<script>
    function callAjax(formData, updateRecord=false) {
        $.ajax({
            type: "POST",
            url: "{{$BASE_URL}}business.user_logon_ajax",
            data: formData,
            dataType: "json",
            encode: true,
            success: function (data) {
                if (data.success == true) {
                    if(updateRecord){
                        $('#' + column + primaryID).text(value);
                    }
                }
                else {
                    alert('Some problem in updating the record');
                }
            }
        })
    }

    function toggleValues(bcust_id, column, element) {
        const value = $(element).is(":checked") ? 0 : 1;
        
        const formData = {
            bcust_id: bcust_id,
            column: column,
            value: value,
            action: "toggleLogin"
        };
        callAjax(formData);
    }

	function updateBusinessSellers(primaryID, column, value, updateRecord = false) {
        const formData = {
            primaryID: primaryID,
            column: column,
            value: value,
            action: "updateBusinessSellers"
        };
        callAjax(formData);
    }
</script>