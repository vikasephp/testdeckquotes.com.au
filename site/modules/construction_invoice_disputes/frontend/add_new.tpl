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
<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
	<h3 class="page-title">{{ $title }}</h3>
	<form name="detail" method="post" action="" enctype="multipart/form-data">
		<table id="list-table" width="100%">
			<input type="hidden" name="task[{{ $primary_id }}]" value="{{$detail.$primary_id}}" />
			<input type="hidden" name="{{$TABLE}}[{{ $primary_id }}]" value="{{$detail.$primary_id}}" />
			{{if $error}}
			<tr>
				<th colspan="2" style="color:#FF0000;">{{$error}}</th>
			</tr>{{/if}}
			<tr>
				<th>Project Name</th>
				<td>
					<datalist id='project'>
						{{foreach from=$projdetail key="key3" item="item3"}}
						<option value="{{$item3.bsn_name}}" {{if $detail.ldd_bsn_id eq $item3.bsn_name}} selected="selected" {{/if}}>
							{{$item3.bsn_name}}
						</option>
						{{/foreach}}
					</datalist>
					<input type="text" name="{{$TABLE}}[ldd_bsn_id]" list='project' value="{{$detail.ldd_bsn_id}}" style="width:700px;">
				</td>
			</tr>
            <tr>
				<th>MSTEAM Folder</th>
				<td>
					<input type="text" name="{{$TABLE}}[ldd_msteam_folder_link]" value="{{$detail.ldd_msteam_folder_link}}" style="width:700px;" />
				</td>
			</tr>
            <tr>
				<th>Status</th>
				<td>
					<select name="{{$TABLE}}[ldd_status_id]">
						<option value="0">Please Select</option>
                        {{ foreach from=$statusdata key="key2" item="item2" }}
                        <option value="{{ $item2.cids_id }}" {{if $detail.ldd_status_id eq $item2.cids_id}} selected="selected" {{/if}}>{{ $item2.cids_option }}</option>
                        {{ /foreach }}
					</select>
				</td>
			</tr>
			<tr>
				<th>Invoice</th>
				<td>
					<input type="file" name="{{$TABLE}}[ldd_invoice_file]" />
					{{ if $detail.ldd_invoice_file }}
                    <a href="/{{ $BASEFOLDER }}.download_content?file_name={{$detail.ldd_invoice_file}}&module_name={{ $BASEFOLDER }}.home" target="_blank">View/Download</a>
                    {{/if}}
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align:center;">
					<input type="submit" name="subAddDetail" value="Save" class="vsml" />
					<input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
				</td>
			</tr>
		</table>
	</form>
	<script type="text/javascript">
		function closepop() {
			setTimeout('parent.close_win();', 500);
		}
	</script>
	<script type="text/javascript" language="javascript">
		var frmvalidator = new Validator("detail");
		frmvalidator.EnableMsgsTogether();
		frmvalidator.addValidation("task[wt_task_name]", "req", "Please specify task.");
	</script>
</div>