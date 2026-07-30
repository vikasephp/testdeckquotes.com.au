<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tabview/tabcontent.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/tabview/tabcontent.js">  </script>

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/rangeslider/rangeSlider.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/rangeslider/rangeSlider.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>

	<script src="{{$BASE_URL}}ckeditor/ckeditor.js"></script>
	<script src="{{$BASE_URL}}ckeditor/samples/js/sample.js"></script>
	<link rel="stylesheet" href="{{$BASE_URL}}ckeditor/samples/css/samples.css">
	<link rel="stylesheet" href="{{$BASE_URL}}ckeditor/samples/toolbarconfigurator/lib/codemirror/neo.css">
    


<!--Ajax Common function-->
<script type="text/javascript">
 
	    var geturl= "{{$BASE_URL}}poincc.doclist/po_id/"; // The server-side script
		var getdelurl= "{{$BASE_URL}}poincc.docdelete/po_id/"; // The server-side script
   		
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
<h3 class="page-title">View Feedback</h3><br />
<form name="detail" method="post" action="{{$XFA.alert}}" enctype="multipart/form-data" id="test">

 							
   
   {{if !$opr}}
            
<table id="viewdoc-table" width="100%" cellpadding="0" cellspacing="0" style="border:1px solid #999;border-collapse:collapse;"">
 <tr>
   <td style="width:10%;">Date </td>
   <td style="width:10%;">Source </td>
   <td style="width:10%;">Type </td>
   <td style="width:10%;">Person </td>
   <td style="width:70%;">Notes </td>
   
 </tr>  
{{foreach from=$detail key="key" item="item"}}
   <tr>
    <td> {{$item.sf_date}}</td>
    <td> {{$item.sfo_name}}</td>
    <td> {{$item.tfo_name}}</td>
    <td> {{$item.user_name}}</td>
    <td> {{$item.sf_notes}}</td>
   </tr>
 {{/foreach }}
   
       </table>  
  
                    <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:parent.$.fancybox.close();" class="vsml" />
  

      
     {{else}}
     	<div style="font-size:24px; height:99px; padding-top:150px;">{{$opr}}</div> 
{{/if}}


  </form>


<script type="text/javascript" language="javascript" >
function show1(val) 
{
	//alert(val);
	if(val==1)
	 {
		 $('#one').show();
	 } else if(val==0) {
		 $('#one').hide();
	 }
}

function show2(val) 
{
	//alert(val);
	if(val==1)
	 {
		 $('#two').show();
	 } else if(val==0) {
		 $('#two').hide();
	 }
}

function show3(val) 
{
	//alert(val);
	if(val==1)
	 {
		 $('#three').show();
	 } else if(val==0) {
		 $('#three').hide();
	 }
}
</script>


</div>
   {{if !$opr}}
<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("detail");
    frmvalidator.EnableMsgsTogether();
    frmvalidator.addValidation("poincc[po_invoice_number]","req", "Please enter invoice number.");
</script>
{{/if}}

<script>
	initSample();
</script>