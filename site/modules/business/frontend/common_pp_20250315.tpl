{{if !empty($taskmsg)}}{{$taskmsg}}{{/if}}
{{if !empty($print_data)}}
<div style="font-style:bold; text-align:left; padding:5px;">
	<input type="button" name="proc_panel" value="Type Admin" onclick="javascript:add_type();" /><br />
	<form name="tablename" method="post" action="">
		<input type="hidden" name="pp[pd_bsn_id]" value="{{$bus_id}}" />
		<strong>Clearing Center Link :</strong>
		<input type="text" name="pp[pd_cc_link]" value="{{$ppdata.pd_cc_link}}" style="width:700px"
			onkeyup="update_cc_link({{$ppdata.pd_id}},this.value)" />
		&nbsp;&nbsp;&nbsp;<strong>HIA Day Count :</strong> TBD
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Document Count :</strong> TBD <br />
		<strong>Planning Project Type :</strong>
		<select name="pp[pd_minimum_doc]" />
		<option value="0">Please Select</option>
		{{foreach from = $typedetail key="key4" item="item4"}}
		<option value="{{$item4.pp_option}}" {{if $item4.pp_option eq $ppdata.pd_minimum_doc}} selected="selected"
			{{/if}}>{{$item4.pp_option}}</option>
		{{/foreach}}
		</select>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<strong>Development Type :</strong>
		<select name="d_type" Onchange="update_d_type({{$bus_id}},this.value)">
			<option value="DA" {{ if $dtype_type eq 'DA' }} selected="selected" {{/if}}>DA</option>
			<option value="BA" {{ if $dtype eq 'BA' }} selected="selected" {{/if}}>BA</option>
			<option value="TBC" {{ if $dtype eq 'TBC' }} selected="selected" {{/if}}>TBC</option>
			<option value="ED" {{ if $dtype eq 'ED' }} selected="selected" {{/if}}>ED</option>
		</select> <br />
		<strong>Designer :</strong> <input type="text" name="pp[pd_designer]" value="{{$ppdata.pd_designer}}"
			style="width:200px" />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Architect :</strong>
		<input type="text" name="pp[pd_architect]" value="{{$ppdata.pd_architect}}" style="width:200px" />
		&nbsp; &nbsp;&nbsp;&nbsp;
		<div style="border:1px solid #9CF; display:inline-block; padding:5px; font-weight:bold;">LMP
			&nbsp; &nbsp;&nbsp;&nbsp;
			{{if $data491.doc_file_name}}
			<a href="/business.download_content?file_name={{$data491.doc_file_name}}&module_name=business.home"
				target="_blank">
				Download</a>&nbsp; &nbsp;&nbsp;&nbsp; {{$data491.doc_date_uploaded|date_format:"%e-%m-%Y"}} &nbsp;
			&nbsp;&nbsp;&nbsp; {{$data491.user_name}}
			{{else}} No Document Uploaded
				{{/if}}
		</div>
		<!--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Current Version :</strong>
		<input type="text" name="pp[pd_verson]" value="{{$ppdata.pd_verson}}" style="width:180px" />
		{{if $ppdata.pd_verson}} <strong>Date :</strong>{{$ppdata.pd_date}} &nbsp; &nbsp;<strong>User :</strong>{{$ppdata.pd_user}} {{/if}}-->
		<br />
		<input type="submit" name="pp_data" value="Save" />
	</form>
