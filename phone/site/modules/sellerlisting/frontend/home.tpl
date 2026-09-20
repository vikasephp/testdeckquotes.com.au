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
		document.getElementById("txtCustId").value = cust_name;
		document.getElementById("txtcustIds").value = cust_id;
		document.getElementById('divCustomersInfo').style.visibility = 'hidden';
		}
		
function closediv()
		{
		document.getElementById('divCustomersInfo').style.visibility = 'hidden';
		}		
		
		   
	    var urlsale = "{{$BASE_URL}}{{$XFA.cust_list}}?cust_name="; // The server-side script
	
	function handleHttpcustResponse() {   
        if (http.readyState == 4) {
              if(http.status==200) {
                  var results=http.responseText;
				  document.getElementById('divCustomersInfo').innerHTML = results;
			  if(results !='')
			  	{document.getElementById('divCustomersInfo').style.visibility = 'visible';}
            }
          }
        }
       
        function requestCustomerInfo() {     
            var sId = document.getElementById("txtCustId").value;
            http.open("GET", urlsale + escape(sId), true);
            http.onreadystatechange = handleHttpcustResponse;
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

   {{if $msg != 0}}  
   <script type="text/javascript">
	parent.requestsellerInfo(1);
   </script>   
	{{/if}}
    
   {{if $msg != 0}}  
   <script type="text/javascript">
	parent.toggleLayer('businesscistenquiry','addcust');
   </script>   
{{/if}}
</head>
<!--<body bgcolor="#FFFFFF" onClick = closediv();>-->
<body bgcolor="#FFFFFF">
<table width="100%" id="none-table" style="background-color:#FFFFFF;">
<form name="detail" method="post" action="{{$XFA.home}}" enctype="multipart/form-data">
  <tr><td valign="middle" width="200"> Seller Name:&nbsp;</td> <th>
<input type="hidden" name="{{$TABLE}}[bs_id]" value="{{$detail.bs_id}}" />  
<input type="hidden" name="{{$TABLE}}[bs_customers_id]" value="{{$bs_customers_id}}" id="txtcustIds"/>
<input type="hidden" name="{{$TABLE}}[bs_business_id]" value="{{$bsn_id}}" />
<input type="text" class="xxlrg" style="width:504px;" name="{{$TABLE}}[bs_customers_name]" value="{{$detail.bs_customers_name}}" id="txtCustId" onkeyup="requestCustomerInfo()" autocomplete="off"/>
 <br /><div id="divCustomersInfo" class="element"></div>
</th></tr>
      <tr><td>Comment:&nbsp;</td><th>
      <textarea cols="95" rows="4" name="{{$TABLE}}[bs_comments]">{{$detail.bs_comments}}</textarea>
     </th><td></td><th></th></tr>
        <tr><th colspan="2"><div align="right"><input type="submit" name="subAddDetail" value="{{$button}}" class="sml"/></div></th><td></td><th></th></tr>
        </form>
      </table>

<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("detail");
    frmvalidator.EnableMsgsTogether();
    frmvalidator.addValidation("{{$TABLE}}[bs_customers_name]","req", "Please specify Customer Name.");
</script>
</body>