 <table cellpadding="0" cellspacing="0" border="0" width="99%">
 <tr><td height="2" colspan="3">&nbsp;</td></tr>
 <tr>
         <td align="left" valign="top"><img src="images/box-left-corn.jpg" width="9" height="43" /></td>
                                        <td width="100%" class="box-bg"><strong class=" title-bullet">{{$title}}</strong></td>
                                        <td align="right" valign="top"><img src="images/box-right-corn.jpg" width="9" height="43" /></td>
          </tr>
<tr>          
 	<td colspan="3">
    	<table cellpadding="0" cellspacing="0" border="0" width="100%">
        	<tr>
            	<td height="40" colspan="2">
                	    <div align="center"><strong class="blue">Hi, {{$uname|upper}} have a nice day.</strong></div>
       

                </td>
            </tr>
            <tr>
            	
                <td height="20" class="priview" colspan="2" align="right">
                	<a href="{{$BASE_URL}}classified.list" class="click">View Your ads.</a>
                </td>	
            </tr>
        </table>
    </td>         
</tr>          
<tr>
	<td></td><td width="90%">
    <form name="detail" action="{{$XFA.home}}" method="post">
    	<table cellpadding="0" cellspacing="0" border="0" width="90%">
        	<tr>
            	<td class="list_1" align="right">Name:</td><td><input type="text" name="user[customer_name]" value="{{$user_data.customer_name}}" class="lrg" /></td>
            </tr>
            <tr>
            	<td class="list_1" align="right"> Address:</td><td>
                <textarea rows="3" cols="33" name="user[customer_address]">{{$user_data.customer_address}}</textarea>
                </td>
            </tr>
             <tr>
            	<td class="list_1" align="right"> City:</td><td><input type="text" name="user[customer_city]" value="{{$user_data.customer_city}}" class="lrg" /></td>
            </tr>
             <tr>
            	<td class="list_1" align="right"> State:</td><td>
                   <select name="user[customer_state]" class="lrg">
    					<option value="">Please Select</option>
    					{{foreach from=$states key="state_code" item="state_name"}}
    					<option value="{{$state_code}}" {{if $user_data.customer_state == $state_code}}selected{{/if}}>{{$state_name}}</option>
    					{{/foreach}}
                    </select>
                </td>
            </tr>
             <tr>
            	<td class="list_1" align="right"> Country:</td><td>
                
                	<select name="user[customer_country]" class="lrg">
    					<option value="IND">INDIA</option>
                    </select>
                
               </td>
            </tr>
            <tr>
            	<td class="list_1" align="right"> Zip:</td><td><input type="text" name="user[customer_zip]" value="{{$user_data.customer_zip}}" class="lrg" /></td>
            </tr>
            <tr>
            	<td class="list_1" align="right"> Phone Number:</td><td><input type="text" name="user[customer_phone]" value="{{$user_data.customer_phone}}" class="lrg" /></td>
            </tr>
             <tr>
            	<td class="list_1" align="right">Email:</td><td><input type="text" name="user[customer_email]" value="{{$user_data.customer_email}}" class="lrg" /></td>
            </tr>
            <tr>
            	<td colspan="2" height="50" class="priview" align="center"><h3 class="blue">Login Detail:&nbsp;&nbsp;&nbsp;&nbsp;(optional)</h3></td>
            </tr>
             <tr>
            	<td class="list_1" align="right"> Username:</td><td><input type="text" name="users[user_username]" value="{{$detail.user_username}}" class="lrg" /></td>
            </tr>
             <tr>
            	<td class="list_1" align="right">New Password:</td><td><input type="text" name="users[user_password]" value="" class="lrg" /></td>
            </tr>
            
             <tr>
            	<td colspan="2" align="center" height="50"><input type="submit" name="subAddDetail" value="Update" class="vsml" /></td>
            </tr>
            {{if $msg}}
             <tr>
            	<td colspan="2" align="center" height="50"><h4 class="blue">{{$msg}}</h4></td>
            </tr>
            {{/if}}
            
        </table>
        </form>
    </td>
    <td></td>
</tr>          	
</table>












            
        
        