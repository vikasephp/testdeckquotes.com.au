<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
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
		<input type="hidden" name="{{$ID}}" value="{{ $dh_id }}" />
        <table id="doclist-table" width="95%" cellpadding="0" cellspacing="0" style="border:1px solid #999;">
            <tr>
                <th width="20%">AI Procedure ID</th>
				<td>
					<input type="text" value="DID{{$dh_id}}" style="width: 700px;" readonly/>
                </td>
            </tr>
			<tr>
                <th width="20%">AI Procedure Title</th>
				<td>
					<input type="text" name="dh_ai_procedure" value="{{$dh_ai_procedure}}" style="width: 700px;"/>
                </td>
            </tr>
        </table>
        <div style="padding-top:20px;">
            <input type="submit" name="add_data" value="Save" />
            <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:parent.$.fancybox.close();"
                class="vsml" />
        </div>
    </form>
</div>