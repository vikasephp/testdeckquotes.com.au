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

<style>
#list-table tr td, #list-table tr th{
	font-size: 14px;
}
</style>


<div align="center" style="min-height:350px; z-index:9999999;">
<h3 class="page-title"><br />All Project QA History Count</h3>    
    
<form name="detail" method="post" action=""  enctype="multipart/form-data">

<table id="list-table" width="99%">
	<tr> 
		<th width="8%">Sr No</th>
		<th width="60%">Project Address</th>
		<th width="16%">Pre onstart QA</th>
		<th width="16%">Post Onsite QA</th>
	</tr>
	{{if $countData}}
	{{assign var="countQA" value=1}}
	{{foreach from=$countData key="key" item="item"}}
	<tr>
		<td>{{$countQA}}</td>
		<td>{{$item.project_address}}</td>
		<td style="text-align:center;">{{$item.pre_onstart_qa}}</td>
		<td style="text-align:center;">{{$item.post_onsite_qa}}</td>	
	</tr> 
	{{assign var="countQA" value=$countQA+1}}
	{{/foreach}}
	{{else}}
	<tr>
		<td colspan="3" style="text-align:center;">No Count Available</td>
	</tr>
	{{/if}}

</table><br /><br />
<input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
</form>
    
<script type="text/javascript">
function closepop()
{
setTimeout('parent.close_win();', 500);
}
</script>
</div>
