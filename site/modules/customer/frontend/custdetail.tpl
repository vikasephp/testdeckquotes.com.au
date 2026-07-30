<script type="text/javascript" src="{{$BASE_URL}}js/tree/simpletreemenu.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tree/simpletree.css" />
  <script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
  <script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
  <link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tabview/tabcontent.css" />
<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/default.js"></script>



<script type="text/javascript">
    
	   
	    var urlsale = "{{$BASE_URL}}{{$XFA.common}}?bsn_name="; // The server-side script
	    var getcurrenturl = "{{$BASE_URL}}{{$XFA.common}}?a_req=";
		
		
	function setsalevalue(bus_id, bus_name)
		{
		document.getElementById("txtCustomerId2").value = bus_name;
		document.getElementById("txtbusId2").value = bus_id;
		document.getElementById('listofallbusinesses').style.visibility = 'hidden';
		}
	function closediv()
		{
		document.getElementById('listofallbusinesses').style.visibility = 'hidden';
		}	
	function handleHttpsaleResponse() {   
        if (http.readyState == 4) {
              if(http.status == 200) {
                  var results=http.responseText;
              document.getElementById('listofallbusinesses').innerHTML = results;
			  if(results !='')
			  	{document.getElementById('listofallbusinesses').style.visibility = 'visible';
				closeTop();return false;}
            }
          }
        }
       
        function requestCustomersaleInfo() { 
        var sId = document.getElementById("txtCustomerId2").value;
		var businessurl = getcurrenturl + 'all_businesses&bsn_name=' + escape(sId);	
			http.open("GET", businessurl, true);
            http.onreadystatechange = handleHttpsaleResponse;
            http.send(null);
			showTop();return false;
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
					parent.closeTop();
					return true;
					}
            }
          }
        }
		
	function setcurdate(a,b,c)
		{

var sId = b;
			getcurrenturl2 = getcurrenturl + escape(a) + "&b=" + escape(b) + "&t_id=" + escape(c) + "&random=" + Math.random(); 
					
			http.open('get',getcurrenturl2,true);
			http.onreadystatechange = handleHttpResponsesetcurdate;
			http.send(null);
			parent.showTop();
		}
		
		
		
		
			function handleHttpResponsewin() {   
        if (http.readyState == 4) {
              if(http.status==200) {
                var results=http.responseText;
			  if(results !='')
			  	{
				parent.closeTop();	
				window.open("{{$BASE_URL}}{{$XFA.email}}","Window1", "menubar=no,',type=fullWindow,fullscreen,scrollbars=yes',toolbar=no");
			}
            }
          }
        }
		
		function send_email(id) { 
		 
		   var sId = 2;
		    var Email = document.getElementById(id).value;
		    curl2 = getcurrenturl + "send_email" + '&email=' + Email + "&random=" + Math.random();
			if(Email)
			{ 
            http.open("GET", curl2, true);
            http.onreadystatechange = handleHttpResponsewin;
            http.send(null);
			parent.showTop();	
        }
		}
		
		////////////////////// GD Send //////////////////
		function handleHttpcustomersResponse() {   
        if (http.readyState == 4) {
              if(http.status==200) {
                  var results=http.responseText;
					parent.closeTop();
					 if(results == '1000')
						{
					  alert("E Dossiers not send because buyer hasn't signed deed of confidentiality.");	
					}else{
				  alert("Email has been sent successfully.");						
				}
            }
          }
        }
       
        function requestSend(req) {   
		if (confirm("Are you sure want to send.") == true)
		   		{
       
			var cId = document.getElementById("dt_id").value;
			var bId = document.getElementById("txtbusId2").value;
			var edl_be_id = document.getElementById("edt_id").value;
			var  getdateurlGD = getcurrenturl + escape(req) + '&cust_id=' + escape(cId)+ '&bus_id=' + escape(bId)+ '&edl_be_id=' + escape(edl_be_id) + "&random=" + Math.random();
		    http.open("GET", getdateurlGD, true);
            http.onreadystatechange = handleHttpcustomersResponse;
            http.send(null);
			parent.showTop();
			}
        }
		////////////////////// GD Send //////////////////		
		
		////////////////////// GD Edit and Send Start//////////////////
		function requestEditSend(opr) {   
		   var sId = document.getElementById("dt_id").value;
		   var url = '{{$BASE_URL}}business.email/opr/'+ opr +'/cust_id/'+sId; 
			parent.popup(url); 	
        }
		////////////////////// GD Edit and  Send End //////////////////	
		
		
		
		
<!--Ajax Common function-->

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
{{if $msg == 1}}
<script type="text/javascript">
	parent.requestbyerInfo('byerlistdata',1, 'divbyerInfoToReturn');
</script>
<script type="text/javascript">
	parent.iframe_section('buyerenquiriesinfo','', 'button');
