<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
<div align="center">
    <h3 class="page-title">{{$title}}</h3> 
    <form name="detail" method="post" action="{{$XFA.detail}}">
        <table id="list-table" width="90%">
            <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />  
         <tr><td colspan="2" height="20px">&nbsp;</td></tr>
            <tr>
                <th>Follows  Source Type:</th>
                <td><input type= "text" name="{{$TABLE}}[tfo_name]" value="{{$detail.tfo_name}}" class="xlrg" /></td>
            </tr>
         <tr>
            <th> Status :</th>
            <td> <select name="{{$TABLE}}[tfo_status]" class="lrg" style="width:150px;">
        	     <option value="Active" {{if $detail.tfo_status == 'Active'}} selected="selected" {{/if}}> Active </option>
               	 <option value="Inactive" {{if $detail.tfo_status == 'Inactive'}} selected="selected" {{/if}}> Inactive </option>
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
    frmvalidator.addValidation("{{$TABLE}}[tfo_name]","req", "Please specify Title");
</script>