<h3 class="logo_header">{{$title}}</h3>
<div align="right"><input type="button" onclick="document.location.href='{{$BASE_URL}}{{$XFA.home}}'" value="Advance Search" /></div>
<table width="100%" align="center" border="0" cellspacing="0" cellpadding="0">
<tr>
<!--<td  width="15%" valign="top">
<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td width="5"><img src="{{$BASE_URL}}images/top-left-corner.jpg" alt="" /></td>
    <td align="left" class="contTopMid"></td>
    <td width="5"><img src="{{$BASE_URL}}images/top-right-corner.jpg" alt="" /></td>
  </tr>
  <tr>
    <td colspan="3" align="left" class="conBorders hpconwidth" height="400" valign="top">
    <div align="center" class="leftslidemenu">
		<ul>
        	{{foreach from=$soe key="key" item="item"}}
        	<li class="loaddata" id="{{$item.soe_id}}">:- {{$item.soe_name}}</li>
			{{/foreach}}
        </ul>
     </div></td>
  </tr>
  <tr>
    <td width="5"><img src="{{$BASE_URL}}images/bot-left-corner.jpg" alt="" /></td>
    <td align="left" class="contBotMid"></td>
    <td width="5"><img src="{{$BASE_URL}}images/bot-right-corner.jpg" alt="" /></td>
  </tr>

  <tr>
    <td colspan="3" align="center"><img src="{{$BASE_URL}}images/content-area-shadow.jpg" height="15" width="235"/></td>
  </tr>

</table>
</td>-->
<td width="100%" border="0" cellspacing="0" cellpadding="0">
<table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">

  <tr>
    <td width="5"><img src="{{$BASE_URL}}images/top-left-corner.jpg" alt="" /></td>
    <td align="left" width="664" class="contTopMid"></td>
    <td width="5"><img src="{{$BASE_URL}}images/top-right-corner.jpg" alt="" /></td>
  </tr>
  <tr>
    <td colspan="3" class="conBorders hpconwidth" height="400" valign="top">
    <div align="center" id="container"><br />
    {{if empty($id)}}
    	<div class="leads">
        <form name="search_leads" id="search_leads" action="" method="post" onsubmit="return submitForm();">
            <table cellpadding="0" cellspacing="0" width="80%" height="200" >
                <tr>
                    <th>Select Type:</th><td><select name="{{$TABLE}}[lead_type]" class="width200">
                        <option value="0">--Select--</option>
                        {{foreach from=$soe key="key" item="item"}}
                        <option value="{{$item.soe_id}}">{{$item.soe_name}}</option>
                        {{/foreach}}            
                        </select>
                    </td>
                    <th>Status:</th>
                    <td><select name="{{$TABLE}}[lead_status]" class="width200">
                        <option value="1">Active</option>
                        <option value="0">Inactive</option>
                    </select></td>
                </tr>
                <tr>
                <th>Project Name:</th>
                <td><input type="text" name="{{$TABLE}}[lead_project]" class="width300" /></td>
                <th>Date Range:</th>
                <td>From:&nbsp;<input type="text" class="w16em dateformat-Y-ds-m-ds-d" name="{{$TABLE}}[be_created_date_start]" value="" id="demo13" maxlength="10" readonly="readonly"/>&nbsp;
                To:&nbsp;<input type="text" class="w16em dateformat-Y-ds-m-ds-d" name="{{$TABLE}}[be_created_date_end]" value="" id="demo14" maxlength="10"  readonly="readonly"/>
                </td>
                </tr>
                <tr>
                <th>Customer name:</th>
                <td><input type="text" name="{{$TABLE}}[lead_cust]" class="width300" /></td>
                <th colspan="2"></th>
                </tr>
               <tr><th colspan="4"><input type="button" value="Export" />&nbsp;<input type="submit" name="search" id="search" value="Search" /></th></tr>         
            </table>
        </form>
        </div>
        {{/if}}
        <div id="container2"></div>
    </div>
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
{{if $id}}
$(document).ready(function(){	
var URL = "{{$BASE_URL}}{{$XFA.common}}/a_req";

$("#container").html('<img src="{{$BASE_URL}}images/loading-animation.gif" class="loading"/>');
$('#container').load(URL+'/getleads/id/'+{{$id}}, function() {

});
});
{{/if}}
//$(document).ready(function(){	
//});
var URL = "{{$BASE_URL}}{{$XFA.common}}/a_req";
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