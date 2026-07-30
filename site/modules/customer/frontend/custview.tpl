<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<div align="center">
<table border="0" width = "100%" cellpadding="5" id="viewcust-table">
<tr>
    <th> First Name : </th> <td>{{$detail.bcust_fname}} </td>
	<th> Last Name : </td>  <td>{{$detail.bcust_lname}} </td>   
    <th><a href="{{$BASE_URL}}js/vcard/index.php?fname={{$detail.bcust_fname}}&lname={{$detail.bcust_lname}}&email1={{$detail.bcust_misc_email1}}&email2={{$detail.bcust_misc_email2}}&mobile={{$detail.bcust_misc_moble}}&business={{$detail.bcust_misc_business}}&home={{$detail.bcust_misc_home}}" class="action_new" target="_blank">Vcard</a></th> 
</tr>
<tr>
<th> </th> <td></td>
<th> Status : </th>
<td>            
{{ if $detail.bcust_status eq 1 }} Active {{elseif $detail.bcust_status eq 2 }} Inactive {{ elseif $detail.bcust_status eq 3 }} New Registration {{/if}}
</td> 
<th></th>  
</tr>
<tr>
	<th> Email : </th> <td>{{$detail.bcust_misc_email1}} </td>
	<th> Second Email : </th>  <td>{{$detail.bcust_misc_email2}} </td>  <th></th>     
</tr>
<tr>
	<th> Mobile : </th> <td> {{$detail.bcust_misc_moble}}</td></tr> 
    <tr>
	 <th> Business :</th> <td> {{$detail.bcust_misc_business}} </td>  
	
    <th> Home : </th>  <td>{{$detail.bcust_misc_home}} </td>   <th></th>  
</tr>
<tr> <th> Address : </th> <td colspan="4">{{$detail.bcust_address}} </td> </tr>
<tr> <th> Postal Address : </th> <td colspan="3">{{$detail.bcust_postal_address}} </td> </tr>
</table>
</div>