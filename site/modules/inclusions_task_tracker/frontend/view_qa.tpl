<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<div>
    <h3 class="page-title">Task {{$tid}} - Question Answer</h3>
    {{if $msg }}
    <h2 style="text-align:center; padding-top:30; font-size:24px;">{{$msg }} </h2>
    {{else}}
        <table cellpadding="5" cellspacing="0" width="98%" border="1" id="list-table">
            <tr>
                <th width="45%"> Question </th>
                <th>Answer</th>
            </tr>
                {{foreach from=$psqadata key="key" item="item"}}
                <tr>
                    <td> {{$item.ps_question}} </td>
                    <td> {{$item.ps_answer}}</td>
                </tr>
                {{/foreach}}
        </table>
        <br />
        <strong>Add Question</strong><br /> <br />
        <!--<input type="hidden" name="ps_qa[ps_bsn_id]" value="{{$bus_id}}" />-->
        <form name="sta" method="post" action="">
            <input type="hidden" name="ps_qa[ps_task_id]" value="{{$tid}}" />
            <input type="text" name="ps_qa[ps_question]" style="width:1100px;" />
            <br />
            <input type="submit" name="st_save" value="save" />
            <input type="button" value="Close" onclick='javascript:refresh_close();' />
        </form>
    {{/if}}
</div>

<script type="text/javascript">
    function refresh_close() {
        //parent.requestAllTasks();
        parent.$.fancybox.close();
    }

</script>

<script type="text/javascript" language="javascript">
    var frmvalidator = new Validator("sta");
    frmvalidator.EnableMsgsTogether();
    frmvalidator.addValidation("ps_qa[ps_question]", "req", "Please enter question.");
</script>