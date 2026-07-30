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


<form name="detail" method="post" action="" enctype="multipart/form-data">
<datalist id='project'>
   {{foreach from=$projdetail key="key3" item="item3"}}
    <option value="{{$item3.bsn_id}} | {{$item3.bsn_name}}" {{if $bsnid eq $item3.bsn_id}} selected="selected" {{/if}}>
    {{$item3.bsn_id}} - {{$item3.bsn_name}} 
    </option>
    {{/foreach}}
</datalist>
         <input type="text" list = 'project' name="projname1" style ="width:500px" value="{{$project}}" placeholder="Enter Project Name Or Project ID" />
         <input type ="submit" name="psub" value="Submit"   />

<br>

{{if $pid && $pbox eq 'true'}}

Enter Proposal Checklist Number : <input type="text" name="element[chkno]" style="width:400px;" > <br />
User Name :  <input  type="text" name="element[user]"style="width:400px;" >

<input type="hidden" name="element[id]" value="{{$pid}}" />
<input type="hidden" name="element[proj]" value="{{$project}}" >

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

{{foreach from=$elements_data key="key4" item="item4"}}
<tr>
<td>{{$item4.el_group}} </td>
<td>{{$item4.el_element}} </td>
<td>Link </td>
<td> <input type="hidden" name="element_data[{{$item4.el_id}}]" value="0" />
  	<label class="switch">
        <input class="switch-input" type="checkbox"  name="element_data[{{$item4.el_id}}][yesno]" value="1"  />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
        </label></td>
<td> </td>
<td><textarea rows="4" cols="40" name="element_data[{{$item4.el_id}}][comment]" id="{{$item4.el_id}}" style="overflow-y: scroll;"></textarea> 

</td>
</tr>
{{/foreach}}
</tbody>
</table>
<input type="submit" name="generate" value="Submit" />
</form>

 {{/if}}
