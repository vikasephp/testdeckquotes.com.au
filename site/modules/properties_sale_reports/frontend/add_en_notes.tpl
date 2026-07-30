<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

{{if $opr}}
<script type="text/javascript">
    window.location.href = "{{$BASE_URL}}{{$BASEFOLDER}}.view_en_notes/psre_id/{{$psre_id}}";
</script>
{{/if}}

<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
    <h3 class="page-title">{{$title}}</h3>
    <form name="detail" method="post" action="" enctype="multipart/form-data">
        <table id="list-table" width="100%">
            <input type="hidden" name="notes[psren_id]" value="{{$detail.psren_id}}" />
            {{if $error}}
            <tr>
                <th colspan="2" style="color:#FF0000;">{{$error}}</th>
            </tr>
            {{/if}}
            <tr>
                <th>Add Notes</th>
                <td>
                    <textarea name="notes[psren_notes]" rows='7' cols='180'>{{$detail.psren_notes}}</textarea>
                </td>
            </tr>
			<tr>
                <th>Add Date</th>
                <td>
					<input type="text" name="notes[psren_created_at]" class="w16em dateformat-d-ds-m-ds-Y dtpic" 
					value="{{if $detail.psren_created_at}}{{$detail.psren_created_at|date_format:'%d-%m-%Y'}}{{else}}{{$smarty.now|date_format:'%d-%m-%Y'}}{{/if}}"
					/>
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
            window.location.href = "{{$BASE_URL}}{{$BASEFOLDER}}.view_en_notes/psre_id/{{$psre_id}}";
        }
    </script>

    <script type="text/javascript" language="javascript">
        var frmvalidator = new Validator("detail");
        frmvalidator.EnableMsgsTogether();
        frmvalidator.addValidation("type[psren_notes]", "req", "Please Add Notes.");
    </script>
</div>