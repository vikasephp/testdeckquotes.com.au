<div class="page_spinner"></div>
<div class="extra">
	<div align="center" > 
		<article id="content1">
        {{include file=$mainmenu}}
            <div class="page_content">
					<div class="wrapper contentPad" >
						<div class="cols">
                            <h2>{{$detail.page_heading}} </h2>
                   			{{$detail.page_body}}	
                            <div style="border:2px outset #CCCCCC; width:32%; padding-left:15px; padding-top:10px;">
                           <script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
                            <form name="login" action="{{$BASE_URL}}login.htm" method="post" id="form" >
                            	<div style="color: #333333;">Username: </div>
                            	<input type="text" name ="user_username" class="inputbox1"> <br>
                                <div style="padding-top:5px; color: #333333;">Password: </div>
                            	<input type="password" name="user_password" class="inputbox1"> <br><br />
                                   
                                <input type="submit" name="submit" value="Sign in" class="btn" /> &nbsp;  <input type="button" value="Forgot Password?" class="btn" onclick="document.location.href='{{$BASE_URL}}{{$XFA.forgotPassword}}'">
                           <div style="color:#FF0000;">{{$error_msg}} </div>   											
                           <div style="padding-left:120px; padding-top:20px; color:#FF0000;">{{if $status == 2}} <span>Invalid username/password</span> {{/if}}</div>
                            </form>
                        <script type="text/javascript" language="javascript" >
							var frmvalidator  = new Validator("login");
							frmvalidator.EnableMsgsTogether();
							frmvalidator.addValidation("user_username","req","Please Username/Email.");
							frmvalidator.addValidation("user_password","req","Please specify Password.");
				  		</script>     
                            </div>
                            </div>
					</div>           
	 	</article>
   		</div>
	</div>
</div>