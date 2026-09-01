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

<style>
table th, td { border:1px solid #0CF }
</style>



<div align="center" style="min-height:350px; z-index:9999999;">
    <h3 class="page-title"><br />View Due Date History</h3>    
   
   
<table id="list-table" width="99%" style="border:1px solid #0CF">
<tr> 
<th width="5%">SrNo </th>
<th>Due Date</th>
<th>Change Date</th>
<th>Change User</th>
</tr>
       
{{foreach from=$hData key="key" item="item"}}
    <tr>
    <td>{{counter}}</td>
    <td>{{$item.car_due_date}}</td>
    <td>{{$item.car_change_date}}</td>
    <td>{{$item.car_change_user}}</td>
    </tr> 
{{/foreach}}

</table>  <br /><br />
  <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:parent.$.fancybox.close();" class="vsml" /> 
</div>

