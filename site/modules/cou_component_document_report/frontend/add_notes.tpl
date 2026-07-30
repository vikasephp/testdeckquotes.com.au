<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

{{if $opr}}
<script type="text/javascript">
    window.location.href = "{{$BASE_URL}}cou_component_document_report.view_notes/bsn_id/{{$bsn_id}}";
</script>
{{/if}}

<div align="center" style="min-height: 350px; margin: 50px auto 0px; z-index: 999999 !important; max-width: 60%;">
    <h3 class="page-title">{{$title}} Note</h3>
    <form name="detail" method="post" action="" enctype="multipart/form-data">
        <table id="list-table" width="100%">
            <input type="hidden" name="task[ccdrn_bsn_id]" value="{{$bsn_id}}" />
			<input type="hidden" name="task[ccdrn_id]" value="{{$detail.ccdrn_id}}" />
			
            {{if $error}}
            <tr>
                <th colspan="2" style="color:#FF0000;">{{$error}}</th>
            </tr>
            {{/if}}
            <tr>
                <th>Notes</th>
                <td>
                    <textarea style="width: 100%" rows="4" name="task[ccdrn_notes]">{{$detail.ccdrn_notes}}</textarea>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <input type="submit" name="subAddDetail" value="Save" class="vsml" />
                    <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
                </td>
            </tr>
        </table>
    </form>

    <script type="text/javascript">
        function closepop() {
            //setTimeout('parent.close_win();', 500);
            window.location.href = "{{$BASE_URL}}cou_component_document_report.view_notes/bsn_id/{{$bsn_id}}";
        }
    </script>

    <script type="text/javascript" language="javascript">
        var frmvalidator = new Validator("detail");
        frmvalidator.EnableMsgsTogether();
        frmvalidator.addValidation("task[ccdrn_notes]", "req", "Please add note.");
    </script>
</div>