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
    
	   
	    var urlsale = "{{$BASE_URL}}{{$XFA.sale}}?bsn_name="; // The server-side script
	   
	function setsalevalue(bus_id, bus_name)
		{
		document.getElementById("txtCustomerId2").value = bus_name;
		document.getElementById("txtbusId2").value = bus_id;
		document.getElementById('divCustomersaleInfo').style.visibility = 'hidden';
		}
	function closediv()
		{
		document.getElementById('divCustomersaleInfo').style.visibility = 'hidden';
		}	
	function handleHttpsaleResponse() {   
        if (http.readyState == 4) {
              if(http.status == 200) {
                  var results=http.responseText;
              document.getElementById('divCustomersaleInfo').innerHTML = results;
			  if(results !='')
			  	{document.getElementById('divCustomersaleInfo').style.visibility = 'visible';
				closeTop();return false;}
            }
          }
        }
       
        function requestCustomersaleInfo() {     
            var sId = document.getElementById("txtCustomerId2").value;
            http.open("GET", urlsale + escape(sId), true);
            http.onreadystatechange = handleHttpsaleResponse;
            http.send(null);
			showTop();return false;
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
	parent.saleToReturn();
   </script>   
{{/if}}
</head>
<body bgcolor="#FFFFFF">

<table border="0" width="100%" id="none-table" style="background-color:#FFFFFF;" height="160">
<form name="detail" method="post" action="{{$XFA.home}}" enctype="multipart/form-data">
  <tr><td valign="middle" width="200"> Business Name:&nbsp;</td> <th>
<input type="hidden" name="{{$TABLE}}[bbfs_id]" value="{{$detail.bbfs_id}}" />  
<input type="hidden" name="{{$TABLE}}[bbfs_cust_id]" value="{{$cust_id}}" />
<input type="hidden" name="{{$TABLE}}[bbfs_bus_id]" value="{{$detail.bbfs_bus_id}}" id="txtbusId2"/>
<input type="text" class="xxlrg" name="{{$TABLE}}[bbfs_business_name]" value="{{$detail.bbfs_business_name}}" id="txtCustomerId2" onkeyup="requestCustomersaleInfo()" autocomplete="off"/>
 <br /><div id="divCustomersaleInfo" class="element"></div>
</th></tr>
      <tr><td>Comment:&nbsp;</td><th><input type="text" class="xxlrg" name="{{$TABLE}}[bbfs_comments]" value="{{$detail.bbfs_comments}}" id="be_seller_email"/></th><td></td><th></th></tr>
        <tr><th colspan="2"><div align="right"><input type="submit" name="subAddDetail" value="{{$button}}" class="sml"/></div></th><td></td><th></th></tr>
        </form>
      </table>

<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("detail");
    frmvalidator.EnableMsgsTogether();
    frmvalidator.addValidation("{{$TABLE}}[bbfs_business_name]","req", "Please specify Business Name.");
</script>
</body>