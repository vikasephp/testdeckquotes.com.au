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

	<script src="{{$BASE_URL}}ckeditor2/ckeditor.js"></script>
	<script src="{{$BASE_URL}}ckeditor2/samples/js/sample.js"></script>

	<script type="text/javascript">
           CKEDITOR.replace( 'editor1' );
           CKEDITOR.add  
        </script>

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
var urlsale = "{{$BASE_URL}}{{$XFA.cust_list}}?cust_name="; 
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
	parent.requestquestionInfo2(1);
   </script>
  
{{/if}}
   {{if $msg != 0}}  
   <script type="text/javascript">
	parent.toggleLayer('divaqsection','addqa');
	closeTop();
   </script>   
{{/if}}







</head>
<!--<body bgcolor="#FFFFFF" onClick = closediv();>-->

<body bgcolor="#FFFFFF">
<form name="detail" method="post" action="{{$XFA.businessqa_detail}}" enctype="multipart/form-data" onsubmit="showTop();">
<table width="97%" border="1" style="background-color:#FFFFFF;" id="none-table" style="height:800px;">
<tr><td width="150" height="20">&nbsp;</td><th>
<input type="hidden" name="{{$TABLE}}[bqa_id]" value="{{$detail.bqa_id}}" /> 
<input type="hidden" name="{{$TABLE}}[bqa_cust_id]" value="{{$detail.bqa_cust_id}}" id="dt_id" />   
<input type="hidden" name="{{$TABLE}}[bqa_bsn_id]" value="{{$detail.bqa_bsn_id|default:$bsn_id}}" />
</th></tr>
<tr>
<td>Customer Name:</td>
<th colspan="3"> {{$cname}}
<!--<input type="text" class="xxlrg" name="{{$TABLE}}[buse_cust_name]" value="{{$detail.bcust_fname}} {{$detail.bcust_lname}}" id="dt_name" onkeyup="requestcustomersInfo()" autocomplete="off" style="width:400px;"/><br />
--><input type="hidden" class="xxlrg" name="{{$TABLE}}[bqa_cust_id]" value="{{$cid}}" style="width:400px;"/>

<div id="divcustomersInfo" class="element"></div></th></tr>
<tr><td>Question:</td><th colspan="3"><input type="text" name="{{$TABLE}}[bqa_que]" value="{{$detail.bqa_que}}" size="98" /></th></tr>
<tr><td>Attachment For Enquries</td><th colspan="3" data-ques-attachment></th></tr>
<tr><td>Answer:</td><th colspan="3">
<textarea cols="60" rows="5" name="{{$TABLE}}[bqa_ans]" id="editor1" class="ckeditor">{{$detail.bqa_ans}}</textarea>
</th></tr>
<tr><td>Attachment For Answer</td><th colspan="3" data-ans-attachment></th></tr>
<tr><td>Business Stream </td> <th> <select name="{{$TABLE}}[bqa_business_stream]"> 
								      <option value="Convert" {{if $detail.bqa_business_stream eq 'Convert' }} selected="selected" {{/if}}> Convert</option>
                                      <option value="Preperation and Planning" {{if $detail.bqa_business_stream eq 'Preperation and Planning' }} selected="selected" {{/if}}>Preparation and Planning </option>
                                      <option value="Construction" {{if $detail.bqa_business_stream eq 'Construction' }} selected="selected" {{/if}}>Construction </option> 
                                      <option value="Complete" {{if $detail.bqa_business_stream eq 'Complete' }} selected="selected" {{/if}}>Complete </option>	
									</select>
  </th>
 <th>Who is appointed for this question </th> 
 <td> 
       <select name="{{$TABLE}}[bqa_who]" class="lrg" style="width:220px;">
            {{foreach from = $pos key="key" item="item" }}
            
            	 <option value="{{$item.p_id}}" {{if  $item.p_id eq $detail.bqa_who}} selected="selected" {{/if}}>{{$item.p_name}}</option>
            	<!--<option value="Administrators" {{if $detail.eml_owner == "Administrators"}} selected="selected" {{/if}}>Administrators</option>
				<option value="Users"     {{if $detail.eml_owner == "Users"}} selected="selected" {{/if}}>Users</option> 
                <option value="Employees" {{if $detail.eml_owner == "Employees"}} selected="selected" {{/if}}>Employees</option> 
                <option value="Customers" {{if $detail.eml_owner == "Customers"}} selected="selected" {{/if}}>Customers</option>-->
            {{/foreach}}    
      		    </select>
 </td>
<tr><td>Notes:</td><th colspan="3"><textarea cols="100" rows="5" name="{{$TABLE}}[bqa_notes]">{{$detail.bqa_notes}}</textarea></th></tr>
<tr><td>Source:</td><th colspan="3"><input type="text" name="{{$TABLE}}[bqa_source]" value="{{$detail.bqa_source}}" style="width:500px;" />  </th></tr>
<tr><td>Include In Auto Q/A report:</td><th><input type="checkbox" value="1" {{if $detail.bqa_status == 1}} checked="checked" {{/if}} name="{{$TABLE}}[bqa_status]"></th></tr>
<tr><td colspan="2"><input type="submit" name="add_QA" value="Save" ></td></tr>
</table>        
</form>
      	
 <script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("detail");
		frmvalidator.EnableMsgsTogether();
		// frmvalidator.addValidation("{{$TABLE}}[buse_cust_name]","req", "Please specify customer name.");
		//  frmvalidator.addValidation("{{$TABLE}}[bqa_cust_id]","req", "Please specify customer name.");
		  frmvalidator.addValidation("{{$TABLE}}[bqa_que]","req", "Please specify question."); 
</script>      
</body>