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
window.location.href = "{{$BASE_URL}}cou_component_document_report.view_commencement_appoint_complete";
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
<h3 class="page-title"><br />Commencements Meeting Completed Project List for {{$year}}</h3>

<form name="detail" method="post" action=""  enctype="multipart/form-data">

<table id="list-table" width="90%">
	<tr> 
		<th width="10%">Sr. No.</th>
		<th width="55%">Projects</th>
		<th width="15%">Date Complete </th>
		<th width="20%">Meeting Date</th>
	</tr>
   {{if $cacrecordlist}}
   {{foreach from=$cacrecordlist key="key" item="item"}}
	<tr>
		<td>{{counter}}</td>
		<td>{{$item.bsn_address}}</td>
		<td class="text-center">{{$item.bt_completed_date|date_format:"%d/%m/%Y"}}</td>
		<td>
			<input type="text" name="dt" class="w16em dateformat-d-ds-m-ds-Y dtpic" id="demo452_{{$item.bsn_id}}" value="{{$item.bt_meeting_date}}" onchange="update_meeting_date({{$item.bsn_id}}, 'bt_meeting_date', this.value);" onblur="update_meeting_date({{$item.bsn_id}}, 'bt_meeting_date', this.value);"/>
			<script>
			function update_meeting_date(id, column, value) {
				value = encodeURIComponent(value);
				$.ajax({
					type: 'POST',
					url: "{{$BASE_URL}}construction_pipeline_report.update_meeting_date/bsn_id/" + id + "/column/" + column + "/value/" + value,
					success: function(response) {
						console.log("Date saved:", response);
					},
					error: function(xhr) {
						console.error("Error saving date:", xhr.responseText);
					}
				});
			}
			</script>
		</td>
	</tr> 
  {{/foreach}}
  {{else}}
  <tr>
	<td colspan="4" style="text-align:center;">No Data Available</td>
  </tr>
  {{/if}}
</table><br /><br />
<input type="button" name="btnCancelDetail" value="Return" onclick="javascript:closepop();" class="vsml" />
</form>
    
    <script type="text/javascript">
	function closepop() {
		setTimeout('parent.close_win();', 500);
		window.location.href = "{{$BASE_URL}}construction_pipeline_report.view_commencement_appoint_complete";
	}
	</script>
    
	<script type="text/javascript" language="javascript" >
        var frmvalidator  = new Validator("detail");
			frmvalidator.EnableMsgsTogether();
			//frmvalidator.addValidation("{{$TABLE}}[al_item]","req", "Please specify item.");
    </script>
</div>

<script>
	initSample();
</script>