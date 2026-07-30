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
                                                 
                                                     
                                                    <form name="detail" method="post" action="{{$BASE_URL}}{{$XFA.forgotPassword}}">
    	<table id="form-table" align="center" height="450">
        <tr><td colspan="2" height="80">  <p class="white">{{$error}}</p>
</td></tr>
    		<tr>
    			<th class="gray" height="60">Username: </th>
    			<td><input type="text" name="username" maxlength="32" value="" class="lrg" /></td>
    		</tr>
    		<tr>
    			<td colspan="2" style="text-align:center">
    				<input type="submit" value="Submit" class="vsml button" />
    				<input type="button" value="Cancel" class="vsml button" onclick="document.location.href = '{{$BASE_URL}}{{$XFA.login}}';" />
    			</td>
    		</tr>
    		{{if $msg}}
    		<tr style="text-align:center;">
    			<td colspan="2" class="message">{{$msg}}</td>
    		</tr>
    		{{/if}}
            <tr><td height="300">&nbsp;</td></tr>
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
    frmvalidator.addValidation("username","req","Please specify Username");
</script>