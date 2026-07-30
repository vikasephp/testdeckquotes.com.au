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
	<h3 class="page-title"><br />{{ $MODULE_PLURAL }} Log</h3>
	<form name="detail" method="post" action="" enctype="multipart/form-data">
		<table id="list-table" width="99%">
			<tr>
				<th>S.N.</th>
				<th>Log ID</th>
				<th>Doc</th>
				<th>Datetime</th>
            </tr>
            {{foreach from=$records key="key" item="item"}}
                <tr>
                    <td>{{counter}}</td>
                    <td>{{$item.rel_id}}</td>
                    <td>{{$item.rel_download_doc}}</td>
                    <td>{{$item.rel_created_at}}</td>
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
</div>