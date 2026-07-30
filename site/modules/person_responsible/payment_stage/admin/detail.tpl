<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>

    
<div align="center">

    <h3 class="page-title">{{$title}}</h3>
    
    <form name="detail" method="post" action="{{$XFA.detail}}">
        <table id="list-table" width="90%">
            <input type="hidden" name="stage[ps_id]" value="{{$detail.ps_id}}" />
           
            <tr><td colspan="2" height="20px">&nbsp;</td></tr>
            <tr>
                <th>Stage:</th>
                <td><input type= "text" name="stage[ps_stage]" value="{{$detail.ps_stage}}" class="xlrg" /></td>
            </tr>
             
            <tr><td colspan="2" height="20px">&nbsp;</td></tr>
            <tr>
                <th>Percent:</th>
                <td><input type= "text" name="stage[ps_percent]" value="{{$detail.ps_percent}}" class="xlrg" /></td>
            </tr>
            <tr><td colspan="2" height="20px">&nbsp;</td></tr>
            <tr>
                <th>Value:</th>
                <td><input type= "text" name="stage[ps_value]" value="{{$detail.ps_value}}" class="xlrg" /></td>
            </tr> 
             

           <tr><td colspan="2" height="20px">&nbsp;</td></tr>
            <tr>
                <td colspan="2" style="text-align:center;">
                    <input type="submit" name="subAddDetail" value="Save" class="vsml" />
                    <input type="button" name="btnCancelDetail" value="Cancel" onclick="document.location.href='{{$BASE_URL}}payment_stageAdmin.list'" class="vsml" />
                </td>
            </tr>
        </table>
    </form>

</div>

<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("detail");
    frmvalidator.EnableMsgsTogether();
    frmvalidator.addValidation("stage[ps_stage]","req", "Please specify Stage");
</script>