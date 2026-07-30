<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<div align="center" style="min-height:350px;">
    <h3 class="page-title">{{$title}}</h3>    
   
   
<form name="detail" method="post" action="{{$XFA.detail}}"  enctype="multipart/form-data">
<table id="list-table" width="100%">
 {{if $msg }} <div style="color:#F00; font-size:14px">{{$msg}}</div> {{/if}}
    <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
    <tr>
     <th>Icon Name</th>
     <td> <select name="{{$TABLE}}[ic_icon_name]" {{if $ic_id gt 0 }} disabled="disabled" {{/if}}>
        {{foreach from=$keydata key="key" item="item"}}
        <option value="{{$item.dik_keyfeature}}" {{if $detail.ic_icon_name eq $item.dik_keyfeature }} selected="selected"{{/if}}>
        <img src="http://localhost/gcon_backup_July_2014/files/asset_list/bathroom.png" />{{$item.dik_keyfeature}}</option>
        {{/foreach}}
        </select>
           
      </td>
    </tr>
   
    <tr>
     <th>Color</th>
     <td>
     <input type="text" name="{{$TABLE}}[ic_icon_color]"  value="{{$detail.ic_icon_color}}" style ="width:400px" /> </td>
    </tr>
   

   <tr>
        <th>Icon</th>
        <td>
        <input type="file" name="image1" />
        
          {{if $detail.ic_icon_image}} <img src="{{$BASE_URL}}files/asset_list/{{$detail.ic_icon_image}}"  height="70" />
            <a href="{{$BASE_URL}}icon_list.detail/ic_id/{{$detail.$ID}}/docid/{{$detail.$ID}}" onclick="javascript:if(!confirm('Are you sure want to delete the image?')) return false;" title="Delete">
        <img style="height: 16px;; width:16px" src="{{$BASE_URL}}css/admin/images/deletecross.png"/></a>
        {{/if}}
        </td>
     </tr>
  
   <tr>
     <th>Image Type</th>
     <td>{{$type}}</td>
    </tr>
  
   <tr>
     <th>Icon Text</th>
     <td><textarea name="{{$TABLE}}[ic_icon_text]" cols="160" rows="4" id="myInput" >{{$detail.ic_icon_text}}</textarea><br />
     <input type="button" onclick="myFunction()" value="Copy Text" />
     
     <script type="application/javascript">
     
     function myFunction() {
  /* Get the text field */
	  var copyText = document.getElementById("myInput");
	
	  /* Select the text field */
	  copyText.select();
	  copyText.setSelectionRange(0, 99999); /* For mobile devices */
	
	   /* Copy the text inside the text field */
	  navigator.clipboard.writeText(copyText.value);
	
	  /* Alert the copied text */
	  alert("Icon Text has been copied. Now you paste it any where");
    }
     </script>
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
		}
	</script>
    
	<script type="text/javascript" language="javascript" >
        var frmvalidator  = new Validator("detail");
			frmvalidator.EnableMsgsTogether();
			frmvalidator.addValidation("{{$TABLE}}[al_item]","req", "Please specify item.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_company_name]","req", "Please specify company name.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_contact_name]","req", "Please specify contact name.");
    </script>
</div>