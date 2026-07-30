<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />

{{if $opr}}
<script type="text/javascript">
    setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<div align="center" style="min-height:350px; padding-top: 40px;">
    <h3 class="page-title">Edit {{ $MODULE_SINGULAR }}</h3>
    <form action="" id="uploadForm" method="post" enctype="multipart/form-data" name="iframe-form">
        <input type="hidden" name="doc[{{ $ID }}]" value="{{$record.$ID}}" />
        <table cellpadding="0" cellspacing="0" class="table" id="list-table">
            <tr>
                <th width="15%">Date</th>
                <td>
                    <input type="date" name="doc[pca_date]" value="{{$record.pca_date}}" style="width:700px" />
                </td>
            </tr>
            <tr>
                <th width="15%">Message</th>
                <td>
                    <textarea rows="4" name="doc[pca_alert_text]" style="width:700px">{{$record.pca_alert_text}}</textarea>
                </td>
            </tr>
            <tr>
                <th width="15%">Status</th>
                <td>
                    <select name="doc[pca_status]">
                        <option value="Open" {{ if $record.pca_status eq 'Open' }}selected{{ /if }}>Open</option>
                        <option value="Close" {{ if $record.pca_status eq 'Close' }}selected{{ /if }}>Close</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:center;">
                    <input type="submit" value="Save" name="subAddDetail" id="uploadForm_submit_iframe" style="cursor:pointer;" />
                    <input type="button" value="Cancel" onclick="parent.$.fancybox.close();" style="cursor:pointer;" />
                </td>
            </tr>
        </table>
    </form>

    <script type="text/javascript">
        function closepop() {
            setTimeout('parent.close_win();', 500);
        }
    </script>
    <script>
        initSample();
    </script>