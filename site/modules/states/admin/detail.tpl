<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>

    
<div align="center" class="newdiv">

    <h3 class="page-title">{{$title}}</h3>
    
    <form name="detail" method="post" action="{{$XFA.detail}}">
        <table id="list-table" width="90%">
            <input type="hidden" name="data[s_id]" value="{{$detail.s_id}}" />
           
            <tr><td colspan="2" height="20px">&nbsp;</td></tr>
            
            <tr>
                <th>State:</th>
                <td><input type= "text" name="data[s_name]" value="{{$detail.s_name}}" class="xlrg" /></td>
            </tr>	
             
             <tr>
                <th>Short Code:</th>
                <td><input type= "text" name="data[s_shortcodes]" value="{{$detail.s_shortcodes}}" class="xlrg" /></td>
            </tr>	
            
            
             
            
                       <tr><td colspan="2" height="20px">&nbsp;</td></tr>
            <tr>
                <td colspan="2" style="text-align:center;">
                    <input type="submit" name="subAddDetail" value="Save" class="vsml" />
                    <input type="button" name="btnCancelDetail" value="Cancel" onclick="document.location.href='{{$BASE_URL}}stateAdmin.list'" class="vsml" />
                </td>
            </tr>
        </table>
    </form>

</div>

<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("detail");
    frmvalidator.EnableMsgsTogether();
    frmvalidator.addValidation("data[s_name]","req", "Please specify State Name");
	frmvalidator.addValidation("data[s_shortcodes]","req", "Please specify Short Code");
	
</script>