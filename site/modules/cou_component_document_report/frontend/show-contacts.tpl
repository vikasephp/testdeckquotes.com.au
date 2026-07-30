<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
<script src="{{$BASE_URL}}ckeditor/ckeditor.js"></script>
<script src="{{$BASE_URL}}ckeditor/samples/js/sample.js"></script>
<link rel="stylesheet" href="{{$BASE_URL}}ckeditor/samples/css/samples.css">
<link rel="stylesheet" href="{{$BASE_URL}}ckeditor/samples/toolbarconfigurator/lib/codemirror/neo.css">

{{include file=$jdata}}
{{include file=$tiny_basic}}


<!-- Load jQuery -->
<!-- <script type="text/javascript" src="http://www.google.com/jsapi"></script>
<script type="text/javascript">
	google.load("jquery", "1");
</script> -->

<script type="application/javascript">
	function show_notes(coid) {
		//alert(coid);
		var viewurl = "{{$BASE_URL}}contacts.show-notes-content" + "/co_id/" + coid;
		//alert(viewurl);
		$(document).ready(function () {
			$.fancybox({
				'width': '90%',
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

{{if $opr}}
<script type="text/javascript">
	setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<div align="center" style="min-height:350px;"><br />
	<h3 class="page-title">Contact List</h3> <br />

	<form name="detail" method="post" action="" enctype="multipart/form-data">
		<table id="list-table" class="nav-back" width="100%">
			<thead>
				<tr>
					<th class="topmenu" align="center" valign="middle" width="10%">Position</th>
					<th class="topmenu" align="center" valign="middle" width="10%">First Name</th>
					<th class="topmenu" align="center" valign="middle" width="10%">Surname</th>
					<th class="topmenu" align="center" valign="middle" width="12%">Primary Email</th>
					<th class="topmenu" align="center" valign="middle" width="10%">Include</th>
				</tr>
			</thead>
			<tbody>
				{{foreach from=$contacts key="key" item="item"}}
				<tr bgcolor="{{if $item.cs_is_primary eq 1 }}#FFFFCC{{else}}#FFFFFF{{/if}}">
					<td>{{$item.cs_position}} </td>
					<td>{{$item.cs_first_name}} </td>
					<td>{{$item.cs_surname}} </td>
					<td>{{$item.cs_primary_email}}</td>
					<td>
						<input type="checkbox" name="ccdrcc_cs_id[]" value="{{$item.cs_id}}" {{$item.checked}}>
					</td>
				</tr>
				{{/foreach}}
			</tbody>
		</table>
		<br />
		<input type="submit" name="add_contacts" value="Save" />
		<input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
		<br />
		Please Note : If status is Closed then contacts will not be saved...

	</form>
</div>
<script type="text/javascript">
	function closepop() {
		//parent.$.fancybox.close();
		//window.location.href = window.location.href;

		setTimeout('parent.close_win();', 500);
	}
</script>

<script>
	initSample();
</script>