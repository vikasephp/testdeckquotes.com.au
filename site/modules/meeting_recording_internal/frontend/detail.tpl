<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tabview/tabcontent.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/tabview/tabcontent.js">  </script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>


<!--Ajax Common function-->
<script type="text/javascript">
 
	    var geturl= "{{$BASE_URL}}meeting_recording_internal.doclist/mri_id/"; // The server-side script
		var getdelurl= "{{$BASE_URL}}meeting_recording_internal.docdelete/mri_id/"; // The server-side script
   		
	function show_wait()	
				{
				document.getElementById('doc_list').innerHTML= '<div id="loading_div"></div>';
				document.getElementById('loading_div').style.visibility = 'visible';
				
				
				}	
		function close_wait()	
				{
				document.getElementById('loading_div').style.visibility = 'hidden';
				
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
       
        function show_doclist() { 
			var dochubid = document.getElementById('dh_id').value;
			var docurl = geturl + dochubid+"/random/" + Math.random();
			http.open("GET", docurl, true);
            http.onreadystatechange = handleHttpAllBusinessResponse;
            http.send(null);
			show_wait();
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
       
        function delete_docfile(id,doc) { 
		if(!confirm('Are you sure want to delete.')) return ;
    		var docurl = getdelurl + id+"/doc/"+doc+"/random=" + Math.random();
			http.open("GET", docurl, true);
            http.onreadystatechange = handleHttpfileResponse;
            http.send(null);
			show_wait();	
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
</script>

{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);

</script>
{{/if}}



<div align="center">
<h3 class="page-title" style="margin-top:15px; margin-bottom:20px;">{{$title}}</h3>
   							
   
   {{if !$opr}}
   
 <form name="detail" method="post" action="{{$XFA.detail}}" enctype="multipart/form-data" id = "myform">
 <input type="hidden" name="mri[mri_id]" value="{{$detail.$ID}}" id="dh_id"/>
     <table id="viewdoc-table" width="100%" cellpadding="0" cellspacing="0">
     
        <tr>
            <th> Document Name:</th>
            <td> <input type="text" name="mri[mri_doc_name]" value="{{$detail.mri_doc_name}}" style="width:500px;"/></td>
        </tr>
        <tr>
            <th>Upload Audio Files:</th>
            <td> <!--<input type="file" name="docs_a" accept="audio/*,video/*" />-->
                 <input type="text" style="width:700px;" name="mri[mri_audio_link]" value="{{$detail.mri_audio_link}}" />
            </td>
        </tr> 
        
               <tr>
            <th>Upload Video Files:</th>
            <td> <!--<input type="file" name="docs_a" accept="audio/*,video/*" />-->
                 <input type="text" style="width:700px;" name="mri[mri_video_link]" value="{{$detail.mri_video_link}}" />
            </td>
        </tr> 
        
       <tr>
            <th>Upload Transcript File:</th>
            <td> <input type="file" name="docs_t"  />
        
            </td>
        </tr>
        
        <tr>
            <th>Category:</th>
            <td> <select name="mri[mri_category]"> 
            	 <option value="Designs" {{if $detail.mri_category eq 'Designs' }} selected="selected" {{/if}}>Designs</option>
                 <option value="Financials" {{if $detail.mri_category eq 'Financials' }} selected="selected" {{/if}}>Financials</option>
                 <option value="Inclusions" {{if $detail.mri_category eq 'Inclusions' }} selected="selected" {{/if}}>Inclusions</option>
                 <option value="Marketing" {{if $detail.mri_category eq 'Marketing' }} selected="selected" {{/if}}>Marketing</option>
                 <option value="Operations" {{if $detail.mri_category eq 'Operations' }} selected="selected" {{/if}}>Operations</option>
                 <option value="Sales" {{if $detail.mri_category eq 'Sales' }} selected="selected" {{/if}}>Sales</option>
                 <option value="Strategy" {{if $detail.mri_category eq 'Strategy' }} selected="selected" {{/if}}>Strategy</option>
                 <option value="Other" {{if $detail.mri_category eq 'Other' }} selected="selected" {{/if}}>Other</option>
            	 </select>	
            </td>
        </tr>
       
        <tr><th colspan="2"><div id="doc_list" style="height:auto; padding-bottom:10px; min-height:40px;"></div></th></tr>
        <tr>    <td colspan="2" style="text-align:center;">
                    <input type="submit" name="subAddDetail" value="Save" class="vsml" id="formButton" />
                    <input type="button" name="btnCancelDetail" value="Cancel" onclick="javascript:parent.$.fancybox.close();" class="vsml" />
    <div id="pageloader">
    <img src="https://www.deckquotes.com.au/images/loading.gif" alt="processing..." />
    </div>

                
        </td>
        </tr>
            
     </table>
                
  
                
      </form>
       
       
       
     {{else}}
     	<div style="font-size:24px; height:99px; padding-top:150px;">{{$opr}}</div> 
{{/if}}
</div>

<style>
       #pageloader
{
  background: rgba( 255, 255, 255, 0.8 );
  display: none;
  height: 100%;
 
  width: 100%;
  z-index: 9999999;
}

#pageloader img
{
  left: 50%;
  margin-left: -32px;
  margin-top: -32px;
  position: absolute;
  top: 75%;
}
       
       </style>
       
       <script type="application/javascript">
	       $('#formButton').on('click', function (e) {
               // alert('button clicked: submitting in 5 seconds')
               $('#pageloader').show();
    
        });
	</script>      
  
       




   {{if !$opr}}
<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("detail");
    frmvalidator.EnableMsgsTogether();
    frmvalidator.addValidation("mri[mri_doc_name]","req", "Please specify document name.");
</script>
{{/if}}