</script>
 
{{/if}}
{{if $result == 1}}
<script type="text/javascript">
	parent.requestbyerInfo('byersaleenquiry',1, 'divbyersaleInfoToReturn');
   </script>
    <script type="text/javascript">
	parent.iframe_section('byersaleenquiry','', 'button');
   </script>  
{{/if}}

 
</head>
<body bgcolor="#FFFFFF">
{{if $customer_detail}}
<br>
<table border="0" width="100%" id="none-table" style="background-color:#FFFFFF;">
  <form name="detail" method="post" action="{{$XFA.custdetail}}" enctype="multipart/form-data">
    <tr>
      <td valign="middle" width="200" height="30"> Project Name:&nbsp;</td>
      <th><input type="hidden" name="{{$TABLE}}[bs_id]" value="{{$detail.bs_id}}" />
          <input type="hidden" name="{{$TABLE}}[bs_customers_id]" value="{{$cust_id}}" />
          <input type="hidden" name="{{$TABLE}}[bs_business_id]" value="{{$detail.bs_business_id}}" id="txtbusId2"/>
         <input type="text" class="xlrg" name="{{$TABLE}}[bs_business_name]" value="{{$detail.bsn_name}}" id="txtCustomerId2" onKeyUp="javascript:requestCustomersaleInfo();" autocomplete="off" style="width:420px;"/>
        <br />
        <div id="listofallbusinesses" class="element"></div></th>
    </tr>
    <tr>
      <td>Comments:&nbsp;</td>
      <th>
      	<textarea  name="{{$TABLE}}[bs_comments]" cols="100"  rows="5">{{$detail.bs_comments}}</textarea>
      
      </th>
      <td></td>
      <th></th>
    </tr>
    <tr>
      <th colspan="2"><div align="right" style="padding-right:80px; padding-top:20px;">
          <input type="submit" name="subAddDetail" value="{{$button}}" class="sml"/>
        </div></th>
      <td></td>
      <th></th>
    </tr>
  </form>
</table>
<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("detail");
    //frmvalidator.EnableMsgsTogether();
	 frmvalidator.addValidation("{{$TABLE}}[bs_business_name]","req", "Please specify project name.");
	 frmvalidator.addValidation("{{$TABLE}}[bs_business_id]","req", "Please specify valid project name.");
   
</script>
{{elseif $customer_business_sale_detail}}
<script type="text/javascript" language="javascript" >
parent.setfollowup_ids('{{$detail.be_id}}');
parent.requestbyerInfo('byerfollowups',1, 'buyerenquiriesinfofollowupsreturn');
</script>

