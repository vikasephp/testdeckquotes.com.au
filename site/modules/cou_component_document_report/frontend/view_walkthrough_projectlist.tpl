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
window.location.href = "{{$BASE_URL}}cou_component_document_report.view_walkthrough_completed";
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
<h3 class="page-title"><br />Walkthrough Completed Project List for {{$year}}</h3>

   
<form name="detail" method="post" action=""  enctype="multipart/form-data">

<table id="list-table" width="90%">
<tr> 
	<th width="10%">Sr. No.</th>
	<th width="45%">Projects</th>
	<th width="25%">Date Uploaded </th>
	<th width="20%">Walkthrough</th>
</tr>
	{{if $courecordlist}}
   {{foreach from=$courecordlist key="key" item="item"}}
   <tr>
	<td>{{counter}}</td>
	<td>{{$item.bsn_address}}</td>
	<td class="text-center">{{$item.doc_date_uploaded|date_format:"%d/%m/%Y"}}</td>
	<td class="text-center">
		{{if $item.doc_file_name}}
		<a href="/cou_component_document_report.download_content?file_name={{$item.doc_file_name}}&module_name=cou_component_document_report.home" title="{{$item.doc_file_name}}">Link</a>
		{{/if}}
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
		window.location.href = "{{$BASE_URL}}cou_component_document_report.view_walkthrough_completed";
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