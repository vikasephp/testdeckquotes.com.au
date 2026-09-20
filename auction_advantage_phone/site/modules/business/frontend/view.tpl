<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<table width="100%" id="viewbus-table" style="background-color:#FFFFFF;">
<tr> <td colspan="4" width="100%"> <table cellpadding="0" cellspacing="0" border="0" width="22%"> <tr> 
			<th align="left" width="50">               
                <a href="javascript:parent.openedit('{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$bsn_id}}');" title="Edit">
                <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>
           </th>
           </tr>
           </table>
    </td>
</tr>
<tr>
		<th >Interest:</th><td width="200">{{$detail.bi_title}}</td>
        <th width="100">Status:</th><td width="200"> {{$detail.st_name}} </td>
</tr>
<tr>
		<th>Bunisess Name:</th><td>{{$detail.bsn_name}}</td>
        <th>Sellers:</th><td> {{$string1}} </td>
</tr>
<tr>
		<th>Description:</th><td colspan="3">{{$detail.bsn_description}}</td>
</tr>
<tr>
		<th>Price From:</th><td>{{$detail.bsn_cd_ask_price_from}}</td>
        <th>Price To:</th><td> {{$detail.bsn_cd_ask_price_to}} </td>
</tr>
<tr>
		<th>Address:</th><td colspan="3">{{$detail.bsn_address}}</td>
</tr>
<tr>
		<th>Suburb:</th><td colspan="3">{{$detail.bsn_suburb}}</td>
</tr>

<tr>
		<th>State:</th><td colspan="3">{{$detail.bsn_state}}</td>
</tr>

<tr>
		<th>Post Code:</th><td colspan="3">{{$detail.bsn_pcode}}</td>
</tr>
<tr>
		<td colspan="4"> <input type = "button" value="Close" onclick="parent.$.fancybox.close();" /> </td>
</tr>         

<tr>
		<td colspan="4"> <input type = "checkbox" /> Out of date listings</td>
</tr> 
<tr>
		<td colspan="4"> <input type = "button" value="Search" /></td>
</tr>

</table>
