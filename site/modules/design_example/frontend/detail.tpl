<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
{{include file=$jdata}}
{{include file=$tiny_basic}}
{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<div align="center" style="min-height:350px;">
    <h3 class="page-title">{{$title}}</h3>    
    {{if $opr}}
	<div align="center" style="min-height:350px; padding-top:200"><h3>Success...!</h3></div>
    {{else}}
      <form name="detail" method="post" action="{{$XFA.detail}}" enctype="multipart/form-data">
        <table id="list-table" width="100%">
            <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
           {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}

                     <th width="100">Upload Design:</th>
                <td><input type= "file" name="docs" />{{if $detail.de_design_image}} {{$detail.de_design_image}} {{/if}}&nbsp;{.JPG, .PNG, .GIF}&nbsp;&nbsp;{Max Size 15MB}</td>
            </tr>
            <tr>
                <th>Style:</th>
                <td width="500px">
                <table width="500" id="none-table22"><tr><td>
                <input type= "text" name="{{$TABLE}}[de_style]" value="{{$detail.de_style}}" class="xlrg" style="width:480px;" /> 
                </td></tr></table>
                </td>
            </tr>
          
          
                <tr>
                <th width="20">Link:</th>
                <td>
                     <input type= "text" name="{{$TABLE}}[de_link]" value="{{$detail.de_link}}" class="xlrg" style="width:480px;" />   
                </td>
            </tr>
          
              
                <tr>
                <th width="20">Tags:</th>
                <td>
                     <input type= "text" name="{{$TABLE}}[de_tags]" value="{{$detail.de_tags}}" class="xlrg" style="width:480px;" />   
                </td>
            </tr>
          
          
            <tr>
                <th width="20">Status:</th>
                <td>
                    <select name="{{$TABLE}}[de_status]" class="input" style="width:180px;" />
                    <option value="Inactive" {{if $detail.de_status == "Inactive"}} selected {{/if}}>Inactive</option> 
                    <option value="Active" {{if $detail.de_status == "Active"}} selected {{/if}}>Active</option> 
                    </select>    
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:center;">
                    <input type="submit" name="subAddDetail" value="Save" class="vsml" />
                    <input type="button" name="btnCancelDetail" value="Cancel" onclick="javascript:parent.$.fancybox.close();" class="vsml" />
                </td>
            </tr>
        </table>
    </form>
	<script type="text/javascript" language="javascript" >
        var frmvalidator  = new Validator("detail");
			frmvalidator.EnableMsgsTogether();
			frmvalidator.addValidation("{{$TABLE}}[title]","req", "Please specify title.");
    </script>
   {{/if}} 
</div>