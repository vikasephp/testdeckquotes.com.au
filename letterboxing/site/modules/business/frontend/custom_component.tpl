<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tabview/tabcontent.css" />
<title>.:: {{$SITE_NAME}} - {{$title}} ::.</title>
<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/default.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<style>
.black_overlay {
	display: none;
	position: absolute;
	top: 0%;
	left: 0%;
	bottom:0%;
	width: 100%;
	height: 320%;
	background-color: white;
	z-index:1001;
	-moz-opacity: 0.8;
	opacity:.80;
	filter: alpha(opacity=80);
}
.white_content {
	display: none; 
	position: absolute;
	top: 50%;
	left: 45%;
	padding: 0px;
	border: 0px solid orange;
	background-color: white;
	z-index:1002;
	overflow: auto;
}
</style>
<script type="text/javascript">
    function set_null(){alert("null")};
	
	function setcustvalue(cust_id, cust_name)
		{
		document.getElementById("dt_name").value = cust_name;
		document.getElementById("dt_id").value = cust_id;
		document.getElementById('divcustomersInfo').style.visibility = 'hidden';
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
	
function closediv()
		{
		document.getElementById('divcustomersInfo').style.visibility = 'hidden';
		}		
		 var getcurrenturl = "{{$BASE_URL}}customer.common?a_req=";
		  var getsendurl = "{{$BASE_URL}}business.common?a_req=";
   
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
		
	
	function handleHttpcustomerResponse() {   
        if (http.readyState == 4) {
              if(http.status==200) {
                  var results=http.responseText;
			  
				  document.getElementById('divcustomersInfo').style.visibility = 'hidden';
			  if(results !='')
			  	{ document.getElementById('divcustomersInfo').innerHTML = results;
				document.getElementById('divcustomersInfo').style.visibility = 'visible';
				parent.closeTop();}
            }
          }
        }
       
      function requestcustomersInfo() {     
            var sId = document.getElementById("dt_name").value;
			var custurl =urlsale + escape(sId)+ "&random=" + Math.random();
            http.open("GET", custurl, true);
            http.onreadystatechange = handleHttpcustomerResponse;
            http.send(null);
			parent.showTop();
        }	
		
		////////////////////// Hot Buttons //////////////////
	  function handleHttpcustomersResponse() {   
        if (http.readyState == 4) {
              if(http.status==200) {
                  var results=http.responseText;
			  if(results !='')
			  	{ 
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
        }
       
      function requestSend(req) {  
			if (confirm("Are you sure want to send.") == true)
		   		{
            var cId = document.getElementById("dt_id").value;
			var bId = document.getElementById("beb_id").value;
			var edl_be_id = document.getElementById("edt_id").value;
			var  getdateurlGD = getsendurl + escape(req) + '&cust_id=' + escape(cId)+ '&bus_id=' + escape(bId)+ '&edl_be_id=' + escape(edl_be_id) + "&random=" + Math.random();
		    http.open("GET", getdateurlGD, true);
            http.onreadystatechange = handleHttpcustomersResponse;
            http.send(null);
			parent.showTop();
			}
        }
		////////////////////// Hot Buttons //////////////////
		
		////////////////////// Hot Buttons Edit and Send Start//////////////////
		function requestEditSend(opr) {   
		   var sId = document.getElementById("dt_id").value;
		   var url = '{{$BASE_URL}}business.email/opr/'+ opr +'/cust_id/'+sId; 
			parent.popup(url); 	
        }
		////////////////////// Hot Buttons Edit and  Send End //////////////////	
			
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

	parent.requestPurchseOrder('add','NR');
	parent.requestcomponentInfo(1);
</script>
  
   
<script type="text/javascript">
	parent.$.fancybox.close();
</script>
{{/if}}

{{if $msg != 0}}
<script type="text/javascript">
	
	parent.toggleLayer('divbyersaleenquiry_c','addenq');

	closeTop();
</script>
{{/if}}

{{if $opr }}
<script type="text/javascript">
	
	parent.requestPurchseOrder('add','NR');
	
</script>

{{/if}}
</head>
<table width="100%" id="none-table" style="background-color:#FFFFFF;">
  <form name="detail" method="post" action="" enctype="multipart/form-data" onsubmit="showTop();return false;">
 
    <tr>
      <td colspan="3" width="100%">
      <table width="100%" height="70" style="background-color:#FFFFFF; border:1px solid #c1dad7;">
      <input type="hidden" name="custom[po_bsn_id]" value="{{$detail.po_bsn_id|default:$bsn_id}}" id="beb_id"/>
      <input type="hidden" name="custom[po_id]" value="{{$detail.po_id}}" />
          
          <tr>
            <td>Component:</td>
            <th colspan="3"><input type="text"  name="custom[po_component_name]" value="{{$detail.po_component_name}}" style="width:400px;"/>
              </th>
          </tr>
   
        </table></td>
    </tr>
    <tr>
      <td colspan="2"><div align="left">
          <input type="submit" name="subAddDetail" value="{{$button}}" class="sml"/>&nbsp;
          <input type="button" name="cancel" value="Cancel" onclick="javascript:parent.add_edit_component();" class="sml"/>
          </div></td>
    </tr>
  </form>
</table>
<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("detail");
    frmvalidator.EnableMsgsTogether();
    frmvalidator.addValidation("custom[po_component_name]","req", "Please specify component name.");
    //frmvalidator.addValidation("{{$TABLE}}[be_customer_id]","gt=0", "Please select customer name.");	
	
</script>

