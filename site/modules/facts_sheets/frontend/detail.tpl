<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>


 <script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
 
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tabview/tabcontent.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/tabview/tabcontent.js">  </script>

	<script src="{{$BASE_URL}}ckeditor2/ckeditor.js"></script>
	<script src="{{$BASE_URL}}ckeditor2/samples/js/sample.js"></script>

	<script type="text/javascript">
           CKEDITOR.replace( 'editor1' );
           CKEDITOR.add  
        </script>

<!--Ajax Common function-->
<script type="text/javascript">
 
	    var geturl= "{{$BASE_URL}}recruitment_list.doclist/mid/"; // The server-side script
		var getdelurl= "{{$BASE_URL}}recruitment_list.docdelete/mid/"; // The server-side script
   		
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
<h3 class="page-title">{{$title}}</h3><br /><br />
   							
   
   {{if !$opr}}
   
 <form name="detail" method="post" action="{{$XFA.detail}}" enctype="multipart/form-data">
 <input type="hidden" name="fs[doc_id]" value="{{$detail.doc_id}}" id="dh_id"/>
 
     <table id="viewdoc-table" width="100%" cellpadding="0" cellspacing="0">
     
        <tr>
            <th colspan="1">Document Name:</th>
            <td colspan="3"> <input type="text" name="fs[doc_name]" value="{{$detail.doc_name}}" style="width:500px;"/></td>
        </tr>
        
 
	<tr>
                <th>Document Content:</th>
                <td >
                <textarea cols="1000" rows="30" name="fs[doc_content]" id="editor1" class="ckeditor" style="height:670px;">{{$detail.doc_content|stripslashes}}</textarea>    
                 </td>
            </tr>
	
        
          <tr>
            <th>Document Image:</th>
            <td> <input type="file" name="docs_img" />
            {{if $detail.doc_image}} <img src="{{$BASE_URL}}files/fact_sheets_doc/{{$detail.doc_image}}"  height="70" />
            <a href="{{$BASE_URL}}facts_sheets.detail/doc_id/{{$detail.$ID}}/docid/{{$detail.$ID}}" onclick="javascript:if(!confirm('Are you sure want to delete the image?')) return false;" title="Delete">
        <img style="height: 16px;; width:16px" src="{{$BASE_URL}}css/admin/images/deletecross.png"/></a>
            {{/if}}
            </td>
            </tr> 
        <tr>
            <th colspan="1">Position Responsible:</th>
            <td colspan="3"> <input type="text" name="fs[doc_pos_res]" value="{{$detail.doc_pos_res}}" style="width:500px;"/></td>
        </tr>
      
       <tr>
            <th colspan="1">Date Audit:</th>
            <td colspan="3"> <input type="text" name="fs[doc_audit_date]" value="{{$detail.doc_audit_date}}" class="w16em dateformat-d-ds-m-ds-Y" id="demo1"/></td>
        </tr>
      
        
        <tr>
                <td colspan="2" style="text-align:center;">
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
    frmvalidator.addValidation("street_sign[ss_address]","req", "Please specify address.");
</script>
{{/if}}

<script>
	initSample();
</script>