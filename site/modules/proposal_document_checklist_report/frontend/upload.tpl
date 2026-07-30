<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);

//window.location.href = "{{$BASE_URL}}proposal_task_tracker.view_procedure";
</script>
{{/if}}

<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
    <h3 class="page-title">Upload Proposal Checklist Document</h3> <br />
   
  <span style="font-size:16"> <h2> Document Name : {{$doc_name}} </h2></span> <br />
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<table id="list-table" width="90%">
    <input type="hidden" name="doc[bsn_id]" value="{{$bsn_id}}" />
    <input type="hidden" name="doc[doc_id]" value="{{$doc_id}}" />
    <input type="hidden" name="doc[dpn]" value="{{$dpn}}" />
   
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
    <tr>
     <th>Upload Document </th>
     <td>
          <input type="file" name="prop_doc" />
      </td>
    </tr>
   
   <tr>
     <th>Not Required</th>
     <td>
          <input type="checkbox" name="doc[not_req]" />
      </td>
    </tr>
   
  
       
    <tr>
        <td colspan="2" style="text-align:center;">
          <input type="submit" name="subAddDetail" value="Upload" class="vsml" />
          <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
        </td>
    </tr>
</table>
</form>
    
        <script type="text/javascript">
		function closepop()
		{
		setTimeout('parent.close_win();', 500);
		//window.location.href = "{{$BASE_URL}}proposal_task_tracker.view_procedure";
		}
	</script>
    
	<script type="text/javascript" language="javascript" >
      	 	var frmvalidator  = new Validator("detail");
		frmvalidator.EnableMsgsTogether();
		frmvalidator.addValidation("task[wt_task_name]","req", "Please specify task.");
	</script>
</div>