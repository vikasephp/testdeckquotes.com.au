<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>

    
<div align="center">

    <h3 class="page-title">{{$title}}</h3>
    
    <form name="detail" method="post" action="{{$XFA.detail}}">
        <table id="list-table" width="90%">
            <input type="hidden" name="status[st_id]" value="{{$detail.st_id}}" />
           
            <tr><td colspan="2" height="20px">&nbsp;</td></tr>
            <tr>
                <th>Status Title:</th>
                <td><input type= "text" name="status[st_name]" value="{{$detail.st_name}}" class="xlrg" /></td>
            </tr>
             
             <tr>
        <th>Status:</th>
        <td>
        	<select name="status[st_status]" class="sml">
                <option value="0" {{if $detail.st_status == 0}} selected="selected" {{/if}}>Inactive</option>
                <option value="1" {{if $detail.st_status == 1}} selected="selected" {{/if}}>Active</option>
            </select>
        </td>
      </tr>
                       <tr><td colspan="2" height="20px">&nbsp;</td></tr>
            <tr>
                <td colspan="2" style="text-align:center;">
                    <input type="submit" name="subAddDetail" value="Save" class="vsml" />
                    <input type="button" name="btnCancelDetail" value="Cancel" onclick="document.location.href='{{$BASE_URL}}statusAdmin.list'" class="vsml" />
                </td>
            </tr>
        </table>
    </form>

</div>

<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("detail");
    frmvalidator.EnableMsgsTogether();
    frmvalidator.addValidation("status[st_name]","req", "Please specify Title");
</script>