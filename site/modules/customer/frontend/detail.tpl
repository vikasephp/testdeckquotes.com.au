<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tabview/tabcontent.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/tabview/tabcontent.js">  </script>
<!--<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/animatedcollapse.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/default.js"></script>-->
<script>
		!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
	</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />

<script type="text/javascript" >  
 function callBoxFancy(my_href) {  

 var j1 = document.getElementById("hiddenclicker");  

 j1.href = my_href;  

 $('#hiddenclicker').trigger('click');  

 }  
 
 function viewimg(url)
		 {
				 $(document).ready(function () {
						$.fancybox({
							'width': '49%',
							'height': '80%',
							'autoScale': true,
							'type': 'iframe',
							'href': url,
							'transitionIn' : 'fade',
							'transitionOut' : 'fade',
							'speedIn' : 300,
							'speedOut' : 300,
							'overlayShow' : true,
							'hideOnOverlayClick':false,
							'hideOnContentClick':false
							
						});
				});
		}
		
		
	function emailwindow(url, width, hight, scrolling)
			 {
			 $(document).ready(function () {
					$.fancybox({
						'width': width,
						'height': hight,
						'autoScale': true,
						'type': 'iframe',
						'href': url,
						'transitionIn' : 'elastic',
						'transitionOut' : 'elastic',
						'speedIn' : 300,
						'speedOut' : 300,
						'overlayShow' : true,
						'hideOnOverlayClick':false,
						'scrolling' : scrolling, 
						'hideOnContentClick':false			
					});
			});
			}	
		
		
		
</script>  
<script type="text/javascript">
animatedcollapse.addDiv('michael', 'fade=1')
animatedcollapse.addDiv('michael1', 'fade=1')
animatedcollapse.addDiv('GeneralDisclaimer', 'fade=1')

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
	    var getdetailurl = "{{$BASE_URL}}{{$XFA.detaildata}}?bus_id="; // The server-side script
		var getdetailsale = "{{$BASE_URL}}{{$XFA.detailsale}}?bus_id="; // The server-side script

		/*Ajex Url*/
		 var getcurrenturl = "{{$BASE_URL}}{{$XFA.common}}?a_req=";
		  var getaddediturl = "{{$BASE_URL}}{{$XFA.custdetail}}/a_req/";
		/*Ajex Url*/
	var getBuyerMatchesurl = "{{$BASE_URL}}{{$XFA.buyermatches}}/a_req/";
	
	
	<!---Begin RD - various Frame functions --->
	function docuploadResponse()
	{
		if(http.readyState == 4)
		{
			if(http.status == 200)
			{
				var result = ltrim(http.responseText);
				if(result!='')
				{
				var iframedata = new Array();
				iframedata = result.split('||');
				var len = iframedata.length;
				if(len>0)
					{
						var v1 = iframedata[0];
						var v2 = iframedata[1];
						document.getElementById(v1).innerHTML = v2;
					}
				}
				closeTop();
			}
		}
	}

	function docupload(action,divid,iframe)
	{
		var cust_id = document.getElementById('cust_id').value;
		if(cust_id)	
			{			
					var commonUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + action + "&cust_id=" + cust_id +"&divid="+ divid + "&random=" + Math.random();
					http.open('GET',commonUrl,true);
					http.onreadystatechange = docuploadResponse;
					http.send(null);
					showTop();
			}	
	}
<!---End RD - various Frame functions --->

	<!-- Begin Common Iframe Function for Common.php -->
function RequestcheckListIframe(action,iframe)
	{
		var cust_id = document.getElementById('cust_id').value;
		if(action == 'add_disclaimer')
		{
			var divid = divid;
			var iframeUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + action + '&cust_id=' + cust_id + "&random=" + Math.random();
			document.getElementById(iframe).src = iframeUrl;
			showTop();
		}	
		
		if(action == 'list_disclaimer')
		{
			var divid = divid;
			var iframeUrl = "{{$BASE_URL}}{{$XFA.common}}?a_req=" + action + '&cust_id=' + cust_id + "&random=" + Math.random();
			document.getElementById(iframe).src = iframeUrl;
			showTop();
		}
	}
	
