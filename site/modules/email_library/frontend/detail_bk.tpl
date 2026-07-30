<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
{{include file=$tiny_editor}}
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tabview/tabcontent.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/tabview/tabcontent.js">  </script>

<!--Ajax Common function-->

<script type="text/javascript">

	    var geturl= "{{$BASE_URL}}email_library.doclist?dhd_dh_id="; // The server-side script
		var getdelurl= "{{$BASE_URL}}email_library.docdelete?dhd_id="; // The server-side script

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
			var docurl = geturl + dochubid+"&random=" + Math.random();	
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
       

        function delete_docfile(id) { 

		if(!confirm('Are you sure want to delete.')) return false;

    		var docurl = getdelurl + id+"&random=" + Math.random();	
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

<h3 class="page-title">{{$title}}</h3>

   {{if !$opr}}

<form name="detail" method="post" action="{{$XFA.detail}}" enctype="multipart/form-data">
<input type="hidden" name="email_library[bip_id]" value="{{$detail.$ID}}" id="bip_id"/>
    <table id="viewdoc-table" width="100%" cellpadding="0" cellspacing="0">

        <tr>
            <th>Email Code:</th>
            <td><input type="text" name="email_library[eml_code]" value="{{$detail.eml_code}}" style="width:200px;"/></td>
        </tr>

 		<tr>
            <th>Link Uid:</th>
            <td><input type="text" name="email_library[eml_link_uid]" value="{{$detail.eml_link_uid}}" style="width:300px;"/></td>
        </tr>
        
         <tr>
            <th>Email content:</th>
            <td><textarea rows="8" cols="40" id="editor1" name="email_library[eml_email_content]" class="tinymce">{{$detail.dh_summery}}</textarea>
            </td>
        </tr>

		<tr>
            <th> Business Stream:</th>
            <td><input type="text" name="email_library[eml_business_stream]" value="{{$detail.eml_business_stream}}" style="width:300px;"/></td>
        </tr>


		<tr>
            <th>Internal or Ext. Email:</th>
            <td><select name="email_library[eml_ie_email]" class="lrg" style="width:220px;">
            	<option value="1" {{if $detail.eml_ie_email == 1}} selected="selected" {{/if}}>Internal</option>
				<option value="2" {{if $detail.eml_ie_email == 2}} selected="selected" {{/if}}>External</option>    	    
  			    </select>
            
            </td>
        </tr>
        
        	<tr>
            <th>Attachments:</th>
            <td><input type="file" name="docs" /></td>
        </tr>


       	<tr>
            <th>DID:</th>
            <td><input type="text" name="email_library[eml_did]" value="{{$detail.eml_did}}" style="width:300px;"/></td>
        </tr>
        
         	<tr>
            <th>Last Changed:</th>
            <td><input type="text" name="email_library[eml_last_change]" value="{{$detail.eml_last_change}}" style="width:300px;"/></td>
        </tr>
        
       	<tr>
            <th>Singnature:</th>
            <td><input type="text" name="email_library[eml_signarure_block]" value="{{$detail.eml_signarure_block}}" style="width:300px;"/></td>
        </tr>
        
       	<tr>
            <th>Owner:</th>
            <td><input type="text" name="email_library[eml_last_change]" value="{{$detail.eml_last_change}}" style="width:300px;"/></td>
        </tr>
        
<!--        <tr>
            <th>Word File Upload :</th>
            <td> <input type="file" name="wfile" /></td>
        </tr> 
        -->
        <tr><th colspan="2"><div id="doc_list" style="height:auto; padding-bottom:10px; min-height:40px;"></div></th></tr>

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
	frmvalidator.addValidation("email_library[bip_business]","req", "Please specify business.");
	frmvalidator.addValidation("email_library[bip_industry]","req", "Please specify industry.");
</script>

{{/if}}