<table  width="100%" id="none-table" style="background-color:#FFFFFF;" height="600">
  <form name="detail" method="post" action="{{$XFA.custdetail}}" enctype="multipart/form-data">
  <input type="hidden" name="{{$TABLE}}[be_user]" value="{{$detail.be_user|default:$detail.user_id}}"/>
   <tr>
    	<td colspan="5"><table width="100%" border="1" style="background-color:#FFFFFF;">
    <tr>
      <td width="200">Project Name:&nbsp;</td>
      <th colspan="3"> <input type="hidden" name="{{$TABLE}}[be_customer_id]" value="{{$cust_id}}" id="dt_id" >
        <input type="hidden" name="{{$TABLE}}[be_id]" value="{{$detail.be_id}}" id="edt_id">
        <input type="hidden" name="{{$TABLE}}[be_business_id]" value="{{$detail.be_business_id}}" id="txtbusId2" />
        <input type="text" style="width:598px;" name="{{$TABLE}}[bsn_name]" value="{{$detail.bsn_name}}" id="txtCustomerId2" onKeyUp="javascript:requestCustomersaleInfo();" autocomplete="off" />
        <br />
        <div id="listofallbusinesses" class="element"></div></th>
    </tr>
    <tr>
      <td > Status:&nbsp;</td>
      <th width="250"><select name="{{$TABLE}}[be_status]" class="lrg"  id="be_status">
          <option value="1" {{if $detail.be_status == 1}} selected="selected" {{/if}}> Active</option>
          <option value="2" {{if $detail.be_status == 2}} selected="selected" {{/if}}>Inactive</option>
        </select>
      </th>
      <td width="150">Created Date:&nbsp;</td>
      <th><input type="text" name="{{$TABLE}}[be_created_date]" value="{{$detail.be_created_date}}" style="width:104px;" id="demo14" class="w16em dateformat-d-ds-m-ds-Y" />
        &nbsp;
        <input type="text" name="{{$TABLE}}[be_created_time]" value="{{if $detail.be_created_time !== '00:00:00'}}{{$detail.be_created_time}}{{/if}}" style="width:54px;" id="be_created_time" />
        &nbsp;<a href="javascript:setcurdate('curdate','demo14','be_created_time');" title="System Date/Time"><img src="{{$BASE_URL}}images/clock.png" alt="Sysetm Date" /></a> </th>
    </tr>
    <tr>
      <td>Enquiry Source:&nbsp;</td>
      <th><select name="{{$TABLE}}[be_source_of_enquiry]" class="lrg" id="be_source_of_enquiry" >
           {{foreach from=$enquiry_source key="key" item="item"}}
          <option value="{{$item.soe_id}}" {{if $item.soe_id == $detail.be_source_of_enquiry}} selected="selected" {{/if}}> {{$item.soe_name}}</option>
            {{/foreach}}
        </select>
      </th>
      <td>Other:&nbsp;</td>
      <th><input type="text" name="{{$TABLE}}[be_source_of_enquiry_other]" value="{{$detail.be_source_of_enquiry_other}}" class="lrg" id="be_source_of_enquiry_other" /></th>
    </tr>
    <tr>
      <td >Enquiry Summery:&nbsp;</td>
      <th colspan="3"><textarea rows="5" cols="111" id="be_comments" name="{{$TABLE}}[be_comments]">{{$detail.be_comments}}</textarea></th>
    </tr>
    <tr>
      <td > Requested Information: &nbsp;</td>
      <th colspan="3"><textarea rows="5" cols="111" id="be_request_info" name="{{$TABLE}}[be_request_info]">{{$detail.be_request_info}}</textarea></th>
    </tr>
   <!-- <tr>
      <td > Answer Required: &nbsp;</td>
      <th colspan="3">
      <input type="checkbox" name="{{$TABLE}}[be_answer_required]" value="1" id="be_answer_required" {{if $detail.be_answer_required == 1}} checked {{/if}}/></th>
    </tr>-->
    </table></td></tr>
    <tr>
    	<td colspan="5">
        <table width="100%" border="1" style="background-color:#FFFFFF; padding-left:50px;">
    <tr>
      <td ><div class="sub_heading">Initial Phone Call</div></td>
      <th colspan="3" ></th>
    </tr>
    <tr>
      <td width="150">Date:&nbsp;</td>
      <th><input type="text" name="{{$TABLE}}[be_ipc_date]" value="{{$detail.be_ipc_date}}" style="width:104px;" id="demo15" class="w16em dateformat-d-ds-m-ds-Y"/>
        &nbsp;
        <input type="text" name="{{$TABLE}}[be_ipc_time]" value="{{$detail.be_ipc_time}}" style="width:54px;" id="be_ipc_time" />
        &nbsp;<a href="javascript:setcurdate('curdate','demo15','be_ipc_time');" title="System Date/Time"><img src="{{$BASE_URL}}images/clock.png" alt="System Date" /></a></th>
      <th>User:</th>
      <th width="70">
        <input type="hidden" class="lrg" name="{{$TABLE}}[be_ipc_user]" value="{{$detail.ipc_user_id|default:$detail.user_id}}"/>
     <div id="user_name1">{{$detail.ipc_user_name}}</div></th>
    </tr>
    <tr>
      <td valign="top" >Comment:&nbsp;</td>
      <th colspan="3"><textarea rows="5" cols="111" name="{{$TABLE}}[be_ipc_comments]" id="be_ipc_comments">{{$detail.be_ipc_comments}}</textarea>
      </th>
    </tr>
  </table></td></tr>
    <tr>
    	<td colspan="5"><table width="100%" border="1" style="background-color:#FFFFFF; padding-left:50px;">
    <tr>
      <td valign="top" ><div class="sub_heading">Email Advice Sent</div>&nbsp;</td>
      <th colspan="3" ></th>
    </tr>
    <tr>
      <td width="150">Date:&nbsp;</td>
      <th><input type="text" name="{{$TABLE}}[be_easts_date]" value="{{$detail.be_easts_date}}" style="width:104px;" id="demo16" class="w16em dateformat-d-ds-m-ds-Y"/>
        &nbsp;
        <input type="text" name="{{$TABLE}}[be_easts_time]" value="{{if $detail.be_easts_time !== '00:00:00'}}{{$detail.be_easts_time}}{{/if}}" style="width:54px;" id="be_easts_time" />
