<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />


{{if $opr}}
<script type="text/javascript">
//setTimeout('parent.close_win();', 500);
//window.location.href = "{{$BASE_URL}}business.view_procedure";
</script>
{{/if}}

<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
    <h3 class="page-title">Archived Checlist</h3>  <br /><br />  
   
   
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="task[pr_id]" value="{{$detail.pr_id}}" />
   
   {{if $msg}} <tr><th colspan="2" style="color:#FF0000;">{{$msg}}</th></tr>{{/if}}
   
    <tr>
     <th>Checklist Number : {{$dpn_unique_id}} </th>
    </tr>
    {{if $un eq 1}}
    
    <tr>
     <th>If you want to UNARCHIVE (Active) this checklist please click on the below button </th>
    </tr>
        
    <tr>
        <td colspan="2" style="text-align:center;">
          <input type="submit" name="subAddDetail" value="Active This Checklist" class="vsml" />
          <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:parent.$.fancybox.close();" class="vsml" />
        </td>
    </tr>
    
    
    
    {{else}}
    <tr>
     <th>If you want to archived this checklist please click on the below button </th>
    </tr>
        
    <tr>
        <td colspan="2" style="text-align:center;">
          <input type="submit" name="subAddDetail" value="Archive This Checklist" class="vsml" />
          <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:parent.$.fancybox.close();" class="vsml" />
        </td>
    </tr>
   {{/if}} 
    
</table>
</form>
    
        <script type="text/javascript">
		function closepop()
		{
		//setTimeout('parent.close_win();', 500);
		window.location.href = "{{$BASE_URL}}30_days_rec_report.view_procedure";
		}
	</script>
    
	<script type="text/javascript" language="javascript" >
      	 	var frmvalidator  = new Validator("detail");
		frmvalidator.EnableMsgsTogether();
		frmvalidator.addValidation("task[wt_task_name]","req", "Please specify task.");
	</script>
</div>