<!-- End Common Iframe Function for Comman.php -->
		
      function handleHttpResponse() {   
        if (http.readyState == 4) {
              if(http.status==200) {
                  var results=http.responseText;
              document.getElementById('divCustomerInfo').innerHTML = results;
			  if(results !='')
			  	{document.getElementById('divCustomerInfo').style.visibility = 'visible';
				closeTop();
				}
            }
          }
        }
       
        function requestCustomerInfo() {     
            var sId = document.getElementById("txtCustomerId").value;
            http.open("GET", url + escape(sId), true);
            http.onreadystatechange = handleHttpResponse;
            http.send(null);
			showTop();
        }
		function saleToReturn()
			{
			toggleLayer('byersaleenquiry','addsale');
			requestbyerInfo('byerbslistdata', 1, 'divbyersaleInfoToReturn');
			}
	    function handleHttpResponsedetail() {   
        if (http.readyState == 4) {
              if(http.status==200) {
                  var results=http.responseText;
				  var items = new Array();
				  
							toggleLayer0pen('byerenquiry','add');
							
							
			  if(results !='')
				  	{closeTop();}
            }
          }
        }
		
		function requestbyerDetail(b) {   
		   var sId = b;
            http.open("GET", getdetailurl + escape(sId), true);
            http.onreadystatechange = handleHttpResponsedetail;
            http.send(null);
			showTop();
        }

	<!--Ajax Common function-->
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
					closeTop();
				
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
			showTop();
        }
	
	
	function handleHttpResponsedelete() {   
        if (http.readyState == 4) {
              if(http.status==200) {
                  var results=http.responseText;

						  if(results !='')
							{
							var new_array=results.split("||"); 
							var v1 = ltrim(new_array[0]);
							var v2 = ltrim(new_array[1]);
							//var v2 = ltrim(new_array[2]);
							requestbyerInfo(v1,1, v2);
							closeTop();
							}
						}
          		}
        }
			
		function requesDelete(a, b){   
			getdateurl2 = getcurrenturl + escape(a) + '&id=' + b;
	        http.open("GET", getdateurl2, true);
			http.onreadystatechange = handleHttpResponsedelete;
            http.send(null);
			showTop();
        }
	
	  function handleHttpResponselist() {   
        if (http.readyState == 4) {
              if(http.status==200) {
                var results=http.responseText;
			  if(results !='')
			  	{
				var new_array=results.split("||"); 
				var div_name = ltrim(new_array[0]);
				document.getElementById(div_name).style.visibility = 'visible';
				document.getElementById(div_name).innerHTML = new_array[1];
				closeTop();
			}
            }
          }
        }
		
		function requestbyerInfo(request, pagenum, divid) {   
		   var sId = document.getElementById("cust_id").value;
		   
		   if(sId)
		   {
		     var option = document.getElementById("order").value;
				var fromdate ='';
				var todate ='';
	   curl2 = getcurrenturl + request + '&cust_id=' + escape(sId) +'&opt='+ option + '&fromdate='+ fromdate + '&todate='+ todate+'&pagenum=' + pagenum +'&divid=' + divid  + "&random=" + Math.random();
            http.open("GET", curl2, true);
            http.onreadystatechange = handleHttpResponselist;
            http.send(null);
			showTop();
			}		
        }
	
	function popup(url) 
				{
				 params  = 'width='+screen.width/1.5;
				 params += ', height='+screen.height/1.5;
				 params += ', top=0, left=0'
				 params += ', scrolling=yes'
				 params += ', scrollbars=yes'
				 params += ', fullscreen=no';
				
				 newwin=window.open(url,'windowname4', params);
				 if (window.focus) {newwin.focus()}
				 return false;
				}
	
	function handleHttpResponsewin() {   
        if (http.readyState == 4) {
              if(http.status==200) {
                var results=http.responseText;
			  if(results !='')
			  	{
				closeTop();	
				//popup('{{$BASE_URL}}{{$XFA.email}}'); 
				emailwindow('{{$BASE_URL}}{{$XFA.email}}', '100%', '100%', 'yes');
				
				
				<!--window.open("{{$BASE_URL}}{{$XFA.email}}","Window1", "menubar=no,',type=fullWindow,fullscreen,scrollbars=yes',toolbar=no");-->
			}
            }
          }
        }
		
		function send_email(id) {   
		   var sId = document.getElementById("cust_id").value;
		    var Email = document.getElementById(id).value;

			if(Email)
			{
			emailwindow('{{$BASE_URL}}{{$XFA.email}}/email/' + Email, '100%', '100%', 'yes');
/*		    curl2 = getcurrenturl + "send_email" + '&cust_id=' + escape(sId) + '&email=' + Email + "&random=" + Math.random();	
            http.open("GET", curl2, true);
            http.onreadystatechange = handleHttpResponsewin;
            http.send(null);
			showTop();	
			}else{alert("Please enter email address.");*/
			
			}
        }

	<!--Ajax Common function END-->
		
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
{{if $detail.bcust_id}}
window.onload = setTimeout('initseller()', 3000);
{{/if}}
function iframe(a,b) {
document.getElementById('sellerinfo').src=b;
toggleLayer0pen('byersaleenquiry','addsale');
showTop();
}


