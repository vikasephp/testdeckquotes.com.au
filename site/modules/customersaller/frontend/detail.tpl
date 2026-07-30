<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tabview/tabcontent.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/tabview/tabcontent.js">  </script>
<script src="{{$BASE_URL}}js/facefiles/jquery-1.2.2.pack.js" type="text/javascript"></script>
<link href="{{$BASE_URL}}js/facefiles/facebox.css" media="screen" rel="stylesheet" type="text/css" />
<script src="{{$BASE_URL}}js/facefiles/facebox.js" type="text/javascript"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/animatedcollapse.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/default.js"></script>
<script type="text/javascript">
animatedcollapse.addDiv('michael', 'fade=1')
animatedcollapse.addDiv('michael1', 'fade=1')
animatedcollapse.ontoggle=function($, divobj, state){ }
animatedcollapse.init()

function setvalue(bus_id, bus_name)
		{
		document.getElementById("txtCustomerId").value = bus_name;
		document.getElementById("txtbusId").value = bus_id;
		document.getElementById('divCustomerInfo').style.visibility = 'hidden';
		}
		
function setsalevalue(bus_id, bus_name)
		{
		document.getElementById("txtCustomerId2").value = bus_name;
		document.getElementById("txtbusId2").value = bus_id;
		document.getElementById('divCustomersaleInfo').style.visibility = 'hidden';
		}		
function closediv()
		{
		document.getElementById('divCustomerInfo').style.visibility = 'hidden';
		}		
		
