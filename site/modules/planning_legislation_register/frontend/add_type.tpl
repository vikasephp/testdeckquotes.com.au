<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />

{{if $opr}}
<script type="text/javascript">
window.location.href = "{{$BASE_URL}}{{$BASEFOLDER}}.view_type";
</script>
{{/if}}

<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
<h3 class="page-title">{{$title}} Type</h3>    
    
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="type[pd_id]" value="{{$detail.pd_id}}" />
   
    <tr>
     <th>Document Type</th>
     <td><input type="text" name="type[pd_doc_type]" style = "width:700px" value="{{$detail.pd_doc_type}}" /></td>
    </tr>
    
     <tr>
     <th>Description</th>
     <td><input type="text" name="type[pd_description]" style = "width:700px" value="{{$detail.pd_description}}" /></td>
    </tr>
   
    <tr>
     <th>Hierarchy</th>
     <td><input type="text" name="type[pd_hierarchy]" style = "width:700px" value="{{$detail.pd_hierarchy}}" /></td>
    </tr>
    
    <tr>
     <th>Status</th>
     <td> 
     <select name = "type[pd_active]">
        <option value="0" {{if $detail.pd_active eq 0}} selected="selected" {{/if}}>InActive</option>
        <option value="1" {{if $detail.pd_active eq 1}} selected="selected" {{/if}}>Active</option>
     </select>
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
	window.location.href = "{{$BASE_URL}}{{$BASEFOLDER}}.view_type";
}
</script>

<script type="text/javascript" language="javascript" >
	var frmvalidator  = new Validator("detail");
	frmvalidator.EnableMsgsTogether();
	frmvalidator.addValidation("type[bacs_option]","req", "Please specify Option.");
</script>
</div>