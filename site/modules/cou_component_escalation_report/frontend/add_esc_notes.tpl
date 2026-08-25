<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />

{{if $opr}}
<script type="text/javascript">
    window.location.href = "{{$BASE_URL}}cou_component_escalation_report.view_esc_notes/bsn_id/{{$bsn_id}}";
</script>
{{/if}}

<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
    <h3 class="page-title">{{$title}}</h3>
    <form name="detail" method="post" action="" enctype="multipart/form-data">
        <table id="list-table" width="100%">
            <input type="hidden" name="notes[ccen_id]" value="{{$detail.ccen_id}}" />
            {{if $error}}
            <tr>
                <th colspan="2" style="color:#FF0000;">{{$error}}</th>
            </tr>
            {{/if}}
            <tr>
                <th>Add Notes</th>
                <td>
                    <textarea name="notes[ccen_notes]" rows="7" cols="180">{{$detail.ccen_notes}}</textarea>
                </td>
            </tr>
			<tr>
                <th>Upload Images</th>
                <td>
					<input type="file" name="ccena_images[]" multiple="multiple" accept="image/*" />
					<p style="margin-top:8px;">You can select multiple images.</p>
				</td>
            </tr>
			<tr>
                <th>Upload Files</th>
                <td>
					<input type="file" name="ccena_files[]" multiple="multiple" />
					<p style="margin-top:8px;">You can select multiple files.</p>
				</td>
            </tr>
			{{if $attachments}}
			<tr>
				<th>Existing Attachments</th>
				<td>
					{{foreach from=$attachments key="keyA" item="itemA"}}
						<div style="margin-bottom:6px;">
							{{if $itemA.ccena_type eq 'image'}}Image{{else}}File{{/if}}:
							<a href="{{$BASE_URL}}{{$BASEFOLDER}}.download_content?file_name={{$itemA.ccena_file_name}}&module_name=cou_component_escalation_attachment.home" target="_blank">{{$itemA.ccena_file_name}}</a>
							<a href="{{$BASE_URL}}{{$BASEFOLDER}}.delete_esc_attachment/ccena_id/{{$itemA.ccena_id}}/ccen_id/{{$detail.ccen_id}}/bsn_id/{{$bsn_id}}" onclick="javascript:if(!confirm('Are you sure want to Remove this Attachment?')) return false;" title="Remove Attachment">
								<img style="height: 16px; width:16px" src="{{$BASE_URL}}css/admin/images/deletecross.png"/>
							</a>
						</div>
					{{/foreach}}
				</td>
			</tr>
			{{/if}}
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
            window.location.href = "{{$BASE_URL}}cou_component_escalation_report.view_esc_notes/bsn_id/{{$bsn_id}}";
        }
    </script>
    <script type="text/javascript" language="javascript">
        var frmvalidator = new Validator("detail");
        frmvalidator.EnableMsgsTogether();
        frmvalidator.addValidation("notes[ccen_notes]", "req", "Please Add Notes.");
    </script>
</div>
