{{include file=$jdata}}
{{include file=$tiny_basic}}	
	
<h3 class="page-title">Update Keys</h3>
{{if $msg}} <h3 style="font-size:18px; color:#639; padding-bottom:15px;"> {{$msg}} </h3> {{/if}}

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
	    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>

<script>
  
		$(document).ready(function() {
			/*
			*   Examples - images
			*/
			$(".various").fancybox({
				'width': '95%',
				'height': '95%',
				'autoScale': false,
				 'transitionIn' : 'elastic',
				 'transitionOut' : 'elastic',
				 'speedIn' : 300,
				 'speedOut' : 300,
				 'overlayShow' : true,
				 'hideOnOverlayClick':false,
				 'hideOnContentClick':false,
				 'type': 'iframe',
				 'scrolling': 'yes' 
			});

});
 
</script>

<div style="text-align:center;"><br />
<form name="detail" method="post" action="" enctype="multipart/form-data">

<input type="text"  name="user_name" style ="width:700px" value="{{$user_name}}" placeholder="Enter User Name" required="required"/> <br>
{{if !$send_otp && $hide eq false}}
<input type ="submit" name="sendOTP" value="Send OTP"   /> <br />
{{/if}}

{{if $send_otp}}
<input type="text"  name="onetime" style ="width:700px"  placeholder="Please Enter One Time Password For Login" required="required"/> <br>
<input type ="submit" name="verifiy" value="Verify"   />
{{/if}}


{{if $auth eq true}}
<input type="hidden"  name="{{$TABLE}}[s_user_name]" style ="width:700px" value="{{$user_name}}" placeholder="Enter User Name" required="required"/> <br>
<input type="text"  name="{{$TABLE}}[s_acc_k]" style ="width:700px" value="{{$s_acc_k}}" placeholder="Please Enter Access Key" required="required"/> <br>
<input type="text"  name="{{$TABLE}}[s_sec_k]" style ="width:700px" value="{{$s_sec_k}}" placeholder="Please Enter Secret Key" required="required"/> <br>
{{else if $auth eq false}}
		{{if $opr1}} <div style="font-size:18px; color:#390">{{$opr1}}</div>{{/if}}
{{/if}}

{{if $otpopr}}
<input type="text"  name="{{$TABLE}}[s_otp]" style ="width:700px"  placeholder="Please Enter One Time Password To Update The Keys" required="required"/>
 <br>
<input type ="submit" name="updatekey" value="Submit"   />

{{else}}
<!--
<input type ="submit" name="subAddDetail" value="Submit 22"   />
-->

{{/if}}
</form>
<br /><br />
{{if $invuser}} <div style="font-size:18px; color:#390">{{$invuser}}</div>{{/if}}
{{if $opr}} <div style="font-size:18px; color:#390">{{$opr}}</div>{{/if}}
{{if $very}} <div style="font-size:18px; color:#390">Otp has been sent to your mobile number: ********{{$mob}}</div>{{/if}}
</div>
