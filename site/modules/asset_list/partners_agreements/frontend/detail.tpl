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
 
 
 	var geturl= "{{$BASE_URL}}partners_agreements.doclist/pm_id/"; // The server-side script
	var getdelurl= "{{$BASE_URL}}partners_agreements.docdelete/pa_id/"; // The server-side script
 
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
 <input type="hidden" name="pa[pa_id]" value="{{$detail.$ID}}" id="dh_id"/>
     <table id="list-table" width="100%" cellpadding="0" cellspacing="0" height="500" style="border:1px solid #0FF; border-collapse:collapse;" >

        
        <tr>
            <th> Company Name:</th>
            <td colspan="2"> <input type="text" name="pa[pa_comp_name]" value="{{$detail.pa_comp_name}}" style="width:800px;"/> </td>
        </tr>
    
        <tr>
            <th> Trading Name:</th>
            <td colspan="2"> <input type="text" name="pa[pa_trading_name]" value="{{$detail.pa_trading_name}}" style="width:800px;"/> </td>
        </tr>
    
       
        <tr>
            <th> Agreement</th> 
            <td width="40%"> <input type="file" name="docs_1" /> &nbsp; &nbsp;  Signed date :
            <input type="text" name="pa[pa_agreement_date]" value="{{$detail.pa_agreement_date}}"  class="w16em dateformat-d-ds-m-ds-Y" id="demo1" maxlength="25" readonly="readonly"/>
             </td>  
             <td> {{if $detail.pa_agreement}} {{$detail.pa_agreement}} 1 &nbsp;<a href = "{{$BASE_URL}}partners_agreements.detail/pa_id/{{$detail.$ID}}/di_doc/pa_agreement" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img src="{{$BASE_URL}}images/delete-icon.png" /></a> {{/if}}  <br /> 
             
             </td>
            </tr>

 
        <tr>
            <th> Price List:</th>
            <td> <input type="file" name="docs_2" > &nbsp; &nbsp;  Signed date :
            <input type="text" name="pa[pa_price_list_date]" value="{{$detail.pa_price_list_date}}"  class="w16em dateformat-d-ds-m-ds-Y" id="demo2" maxlength="25" readonly="readonly"/> </td>
            
            <td> {{if $detail.pa_price_list}} {{$detail.pa_price_list}} &nbsp;<a href = "{{$BASE_URL}}partners_agreements.detail/pa_id/{{$detail.$ID}}/di_doc/pa_price_list" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img src="{{$BASE_URL}}images/delete-icon.png" /></a>  {{/if}}   </td>
	     </tr>  
 
        
       <tr>
            <th>Quality Assurance:</th>
            <td> <input type="file" name="docs_3" />  &nbsp; &nbsp;  Signed date :
            <input type="text" name="pa[pa_quality_assurance_date]" value="{{$detail.pa_quality_assurance_date}}"  class="w16em dateformat-d-ds-m-ds-Y" id="demo3" maxlength="25" readonly="readonly"/>
            </td>
            <td> {{if $detail.pa_quality_assurance}} {{$detail.pa_quality_assurance}} &nbsp;<a href = "{{$BASE_URL}}partners_agreements.detail/pa_id/{{$detail.$ID}}/di_doc/pa_quality_assurance" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img src="{{$BASE_URL}}images/delete-icon.png" /></a>  {{/if}}   </td> 
            </tr>
            

 
    
        
        
         <tr>
            <th rowspan="3">Licenses:</th>
            <td> <input type="file" name="docs_4_1" /> &nbsp; &nbsp;  Signed date :
            <input type="text" name="pa[pa_licences_1_date]" value="{{$detail.pa_licences_1_date}}"  class="w16em dateformat-d-ds-m-ds-Y" id="demo4" maxlength="25" readonly="readonly"/> </td>
            <td> {{if $detail.pa_licences_1}} {{$detail.pa_licences_1}} &nbsp;<a href = "{{$BASE_URL}}partners_agreements.detail/pa_id/{{$detail.$ID}}/di_doc/pa_licences_1" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img src="{{$BASE_URL}}images/delete-icon.png" /></a>  {{/if}}   </td> 
       
            
            <tr><td> <input type="file" name="docs_4_2" /> &nbsp; &nbsp;  Signed date :
            <input type="text" name="pa[pa_licences_2_date]" value="{{$detail.pa_licences_2_date}}"  class="w16em dateformat-d-ds-m-ds-Y" id="demo5" maxlength="25" readonly="readonly"/> </td>
                <td> {{if $detail.pa_licences_2}} {{$detail.pa_licences_2}} &nbsp;<a href = "{{$BASE_URL}}partners_agreements.detail/pa_id/{{$detail.$ID}}/di_doc/pa_licences_2" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img src="{{$BASE_URL}}images/delete-icon.png" /></a>  {{/if}}    </td>
             <tr><td><input type="file" name="docs_4_3" />&nbsp; &nbsp;  Signed date :
            <input type="text" name="pa[pa_licences_3_date]" value="{{$detail.pa_licences_3_date}}"  class="w16em dateformat-d-ds-m-ds-Y" id="demo6" maxlength="25" readonly="readonly"/> </td>
             <td>  {{if $detail.pa_licences_3}} {{$detail.pa_licences_3}} &nbsp;<a href = "{{$BASE_URL}}partners_agreements.detail/pa_id/{{$detail.$ID}}/di_doc/pa_licences_3" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img src="{{$BASE_URL}}images/delete-icon.png" /></a>  {{/if}}  
           
            </td>
 
        </tr>
        
  
         <tr>
            <th>Public Liability:</th>
            <td> <input type="file" name="docs_5" />  &nbsp; &nbsp;  Signed date :
            <input type="text" name="pa[pa_public_liability_date]" value="{{$detail.pa_public_liability_date}}"  class="w16em dateformat-d-ds-m-ds-Y" id="demo7" maxlength="25" readonly="readonly"/> </td>
            <td> {{if $detail.pa_public_liability}} {{$detail.pa_public_liability}} &nbsp;<a href = "{{$BASE_URL}}partners_agreements.detail/pa_id/{{$detail.$ID}}/di_doc/pa_public_liability" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img src="{{$BASE_URL}}images/delete-icon.png" /></a>  {{/if}}   </td> 
            </tr>
            
           <tr>
            <th>Workers Comp:</th>
            <td> <input type="file" name="docs_6" />  &nbsp; &nbsp;  Signed date :
          <input type="text" name="pa[pa_workers_group_date]" value="{{$detail.pa_workers_group_date}}"  class="w16em dateformat-d-ds-m-ds-Y" id="demo8" maxlength="25" readonly="readonly"/> </td>
            <td> {{if $detail.pa_workers_group}} {{$detail.pa_workers_group}} &nbsp;<a href = "{{$BASE_URL}}partners_agreements.detail/pa_id/{{$detail.$ID}}/di_doc/pa_workers_group" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img src="{{$BASE_URL}}images/delete-icon.png" /></a>  {{/if}}   </td> 
            </tr>       
  
  
        
      <!--  <tr><th colspan="2"><div id="doc_list" style="height:auto; padding-bottom:10px; min-height:40px;"></div></th></tr>-->
        
        <tr>    <td colspan="3" style="text-align:center;">
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
        frmvalidator.addValidation("pa[pa_comp_name]","req", "Please specify company name.");
		frmvalidator.addValidation("pa[pa_trading_name]","req", "Please specify trading name.");
    </script>
{{/if}}