function iframe_section(a,b,c)
{
var adeurl = getaddediturl + escape(a) +b;
var section = a;
showTop();
var divar = section + '_div';
var	addbutton = section + '_add';

document.getElementById(section).src=adeurl;
	if(c){
	toggleLayer(divar,addbutton);  
	}else{
	toggleLayer0pen(divar,addbutton);
	}	
}

//***************** BuyerMatches ******************//

function iframe_BuyerMatches(a,b,c,d)
{
var adeurl = getBuyerMatchesurl + escape(a) +b + d;
var section = a;

var divar = section + '_div';
var	addbutton = section + '_add';

document.getElementById('BuyerMatchesInfo').style.height = "600px";

//requestbyerDetail
document.getElementById(section).src=adeurl;
	if(c){
	toggleLayer(divar,addbutton);  
	}else{
	toggleLayer0pen(divar,addbutton);
	}
//toggleLayer('byerenquiry','add');
showTop();
}

function add_edit_byer()			
	{
		document.getElementById('sellerinfo').src='{{$BASE_URL}}customersaller.home/cust_id/{{$detail.$ID}}';
		toggleLayer('byersaleenquiry','addsale');
		showTop();
	}	
	
	function close_div(dname)
			{
			addbutton = "ADD";
			toggleLayer(dname,addbutton); 
			}
	
function popupWindow(o,d)
      {
        // o - Object to display.
        // d - Display, true =  display, false = hide
      
        var obj = document.getElementById(o);
        if(d)
          obj.style.display = 'block';
        else
          obj.style.display = 'none';
      }


function setfollowup_ids(be_id)
		{
		cur_cust_id = document.getElementById('cust_id').value;
		follow_url = "/cust_id/" + cur_cust_id + "/be_id/" +be_id;
		document.detail.followup_.value = follow_url;
		}	

function call_followup_window()
		{
		follow_url = document.detail.followup_.value;
		if(follow_url){
		iframe_section('buyerenquiriesinfofollowups',follow_url, 'button');
		}
		}
function call_followup_window_edit(url)
		{
		iframe_section('buyerenquiriesinfofollowups',url);
		}</script>
    
{{if $detail.$ID}}
	<script type="text/javascript">
			//setTimeout('requestbyerInfo("byerothercontact",1, "divOthercontactinforeturn");', 1000);
			//setTimeout('requestbyerInfo("byersaleenquiry",1, "divbyersaleInfoToReturn");', 2000);
	</script>

{{/if}}        
    
