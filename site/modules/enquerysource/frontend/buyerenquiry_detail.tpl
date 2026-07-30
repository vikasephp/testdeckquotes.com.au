<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<base href="{{$BASE_URL}}" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tabview/tabcontent.css" />
<title>.:: {{$SITE_NAME}} - {{$title}} ::.</title>
<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/default.js"></script>

<script type="text/javascript">
    function set_null()
	{alert("null")};
	
	
	function setcustvalue(cust_id, cust_name)
		{
		document.getElementById("dt_name").value = cust_name;
		document.getElementById("dt_id").value = cust_id;
		document.getElementById('divcustomersInfo').style.visibility = 'hidden';
		}
		
function closediv()
		{
		document.getElementById('divcustomersInfo').style.visibility = 'hidden';
		}		
		 var getcurrenturl = "{{$BASE_URL}}customer.common?a_req=";
   
	    var urlsale = "{{$BASE_URL}}{{$XFA.cust_list}}?cust_name="; // The server-side script
		
			
		 function handleHttpResponsesetcurdate() {   
        if (http.readyState == 4) {
              if(http.status==200) {
                  var results=ltrim(http.responseText);				  
			  if(results !='')
				  	{
					var new_array = new Array();
				  	var new_array=results.split("|"); 
					var v1 = ltrim(new_array[0]);
					var v2 = new_array[1];
					var v3 = ltrim(new_array[2]);
					var v4 = new_array[3];
					document.getElementById(v1).value = v2;
					document.getElementById(v3).value = v4;	
					parent.closeTop();
					return true;
					}
            }
          }
        }
		
		function setcurdate(a,b,c) {   
		   var sId = b;
		    getdateurl2 = getcurrenturl + escape(a) + '&b=' + escape(sId)+ '&t_id=' + c + "&random=" + Math.random();
            http.open("GET", getdateurl2, true);
            http.onreadystatechange = handleHttpResponsesetcurdate;
            http.send(null);	
			parent.showTop();
        }
		
	
	function handleHttpcustomersResponse() {   
        if (http.readyState == 4) {
              if(http.status==200) {
                  var results=http.responseText;
				  document.getElementById('divcustomersInfo').style.visibility = 'hidden';
			  if(results !='')
			  	{ document.getElementById('divcustomersInfo').innerHTML = results;
				document.getElementById('divcustomersInfo').style.visibility = 'visible';
				closeTop();}
            }
          }
        }
       
        function requestcustomersInfo() {     
            var sId = document.getElementById("dt_name").value;
            http.open("GET", urlsale + escape(sId), true);
            http.onreadystatechange = handleHttpcustomersResponse;
            http.send(null);
			showTop();
        }
		
	  
	  
		
function getHTTPObject() {
  var xmlhttp;

  if(window.XMLHttpRequest){
    xmlhttp = new XMLHttpRequest();
  }
  else if (window.ActiveXObject){
    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    if (!xmlhttp){
        xmlhttp=new ActiveXObject("Msxml2.XMLHTTP");
    	}
	}
  return xmlhttp; 
}
var http = getHTTPObject(); // We create the HTTP Object	

</script>
   {{if $msg != 0}}  
   <script type="text/javascript">
	parent.requestbusenquiryInfo(1);
   </script>
   <script type="text/javascript">
	parent.$.fancybox.close();
   </script>   
{{/if}}
   {{if $msg != 0}}  
   <script type="text/javascript">
	parent.toggleLayer('divbyersaleenquiry','addenq');
	closeTop();
   </script>   
{{/if}}
</head>
<!--<body bgcolor="#FFFFFF" onClick = closediv();>-->

<body bgcolor="#FFFFFF">
<table width="100%" id="none-table" style="background-color:#FFFFFF;">
<form name="detail" method="post" action="{{$XFA.businessenquiry_detail}}" enctype="multipart/form-data" onsubmit="showTop();return false;">
<tr><td colspan="10" height="30">&nbsp;</td></tr>
<tr><td colspan="2"><table width="100%" border="1" style="background-color:#FFFFFF;">
<tr><td width="150">Business:</td><th colspan="3">
<input type="hidden" name="{{$TABLE}}[buse_id]" value="{{$detail.buse_id}}" />  
<input type="hidden" name="{{$TABLE}}[buse_cust_id]" value="{{$detail.buse_cust_id}}" id="dt_id" />  
<input type="hidden" name="{{$TABLE}}[buse_bsn_id]" value="{{$bsn_id}}" />
{{$business_name}}</th></tr>

