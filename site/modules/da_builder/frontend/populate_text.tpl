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
   
   

<table id="list-table" width="99%">
<tr> 
<th width="85%">Procedure</th><th width="15">Action</th>
       {{foreach from=$textdata key="key" item="item"}}
       <form name="detail" method="post" action=""  enctype="multipart/form-data">
       <tr>
      	 
        <td>{{$item.rr_text}}</td>
       
           
        <td> 
        <input type = "hidden" name="rownum" value="{{$item.rr_id}}" />
        <input type="submit" name="addtext" value="Add" class="vsml" onclick="javascript:if(!confirm('Are you sure want to add this text?')) return false;" />
        <!--<input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />-->
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