&nbsp;<a href="javascript:setcurdate('curdate','demo16','be_easts_time');" title="System Date/Time"><img src="{{$BASE_URL}}images/clock.png" alt="System Date" /></a></th>
      <th>User:</th>
      <th width="100">
      <input type="hidden" class="lrg" name="{{$TABLE}}[be_easts_user]" value="{{$detail.easts_user_id|default:$detail.user_id}}"/>
      <div id="user_name2">{{$detail.easts_user_name}}</div></th>
    </tr>
    <tr>
      <td valign="top" >Comment:&nbsp;</td>
      <th colspan="3"><textarea rows="5" cols="111" name="{{$TABLE}}[be_easts_comments]" id="be_easts_comments">{{$detail.be_easts_comments}}</textarea></th>
    </tr>
    <tr>
      <td width="150">Email:&nbsp;</td>
      <th><input type="text" style="width:250px;" name="{{$TABLE}}[be_seller_email]" value="{{$detail.be_seller_email}}" id="be_seller_email"/> 
      &nbsp;<a href="javascript:send_email('be_seller_email');"><img src="{{$BASE_URL}}images/email.jpg" border="0" width="30" /></a></th>
      <td></td>
      <th></th>
    </tr>
     <tr>
      <td width="150">Ip Address:&nbsp;</td>
      <th><input type="text" style="width:250px;" name="{{$TABLE}}[be_ip]" value="{{$detail.be_ip}}" /> </th>
      <td></td>
      <th></th>
    </tr>
    </table></td></tr>
      {{if $error_msg}}
  <tr><td colspan="3"><span style="color:#FF0000;">Buyer enquiry has already added.</span></td></tr>
  {{/if}}
    <tr>
      <th colspan="4"><div align="left" style="padding-top:20px;">
          <input type="submit" name="subAddDetail2" value="{{$button}}" class="sml"/>
          <input type="button" name="cancel" value="Cancel" onClick="javascript:parent.iframe_section('buyerenquiriesinfo','close', 'button');" class="sml"/>
        </div></th>
      <td></td>
      <td></td>
    </tr> 
    
  </form>
  <script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("detail");
    //frmvalidator.EnableMsgsTogether();
	 frmvalidator.addValidation("{{$TABLE}}[bsn_name]","req", "Please specify project name.");
	 frmvalidator.addValidation("{{$TABLE}}[be_business_id]","req", "Please specify valid project name.");
   
</script>
</table>
{{if $msgbuyerenquiryupdate}}
<script type="text/javascript" >
parent.requestbyerInfo('byerlistdata',1, 'divbyerInfoToReturn');
</script>
<script type="text/javascript" >
parent.iframe_section('buyerenquiriesinfo','close', 'button');
</script>
{{/if}}
{{/if}}
{{if $BuyerMatchesInfo}}
  
{{if $dataupdate}}
<script type="text/javascript" language="javascript" >

parent.requestbyerInfo('BuyerMatchesInfo',1, 'BuyerMatchesInforeturn');
parent.iframe_section('BuyerMatchesInfo','close', 'button');
</script>
{{/if}}
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
  <script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
  <link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
 <table cellpadding="0" cellspacing="0" id="emp-table" width="100%" align="left">
    <tr>
      <td ><table cellpadding="0" cellspacing="0" border="0">
      <form name="buyer_matches" action="" method="post" >
          <input type="hidden" name="{{$TABLE}}[bm_cust_id]" value="{{$cust_id}}" />
      <input type="hidden" name="{{$TABLE}}[bm_id]" value="{{$detail.bm_id}}" />
      	<tr><td colspan="10">&nbsp;</td></tr>
          <tr>
            <th>Created Date: </th>
            <td><input type="text" name="{{$TABLE}}[bm_create_date]" value="{{$detail.bm_create_date}}" class="w16em dateformat-d-ds-m-ds-Y" id="demo41" style="width:100px;" />
              <input type="text" name="{{$TABLE}}[bm_create_time]" value="{{$detail.bm_create_time}}"  id="t_id111" style="width:60px;" />
              &nbsp;<a href="javascript:setcurdate('curdate','demo41','t_id111');" title="System Date/Time"><img src="{{$BASE_URL}}images/clock.png" alt="system time" /></a></td>
           <td style="width:20px;">&nbsp;</td>
            <th>On Web:</th>
            <td><input type="checkbox" value="1" name="{{$TABLE}}[bm_onweb]" {{if $detail.bm_onweb == 1}} checked="checked" {{/if}}{{if empty($detail.bm_id)}} checked="checked" {{/if}}></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td><table cellpadding="0" cellspacing="0" border="0" id="survey_form">
           <tr>
            <th width="100"><span style="color:#FF0000; font-size:14px;">*</span>1. Description:</th></tr>
            <tr>
            <td><textarea rows="10" cols="132" name="{{$TABLE}}[bm_description]">{{$detail.bm_description}}</textarea></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td><br>
        <br>
        <table cellpadding="0" cellspacing="0" border="0" width="100%">
          <td width="57%" valign="top" style="padding-left:30px;">
          <div style="font-size:12px; font-weight:bold; padding-bottom:10px;"><span style="color:#FF0000; font-size:14px;">*</span>2. I am would consider owning a business in one/more of the following sectors: </div>
          <div class="scroll_div">
                <ul id="treemenu1" class="treeview">
                      {{foreach from=$sub_interest item=item1 key=key1}}
                      <li><input type="checkbox" name="{{$TABLE}}[abc][]"  value="{{$item1.bi_id}}" {{foreach from=$ind_codes key='key' item='item23'}}{{if $item23 == $item1.bi_id}} checked="checked" {{/if}} {{/foreach}} />{{$item1.bi_title}}</li>
                      {{/foreach}}
                </ul>
 <script type="text/javascript">
	ddtreemenu.createTree("treemenu1", true)
