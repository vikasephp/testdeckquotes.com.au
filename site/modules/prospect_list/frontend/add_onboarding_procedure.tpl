<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />

{{if $opr}}
<script type="text/javascript">
//setTimeout('parent.close_win();', 500);
window.location.href = "{{$BASE_URL}}prospect_list.view_onboarding_procedure/bsn_id/{{$bsn_id}}";
</script>
{{/if}}

<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
<h3 class="page-title">{{$op_title}} Standard Procedure</h3>       
   
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="task[osp_id]" value="{{$detail.osp_id}}" />
   
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
    <tr>
     <th>Document Sequence</th>
     <td>
          <input type="text" name="task[osp_doc_sequence]" style="width:700px" value="{{$detail.osp_doc_sequence}}" />
      </td>
    </tr>
   
	<tr>
		<th>Document Link</th>
		<td>
			<input type="text" name="task[osp_doc_link]" style="width:700px" value="{{$detail.osp_doc_link}}" />
		</td>
    </tr>
	
	<tr>
		<th>Document Description</th>
		<td>
			<textarea name="task[osp_description]" style="width:95%;" rows="5">{{$detail.osp_description}}</textarea>
		</td>
    </tr>
	
	<tr>
		<th>Person Responsible</th>
		<td>
			<input type="text" name="task[osp_person_responsible]" style="width:700px" value="{{$detail.osp_person_responsible}}" />
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
		function closepop()
		{
		//setTimeout('parent.close_win();', 500);
		window.location.href = "{{$BASE_URL}}prospect_list.view_onboarding_procedure/bsn_id/{{$bsn_id}}";
		}
	</script>
    
	<script type="text/javascript" language="javascript" >
      	 	var frmvalidator  = new Validator("detail");
		frmvalidator.EnableMsgsTogether();
		frmvalidator.addValidation("task[osp_doc_name]","req", "Please specify task.");
	</script>
</div>