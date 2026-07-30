<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tabview/tabcontent.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/tabview/tabcontent.js">  </script>

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/rangeslider/rangeSlider.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/rangeslider/rangeSlider.js"></script>


<!--Ajax Common function-->
<script type="text/javascript">
 
 
 	var geturl= "{{$BASE_URL}}position_matrix.doclist/pm_id/"; // The server-side script
	var getdelurl= "{{$BASE_URL}}position_matrix.docdelete/pm_id/"; // The server-side script
 
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
<h3 class="page-title">{{$title}}</h3>
   							
   
   {{if !$opr}}
   
 <form name="detail" method="post" action="{{$XFA.detail}}" enctype="multipart/form-data">
	<div style="width:100%;display:inline-block;">
		<div style="float:right; margin-right:10px; background: #09F; color:#FFF !important; padding:6px; margin-bottom:5px;"> 
			<a href="{{$BASE_URL}}position_matrix.add_mdc/pm_id/{{$detail.pm_id}}" class="various" title="Edit" style="color:#FFF; text-decoration:none; font-size:14px;">Add New Data</a>
		</div>
	</div>
	<input type="hidden" name="pm[pm_id]" value="{{$detail.pm_id}}" id="dh_id"/>
    <table id="list-table" width="90%" cellpadding="0" cellspacing="0" height="350" style="border:1px solid #CCC;">

		<tr>
			<th width="5%">Sr. No.</th>
			<th width="20%">Name</th>
			<th width="30%">Document</th>
			<th width="10%">Action</th>
		</tr>
		{{if $mdc}}
		{{assign var="loopcounter" value=0}}
		{{foreach from=$mdc key="key" item="item"}}
		<tr>
			{{assign var="loopcounter" value=$loopcounter+1}}
			<td>{{$loopcounter}}</td>
			<td>{{$item.pmmd_doc_name}}</td>
			<td>
				{{if $item.pmmd_master_document_link}}
				<a href="{{$item.pmmd_master_document_link}}" target="_blank">{{$item.pmmd_master_document_link}}</a>{{/if}}
			</td>
			<td>
				<a href="{{$BASE_URL}}position_matrix.add_mdc/pm_id/{{$detail.pm_id}}/pmmd_id/{{$item.pmmd_id}}" class="various" title="Edit"><img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png" /></a><a href="{{$BASE_URL}}position_matrix.delete_mdc/pm_id/{{$detail.pm_id}}/pmmd_id/{{$item.pmmd_id}}" onclick="javascript:if(!confirm('Are you sure want to delete this Document with Sr. No. {{$loopcounter}}?')) return false;" title="Delete"><img style="height:16px; width:16px;" src="{{$BASE_URL}}css/admin/images/deletecross.png"/></a>
			</td>
		</tr>
		{{/foreach}}
		{{else}}
		<tr>
			<td colspan="4" style="text-align: center;">No Content</td>
		</tr>
        {{/if}}
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
       // frmvalidator.addValidation("pm[pm_award]","req", "Please specify link.");
    </script>
{{/if}}