<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/jquery-1.7.2.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
{{if $opr}}
<script type="text/javascript">
	setTimeout('parent.close_win();', 1000);
</script>
{{/if}}
<div align="center">
	<h3 class="page-title">{{$title}}</h3>
	<form name="createadmin" id="createadmin" method="post" action="{{$BASE_URL}}{{$XFA.detail}}"
		enctype="multipart/form-data">
		<input name="user_id" id="user_id" type="hidden" value="{{$detail.user_id}}" />
		<table id="EMP-list-table" width="100%" style="border-collapse:collapse;">
			{{if $opr}}
			<div class="opr_div">{{$opr}}</div>
			{{else}}
				{{if $msg}}
				<tr>
					<td colspan="4" style="text-align:center;" class="message">{{$msg}}</td>
				</tr>
				{{/if}}
				<tr>
					<th colspan="4">
						<div align="center" class="headtag">Personal Contact Details</div>
					</th>
				</tr>
				<tr>
					<th class="labelhead">Full Name:</th>
					<td><input class="input lrg" name="user_name" type="text" maxlength="132"
							value="{{$detail.user_name}}" /></td>
					<th class="labelhead">Email Address:</th>
					<td><input class="input lrg" name="user_email" type="text" maxlength="132"
							value="{{$detail.user_email}}" /></td>
				</tr>
				<tr>
					<th class="labelhead">Gender:</th>
					<td><select name="{{$TABLE}}[customer_gender]" class="lrg">
							<option value="male" {{if $detail.customer_gender=='male' }} selected="selected" {{/if}}>
								Male</option>
							<option value="female" {{if $detail.customer_gender=='female' }} selected="selected"
								{{/if}}>Female</option>
						</select></td>
					<th class="labelhead">Date of Bitrth:</th>
					<td><input name="{{$TABLE}}[customer_dob]" type="text" maxlength="132"
							value="{{$detail.customer_dob}}" class="w16em dateformat-d-ds-m-ds-Y" readonly="readonly" />
					</td>
				</tr>
				<tr>
					<th class="labelhead">Address:</th>
					<td><input class="input lrg" name="{{$TABLE}}[customer_address]" type="text" maxlength="132"
							value="{{$detail.customer_address}}" /></td>
					<th class="labelhead">Suburb:</th>
					<td><input class="input lrg" name="{{$TABLE}}[customer_suburb]" type="text" maxlength="132"
							value="{{$detail.customer_suburb}}" /></td>
				</tr>
				<tr>
					<th class="labelhead">State:</th>
					<td><input class="input lrg" name="{{$TABLE}}[customer_state]" type="text" maxlength="132"
							value="{{$detail.customer_state}}" /></td>
					<th class="labelhead">Postcode:</th>
					<td><input class="input lrg" name="{{$TABLE}}[customer_zip]" type="text" maxlength="132"
							value="{{$detail.customer_zip}}" /></td>
				</tr>
				<tr>
					<th class="labelhead">Company:</th>
					<td><input class="input lrg" name="{{$TABLE}}[customer_company]" type="text"
							value="{{$detail.customer_company}}" /></td>
					<th class="labelhead">Health:</th>
					<td><input class="input lrg" name="{{$TABLE}}[customer_health]" type="text" maxlength="132"
							value="{{$detail.customer_health}}" /></td>
				<tr>
					<th class="labelhead">Mobile Phone:</th>
					<td><input class="input lrg" name="{{$TABLE}}[customer_phone]" type="text" maxlength="132"
							value="{{$detail.customer_phone}}" /></td>
					<th class="labelhead">Home Phone:</th>
					<td><input class="input lrg" name="{{$TABLE}}[customer_phone_business]" type="text" maxlength="132"
							value="{{$detail.customer_phone_business}}" /></td>
				</tr>
				<tr>
					<th class="labelhead">Bank: </th>
					<td><input class="input lrg" name="{{$TABLE}}[customer_bank_name]" type="text"
							value="{{$detail.customer_bank_name}}" /></td>
					<th class="labelhead">Branch:</th>
					<td><input class="input lrg" name="{{$TABLE}}[customer_branch_name]" type="text"
							value="{{$detail.customer_branch_name}}" /></td>
				</tr>
				<tr>
					<th class="labelhead">Account Name:</th>
					<td colspan="3"><input class="input" style="width:500px;" name="{{$TABLE}}[customer_account_name]"
							type="text" value="{{$detail.customer_account_name}}" /></td>
				</tr>
				<tr>
					<th class="labelhead">BSB:</th>
					<td><input class="input lrg" name="{{$TABLE}}[customer_bsb]" type="text" maxlength="6"
							value="{{$detail.customer_bsb}}" /></td>
					<th class="labelhead">Bank Account Number:</th>
					<td><input class="input lrg" name="{{$TABLE}}[customer_account_number]" type="text" maxlength="9"
							value="{{$detail.customer_account_number}}" /></td>
				</tr>
				<tr>
					<th class="labelhead">Login Name:</th>
					<td><input class="input lrg" name="user_username" type="text" maxlength="132"
							value="{{$detail.user_username}}" autocomplete="off" /></td>
					<th class="labelhead">Password:</th>
					<td><input class="input lrg" name="user_password" type="password" maxlength="32" value=""
							autocomplete="off" /></td>
				</tr>
				<tr>
					<th class="labelhead">Tax file number:</th>
					<td colspan="3"><input class="input lrg" name="{{$TABLE}}[customer_tax_num]" type="text"
							maxlength="11" value="{{$detail.customer_tax_num}}" /></td>
				</tr>
				<tr>
					<th class="labelhead">Positions:</th>
					<td colspan="3"><select name="{{$TABLE}}[user_positions][]" multiple="multiple" size="10"
							class="vlrg">
							<option value="0">[Choose Positions]</option>
							{{foreach from=$positions key="key" item="item"}}
							<option value="{{$item.p_id}}" {{foreach from=$detail.customer_positions item="item1"
								key="key1" }} {{if $item1==$item.p_id}} selected="selected" {{/if}} {{/foreach}}>
								{{$item.p_name}}
							</option>
							{{/foreach}}
						</select>
					</td>
				</tr>
				<tr>
					<th>Super Fund Details:</th>
					<td colspan="3">
						<textarea name="{{$TABLE}}[customer_fund_details]" cols="150"
							rows="4">{{$detail.customer_fund_details}}</textarea>
					</td>
				</tr>
				<th>Upload Document:</th>
				<td colspan="3">
					<input type="file" name="cdoc" id="cdoc" />
				</td>
				</tr>
				<tr>
					<th colspan="4">
						<div align="center" class="headtag">Citizenship Details</div>
					</th>
				</tr>
				<tr>
					<th>Australian Citizen:</th>
					<td colspan="3">
						<table width="100%">
							<tr>
								<td width="10%">No.&nbsp;:<input type="radio" name="{{$TABLE}}[customer_auscitizen]"
										{{if $detail.customer_auscitizen=='No' }} checked="checked" {{/if}}
										value="No" /></td>
								<td width="10%">Yes.&nbsp;:<input type="radio" name="{{$TABLE}}[customer_auscitizen]"
										{{if $detail.customer_auscitizen=='Yes' }} checked="checked" {{/if}}
										value="Yes" /></td>
								<td width="50%">
									<p class="error">If <strong>No</strong> please provide Working Visa and or Permanent
										resident details:<br />
										Attach copy please (preferable colour photo copy)</p>
									<br /><strong>Upload</strong>&nbsp;:<input type="file" name="acfile" id="dfile" />
								</td>
								<td>{{if $detail.customer_auscitizen_attached}}
									<div class="customer_auscitizen_attached"><a
											href="{{$BASE_URL}}files/user_docs/{{$detail.customer_auscitizen_attached}}"
											target="_blank"
											title="{{$detail.customer_auscitizen_attached}}">{{$detail.customer_auscitizen_attached|truncate:"35"}}</a>&nbsp;<a
											href="{{$BASE_URL}}people_management.del/delfield/customer_auscitizen_attached"
											class="del-docs" id="customer_auscitizen_attached"><img
												src="{{$BASE_URL}}images/DeleteRed_new.gif" width="20" /> </a></div>
									{{/if}}
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<th colspan="4">
						<div align="center" class="headtag">Qualifications and Licences</div>
					</th>
				</tr>
				<tr>
					<th>Do you have a White Card:</th>
					<td colspan="3">
						<table width="100%">
							<tr>
								<td width="10%">No.&nbsp;:<input type="radio" name="{{$TABLE}}[customer_white_card]"
										{{if $detail.customer_white_card=='No' }} checked="checked" {{/if}}
										value="No" /></td>
								<td width="10%">Yes.&nbsp;:<input type="radio" name="{{$TABLE}}[customer_white_card]"
										{{if $detail.customer_white_card=='Yes' }} checked="checked" {{/if}}
										value="Yes" /></td>
								<td width="50%">
									<p class="error">If <strong>yes</strong>, please provide and attach colour photo
										copy</p>
									<br /><strong>Upload</strong>&nbsp;:<input type="file" name="wfile" id="wfile" />
								</td>
								<td>{{if $detail.customer_white_card_attached}}
									<div class="customer_white_card_attached"><a
											href="{{$BASE_URL}}files/user_docs/{{$detail.customer_white_card_attached}}"
											target="_blank"
											title="{{$detail.customer_white_card_attached}}">{{$detail.customer_white_card_attached|truncate:"35"}}</a><a
											href="{{$BASE_URL}}people_management.del/delfield/customer_white_card_attached"
											id="customer_white_card_attached" class="del-docs">&nbsp;<img
												src="{{$BASE_URL}}images/DeleteRed_new.gif" width="20" /></a></div>
									{{/if}}
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<th class="labelhead">Drivers Licence Details:</th>
					<td colspan="3">
						<table width="100%">
							<tr>
								<td width="50%">
									<table width="100%" id="none-table">
										<tr>
											<th><strong>Number:</strong>&nbsp;</th>
											<th><input class="input lrg" name="{{$TABLE}}[customer_dld_number]"
													type="text" value="{{$detail.customer_dld_number}}" /></th>
										</tr>
										<tr>
											<th><strong>Class:</strong>&nbsp;</th>
											<th><input class="input lrg" name="{{$TABLE}}[customer_dld_class]"
													type="text" value="{{$detail.customer_dld_class}}" /></th>
										</tr>
										<tr>
											<th><strong>Restrictions:</strong>&nbsp;</th>
											<th><input class="input lrg" name="{{$TABLE}}[customer_dld_rest]"
													type="text" value="{{$detail.customer_dld_rest}}" /></th>
										</tr>
										<tr>
											<th><strong>Type:</strong>&nbsp;</th>
											<th><select name="{{$TABLE}}[customer_dld_type]">
													<option value="Auto" {{if $detail.customer_dld_type=='Auto' }}
														selected="selected" {{/if}}>Auto</option>
													<option value="Manual" {{if $detail.customer_dld_type=='Manual' }}
														selected="selected" {{/if}}>Manual</option>
												</select>
											</th>
										</tr>
									</table>
								</td>
								<td width="40%"><strong>Upload</strong>:&nbsp;<input type="file" name="dfile" id="dfile"
										style="width:150px;" /><br /><br /><br />{{if $detail.customer_dld_attached}}
									<div class="customer_dld_attached"><a
											href="{{$BASE_URL}}files/user_docs/{{$detail.customer_dld_attached}}"
											target="_blank"
											title="{{$detail.customer_dld_attached}}">{{$detail.customer_dld_attached|truncate:"35"}}</a>&nbsp;&nbsp;<a
											href="{{$BASE_URL}}people_management.del/delfield/customer_dld_attached"
											class="del-docs" id="customer_dld_attached"><img
												src="{{$BASE_URL}}images/DeleteRed_new.gif" width="20" /></a></div>
									{{/if}}
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<th>Formal qualifications:</th>
					<td colspan="2" width="40%">
						<p class="error">Please provide any relevant colour photocopy: </p>
						<input type="file" name="fqfile" id="fqfile" />
					</td>
					<td>{{if $detail.customer_formail_qua}}
						<div class="customer_formail_qua"><a
								href="{{$BASE_URL}}files/user_docs/{{$detail.customer_formail_qua}}" target="_blank"
								title="{{$detail.customer_formail_qua}}">{{$detail.customer_formail_qua|truncate:"35"}}</a>&nbsp;&nbsp;<a
								href="{{$BASE_URL}}people_management.del/delfield/customer_formail_qua" class="del-docs"
								id="customer_formail_qua"><img src="{{$BASE_URL}}images/DeleteRed_new.gif"
									width="20" /></a></div>{{/if}}
					</td>
				</tr>
				<tr>
					<th colspan="4">
						<div align="center" class="headtag">Medical and Emergency Contact</div>
					</th>
				</tr>
				<tr>
					<th class="labelhead">Emergency Contact:</th>
					<td colspan="3"><input class="input" style="width:500px;" name="{{$TABLE}}[customer_econatct]"
							type="text" value="{{$detail.customer_econatct}}" /></td>
				</tr>
				<tr>
					<th class="labelhead">Relationship:</th>
					<td><input class="input lrg" name="{{$TABLE}}[customer_erelation]" type="text"
							value="{{$detail.customer_erelation}}" /></td>
					<th class="labelhead">Home Phone:</th>
					<td><input class="input lrg" name="{{$TABLE}}[customer_ehomephone]" type="text"
							value="{{$detail.customer_ehomephone}}" /></td>
				</tr>
				<tr>
					<th class="labelhead">Work Phone:</th>
					<td><input class="input lrg" name="{{$TABLE}}[customer_eworkphone]" type="text"
							value="{{$detail.customer_eworkphone}}" /></td>
					<th class="labelhead">Mobile:</th>
					<td><input class="input lrg" name="{{$TABLE}}[customer_emobile]" type="text"
							value="{{$detail.customer_emobile}}" /></td>
				</tr>
				<tr>
					<th>Medical Practitioner details:</th>
					<td colspan="3">
						<textarea name="{{$TABLE}}[customer_emp_detail]" cols="150"
							rows="4">{{$detail.customer_emp_detail}}</textarea>
					</td>
				</tr>
				<tr>
					<th>Medical Conditions that we should be aware of:</th>
					<td colspan="3">
						<textarea name="{{$TABLE}}[customer_emp_condition]" cols="150"
							rows="4">{{$detail.customer_emp_condition}}</textarea>
					</td>
				</tr>
				<tr>
					<th>MS Teams Folder Link:</th>
					<td colspan="2">
						<textarea name="{{$TABLE}}[customer_ms_team_folder_link]" cols="120"
							rows="3">{{$detail.customer_ms_team_folder_link}}</textarea>
					</td>
					<td>
						{{ if $detail.customer_ms_team_folder_link }}
						<a href="{{ $detail.customer_ms_team_folder_link }}" target="_blank">Link</a>
						{{ /if }}
					</td>
				</tr>
				<tr>
					<th colspan="4">
						<div class="user_docs" id="user_docs" align="left"></div>
						<div class="upload_docs">Document Title:&nbsp;<input type="text" name="ufile_name"
								id="ufile_name" style="width:300px;" />
							&nbsp;<input type="file" name="ufile" id="ufile" /></div>
					</th>
				</tr>
				<tr>
					<th>Status:</th>
					<td colspan="3"><select name="{{$TABLE}}[customer_status]" class="lrg">
							<option value="0" {{if $detail.customer_status==0}} selected="selected" {{/if}}>Current
							</option>
							<option value="1" {{if $detail.customer_status==1}} selected="selected" {{/if}}>Previous
							</option>
						</select></td>
				</tr>
				<tr>
					<td colspan="4" style="text-align:center"><input class="addButtons" name="subAddDetail"
							type="submit" value="Save">
						<input class="addButtons" type="button" value="Cancel" onclick="parent.$.fancybox.close();">
					</td>
				</tr>
				{{/if}}
		</table>
	</form>
