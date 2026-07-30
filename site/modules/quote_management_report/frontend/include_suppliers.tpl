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

<script type="application/javascript">
	function view_task(id) {
		var viewurl = "{{$BASE_URL}}designer_tracker.view_task" + "/dt_id/" + id;

		$(document).ready(function () {
			$.fancybox({
				'width': '90%',
				'height': '90%',
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

<div align="center" style="min-height:350px; z-index:999;">
	<h3 class="page-title"><br />List of Suppliers</h3>
	<form name="detail" method="post" action="" enctype="multipart/form-data">
		<div style="float:left; margin-right:10px; background: #09F; color:#FFF !important; padding:6px; margin-bottom:5px;">
			<input type="submit" name="add_suppliers" value="Click to add suppliers" />
		</div>
		<table id="list-table" width="99%">
			{{assign var=countn value=1}}
			{{foreach from=$companies key="key" item="item"}}
				{{if $countn == 1 }}
					<tr>
				{{/if}}
						<td>
							<input type="checkbox" name="qmrc_co_id[]" value="{{$item.co_id}}" {{$item.checked}}> {{$item.co_company_name}}
						</td>
				{{assign var=countn value=$countn+1}}
				{{if $countn ge 5 }}
					</tr>
					{{assign var=countn value=1}}
				{{/if}}
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