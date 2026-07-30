
 <table width="780" border="0" cellspacing="0" cellpadding="0" align="center">
                                                <tr>
                                                    <td width="5"><img src="{{$BASE_URL}}images/top-left-corner.jpg" alt="" /></td>
                                                    <td align="left" width="780" class="contTopMid"></td>
                                                    <td width="5"><img src="{{$BASE_URL}}images/top-right-corner.jpg" alt="" /></td>
                                                </tr>
                                                
                                                 <tr>    
                                                    <td colspan="3" align="center" valign="middle" class="conBorders hpconwidth"> <h2>{{$title}}</h2></td> 
                                                </tr>
                                                
                                                
                                                <tr>
                                                    <td colspan="3" align="left" valign="top" class="conBorders hpconwidth">
                                                 
                                                     
                                                       <form name="login" method="post" action="{{$BASE_URL}}{{$XFA.login}}">
        <input type="hidden" name="r" value="{{$r}}" />
        <table height="500" align="center">
          <tr> <td colspan="2" height="100">&nbsp;</td></tr>
            {{if $status == 2}}
            <tr>
                <td colspan="2" class="center">Invalid username/password</td>
            </tr>
            {{/if}}
            <tr>
                <th class="gray">Username</th>
                <td><input type="text" name="user_username" maxlength="32" /></td>
            </tr>    
            <tr>
                <th class="gray">Password</th>
                <td><input type="password" name="user_password" maxlength="32" /></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:center;">
                    <input type="submit" name="subLogin" value="Login" class="vsml button" />
                </td>
            </tr>
            
            <tr> <td colspan="2" height="200">&nbsp;</td></tr>
        </table>
    </form>
                                                     
                                                  </td>
                                                </tr>
                                                <tr>
                                                    <td width="5"><img src="{{$BASE_URL}}images/bot-left-corner.jpg" alt="" /></td>
                                                    <td align="left" width="664" class="contBotMid"></td>
                                                    <td width="5"><img src="{{$BASE_URL}}images/bot-right-corner.jpg" alt="" /></td>
                                                </tr>
                                                <!-- Shadow Starts -->
                                                <tr>
                                                    <td colspan="3" align="center"><img src="{{$BASE_URL}}images/content-area-shadow.jpg" height="15" width="780"  alt="" /></td>
                                                </tr>
                                                <!-- Shadow Ends -->
                                                
                                           
                                            </table>