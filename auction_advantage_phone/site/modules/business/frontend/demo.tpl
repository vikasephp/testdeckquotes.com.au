<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>

<script type="text/javascript" src="{{$BASE_URL}}js/default.js"></script>

<script language="javascript" type="application/javascript">

/*Ajex Url*/
 var getcurrenturl = "{{$BASE_URL}}{{$XFA.common}}?a_req=";
/*Ajex Url*/


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
					return false;
					}
            }
          }
        }
		
		
		
		function setcurdate(a,b,c) {   
		 	var sId = b;
		    getdateurl2 = getcurrenturl + escape(a) + '&b=' + escape(sId)+ '&t_id=' + c;
			
			//alert(getdateurl2);
		
            http.open("GET", getdateurl2, true);
            http.onreadystatechange = handleHttpResponsesetcurdate;
            http.send(null);
			showTop();
			return false;
        }
	
	
		
	/*
			 function handleHttpResponselist() {   
				if (http.readyState == 4) {
					  if(http.status==200) {
						  var results=http.responseText;
			
					  if(results !='')
						{
						var new_array=results.split("||"); 
						var div_name = new_array[0];
			
						document.getElementById(div_name).style.visibility = 'visible';
						document.getElementById(div_name).innerHTML = new_array[1];
						closeTop();
						return false;}
					}
				  }
				}
				
				function requestbyerInfo(request, pagenum, divid) {   
				   var sId = document.getElementById("cust_id").value;
					curl2 = getcurrenturl + request + '&cust_id=' + escape(sId) + '&pagenum=' + pagenum +'&divid=' + divid;
					http.open("GET", curl2, true);
					http.onreadystatechange = handleHttpResponselist;
					http.send(null);
					showTop();
					return false;
				}
		
		*/
	
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
</head>
<body>
<form name="detail" method="post" action="{{$XFA.detail}}" enctype="multipart/form-data">
  <table cellpadding="0" cellspacing="0" border="1px">
    <tr>
      <td>Logged Date:&nbsp;</td>
      <th> <input type="text" name="{{$TABLE}}[bcust_misc_logged_date_date]" value="{{$detail.bcust_misc_logged_date_date}}" class="w16em dateformat-Y-ds-m-ds-d" id="demo1" readonly="readonly"/>
        &nbsp;
        <input type="text" name="{{$TABLE}}[bcust_misc_logged_date_time]" value="{{$detail.bcust_misc_logged_date_time}}" class="vvsml" id="t_id1" />
        &nbsp;<a href="javascript:setcurdate('curdate','demo1','t_id1');" title="System Date/Time"><img src="{{$BASE_URL}}images/clock.png" alt="system time" /></a> </th>
    </tr>
    <tr>
      <td>Sent Date:&nbsp;</td>
      <th> <input type="text" name="{{$TABLE}}[bcust_gendec_sent_date]" value="{{$detail.bcust_gendec_sent_date}}" class="w16em dateformat-Y-ds-m-ds-d" id="demo2" readonly="readonly"/>
        &nbsp;
        <input type="text" name="{{$TABLE}}[bcust_gendec_sent_time]" value="{{$detail.bcust_gendec_sent_time}}" class="vvsml" id="t_id2" />
        &nbsp;<a href="javascript:setcurdate('curdate','demo2','t_id2');" title="System Date/Time"><img src="{{$BASE_URL}}images/clock.png" alt="system date" /></a> </th>
    </tr>
    <tr>
      <td >Signed Date:&nbsp; </td>
      <th><input type="text" name="{{$TABLE}}[bcust_gendec_signed_date]" value="{{$detail.bcust_gendec_signed_date}}" class="w16em dateformat-Y-ds-m-ds-d" id="demo3" readonly="readonly"/>
        &nbsp;
        <input type="text" name="{{$TABLE}}[bcust_gendec_signed_time]" value="{{$detail.bcust_gendec_signed_time}}" class="vvsml" id="t_id3" />
        &nbsp;<a href="javascript:setcurdate('curdate','demo3','t_id3'); " title="System Date/Time"><img src="{{$BASE_URL}}images/clock.png" alt="system date" /></a> </th>
    </tr>
  </table>
</form>
</body>
</html>
