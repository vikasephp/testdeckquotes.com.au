<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<script>
	!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>

{{if $opr}}
<script type="text/javascript">
	//setTimeout('parent.close_win();', 500);
	setTimeout(function () {
		parent.jQuery.fancybox.close();
	}, 500);
</script>
{{/if}}

<div align="" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
<h3 class="page-title">Enquiries Email Preview</h3>   

<form name="detail" method="post" action=""  enctype="multipart/form-data">

<table id="list-table" width="100%">
    <input type="hidden" name="type[bsn_id]" value="{{$bsn_id}}" />
	<tr>
		<td style="width:100px;">Add Email:</td>
		<td>
			<input type="text" id="send_to" name="to" placeholder="Enter email addresses, separated by commas" style="width:650px;" />
		</td>
	</tr>
</table>

{{$email_preview}}

<table id="list-table" width="100%">
    <tr>
        <td colspan="2" style="text-align:center;">
			<input id="send_email_btn" type="submit" name="send" value="Send Email" class="vsml" />
			<input type="button" name="btnCancelDetail" value="Close" onclick="javascript:parent.$.fancybox.close();" class="vsml" />
        </td>
    </tr>
</table>
</form>
    
    <script type="text/javascript">
		function closepop(){
			setTimeout('parent.close_win();', 500);
		}
	</script>
    
	<script type="text/javascript" language="javascript" >
        var frmvalidator  = new Validator("detail");
			frmvalidator.EnableMsgsTogether();
    </script>
	
	<script>
		document.addEventListener("DOMContentLoaded", function () {
			const form = document.querySelector("form");
			form.addEventListener("submit", function () {
				var emails = document.getElementById('send_to').value.trim();
				if (!emails) {
					alert("Please enter at least one email address.");
					return;
				}
	
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
</div>