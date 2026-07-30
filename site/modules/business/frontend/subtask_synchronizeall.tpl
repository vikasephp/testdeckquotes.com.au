<script type="text/javascript" src="{{$BASE_URL}}js/default.js"></script>
{{if $close_win == 1}}    
<script type="text/javascript">
<!--hide
window.close();
//-->
</script>
 {{/if}}
 
 
 {{if $close_win == 2}}    
<script type="text/javascript">
<!--hide
setTimeout('window.close()', 1000);
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

   
<div style="background:#0FF;">

<h2> Testing </h2>

{{if $message }} {{$message}} {{/if}}
<!--<h3> Subtask is updating.... Please wait... Do not close the window </h3>-->
</div>