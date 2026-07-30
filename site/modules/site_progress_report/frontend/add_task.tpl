<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />


{{if $opr}}
<script type="text/javascript">
//setTimeout('parent.close_win();', 500);
window.location.href = "{{$BASE_URL}}site_progress_report.view_task";
</script>
{{/if}}

<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
    <h3 class="page-title">Add/Edit New Report Type</h3>    
   
   
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="type[tn_id]" value="{{$detail.tn_id}}" />
   
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
    <tr>
     <th>Report Type</th>
     <td>
          <input type="text"  name="type[tn_name]" style ="width:700px" value="{{$detail.tn_name}}"  required="required"/>
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
		window.location.href = "{{$BASE_URL}}site_progress_report.view_task";
		}
	</script>

</div>