</div>
<script type="text/javascript">
	$(function () {
		$.get('{{$BASE_URL}}people_management.upload/userid/{{$detail.user_id}}', function (data) {
			$('.user_docs').html(data);
		});
	});
	function del(id) {
		if (confirm("Are you sure you want to delete?")) {
			$(function () {
				$.get('{{$BASE_URL}}people_management.upload/del/1/userid/{{$detail.user_id}}/udid/' + id, function (data) {
					$('.user_docs').html(data);
				});
			});
		}
	}
	$(function () {
		$('.del-docs').click(function () {
			if (confirm("Are you sure want to delete?")) {
				var divclass = $(this).attr('id');
				var URL = $(this).attr('href') + "/userid/{{$detail.user_id}}";
				$.get(URL, function (msg) {
					$("." + divclass).hide('slow');
				});
			}
			return false; // don't follow the link!
		});
	});	
</script>
{{if !$opr}}
<script type="text/javascript" language="javascript">
	var frmvalidator = new Validator("createadmin");
	frmvalidator.EnableMsgsTogether();
	frmvalidator.addValidation("user_name", "req", "Please specify name.");
	frmvalidator.addValidation("user_email", "req", "Please specify email.");
	frmvalidator.addValidation("user_email", "email", "Please specify correct email format.");
	frmvalidator.addValidation("user_username", "req", "Please specify username.");
	{ { if !$detail.user_id} }
	frmvalidator.addValidation("user_password", "req", "Please specify password.");
	{ {/if } }
	frmvalidator.addValidation("{{$TABLE}}[user_positions]", "dontselect=0", "Please specify position.");
</script>
{{/if}}