<tr><td>Customer Name:</td>
<th colspan="3"><input type="text" class="xxlrg" name="{{$TABLE}}[buse_cust_name]" value="{{$detail.buse_cust_name}}" id="dt_name" onkeyup="requestcustomersInfo()" autocomplete="off" style="width:400px;"/>
 <br /><div id="divcustomersInfo" class="element"></div></th></tr>
 
 
 <tr><td>Created Date:</td><th width="300"> <input type="text" name="{{$TABLE}}[buse_created_date]" value="{{$detail.buse_created_date}}" style="width:80px;" id="demo6" readonly="readonly"/>&nbsp; <input type="text" name="{{$TABLE}}[buse_created_time]" value="{{$detail.buse_created_time}}" style="width:40px;" id="buse_created_time" />	&nbsp;<a href="javascript:setcurdate('curdate','demo6','buse_created_time');" title="System Date/Time"><img src="{{$BASE_URL}}images/clock.png" alt="System Date" /></a>		
		
</th> 
 <td >Status:&nbsp;</td><th ><select name="{{$TABLE}}[buse_status]" class="lrg">
 								<option value="1" {{if $detail.buse_status == 1}} selected="selected" {{/if}}>Active</option>
                                <option value="2" {{if $detail.buse_status == 2}} selected="selected" {{/if}}>Inactive</option>
                    		</select>
                    </th></tr>
   <tr><td valign="top" > Source Of Enquiry:&nbsp;</td> <th><select name="{{$TABLE}}[buse_source_of_enquiry]" class="lrg" id="be_source_of_enquiry" >
        	<option value="0"> -- select --</option>
            {{foreach from=$enquiry_source key="key" item="item"}}
            <option value="{{$item.soe_id}}" {{if $item.soe_id == $detail.buse_source_of_enquiry}} selected="selected" {{/if}}> {{$item.soe_name}}</option>
            {{/foreach}}
		</select> </th><td>Other:&nbsp;</td><th><input type="text" name="{{$TABLE}}[buse_source_of_other_enquiry]" value="{{$detail.buse_source_of_other_enquiry}}" class="lrg" id="buse_source_of_other_enquiry" /></th> </tr>                   
      <tr><td>Comment:&nbsp;</td><th colspan="3">
      	<textarea rows="5" cols="80" name="{{$TABLE}}[buse_comment]" id="buse_comment">{{$detail.buse_comment}}</textarea></th></tr>
         <tr><td>Requested Information:&nbsp;</td><th colspan="3">
      	<textarea rows="5" cols="80" name="{{$TABLE}}[buse_requested_information]" id="buse_requested_information">{{$detail.buse_requested_information}}</textarea></th></tr>
        <tr><td>Answer Required:</td><th colspan="3"><input type="checkbox" name="{{$TABLE}}[buse_answ_required]" value="1" {{if $detail.buse_answ_required == 1}} checked="checked" {{/if}}/></th></tr>
 </table>
</td>
</tr>     
 <tr><td colspan="2">
 <table width="100%" border="1" style="background-color:#FFFFFF;">
 <tr><th colspan="4"><div class="sub_heading">Initial Phone Call</div></th></tr>
 <tr><td width="150">Created Date:</td><th width="330"> <input type="text" name="{{$TABLE}}[buse_initial_phone_call_date]" value="{{$detail.buse_initial_phone_call_date|date_format:'%d-%m-%Y'}}" style="width:80px;" id="demo7" readonly="readonly"/>&nbsp; <input type="text" name="{{$TABLE}}[buse_initial_phone_call_time]" value="{{$detail.buse_initial_phone_call_time}}" style="width:40px;" id="buse_initial_phone_call_time" />	&nbsp;<a href="javascript:setcurdate('curdate','demo7','buse_initial_phone_call_time');" title="System Date/Time"><img src="{{$BASE_URL}}images/clock.png" alt="System Date" /></a>		
		
</th><td >User:&nbsp;</td><th width="400">{{$detail.buse_initial_phone_call_username}}<input type="hidden"  name="{{$TABLE}}[buse_initial_phone_call_user]" value="{{$detail.buse_initial_phone_call_user|default:$user_id}}" class="lrg" /></th></tr>
<tr><td>Comment:&nbsp;</td><th colspan="3">
      	<textarea rows="5" cols="80" name="{{$TABLE}}[buse_initial_phone_call_comment]"  id="buse_initial_phone_call_comment">{{$detail.buse_initial_phone_call_comment}}</textarea></th></tr>
        
 </table>
