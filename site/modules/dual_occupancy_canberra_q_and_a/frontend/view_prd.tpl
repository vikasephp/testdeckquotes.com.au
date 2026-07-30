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
<h3 class="page-title"><br />Uploaded File Data for Public Ranking</h3>
{{if $opr}}
<h3 class="page-title" style="color:green;"><br />Ranking Updated</h3>
{{/if}}

<form name="detail" method="post" action=""  enctype="multipart/form-data">

<table id="list-table" width="99%">
	<tr> 
		<th width="10%">QAIDDO</th>
		<th width="50%">Question </th>
		<th width="20%">Public Rank</th>
		<th width="20%">New Public Rank</th>
	</tr>
	{{if $previewPublicRankData}}
		{{foreach from=$previewPublicRankData key="key" item="item"}}
		<tr>
			<td>{{$item.docqa_id}}</td>
			<td style="text-align:center;">{{$item.docqa_question}}</td>
			<td style="text-align:center;">{{$item.public_rank}}</td>   
			<td style="text-align:center;">{{$item.new_public_rank}}</td>   	
		</tr> 
		{{/foreach}}
	{{else}}
	<tr>
		<td colspan="4" style="text-align: center">Some Error Occured. Please re-upload the data</td>
	</tr>
	{{/if}}

</table><br /><br />
<input type="submit" name="subAddDetail" value="Update" class="vsml">
<input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
</form>
    
    <script type="text/javascript">
		function closepop()
		{
		setTimeout('parent.close_win();', 500);
		}
	</script>
    
</div>