</script>
<script type="text/javascript">
        var url = "{{$BASE_URL}}{{$XFA.home}}?bsn_name="; // The server-side script
	    var urlsale = "{{$BASE_URL}}{{$XFA.sale}}?bsn_name="; // The server-side script
	    var getlisturl = "{{$BASE_URL}}{{$XFA.listdata}}?cust_id="; // The server-side script
	    var getdetailurl = "{{$BASE_URL}}{{$XFA.detaildata}}?bus_id="; // The server-side script
		var getdeleteurl = "{{$BASE_URL}}{{$XFA.delete}}?be_id=";
		var getdateurl = "{{$BASE_URL}}{{$XFA.date}}?b_id=";
		var getsaleurl = "{{$BASE_URL}}{{$XFA.listsale}}?cust_id="; // The server-side script
		var getdetailsale = "{{$BASE_URL}}{{$XFA.detailsale}}?bus_id="; // The server-side script
		var getdeletesale = "{{$BASE_URL}}{{$XFA.deletesale}}?be_id=";	
			
       function handleHttpResponse() {   
        if (http.readyState == 4) {
              if(http.status==200) {
                  var results=http.responseText;
              document.getElementById('divCustomerInfo').innerHTML = results;
			  if(results !='')
			  	{document.getElementById('divCustomerInfo').style.visibility = 'visible';}
            }
          }
        }
       
        function requestCustomerInfo() {     
            var sId = document.getElementById("txtCustomerId").value;
            http.open("GET", url + escape(sId), true);
            http.onreadystatechange = handleHttpResponse;
            http.send(null);
        }
		
		function handleHttpsaleResponse() {   
        if (http.readyState == 4) {
              if(http.status==200) {
                  var results=http.responseText;
              document.getElementById('divCustomersaleInfo').innerHTML = results;
			  if(results !='')
			  	{document.getElementById('divCustomersaleInfo').style.visibility = 'visible';}
            }
          }
        }
       
        function requestCustomersaleInfo() {     
            var sId = document.getElementById("txtCustomerId2").value;
            http.open("GET", urlsale + escape(sId), true);
            http.onreadystatechange = handleHttpsaleResponse;
            http.send(null);
        }
		
		
	  function handleHttpResponselist() {   
        if (http.readyState == 4) {
              if(http.status==200) {
                  var results=http.responseText;
              document.getElementById('divbyerInfoToReturn').innerHTML = results;
			  if(results !='')
			  	{document.getElementById('divbyerInfoToReturn').style.visibility = 'visible';}
            }
          }
        }
		
		function requestbyerInfo(pagenum) {   
		   var sId = document.getElementById("cust_id").value;
		   curl = getlisturl + escape(sId) + '&pagenum=' + pagenum;	   
	   
            http.open("GET", curl, true);
            http.onreadystatechange = handleHttpResponselist;
            http.send(null);
        }
		
			  function handleHttpResponsedetail() {   
        if (http.readyState == 4) {
              if(http.status==200) {
                  var results=http.responseText;
				  var items = new Array();
				  	var new_array=results.split("||"); 
					document.getElementById('be_source_of_enquiry').value = "0";
					document.getElementById('be_answer_required').checked="0";
						for($i = 0; $i < new_array.length; $i++)
							{
								var new_array2=new_array[$i].split("|"); 
								if(new_array2[0] == 'bsn_id'){document.getElementById('txtbusId').value = new_array2[1];}
								if(new_array2[0] == 'bsn_name'){document.getElementById('txtCustomerId').value = new_array2[1];}
								if(new_array2[0] == 'be_created_date'){document.getElementById('demo14').value = new_array2[1];}
								if(new_array2[0] == 'be_created_time'){document.getElementById('be_created_time').value = new_array2[1];}	
								if(new_array2[0] == 'be_source_of_enquiry_other'){document.getElementById('be_source_of_enquiry_other').value = new_array2[1];}
								if(new_array2[0] == 'be_comments'){document.getElementById('be_comments').value = new_array2[1];}
								if(new_array2[0] == 'be_request_info'){document.getElementById('be_request_info').value = new_array2[1];}
								if(new_array2[0] == 'be_ipc_date'){document.getElementById('demo15').value = new_array2[1];}	
								if(new_array2[0] == 'be_ipc_time'){document.getElementById('be_ipc_time').value = new_array2[1];}
								if(new_array2[0] == 'be_ipc_comments'){document.getElementById('be_ipc_comments').value = new_array2[1];}	
								if(new_array2[0] == 'be_easts_date'){document.getElementById('demo16').value = new_array2[1];}	
								if(new_array2[0] == 'be_easts_time'){document.getElementById('be_easts_time').value = new_array2[1];}
								if(new_array2[0] == 'be_easts_comments'){document.getElementById('be_easts_comments').value = new_array2[1];}	
								if(new_array2[0] == 'be_seller_email'){document.getElementById('be_seller_email').value = new_array2[1];}	
								if(new_array2[0] == 'be_status'){document.getElementById('be_status').value = new_array2[1];}
								if(new_array2[0] == 'be_source_of_enquiry'){document.getElementById('be_source_of_enquiry').value = new_array2[1];}	
								if(new_array2[0] == 'be_answer_required'){document.getElementById('be_answer_required').checked = new_array2[1];}
								if(new_array2[0] == 'user_name'){document.getElementById('user_name1').innerHTML = new_array2[1];
								document.getElementById('user_name2').innerHTML = new_array2[1];}
							}
							
							
							
			  if(results !='')
				  	{toggleLayer0pen('byerenquiry');}
            }
          }
        }
		
		function requestbyerDetail(b) {   
		   var sId = b;
            http.open("GET", getdetailurl + escape(sId), true);
            http.onreadystatechange = handleHttpResponsedetail;
            http.send(null);
        }
	
	
	  function handleHttpResponsedelete() {   
        if (http.readyState == 4) {
              if(http.status==200) {
                  var results=http.responseText;		
			  if(results !='')
				  	{requestbyerInfo();}
            }
          }
        }
		
		function requestbyerDelete(b) {   
		   var sId = b;
            http.open("GET", getdeleteurl + escape(sId), true);
            http.onreadystatechange = handleHttpResponsedelete;
            http.send(null);
        }
		
			  function handleHttpResponsecurdate() {   
        if (http.readyState == 4) {
              if(http.status==200) {
                  var results=http.responseText;		
			  if(results !='')
				  	{
					var items = new Array();
				  	var new_array=results.split("|"); 
					document.getElementById(new_array[0]).value = new_array[1];
					document.getElementById(new_array[2]).value = new_array[3];
					
					}
            }
          }
        }
		
		function requestbyercurdate(b,c) {   
		   var sId = b;
		   getdateurl2 = getdateurl + escape(sId) + '&t_id=' + c;
            http.open("GET", getdateurl2, true);
            http.onreadystatechange = handleHttpResponsecurdate;
            http.send(null);
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
<script type="text/javascript">
    jQuery(document).ready(function($) {
      $('a[rel*=facebox]').facebox() 
    })
window.onload = setTimeout('initseller()', 1000);
</script>
<!DOCTYPE HTML>
<div align="center">
    <h3 class="page-title">{{$title}}</h3>
    <form name="detail" method="post" action="{{$XFA.detail}}" enctype="multipart/form-data">
     <table cellpadding="0" cellspacing="0" width="100%" border="0">
     	<tr><td>
            <table id="product-table" width="100%" cellpadding="0" cellspacing="0" height="400">
            <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" id="cust_id" />
            <tr>
                <th width="150">First Name:</th>
                <td><input type= "text" name="{{$TABLE}}[bcust_fname]" value="{{$detail.bcust_fname}}" class="lrg" /></td>
                <th width="150">Co./Last Name:</th>
                 <td><input type= "text" name="{{$TABLE}}[bcust_lname]" value="{{$detail.bcust_lname}}" class="lrg" /></td>
            </tr>
            <tr><th colspan="4" ><table id="none-table" width="100%" cellpadding="0" cellspacing="0">
            
              <tr><td width="150">Status:&nbsp;</td><th> 			
		<select name="{{$TABLE}}[bcust_status]" class="lrg" >
        	<option value="0" selected="selected"> -- select --</option>
            {{foreach from=$customers_status key="key" item="item"}}
            <option value="{{$item.cs_id}}" {{if $item.cs_id == $detail.bcust_status}} selected="selected" {{/if}}> {{$item.cs_name}}</option>
            {{/foreach}}
		</select> 
</th>  			<td>Type:</td><th colspan="4">       
       	<select name="{{$TABLE}}[bcust_type]" class="lrg" >
        	<option value="0" selected="selected"> -- select --</option>
            {{foreach from=$customers_type key="key" item="item"}}
            <option value="{{$item.ct_id}}" {{if $item.ct_id == $detail.bcust_type}} selected="selected" {{/if}}> {{$item.ct_name}}</option>
            {{/foreach}}
		</select>
       </th> 
       </tr>
       
        <tr><td >Is Buyer:&nbsp; </td><th><input type="checkbox" name="{{$TABLE}}[bcust_isbuyer]" value="1" {{if $detail.bcust_isbuyer == 1}} checked="checked" {{/if}}  onclick="tag()" id="isbyer" /></th><td >Is Seller: </td><th><input type="checkbox" name="{{$TABLE}}[bcust_isseller]" value="1" {{if $detail.bcust_isseller == 1}} checked="checked" {{/if}} onclick="tag1()" id="isseller"/>&nbsp;</th> 
       </tr>
     </table></th></tr>       
              
     <tr><th colspan="6" align="center" style="padding-left:10px; padding-top:5px;" > 
     				<ul id="countrytabs" class="shadetabs">
<li><a href="#" rel="country1" class="selected">Misc</a></li>
<li><a href="#" rel="country2">Address</a></li>
<li><a href="#" rel="country3">Notes</a></li>
<li><a href="#" rel="country4">Other Contacts</a></li>
<li><a href="#" rel="country5">Documents</a></li>
</ul>

<div style="border:1px solid gray; width:95%; margin-bottom: 1em; padding: 10px">

<div id="country1" class="tabcontent">
	<table id="none-table" width="100%" cellpadding="0" cellspacing="0">
              <tr><td width="200">Email:&nbsp;</td><th width="200"> <input type="text" name="{{$TABLE}}[bcust_misc_email1]" value="{{$detail.bcust_misc_email1}}" class="lrg" /></th>
              <td  width="150">Secondary Email:&nbsp; </td><th colspan="4"><input type="text" name="{{$TABLE}}[bcust_misc_email2]" value="{{$detail.bcust_misc_email2}}" class="lrg" />&nbsp;</th>
              </tr> 
              
              <tr><td >Send Marketing Emails: </td><th colspan="6"><input type="checkbox" name="{{$TABLE}}[bcust_misc_send_market_email]" value="1" {{if $detail.bcust_misc_send_market_email == 1}} checked="checked" {{/if}} />&nbsp;</th>
              </tr> 
              <tr><td>Logged Date:&nbsp;</td><th> <input type="text" name="{{$TABLE}}[bcust_misc_logged_date_date]" value="{{$detail.bcust_misc_logged_date_date}}" class="w16em dateformat-Y-ds-m-ds-d" id="demo4" readonly="readonly"/>&nbsp; <input type="text" name="{{$TABLE}}[bcust_misc_logged_date_time]" value="{{$detail.bcust_misc_logged_date_time}}" class="vvsml" id="t_id1" />&nbsp;<a href="javascript:requestbyercurdate('demo4','t_id1');" title="System Date/Time"><img src="{{$BASE_URL}}images/clock.png" alt="system time" /></a> </th>
              <td >Logged User:&nbsp;</td><th colspan="3">&nbsp;{{$detail.bcust_misc_logged_user}}</th>
           	</tr> 
         <tr><td >Mobile: </td><th><input type="text" name="{{$TABLE}}[bcust_misc_moble]" value="{{$detail.bcust_misc_moble}}" class="vsml" /></th>
          <td>Business:  </td><th width="250"><input type="text" name="{{$TABLE}}[bcust_misc_business]" value="{{$detail.bcust_misc_business}}" class="vsml" /></th> <td width="100">Home:</td><th><input type="text" name="{{$TABLE}}[bcust_misc_home]" value="{{$detail.bcust_misc_home}}" class="vsml" /></th></tr> 
          <tr><td colspan="10" ></td></tr>
         <tr><th colspan="6"><h1 class="postal">General Disclaimer </h1></th></tr> 
          <tr><td>Sent Date:&nbsp;</td><th> <input type="text" name="{{$TABLE}}[bcust_gendec_sent_date]" value="{{$detail.bcust_gendec_sent_date}}" class="w16em dateformat-Y-ds-m-ds-d" id="demo10" readonly="readonly"/>&nbsp; <input type="text" name="{{$TABLE}}[bcust_gendec_sent_time]" value="{{$detail.bcust_gendec_sent_time}}" class="vvsml" id="t_id2" />&nbsp;<a href="javascript:requestbyercurdate('demo10','t_id2');" title="System Date/Time"><img src="{{$BASE_URL}}images/clock.png" alt="system date" /></a> </th></tr>
              <tr><td >Signed Date:&nbsp; </td><th><input type="text" name="{{$TABLE}}[bcust_gendec_signed_date]" value="{{$detail.bcust_gendec_signed_date}}" class="w16em dateformat-Y-ds-m-ds-d" id="demo11" readonly="readonly"/>&nbsp; <input type="text" name="{{$TABLE}}[bcust_gendec_signed_time]" value="{{$detail.bcust_gendec_signed_time}}" class="vvsml" id="t_id3" />&nbsp;<a href="javascript:requestbyercurdate('demo11','t_id3');" title="System Date/Time"><img src="{{$BASE_URL}}images/clock.png" alt="system date" /></a> </th></tr>  
         
        <tr><td>Comment:&nbsp;</td><th  colspan="7"> <textarea  cols="111" name="{{$TABLE}}[bcust_gendec_comments]" rows="6">{{$detail.bcust_gendec_comments}}</textarea></th></tr> 
            
              <tr><td>File:&nbsp;</td><th>
  
              <a href="{{$BASE_URL}}files/images/{{$detail.bcust_gendec_file|default:'no_image.gif'}}" rel="lightbox">View Documents</a> </th>
              <td>Load:&nbsp;</td><th><input type="file" name="image"  class="lrg"/></th><td></td><th></th>
       </tr>            
     </table>			
</div>

<div id="country2" class="tabcontent">
<table id="none-table" width="100%" cellpadding="0" cellspacing="0">
  <tr><td>Address:&nbsp;</td><th  colspan="7"> <textarea  cols="111" id="editor1" name="{{$TABLE}}[bcust_address]" rows="6">{{$detail.bcust_address}}</textarea></th>
           
           	</tr> 
              <tr><td>Suburb:&nbsp;</td><th> <input type="text" name="{{$TABLE}}[bcust_suburb]" value="{{$detail.bcust_suburb}}" class="vsm" /></th>
              <td >Post Code:&nbsp; </td><th><input type="text" name="{{$TABLE}}[bcust_postcode]" value="{{$detail.bcust_postcode}}" class="vvsml" />&nbsp;</th>  <td >State:&nbsp; </td><th><input type="text" name="{{$TABLE}}[bcust_state]" value="{{$detail.bcust_state}}" class="vsml" />&nbsp;</th>
       </tr>  
           	</tr> 
              <tr><td>Country:&nbsp;</td><th> <input type="text" name="{{$TABLE}}[bcust_country]" value="{{$detail.bcust_country}}" class="sml" /></th>
              <td></td><th></th><td></td><th></th>
       </tr>   
       <tr><th colspan="4"><h1 class="postal">Postal Address </h1></th></tr> 
        <tr><td>Address:&nbsp;</td><th  colspan="7"> <textarea  cols="111" id="editor1" name="{{$TABLE}}[bcust_postal_address]" rows="6">{{$detail.bcust_postal_address}}</textarea></th>
           
           	</tr> 
              <tr><td>Suburb:&nbsp;</td><th> <input type="text" name="{{$TABLE}}[bcust_postal_suburb]" value="{{$detail.bcust_postal_suburb}}" class="sml" /></th>
              <td >Post Code:&nbsp; </td><th><input type="text" name="{{$TABLE}}[bcust_postal_postcode]" value="{{$detail.bcust_postal_postcode}}" class="vvsml" />&nbsp;</th>  <td >State:&nbsp; </td><th><input type="text" name="{{$TABLE}}[bcust_postal_state]" value="{{$detail.bcust_postal_state}}" class="vsml" />&nbsp;</th>
       </tr>  
           	</tr> 
              <tr><td>Country:&nbsp;</td><th> <input type="text" name="{{$TABLE}}[bcust_postal_country]" value="{{$detail.bcust_postal_country}}" class="sml" /></th>
              <td></td><th></th><td></td><th></th>
       </tr>            
     </table>
</div>

<div id="country3" class="tabcontent">
<table id="none-table" width="100%" cellpadding="0" cellspacing="0">
              <tr><td>Notes:&nbsp;</td><th  colspan="5"> <textarea cols="111" rows="5" name="{{$TABLE}}[bcust_notes]" rows="15">{{$detail.bcust_notes}}</textarea></th>
           
           	</tr>              
     </table>
</div>

<div id="country4" class="tabcontent">
<table id="none-table" width="100%" cellpadding="0" cellspacing="0"> 
  <tr><th valign="top"> <input type="button" name="exis_link" value="Link Existing" class="sml" /></th>
  <th valign="top"> <input type="button" name="exis_link" value="Quick Add Contact" class="sml" /></th> <td width="400"></td></tr> 
  <tr><td colspan="8" valign="top"><hr /></td></tr>
   <tr height="280"><td colspan="3" valign="top" height="200">&nbsp;</td></tr>
   </table>
</div>
<div id="country5" class="tabcontent">
<table id="none-table" width="100%" cellpadding="0" cellspacing="0"> 
  <tr><th valign="top">No Customer Documents found. </th>
  <th valign="top"></th> <td width="400"></td></tr> 
  <tr><td colspan="8" valign="top"><hr /></td></tr>
   <tr height="280"><td colspan="3" valign="top" height="200">&nbsp;</td></tr>
   </table>
</div>
<div id="country6" class="tabcontent">
Tab content 6 Goes here<br />
</div>
<div id="country7" class="tabcontent">
Tab content 7 Goes here<br />
</div>


</div>

<script type="text/javascript">

var countries=new ddtabcontent("countrytabs")
countries.setpersist(true)
countries.setselectedClassTarget("link") //"link" or "linkparent"
countries.init()

</script>
     
     </th> 
			
       </tr> 
   <tr><td colspan="10">

<div id="michael" style="width: 100%; background: #FFFFFF; display:none; ">
<ul id="countrytabs2" class="shadetabs">
<li><a href="#" rel="country100" class="selected">Buyer Matches</a></li>
<li><a href="#" rel="country200">Buyer Enquiries</a></li>

</ul>

<div style="border:1px solid gray; width:95%; margin-bottom: 1em; padding: 10px;">


<div id="country100" class="tabcontent">
<table id="none-table" width="100%" cellpadding="0" cellspacing="0"> 

   <tr ><td colspan="3" valign="top" height="300">dsfdsf&nbsp;</td></tr>
   </table>
</div>
<div id="country200" class="tabcontent">
<table id="none-table" width="100%" cellpadding="0" cellspacing="0" border="0">
<tr><th colspan="10"><input type="button" name="add" value="Add New" onclick="toggleLayer('byerenquiry');" id="add" class="sml" /></th></tr> 
<tr><th colspan="10" height="50">&nbsp;</th></tr>
<tr><th colspan="10"><div id="divbyerInfoToReturn"></div></th></tr>
<tr><th colspan="10" height="50"><div id="divbyerdetailInfoToReturn"></div></th></tr>
<tr><th colspan="10" height="300">	
<div id="divbyerdetailInfoToReturn"></div>
<div id="byerenquiry">
<table border="1" width="100%">
  <tr><td valign="top" width="200"> Business For Sale:&nbsp;</td> <th colspan="3">
  <input type="hidden" name="{{$TABLE}}[be_business_id]" value="{{$detail.be_business_id}}" id="txtbusId"/>
  <input type="text" class="xxlrg" name="{{$TABLE}}[bsn_name]" value="{{$detail.bsn_name}}" id="txtCustomerId" onkeyup="requestCustomerInfo()" />
 		 <br /><div id="divCustomerInfo" class="element"></div>
  <br />{{foreach from=$get_data key="key" item="item"}}{{$item}}{{/foreach}}
  <br /><span name="myspan" id="myspan"></span>

  </th> </tr> 	
   <tr><td valign="top" > Status:&nbsp;</td> <th width="250"><select name="{{$TABLE}}[be_status]" class="lrg"  id="be_status">
        	<option value="0"> -- select --</option>
           <option value="1" > Active</option>
           <option value="2" >Inactive</option>
		</select> </th><td width="150">Created Date:&nbsp;</td><th><input type="text" name="{{$TABLE}}[be_created_date]" value="{{$detail.be_created_date}}" class="w16em dateformat-Y-ds-m-ds-d" id="demo14" readonly="readonly"/>&nbsp; <input type="text" name="{{$TABLE}}[be_created_time]" value="{{$detail.be_created_time}}" class="vvsml" id="be_created_time" />&nbsp;<a href="javascript:requestbyercurdate('demo14','be_created_time');" title="System Date/Time"><img src="{{$BASE_URL}}images/clock.png" alt="Sysetm Date" /></a> </th> </tr> 
   <tr><td valign="top" > Source Of Enquiry:&nbsp;</td> <th><select name="{{$TABLE}}[be_source_of_enquiry]" class="lrg" id="be_source_of_enquiry" >
        	<option value="0"> -- select --</option>
            {{foreach from=$enquiry_source key="key" item="item"}}
            <option value="{{$item.soe_id}}" {{if $item.soe_id == $detail.be_source_of_enquiry}} selected="selected" {{/if}}> {{$item.soe_name}}</option>
            {{/foreach}}
		</select> </th><td>Other:&nbsp;</td><th><input type="text" name="{{$TABLE}}[be_source_of_enquiry_other]" value="{{$detail.be_source_of_enquiry_other}}" class="lrg" id="be_source_of_enquiry_other" /></th> </tr> 
   <tr><td valign="top" >Comments:&nbsp;</td> <th colspan="3"><textarea rows="5" cols="111" id="be_comments" name="{{$TABLE}}[be_comments]" rows="15">{{$detail.be_comments}}</textarea></th></tr> 
   <tr><td valign="top" > Requested Information: &nbsp;</td> <th colspan="3"><textarea rows="5" cols="111" id="be_request_info" name="{{$TABLE}}[be_request_info]" rows="15">{{$detail.be_request_info}}</textarea></th></tr> 
    <tr><td valign="top" > Answer Required: &nbsp;</td> 
    <th colspan="3"><input type="checkbox" name="{{$TABLE}}[be_answer_required]" value="1" id="be_answer_required"/></th></tr> 
    <tr><td valign="top" >&nbsp;<b class="phonecalls">Initial Phone Call</b></td> <th colspan="3" ></th></tr> 
     <tr><td width="150">Date:&nbsp;</td><th><input type="text" name="{{$TABLE}}[be_ipc_date]" value="{{$detail.be_ipc_date}}" class="w16em dateformat-Y-ds-m-ds-d" id="demo15" readonly="readonly"/>&nbsp; <input type="text" name="{{$TABLE}}[be_ipc_time]" value="{{$detail.be_ipc_time}}" class="vvsml" id="be_ipc_time" />&nbsp;<a href="javascript:requestbyercurdate('demo15','be_ipc_time');" title="System Date/Time"><img src="{{$BASE_URL}}images/clock.png" alt="System Date" /></a></th>
     <td>User:</td><th><div id="user_name1"></div></th> </tr> 
     <tr><td valign="top" >Comment:&nbsp;</td> <th colspan="3"><textarea rows="5" cols="111" name="{{$TABLE}}[be_ipc_comments]" rows="15" id="be_ipc_comments">{{$detail.be_ipc_comments}}</textarea> </th></tr> 
        <tr><td valign="top" >&nbsp;<b class="phonecalls">Email Advice Sent To Seller</b></td> <th colspan="3" ></th></tr> 
         <tr><td width="150">Date:&nbsp;</td><th><input type="text" name="{{$TABLE}}[be_easts_date]" value="{{$detail.be_easts_date}}" class="w16em dateformat-Y-ds-m-ds-d" id="demo16" readonly="readonly"/>&nbsp; <input type="text" name="{{$TABLE}}[be_easts_time]" value="{{$detail.be_easts_time}}" class="vvsml" id="be_easts_time" />&nbsp;<a href="javascript:requestbyercurdate('demo16','be_easts_time');" title="System Date/Time"><img src="{{$BASE_URL}}images/clock.png" alt="System Date" /></a></th>
     <td>User:</td><th><div id="user_name2"></div></th> </tr> 
     <tr><td valign="top" >Comment:&nbsp;</td> <th colspan="3"><textarea rows="5" cols="111" name="{{$TABLE}}[be_easts_comments]" rows="15" id="be_easts_comments">{{$detail.be_easts_comments}}</textarea></th></tr>
      <tr><td width="150">Seller Email:&nbsp;</td><th><input type="text" class="lrg" name="{{$TABLE}}[be_seller_email]" value="{{$detail.be_seller_email}}" id="be_seller_email"/></th><td></td><th></th></tr>
      </table>

</div>

      </th></tr> 
      
   </table>
</div>
</div>

<script type="text/javascript">
var countries=new ddtabcontent("countrytabs2")
countries.setpersist(true)
countries.setselectedClassTarget("link") //"link" or "linkparent"
countries.init()
</script>
</div>
 
   
   </td></tr>         
      <tr><td colspan="10">

<div id="michael1" style="width: 100%; background: #FFFFFF; display:none; ">
<ul id="countrytabs3" class="shadetabs">
<li><a href="#" rel="country110" class="selected">Buyer Business For Sales</a></li>
</ul>

<div style="border:1px solid gray; width:95%; margin-bottom: 1em; padding: 10px;">


<div id="country110" class="tabcontent">
<table id="none-table" width="100%" cellpadding="0" cellspacing="0" border="0">
<tr><th colspan="10"><input type="button" name="addsale" value="Add New" onclick="toggleLayer('byersaleenquiry');" id="addsale" class="vsml" /></th></tr> 
<tr><th colspan="10" height="50">&nbsp;</th></tr>
<tr><th colspan="10"><div id="divbyersaleInfoToReturn"></div></th></tr>
<tr><th colspan="10" height="50"><div id="divbyersaledetailInfoToReturn"></div></th></tr>
<tr><th colspan="10" height="300">	
<div id="divbyerdetailInfoToReturn"></div>
<div id="byersaleenquiry">



<table border="1" width="100%">
  <tr><td valign="top" width="200"> Business Name:&nbsp;</td> <th colspan="3">
<input type="hidden" name="{{$TABLE}}[bbfs_bus_id]" value="{{$detail.bbfs_bus_id}}" id="txtbusId2"/>
<input type="text" class="xxlrg" name="{{$TABLE}}[bbfs_business_name]" value="{{$detail.bbfs_business_name}}" id="txtCustomerId2" onkeyup="requestCustomersaleInfo()" />
 <br /><div id="divCustomersaleInfo" class="element"></div>
  <br />{{foreach from=$get_data key="key" item="item"}}{{$item}}{{/foreach}}
  <br /><span name="myspan" id="myspan"></span>

</th></tr>
      <tr><td width="150">Comment:&nbsp;</td><th><input type="text" class="xxlrg" name="{{$TABLE}}[bbfs_comments]" value="{{$detail.bbfs_comments}}" id="be_seller_email"/></th><td></td><th></th></tr>
      </table>
</div></th></tr>
   </table>
</div>

</div>

<script type="text/javascript">

var countries=new ddtabcontent("countrytabs3")
countries.setpersist(true)
countries.setselectedClassTarget("link") //"link" or "linkparent"
countries.init()

</script>
</div>


     
   
   </td></tr> 
         
              
            <tr>
                <td colspan="4" style="text-align:center;" height="40">
                    <input type="submit" name="subAddDetail" value="Save" class="vsml" />
                    <input type="button" name="btnCancelDetail" value="Cancel" onclick="document.location.href='{{$BASE_URL}}{{$XFA.list}}'" class="vsml" />
                </td>
            </tr>
        </table>
        </td></tr></table>
    </form>

</div>

<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("detail");
    frmvalidator.EnableMsgsTogether();
    //frmvalidator.addValidation("{{$TABLE}}[bsn_name]","req", "Please specify Business Name.");
</script>