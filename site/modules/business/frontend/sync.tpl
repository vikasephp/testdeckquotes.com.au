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


<div align="center" style="min-height:350px; z-index:9999999;">
	<h3 class="page-title"><br />Sync Documents To Planning Approval Website</h3>


	<form name="detail" method="post" action="" enctype="multipart/form-data">



		<table id="list-table" width="99%">
			<tr>
				<th width="50%">Sales</th>
				<th width="50%"><input type="checkbox" name="phase[sales]" value="Sales" {{if $phase_string|strstr:"Sales"}} checked="checked" {{/if}} /> </th>
			</tr>
			<tr>
				<th width="50%">Designs</th>
				<th width="50%"><input type="checkbox" name="phase[designs]" value="Designs" {{if $phase_string|strstr:"Designs"}} checked="checked" {{/if}} /> </th>
			</tr>
			<tr>
				<th width="50%">Planning</th>
				<th width="50%"><input type="checkbox" name="phase[planning]" value="Planning" {{if $phase_string|strstr:"Planning"}} checked="checked" {{/if}} /> </th>
			</tr>
			<tr>
				<th width="50%">Inclusions</th>
				<th width="50%"><input type="checkbox" name="phase[inclusions]" value="Inclusions" {{if $phase_string|strstr:"Inclusions"}} checked="checked" {{/if}} /> </th>
			</tr>
			<tr>
				<th width="50%">Construction</th>
				<th width="50%"><input type="checkbox" name="phase[constructions]" value="Construction" {{if $phase_string|strstr:"Construction"}} checked="checked" {{/if}} /> </th>
			</tr>
			<tr>
				<th width="50%">Compelte</th>
				<th width="50%"><input type="checkbox" name="phase[complete]" value="Complete" {{if $phase_string|strstr:"Complete"}} checked="checked" {{/if}} /></th>
			</tr>
		</table><br /><br />
		<input type="submit" name="save" value="Update Sync" />
		<input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
		<!--<input type="button" name="btnCancelDetail" value="Close" onclick="javascript:parent.$.fancybox.close();" class="vsml" />-->
	</form>


	{{if $msg}}
	<div style="font-size:18px;">{{$msg}}</div>{{/if}}
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