</td>
</tr>      
 <tr><td colspan="2">
 <table width="100%" border="1" style="background-color:#FFFFFF;">
 <tr><th colspan="4"><div class="sub_heading">Sent Dossier</div></th></tr>
 <tr><td width="150">Created Date:</td><th width="330"> <input type="text" name="{{$TABLE}}[buse_sent_dossier_date]" value="{{$detail.buse_sent_dossier_date|date_format:'%d-%m-%Y'}}" style="width:80px;" id="demo8" readonly="readonly"/>&nbsp; <input type="text" name="{{$TABLE}}[buse_sent_dossier_time]" value="{{$detail.buse_sent_dossier_time}}" style="width:40px;" id="buse_sent_dossier_time" />	&nbsp;<a href="javascript:setcurdate('curdate','demo8','buse_sent_dossier_time');" title="System Date/Time"><img src="{{$BASE_URL}}images/clock.png" alt="System Date" /></a>		
		
</th><td >User:&nbsp;</td><th width="400">{{$detail.buse_sent_dossier_username}}<input type="hidden"  name="{{$TABLE}}[buse_sent_dossier_user]" value="{{$detail.buse_sent_dossier_user|default:$user_id}}" class="lrg" /></th></tr>
                    
      <tr><td>Comment:&nbsp;</td><th colspan="3">
      	<textarea rows="5" cols="80" name="{{$TABLE}}[buse_sent_dossier_comment]" id="buse_sent_dossier_comment">{{$detail.buse_sent_dossier_comment}}</textarea></th></tr>
        
 </table>
</td>
</tr>      
<tr><td colspan="2">
 <table width="100%" border="1" style="background-color:#FFFFFF;">
 <tr><th colspan="4"><div class="sub_heading">Email Advice Sent To Seller</div></th></tr>
     <tr><td width="150">Created Date:</td><th width="330"> 
     <input type="text" name="{{$TABLE}}[buse_email_advice_sent_to_seller_date]" value="{{$detail.buse_email_advice_sent_to_seller_date|date_format:'%d-%m-%Y'}}" style="width:80px;" id="demo9" readonly="readonly"/>&nbsp; <input type="text" name="{{$TABLE}}[buse_email_advice_sent_to_seller_time]" value="{{$detail.buse_email_advice_sent_to_seller_time}}" style="width:40px;" id="buse_email_advice_sent_to_seller_time" />	&nbsp;<a href="javascript:setcurdate('curdate','demo9','buse_email_advice_sent_to_seller_time');" title="System Date/Time"><img src="{{$BASE_URL}}images/clock.png" alt="System Date" /></a>		
		
</th><td >User:&nbsp;</td><th width="400">{{$detail.buse_email_advice_sent_to_seller_username}}<input type="hidden"  name="{{$TABLE}}[buse_email_advice_sent_to_seller_user]" value="{{$detail.buse_email_advice_sent_to_seller_user|default:$user_id}}" class="lrg" /></th></tr>               
      <tr><td>Comment:&nbsp;</td><th colspan="3">
<textarea rows="5" cols="80" name="{{$TABLE}}[buse_email_advice_sent_to_seller_comment]" id="buse_email_advice_sent_to_seller_comment">{{$detail.buse_email_advice_sent_to_seller_comment}}</textarea></th></tr></table>
</td>
</tr>      
        <tr><td colspan="2"><div align="left"><input type="submit" name="subAddDetail" value="{{$button}}" class="sml"/>&nbsp;
        {{if $buyer_enquiry_page}}
        <input type="button" name="cancel" value="Cancel" onclick="parent.$.fancybox.close();" class="sml"/>
        	{{else}}
        <input type="button" name="cancel" value="Cancel" onclick="parent.add_edit_business_enquiry();" class="sml"/>{{/if}}</div></td></tr>
        </form>
      </table>

<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("detail");
    frmvalidator.EnableMsgsTogether();
    frmvalidator.addValidation("{{$TABLE}}[buse_cust_name]","req", "Please specify Customer Name.");
</script>
{{if $buyer_enquiry_page}}
<div style="font-size:28px; color:#000000; padding-bottom:7px; padding-top:7px;">Followup &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" name="add_f" value="Add New" onclick="document.location.href='{{$BASE_URL}}{{$XFA.businessenquiry_detail}}/bsns_id/{{$bsn_id}}/cust_id/{{$cust_id}}/action/add'" ></div>
<table cellpadding="3" cellspacing="3" width="98%" id="list-table" border="0">
  {{if $followuplist}}  
