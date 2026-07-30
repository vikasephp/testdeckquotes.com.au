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
	.send_section {
		display: none;
		width: 500px;
		margin: auto;
		border: 1px solid silver;
		padding: 10px;
		margin-top: 20px;
	}

	.send_section h3 {
		margin-bottom: 10px;
	}
	input[type="time"] {
		padding: 5px 5px;
		font: 1em/1.2em Arial, Helvetica, sans-serif;
		color: #5C5C5C;
		border-top: 1px solid #5C5C5C;
		border-left: 1px solid #5C5C5C;
		border-bottom: 1px solid rgba(0, 0, 0, 0.1);
		border-right: 1px solid rgba(0, 0, 0, 0.1);
		background: #f0f0f0;
		border-radius: 4px;
		-moz-border-radius: 4px;
		-khtml-border-radius: 4px;
		-webkit-border-radius: 4px;
		width: auto;
		margin-bottom: 5px;
	}
</style>

{{if $success}}
<div align="center" style="min-height: 350px; z-index: 9999999; margin-top: 25px;">
	<h3 class="page-title">Email Response</h3>
	{{$success}}
</div>
{{/if}}

{{if !$show_preview &&!$success}}
<div align="center" style="min-height: 350px; z-index: 9999999; margin-top: 25px;">
	<h3 class="page-title">Email Data</h3>
	<form name="detail" method="post" action="" enctype="multipart/form-data">
		<table id="list-table" width="100%">
			<input type="hidden" name="bsn_id" value="{{$bsn_id}}" />
			<tr>
				<th width="15%">Enter Text Message:</th>
				<td width="85%">
					<textarea rows="5" name="message" style="width:95%;">{{$message}}</textarea>
				</td>
			</tr>
			<tr>
				<th width="15%">Enter More Proposal Number:</th>
				<td width="85%">
					<input type="text" name="more_proposal_number" placeholder="Enter Proposal Number, separated by commas" style="width:95%;" />
				</td>
			</tr>
			<tr>
				<th width="15%">Select Document</th>
				<td width="85%">
					<ul style="list-style-type:none;padding-left: 0;">
						{{assign var=countdocu value=1}}
						{{foreach from=$docnamedata key="key" item="item"}}
						<li>
							{{$countdocu}}. {{$item.prdn_option}} 
							<input type="checkbox" name="documents[]" value="{{$item.prdn_option}}" />
						</li>
						{{assign var=countdocu value=$countdocu+1}}
						{{/foreach}}
					</ul>
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align:center;">
					<input type="submit" name="show_preview" value="Show Preview" class="vsml" />
					<input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
				</td>
			</tr>
		</table>
	</form>
</div>

<script>
	function closepop() {
		setTimeout('parent.close_win();', 500);
	}

	var frmvalidator = new Validator("detail");
	frmvalidator.EnableMsgsTogether();
	console.log('Validator initialized');
	frmvalidator.addValidation("documents", "checkboxgroup", "Please select at least one document");
</script>
{{/if}}


{{if $show_preview}}
<div style="min-height: 350px; z-index: 9999999; margin-top: 25px;">
	<h3 class="page-title">Email Preview</h3>
	<form name="detail" method="post" action="" enctype="multipart/form-data">
	<table id="list-table" width="100%">
	<tr>
		<td colspan="2">
			{{$email_content}}
		</td>
	</tr>
	<tr>
		<td colspan="2" style="text-align:center;">
			<input type="hidden" name="message" value="{{$message}}" />
			<input type="hidden" name="more_proposal_number" value="{{$more_proposal_number}}" />
			<input type="hidden" name="documents" value="{{$selected_documents_str}}" />

			<input type="submit" name="send_email" id="send_email_btn" value="Send Email" class="vsml" onclick="disableSendBtn(this);" />
			<input type="button" name="btnBack" value="Back" onclick="window.history.back();" class="vsml" />
		</td>
	</tr>
	</table>
	</form>
	<script type="text/javascript">
	function disableSendBtn(btn) {
		btn.value = 'Sending...';
		btn.style.background = 'red';
		btn.style.cursor = 'Wait';
		return true;
	}
	</script>
</div>
{{/if}}