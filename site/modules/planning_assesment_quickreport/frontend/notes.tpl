<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />

<!--{{if $opr}}
<script type="text/javascript">
window.location.href = "{{$BASE_URL}}planning_assesment_quickreport.view_alert";
</script>
{{/if}}-->

<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
    <h3 class="page-title">Add/Edit Notes</h3>    
    
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="notes[bsn_id]" value="{{$detail.pa_id}}" />
   
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
    <tr>
     <th>Alert Option </th>
     <td><textarea id="alertText" name="notes[bs_paqr_alerttext]" cols="120" rows="7" >{{$detail.bs_paqr_alerttext}}</textarea></td>
    </tr>
   
 
    <tr>
        <td colspan="2" style="text-align:center;">
		  <input type="button" id="btnMissedCall" value="Missed Call" class="vsml" onclick="addMissedCall();" />
          <input type="submit" name="subAddDetail" value="Save" class="vsml" />
          <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:parent.$.fancybox.close();" class="vsml" />
        </td>
    </tr>
</table>
</form>
    
    <script type="text/javascript">
		function closepop()
		{
			window.location.href = "{{$BASE_URL}}planning_assesment_quickreport.view_alert";
		}
	</script>
	
	<script type="text/javascript">
	function addMissedCall()
	{
		var button = document.getElementById("btnMissedCall");
		button.disabled = true;
		button.value = "Added";

		var user = "{{$user_name}}";
		var date = "{{$current_datetime}}";

		var text = user + " – Missed Call – " + date;

		var textarea = document.getElementById("alertText");

		var current = textarea.value.replace(/^\s+|\s+$/g, "");

		if (current !== "")
		{
			textarea.value = text + "\n\n" + current;
		}
		else
		{
			textarea.value = text;
		}
		
		textarea.value = textarea.value + " ";
		textarea.focus();
		textarea.selectionStart = textarea.selectionEnd = textarea.value.length;
	}
	</script>
    

</div>