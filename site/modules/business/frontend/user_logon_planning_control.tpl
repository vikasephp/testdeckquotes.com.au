<link rel="stylesheet" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<style>
    table, tr, th, td {
        border: 1px solid #111;
        border-collapse: collapse;
        font-size: 15px;
    }
    table label.switch {
        margin: 0;
    }
    table th, table td {
        padding: 6px 10px;
    }
</style>
<div align="center" style="min-height:350px; z-index:9999999;">
	<h3 class="page-title" style="margin-top: 40px;">Planning Approval Control Panel</h3>
    <table style="margin: auto; margin-top: 30px;">
        <tr>
            <th>Sales</th>
            <td>
                <label class="switch" for="bsn_pa_sales_flag{{ $item.bsn_id }}">
                    <input id="bsn_pa_sales_flag{{ $item.bsn_id }}" class="switch-input bsn_pa_sales_flag{{ $item.bsn_id }}" {{ if $item.bsn_pa_sales_flag == 1 }}checked{{ /if }} onchange="projectPhasesToggle('{{ $item.bsn_id }}', 'bsn_pa_sales_flag', this)" type="checkbox">
                    <span class="switch-label" data-on="Yes" data-off="No"></span>
                    <span class="switch-handle"></span>
                </label>
            </td>
        </tr>
        <tr>
            <th>Designs</th>
            <td>
                <label class="switch" for="bsn_pa_design_flag{{ $item.bsn_id }}">
                    <input id="bsn_pa_design_flag{{ $item.bsn_id }}" class="switch-input bsn_pa_design_flag{{ $item.bsn_id }}" {{ if $item.bsn_pa_design_flag == 1 }}checked{{ /if }} onchange="projectPhasesToggle('{{ $item.bsn_id }}', 'bsn_pa_design_flag', this)" type="checkbox">
                    <span class="switch-label" data-on="Yes" data-off="No"></span>
                    <span class="switch-handle"></span>
                </label>
            </td>
        </tr>
        <tr>
            <th>Proposal</th>
            <td>
                <label class="switch" for="bsn_pa_proposal_flag{{ $item.bsn_id }}">
                    <input id="bsn_pa_proposal_flag{{ $item.bsn_id }}" class="switch-input bsn_pa_proposal_flag{{ $item.bsn_id }}" {{ if $item.bsn_pa_proposal_flag == 1 }}checked{{ /if }} onchange="projectPhasesToggle('{{ $item.bsn_id }}', 'bsn_pa_proposal_flag', this)" type="checkbox">
                    <span class="switch-label" data-on="Yes" data-off="No"></span>
                    <span class="switch-handle"></span>
                </label>
            </td>
        </tr>
        <tr>
            <th>Planning Approval</th>
            <td>
                <label class="switch" for="bsn_pa_planning_flag{{ $item.bsn_id }}">
                    <input id="bsn_pa_planning_flag{{ $item.bsn_id }}" class="switch-input bsn_pa_planning_flag{{ $item.bsn_id }}" {{ if $item.bsn_pa_planning_flag == 1 }}checked{{ /if }} onchange="projectPhasesToggle('{{ $item.bsn_id }}', 'bsn_pa_planning_flag', this)" type="checkbox">
                    <span class="switch-label" data-on="Yes" data-off="No"></span>
                    <span class="switch-handle"></span>
                </label>
            </td>
        </tr>
        <tr>
            <th>Inclusions</th>
            <td>
                <label class="switch" for="bsn_pa_inclusion_flag{{ $item.bsn_id }}">
                    <input id="bsn_pa_inclusion_flag{{ $item.bsn_id }}" class="switch-input bsn_pa_inclusion_flag{{ $item.bsn_id }}" {{ if $item.bsn_pa_inclusion_flag == 1 }}checked{{ /if }} onchange="projectPhasesToggle('{{ $item.bsn_id }}', 'bsn_pa_inclusion_flag', this)" type="checkbox">
                    <span class="switch-label" data-on="Yes" data-off="No"></span>
                    <span class="switch-handle"></span>
                </label>
            </td>
        </tr>
        <tr>
            <th>Construction</th>
            <td>
                <label class="switch" for="bsn_pa_construction_flag{{ $item.bsn_id }}">
                    <input id="bsn_pa_construction_flag{{ $item.bsn_id }}" class="switch-input bsn_pa_construction_flag{{ $item.bsn_id }}" {{ if $item.bsn_pa_construction_flag == 1 }}checked{{ /if }} onchange="projectPhasesToggle('{{ $item.bsn_id }}', 'bsn_pa_construction_flag', this)" type="checkbox">
                    <span class="switch-label" data-on="Yes" data-off="No"></span>
                    <span class="switch-handle"></span>
                </label>
            </td>
        </tr>
        <tr>
            <th>Completion</th>
            <td>
                <label class="switch" for="bsn_pa_completion_flag{{ $item.bsn_id }}">
                    <input id="bsn_pa_completion_flag{{ $item.bsn_id }}" class="switch-input bsn_pa_completion_flag{{ $item.bsn_id }}" {{ if $item.bsn_pa_completion_flag == 1 }}checked{{ /if }} onchange="projectPhasesToggle('{{ $item.bsn_id }}', 'bsn_pa_completion_flag', this)" type="checkbox">
                    <span class="switch-label" data-on="Yes" data-off="No"></span>
                    <span class="switch-handle"></span>
                </label>
            </td>
        </tr>
    </table>
</div>

<script>
    function projectPhasesToggle(record_id, c, t) {
        // console.log(record_id, c, t);
        const allCheckElements = $('.' + c + record_id);
        let activeStatus = 0;
        if ($(t).is(":checked")) {
            activeStatus = 1;
            allCheckElements.attr('checked', 'checked');
        }
        else {
            allCheckElements.removeAttr('checked');
        }
        const formData = {
            r_ID: record_id,
            column: c,
            flag: activeStatus,
            action: "project_phase_toggle"
        };
        // console.log(formData);
        $.ajax({
            type: "POST",
            url: "{{$BASE_URL}}design_phase_customer_report.ajax_handler",
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
</script>