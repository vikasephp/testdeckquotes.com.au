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
 <input type="hidden" name="air[ab_id]" value="{{$detail.$ID}}" id="dh_id"/>
     <table id="list-table" width="100%" cellpadding="0" cellspacing="0" height="500" style="border:1px solid #0FF; border-collapse:collapse;" >

        
        <tr>
            <th> Property Address:</th>
            <td colspan="2"> <input type="text" name="air[ab_property_address]" value="{{$detail.ab_property_address}}" style="width:800px;"/> </td>
        </tr>
       
        <tr>
            <th rowspan ="3"> Agreement with client</th> 
            <td width="25%"> <input type="file" name="docs_11" /> </td> 
             <td> {{if $detail.ab_aggr_with_client_1}} {{$detail.ab_aggr_with_client_1}} 1 &nbsp;<a href = "{{$BASE_URL}}air_bb_database.detail/ab_id/{{$detail.$ID}}/di_doc/ab_aggr_with_client_1" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img src="{{$BASE_URL}}images/delete-icon.png" /></a> {{/if}}  <br /> </td>
            </tr>
            <tr> <td>     <input type="file" name="docs_12" /> </td> 
                 <td>  {{if $detail.ab_aggr_with_client_2}} {{$detail.ab_aggr_with_client_2}} 2 &nbsp;<a href = "{{$BASE_URL}}air_bb_database.detail/ab_id/{{$detail.$ID}}/di_doc/ab_aggr_with_client_2" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img src="{{$BASE_URL}}images/delete-icon.png" /></a> {{/if}}  <br /></td> 
            </tr>
            <tr> <td>    <input type="file" name="docs_13" /> </td> 
                 <td>  {{if $detail.ab_aggr_with_client_3}} {{$detail.ab_aggr_with_client_3}}  3&nbsp;<a href = "{{$BASE_URL}}air_bb_database.detail/ab_id/{{$detail.$ID}}/di_doc/ab_aggr_with_client_3" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img src="{{$BASE_URL}}images/delete-icon.png" /></a> {{/if}}</td>         
           </tr>
 
        <tr>
            <th rowspan="3"> Business Case:</th>
            <td> <input type="file" name="docs_21" >  </td>
            <td> {{if $detail.ab_business_case_1}} {{$detail.ab_business_case_1}} &nbsp;<a href = "{{$BASE_URL}}air_bb_database.detail/ab_id/{{$detail.$ID}}/di_doc/ab_business_case_1" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img src="{{$BASE_URL}}images/delete-icon.png" /></a>  {{/if}}   </td>
	     </tr>  
            <tr> <td>   <input type="file" name="docs_22" > </td>
                 <td> {{if $detail.ab_business_case_2}} {{$detail.ab_business_case_2}} &nbsp;<a href = "{{$BASE_URL}}air_bb_database.detail/ab_id/{{$detail.$ID}}/di_doc/ab_business_case_2" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img src="{{$BASE_URL}}images/delete-icon.png" /></a>  {{/if}}  </td>   
    	    <tr><td>    <input type="file" name="docs_23" > </td>
             <td> {{if $detail.ab_business_case_3}} {{$detail.ab_business_case_3}} &nbsp;<a href = "{{$BASE_URL}}air_bb_database.detail/ab_id/{{$detail.$ID}}/di_doc/ab_business_case_3" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img src="{{$BASE_URL}}images/delete-icon.png" /></a> {{/if}} </td>
          </tr>
             
             

        
       <tr>
            <th rowspan="3"> P&L Statements:</th>
            <td> <input type="file" name="docs_31" /> </td>
            <td> {{if $detail.ab_pl_statement_1}} {{$detail.ab_pl_statement_1}} &nbsp;<a href = "{{$BASE_URL}}air_bb_database.detail/ab_id/{{$detail.$ID}}/di_doc/ab_pl_statement_1" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img src="{{$BASE_URL}}images/delete-icon.png" /></a>  {{/if}}   </td> 
            </tr>
            <tr><td> <input type="file" name="docs_32" />  </td>
                <td> {{if $detail.ab_pl_statement_2}} {{$detail.ab_pl_statement_2}} &nbsp;<a href = "{{$BASE_URL}}air_bb_database.detail/ab_id/{{$detail.$ID}}/di_doc/ab_pl_statement_2" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img src="{{$BASE_URL}}images/delete-icon.png" /></a>  {{/if}}    </td>
             <tr><td><input type="file" name="docs_33" /> </td>
             <td>  {{if $detail.ab_pl_statement_3}} {{$detail.ab_pl_statement_3}} &nbsp;<a href = "{{$BASE_URL}}air_bb_database.detail/ab_id/{{$detail.$ID}}/di_doc/ab_pl_statement_3" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img src="{{$BASE_URL}}images/delete-icon.png" /></a>  {{/if}}  
           
            </td>
 
        <tr>
        <th>Weekly Rent</th>
        <td><input type="text" name="air[ab_weekly_rent]" value="{{$detail.ab_weekly_rent}}" /></td>
         <td> </td>
        </tr>
 
 	 <tr>
        <th>Lease Expiry</th>
        <td> <input type="text" name="air[ab_lease_expiry]" value="{{$detail.ab_lease_expiry}}" /></td>
         <td> </td>
        </tr>
 
 
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
        frmvalidator.addValidation("air[ab_property_address]","req", "Please specify property address.");
    </script>
{{/if}}