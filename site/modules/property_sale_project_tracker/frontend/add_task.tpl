<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />

	<script src="{{$BASE_URL}}ckeditor2/ckeditor.js"></script>
	<script src="{{$BASE_URL}}ckeditor2/samples/js/sample.js"></script>

	<script type="text/javascript">
           CKEDITOR.replace( 'editor1' );
           CKEDITOR.add  
    </script>

{{if $opr}}
<script type="text/javascript">
//setTimeout('parent.close_win();', 500);
window.location.href = "{{$BASE_URL}}property_sale_project_tracker.view_task/st_id/{{$st_id}}";
</script>
{{/if}}

<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
    <h3 class="page-title">Add/Edit New Task </h3>    
   
   
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="task[tm_id]" value="{{$detail.tm_id}}" />
    <input type="hidden" name="task[tm_stage_id]" value="{{$st_id}}" />
   
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
    <tr>
     <th>Step Number</th>
     <td>
          <input type="text"  name="task[tm_step_number]" style ="width:700px" value="{{$detail.tm_step_number}}"  required="required"/>
      </td>
    </tr>
       
    <tr>
     <th>Task Option</th>
     <td>
          <input type="text"  name="task[tm_task]" style ="width:700px" value="{{$detail.tm_task}}"  required="required"/>
      </td>
    </tr>
    
     <tr>
     <th>Task Summary (Description)</th>
     <td>
         <textarea cols="120" rows="16"name="task[tm_task_summary]"  id="editor1" class="ckeditor" >{{$detail.tm_task_summary}}</textarea>
      </td>
    </tr>
    
     <tr>
     <th>Position Responsible</th>
     <td>
          <input type="text"  name="task[tm_position_resp]" style ="width:700px" value="{{$detail.tm_position_resp}}"  />
      </td>
    </tr>
   
    <tr>
     <th>Procedure Link </th>
     <td>
          <input type="text"  name="task[tm_proc_link]" style ="width:700px" value="{{$detail.tm_proc_link}}"  />
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
		window.location.href = "{{$BASE_URL}}property_sale_project_tracker.view_task/st_id/{{$st_id}}";
		}
	</script>
    
</div>