<tr bgcolor="#CCCCCC"><th>Action</th><th>Cerate Date</th><th>Done</th><th>Done User</th><th>Comments</th><th>Approved</th></tr>
         {{foreach from=$followuplist key="key" item="item"}}
		<tr> 
       <td width="10%">
       <a href="{{$BASE_URL}}{{$XFA.businessenquiry_detail}}/cust_id/{{$cust_id}}/bef_fups_id/{{$item.bef_fups_id}}/bsns_id/{{$bsn_id}}"  title="Edit">
         <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
         <a href="{{$BASE_URL}}{{$XFA.followupdelete}}/cust_id/{{$cust_id}}/bef_fups_id/{{$item.bef_fups_id}}/bsns_id/{{$bsn_id}}" onclick="javascript:if(!confirm('Are you sure you want to delete.?')) return false;"  title="Delete"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a></td>        
         <td>{{$item.bef_create_date|date_format:"%d-%m-%Y"}}</td>
         <td>{{if $item.bef_done_date !== '0000-00-00'}}{{$item.bef_done_date|date_format:"%d-%m-%Y"}}{{/if}}</td>
         <td>{{$item.user_name}}</td>
         <td width="50%">{{$item.bef_comments}}</td>
         <td><input type="checkbox" disabled="disabled" {{ if $item.bef_approved == 1}} checked="checked" {{/if}} /></td> 
</tr>
         {{/foreach}}
 {{/if}}        	
	</table>
    {{if $followuplist}}
    <table width="90%" border="0" cellpadding="0" cellspacing="0" align="center" style="border:none;">
  <tr> {{if $last > 1}}
    <td align="center"><div class='pagination'> {{if $pagenum == 1}} <span class='disabled'>&laquo; previous</span> {{else}} <a class="pagination" href="{{$BASE_URL}}{{$XFA.businessenquiry_detail}}/bsns_id/{{$bsn_id}}/cust_id/{{$cust_id}}/pagenum/{{$page_num}}{{math equation="x - y" x=$pagenum y=1}}" title="Previous">&laquo; previous</a> {{/if}}
        
        {{if $pagenum != 1}} <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.businessenquiry_detail}}/bsns_id/{{$bsn_id}}/cust_id/{{$cust_id}}/pagenum/1" title="1 Page">1</a></span> {{else}}<span class='current'>1</span> {{/if}}{{if $pagenum != 2}} <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.businessenquiry_detail}}/bsns_id/{{$bsn_id}}/cust_id/{{$cust_id}}/pagenum/2" title="2 Page">2</a></span> {{else}}<span class='current'>2</span> {{/if}}
        {{if $paginateprev.0 > 3}}
        ...
        {{/if}}
        {{foreach from=$paginateprev key="page_key" item="page_num"}}
        {{if $page_num == $pagenum OR $page_num <= 2}}
        {{elseif $page_num == $lastone}}
        
        {{else}} <span class="paginate"><a class="pagination"  href="{{$BASE_URL}}{{$XFA.businessenquiry_detail}}/bsns_id/{{$bsn_id}}/cust_id/{{$cust_id}}/pagenum/{{$page_num}}" title="{{$page_num}} Page">{{$page_num}}</a></span> {{/if}}
        {{/foreach}}
        
        {{foreach from=$paginatenext key="page_key" item="page_num2"}}
        {{if $page_num2 < $last AND $page_num2 != $lastone}}
        {{if $page_num2 == 1}}
        {{elseif $page_num2 == 2}}
        {{else}}
        {{if $page_num2 == $pagenum OR $page_num2 <= 0}} <span class='current'> {{$page_num2}}</span> {{else}} <a class="pagination"  href="{{$BASE_URL}}{{$XFA.businessenquiry_detail}}/bsns_id/{{$bsn_id}}/cust_id/{{$cust_id}}/pagenum/{{$page_num2}}" title="{{$page_num2}} Page">{{$page_num2}}</a> {{/if}}
        {{/if}}     
        {{/if}}
        {{/foreach}}
        {{if $page_num2 < $lasttow}}
        ...
        {{/if}}
        {{if $lastone == 1}}
        {{elseif $lastone == 2}}
        {{else}}
        {{if $pagenum == $lastone }} <span class='current'>{{$lastone}}</span> {{else}} <a class="pagination"  href="{{$BASE_URL}}{{$XFA.businessenquiry_detail}}/bsns_id/{{$bsn_id}}/cust_id/{{$cust_id}}/pagenum/{{$lastone}}" title="{{$lastone}} Page">{{$lastone}}</a> {{/if}}
        {{/if}}
        {{if $last == 1}}
        {{elseif $last == 2}}
        {{else}}
        {{if $pagenum == $last}} <span class='current'>{{$last}}</span> {{else}} <a class="pagination"  href="{{$BASE_URL}}{{$XFA.businessenquiry_detail}}/bsns_id/{{$bsn_id}}/cust_id/{{$cust_id}}/pagenum/{{$last}}" title="{{$last}} Page">{{$last}}</a> {{/if}}
        {{/if}}
        {{if $pagenum == $last}} <span class='disabled'>next &raquo;</span> {{else}} <a class="pagination" href="{{$BASE_URL}}{{$XFA.businessenquiry_detail}}/bsns_id/{{$bsn_id}}/cust_id/{{$cust_id}}/pagenum/{{math equation="x + y" x=$pagenum y=1}}" title="Next">next &raquo;</a></div>
      {{/if}} </td>
    {{/if}} </tr>