</script>
              </div></td>
            <td width="6%">&nbsp;</td>
     
        </table></td>
    </tr>
    <td>
    	<table cellpadding="0" cellspacing="0" border="0" width="100%" id="survey_form">
        <tr><td colspan="2"><div style="font-size:16px; padding-top:5px; font-weight:bold;">&nbsp;</div></td></tr>
        <tr><th colspan="2"><span style="color:#FF0000; font-size:14px;">*</span>3. Have you owned a business before? </th></tr>
        <tr><td>Yes <input type="radio" name="{{$TABLE}}[bm_owned_business_before]" value="1" {{if $detail.bm_owned_business_before == 1}} checked="checked" {{/if}}>&nbsp;&nbsp;&nbsp;
        		No <input type="radio" name="{{$TABLE}}[bm_owned_business_before]" value="0" {{if $detail.bm_owned_business_before == 0}} checked="checked" {{/if}}> <br>
      <br>If yes, please describe:<br><textarea cols="60" name="{{$TABLE}}[bm_owned_business_before_note]" rows="4">{{$detail.bm_owned_business_before_note}}</textarea></th><td></td></tr>

<tr><th><span style="color:#FF0000; font-size:14px;">*</span>4. When would you ideally like to be in your new business? </th><td></td></tr>
      
<tr><td colspan="2"><input type="radio" name="{{$TABLE}}[bm_like_new_business]" value="Within_the_next_4_weeks_(its_urgent)" {{if $detail.bm_like_new_business == "Within_the_next_4_weeks_(its_urgent)"}} checked {{/if}}>&nbsp;Within the next 4 weeks (its urgent) </td></tr>

<tr><td colspan="2"><input type="radio" name="{{$TABLE}}[bm_like_new_business]" value="Within_the_next_3_months_(I_would_like_something_soon)" {{if $detail.bm_like_new_business == "Within_the_next_3_months_(I_would_like_something_soon)"}} checked {{/if}}>&nbsp;Within the next 3 months (I would like something soon) </td></tr>

	
<tr><td colspan="2"><input type="radio" name="{{$TABLE}}[bm_like_new_business]" value="within_the_next_12_months_(i_am_happy_to_take_my_time)" {{if $detail.bm_like_new_business == "within_the_next_12_months_(i_am_happy_to_take_my_time)"}} checked {{/if}}>&nbsp;Within the next 12 months (I am happy to take my time) </td></tr>
	
<tr><td colspan="2"><input type="radio" name="{{$TABLE}}[bm_like_new_business]" value="Doesn't_matter_(No_rush_at_all)" {{if $detail.bm_like_new_business == "Doesn't_matter_(No_rush_at_all)"}} checked {{/if}}>&nbsp;Doesn't matter (No rush at all) </td></tr>	
<tr><td colspan="2">&nbsp;&nbsp;&nbsp;I need to be in the business by this date: <br>&nbsp;&nbsp;&nbsp;
 <input type="text" name="{{$TABLE}}[bm_like_new_business_date]" value="{{$detail.bm_like_new_business_date}}" 
      class="w16em dateformat-d-ds-m-ds-Y" style="width:100px;"></td></tr>	
<tr><th colspan="2"><span style="color:#FF0000; font-size:14px;">*</span>5. Does the business need to be located in a specific state:   </th></tr>
  <tr><td>
  		  {{foreach from=$main_states item=item key=key}}
        <input type="checkbox" name="{{$TABLE}}[states][]" value="{{$item.s_id}}" {{foreach from=$states_codes key='key' item='item22'}}
 		{{if $item22 == $item.s_id}} checked="checked" {{/if}} {{/foreach}} />
          {{$item.s_shortcodes}}&nbsp;&nbsp;&nbsp;
          {{/foreach}}
  
  </td><td></td></tr>
       
        
         <tr><th colspan="2"><span style="color:#FF0000; font-size:14px;">*</span>6.&nbsp;Describe the business that you would ultimately like own (as it relates to this purchase)?
  <br><br>&nbsp;&nbsp;&nbsp;
 <textarea cols="90" rows="10" name="{{$TABLE}}[bm_describe_the_business]">{{$detail.bm_describe_the_business}}</textarea></td></tr>	
           
         <tr><th colspan="2"><span style="color:#FF0000; font-size:14px;">*</span>7.&nbsp;What key features do you require the business you purchase to have? 
  <br><br>&nbsp;&nbsp;&nbsp;<textarea cols="90" rows="10" name="{{$TABLE}}[bm_key_features]">{{$detail.bm_key_features}}</textarea></td></tr>	 
  
  <tr><th>8.&nbsp;What is your price range when considering your next business purchase? </td><td></td></tr>      