<div align="center">
  <h3 class="page-title">{{$title}}</h3>
  <form name="detail" method="post" action="{{$XFA.detail}}" enctype="multipart/form-data">
  <input type="hidden" name="followup_" value="" />
    <table cellpadding="0" cellspacing="0" width="100%" border="0">
    <tr>
    <td align="center">
    <div align="center" style="border:1px solid #888888; width:97%;">
    <table id="product-table" width="97%" cellpadding="0" cellspacing="0">
        <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" id="cust_id" />
        <input type="hidden" name="{{$TABLE}}[bcust_user_id]" value="{{$detail.bcust_user_id}}"/>
        <tr>
          <th width="150">First Name:</th>
          <td width="501"><input type= "text" name="{{$TABLE}}[bcust_fname]" value="{{$detail.bcust_fname}}" class="lrg" /></td>
          <th width="177">Last Name:</th>
          <td width="528"><input type= "text" name="{{$TABLE}}[bcust_lname]" value="{{$detail.bcust_lname}}" class="lrg" /></td>
        </tr>
        <tr>
          <th width="150">Status:</th>
          <td width="501">
          <select name="{{$TABLE}}[bcust_status]" class="lrg" >          
            {{foreach from=$customers_status key="key" item="item"}}
          <option value="{{$item.cs_id}}" {{if $item.cs_id == $detail.bcust_status}} selected="selected" {{/if}}> {{$item.cs_name}}</option>                    
            {{/foreach}}
		  </select></td>
          <th width="177">Primary Customer Type:</th>
          <td width="528">
          	<select name="{{$TABLE}}[bcust_type]" class="lrg" >
            <option value="0" selected="selected"> -- select --</option>       
            {{foreach from=$customers_type key="key" item="item"}}
            <option value="{{$item.ct_id}}" {{if $item.ct_id == $detail.bcust_type}} selected="selected" {{/if}}> {{$item.ct_name}}</option>
            {{/foreach}}
            </select></td>
        </tr> 
            </table>
           </div> 
            </th>
        </tr>
        
        <tr>
        	<td colspan="6">
            {{if !empty($detail.$ID) AND $detail.$ID>0}}<span style="padding-right:180px; float:right;"><a href="{{$BASE_URL}}js/vcard/index.php?fname={{$detail.bcust_fname}}&lname={{$detail.bcust_lname}}&email1={{$detail.bcust_misc_email1}}&email2={{$detail.bcust_misc_email2}}&mobile={{$detail.bcust_misc_moble}}&business={{$detail.bcust_misc_business}}&home={{$detail.bcust_misc_home}}" class="action_new" target="_blank">Vcard</a>{{/if}}</span>
            </td>
        </tr>
        <tr>
        <th colspan="6" align="center" style="padding-left:2px; padding-top:5px;" >
        <div align="center" style="width:99%"> 
        <ul id="countrytabs" class="shadetabs">
            <li><a href="#" rel="country1" class="selected">Misc</a></li>
            <li><a href="#" rel="country2">Address</a></li>
            <li><a href="#" rel="country3">Notes</a></li>
            <li><a href="#" rel="country4" >Customer Partnership</a></li>
            <li><a href="#" rel="country5">Documents</a></li>
          </ul>
          <div style="border:1px solid gray; width:96%; margin-bottom: 1em; padding: 15px;">
            <div id="country1" class="tabcontent">
              <table id="none-table" width="100%" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="200">Email:&nbsp;</td>
                  <th width="170"> <input type="text" name="{{$TABLE}}[bcust_misc_email1]" value="{{$detail.bcust_misc_email1}}" class="lrg" id="bcust_misc_email1" />
                    {{if $detail.bcust_id}}&nbsp;<a href="javascript:send_email('bcust_misc_email1');"><img src="{{$BASE_URL}}images/email.jpg" border="0" width="30" /></a>
                    {{else}}<img src="{{$BASE_URL}}images/email.jpg" border="0" width="30" />{{/if}}
                  </th>
                  <td  width="175">Secondary Email:&nbsp; </td>
                  <th colspan="4"><input type="text" name="{{$TABLE}}[bcust_misc_email2]" value="{{$detail.bcust_misc_email2}}" class="lrg" id="bcust_misc_email2" />
                      {{if $detail.bcust_id}}
                    &nbsp;<a href="javascript:send_email('bcust_misc_email2');"><img src="{{$BASE_URL}}images/email.jpg" border="0" width="30" /></a>
                    {{else}}
                    <img src="{{$BASE_URL}}images/email.jpg" border="0" width="30" />
                    {{/if}}</th>
                </tr>
                <tr>
                <td width="175"> Email-3</td>
                <th width="175"><input type="text" name="{{$TABLE}}[bcust_misc_email3]" value="{{$detail.bcust_misc_email3}}" class="lrg" id="bcust_misc_email3" /></th>
                <td> Email-4</td>
                <th><input type="text" name="{{$TABLE}}[bcust_misc_email4]" value="{{$detail.bcust_misc_email4}}" class="lrg" id="bcust_misc_email4" /></th>
              
                <td> Email-5</td>
                <th><input type="text" name="{{$TABLE}}[bcust_misc_email5]" value="{{$detail.bcust_misc_email5}}" class="lrg" id="bcust_misc_email5" /></th>
                
                </tr>
                <tr><td>Send Marketing Emails: </td>
                <th colspan="6"><input type="checkbox" name="{{$TABLE}}[bcust_misc_send_market_email]" value="1" {{if $detail.bcust_misc_send_market_email == 1}} checked="checked" {{/if}} />
                &nbsp;</th></tr>
                <tr>
                  <td>Logged Date:&nbsp;</td>
                  <th> <input type="text" name="{{$TABLE}}[ul_date]" value="{{$detail.ul_date}}" class="w16em dateformat-d-ds-m-ds-Y" id="demo4" readonly="readonly" style="width:100px;"/>&nbsp;&nbsp;<input type="text" name="{{$TABLE}}[ul_time]" value="{{$detail.ul_time}}" class="vvsml" id="t_id1" style="width:35px;" readonly="readonly"/>&nbsp;<a href="javascript:setcurdate('curdate','demo4','t_id1');" title="System Date/Time"><img src="{{$BASE_URL}}images/clock.png" alt="system time" /></a> </th>
                  <td >Logged User:&nbsp;</td>
                  <th colspan="3">{{$user_name}}</th>
                </tr>
                <tr>
                  <td >Mobile: </td>
                  <th><input type="text" name="{{$TABLE}}[bcust_misc_moble]" value="{{$detail.bcust_misc_moble}}" class="vsml" /></th>
                  <td>Business: </td>
                  <th width="144"><input type="text" name="{{$TABLE}}[bcust_misc_business]" value="{{$detail.bcust_misc_business}}" class="vsml" /></th>
                  <td width="100">Home:</td>
                  <th width="446"><input type="text" name="{{$TABLE}}[bcust_misc_home]" value="{{$detail.bcust_misc_home}}" class="vsml" /></th>
                </tr>
                <tr>
                  <td colspan="10" ></td>
                </tr>
                <tr>
                  <th colspan="6"> <div id="GeneralDisclaimer" style="width: 100%; background: #FFFFFF; display:none; ">
                      <div style="border:0px solid gray; width:95%; margin-bottom: 1em; padding: 10px;">
                        <table cellpadding="0" cellspacing="0" border="0" width="80%">
                          <tr>
                            <th colspan="6"><h1 class="postal">General Disclaimer</h1></th>
                          </tr>
                          <tr><th colspan="6">&nbsp;</th></tr>
                          <tr>
                            <td>Sent Date:&nbsp;</td>
                            <th> <input type="text" name="{{$TABLE}}[bcust_gendec_sent_date]" value="{{$detail.bcust_gendec_sent_date}}" class="w16em dateformat-d-ds-m-ds-Y" id="demo10" style="width:100px;" />
                              &nbsp;
       <input type="text" name="{{$TABLE}}[bcust_gendec_sent_time]" value="{{$detail.bcust_gendec_sent_time}}" class="vvsml" id="t_id2" style="width:40px;"/>
                              &nbsp;<a href="javascript:setcurdate('curdate','demo10','t_id2');" title="System Date/Time"><img src="{{$BASE_URL}}images/clock.png" alt="system date" /></a> </th>
                               <td width="200" align="right">&nbsp;</td>
                          </tr>
                          <tr>
                            <td >Signed Date:&nbsp; </td>
                            <th><input type="text" name="{{$TABLE}}[bcust_gendec_signed_date]" value="{{$detail.bcust_gendec_signed_date}}" class="w16em dateformat-d-ds-m-ds-Y" id="demo11" style="width:100px;" />
                              &nbsp;
                              <input type="text" name="{{$TABLE}}[bcust_gendec_signed_time]" value="{{$detail.bcust_gendec_signed_time}}" class="vvsml" id="t_id3" style="width:40px;">
                              &nbsp;<a href="javascript:setcurdate('curdate','demo11','t_id3'); " title="System Date/Time"><img src="{{$BASE_URL}}images/clock.png" alt="system date" /></a> </th><td width="200" align="right"><div align="center">User:&nbsp;{{$detail.gduser_name}}</div></td>
                          </tr>
                          <tr>
                            <td>Comment:&nbsp;</td>
                            <th  colspan="7"> <textarea  cols="111" name="{{$TABLE}}[bcust_gendec_comments]" rows="6">{{$detail.bcust_gendec_comments}}</textarea></th>
                          </tr>
                          <tr>
                            <td colspan="9" style="padding-left:100px;"><br />
                    	<iframe name="documentsIframe" id="documentsIframe" src=""  frameborder="0" scrolling="yes" width="100%" height="75px;" onload="javascript:closeTop();" ></iframe>
                            </td>                       
                          </tr>
                        </table>
                      </div>
                    </div></th>
                </tr>
              </table>
            </div>
            <div id="country2" class="tabcontent">
              <table id="none-table" width="100%" cellpadding="0" cellspacing="0">
                <tr>
                  <td>Address:&nbsp;</td>
                  <th  colspan="7"> <textarea  cols="111" id="editor1" name="{{$TABLE}}[bcust_address]" rows="6">{{$detail.bcust_address}}</textarea></th>
                </tr>
                <tr>
                  <td>Suburb:&nbsp;</td>
                  <th> <input type="text" name="{{$TABLE}}[bcust_suburb]" value="{{$detail.bcust_suburb}}" class="vsm" /></th>
                  <td >Post Code:&nbsp; </td>
                  <th><input type="text" name="{{$TABLE}}[bcust_postcode]" value="{{$detail.bcust_postcode}}" class="vvsml" />
                    &nbsp;</th>
                  <td >State:&nbsp; </td>
                  <th><input type="text" name="{{$TABLE}}[bcust_state]" value="{{$detail.bcust_state}}" class="vsml" />
                    &nbsp;</th>
                </tr>
                </tr>
                
                <tr>
                  <td>Country:&nbsp;</td>
                  <th> <input type="text" name="{{$TABLE}}[bcust_country]" value="{{$detail.bcust_country}}" class="sml" /></th>
                  <td></td>
                  <th></th>
                  <td></td>
                  <th></th>
                </tr>
                <tr>
                  <th colspan="4"><h1 class="postal">Postal Address </h1></th>
                </tr>
                <tr>
                  <td>Address:&nbsp;</td>
                  <th  colspan="7"> <textarea  cols="111" id="editor1" name="{{$TABLE}}[bcust_postal_address]" rows="6">{{$detail.bcust_postal_address}}</textarea></th>
                </tr>
                <tr>
                  <td>Suburb:&nbsp;</td>
                  <th> <input type="text" name="{{$TABLE}}[bcust_postal_suburb]" value="{{$detail.bcust_postal_suburb}}" class="sml" /></th>
                  <td >Post Code:&nbsp; </td>
                  <th><input type="text" name="{{$TABLE}}[bcust_postal_postcode]" value="{{$detail.bcust_postal_postcode}}" class="vvsml" />
                    &nbsp;</th>
                  <td >State:&nbsp; </td>
                  <th><input type="text" name="{{$TABLE}}[bcust_postal_state]" value="{{$detail.bcust_postal_state}}" class="vsml" />
                    &nbsp;</th>
                </tr>
                </tr>
                
                <tr>
                  <td>Country:&nbsp;</td>
                  <th> <input type="text" name="{{$TABLE}}[bcust_postal_country]" value="{{$detail.bcust_postal_country}}" class="sml" /></th>
                  <td></td>
                  <th></th>
                  <td></td>
                  <th></th>
                </tr>
              </table>
            </div>
            <div id="country3" class="tabcontent">
              <table id="none-table" width="100%" cellpadding="0" cellspacing="0">
                <tr>
                  <td>Notes:&nbsp;</td>
       <th  colspan="5"> <textarea cols="111" name="{{$TABLE}}[bcust_notes]" rows="15">{{$detail.bcust_notes}}</textarea></th>
                </tr>
              </table>
            </div>
            <div id="country4" class="tabcontent">
              <table id="none-table" width="100%" cellpadding="0" cellspacing="0">
              {{if $detail.bcust_id}}
                  <tr>
                  	<th valign="top"></th>
            		<th valign="top"><input type="button" name="Othercontactinfo_add" value="Add New" onclick="iframe_section('Othercontactinfo','/cust_id/{{$detail.$ID}}', 'button');" id="Othercontactinfo_add" class="sml" />&nbsp;<input type="button" value="Show" onclick="requestbyerInfo('byerothercontact',1, 'divOthercontactinforeturn');"  class="sml" />
	                </th>
                  	<td width="400"></td>
                </tr>
                <tr>
                  <td colspan="8" valign="top"><div id="divOthercontactinforeturn" align="left"></div></td>
                </tr>
                <tr>
                  <td colspan="3" valign="top">&nbsp;
                   <div id="Othercontactinfo_div"><iframe name="Othercontactinfo" id="Othercontactinfo" src="" width="100%" height="300" frameborder="0" scrolling="no" hspace="10" vspace="5" onload="javascript:closeTop();"> </iframe></div>
                  
                  </td>
                </tr>
                      {{else}}
                    <tr><th colspan="6"><div class="savelisting">Must save customer listing first.</div></th></tr>
                  {{/if}}
              </table>
            </div>
            <div id="country5" class="tabcontent">
              {{if $detail.bcust_id}}
		<iframe name="documentsIframelist" id="documentsIframelist" src=""  frameborder="0" scrolling="no" width="100%" height="75px;" onload="javascript:closeTop();" ></iframe> 		
             <!--<input type="button" name="adddoc" value="Add New" onclick="RequestcheckListIframe('list_disclaimer','documentsIframelist');" id="adddoc" class="vsml" /> -->
             {{else}}  
             <div align="left">Must save customer listing first.</div>
                {{/if}} 
            </div>
          
          </div>
          <script type="text/javascript">
