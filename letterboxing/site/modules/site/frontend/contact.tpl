<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>

  
  
  
  
  
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
                                                 
                                                     
                                            <form action="" method="post" name="emailForm" id="" class="">
                             
                           <table  border="0" cellspacing="0" cellpadding="0" width="100%" height="500" >
                        	<tr><td colspan="2" height="24">&nbsp;</td></tr>
                            <th width="266" align="right" class="gray">Name:</th>
                            <td  width="519" align="left" ><input type="text" name="cont[contact_name]"  size="25" class="inputbox" value="" maxlength="200"/></td>
                           </tr>
                           
                            <tr>
                            <th class="gray" align="right">Email:</th>
                            <td  align="left"><input type="text"  name="cont[contact_email]" size="25" value="" maxlength="100" class="inputbox" /></td>
                            </tr>
                            <tr>
                            <th class="gray" align="right"><label for="contact_subject">Subject:</label></th>
                            <td  align="left"><input type="text" name="cont[contact_subject]"  size="25" class="inputbox" value="" maxlength="200"/></td>
                            </tr>
                            
                            <tr>
                            <th class="gray" align="right"><label id="contact_textmsg" for="contact_text">Message:</label></th>
                            <td  align="left" valign="top"><textarea cols="35" rows="8" name="cont[contact_message]"  onkeyup="return ismaxlength(this)" maxlength="1000" ></textarea></td>
                              <script type="text/javascript">
								function ismaxlength(obj)
								{
								var mlength=obj.getAttribute? parseInt(obj.getAttribute("maxlength")) : ""
								if (obj.getAttribute && obj.value.length>mlength)
								obj.value=obj.value.substring(0,mlength)
								}
 							  </script>

                            
                            </tr>
                            
                            <tr>
                     		<td>&nbsp;</td>
                            <td><input type="submit" name="contact" value="Send" align="middle"/> </td> 
                            </tr> 
                            
                            {{if $msg}}
                             <tr>
                            <td class="white"  align="center" colspan="2">{{$msg}}</td>
                            </tr>
                            {{/if}}
                            <tr> 
                            <tr><td colspan="2" height="180">&nbsp;</td></tr>
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
    var frmvalidator  = new Validator("emailForm");
    frmvalidator.EnableMsgsTogether();

    frmvalidator.addValidation("cont[contact_name]","req", "Please specify Your Name.");
    frmvalidator.addValidation("cont[contact_email]","req", "Please specify email.");
    frmvalidator.addValidation("cont[contact_email]","email", "Please enter valid email.");
    <!--frmvalidator.addValidation("cont[subject]","req", "Please specify Subject.");-->
    frmvalidator.addValidation("cont[contact_message]","req", "Please specify Message.");
</script>