<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<!--<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />-->
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>

<script>
	!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
<style>
#list-table td.text-center {
	text-align: center;
}
</style>

{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<script type="application/javascript">

function add_new(url)
{
//var viewurl = "{{$BASE_URL}}designer_tracker.detail"+ "/random/" + Math.random();	
var viewurl = url;
$(document).ready(function () {
	$.fancybox({
			'width': '99%',
			'height': '99%',
			'autoScale': false,
			 'transitionIn' : 'elastic',
			 'transitionOut' : 'elastic',
			 'speedIn' : 300,
			 'speedOut' : 300,
			 'overlayShow' : true,
			 'overlayColor' : '#000',
			 'hideOnOverlayClick':false,
			 'hideOnContentClick':false,
			 'type': 'iframe',
			 'href': viewurl,
			 'scrolling': 'yes' 
		
	});
});
}

</script>


<div align="center" style="min-height:350px; z-index:9999999;">
<h3 class="page-title"><br />Open Log Projects </h3>
<br/>
<div class="record_count" style="font-size: 14px; font-weight: bold; text-align: left; width: 80%;">Total Projects with Open Log: {{$count_records}}</div>
<br/>

<table id="list-table" width="80%">
<tr> 
	<th width="55%">Projects</th>
	<th width="15%">No. of Open Logs </th>
	<th width="20%">Lockbox Status </th>
	<th width="10%">Amount Owed </th>
</tr>
	{{if $countshowopenrecord}}
   {{foreach from=$countshowopenrecord key="key" item="item"}}
   <tr>
	<td>{{$item.wa_project}}</td>
	<td class="text-center">
		<form action="{{$BASE_URL}}warranty_log2.home" method="post" target="_blank" style="display:inline;">
			<input type="hidden" name="project_name" value="{{$item.wa_project}}">
			<button type="submit" style="border:none;background:none;color:blue;text-decoration:underline;cursor:pointer;">
				{{$item.open_count}}
			</button>
		</form>
	</td>
	<td class="text-center">
		<select name="lockboxStatus" Onchange="update_lockbox_status({{$item.bsn_id}}, this.value)">
			<option value="Active Lockbox" {{if $item.bsn_warranty_lockbox_status eq 'Active Lockbox'}}selected="selected"{{/if}}>Active Lockbox</option>
			<option value="Removed Lockbox" {{if $item.bsn_warranty_lockbox_status eq 'Removed Lockbox'}}selected="selected"{{/if}}>Removed Lockbox</option>
			<option value="Unknown Status" {{if $item.bsn_warranty_lockbox_status eq 'Unknown Status'}}selected="selected"{{/if}}>Unknown Status</option>
		</select>
		<script>
			function update_lockbox_status(id, value) {
				$.ajax({
					type: "GET",
					url: "{{$BASE_URL}}warranty_log.update_lockbox_status/bsn_id/" + id + "/value/" + value,
					success: function (result) {
					}
				});
			}
		</script>
	</td>
	<td class="text-center">${{$item.amnt_owed|default:0|number_format:2:'.':','}}</td>    
   </tr> 
  {{/foreach}}
  {{else}}
  <tr>
	<td colspan="3" style="text-align:center;">No Data Available</td>
  </tr>
  {{/if}}
</table><br /><br />
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
</form>
    
    <script type="text/javascript">
	function closepop() {
		setTimeout('parent.close_win();', 500);
	}
	</script>
    
	<script type="text/javascript" language="javascript" >
        var frmvalidator  = new Validator("detail");
			frmvalidator.EnableMsgsTogether();
    </script>
</div>

<script>
	initSample();
</script>