var countries=new ddtabcontent("countrytabs")
countries.setpersist(true)
countries.setselectedClassTarget("link") //"link" or "linkparent"
countries.init()
</script>
</div>
        </th>
        </tr>
        
      
        <tr>
          <td colspan="10" align="center">
          <div id="michael1" style="width: 99%; background: #FFFFFF;"> 
            <ul id="countrytabs3" class="shadetabs">
              <li><a href="#" rel="country110" class="selected">Customer Projects</a></li>
               <li><a href="#" rel="country200">Customer Enquiries</a></li>
            </ul>
            <div style="border:1px solid gray; width:95%; margin-bottom: 1em; padding: 20px;">
              <div id="country110" class="tabcontent">
                <table id="none-table" width="100%" cellpadding="0" cellspacing="0" border="0" bgcolor="#FFFFFF">
                {{if $detail.bcust_id}}
                  <tr>
                    <th colspan="10"><input type="button" name="byersaleenquiry_add" value="Assign New Project" onclick="iframe_section('byersaleenquiry','/cust_id/{{$detail.$ID}}', 'button');" id="byersaleenquiry_add" class="vsml" />
                   <input type="button" value="Show" onclick="requestbyerInfo('byersaleenquiry',1, 'divbyersaleInfoToReturn');"  class="sml" />
                    </th>
                  </tr>
                  <tr>
                    <th colspan="10" height="50">&nbsp;</th>
                  </tr>
                  <tr>
                    <th colspan="10" bgcolor="#FFFFFF"> <div id="divbyersaleInfoToReturn"></div>
                   
                      <div id="byersaleenquiry_div">
                        <iframe name="byersaleenquiry" id="byersaleenquiry" src="" width="100%" height="200" frameborder="0" scrolling="no" hspace=10 vspace=5 onload="javascript:closeTop();"></iframe>
                      </div>
                      </th>
                  </tr>
                  {{else}}
                    <tr><th colspan="6"><div class="savelisting">Must save customer listing first.</div></th></tr>
                  {{/if}}
                </table>
               
              </div>
               <div id="country200" class="tabcontent">
                  <table id="none-table" width="100%" cellpadding="0" cellspacing="0" border="0">
                   {{if $detail.bcust_id}}
                    <tr>
                      <th colspan="10"><input type="button" name="buyerenquiriesinfo_add" value="Add New" onclick="iframe_section('buyerenquiriesinfo','/cust_id/{{$detail.$ID}}', 'button');" id="buyerenquiriesinfo_add" class="sml" />&nbsp;<input type="button" value="Export to XLS" onclick="document.location.href='{{$BASE_URL}}{{$XFA.common}}/a_req/byerlistdata/cust_id/{{$detail.bcust_id}}/export/1'" />&nbsp;&nbsp;&nbsp;
                 Status:&nbsp;
                 <select name="order" id="order" style="width:100px;">
                  	<option name="all">All</option>
                    <option name="active">Active</option>
                    <option name="inactive">Inactive</option>
                 </select>&nbsp;&nbsp;&nbsp;&nbsp;
                  <input type="button" value="Show" onclick="requestbyerInfo('byerlistdata',1, 'divbyerInfoToReturn');"  class="sml" /> 
                      </th>
                    </tr>
                    <tr>
                      <th colspan="10" height="50">&nbsp;</th>
                    </tr>
                    <tr>
                      <th colspan="10"><div id="divbyerInfoToReturn"></div></th>
                    </tr>
                    <tr>
                      <th colspan="10" align="center"> 
                                            
                      <div id="buyerenquiriesinfo_div">
                          <p>&nbsp;</p>
                          <iframe name="buyerenquiriesinfo" id="buyerenquiriesinfo" src="" width="100%" height="800" frameborder="0" scrolling="yes" hspace=10 vspace=5 onload="javascript:closeTop();" style="overflow-x: hidden; overflow-y: scroll; overflow:auto;"></iframe>
                        </div>     
                        </th>
                    </tr>
                        {{else}}
                    <tr><th colspan="6"><div class="savelisting">Must save customer listing first.</div></th></tr>
                  {{/if}}
                  </table>
                </div>
              <script type="text/javascript">
