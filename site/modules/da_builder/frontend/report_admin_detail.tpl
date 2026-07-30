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

{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
//window.location.href = "{{$BASE_URL}}da_builder.home";
</script>
{{/if}}

<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
    <h3 class="page-title">Report Builder Admin</h3>    
   
   
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="rbadmin[ra_id]" value="{{$detail.ra_id}}" />
   
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
     <tr>
     <th>Row Order</th>
     <td>
          <input type="text"  name="rbadmin[ra_order]" style ="width:700px" value="{{$detail.ra_order}}" />
      </td>
    </tr>
   
    <tr>
     <th>Name</th>
     <td>
          <input type="text"  name="rbadmin[ra_name]" style ="width:700px" value="{{$detail.ra_name}}" />
      </td>
    </tr>
   
     <tr>
     <th>Theme/Control</th>
     <td>
          <input type="text"  name="rbadmin[ra_theme]" style ="width:700px" value="{{$detail.ra_theme}}" />
      </td>
    </tr>
   <tr>
     <th>Specifications</th>
     <td><textarea cols="150" rows="5" name="rbadmin[ra_specification]" id="editor1" class="ckeditor">{{$detail.ra_specification}}</textarea>  </td>
    </tr>
   
   <tr>
     <th>Status</th>
     <td> <select name="rbadmin[ra_status]">
            {{foreach from = $statusdetail key="key" item="item"}}
           <option value="{{$item.rs_status}}" {{if $item.rs_status eq $detail.ra_status }} selected="selected" {{/if}}>{{$item.rs_status}}</option>
           {{/foreach}}
           </select>
      </td>
    </tr>
   
   
    <tr>
     <th>Critria</th>
     <td>
          <textarea cols="150" rows="5" name="rbadmin[ra_criteria]">{{$detail.ra_criteria}}</textarea>  
         <!-- <input type="text"  name="rbadmin[ra_criteria]" style ="width:700px" value="{{$detail.ra_criteria}}" />-->
      </td>
    </tr>
     
    <tr>
     <th>Critria</th>
     <td>
          <textarea cols="150" rows="5" name="rbadmin[ra_criteria]">{{$detail.ra_criteria}}</textarea>  
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
			setTimeout('parent.close_win();', 500);
			//window.location.href = "{{$BASE_URL}}da_builder.home";
		}
	</script>
    
	<script type="text/javascript" language="javascript" >
      	var frmvalidator  = new Validator("detail");
		frmvalidator.EnableMsgsTogether();
		frmvalidator.addValidation("rbadmin[wt_task_name]","req", "Please specify task.");
	</script>
</div>