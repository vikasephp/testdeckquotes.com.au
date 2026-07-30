<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<body>
<div id="divviewlog">
<h3>View E-dossier</h3>
<table cellpadding="0" cellspacing="0" width="100%" id="divviewlog" >
<tr><th>To Email:</th><td>{{$elogdetail.edl_to}}</td></tr>
<tr><th>To Name:</th><td>{{$elogdetail.edl_toname}}</td></tr>
<tr><th>Title:</th><td>{{$elogdetail.edl_title}}</td></tr>
<tr><th>Message:</th><td>{{$elogdetail.edl_body}}</td></tr>
<tr><th>Date:</th><td>{{$elogdetail.edl_date}}</td></tr>
<tr><th>IP:</th><td>{{$elogdetail.edl_ip}}</td></tr>		
</table>
</div>
</body>