<tr><td colspan="2"><input type="checkbox" name="{{$TABLE}}[bm_price_range][]" value="0-50000" {{if $price_range}}{{foreach from=$price_range key='key' item='item2'}}{{if $item2 == "0-50000"}} checked="checked" {{/if}}{{/foreach}}{{/if}}>&nbsp;$0 - $50,000 </td></tr>
<tr><td colspan="2"><input type="checkbox" name="{{$TABLE}}[bm_price_range][]" value="50000-100000" {{if $price_range}}{{foreach from=$price_range key='key' item='item2'}}{{if $item2 == "50000-100000"}} checked="checked" {{/if}}{{/foreach}}{{/if}}>&nbsp;$50,000 - $100,000 </td></tr>	
<tr><td colspan="2"><input type="checkbox" name="{{$TABLE}}[bm_price_range][]" value="100000-200000" {{if $price_range}}{{foreach from=$price_range key='key' item='item2'}}{{if $item2 == "100000-200000"}} checked="checked" {{/if}}{{/foreach}}{{/if}}>&nbsp;$100,000 - $200,000</td></tr>	
<tr><td colspan="2"><input type="checkbox" name="{{$TABLE}}[bm_price_range][]" value="200000-350000" {{if $price_range}}{{foreach from=$price_range key='key' item='item2'}}{{if $item2 == "200000-350000"}} checked="checked" {{/if}}{{/foreach}}{{/if}}>&nbsp;$200,000 - $350,000</td></tr>	
<tr><td colspan="2"><input type="checkbox" name="{{$TABLE}}[bm_price_range][]" value="350000-5000000" {{if $price_range}}{{foreach from=$price_range key='key' item='item2'}}{{if $item2 == "350000-5000000"}} checked="checked" {{/if}}{{/foreach}}{{/if}}>&nbsp;$350,000 - $500,000</td></tr>	
<tr><td colspan="2"><input type="checkbox" name="{{$TABLE}}[bm_price_range][]" value="500000-750000" {{if $price_range}}{{foreach from=$price_range key='key' item='item2'}}{{if $item2 == "500000-750000"}} checked="checked" {{/if}}{{/foreach}}{{/if}}>&nbsp;$500,000 - $750,000</td></tr>	
<tr><td colspan="2"><input type="checkbox" name="{{$TABLE}}[bm_price_range][]" value="750000-10000000" {{if $price_range}}{{foreach from=$price_range key='key' item='item2'}}{{if $item2 == "750000-10000000"}} checked="checked" {{/if}}{{/foreach}}{{/if}}>&nbsp;$750,000 - $1,000,000</td></tr>	
<tr><td colspan="2"><input type="checkbox" name="{{$TABLE}}[bm_price_range][]" value="1000000-1500000" {{if $price_range}}{{foreach from=$price_range key='key' item='item2'}}{{if $item2 == "1000000-1500000"}} checked="checked" {{/if}}{{/foreach}}{{/if}}>&nbsp;$1,000,000 - $1,500,000</td></tr>	
<tr><td colspan="2"><input type="checkbox" name="{{$TABLE}}[bm_price_range][]" value="1500000-2500000" {{if $price_range}}{{foreach from=$price_range key='key' item='item2'}}{{if $item2 == "1500000-2500000"}} checked="checked" {{/if}}{{/foreach}}{{/if}}>&nbsp;$1,500,000 - $2,500,000</td></tr>	 
<tr><td colspan="2"><input type="checkbox" name="{{$TABLE}}[bm_price_range][]" value="2500000+" {{if $price_range}}{{foreach from=$price_range key='key' item='item2'}}{{if $item2 == "2500000+"}} checked="checked" {{/if}}{{/foreach}}{{/if}}>&nbsp;$2,500,000+</td></tr>	
<tr><td colspan="2">&nbsp;&nbsp;&nbsp;This is the price that I don't want to, or, can't go over: <br>&nbsp;&nbsp;&nbsp;
<input type="text" name="{{$TABLE}}[bm_price_range_over]" value="{{$detail.bm_price_range_over}}"></td></tr>	
 
 <tr><th colspan="2"><span style="color:#FF0000; font-size:14px;">*</span>9. Would you consider purchasing/owning a franchise business? </th></tr>
  <tr><td>Yes <input type="radio" name="{{$TABLE}}[bm_franchise_business]" value="1" {{if $detail.bm_franchise_business == 1}} checked {{/if}}>
 &nbsp;&nbsp;&nbsp;No <input type="radio" name="{{$TABLE}}[bm_franchise_business]" value="0" {{if $detail.bm_franchise_business == 0}} checked {{/if}}>
 &nbsp;&nbsp;&nbsp;Maybe <input type="radio" name="{{$TABLE}}[bm_franchise_business]" value="2" {{if $detail.bm_franchise_business == 2}} checked {{/if}}>
  <br><br>Comments:<br><textarea cols="60" rows="4" name="{{$TABLE}}[bm_franchise_business_comments]">{{$detail.bm_franchise_business_comments}}</textarea></th><td></td></tr>
   <tr><th colspan="2">10. &nbsp;Why have you made the decision to purchase? 
  <br><br>&nbsp;&nbsp;&nbsp;<textarea cols="90" rows="5" name="{{$TABLE}}[bm_why_purchase]">{{$detail.bm_why_purchase}}</textarea></td></tr>
    
   <tr><th colspan="2">11. Do you need help securing or comparing finance for this business purchase.  </th></tr>
  <tr><td>Yes <input type="radio" name="{{$TABLE}}[bm_do_you_need_help]" value="1" {{if $detail.bm_do_you_need_help == 1}} checked {{/if}}>
 &nbsp;&nbsp;&nbsp;No <input type="radio" name="{{$TABLE}}[bm_do_you_need_help]" value="0" {{if $detail.bm_do_you_need_help == 0}} checked {{/if}}>
 &nbsp;&nbsp;&nbsp;Maybe <input type="radio" name="{{$TABLE}}[bm_do_you_need_help]" value="2" {{if $detail.bm_do_you_need_help == 2}} checked {{/if}}>
  </th><td></td></tr>
     <tr><th colspan="2">12. &nbsp;Do you need any aditional assistance with purchasing a business if so please indicate.  
  <br><br>&nbsp;&nbsp;&nbsp;<textarea cols="90" rows="5" name="{{$TABLE}}[bm_aditional_assistance]">{{$detail.bm_aditional_assistance}}</textarea></td></tr>  
   	</table>
    </td>
    </tr> 
   <tr>
   		 <th height="50" align="right">
         <div align="right"><input type="submit" value="{{$button}}" name="Addbuyermatches"  /></div>
         </th>
    </tr>
    </form>
  </table>
