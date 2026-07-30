<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />


{{if $opr}}
<script type="text/javascript">
window.location.href = "{{$BASE_URL}}da_builder.view_procedure";
</script>
{{/if}}

<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
    <h3 class="page-title">Add Populate Text</h3>    
   
<div style="float:left; margin-left:10px; background: #09F; color:#FFF !important; padding:8px 16px 8px 16px; margin-bottom:5px;"> 
<a href="{{$BASE_URL}}da_builder.add_populate_text/mr_id/{{$mr_id}}/rb_id/{{$rb_id}}/mr_admin_id/{{$mr_admin_id}}" class="various" title="Edit" style="color:#FFF; text-decoration:none; font-size:14px;"> Add Text </a>
</div>


<table id="list-table" width="99%">
<tr> 
<th width="80%">Text</th><th width="10%">Action</th><th width="10%">Edit/Delete</th>
       {{foreach from=$populatedata key="key" item="item"}}
       <form name="detail" method="post" action=""  enctype="multipart/form-data">
       <tr>
      	 
        <td>{{$item.pt_text}}</td>
       
           
        <td> 
        <input type = "hidden" name="rownum" value="{{$item.pt_id}}" />
        <input type="submit" name="addtext" value="Add" class="vsml" onclick="javascript:if(!confirm('Are you sure want to add this text?')) return false;" />
        </td> 
         <td> <a href="{{$BASE_URL}}da_builder.add_populate_text/pt_id/{{$item.pt_id}}/mr_id/{{$mr_id}}" class="various" title="Edit"> 
             <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
             
         <a href="{{$BASE_URL}}da_builder.delete_populate_text/pt_id/{{$item.pt_id}}/mr_id/{{$mr_id}}" onclick="javascript:if(!confirm('Are you sure want to delete ?')) return false;" title="Delete">     <img style="height: 16px;; width:16px" src="{{$BASE_URL}}css/admin/images/deletecross.png"/></a>
         </td>  
           
       </tr> 
       </form>
      {{/foreach}}

</table>
<br />
<input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />

    
        <script type="text/javascript">
		function closepop()
		{
		setTimeout('parent.close_win();', 500);
		//window.location.href = "{{$BASE_URL}}da_builder.populate_text";
		}
	</script>
    
<!--	<script type="text/javascript" language="javascript" >
      	var frmvalidator  = new Validator("detail");
		frmvalidator.EnableMsgsTogether();
		frmvalidator.addValidation("task[wt_task_name]","req", "Please specify task.");
	</script>-->
</div>