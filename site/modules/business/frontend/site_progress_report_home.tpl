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
    <tbody>
        <tr>
            <th>S.N.</th>
            <th>Task Name</th>
            <th>Date</th>
            <th>Attachments</th>
            <th>Action</th>
        </tr>
        {{ foreach from=$site_progress_report_data key="key" item="item" }}
        <tr>
            <td>{{ counter }}</td>
            <td>
                <select name="{{$TABLE}}[sp_task_name]" onchange="updateRecord({{$item.sp_id}}, 'sp_task_name', this.value)">
                    <option value="0" {{if $item.qm_component eq 0}} selected="selected" {{/if}}>Please Select</option>
                    {{foreach from = $cdetail key="key2" item="item2"}}
                        <option value="{{$item2.tn_id}}" {{if $item2.tn_id eq $item.sp_task_name }} selected="selected" {{/if}}>{{$item2.tn_name}}</option>
                    {{/foreach}}
                </select>
            </td>
            <td>{{$item.sp_date}}</td>
            <td>
                {{if $item.sp_attachment_1}}
                <a href="/site_progress_report.download_content?file_name={{$item.sp_attachment_1}}&module_name=site_progress_report.home" target="_blank">Download</a><br />
                {{/if}}

                {{if $item.sp_attachment_2}}
                <a href="/site_progress_report.download_content?file_name={{$item.sp_attachment_2}}&module_name=site_progress_report.home" target="_blank">Download</a><br />
                {{/if}}

                {{if $item.sp_attachment_3}}
                <a href="/site_progress_report.download_content?file_name={{$item.sp_attachment_3}}&module_name=site_progress_report.home" target="_blank">Download</a><br />
                {{/if}}

                {{if $item.sp_attachment_4}}
                <a href="/site_progress_report.download_content?file_name={{$item.sp_attachment_4}}&module_name=site_progress_report.home" target="_blank">Download</a><br />
                {{/if}}

                {{if $item.sp_attachment_5}}
                <a href="/site_progress_report.download_content?file_name={{$item.sp_attachment_5}}&module_name=site_progress_report.home" target="_blank">Download</a>
                {{/if}}
            </td>
            <td>
                <a href="{{$BASE_URL}}business.site_progress_report_delete/bsn_id/{{ $item.sp_bsn_id }}/sp_id/{{ $item.sp_id }}"><img style="height: 20px; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"></a>
            </td>
        </tr>
        {{ /foreach }}
    </tbody>
</table><script>
	function updateRecord(primaryID, column, value, updateRecord = false) {
        const formData = {
            primaryID: primaryID,
            column: column,
            value: value,
            action: "updateRecord"
        };
        $.ajax({
            type: "POST",
            url: "{{$BASE_URL}}business.site_progress_report_ajax",
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
</script>