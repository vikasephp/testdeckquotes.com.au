<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/ckeditor2/ckeditor.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/ckeditor2/samples/js/sample.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">


{{if $opr}}
<script type="text/javascript">
    window.location.href = "{{$BASE_URL}}{{$BASEFOLDER}}.view_position_explained/p_id/{{$p_id}}";
</script>
{{/if}}

<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
    <h3 class="page-title">Content for {{$result.0.p_name}}</h3>
    <form name="detail" method="post" action="" enctype="multipart/form-data">
        <table id="table" width="100%">
            <input type="hidden" name="notes[p_id]" value="{{$p_id}}" />
            {{if $error}}
            <tr>
                <th colspan="2" style="color:#FF0000;">{{$error}}</th>
            </tr>
            {{/if}}
            <tr>
                <th>Position Explained</th>
                <td>
                    <textarea id="editor_{{$p_id}}" name="notes[p_name_explained]" rows='7' cols='180'>{{$result.0.p_name_explained}}</textarea>
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
            window.location.href = "{{$BASE_URL}}{{$BASEFOLDER}}.view_position_explained/p_id/{{$p_id}}";
        }
    </script>
	
	<script>
		CKEDITOR.replace('editor_{{$p_id}}', {
			height: 250
		});
	</script>

    <script type="text/javascript" language="javascript">
        var frmvalidator = new Validator("detail");
        frmvalidator.EnableMsgsTogether();
    </script>
</div>