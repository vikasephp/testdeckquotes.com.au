<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<h3 class="page-title">{{$title}}</h3>


<form name="detail" method="post" action="{{$BASE_URL}}user.detail"> 
<table id="form-table" align="center"> 
		  
                             
        


       <tr> 
                  <th>*Name</th><input type= "hidden" name="user_id" value="{{$detail.user_id}}" class="lrg" /> 
                             <td><input type= "text" name="user_name" value="{{$detail.user_name}}" class="lrg" /></td>        </tr>
        


                                   <th>*Email</th> 
<td><input type= "text" name="user_email" value="{{$detail.user_email}}" class="jsvalidate_email input" >&nbsp;</td> 
       </tr>
       <tr>
                   <th>*Username</th>
                               <td><input type= "text" name="user_username" value="{{$detail.user_username}}" /></td> 
       </tr>
       <tr>
                   <th>Password</th> 
      <td><input type="password" name="user_password" value="" class="lrg"></td>  
   </tr>
   <tr>
   <td colspan="2" style="text-align:center;">
          <input type="submit" name="subAddDetail" value="Update" class="vsml button" />
                         <input type="button" name="btnCancelDetail" value="Cancel" onclick="window.location='site.home';" class="vsml button"/> 
                                    </td>
</tr>
</table>
</form>
<script type="text/javascript" language="javascript" >    
    
    
    
    	var frmvalidator  = new Validator("detail");    
    	  	
    	frmvalidator.EnableMsgsTogether();
		frmvalidator.addValidation("user_name","req", "Please specify Name");
		frmvalidator.addValidation("user_email","req", "Please specify Email");  
		frmvalidator.addValidation("user_email","email", "Please specify Email formate");    
		frmvalidator.addValidation("user_username","req", "Please specify Username");    
		//frmvalidator.addValidation("user_password","req", "Please specify Password");
</script>