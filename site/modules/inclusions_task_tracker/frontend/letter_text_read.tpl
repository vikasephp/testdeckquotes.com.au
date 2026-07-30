<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tabview/tabcontent.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/tabview/tabcontent.js">  </script>

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>

{{if $opr}}
<script type="text/javascript">
    setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<div align="center" style="padding-top:30px;">
    <h3 class="page-title">{{$title}}</h3><br />
    <form name="detail" method="post" action="" enctype="multipart/form-data">
        <table id="doclist-table" width="95%" cellpadding="0" cellspacing="0" style="border:1px solid #999;">
            <tr>
                <th>{{$itt_letter_text_read}}</th>
            </tr>
        </table>
    </form>
</div>