<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />


<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

<style>
.tabl {font-size:12px;}
.tbl td {font-size:12px;}

</style>


{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<div align="center" style="min-height:350px;">
    <h3 class="page-title">{{$title}}</h3>    
   
  <table  width="95%" class="tbl">
  {{foreach from = $notesData key="key" item="item"}}
    <tr>
    
   
    <td style="width:50%;"><span style="color:#0CF;"> {{$item.user_name}} &nbsp; [{{$item.wn_date}}]</span> <br />
     <div style="background: #f0f4f8;display: inline-block; padding:5px; margin-left:10px; margin-top:2px; border-radius:5px;">		
        {{$item.wn_notes}} {{if $item.wn_doc}} | <a href="{{$BASE_URL}}files/mistake_log/{{$item.wn_doc}}" /> Download Document {{/if}}
     </div>
    </td> 
     
    </tr>
    {{/foreach}}
  </table>
  <br />
   
<form name="detail" method="post" action="{{$XFA.detail}}"  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="notes[wn_log_id]" value="{{$id}}" />
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
     <tr>
        <th>Reply:</th>
        <td>
        <textarea rows="4" cols="180" name="notes[wn_notes]"  ></textarea></td>
     </tr>
  <tr>
     <th>Upload Document</th>
     <td> <input type="file" name="replydoc" /></td>
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
		setTimeout('parent.close_win();', 500);
		}
	</script>
    
	<script type="text/javascript" language="javascript" >
        var frmvalidator  = new Validator("detail");
			frmvalidator.EnableMsgsTogether();
			frmvalidator.addValidation("notes[mn_notes]","req", "Please enter replay.");
			
    </script>
</div>

<script>
	initSample();
</script>