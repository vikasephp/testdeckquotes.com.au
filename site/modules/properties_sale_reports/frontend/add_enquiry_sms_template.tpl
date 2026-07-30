<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

{{if $opr}}
<script type="text/javascript">
    window.location.href = "{{$BASE_URL}}{{$BASEFOLDER}}.view_enquiry_sms_template";
</script>
{{/if}}

<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
    <h3 class="page-title">{{$title}}</h3>
    <form name="detail" method="post" action="" enctype="multipart/form-data">
        <table id="list-table" width="100%">
            <input type="hidden" name="notes[psrest_id]" value="{{$detail.psrest_id}}" />
            {{if $error}}
            <tr>
                <th colspan="2" style="color:#FF0000;">{{$error}}</th>
            </tr>
            {{/if}}
			<tr>
                <th>Add SMS Template name</th>
                <td>
                    <textarea name="notes[psrest_name]" rows='7' cols='160'>{{$detail.psrest_name}}</textarea>
                </td>
            </tr>
            <tr>
                <th>Add SMS Template</th>
                <td>
                    <textarea name="notes[psrest_template]" rows='7' cols='160'>{{$detail.psrest_template}}</textarea>
                </td>
            </tr>
			<tr>
                <td colspan="2" style="text-align:center;">
                    <input type="submit" name="subAddDetail" value="Save" class="vsml" />
                    <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
                </td>
            </tr>
        </table>
    </form>

    <script type="text/javascript">
        function closepop() {
            window.location.href = "{{$BASE_URL}}{{$BASEFOLDER}}.view_enquiry_sms_template";
        }
    </script>

    <script type="text/javascript" language="javascript">
        var frmvalidator = new Validator("detail");
        frmvalidator.EnableMsgsTogether();
		frmvalidator.addValidation("notes[psrest_name]", "req", "Please Add Name for SMS Template.");
        frmvalidator.addValidation("notes[psrest_template]", "req", "Please Add Text for SMS Template.");
    </script>
</div>