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


<div align="center" style="min-height:350px; z-index:9999999; overflow-x:hidden;">
<h3 class="page-title"><br/>{{$title}}</h3>    
 <style>
#list-table {
    table-layout: fixed;
    width: 100%;
}
</style>
<table id="list-table" width="99%">
	<thead>
		<tr> 
			<th width="4%">Sr. No.</th>
			<th width="22%">Project Address</th>
			<th width="40%">Notes</th>
			<th width="20%">Added By</th>
			<th width="8%">Date Added</th>
			<th width="6%">View Log</th>
		</tr>
	</thead>
	<tbody>
		{{foreach from=$data key="key" item="item"}}
		<tr>
			<td>{{counter}}</td>
			<td>{{$item.wa_project}}</td>
			<td>{{$item.notes}}</td>
			<td>{{$item.added_by}}</td>
			<td>{{$item.date|date_format:"%d-%m-%Y"}}</td>
			<td style="text-align: center">
				<a href="{{$BASE_URL}}warranty_log2.view_log_detail/wa_id/{{$item.log_id}}" target="_blank">View Log</a>
			</td>		
		</tr> 
		{{/foreach}}
	</tbody>
</table>
<br /><br />
<form>
	<input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
</form>

<script type="text/javascript">
	function closepop() {
		setTimeout(function() {
			parent.$.fancybox.close();
		}, 500);
	}
</script>

</div>