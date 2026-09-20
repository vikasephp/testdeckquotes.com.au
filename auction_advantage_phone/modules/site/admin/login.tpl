<h1>{{$page.title}}</h1>

<div align="center">
<form name="login" method="post" action="{{$BASE_URL}}{{$XFA.login}}">
<input type="hidden" name="r" value="{{$page.r}}" />
<table id="form-table">
    {{if $page.status == 2}}
    <tr>
        <td colspan="2" class="center">Invalid username/password</td>
    </tr>
    {{/if}}
    <tr>
        <th>Username</th>
        <td><input type="text" name="user_username" maxlength="32" /></td>
    </tr>    
    <tr>
        <th>Password</th>
        <td><input type="password" name="user_password" maxlength="32" /></td>
    </tr>
    <tr>
        <td colspan="2" style="text-align:center;">
            <input type="submit" name="subLogin" value="Login" class="vsml button" />
        </td>
    </tr>
</table>
</form>
</div>