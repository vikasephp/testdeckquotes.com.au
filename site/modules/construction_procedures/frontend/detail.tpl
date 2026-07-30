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
                <td><strong>Procedure Name:</strong></td>
                <td>
                    <input type="text" name="doc[cp_name]" value="{{$record.cp_name}}" style="width:700px;" />
                    <datalist id="project">
                        {{ foreach from=$projdetail key="index" item="row" }}
                        <option value="{{ $row.bsn_name }}" {{ if $row.bsn_name eq $record.dpml_bsn_id }}selected{{ /if }}>{{ $row.bsn_name }}</option>
                        {{ /foreach }}
                    </datalist>
                </td>
            </tr>
            <tr>
                <td><strong>PDF Upload:</strong></td>
                <td>
                    <input type="file" name="cp_pdf_upload" value="{{$record.cp_pdf_upload}}" style="width:700px;" />
                    <br>
                    {{ if $record.cp_pdf_upload }}
                        <a href="/{{ $BASEFOLDER }}.download_content?file_name={{$record.cp_pdf_upload}}&module_name={{ $BASEFOLDER }}.home" target="_blank">Download</a>
                    {{ /if }}
                </td>
            </tr>
            <tr>
                <td><strong>Link To Live Doc:</strong></td>
                <td>
                    <input type="text" name="doc[cp_doc_live_link]" value="{{$record.cp_doc_live_link}}" style="width:700px;" />
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