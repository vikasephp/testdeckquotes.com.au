 
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/w3.css" />

<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<script>
	!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />

<style>
input {
    width: 68px;
    overflow:hidden;
}
#fancybox-wrap {z-index:9999999;} 
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
    <h3 class="page-title"><br />Customer Issue</h3>    
   
   
<form name="detail" method="post" action=""  enctype="multipart/form-data">

<table id="list-table" width="99%">
<tr> <th width="20%">Project </th><th>Contact Info</th><th>Status</th><th>Date</th>
<th>Include Suppliers</th><th>Type</th><th>Priority</th><th>Issue </th></tr>
       
{{foreach from=$custdata key="key" item="item"}}
<tr>
<td>{{$item.car_project}}</td>
<td>{{$item.contact_info}}</td>
<td>{{$item.car_status}}</td>
<td>{{$item.car_date}}</td>
<td>{{$item.car_include_supplier}}</td>
<td>{{$item.car_type}}</td>
<td>{{$item.car_priority}}</td>
<td>{{$item.car_alert}}</td>

</tr> 
      {{/foreach}}

</table><br /><br />

<input type="button" name="btnCancelDetail" value="Close" onclick="javascript:parent.$.fancybox.close();" class="vsml" />
</form>
    
        <script type="text/javascript">
		function closepop()
		{
			//alert("{{$BASE_URL}}construction_alert_report.view_alert/sup_email/{{$sup_email}}");
		//setTimeout('parent.close_win();', 500);
		window.location.href = "{{$BASE_URL}}warranty_log.view_tr/sup_email/{{$sup_email}}";
		}
	</script>
    
	
</div>


