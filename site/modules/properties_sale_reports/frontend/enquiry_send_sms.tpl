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
<h3 class="page-title">Send Enquiries SMS - Under Development</h3>  

{{if $opr}}
<h3 class="page-title">SMS Sent</h3>
{{/if}}

{{if !$show_preview && !$opr}}
<form name="detail1" method="post" action=""  enctype="multipart/form-data">
	<div align="center" style="min-height: 350px; z-index: 9999999; margin-top: 25px;">
		<h3 class="page-title">Select SMS Template</h3>
		<table id="list-table" width="100%">
			<input type="hidden" name="bsn_id" value="{{$bsn_id}}" />
			<tr>
				<th width="15%">Select SMS Template</th>
				<td width="85%">
					{{if $sms_template}}
					<select name="sms_template">
						{{foreach from=$sms_template key="key" item="item"}}
						<option value="{{$item.psrest_id}}">{{$item.psrest_name}}</option>
						{{/foreach}}
					</select>
					{{/if}}
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
{{/if}}

{{if $show_preview}}
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<input type="hidden" name="sms_temp" value="{{$sms_temp}}" />
<table id="list-table" width="100%">
	<tr>
		<td>SMS Salutation</td>
		<td>
			Hi {{if $first_name}}{{$first_name}}{{/if}}
		</td>
	</tr>
	<tr>
		<td>Template Content:</td>
		<td>
			<textarea name="sms_temp_content" rows="7" cols="160">{{$sms_temp_content}}</textarea>
		</td>
	</tr>
    <tr>
        <td colspan="2" style="text-align:center;">
			<input id="send_email_btn" type="submit" name="send" value="Send SMS" class="vsml" />
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
				messageDiv.innerText = "Please wait, Sending SMS to Customer";
				form.appendChild(messageDiv);
			}
		});
	});
</script>
{{/if}}
</div>