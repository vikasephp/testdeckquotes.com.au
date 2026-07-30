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
<h3 class="page-title"><br />Commencements Meeting Completed</h3>

   
<form name="detail" method="post" action=""  enctype="multipart/form-data">

<table id="list-table" width="80%">
<tr> 
	<th width="25%">Calendar Year</th>
	<th width="25%">UID 553 </th>
	<th width="50">View Projects </th>
</tr>
	{{if $count553record}}
   {{foreach from=$count553record key="key" item="item"}}
   <tr>
	<td class="text-center">Jan 1, {{$item.year}} - Dec 31, {{$item.year}}</td>
	<td class="text-center">{{$item.total_records}}</td>
	<td>
		<a href="{{$BASE_URL}}construction_pipeline_report.view_cac_projectlist/year/{{$item.year}}" class="various" title="Edit" style="color:#000; font-size:14px;">List of Projects</a>
	</td>    
   </tr> 
  {{/foreach}}
  {{else}}
  <tr>
	<td colspan="3" style="text-align:center;">No Data Available</td>
  </tr>
  {{/if}}
</table><br /><br />

<table id="list-table" width="80%">
<tr> 
	<th width="25%">Financial Year</th>
	<th width="25%">UID 553 </th>
	<th width="50">View Projects </th>
</tr>
	{{if $countfin553record}}
   {{foreach from=$countfin553record key="key" item="item"}}
   <tr>
	<td class="text-center">{{$item.financial_year}}</td>
	<td class="text-center">{{$item.total_records}}</td>
	<td>
		<a href="{{$BASE_URL}}construction_pipeline_report.view_cac_projectlist/financial_year/{{$item.fy_year}}" class="various" title="Edit" style="color:#000; font-size:14px;">List of Projects</a>
	</td>    
   </tr> 
  {{/foreach}}
  {{else}}
  <tr>
	<td colspan="3" style="text-align:center;">No Data Available</td>
  </tr>
  {{/if}}
</table><br /><br />
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
			//frmvalidator.addValidation("{{$TABLE}}[al_item]","req", "Please specify item.");
    </script>
</div>

<script>
	initSample();
</script>