</table>    
  	{{/if}}  
{{if $followupform == 'show'}}
    
    <table cellpadding="0" cellspacing="0" border="0" id="emp-table" width="100%">
    <tr><td colspan="10">&nbsp;</td></tr>
      <form name="buyer_followup" action="" method="post" >
      <input type="hidden" name="{{$TABLE}}[bef_cust_id]" value="{{$cust_id}}" />
      <input type="hidden" name="{{$TABLE}}[bef_be_id]" value="{{$detail.buse_id}}" />
      <input type="hidden" name="{{$TABLE}}[bef_fups_id]" value="{{$followupdetail.bef_fups_id}}" />
      <input type="hidden" name="{{$TABLE}}[bsn_id]" value="{{$bsn_id}}" />
      
          <tr>
            <th width="20%">Created Date: </th>
            <td>
<input type="text" name="{{$TABLE}}[bef_create_date]" value="{{$followupdetail.bef_create_date}}" style="width:104px;" id="bef_create_date" readonly="readonly"/>&nbsp;
<input type="text" name="{{$TABLE}}[bef_cerate_time]" value="{{$followupdetail.bef_cerate_time}}" style="width:54px;" id="bef_cerate_time" readonly="readonly"/>&nbsp;
<a href="javascript:setcurdate('curdate','bef_create_date','bef_cerate_time');" title="System Date/Time"><img src="{{$BASE_URL}}images/clock.png" alt="Sysetm Date" /></a></td> <th>Approved: </th>
            <td colspan="4"><input type="checkbox" name="{{$TABLE}}[bef_approved]" value="1" {{if $followupdetail.bef_approved == 1}} checked {{/if}}/></td>
              </tr>
                  <tr>
            <th>Done Date:</th>
            <td ><input type="text" name="{{$TABLE}}[bef_done_date]" value="{{$followupdetail.bef_done_date}}" style="width:104px;" id="bef_done_date" readonly="readonly"/>&nbsp;
<input type="text" name="{{$TABLE}}[bef_done_time]" value="{{$followupdetail.bef_done_time}}" style="width:54px;" id="bef_done_time" readonly="readonly"/>&nbsp;
<a href="javascript:setcurdate('curdate','bef_done_date','bef_done_time');" title="System Date/Time"><img src="{{$BASE_URL}}images/clock.png" alt="Sysetm Date" /></a></td>
            <th>Done User:</th>
            <td><input type="hidden" name="{{$TABLE}}[bef_done_user]" value="{{$followupdetail.user_id|default:$user_id}}" style="width:45;"/>{{$followupdetail.user_name}}</td>
           </tr>    
             <tr>
            <th>Comments:</th>
            <td colspan="5"><textarea rows="10" cols="148" name="{{$TABLE}}[bef_comments]">{{$followupdetail.bef_comments}}</textarea></td>
          </tr> 
                 <tr>
            <th></th>
            <th colspan="5"><input type="submit" name="add_foolowup" value="{{$folloupbutton}}" ></th>
          </tr>
              </form></table>
              
 <script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("buyer_followup");
		frmvalidator.EnableMsgsTogether();
		  frmvalidator.addValidation("{{$TABLE}}[bef_create_date]","req", "Please specify create date.");
</script>   
 {{/if}} 
  {{/if}}       
</body>