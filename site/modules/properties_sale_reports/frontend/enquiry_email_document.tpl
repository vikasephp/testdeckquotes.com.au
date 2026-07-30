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
	//setTimeout('parent.close_win();', 500);
	setTimeout(function () {
		parent.location.reload();
		parent.jQuery.fancybox.close();
	}, 500);
</script>
{{/if}}

<div align="" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
<h3 class="page-title">Enquiries Email Documents</h3>  

{{if $opr}}
<h3 class="page-title">Notification Sent</h3>
{{/if}}

{{if !$show_preview && !$opr}}
<form name="detail1" method="post" action=""  enctype="multipart/form-data">
<div align="center" style="min-height: 350px; z-index: 9999999; margin-top: 25px;">
	<h3 class="page-title">Email Data</h3>
	<table id="list-table" width="100%">
		<input type="hidden" name="bsn_id" value="{{$bsn_id}}" />
		<tr>
			<th width="15%">Select Public Document</th>
			<td width="85%">
				<ul style="list-style-type:none;padding-left: 0;">
					{{assign var=countdocu value=1}}
					{{foreach from=$public_documents key="key" item="item"}}
					<li>
						{{$countdocu}}. {{$item.document_name}} 
						<input type="checkbox" name="documents[]" value="{{$item.document_name}}" />
					</li>
					{{assign var=countdocu value=$countdocu+1}}
					{{/foreach}}
				</ul>
			</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align:center;">
				<input type="submit" name="show_preview" value="Show Preview" class="vsml" />
				<input type="button" name="btnCancelDetail" value="Close" onclick="javascript:parent.$.fancybox.close();" class="vsml" />
			</td>
		</tr>
	</table>
</div>
</form>
<script>
document.forms["detail1"].onsubmit = function () {
    if (!document.querySelectorAll('input[name="documents[]"]:checked').length) {
        alert("Please select at least one Public document");
        return false;
    }
    return true;
};
</script>
{{/if}}

{{if $show_preview}}
<form name="detail" method="post" action=""  enctype="multipart/form-data">
{{$email_preview}}
<input type="hidden" name="documents" value="{{$selected_documents_str}}" />
<table id="list-table" width="100%">
    <tr>
        <td colspan="2" style="text-align:center;">
			<input id="send_email_btn" type="submit" name="send" value="Send Email" class="vsml" />
			<input type="button" name="btnBack" value="Back" onclick="window.history.back();" class="vsml" />
        </td>
    </tr>
</table>
</form>
    
<script type="text/javascript">
	function closepop(){
		setTimeout('parent.close_win();', 500);
	}
</script>
	
<script>
	document.addEventListener("DOMContentLoaded", function () {
		const form = document.querySelector("form");
		form.addEventListener("submit", function () {	
			const submitBtn = document.getElementById("send_email_btn");
			if (submitBtn) {
				submitBtn.style.cursor = "not-allowed";
				submitBtn.style.pointerEvents = "none";
			}
			if (!document.getElementById("emailMessage")) {
				const messageDiv = document.createElement("div");
				messageDiv.id = "emailMessage";
				messageDiv.style.color = "green";
				messageDiv.style.fontWeight = "bold";
				messageDiv.style.marginTop = "10px";
				messageDiv.innerText = "Please wait, Sending an Email to Customer";
				form.appendChild(messageDiv);
			}
		});
	});
</script>
{{/if}}
</div>