var countries=new ddtabcontent("countrytabs3")
countries.setpersist(true)
countries.setselectedClassTarget("link") //"link" or "linkparent"
countries.init();

function requestDelete(id)
	{
	if(confirm('Are you sure you want to delete.?'))
	window.location = "{{$BASE_URL}}{{$XFA.delete}}/bcust_id/"+id;
	}



function confirmation(id) {
	var answer1 = confirm("Are you sure want to delete this customer from database?? \n\n It will delete all data related  to this customer from database and will not be rollback!")
	if (answer1){
		var answer2 = confirm("Please click OK to delete this Customer.")
		if(answer2)
		{
			window.location = "{{$BASE_URL}}{{$XFA.delete}}/bcust_id/" + id;
		}
		else
		{
			alert("Operation Aborted. \n\n This Customer isn't deleted.")
		}
	}
	else
	{
		alert("Operation Aborted. \n\n This Customer isn't deleted.")
	}
}		


</script>
            </div></td>
        </tr>
        <tr>
          <td colspan="4" style="text-align:center;" height="40"><input type="submit" name="subAddDetail" value="Save" class="vsml" />
            <input type="button" name="btnCancelDetail" value="Cancel" onclick="document.location.href='{{$BASE_URL}}{{$XFA.list}}'" class="vsml" />
             <input type="button" name="btnDelete" value="Delete" onclick="javascript:confirmation({{$detail.$ID}});" class="vsml" />
         </td>
        </tr>
        <tr><td colspan="4"><div align="center" style="font-size:14px; color:#FF0000; padding-top:20px;">{{$error_msg}}</div></td></tr>
      </table>
  </form>
</div>

 <script type="text/javascript"> 
      setTimeout('tag();', 1000);
      </script>
<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("detail");
		frmvalidator.EnableMsgsTogether();
		 frmvalidator.addValidation("{{$TABLE}}[bcust_fname]","req", "Please specify Customer First Name.");
		  frmvalidator.addValidation("{{$TABLE}}[bcust_lname]","req", "Please specify Customer Last Name.");
			frmvalidator.addValidation("{{$TABLE}}[bcust_misc_email1]","req", "Please specify Customer Email.");
			 frmvalidator.addValidation("{{$TABLE}}[bcust_misc_email1]","email", "Please specify valid Customer Email.");
</script>
