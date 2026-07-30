<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />



{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}


<div align="center" style="min-height:350px; z-index:9999999;">
    <h3 class="page-title"><br />Hot Button </h3><br /><br />    
   
   
<form name="detail" method="post" action=""  enctype="multipart/form-data">


<table id="list-table" width="90%" cellpadding="15">
<tr> 
<th width="50%">
Enter Text Message :
<textarea name="message" cols="80" rows="3"></textarea><br />
<input type="submit" name="text_cust" value="Custom Text customer" /></th> 
<th><input type="submit" name="task_complete" value="Task Box Sent – 302 Complete" /> </th>

</tr>
<tr> 
<th width="50%"><input type="submit" name="email_survey" value="Email Survey email MS-0515" /></th> 
<th><input type="submit" name="email_missing" value="Email Missing Details MS-0128" /></th>
</tr>

<tr> 
<th><input type="submit" name="survey_link" value="Survey Link" /></th> 
<th><input type="submit" name="email_meeting" value="Email Meeting Request - MS-0026" /></th>
</tr>
 
</tr>
<tr> 
<th width="50%"><input type="submit" name="survey_remainder" value="Survey Reminder Text" /></th> 
<th>
<input type="hidden" name="wa_id" value="{{$wa_id}}" />
<input type="submit" name="wap" value="Warranty Liability Acceptance" /><br />
{{if $msgwap}}<span style="color:#0C6">{{$msgwap}}</span> {{/if}}
</th>
</tr>

</tr>
<tr> 
<th width="50%"><input type="submit" name="grany_flat_videos" value="Granny flat videos" /><br />To be developed latter</th> 
<th><input type="submit" name="what_happens_next" value="What Happens Next" /><br />To be developed latter</th>
</tr>

{{if $msg}}<tr> <th colspan="2"><div style="text-align:center; color:#0C3; font-size:16px;">{{$msg}}</div> </th></tr>{{/if}}

</table><br /><br />


<!--<input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />-->
<input type="button" name="btnCancelDetail" value="Close" onclick="javascript:parent.$.fancybox.close();" class="vsml" />
</form>
    
    	<script type="text/javascript">
		function closepop()
		{
		setTimeout('parent.close_win();', 500);
		}
	</script>
    

</div>