</div>
<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("buyer_matches");
		frmvalidator.EnableMsgsTogether();
		 frmvalidator.addValidation("{{$TABLE}}[bm_description]","req", "Please specify description.");
		  frmvalidator.addValidation("{{$TABLE}}[bm_price_range][]","selone_radio", "Please select price range.");
		   frmvalidator.addValidation("{{$TABLE}}[abc][]","selone_radio", "Please select interests.");
		       frmvalidator.addValidation("{{$TABLE}}[states][]","selone_radio", "Please spacify state.");
				     frmvalidator.addValidation("{{$TABLE}}[bm_description]","req", "Please specify Description.");
</script>
{{/if}}

{{if $show_other_contact == 'show'}}
{{if $oc_result}}
<script type="text/javascript" language="javascript" >
parent.requestbyerInfo('byerothercontact',1, 'divOthercontactinforeturn');
</script>
<script type="text/javascript" language="javascript" >
parent.iframe_section('Othercontactinfo','close', 'button');
</script>
{{/if}}
	<table cellpadding="0" cellspacing="0" border="0" id="emp-table" width="100%">
      <form name="other_contact" action="" method="post" >
      <input type="hidden" name="{{$TABLE}}[oc_cust_id]" value="{{$cust_id}}" />
      <input type="hidden" name="{{$TABLE}}[oc_id]" value="{{$detail.oc_id}}" />
      <tr>
        <th width="200">Type:</th>
          <td colspan="5">
          	<select name="{{$TABLE}}[oc_contact_type]" class="lrg" >
            {{foreach from=$customers_type key="key" item="item"}}
            <option value="{{$item.pt_id}}" {{if $item.pt_id == $detail.oc_contact_type}} selected="selected" {{/if}}> {{$item.pt_name}}</option>
            {{/foreach}}
            </select>
         </td>
        </tr> 
          <tr>
            <th>First Name: </th>
            <td><input type="text" name="{{$TABLE}}[oc_fname]" value="{{$detail.oc_fname}}"/></td>
            <th>Co./Last Name: </th>
            <td ><input type="text" name="{{$TABLE}}[oc_lname]" value="{{$detail.oc_lname}}"/></td>
             <th>Enable Email notification: </th>
            <td><input type="checkbox" name="{{$TABLE}}[oc_noti_enable]" {{if $detail.oc_noti_enable == 1}} checked="checked" {{/if}} value="1"/></td>
             <td></td>
              </tr>
                  <tr>
            <th>Email: </th>
            <td ><input type="text" name="{{$TABLE}}[oc_email]" value="{{$detail.oc_email}}"/></td>
            <th>Mobile: </th>
            <td><input type="text" name="{{$TABLE}}[oc_mobile]" value="{{$detail.oc_mobile}}"/></td>
            <th>Business: </th>
            <td><input type="text" name="{{$TABLE}}[oc_business]" value="{{$detail.oc_business}}"/></td>
            <td></td>
           </tr>    
             <tr>
            <th>Comments:</th>
            <td colspan="5"><textarea rows="10" cols="148" name="{{$TABLE}}[oc_comment]">{{$detail.oc_comment}}</textarea></td>
          </tr> 
          <tr>
            <th></th>
            <th colspan="5"><input type="submit" name="add_contact" value="{{$button}}" ></th>
          </tr>
        </form></table>         
 <script type="text/javascript" language="javascript" >
   var frmvalidator  = new Validator("other_contact");
		frmvalidator.EnableMsgsTogether();
		  frmvalidator.addValidation("{{$TABLE}}[oc_fname]","req", "Please specify first name.");
		   frmvalidator.addValidation("{{$TABLE}}[oc_lname]","req", "Please specify last name.");
		    frmvalidator.addValidation("{{$TABLE}}[oc_email]","req", "Please specify email.");
		     frmvalidator.addValidation("{{$TABLE}}[oc_email]","email", "Please specify valid email.");
