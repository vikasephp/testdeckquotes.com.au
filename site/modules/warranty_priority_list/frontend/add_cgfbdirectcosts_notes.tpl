<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />

{{if $opr}}
<script type="text/javascript">
window.location.href = "{{$BASE_URL}}warranty_log2.view_cgfbdirectcosts_notes/wa_id/{{$wa_id}}";
</script>
{{/if}}

<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
    <h3 class="page-title">{{$title}}</h3>    
    
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="type[cdcn_id]" value="{{$detail.cdcn_id}}" />
	<input type="hidden" name="type[cdcn_wa_id]" value="{{$wa_id}}" />
	<input type="hidden" name="type[cdcn_added_by]" value="{{$added_by}}" />
	<input type="hidden" name="type[cdcn_added_date]" value="{{$added_date}}" />
   
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
    <tr>
     <th>Note </th>
     <td><textarea name="type[cdcn_notes]" rows="7" style="width:99%;">{{$detail.cdcn_notes}}</textarea></td>
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
		function closepop()
		{
			window.location.href = "{{$BASE_URL}}warranty_log2.view_cgfbdirectcosts_notes/wa_id/{{$wa_id}}";
		}
	</script>
    
	<script type="text/javascript" language="javascript" >
      	 	var frmvalidator  = new Validator("detail");
		frmvalidator.EnableMsgsTogether();
		frmvalidator.addValidation("type[cdcn_notes]","req", "Please specify note.");
	</script>
</div>