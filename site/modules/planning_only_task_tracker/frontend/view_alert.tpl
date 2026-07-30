<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />
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
<script type="application/javascript">
    function add_new(url) {
        //var viewurl = "{{$BASE_URL}}designer_tracker.detail"+ "/random/" + Math.random();	
        var viewurl = url;
        $(document).ready(function () {
            $.fancybox({
                'width': '99%',
                'height': '99%',
                'autoScale': false,
                'transitionIn': 'elastic',
                'transitionOut': 'elastic',
                'speedIn': 300,
                'speedOut': 300,
                'overlayShow': true,
                'overlayColor': '#000',
                'hideOnOverlayClick': false,
                'hideOnContentClick': false,
                'type': 'iframe',
                'href': viewurl,
                'scrolling': 'yes'
            });
        });
    }
</script>
<div align="center" style="min-height: 350px; z-index: 9999999;">
    <h3 class="page-title"><br />Client Alerts</h3>
    <form name="detail" method="post" action="" enctype="multipart/form-data">
        <table id="list-table" width="99%">
            <tr>
                <th width="10%">Date</th>
                <th width="10%">Day</th>
                <th width="60%">Message</th>
                <th>Status</th>
                <th>Option</th>
            </tr>
            {{foreach from=$alertdata key="key" item="item"}}
                <tr>
                    <td>{{$item.pca_date}}</td>
                    <td>
                        {{ assign var=date1 value=$item.pca_date|@strtotime }}
                        {{ assign var=date2 value=$item.pca_created_at|@strtotime }}
                        {{ assign var=diff value=$date1-$date2 }}
                        {{ assign var=final value=$diff/86400 }}
                        {{ $final|string_format:"%d" }}
                    </td>
                    <td>{{$item.pca_alert_text}}</td>
                    <td>{{$item.pca_status}}</td>
                    <td>
                        <a href="{{$BASE_URL}}planning_only_task_tracker.add_alert/bsn_id/{{ $item.pca_bsn_id }}/pca_id/{{ $item.pca_id }}" class="various" title="Edit"><img style="height:20px; width:20px;" src="https://www.deckquotes.com.au/css/admin/images/edit.png" alt=""></a>
					    <a href="{{$BASE_URL}}planning_only_task_tracker.delete_alert/bsn_id/{{ $item.pca_bsn_id }}/pca_id/{{ $item.pca_id }}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img style="height:20px; width:20px;" src="https://www.deckquotes.com.au/css/admin/images/delete.png" alt=""></a>
                    </td>
                </tr>
            {{/foreach}}
        </table>
        <br />
        <br />
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