</script>             
              
{{/if}}

{{if $show_followups_contact == 'show'}}
{{if $bef_fups_result}}
<script type="text/javascript" language="javascript" >
parent.requestbyerInfo('byerfollowups',1, 'buyerenquiriesinfofollowupsreturn');
</script>
<script type="text/javascript" language="javascript" >
parent.iframe_section('buyerenquiriesinfofollowups','close', 'button');
</script>
{{/if}}
	<table cellpadding="0" cellspacing="0" border="0" id="emp-table" width="100%">
      <form name="buyer_followup" action="" method="post" >
      <input type="hidden" name="{{$TABLE}}[bef_cust_id]" value="{{$cust_id}}" />
      <input type="hidden" name="{{$TABLE}}[bef_be_id]" value="{{$be_id}}" />
      <input type="hidden" name="{{$TABLE}}[bef_fups_id]" value="{{$detail.bef_fups_id}}" />
          <tr>
            <th>Created Date: </th>
            <td>
<input type="text" name="{{$TABLE}}[bef_create_date]" value="{{$detail.bef_create_date}}" style="width:104px;" id="bef_create_date"/>&nbsp;
<input type="text" name="{{$TABLE}}[bef_cerate_time]" value="{{$detail.bef_cerate_time}}" style="width:54px;" id="bef_cerate_time" />&nbsp;
<a href="javascript:setcurdate('curdate','bef_create_date','bef_cerate_time');" title="System Date/Time"><img src="{{$BASE_URL}}images/clock.png" alt="Sysetm Date" /></a></td> <th>Approved: </th>
            <td colspan="4"><input type="checkbox" name="{{$TABLE}}[bef_approved]" value="1" {{if $detail.bef_approved == 1}} checked {{/if}}/></td>
              </tr>
                  <tr>
            <th>Done Date:</th>
            <td ><input type="text" name="{{$TABLE}}[bef_done_date]" value="{{$detail.bef_done_date}}" style="width:104px;" id="bef_done_date" />&nbsp;
<input type="text" name="{{$TABLE}}[bef_done_time]" value="{{$detail.bef_done_time}}" style="width:54px;" id="bef_done_time" />&nbsp;
<a href="javascript:setcurdate('curdate','bef_done_date','bef_done_time');" title="System Date/Time"><img src="{{$BASE_URL}}images/clock.png" alt="Sysetm Date" /></a></td>
            <th>Done User:</th>
            <td><input type="hidden" name="{{$TABLE}}[bef_done_user]" value="{{$detail.user_id}}" style="width:45;"/>{{$detail.user_name}}</td>
           </tr>    
             <tr>
            <th>Comments:</th>
            <td colspan="5"><textarea rows="10" cols="148" name="{{$TABLE}}[bef_comments]">{{$detail.bef_comments}}</textarea></td>
          </tr> 
                 <tr>
            <th></th>
            <th colspan="5"><input type="submit" name="add_contact" value="{{$button}}" ></th>
          </tr>
              </form></table>
              
 <script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("buyer_followup");
		frmvalidator.EnableMsgsTogether();
		  frmvalidator.addValidation("{{$TABLE}}[bef_create_date]","req", "Please specify create date.");
</script>             
              
{{/if}}

</body>
