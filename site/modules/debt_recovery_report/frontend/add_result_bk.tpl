<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />

{{if $opr}}
<script type="text/javascript">
//setTimeout('parent.close_win();', 500);
window.location.href = "{{$BASE_URL}}debt_recovery_report.view_result";
</script>
{{/if}}

<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
    <h3 class="page-title">Add/Edit New Call Result Option</h3>    
   
   
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="task[cr_id]" value="{{$detail.cr_id}}" />
   
     <tr>
     <th>Project Name</th>
     <td>{{$data.dr_project_address}}</td>
    </tr>
   
   
   
   <tr>
     <th>Notes</th>
     <td>
          <input type="text"  name="task[cr_option]" style ="width:700px" value="{{$detail.cr_option}}"  required="required"/>
      </td>
    </tr>
  
       
    <tr>
        <td colspan="2" style="text-align:center;">
          <input type="submit" name="subAddDetail" value="Save" class="vsml" />
          <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:parent.$.fancybox.close();" class="vsml" />
        </td>
    </tr>
</table>
</form>
    
        <script type="text/javascript">
		function closepop()
		{
		//setTimeout('parent.close_win();', 500);
		window.location.href = "{{$BASE_URL}}debt_recovery_report.view_result";
		}
	</script>
    
</div>