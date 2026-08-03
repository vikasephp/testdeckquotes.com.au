
<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
{{if $opr }}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}
<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/ckeditor2/ckeditor.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/ckeditor2/samples/js/sample.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<link rel="stylesheet" href="{{$BASE_URL}}js/datalist/styledatalist.css"/>
{{include file=$jdata}}
{{include file=$tiny_basic}}

<script>
	!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>

<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />

<style>
#letterCompose {width:98%; padding:10px; border-collapse:collapse;}
#letterCompose th { border:1px solid #CCC !important; border-collapse:collapse; font-size:13px;}
#letterCompose td { border:1px solid #CCC !important; border-collapse:collapse; font-size:13px;}
</style>

<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
<h3 class="page-title">Compose Letter Email</h3>
<div style="float:right; margin-right:5%;">

 </div>
<form name="letterComposeForm" method="post" action="{{$BASE_URL}}{{ $BASEFOLDER }}.compose_letter" enctype="multipart/form-data">
<input type="hidden" name="recordId" value="{{$recordId}}" />
<input type="hidden" name="formBusinessId" value="{{$businessId}}" />
<input type="hidden" name="businessName" value="{{$businessName}}" />
<input type="hidden" name="emlCode" value="{{$eml_code}}" />
<input type="hidden" name="toName" value="{{$customerName}}" />
<input type="hidden" name="toNameMap" value="{{$toNameMapJson}}" />
         
<table id="letterCompose" width="100%">
 
 <tr>
 <th>To:</th>
 <td colspan="7">
  <input type="text" name="to_email" value="{{$to_email}}" style="width:1000px;height: 28px;" readonly />
  {{if $customerName}}
  <br><small style="color: #666;">Customer: {{$customerName}}</small>
  {{/if}}
 </td>
 </tr>
 
 <tr>
 <th>CC:</th>
 <td colspan="7">
  {{if $cc_contacts && $cc_contacts|@count > 0}}
  <datalist id='cc_contact'>
  {{foreach from=$cc_contacts key="keyc" item="itemc"}}
    <option value="{{$itemc.email}}">{{$itemc.name}} {{$itemc.email}}</option>
  {{/foreach}}
  </datalist>
  <input type="text" list="cc_contact" style="width:700px" id="cclist" placeholder="Search contact by name or email..." autocomplete="off" />
  <input type="button" name="ccsub" value="Add" onclick="add_cc_contact()" />
  <input type="text" name="cc_email" style="width:700px" id="cc_email" value="{{$cc_email}}" />

  <script language="javascript">
  function add_cc_contact()
  {
  var e = document.getElementById("cclist").value;
  var t = document.getElementById("cc_email").value;
  document.getElementById("cc_email").value = e+" , "+t;
  document.getElementById("cclist").value ='';
  }
  </script>

  {{else}}
  <input type="text" name="cc_email" id="cc_email" value="{{$cc_email}}" style="width:1000px;height: 28px;" placeholder="Enter CC email addresses (comma separated)" autocomplete="off" />
  <br><small style="color:#666;">No contact suggestions available — type CC emails manually (comma separated).</small>
  {{/if}}
 </td>
 </tr>

<tr style="height: 32px;">
 <th>BCC:</th>
 <td colspan="7"> 
 <input type="hidden" name="bcc_email" value="emailbackup@cgfb.com.au" />
 emailbackup@cgfb.com.au (automatically included)
 </td>
 </tr>

 <tr>
 <th>Subject:</th>
 <td colspan="7"> 
 <input type="text" name="subject" value="{{$subject}} - {{$businessName}} {{if $eml_code}}({{$eml_code}}){{/if}}" style="width: 1000px;height: 28px;" />
 </td>
 </tr>

<tr>
<th>Email Content</th>
<td colspan="7"> 
<textarea name="content" id="letterContent" cols="100" rows="15">{{$email_content}}</textarea>
</td>
</tr>

{{if $existing_file}}
<tr style="height: 33px;">
<th>Uploaded File:</th>
<td colspan="7">
    <a href="/{{$BASEFOLDER}}.download_content?file_name={{$existing_file}}&module_name={{$BASEFOLDER}}.home" target="_blank" style="color: #0066cc;">📎 {{$existing_file}}</a>
    <input type="hidden" name="existing_file" value="{{$existing_file}}" />
</td>
</tr>
{{/if}}

{{if $additionalFiles}}
<tr style="height: 33px;" id="additional-files-row">
<th>Additional Files:</th>
<td colspan="7">
    {{foreach from=$additionalFiles item=file}}
        <div class="compose-additional-file" style="margin: 2px 0;">
            <a href="/{{$BASEFOLDER}}.download_content?file_name={{$file}}&module_name={{$BASEFOLDER}}.home" target="_blank" style="color: #0066cc;">📎 {{$file}}</a>
            <a href="javascript:void(0);" onclick="removeAdditionalFile(this); return false;" title="Remove from this email" style="color:#c00; font-weight:bold; text-decoration:none; margin-left:8px; font-size:16px; line-height:1;">&times;</a>
            <input type="hidden" name="additional_files[]" value="{{$file}}" />
        </div>
    {{/foreach}}
    <small style="color:#666;">Click &times; to remove a file from this email only (it stays on the letter record).</small>
</td>
</tr>
{{/if}}


<tr style="height: 33px;">
<th>Attachment Files:</th>
<td colspan="7"> 
<input type="file" name="attachment_file1" style="width: 200px;" />
</td>
</tr>

<tr style="height: 33px;">
<th>Attachment File 2:</th>
<td colspan="7"> 
<input type="file" name="attachment_file2" style="width: 200px;" />
</td>
</tr>

<tr style="height: 33px;">
<th>Attachment File 3:</th>
<td colspan="7"> 
<input type="file" name="attachment_file3" style="width: 200px;" />
</td>
</tr>

<tr>
<th>Signature</th>
<td>
    <select name="signatureId" class="" style="width: 645px !important;">
   
    {{foreach from=$signature key="key" item="item"}}
        <option value="{{$item.es_id}}" {{if $item.selected}}selected{{/if}}>{{$item.es_name}}</option>
    {{/foreach}}
</td>
</tr>

<tr style="height: 48px;">
<td colspan="8" align="center"> 
<input type="submit" name="send" value="Send Email" class="vsml"/>
 <input type="button" name="close" value="Close" onclick="parent.$.fancybox.close();"  class="vsml" />
</td>
</tr>
</table>

</form>

</div>

<script>
// Initialize any required JavaScript here
if (typeof CKEDITOR !== 'undefined') {
    CKEDITOR.replace('letterContent');
}

function removeAdditionalFile(btn) {
	var row = btn;
	while (row && ('' + row.className).indexOf('compose-additional-file') === -1) {
		row = row.parentNode;
	}
	if (!row || !row.parentNode) {
		return;
	}
	var parentTd = row.parentNode;
	parentTd.removeChild(row);
	var remaining = parentTd.querySelectorAll('.compose-additional-file');
	if (!remaining || remaining.length === 0) {
		var tr = document.getElementById('additional-files-row');
		if (tr && tr.parentNode) {
			tr.parentNode.removeChild(tr);
		}
	}
}

</script>
