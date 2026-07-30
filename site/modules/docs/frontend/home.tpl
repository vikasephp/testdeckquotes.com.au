<h3 class="page-title">{{$title}}</h3>
<br />
<table width="100%" align="center" border="0" cellspacing="0" cellpadding="0">
<tr>
<td width="20%" border="0" cellspacing="0" cellpadding="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td width="5"><img src="{{$BASE_URL}}images/top-left-corner.jpg" alt="" /></td>
    <td align="left" width="664" class="contTopMid"></td>
    <td width="5"><img src="{{$BASE_URL}}images/top-right-corner.jpg" alt="" /></td>
  </tr>
  <tr>
    <td colspan="3" class="conBorders hpconwidth" height="450" valign="top">

	 <div id="leftcontainer"></div>
    <div align="center" id="container"><br /></div>
    </td>
  </tr>
  <tr>
    <td width="5"><img src="{{$BASE_URL}}images/bot-left-corner.jpg" alt="" /></td>
    <td align="left" width="1084" class="contBotMid"></td>
    <td width="5"><img src="{{$BASE_URL}}images/bot-right-corner.jpg" alt="" /></td>
  </tr>
  <!-- Shadow Starts -->
  <tr>
    <td colspan="3" align="center"><img src="{{$BASE_URL}}images/content-area-shadow.jpg" height="15" width="100%"/></td>
  </tr>
  <!-- Shadow Ends -->
</table>
</td><td>&nbsp;</td>
<td width="77%">
<table  border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td width="5"><img src="{{$BASE_URL}}images/top-left-corner.jpg" alt="" /></td>
    <td align="left" width="664" class="contTopMid"></td>
    <td width="5"><img src="{{$BASE_URL}}images/top-right-corner.jpg" alt="" /></td>
  </tr>
  <tr>
    <td colspan="3" class="conBorders hpconwidth" height="450" valign="top">
 <div id="rightcontainer">
 		 <div id="loadingimage"><img src="{{$BASE_URL}}images/loading-animation.gif" class="loading"/></div>
 <iframe name="loadfile" class="gdriveload" id="loadfile" src="" width="100%" height="450" ></iframe></div>
    </td>
  </tr>
  <tr>
    <td width="5"><img src="{{$BASE_URL}}images/bot-left-corner.jpg" alt="" /></td>
    <td align="left" width="1084" class="contBotMid"></td>
    <td width="5"><img src="{{$BASE_URL}}images/bot-right-corner.jpg" alt="" /></td>
  </tr>
  <!-- Shadow Starts -->
  <tr>
    <td colspan="3" align="center"><img src="{{$BASE_URL}}images/content-area-shadow.jpg" height="15" width="100%"/></td>
  </tr>
  <!-- Shadow Ends -->
</table>
</td>
</tr>
</table>
<script language="javascript">
$(document).ready(function(){	
var URL = "{{$BASE_URL}}{{$XFA.list}}/a_req";
$("#container").html('<img src="{{$BASE_URL}}images/loading-animation.gif" class="loading"/>');
$('#container').load(URL+'/getAll', function() {
//$('#container').load(URL+'/getAll/id/'+{{$id}}, function() {
});
});
//$(document).ready(function(){	
//});
var URL = "{{$BASE_URL}}{{$XFA.list}}/a_req";
$(".loaddata").click( function(){
$("#container").html('<img src="{{$BASE_URL}}images/loading-animation.gif" class="loading"/>');
$('#container').load(URL+'/getleads/id/' + event.target.id, function() {
});
});
function submitForm() {
	$('#container').html('<img src="{{$BASE_URL}}images/loading-animation.gif" class="loading"/>');
    $.ajax({type:'POST', url: URL+'/setleads/', data:$('#search_leads').serialize(), success: function(response) {
     $('#container').html(response);
    }});
    return false;
}
</script>