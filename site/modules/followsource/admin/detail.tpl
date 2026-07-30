<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
<div align="center">
    <h3 class="page-title">{{$title}}</h3> 
    <form name="detail" method="post" action="{{$XFA.detail}}">
        <table id="list-table" width="90%">
            <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />  
         <tr><td colspan="2" height="20px">&nbsp;</td></tr>
            <tr>
                <th>Follows  Source Type:</th>
                <td><input type= "text" name="{{$TABLE}}[sfo_name]" value="{{$detail.sfo_name}}" class="xlrg" /></td>
            </tr>
         <tr>
            <th> Status :</th>
            <td> <select name="{{$TABLE}}[sfo_status]" class="lrg" style="width:150px;">
        	     <option value="Active" {{if $detail.sfo_status == 'Active'}} selected="selected" {{/if}}> Active </option>
               	 <option value="InActive" {{if $detail.sfo_status == 'InActive'}} selected="selected" {{/if}}> InActive </option>
          		 </select> 
           </td>
        </tr> 
        <tr><td colspan="2" height="20px">&nbsp;</td></tr>
            <tr>
                <td colspan="2" style="text-align:center;">
                    <input type="submit" name="subAddDetail" value="Save" class="vsml" />
                    <input type="button" name="btnCancelDetail" value="Cancel" onclick="document.location.href='{{$BASE_URL}}{{$XFA.list}}'" class="vsml" />
                </td>
            </tr>
        </table>
    </form>
</div>
<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("detail");
    frmvalidator.EnableMsgsTogether();
    frmvalidator.addValidation("{{$TABLE}}[sfo_name]","req", "Please specify Title");
</script>