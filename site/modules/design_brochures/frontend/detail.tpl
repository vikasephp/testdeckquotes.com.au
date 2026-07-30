<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tabview/tabcontent.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/tabview/tabcontent.js">  </script>

<!--Ajax Common function-->
<script type="text/javascript">
 
	    var geturl= "{{$BASE_URL}}design_brochures.doclist?dhd_dh_id="; // The server-side script
		var getdelurl= "{{$BASE_URL}}design_brochures.docdelete?dhd_id="; // The server-side script
   		
		var geturl2= "{{$BASE_URL}}design_brochures.doclist2?dhd_dh_id="; // The server-side script
		var getdelurl2= "{{$BASE_URL}}design_brochures.docdelete2?dhd_id="; // The server-side script
		
	function show_wait()	
				{
				document.getElementById('doc_list').innerHTML= '<div id="loading_div"></div>';
				document.getElementById('loading_div').style.visibility = 'visible';
				}
				
	
	function show_wait2()	
				{
				document.getElementById('doc_list2').innerHTML= '<div id="loading_div2"></div>';
				document.getElementById('loading_div2').style.visibility = 'visible';
				}
					
	function close_wait()	
				{
				document.getElementById('loading_div').style.visibility = 'hidden';
				}	
				
		function close_wait2()	
				{
				document.getElementById('loading_div2').style.visibility = 'hidden';
				}			
						
	function handleHttpAllBusinessResponse() {   
        if (http.readyState == 4) {
              if(http.status == 200) {
                  var results=http.responseText;    			  
			  if(results !='')
			  	{document.getElementById('doc_list').style.visibility = 'visible';
				 document.getElementById('doc_list').innerHTML = results;
				 close_wait();
				}
            }
          }
        }
       
	   
	   function handleHttpAllBusinessResponse2() {   
        if (http.readyState == 4) {
              if(http.status == 200) {
                  var results=http.responseText;    			  
			  if(results !='')
			  	{document.getElementById('doc_list2').style.visibility = 'visible';
				 document.getElementById('doc_list2').innerHTML = results;
				 close_wait2();
				}
            }
          }
        }
	   
	   
	   
        function show_doclist() { 
			var dochubid = document.getElementById('dh_id').value;
			//alert(dochubid);
			var docurl = geturl + dochubid+"&random=" + Math.random();	
			http.open("GET", docurl, true);
            http.onreadystatechange = handleHttpAllBusinessResponse;
            http.send(null);
			show_wait();
			
        }

		function show_doclist2() { 
			var dochubid = document.getElementById('dh_id2').value;
			//alert(dochubid);
			var docurl = geturl2 + dochubid+"&random=" + Math.random();	
			http.open("GET", docurl, true);
            http.onreadystatechange = handleHttpAllBusinessResponse2;
            http.send(null);
			show_wait2();
			
        }


function handleHttpfileResponse() {   
        if (http.readyState == 4) {
              if(http.status == 200) {
                  var results=http.responseText;    			  
			  if(results !='')
			  	{
					show_doclist();
					close_wait();	
				}
            }
          }
        }
       
 
 function handleHttpfileResponse2() {   
        if (http.readyState == 4) {
              if(http.status == 200) {
                  var results=http.responseText;    			  
			  if(results !='')
			  	{
					show_doclist2();
					close_wait2();	
				}
            }
          }
        }
 
   function delete_docfile(id) { 
		if(!confirm('Are you sure want to delete.')) return false;
    		var docurl = getdelurl + id+"&random=" + Math.random();	
			http.open("GET", docurl, true);
            http.onreadystatechange = handleHttpfileResponse;
            http.send(null);
			show_wait();	
        }


function delete_docfile2(id) { 
		if(!confirm('Are you sure want to delete.')) return false;
    		var docurl = getdelurl + id+"&random=" + Math.random();	
			http.open("GET", docurl, true);
            http.onreadystatechange = handleHttpfileResponse2;
            http.send(null);
			show_wait2();	
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
			var http = getHTTPObject(); 
// We create the HTTP Object

{{if $detail.$ID}}
setTimeout('show_doclist();', 500);

{{/if}}

{{if $detail.$ID}}
setTimeout('show_doclist2();', 700);

{{/if}}
</script>

{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);

</script>
{{/if}}

<div align="center">
<h3 class="page-title">{{$title}}</h3>
   							
   
   {{if !$opr}}
   
 <form name="detail" method="post" action="{{$XFA.detail}}" enctype="multipart/form-data">
 <input type="hidden" name="bm_listing[dh_id]" value="{{$detail.$ID}}" id="dh_id"/>
 <input type="hidden" name="bm_listing2[dh_id]" value="{{$detail.$ID}}" id="dh_id2"/>
     <table id="viewdoc-table" width="100%" cellpadding="0" cellspacing="0">
     
        <tr>
            <th > Name:</th>
            <td colspan="2"> <input type="text" name="bm_listing[dh_title]" value="{{$detail.dh_title}}" style="width:300px;"/></td>
        </tr>
        <tr>
            <th> Summary :</th>
            <td colspan="2"><textarea rows="8" cols="60" name="bm_listing[dh_summery]">{{$detail.dh_summery}}</textarea> </td>
        </tr>   
         <tr>
            <th>  Business Stream:</th>
            <td  colspan="2"> <input type="text" name="bm_listing[dh_bus_streem]" value="{{$detail.dh_bus_streem}}" size="35" /></td>
        </tr>
        
        
        <tr>
            <th > Access:</th>
            <td colspan="2"> <select name="bm_listing[dh_access]" class="lrg" style="width:220px;">
            	<option value="1" {{if $detail.dh_access == 1}} selected="selected" {{/if}}> All Users</option>
          		<option value="2" {{if $detail.dh_access == 2}} selected="selected" {{/if}}> Users</option>    	    
  				 </select>
            </td>
        </tr>
        <tr>
            <th>Upload Brochures :</th>
            <td style="width:25%"> <input type="file" name="docs" /></td>
            <td ><div id="doc_list" style="height:auto; padding-bottom:10px; min-height:40px;"></div>
            </td>
        </tr> 
        
        <tr>
            <th>Upload flyer :</th>
            <td> <input type="file" name="docs2" /></td>
            <td><div id="doc_list2" style="height:auto; padding-bottom:10px; min-height:40px;"></div>
        </tr> 
        
        <!--<tr><th colspan="2"><div id="doc_list" style="height:auto; padding-bottom:10px; min-height:40px;"></div></th></tr>-->
        <tr>    <td colspan="2" style="text-align:center;">
                    <input type="submit" name="subAddDetail" value="Save" class="vsml" />
                    <input type="button" name="btnCancelDetail" value="Cancel" onclick="javascript:parent.$.fancybox.close();" class="vsml" />
                </td>
            </tr>
           
            
		</table>
      </form>
      
      
      
      
     {{else}}
     	<div style="font-size:24px; height:99px; padding-top:150px;">{{$opr}}</div> 
{{/if}}
</div>
   {{if !$opr}}
<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("detail");
    frmvalidator.EnableMsgsTogether();
    frmvalidator.addValidation("bm_listing[dh_title]","req", "Please specify title.");
</script>
{{/if}}