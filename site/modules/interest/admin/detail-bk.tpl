<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>

    
<div align="center">

    <h3 class="page-title">{{$title}}</h3>
    
    <form name="detail" method="post" action="{{$XFA.detail}}">
        <table id="list-table" width="90%">
            <input type="hidden" name="{{$TABLE}}[bi_id]" value="{{$detail.bi_id}}" />
           
            <tr><td colspan="2" height="20px">&nbsp;</td></tr>
            <tr>
                <th>Business Interest Title:</th>
                <td><input type= "text" name="{{$TABLE}}[bi_title]" value="{{$detail.bi_title}}" class="xlrg" /></td>
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
    frmvalidator.addValidation("status[bi_title]","req", "Please specify Title");
</script>