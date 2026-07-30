<style>

body{
	margin:0;
	color:#6a6f8c;
	background:#c8c8c8;
	font:600 16px/18px 'Open Sans',sans-serif;
}
*,:after,:before{box-sizing:border-box}
.clearfix:after,.clearfix:before{content:'';display:table}
.clearfix:after{clear:both;display:block}
a{color:inherit;text-decoration:none}

.login-wrap{
	width:100%;
	margin:auto;
	max-width:625px;
	min-height:900px;
	position:relative;
    height:auto;
	box-shadow:0 12px 15px 0 rgba(0,0,0,.24),0 17px 50px 0 rgba(0,0,0,.19);
	margin-bottom:50px;
	margin-top:10px;
}
.login-html{
	width:100%;
	height:100%;
	position:absolute;
	padding:50px 70px 10px 70px;
	background:rgba(40,57,101,.9);
}


.login-html .tab,
.login-form .group .label,
.login-form .group .button{
	
	text-transform: capitalize;
}
.login-html .tab{
	font-size:22px;
	margin-right:15px;
	padding-bottom:5px;
	margin:0 15px 10px 0;
	display:inline-block;
	border-bottom:2px solid transparent;
}
.login-html .sign-in:checked + .tab,
.login-html .sign-up:checked + .tab{
	color:#fff;
	border-color:#1161ee;
}
.login-form{
	min-height:145px;
	position:relative;
	perspective:1000px;
	transform-style:preserve-3d;
}
.login-form .group{
	margin-bottom:30px;
}
.login-form .group .label,
.login-form .group .input,
.login-form .group .button{
	width:100%;
	color:#fff;
	display:block;
}
.login-form .group .input,
.login-form .group .button{
	border:none;
	padding:15px 20px;
	border-radius:25px;
	background:rgba(255,255,255,.1);
	height:50px;
}

.login-form .group .rdo
{
	border:none;
	padding:15px 20px;
	border-radius:25px;
	background:rgba(255,255,255,.1);
	height:50px;
}


.login-form .group .ta {
	height:120px;
	
	border:none;
	padding:15px 20px;
	border-radius:25px;
	background:rgba(255,255,255,.1);
	width:100%;
	color:#fff;
	display:block;
	
}
.login-form .group input[data-type="password"]{
	text-security:circle;
	-webkit-text-security:circle;
}
.login-form .group .label{
	color:#fff;
	font-size:14px;
}
.login-form .group .button{
	background:#1161ee;
}
.login-form .group label .icon{
	width:15px;
	height:15px;
	border-radius:2px;
	position:relative;
	display:inline-block;
	background:rgba(255,255,255,.1);
}
.login-form .group label .icon:before,
.login-form .group label .icon:after{
	content:'';
	width:10px;
	height:2px;
	background:#fff;
	position:absolute;
	transition:all .2s ease-in-out 0s;
}
.login-form .group label .icon:before{
	left:3px;
	width:5px;
	bottom:6px;
	transform:scale(0) rotate(0);
}
.login-form .group label .icon:after{
	top:6px;
	right:0;
	transform:scale(0) rotate(0);
}
.login-form .group .check:checked + label{
	color:#fff;
}
.login-form .group .check:checked + label .icon{
	background:#1161ee;
}
.login-form .group .check:checked + label .icon:before{
	transform:scale(1) rotate(45deg);
}
.login-form .group .check:checked + label .icon:after{
	transform:scale(1) rotate(-45deg);
}
.login-html .sign-in:checked + .tab + .sign-up + .tab + .login-form .sign-in-htm{
	transform:rotate(0);
}
.login-html .sign-up:checked + .tab + .login-form .sign-up-htm{
	transform:rotate(0);
}

.hr{
	height:2px;
	margin:60px 0 50px 0;
	background:rgba(255,255,255,.2);
}
.foot-lnk{
	text-align:center;
}

.title {
 	text-align:center;
	font-size:24px;
	color:#FF3;
	margin-bottom:10px;
}

</style>


<div class="login-wrap">
	<div class="login-html">
        
        {{if $message}}
               <div style="color:#0F9; font-size:22px; text-align:center; margin-top:100px;">
               Your details has been saved successfully... <br><br />Thank You
               </div>
        {{else}}
        
        <div class="title" style="margin-bottom:60px;">Warranty Acceptance Agreement</div>
	      <form name="wap" method="post" action="">
		<div class="login-form">
			<div class="sign-in-htm">
				<div class="group">
                    <input type="hidden" name="wap[wl_wa_id]" value="{{$wa_id}}" />
           			<input type="hidden" name="wap[wl_supplier]" value="{{$comp}}" />
            		<input type="hidden" name="wap[wl_sup_email]" value="{{$eml}}" />
                     
					<label for="name" class="label">Warranty  Log  Number :- {{$wa_id}} </label>
					
				</div>
				<div class="group">
					<label for="number" class="label">Supplier :- {{$comp}}</label>
					
				</div>
                
                <div class="group">
					<label for="number" class="label" style="text-transform:none !important;">Problem :- {{$problem}}</label>
					
				</div>
                                
                <div class="group">
				<label for="pass" class="label">Warranty  Claim  Acceptance</label>
				<input type="radio" class='rdo' value="1" name="wap[wl_wa_claim_acc]" style="width:20px;"><span style="color:#FFF; padding-right:30px;"> Yes</span> 
                <input type="radio" class='rdo' value="0" name="wap[wl_wa_claim_acc]" style="width:20px;"><span style="color:#FFF; padding-right:30px;"> No</span> 
				</div>
                                
                <div class="group">
					<label for="pass" class="label" style="margin-bottom:20px;">Reason for rejecting claim</label>
			        <textarea class="ta" rows="3" name="wap[wl_reason_reject]"></textarea>
				</div>
				
        
               
                                
				<div class="group">
					<input type="submit" class="button" value="Submit" name="wapsubmit">
				</div>
				<!--<div class="hr"></div>-->
				
			</div>
			
		</div>
                </form>
                
                {{/if}}
	</div>
</div>