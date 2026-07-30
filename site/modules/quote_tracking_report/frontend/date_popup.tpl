<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<script type="text/javascript" src="{{$BASE_URL}}js/ckeditor2/ckeditor.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/ckeditor2/samples/js/sample.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>

{{include file=$jdata}}
{{include file=$tiny_basic}}

{{if $opr}}
<script type="text/javascript">
//window.location.href = "{{$BASE_URL}}purchase_order.view_procedure";
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<div align="center" style="min-height:350px; margin-top:10px; z-index:999999 !important;">
    <h3 class="page-title">Add/Edit Options</h3>    
   
   
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="popup[qp_id]" value="{{$detail.qp_id}}" />
   
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
    <tr>
     <th>Project Address </th>
     <td> {{$pdata.qt_project_address}}
          <!--<input type="text"  name="task[pr_procedure]" style ="width:700px" value="{{$detail.pr_procedure}}" />-->
      </td>
    </tr>
   
    <tr>
     <th>Component</th>
     <td>{{$cn}}</td>
    </tr>
   
   
   <tr>
     <th>Status</th>
     <td><select name="popup[qp_status]">
     <option value="">Please Select</option>
     {{foreach from=$stdetail key="key" item="item"}}
      <option  {{if $detail.qp_status eq $item.qs_name}} selected="selected" {{/if}}>{{$item.qs_name}}</option>
     {{/foreach}}
     
     </td>
    </tr>
    
    <tr>
     <th>Suppliers</th>
     <td>
      	<datalist id='companies'>
           {{foreach from=$comdetail key="key2" item="item2"}}
            <option value="{{$item2.co_company_name}}" {{if $bsnid eq $item.co_id}} selected="selected" {{/if}}>
            {{$item2.co_company_name}}
            </option>
            {{/foreach}}
  	    </datalist>
         <input type="text" list = 'companies' name="popup[qp_supplier]" style ="width:700px" value="{{$detail.qp_supplier}}" />
     
     </td>
    </tr>
    
    <tr>
    <th>Comments </th>
    <td><textarea name="popup[qp_comment]" id="editor"  cols="100" rows="15"> {{$detail.qp_comment}}</textarea></td>
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
			//window.location.href = "{{$BASE_URL}}purchase_order.view_procedure";
			setTimeout('parent.close_win();', 500);
		}
	</script>
    
	<script type="text/javascript" language="javascript" >
      	 	var frmvalidator  = new Validator("detail");
		frmvalidator.EnableMsgsTogether();
		frmvalidator.addValidation("task[wt_task_name]","req", "Please specify task.");
	</script>
</div>

<script>
	initSample();
</script>