<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>




 <table width="780" border="0" cellspacing="0" cellpadding="0" align="center">
                                                <tr>
                                                    <td width="5"><img src="{{$BASE_URL}}images/top-left-corner.jpg" alt="" /></td>
                                                    <td align="left" width="780" class="contTopMid"></td>
                                                    <td width="5"><img src="{{$BASE_URL}}images/top-right-corner.jpg" alt="" /></td>
                                                </tr>
                                                
                                                 <tr>
                                                 <td  align="center" valign="top" class="conBorders hpconwidth" colspan="3"> 
                                                 <h2>{{$title}}</h2>
                                                 </td>
                                                </tr>
                                                
                                                
                                                <tr>
                                                    <td colspan="3" align="left" valign="top" class="conBorders hpconwidth">
                                                 
                                                     
                                                        <form name="detail" method="post" action="{{$BASE_URL}}{{$XFA.register}}">
        <table id="form-table" align="center" height="450">
            <tr>
                <th class="gray">Name</th>
                <td align="left"><input type= "text" name="customers[customer_name]" value="{{$detail.customer_name}}" class="lrg" /></td>
            </tr>
            <tr>
                <th class="gray">Address</th>
                <td align="left"><textarea name="customers[customer_address]" class="lrg" style="height:40px;" />{{$detail.customer_address}}</textarea></td>
            </tr>
            <tr>
                <th class="gray">Country</th>
                <td align="left">
    				<select name="customers[customer_country]" class="lrg">
    					<option value="US">United States</option>
                    </select>
                </td>
            </tr>
    		<tr>
                <th class="gray">State</th>
                <td align="left">
                    <select name="customers[customer_state]" class="lrg">
    					<option value="">Please Select</option>
    					{{foreach from=$states key="state_code" item="state_name"}}
    					<option value="{{$state_code}}" {{if $detail.customer_state == $state_code}}selected{{/if}}>{{$state_name}}</option>
    					{{/foreach}}
                    </select>
                </td>
            </tr>
            <tr>
                <th class="gray">City</th>
                <td align="left"><input type="text" name="customers[customer_city]" value="{{$detail.customer_city}}" class="lrg" /></td>
            </tr>
            <tr>
                <th class="gray">Zip/Pin</th>
                <td align="left"><input type="text" name="customers[customer_zip]" value="{{$detail.customer_zip}}" class="lrg" /></td>
            </tr>
            <tr>
                <th class="gray">Phone</th>
                <td align="left"><input type="text" name="customers[customer_phone]" value="{{$detail.customer_phone}}" class="lrg" /></td>
            </tr>
            <tr>
                <th class="gray">Email</th>
                <td align="left"><input type="text" name="customers[customer_email]" value="{{$detail.customer_email}}" class="lrg" ></td>
            </tr>
            <tr>
                <th class="gray">Username</th>
                <td align="left"><input type="text" name="users[username]" value="{{$user.username}}" class="lrg" /></td>
            </tr>
            <tr>
                <th class="gray">Password</th>
                <td align="left"><input type="password" name="users[password]" value="{{$user.original_password}}" class="lrg" /></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:center;">
                    <input type="submit" name="subAddDetail" value="Save" class="vsml button" />
                    <input type="button" name="btnCancelDetail" value="Cancel" onclick="history.go(-1);" class="vsml button" />
                </td>
            </tr>
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









<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("detail");
    frmvalidator.EnableMsgsTogether();
    frmvalidator.addValidation("customers[customer_name]","req","Please specify Name");
    frmvalidator.addValidation("customers[customer_address]","req","Please specify Address");
    frmvalidator.addValidation("customers[customer_city]","req","Please specify City");
    frmvalidator.addValidation("customers[customer_city]","alpha_s","Please specify a valid City");
    frmvalidator.addValidation("customers[customer_state]","req","Please specify State");
    frmvalidator.addValidation("customers[customer_country]","req","Please specify Country");
    frmvalidator.addValidation("customers[customer_zip]","req","Please specify Zip/Pin");
    frmvalidator.addValidation("customers[customer_zip]","num","Please specify a valid Zip/Pin");
    frmvalidator.addValidation("customers[customer_phone]","req","Please specify Phone");
    frmvalidator.addValidation("customers[customer_email]","req","Please specify Email");
    frmvalidator.addValidation("users[username]","req","Please specify Username");
    frmvalidator.addValidation("users[password]","req","Please specify Password");
</script>