<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

{{if $opr}}
<script type="text/javascript">
window.location.href = "{{$BASE_URL}}da_builder.view_status_nr";
</script>
{{/if}}

<style>
select:checked {
  background:#F6F !important;
}
  option:hover {
  background:#F6F !important;
}
</style>

<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
    <h3 class="page-title">Add/Edit New Status</h3>    
    
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="type[ns_id]" value="{{$detail.ns_id}}" />
   
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
    <tr>
     <th>Status Option </th>
     <td><input type="text" name="type[ns_option]" style = "width:700px" value="{{$detail.ns_option}}" /></td>
    </tr>
   
  <tr>
     <th>Color Code </th>
     <td>
     <select  name="type[ns_color]" style="background:{{$detail.ns_color}}" >
       <option value ="#1ecf52" {{if $detail.ns_color eq '#1ecf52'}} selected="selected" {{/if}} style="background:#1ecf52;">Green</option>
       <option value ="#f7b900" {{if $detail.ns_color eq '#f7b900'}} selected="selected" {{/if}} style="background:#f7b900;">Amber</option>
       <option value ="#f70000" {{if $detail.ns_color eq '#f70000'}} selected="selected" {{/if}} style="background:#f70000;">Red</option>
       <option value ="#f7f700" {{if $detail.ns_color eq '#f7f700'}} selected="selected" {{/if}} style="background:#f7f700;">Yellow</option>
       <option value= "#2d5783" {{if $detail.ns_color eq '#2d5783'}} selected="selected" {{/if}} style="background:#2d5783;">Navy</option>
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
			window.location.href = "{{$BASE_URL}}da_builder.view_status_nr";
		}
	</script>
    
	<script type="text/javascript" language="javascript" >
      	 var frmvalidator  = new Validator("detail");
		frmvalidator.EnableMsgsTogether();
		frmvalidator.addValidation("type[wt_type_option]","req", "Please specify type.");
	</script>
</div>