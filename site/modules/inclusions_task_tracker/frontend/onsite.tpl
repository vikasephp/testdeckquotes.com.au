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
    <h3 class="page-title">Onsite</h3>
    <table cellpadding="0" cellspacing="0" class="table" id="list-table" style="margin-bottom: 30px;">
        <tr>
            <th>Project</th>
            <th>Date</th>
        </tr>
        {{foreach from=$final_list key="index" item="row"}}
        <tr>
            <td>{{$row.bsn_name}}</td>
            <td>{{$row.bsn_incl_cc_date}}</td>
        </tr>
        {{/foreach}}
    </table>

    <script type="text/javascript">
        function closepop() {
            setTimeout('parent.close_win();', 500);
        }
    </script>
    <script>
        initSample();
    </script>
</div>