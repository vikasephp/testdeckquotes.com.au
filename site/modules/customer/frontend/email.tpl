<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/default.js"></script>
{{if $close_win == 1}}    
<script type="text/javascript">
parent.$.fancybox.close();
</script>
 {{/if}}
 <script type="text/javascript">
 
 function call_top()
 			{
			showTop();			
			}
 
var getfileslisturl = "{{$BASE_URL}}{{$XFA.email_attachment}}?a_req=list"; // The server-side script
		function handleHttpfilesResponselist() {   
			if (http.readyState == 4) {
				  if(http.status==200) {
					  var results=http.responseText;
					
				  document.getElementById('emailattachmnets_list').innerHTML = results;
				  closeTop();	
				  if(results !='')
					{document.getElementById('emailattachmnets_list').style.visibility = 'visible';
					}
				}
			  }
			}
		
		function requestattach_list() {   
	
				curl22 = getfileslisturl + "&random=" + Math.random();
		
				http.open("GET", curl22, true);
				http.onreadystatechange = handleHttpfilesResponselist;
				http.send(null);
				showTop();	
				
        }
	
var getfiledeleteurl = "{{$BASE_URL}}{{$XFA.email_attachment}}?a_req=del"; // The server-side script
		function handleHttpfilesResponsedel() {   
			if (http.readyState == 4) {
				  if(http.status==200) {
					  var results=http.responseText;
					
				  if(results !='')
					{
				  requestattach_list();
				  closeTop();
					}
				}
			  }
			}
		
		function requestattach_del(key) {   
	
				curl22 = getfiledeleteurl +"&key="+ key +"&random=" + Math.random();
		
				http.open("GET", curl22, true);
				http.onreadystatechange = handleHttpfilesResponsedel;
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
		var http = getHTTPObject(); //We create the HTTP Object
</SCRIPT>
<div>
 <h3 class="page-title">{{$title}}</h3>
 <table cellpadding="0" cellspacing="0" width="100%" border="0" id="product-table">
 {{if $sent_mail}}<tr><td width="80%"><div align="center" style="color:#006600; font-size:15px;">{{$sent_mail}} {{if $sents && $sents > 0}}({{$sents}}) Recipient{{/if}}</div></td></tr>{{/if}}
    <tr>
    <td width="100%" style="padding-left:10px;">
    <table width="100%" cellpadding="0" cellspacing="0" border="1">
    <tr><th width="10%"> Email Template:</th><td>
         <form name="template" action="" method="post" enctype="multipart/form-data">
        	<select name="temp_id" style="width:500px;">
            		<option value="0">no template</option>
                    {{foreach from=$email_template key='key' item='item'}}
                    	{{assign var="opgroup" value=$item.emt_name}}
                        {{if $opgroup !== $lastopgroup}}
                    <optgroup label="{{$opgroup}}" style="font-size:13px; color:#000000;"></optgroup>   
                    {{/if}} 
                    <option value="{{$item.et_id}}" {{if $temp_id == $item.et_id }} selected="selected" {{/if}}>&nbsp;&nbsp;{{$item.et_name}}</option>
                    
                    {{assign var="lastopgroup" value=$opgroup}}
                    
                    {{/foreach}}
            </select>
        <input type="submit" value="Load Template" name="load_temp"/>
         </form>
         <form name="send_email" action="" method="post">
        </td></tr>         
        <tr><th>From: </th><td>  
       <input type="hidden" name="send_email" value="send" />
       <input type="hidden" name="temp_id" value="{{$temp_id}}" id="temp_id" />
       <input type="text" name="from" style="width:300px;" value="{{$from}}" />
        </td></tr>
        <tr><th width="100">To: </th><td><input type="text" name="to" style="width:620px;" value="{{$to}}" /></td></tr>
         <tr><th>Subject: </th><td><input type="text" name="subject" style="width:620px;" value="{{$subject}}" /></td></tr>
           <tr>    
			<th >Template Variables:</th>
			<td><table width="85%">   <tr>
            			{{counter assign="count"}}
            			{{foreach from=$email_temp_vars item="item" key="key"}}
                     
            			<td width="33%"><b>{{$key}}</b> => <span style="color: #009900;"><input type="text" value="{{$item}}" readonly="readonly" /></span></td>
                        {{if $count % 3 == 0}}                      
                        </tr>
                             <tr>
                        {{/if}}
            		{{counter  assign="count"}}
           				 {{/foreach}}
                         </tr>
            </table></td>
	</tr>
          <tr><th>Message: </th><td>
          <table id="none-table22"><tr><td>{{tinymce InstanceName="email_body" class="email_body" Value=$body Cols="200"}}</td></tr></table>
          </td></tr> 
          <tr><th>Attachment: </th><td>  
          <div id="emailattachmnets_list">
           	{{if $attach_file}}   
          	<div style="float:left; width:100%; padding-right:20px;">
          	<ul> {{foreach from=$attach_file key="key" item="item"}} 
            	<li><img src="{{$BASE_URL}}images/email_attach.png" width="20">&nbsp;&nbsp;{{$item}}&nbsp;&nbsp;<a href="javascript:requestattach_del({{$key}});">Remove</a></li> 						                  {{/foreach}}
            </ul>
            </div>
            {{/if}}
          </div>
          <div id="emailattachment">
            <iframe name="mail_attachment" id="mail_attachment" src="{{$BASE_URL}}{{$XFA.email_attachment}}" width="100%" height="60" frameborder="0" scrolling="no" hspace=10 vspace=5 onload="javascript:closeTop();" style="overflow-x: hidden; overflow-y: scroll;"></iframe>
                </div>
		      </td>
            </tr> 
           <tr><td colspan="2"><div align="center"><input type="button" value="Send" onclick="document.send_email.submit();" />&nbsp; 
           <input type="button" value="Cancel" onclick="document.location.href='{{$XFA.email}}/opr/close'" /></div></td></tr>
        </table>
       </form>  
	</td>
  </tr>
</table>
</div>
<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("send_email");
    frmvalidator.EnableMsgsTogether();
    frmvalidator.addValidation("email_body","req", "Please specify Body");
</script>