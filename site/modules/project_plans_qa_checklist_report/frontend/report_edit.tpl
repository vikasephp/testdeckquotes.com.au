<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

{{include file=$jdata}}
{{include file=$tiny_basic}}		
<h3 class="page-title">{{$title}}</h3>
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



{{if $opr}}
<script type="text/javascript">
//location.reload();
</script>
{{/if}}

<div style="float:left; margin-left:20px; text-align:left; font-size:14px;"> 

<strong> Project Name  : </strong> {{$bsn_name}}<br />
<strong> Checklist Number  : </strong> {{$cno}}
</div>

<form name="detail" method="post" action="" enctype="multipart/form-data">

<div style="float:right;"> 

<input type="submit" name="synchronize"  value="Synchronize Elements"  /> &nbsp;

</div>

<!--<input type="text" list = 'project' name="projname1" style ="width:500px" value="{{$project}}"  />

<br>

Enter Proposal Checklist Number : <input type="text" name="element[chkno]" style="width:400px;" > <br />
User Name :  <input  type="text" name="element[user]"style="width:400px;" >

<input type="hidden" name="element[id]" value="{{$pid}}" />
<input type="hidden" name="element[proj]" value="{{$project}}" >-->

<br>

<table id="list-table" class="nav-back" width="100%">
<tbody id="myTable">
<tr>
<th>Element Group</th>
<th>Element Name </th>
<th>Link</th>
<th>Yes - No </th>
<th>User & When </th>
<th>Comments</th>
</tr>

{{foreach from=$rdetail key="key" item="item"}}
<tr>
<td>{{$item.el_group}} </td>
<td>{{$item.el_element}} </td>
<td><a href = "{{$item.el_link}}" target="_blank">Link </a> </td>
<td> 
<input type="hidden" name="element_data[{{$item.el_id}}][el_id]" value="{{$item.el_id}}" />
<input type="hidden" name="element_data[{{$item.el_id}}][bsn_id]" value="{{$bsn_id}}" />
<input type="hidden" name="element_data[{{$item.el_id}}][cno]" value="{{$cno}}" />

<label class="switch">
<input class="switch-input" type="checkbox"  name="element_data[{{$item.el_id}}][yesno]" value="1" {{if $item.qac_yes_no eq  1}} checked="checked" {{/if}}  />
<span class="switch-label" data-on="Yes" data-off="No"></span> 
<span class="switch-handle"></span> <br />
</label>
</td>
<td>{{$item.qac_user}}<br />{{$item.qac_when}} </td>
<td><textarea rows="4" cols="40" name="element_data[{{$item.el_id}}][comment]" id="{{$item.el_id}}" style="overflow-y: scroll;">{{$item.qac_comment}}</textarea> 

</td>
</tr>
{{/foreach}}
</tbody>
</table>
<input type="submit" name="generate" value="Submit" />
</form>


