<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

{{if $opr}}
<script type="text/javascript">
    window.location.href = "{{$BASE_URL}}warranty_escalation_report.view_esc_notes/wa_id/{{$wa_id}}";
</script>
{{/if}}

<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
    <h3 class="page-title">{{$title}}</h3>
    <form name="detail" method="post" action="" enctype="multipart/form-data">
        <table id="list-table" width="100%">
            <input type="hidden" name="notes[elsn_id]" value="{{$detail.elsn_id}}" />
            {{if $error}}
            <tr>
                <th colspan="2" style="color:#FF0000;">{{$error}}</th>
            </tr>
            {{/if}}
            <tr>
                <th>Add Notes</th>
                <td>
                    <textarea name="notes[elsn_notes]" rows='7' cols='180'>{{$detail.elsn_notes}}</textarea>
                </td>
            </tr>
			<tr>
                <th>Add Attachments</th>
                <td>
					<table style="width: 100%;">
						<tbody>
							<tr>
								<td>
									<input type="file" name="elsn_attachment_1" />
									{{if $detail.elsn_attachment_1}}
									<a href="{{$BASE_URL}}{{$BASEFOLDER}}.download_content?file_name={{$detail.elsn_attachment_1}}&module_name=warranty_escalation_attachment.home" title="{{$detail.elsn_attachment_1}}" target="_blank">{{$detail.elsn_attachment_1}}</a>
									<a href="{{$BASE_URL}}{{$BASEFOLDER}}.delete_esc_attachment/elsn_id/{{$detail.elsn_id}}/attach_1/1/wa_id/{{$wa_id}}" onclick="javascript:if(!confirm('Are you sure want to Remove this Attachment?')) return false;" title="Remove Attachment">     <img style="height: 16px;; width:16px" src="{{$BASE_URL}}css/admin/images/deletecross.png"/></a>
									{{/if}}
								</td>
								<td>
									<input type="file" name="elsn_attachment_2" />
									{{if $detail.elsn_attachment_2}}
									<a href="{{$BASE_URL}}{{$BASEFOLDER}}.download_content?file_name={{$detail.elsn_attachment_1}}&module_name=warranty_escalation_attachment.home" title="{{$detail.elsn_attachment_1}}" target="_blank">{{$detail.elsn_attachment_2}}</a>
									<a href="{{$BASE_URL}}{{$BASEFOLDER}}.delete_esc_attachment/elsn_id/{{$detail.elsn_id}}/attach_2/2/wa_id/{{$wa_id}}" onclick="javascript:if(!confirm('Are you sure want to Remove this Attachment?')) return false;" title="Remove Attachment">     <img style="height: 16px;; width:16px" src="{{$BASE_URL}}css/admin/images/deletecross.png"/></a>
									{{/if}}
								</td>
							</tr>
						</tbody>
					</table>
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
            window.location.href = "{{$BASE_URL}}warranty_escalation_report.view_esc_notes/wa_id/{{$wa_id}}";
        }
    </script>

    <script type="text/javascript" language="javascript">
        var frmvalidator = new Validator("detail");
        frmvalidator.EnableMsgsTogether();
        frmvalidator.addValidation("type[elsn_notes]", "req", "Please Add Notes.");
    </script>
</div>