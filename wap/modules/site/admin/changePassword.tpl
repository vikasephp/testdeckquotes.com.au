<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>

<h3 class="page-title">{{$title}}</h3>

<div align="center">

    {{if !empty($error)}}<p>{{$error}}</p>{{/if}}

    <form name="detail" method="post" action="{{$BASE_URL}}{{$XFA.changePassword}}" >
        <table id="list-table" align="center">
            <tr>
                <th>Old Password</th>
                <td><input class="input" name="old_password" type="password" maxlength="32" value="{{$old_password}}" /></td>
            </tr>
            <tr>
                <th>New Password</th>
                <td><input class="input" name="new_password" type="password" maxlength="32" value="{{$new_password}}" /></td>
            </tr>
            <tr>
                <th>Confirm Password</th>
                <td><input class="input" name="confirm_password" type="password" maxlength="32" value="{{$confirm_password}}" /></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:center">
                    <input type="submit" name="subChangePassword" value="Submit" class="vsml" />
                </td>
            </tr>
        </table>
    </form>
    
</div>    

<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("detail");
    frmvalidator.EnableMsgsTogether();
    frmvalidator.addValidation("old_password", "req","Please specify Old Password");
    frmvalidator.addValidation("new_password", "req","Please specify New Password");
    frmvalidator.addValidation("confirm_password", "req","Please specify Confirm Password");
</script>