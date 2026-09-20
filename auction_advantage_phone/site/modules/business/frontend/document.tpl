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
	

	
	function setdactyevalue(cust_id, cust_name)
		{
		document.getElementById("dt_name").value = cust_name;
		document.getElementById("dt_id").value = cust_id;
		document.getElementById('divDoctypeInfo').style.visibility = 'hidden';
		}
		
function closediv()
		{
		document.getElementById('divDoctypeInfo').style.visibility = 'hidden';
		}		
		
   
	    var urlsale = "{{$BASE_URL}}{{$XFA.doctype_list}}?doc_name="; // The server-side script
	
	function handleHttdocResponse() {   
        if (http.readyState == 4) {
              if(http.status==200) {
                  var results=http.responseText;
				  document.getElementById('divDoctypeInfo').style.visibility = 'hidden';
			  if(results !='')
			  	{ document.getElementById('divDoctypeInfo').innerHTML = results;
				document.getElementById('divDoctypeInfo').style.visibility = 'visible';}
            }
          }
        }
       
        function requestDoctypeInfo() {     
            var sId = document.getElementById("dt_name").value;
            http.open("GET", urlsale + escape(sId), true);
            http.onreadystatechange = handleHttdocResponse;
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
	parent.requestbusdocsInfo(1);
   </script>   
{{/if}}
   {{if $msg != 0}}  
   <script type="text/javascript">
	parent.toggleLayer('dividocadd','adddoc');
   </script>   
{{/if}}
</head>
<!--<body bgcolor="#FFFFFF" onClick = closediv();>-->
<body bgcolor="#FFFFFF">
<table width="100%" id="none-table" style="background-color:#FFFFFF;">
<form name="detail" method="post" action="{{$XFA.document}}" enctype="multipart/form-data">
<tr><td colspan="10" height="30">&nbsp;</td></tr>
<tr><td>Document Type:</td><th>
<input type="hidden" name="{{$TABLE}}[bd_id]" value="{{$detail.bd_id}}" />  
<input type="hidden" name="{{$TABLE}}[bd_type]" value="{{$detail.bd_type}}" id="dt_id" />  
<input type="hidden" name="{{$TABLE}}[bd_bsi_id]" value="{{$bsn_id}}" />
<input type="text" class="lrg" name="{{$TABLE}}[bd_type_name]" value="{{$detail.bd_type_name}}" id="dt_name" onkeyup="requestDoctypeInfo()" autocomplete="off" />
 <br /><div id="divDoctypeInfo" class="element"></div></th></tr>
<tr><td valign="middle" width="200"> File Load:&nbsp;</td><th>
<input type="file" name="image"  />
</th></tr>
<tr><td>File Name:</td><th>{{$detail.bd_doc_name|default:"document must be saved before being displayed"}}</th></tr>
 <tr><td>Status:&nbsp;</td><th><select name="{{$TABLE}}[bd_status]">
 								<option value="1" {{if $detail.bd_status == 1}} selected="selected" {{/if}}>Completed</option>
                                <option value="2" {{if $detail.bd_status == 2}} selected="selected" {{/if}}>Outstanding</option>
                                <option value="3" {{if $detail.bd_status == 3}} selected="selected" {{/if}}>Uploaded</option>
                    		</select>
                    </th><td></td><th></th></tr>
      <tr><td>Comment:&nbsp;</td><th><input type="text" class="xxlrg" name="{{$TABLE}}[bd_comment]" value="{{$detail.bd_comment}}" id="bd_comment"/></th><td></td><th></th></tr>
        <tr><th colspan="2"><div align="right"><input type="submit" name="subAddDetail" value="{{$button}}" class="sml"/></div></th><td></td><th></th></tr>
        </form>
      </table>

<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("detail");
    frmvalidator.EnableMsgsTogether();
    frmvalidator.addValidation("image","req", "Please specify Document.");
</script>
</body>