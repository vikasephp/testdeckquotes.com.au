{{include file=$jdata}}
{{include file=$tiny_basic}}	
	
<h3 class="page-title">Update User and Password For SMTP2Go.COM</h3>
{{if $opr}} <h3 style="font-size:18px; color:#639; padding-bottom:15px;"> {{$opr}} </h3> {{/if}}


<div style="text-align:center;"><br />
<form name="detail" method="post" action="" enctype="multipart/form-data">


<input type="text"  name="smtp[sm_user]"     style ="width:700px" placeholder="Enter User Name" required="required"/> <br>
<input type="text"  name="smtp[sm_password]" style ="width:700px" placeholder="Enter Password" required="required"/> <br>

<input type="submit" name="save_user" value="Update" />
</form>
<br /><br />

</div>
