<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css?timestamp={{ $time_css }}" />


{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<div align="center" style="min-height:350px;"><br /><br /> 
    <h3 class="page-title">{{$title}}</h3>   <br /><br /> 
   
   
<form name="detail" method="post" action="/{{$XFA.detail}}/question_id/{{$detail.question_id}}"  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="{{$TABLE}}[bsn_id]" value="{{$detail.bsn_id}}" />
    <input type="hidden" name="{{$TABLE}}[event_id]" value="{{$detail.event_id}}" />
    <input type="hidden" name="{{$TABLE}}[event_key]" value="{{$detail.event_key}}" />
    <input type="hidden" name="{{$TABLE}}[question_id]" value="{{$detail.question_id}}" />
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
    
   <tr>
     <th>Project Name</th>
     <td><!--<input  type="text" name="{{$TABLE}}[de_default_event]"  value="{{$detail.de_default_event}}" style="width:700px;"  />--> </td>
    </tr>
  
    <tr>
     <th>Event Name</th>
     <td><input  type="text" name="{{$TABLE}}[de_default_event]"  value="{{$detail.de_default_event}}" style="width:700px;"  /> </td>
    </tr>
  
    <tr>
     <th>Start Date</th>
     <td><input  type="text" name="{{$TABLE}}[start_date]"  value="{{$detail.start_date}}" style="width:700px;"  /> </td>
    </tr> 
    
    <tr>
     <th>End Date</th>
     <td><input  type="text" name="{{$TABLE}}[end_date]"  value="{{$detail.end_date}}" style="width:700px;"  /> </td>
    </tr>
  
    <tr>
     <th>Enquries</th>
     <td><input  type="text" name="{{$TABLE}}[question]"  value="{{$detail.question}}" style="width:700px;"  /> </td>
    </tr>
    
     <tr>
     <th>Answer</th>
     <td><input  type="text" name="{{$TABLE}}[answer]"  value="{{$detail.answer}}" style="width:700px;"  /> </td>
    </tr>
     <tr>
     <th>Attachment</th>
     <td><input  type="file" name="fileToUpload"    /> </td>
    </tr>
  
    <tr>
        <td colspan="2" style="text-align:center;">
          <input type="submit" name="subAddDetail" value="Save" class="vsml" />
          <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
        </td>
    </tr>
</table>

{{if $success_alert }} <div class="alert_info"> {{ $success_alert }} </div> {{/if}}
</form>
    
    <script type="text/javascript">
		function closepop()
		{
		setTimeout('parent.close_win();', 500);
		}
	</script>
    
	<script type="text/javascript" language="javascript" >
        	var frmvalidator  = new Validator("detail");
		frmvalidator.EnableMsgsTogether();
		frmvalidator.addValidation("{{$TABLE}}[rl_reffering_address]","req", "Please specify referring address.");
	
			
    </script>
</div>

