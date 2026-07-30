<script type="text/javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/ckeditor2/ckeditor.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/ckeditor2/samples/js/sample.js"></script>
<link rel="stylesheet" href="{{$BASE_URL}}ckeditor2/samples/css/samples.css">
<link rel="stylesheet" href="{{$BASE_URL}}ckeditor2/samples/toolbarconfigurator/lib/codemirror/neo.css">

{{if $opr}}
<script type="text/javascript">
	//setTimeout('parent.close_win();', 500);
	window.location.href = "{{$BASE_URL}}{{ $BASEFOLDER }}.view_explanation";
</script>
{{/if}}
<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
	<h3 class="page-title">Add/Edit New Explanation</h3>
	<form name="detail" method="post" action="" enctype="multipart/form-data">
		<table id="list-table" width="100%">
			<input type="hidden" name="task[{{ $PPID }}]" value="{{$detail.$PPID}}" />
			{{if $error}}
			<tr>
				<th colspan="2" style="color:#FF0000;">{{$error}}</th>
			</tr>{{/if}}
			<tr>
				<th>Title</th>
				<td>
					<input type="text" name="task[pme_slug]" style="width:700px" value="{{$detail.pme_slug}}" />
				</td>
			</tr>
			<tr>
				<th>Explanation</th>
				<td>
					<textarea name="task[pme_explanation]" id="editor" style="width:800px" rows="6">{{$detail.pme_explanation}}</textarea>
				</td>
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
			//setTimeout('parent.close_win();', 500);
			window.location.href = "{{$BASE_URL}}{{ $BASEFOLDER }}.view_explanation";
		}
	</script>
</div>

<script>
	initSample();
</script>