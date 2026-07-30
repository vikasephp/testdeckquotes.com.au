<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>

<script>
    !window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />

{{if $opr}}
<script type="text/javascript">
    setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<div align="center" style="min-height:350px; z-index:9999999;">
    <h3 class="page-title"><br />Traffic Light Rules</h3>
    <form name="detail" method="post" action="" enctype="multipart/form-data">
        <table id="list-table" width="99%">
            <tr>
                <th width="10%">Light</th>
                <th width="80%">Rules</th>
                <th width="10">Action</th>
            </tr>
            {{foreach from=$proceduredata key="key" item="item"}}
            <tr>
                <td>{{$item.itttl_color}}</td>
                <td>{{$item.itttl_rules}}</td>
                <td>
                    <a href="{{$BASE_URL}}inclusions_task_tracker.update_traffic_light_rules/itttl_id/{{$item.itttl_id}}" class="various" title="Edit"><img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png" /></a>
                </td>
            </tr>
            {{/foreach}}

        </table><br /><br />
        <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
    </form>

    <script type="text/javascript">
        function closepop() {
            setTimeout('parent.close_win();', 500);
        }
    </script>

    <script type="text/javascript" language="javascript">
        var frmvalidator = new Validator("detail");
        frmvalidator.EnableMsgsTogether();
        frmvalidator.addValidation("{{$TABLE}}[al_item]", "req", "Please specify item.");

    </script>
</div>

<script>
    initSample();
</script>