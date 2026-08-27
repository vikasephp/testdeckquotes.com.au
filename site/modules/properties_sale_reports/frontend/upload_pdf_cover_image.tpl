<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
{{if $opr}}
<script type="text/javascript">
	setTimeout(parent.$.fancybox.close(), 500);
</script>
{{/if}}
<div align="center" style="min-height:350px; z-index:999999 !important; width: 50%; margin: auto; margin-top:50px;">
	<h3 class="page-title" style="margin-bottom: 40px;;">{{ $title }}</h3>
	<form name="detail" method="post" action="" enctype="multipart/form-data">
		<table id="list-table" width="100%">
			{{if $error}}
			<tr>
				<th colspan="2" style="color:#FF0000;">{{$error}}</th>
			</tr>
			{{/if}}
			<tr>
				<th>Cover Image</th>
				<td>
					<input type="file" name="bsn_buyer_report_cover_image" required />
                    {{if $bsn_buyer_report_cover_image}}
                        <hr>
                        <a href="{{$bsn_buyer_report_cover_image}}" target="_blank" rel="noopener noreferrer">
                            <img src="{{$bsn_buyer_report_cover_image}}" style="width: 100%;" />
                        </a>
                    {{/if}}
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align:center;">
					<input type="submit" name="subAddDetail" value="Save" class="vsml" />
					<input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
				</td>
			</tr>
		</table>
	</form>
	<script type="text/javascript">
		function closepop() {
			setTimeout(parent.$.fancybox.close(), 500);
		}
	</script>
</div>