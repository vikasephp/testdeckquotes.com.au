<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

{{if $opr}}
<script type="text/javascript">
window.location.href = "{{$BASE_URL}}{{$BASEFOLDER}}.attachments-and-comments/bsn_id/"+{{$bsnID}}+"/task_id/"+{{$task_id}};
</script>
{{/if}}

<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
    <h3 class="page-title">{{$title}} Site Progress Report Attachment & Comment</h3>    
    
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="detail[spra_id]" value="{{$detail.spra_id}}" />
	<input type="hidden" name="detail[spra_sp_id]" value="{{$detail.spra_sp_id}}" />
   
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
    <tr>
     <th>Attachment </th>
     <td>
		<input type="file" name="site_progress_report[spra_attachment]" />
		{{if $detail.spra_attachment}}
		<a href="{{$BASE_URL}}site_progress_report.download_content?file_name={{$detail.spra_attachment}}&module_name=site_progress_report.home" target="_blank" title="{{$detail.spra_attachment}}">Download</a>&nbsp;
		<a href="{{$BASE_URL}}site_progress_report.delete_attachment/spra_id/{{$detail.spra_id}}/spra_sp_id/{{$detail.spra_sp_id}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Remove Attachment"><img style="height: 14px; width:14px" src="{{$BASE_URL}}css/admin/images/deletecross.png"></a>
		{{/if}}
	</td>
    </tr>
	
	<tr>
     <th>Comment </th>
     <td><input type="text" name="detail[spra_comment]" style="width:700px" value="{{$detail.spra_comment}}" /></td>
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
		function closepop(){
			window.location.href = "{{$BASE_URL}}{{$BASEFOLDER}}.attachments-and-comments/bsn_id/"+{{$bsnID}}+"/task_id/"+{{$task_id}};
		}
	</script>
    
	<script type="text/javascript" language="javascript" >
      	var frmvalidator  = new Validator("detail");
		frmvalidator.EnableMsgsTogether();
		frmvalidator.addValidation("status[spra_comment]","req", "Please specify Comment.");
	</script>
</div>