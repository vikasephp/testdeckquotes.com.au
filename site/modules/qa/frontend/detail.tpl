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
      <form name="detail" method="post" action="{{$XFA.detail}}" >
        <table id="list-table" width="100%">
            <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
           {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
            <tr>
                <th width="100">Question:</th>
                  <td width="500">
                   <table  width="500" id="none-table22"><tr><td>
                <td><textarea cols="100" rows="3" name="{{$TABLE}}[qa_question]" class="tinymce">{{$detail.qa_question}} </textarea>
                </td></tr></table>
                 </td>
            </tr>        
            <tr>
                <th>Answer:</th>
                <td width="500">
                <table  width="500" id="none-table22"><tr><td>
                <textarea cols="100" rows="5"name="{{$TABLE}}[qa_answer]" class="tinymce">{{$detail.qa_answer|stripslashes}}</textarea>    
                </td></tr></table>
                </td>
            </tr>
          
       		<tr>
                <th width="20">Status:</th>
                <td>
                    <select name="{{$TABLE}}[qa_status]" class="input" style="width:180px;" />
                        <option value="Inactive" {{if $detail.qa_status == "Inactive" }} selected {{/if}}> Inactive</option> 
                        <option value="Active" {{if $detail.qa_status == "Active" }} selected {{/if}}> Active</option> 
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
			frmvalidator.addValidation("{{$TABLE}}[question]","req", "Please specify question.");
			frmvalidator.addValidation("{{$TABLE}}[answer]","req", "Please specify answer.");
    </script>
   {{/if}} 
</div>