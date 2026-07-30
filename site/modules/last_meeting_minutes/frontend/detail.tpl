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

<div align="center" style="min-height:350px;"><br />
    <h3 class="page-title">{{$title}}</h3>

    <form name="detail" method="post" action="{{$XFA.detail}}" enctype="multipart/form-data">
        <table id="list-table" width="100%">
            <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
            {{if $error}}
            <tr>
                <th colspan="2" style="color:#FF0000;">{{$error}}</th>
            </tr>
            {{/if}}
            <tr>
                <th>Project Name</th>
                <td>
                    <datalist id='project'>
                        {{foreach from=$projdetail key="key3" item="item3"}}
                        <option value="{{$item3.bsn_name}}" {{if $bsnid eq $item3.bsn_id}} selected="selected" {{/if}}>
                            {{$item3.bsn_name}}
                        </option>
                        {{/foreach}}
                    </datalist>
                    <input type="text" name="{{$TABLE}}[lmm_bsn_name]" list='project' value="{{$detail.lmm_bsn_name}}"
                        style="width:700px;">
                </td>
            </tr>
            <tr>
                <th>Date</th>
                <td><input type="date" name="{{$TABLE}}[lmm_doc_date_uploaded]" value="{{$detail.lmm_doc_date_uploaded}}"
                        style="width:700px;" /> </td>
            </tr>
            <tr>
                <th>Meeting Minutes</th>
                <td><input type="file" name="plan" /> </td>
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
        }
    </script>

    <script type="text/javascript" language="javascript">
        var frmvalidator = new Validator("detail");
        frmvalidator.EnableMsgsTogether();
        frmvalidator.addValidation("{{$TABLE}}[wa_project]", "req", "Please specify project.");
        //frmvalidator.addValidation("{{$TABLE}}[cl_company_name]","req", "Please specify company name.");
        //frmvalidator.addValidation("{{$TABLE}}[cl_contact_name]","req", "Please specify contact name.");
    </script>
</div>

<script>
    initSample();
</script>