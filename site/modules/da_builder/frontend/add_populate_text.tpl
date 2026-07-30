<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<!--<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />-->
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />

	<script src="{{$BASE_URL}}ckeditor2/ckeditor.js"></script>
	<script src="{{$BASE_URL}}ckeditor2/samples/js/sample.js"></script>

	<script type="text/javascript">
           CKEDITOR.replace( 'editor1' );
           CKEDITOR.add  
        </script>
        
        <script type="text/javascript">
           CKEDITOR.replace( 'editor2' );
           CKEDITOR.add  
        </script>

{{if $opr}}
<script type="text/javascript">
window.location.href = "{{$BASE_URL}}da_builder.view_populate_text/mr_id/{{$mr_id}}/rb_id/{{$rb_id}}/mr_admin_id/{{$mr_admin_id}}";
</script>
{{/if}}

<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
    <h3 class="page-title">Add/Edit Populate Text</h3>    
   
   
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="task[pt_id]" value="{{$detail.pt_id}}" />
    <input type="hidden" name="task[pt_mr_id]" value="{{$mr_id}}" />
    <input type="hidden" name="mr_id" value="{{$mr_id}}" />
   
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
    <tr>
     <th>Text </th>
     <td>
         <!-- <input type="text"  name="task[pt_text]" style ="width:700px" value="{{$detail.pt_text}}" />-->
          <textarea cols="150" rows="5" name="task[pt_text]" id="editor1" class="ckeditor">{{$detail.pt_text}}</textarea> 
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
		window.location.href = "{{$BASE_URL}}da_builder.view_populate_text/mr_id/{{$mr_id}}/rb_id/{{$rb_id}}/mr_admin_id/{{$mr_admin_id}}";
		}
	</script>
    
	<script type="text/javascript" language="javascript" >
      	 	var frmvalidator  = new Validator("detail");
		frmvalidator.EnableMsgsTogether();
		frmvalidator.addValidation("task[wt_task_name]","req", "Please specify task.");
	</script>
</div>