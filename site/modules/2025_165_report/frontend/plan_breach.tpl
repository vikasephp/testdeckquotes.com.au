<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />

<script>
	!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>

{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<div align="center" style="min-height:350px; z-index:9999999;">
    <h3 class="page-title">
        <br />
        Plan Breach
    </h3>
    <a id="fancybox-close" style="display: inline;"></a> 
    <table border="1" style="font-weight: bold; width: 70%;" cellpadding="3">
        {{ foreach from = $docplan key="key" item="item" }}
        <tr>
            <th style="width: 80%">{{ $item.ppc_document }}</th>
            <td style="text-align: center;">
                <form name="recmet2" method="post" action="{{ $BASE_URL }}{{ $XFA.home }}" style="margin: 0;">
                    <input type="hidden" name="os2_doc_plan" value="{{ $item.os2_doc_plan }}">
                    <input type= "submit" name="filter_plan_breach" title="Save" value="{{ $item.total }}" style="margin: 0;">
                </form>
            </td>
        </tr>
        {{ /foreach }}
    </table>
</div>

<script>
    function closepop()	{
		setTimeout('parent.close_win();', 500);
    }
</script>