</div>
<table cellpadding="5" border="1" cellspacing="0" width="100%">
	<tr>
		<th width="4%" data-sn="1">Action</th>
		<th width="20%" data-sn="2">Document/Plan</th>
		<th width="5%" data-sn="3">Type</th>
		<th width="6%" data-sn="4">Required</th>
		<th width="6%" data-sn="5">Design Plans</th>
		<th width="6%" data-sn="6">Planning Plans</th>
		<th width="8%" data-sn="7">QA</th>
		<th width="8%" data-sn="8">Uploaded to department</th>
		<th width="8%" data-sn="9">Breach List</th>
		<th width="8%" data-sn="10">Rules</th>
	</tr>
	<form name="nr" method="post" action="">
		{{foreach from=$print_data item=item key=key}}
		<tr {{if $item.pc_required eq 0}} style="background:#F00;" {{/if}} id="req_color{{$item.pc_id}}">
			<td data-sn="1">
				<a href="javascript:RequestcheckListIframe('ppchecklist','{{$item.pc_id}}','','');">
					<img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png" />
				</a>
				<br />
			</td>
			<td style="padding-left:5px;" data-sn="2">{{$item.pc_document}}</td>
			<td data-sn="3">{{$item.pc_type}}</td>
			<td data-sn="4">
				<form name="recmet3" method="post" action="">
					<input type="hidden" name="required[{{$item.pc_id}}]" />
					<label class="switch">
						<input class="switch-input" type="checkbox" name="required[{{$item.pc_id}}]"
							onclick="update_required({{$item.pc_id}},this.checked);" {{if $item.pc_required eq 1 }}
							checked="checked" {{/if}} />
						<span class="switch-label" data-on="Yes" data-off="No"></span>
						<span class="switch-handle"></span> <br />
					</label>
				</form>
				<span id="req{{$item.pc_id}}">{{if $item.pc_required eq 0}}{{$item.pc_required_user}}
					<br />{{$item.pc_required_date}}{{/if}} </span>
			</td>
			<td data-sn="5">
				{{if $item.pc_design_plan}}
				<a href="{{$item.pc_design_plan}}" target="_blank">Link</a>
				{{$item.pc_design_plan_user}}
				<br />
				{{$item.pc_design_plan_date}}
				{{/if}}
			</td>
			<td data-sn="6">
				{{if $item.pc_live_link}}
				<a href="{{$item.pc_live_link}}" target="_blank">Link</a>
				{{$item.pc_live_link_user}}
				<br />
				{{$item.pc_live_link_date}}
				{{/if}}
			</td>
			<td data-sn="7">
				<form name="recmet3" method="post" action="">
					<input type="hidden" name="qa1[{{$item.pc_id}}]" />
					<label class="switch">
						<input class="switch-input" type="checkbox" name="qa1[{{$item.pc_id}}]"
							onclick="update_qa1({{$item.pc_id}},this.checked);" {{if $item.pc_qa1 eq 1 }}
							checked="checked" {{/if}} />
						<span class="switch-label" data-on="Yes" data-off="No"></span>
						<span class="switch-handle"></span> <br />
					</label>
				</form>
				<span id="qa1{{$item.pc_id}}">{{if $item.pc_qa1 eq 1}}{{$item.pc_qa1_user}}
					<br />{{$item.pc_qa1_date}}{{/if}} </span>
			</td>
			<td data-sn="8">
				<form name="recmet5" method="post" action="">
					<input type="hidden" name="depup[{{$item.pc_id}}]" />
					<label class="switch">
						<input class="switch-input" type="checkbox" name="depup[{{$item.pc_id}}]"
							onclick="update_dep_uploaded({{$item.pc_id}},this.checked);" {{if $item.pc_dep_uploaded eq 1
							}} checked="checked" {{/if}} />
						<span class="switch-label" data-on="Yes" data-off="No"></span>
						<span class="switch-handle"></span> <br />
					</label>
				</form>
				<span id="dep{{$item.pc_id}}">{{if $item.pc_dep_uploaded eq 1}}{{$item.pc_dep_upload_user}}
					<br />{{$item.pc_dep_upload_user}}{{/if}} </span>
			</td>
			<td style="text-align:center;" data-sn="9">
				<!--<a style="display:none;" href="javascript:parent.plan_breach({{ $item.pc_doc_id }}, {{ $bus_id }})" class="various">Link</a>-->
				<a href="javascript:parent.breach_text({{ $item.pc_doc_id }}, {{ $bus_id }})" class="various">Link</a>
			</td>
			<td style="text-align:center;" data-sn="10">
				<a href="javascript:parent.showrule({{$item.pc_doc_id}})" class="various">Link</a>
			</td>
		</tr>
		{{/foreach}}
		</tr>
	</form>
</table>
{{/if}}
{{if !empty($iframe_msg)}}
<script>
	parent.hideiFrame('ppcheckListIframe', '');
	parent.requestPPCheckList();
</script>
{{/if}}
{{if !empty($ppiframe_data) AND $ppiframe_data==1}}
<!--------------- Begin iframe_data ------->
<link rel="stylesheet" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type='text/javascript' src='{{$BASE_URL}}js/jquery-1.7.2.js'></script>
<div style="border:1px #CCCCCC solid; padding:5px;" id="checkListIframe">
	<script>
		function remove_img() {
			document.getElementById('doc_file_name_temp').value = '';
			document.getElementById('label_doc_file_name_temp').style.visibility = 'hidden';
			document.getElementById('crossimg').style.visibility = 'hidden';
		}
	</script>
	<form action="" id="uploadForm" method="post" enctype="multipart/form-data" name="iframe-form">
		<input type="hidden" id="uploadForm_doc_id" name="doc[pc_id]" value="{{$doc_data.pc_id}}" />
		<table cellpadding="0" cellspacing="0" class="table" id="upload_file_business_11">
			<tr>
				<td><strong>Document/Plan:</strong></td>
				<td style="background-color:#E0E6FF;padding:5px; font-size:12px; font-weight:bold;">
					{{$doc_data.pc_document}}</td>
			</tr>
			<tr>
				<td><strong>Type:</strong></td>
				<td>{{$doc_data.pc_type}}</td>
			</tr>
			<tr>
				<td><strong>Link:</strong></td>
				<td>{{$doc_data.pc_link}}</td>
			</tr>
			<tr>
				<td><strong>Planning Plans:</strong></td>
				<td><input type="text" name="doc[pc_live_link]" value="{{$doc_data.pc_live_link}}"
						style="width:700px;" /></td>
			</tr>
			<tr>
				<td><strong>Design Plans:</strong></td>
				<td><input type="text" name="doc[pc_design_plan]" value="{{$doc_data.pc_design_plan}}"
						style="width:700px;" /></td>
			</tr>
			<tr>
				<td><strong>Rules:</strong></td>
				<td><input type="text" name="doc[pc_rules]" value="{{$doc_data.pc_rules}}" style="width:700px;" /></td>
			</tr>
			<tr>
				<td><strong>Document Checklist Link:</strong></td>
				<td><input type="text" name="doc[pc_document_checklist]" value="{{$doc_data.pc_document_checklist}}"
						style="width:700px;" /></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align:center;">
					<input type="submit" value="Save" name="submit_iframe" id="uploadForm_submit_iframe"
						style="cursor:pointer;" />
					<input type="button" value="Cancel" onclick="parent.hideiFrame('ppcheckListIframe');"
						style="cursor:pointer;" />
				</td>
			</tr>
		</table>
	</form>
</div>
{{/if}}