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
    <h3 class="page-title">Notes</h3>
    <form action="" id="uploadForm" method="post" enctype="multipart/form-data" name="iframe-form">
        <input type="hidden" name="doc[bsn_id]" value="{{$record.bsn_id}}" />
        <table cellpadding="0" cellspacing="0" class="table" id="list-table">
            <tr>
                <td>
                    <textarea rows="4" name="doc[bsn_inclusions_task_tracker_notes]" style="width:700px">{{$record.bsn_inclusions_task_tracker_notes}}</textarea>
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