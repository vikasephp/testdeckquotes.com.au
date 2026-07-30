<link rel="stylesheet" href="{{$BASE_URL}}css/default/style.css" type="text/css" media="all">

<div class="profile_agent">
<div align="center"><h3> Sales Agent Profile </h3></div>
<table cellpadding="0" cellspacing="0" width="100%" >
<tr> <td width="36%"> Name: </td> <td> {{$detail.sa_name}}</td> </tr>
<tr> <td> Contact: </td> <td> {{$detail.sa_phone}}</td> </tr>
<tr> <td> Mobile: </td> <td> {{$detail.sa_mobile}}</td> </tr>
<tr> <td> Email: </td> <td> {{$detail.sa_email}}</td> </tr>
<tr> <td> <img src="{{$BASE_URL}}upload/{{$detail.sa_image|default:'default.jpg'}}" /> </td> <td> {{$detail.sa_profile}}</td> </tr>
</table>

</div>