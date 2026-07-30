<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/w3.css" />

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
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
    <h3 class="page-title"><br />Update From Supplier</h3>    
   
   
<form name="detail" method="post" action=""  enctype="multipart/form-data">

<table id="list-table" width="99%" cellpadding="10">
<tr>
<th style="width:35%">Contact Person and Supplier Name</th><th style="width:35%">Update From Supplier</th>
<th style="width:15%">Submission Time and Date</th>
<th style="width:15%">Attachment</th>
</tr>
{{foreach from=$sudata key="key" item="item"}}
<tr>
<td>{{$item.ws_supplier_name}}</td>
<td>{{$item.ws_update_text}}</td>
<td style="text-align:center;">{{if $item.ws_date ne '0000-00-00 00:00:00'}} {{$item.ws_date}}{{/if}}</td>
<td style="text-align:center;">
{{if $item.ws_attachment}}
	{{if $item.ws_wr eq 0 }}
 		<a href="{{$BASE_URL}}files/uploads/{{$item.ws_attachment}}" target="_blank">Download</a>
 	{{else}}
 		<a href="https://www.warrantyreport.com.au/public/global_files/uploads/warranty_issue_comments_files/{{$item.ws_attachment}}" target="_blank">Download</a>
 	{{/if}}
{{/if}}
 <br />
 {{if $item.ws_attachment_2}}
 	{{if $item.ws_wr eq 0 }}
 		<a href="{{$BASE_URL}}files/uploads/{{$item.ws_attachment_2}}" target="_blank">Download</a>
 	{{else}}
 		<a href="https://www.warrantyreport.com.au/public/global_files/uploads/warranty_issue_comments_files/{{$item.ws_attachment_2}}" target="_blank">Download</a>
 	{{/if}}
 {{/if}}
 <br />
 {{if $item.ws_attachment_3}}
 	{{if $item.ws_wr eq 0 }}
 		<a href="{{$BASE_URL}}files/uploads/{{$item.ws_attachment_3}}" target="_blank">Download</a>
 	{{else}}
 		<a href="https://www.warrantyreport.com.au/public/global_files/uploads/warranty_issue_comments_files/{{$item.ws_attachment_3}}" target="_blank">Download</a>
 	{{/if}}
 {{/if}}
 <br />
 {{if $item.ws_attachment_4}}
 	{{if $item.ws_wr eq 0 }}
 		<a href="{{$BASE_URL}}files/uploads/{{$item.ws_attachment_4}}" target="_blank">Download</a>
 	{{else}}
 		<a href="https://www.warrantyreport.com.au/public/global_files/uploads/warranty_issue_comments_files/{{$item.ws_attachment_4}}" target="_blank">Download</a>
 	{{/if}}
 {{/if}}
 <br />
 
 {{if $item.ws_attachment_5}}
 	{{if $item.ws_wr eq 0 }}
 		<a href="{{$BASE_URL}}files/uploads/{{$item.ws_attachment_5}}" target="_blank">Download</a>
 	{{else}}
 		<a href="https://www.warrantyreport.com.au/public/global_files/uploads/warranty_issue_comments_files/{{$item.ws_attachment_5}}" target="_blank">Download</a>
 	{{/if}}
 {{/if}}
 
 </td>

</tr>

{{/foreach}}
</table><br /><br />

<input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
</form>
    
        <script type="text/javascript">
		function closepop()
		{
		setTimeout('parent.close_win();', 500);
		//window.location.href = "{{$BASE_URL}}construction_alert_report.view_scar/sup_email/{{$sup_email}}";
		}
	</script>	
</div>

<script>
	initSample();
</script>
