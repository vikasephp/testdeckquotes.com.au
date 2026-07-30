<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

{{if $opr}}
<script type="text/javascript">
    setTimeout('parent.close_win();', 500);

    //window.location.href = "{{$BASE_URL}}warranty_log.view_procedure";
</script>
{{/if}}

<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
    <h3 class="page-title">Approved ?</h3>

    <form name="detail" method="post" action="" enctype="multipart/form-data">
        <table id="list-table" width="60%">
            <br />
            <input type="hidden" name="wa_id" value="{{$wa_id}}" />
            {{if $opr}}
            <tr>
                <th colspan="2" style="color:#FF0000;">{{$opr}}</th>
            </tr>
            {{/if}}
            <tr>
                <th><input type="radio" value="Yes" name="approve" checked="checked" />Yes</th>
                <th><input type="radio" value="No" name="approve" />No</th>
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
            setTimeout('parent.close_win();', 500);
            //window.location.href = "{{$BASE_URL}}warranty_log.home";
        }
    </script>

    <script type="text/javascript" language="javascript">
        var frmvalidator = new Validator("detail");
        frmvalidator.EnableMsgsTogether();
        frmvalidator.addValidation("task[wt_task_name]", "req", "Please specify task.");
    </script>
</div>