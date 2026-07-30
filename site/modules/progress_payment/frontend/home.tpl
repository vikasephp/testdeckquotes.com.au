
{{include file=$jdata}}
{{include file=$tiny_basic}}		
<h3 class="page-title">{{$title}}</h3>
{{if $msg}} <h3 style="font-size:18px; color:#639; padding-bottom:15px;"> {{$msg}} </h3> {{/if}}




<form name="detail" method="post" action="" enctype="multipart/form-data">
<table style="border:1px solid #999; width:60%;" cellpadding="8">
<tr>
<th> Enter bsn id : </td> 
<td> <input type="text" name="pp[bsn_id]"> </th>
</tr>
<tr>
<th> Enter Component Name :</th>
<td> <input type="text" name="pp[stage]"> </td>
</tr>
<tr>
<th> Upload Progress Payment Report :</th>
<td> <input type="file" name="pp_report"> </td>
</tr>
<tr>
<th> Upload Invoice Sent :</th>
<td> <input type="file" name="invoice"> </td>
</tr>


</table>
          <input type ="submit" name="updatepp" value="Submit"   />

</form>
