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
	parent.requestbusfilesInfo(1);
   </script>   
{{/if}}
   {{if $msg != 0}}  
   <script type="text/javascript">
	parent.toggleLayer('divimageadd','addfile');
   </script>   
{{/if}}
</head>
<!--<body bgcolor="#FFFFFF" onClick = closediv();>-->
<body bgcolor="#FFFFFF">
<table width="100%" id="none-table" style="background-color:#FFFFFF;">
<form name="detail" method="post" action="{{$XFA.upload}}" enctype="multipart/form-data">
<tr><td colspan="10" height="30">&nbsp;</td></tr>
  <tr><td valign="middle" width="200"> File Load:&nbsp;</td> <th>
<input type="hidden" name="{{$TABLE}}[bf_id]" value="{{$detail.bf_id}}" />  
<input type="hidden" name="{{$TABLE}}[bf_bsn_id]" value="{{$bsn_id}}" />
<input type="file" name="image"  />{{if $detail.bf_name}}<img src="{{$BASE_URL}}files/business_files/{{$detail.bf_name}}" width="50" alt="{{$item.bf_name}}" />{{/if}}
</th></tr>
 <tr><td>Role:&nbsp;</td><th><select name="{{$TABLE}}[bf_role]">
 								<option value="1" {{if $detail.bf_role == 1}} selected="selected" {{/if}}>Main Image</option>
                                <option value="2" {{if $detail.bf_role == 2}} selected="selected" {{/if}}>Other Image</option>
                    		</select>
                    </th><td></td><th></th></tr>
      <tr><td>Comment:&nbsp;</td><th><input type="text" class="xxlrg" name="{{$TABLE}}[bf_comments]" value="{{$detail.bf_comments}}" id="bf_comments"/></th><td></td><th></th></tr>
        <tr><th colspan="2"><div align="right"><input type="submit" name="subAddDetail" value="{{$button}}" class="sml"/></div></th><td></td><th></th></tr>
        </form>
      </table>

<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("detail");
    frmvalidator.EnableMsgsTogether();
    frmvalidator.addValidation("image","req", "Please specify Image.");
</script>
</body>