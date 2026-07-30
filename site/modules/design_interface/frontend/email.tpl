<script type="text/javascript" src="{{$BASE_URL}}js/default.js"></script>

{{if $close_win == 1}}    

	<script type="text/javascript">
    <!--hide
    window.close();
    //-->
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


<!-- Begin Ajax comman XMLHttpRequest -->				

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

<!-- End Ajax comman XMLHttpRequest -->	

</SCRIPT>

<div>

 <h3 class="page-title">{{$title}}</h3>

 <table cellpadding="0" cellspacing="0" width="100%" border="0" id="product-table">

 {{if $sent_mail}}<tr><td width="80%"><div align="center" style="color:#006600; font-size:15px;">{{$sent_mail}}</div></td></tr>{{/if}}

    <tr>

    <td width="100%" style="padding-left:70px;">

    <table width="80%" cellpadding="0" cellspacing="0">

        <form name="send_email" action="{{$BASE_URL}}design_interface.email" method="post">

			<input type="hidden" name="send_email" value="send" />

            <input type="hidden" name="temp_id" value="{{$temp_id}}" id="temp_id" />

        <tr><th>To: </th><td><input type="text" name="to" style="width:300px;" value="{{$to}}" /></td></tr>

        <tr><th>Subject: </th><td><input type="text" name="subject" style="width:620px;" value="{{$subject}}" /></td></tr>

        <tr><th>Message: </th><td>
          
        <table id="none-table22">
          <tr><td>{{tinymce InstanceName="email_body" class="email_body" Value=$body Cols="20" }}</td></tr>
        </table>
         
        </td></tr> 

       </form>  

       <tr><th>Attachment: </th>
       <td>

          <div id="emailattachmnets_list">

           	{{if $attach_file}}   

          	<div style="float:left; width:100%; padding-right:20px;">

          	<ul>
            	  {{foreach from=$attach_file key="key" item="item"}} 

                    <li><img src="{{$BASE_URL}}images/email_attach.png" width="20">&nbsp;&nbsp;
                          {{$item}}&nbsp;&nbsp;<a href="javascript:requestattach_del({{$key}});">Remove</a>
                    </li> 						                 
                 {{/foreach}}

            </ul>

            </div>

            {{/if}}

          </div>

          <div id="emailattachment">

            <iframe name="mail_attachment" id="mail_attachment" src="{{$BASE_URL}}{{$XFA.email_attachment}}" width="100%" height="60" frameborder="0" scrolling="no" hspace=10 vspace=5 onload="javascript:closeTop();" style="overflow-x: hidden; overflow-y: scroll;"></iframe>
         </div>

         </td>

            </tr> 



           <tr><td colspan="2"><input type="button" value="Send" onclick="document.send_email.submit();" />&nbsp; 

           <input type="button" value="Cancel" onclick="document.location.href='{{$XFA.email}}/opr/close'" /></td></tr>

        </table>

	</td>

  </tr>

</table>

</div>

<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("send_email");
    frmvalidator.EnableMsgsTogether();
    frmvalidator.addValidation("email_body","req", "Please specify Body");
</script>