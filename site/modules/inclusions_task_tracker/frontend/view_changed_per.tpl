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
    <h3 class="page-title">Changed Percentage</h3>
    <table cellpadding="0" cellspacing="0" class="table" id="list-table">
        <tr>
            <th>Last Updated Date</th>
            <th>Last Week(%)</th>
            <th>This Week(%)</th>
            <th>Difference(%)</th>
        </tr>
        {{if $result}}
        <tr>
            <td>{{$result.last_updated_date}}</td>
            <td>{{$result.last_week_per}}</td>
            <td>{{$result.this_week_per}}</td>
            <td>{{$result.difference_per}}</td>
        </tr>
        {{else}}
        <tr>
            <td colspan="4" style="text-align: center;">No Result</td>
        </tr>
        {{/if}}
    </table>

    <script type="text/javascript">
        function closepop() {
            setTimeout('parent.close_win();', 500);
        }
    </script>
    <script>
        initSample();
    </script>