<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
{{if $opr}}
<script type="text/javascript">
    window.location.href = "{{$BASE_URL}}planning_task_tracker.view_alert/bsn_id/{{ $pca_bsn_id }}";
</script>
{{/if}}
<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
    <h3 class="page-title">Add Alert</h3>
    <form name="detail" method="post" action="" enctype="multipart/form-data">
        <table id="list-table" width="100%">
            <input type="hidden" name="record[pca_bsn_id]" value="{{$pca_bsn_id}}" />
            <input type="hidden" name="record[pca_id]" value="{{ $detail.pca_id }}" />
            {{if $error}}
            <tr>
                <th colspan="2" style="color:#FF0000;">{{$error}}</th>
            </tr>
            {{/if}}
            <tr>
                <th width="15%">Date</th>
                <td>
                    <input type="date" name="record[pca_date]" style="width:700px" value="{{ $detail.pca_date }}" />
                </td>
            </tr>
            <tr>
                <th width="15%">Message</th>
                <td>
                    <textarea rows="4" name="record[pca_alert_text]" style="width:700px">{{ $detail.pca_alert_text }}</textarea>
                </td>
            </tr>
            <tr>
                <th width="15%">Status</th>
                <td>
                    <select name="record[pca_status]">
                        <option value="Open" {{ if $detail.pca_status == 'Open' }}selected{{ /if }}>Open</option>
                        <option value="Close" {{ if $detail.pca_status == 'Close' }}selected{{ /if }}>Close</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:center;">
                    <input type="submit" name="subAddDetail" value="Save" class="vsml" />
                    <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();"
                        class="vsml" />
                </td>
            </tr>
        </table>
    </form>
    <script type="text/javascript">
        function closepop() {
            window.location.href = "{{$BASE_URL}}planning_task_tracker.view_alert/bsn_id/{{ $pca_bsn_id }}";
        }
    </script>
    <script type="text/javascript" language="javascript">
        var frmvalidator = new Validator("detail");
        frmvalidator.EnableMsgsTogether();
        frmvalidator.addValidation("record[pc_option]", "req", "Please specify record changed.");
    </script>
</div>