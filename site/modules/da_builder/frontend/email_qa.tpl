<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />

{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<div align="center" style="min-height:350px; margin-top:20px;">
    <h3 class="page-title">Email Rule</h3> <br />   
   
   
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<table id="list-table" width="100%" cellpadding="12">
    <input type="hidden" name="rule[rr_id]" value="{{$detail.rr_id}}" />
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
    <tr>
     <th>Enter Email Id :</th>
     <td><input type="email" name="email_id" style="width:600px;"  required="required" /></td>
    </tr>
   
    <tr>
     <th>Enter Subject :</th>
     <td><input type="text" name="subject" style="width:600px;" required="required"/></td>
    </tr>
  
      <tr>
        <td colspan="2" style="text-align:center;">
          <input type="submit" name="email_qa" value="Email" />
          <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
        </td>
    </tr>
</table>
</form>
 
 {{if $msg }}<div style="text-align:center; font-size:16px; color:#0C3;"> {{$msg}} {{/if}}
    
        <script type="text/javascript">
		function closepop()
		{
			setTimeout('parent.close_win();', 500);
		}
	     </script>
    

</div>

