<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/ckeditor2/ckeditor.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/ckeditor2/samples/js/sample.js"></script>

{{include file=$jdata}}
{{include file=$tiny_basic}}

{{if $opr}}
<script type="text/javascript">
//setTimeout('parent.close_win();', 500);
//window.location.href = "{{$BASE_URL}}debt_recovery_report.view_result";
</script>
{{/if}}

<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
    <h3 class="page-title">Email Sent to Client</h3>    
   
   
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="task[cr_id]" value="{{$detail.cr_id}}" />
   
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
    <tr>
     <th>Project Name </th>
     <td> <input type="text"  name="email[project]" style ="width:700px" value="{{$data.dr_project_address}}"  required="required"/></td>
    </tr>
    
    <tr>
     <th>Send Email To</th>
     <td>
          <input type="text"  name="email[email_to]" style ="width:700px" value="{{$to}}"  required="required"/>
      </td>
    </tr>
   
     <tr>
     <th>Notes</th>
     <td><textarea name="email[dr_notes]" id="editor"  cols="100" rows="15">{{$data.dr_notes}}</textarea> </td>
     </tr>
  
       
    <tr>
        <td colspan="2" style="text-align:center;">
          <input type="submit" name="subAddDetail" value="Send Email" class="vsml" />
          <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
        </td>
    </tr>
</table><br />
<div style="font-size:18px; color:#0C9;">{{if $msg}} {{$msg}} {{/if}} </div>d
</form>
    
        <script type="text/javascript">
		function closepop()
		{
		setTimeout('parent.close_win();', 500);
		//window.location.href = "{{$BASE_URL}}debt_recovery_report.view_result";
		}
	</script>
    
</div>
<script>
	initSample();
</script>