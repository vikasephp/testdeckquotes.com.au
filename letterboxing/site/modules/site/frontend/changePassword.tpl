<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>



 <table width="780" border="0" cellspacing="0" cellpadding="0" align="center">
                                                <tr>
                                                    <td width="5"><img src="{{$BASE_URL}}images/top-left-corner.jpg" alt="" /></td>
                                                    <td align="left" width="780" class="contTopMid"></td>
                                                    <td width="5"><img src="{{$BASE_URL}}images/top-right-corner.jpg" alt="" /></td>
                                                </tr>
                                                
                                                 <td  align="center" valign="top" class="conBorders hpconwidth" colspan="3"> 
                                                 <h2>{{$title}}</h2>
                                                 </td>
                                                
                                                <tr>
                                                    <td colspan="3" align="left" valign="top" class="conBorders hpconwidth">
                                                 
                                                     
                                                      <div align="center">

    <p class="error">{{$error}}</p>

    <form name="detail" method="post" action="">
    	<table id="form-table" bgcolor="#FFFFFF">
    		<tr>
    			<th class="labelhead">Old Password: </th>
    			<td><input type="password" name="changepwd[oldpassword]" maxlength="32" value="" class="lrg" /></td>
    		</tr>
            <tr>
    			<th class="labelhead">New Password:</th>
    			<td><input type="password" name="changepwd[newpassword]" maxlength="32" value="" class="lrg" /></td>
    		</tr>
              <tr>
    			<th class="labelhead">Confirm New Password:</th>
    			<td><input type="password" name="changepwd[confirmnewpassword]" maxlength="32" value="" class="lrg" /></td>
    		</tr>
    		<tr>
    			<td colspan="2" style="text-align:center">
    				<input type="submit" value="Change Password" class="sml button" />
    				<input type="button" value="Cancel" class="vsml button" onclick="document.location.href = '{{$BASE_URL}}{{$XFA.login}}';" />
    			</td>
    		</tr>
    		{{if $msg}}
    		<tr style="text-align:center;">
    			<td colspan="2" class="message">{{$msg}}</td>
    		</tr>
    		{{/if}}
    	</table>
    </form>

</div>
                                                     
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
    frmvalidator.addValidation("changepwd[oldpassword]","req","Please specify Old Password.");
	frmvalidator.addValidation("changepwd[newpassword]","req","Please specify New Password.");
	frmvalidator.addValidation("changepwd[confirmnewpassword]","req","Please specify Confirm new Password.");
	
</script>