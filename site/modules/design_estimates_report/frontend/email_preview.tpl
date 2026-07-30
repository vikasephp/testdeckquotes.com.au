<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<style>
p {
	margin-bottom: 20px;
}
li {
	margin-bottom: 5px;
}
form {
	margin-bottom: 50px;
}
</style>

<div align="" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
<h3 class="page-title">Design Estimates Report Email Preview</h3>   

{{$email_preview}}

<form name="detail" method="post" action=""  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="type[dpn_unique_id]" value="{{$detail.dpn_unique_id}}" />
    <tr>
        <td colspan="2" style="text-align:center;">
			<input id="send_email_btn" type="submit" name="send" value="Send Email" class="vsml" />
			<input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
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
			//frmvalidator.addValidation("task[dpn_est_build_link_current]","req", "Please specify Link.");
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
</div>