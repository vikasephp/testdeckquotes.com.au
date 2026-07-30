<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tabview/tabcontent.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/tabview/tabcontent.js">  </script>


<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>

<!--Ajax Common function-->
<script type="text/javascript">
 
	    var geturl= "{{$BASE_URL}}poincc2.doclist/po_id/"; // The server-side script
		var getdelurl= "{{$BASE_URL}}poincc2.docdelete/po_id/"; // The server-side script
   		
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
<h3 class="page-title">{{$title}}</h3><br />
<form name="detail" method="post" action="{{$XFA.detail}}" enctype="multipart/form-data" id="test">

 {{if !$duplicate}} 							
   
   {{if !$opr}}
   
 
 <input type="hidden" name="poincc[po_id]" value="{{$detail.$ID}}" id="dh_id"/>
     <table id="viewdoc-table" width="80%" cellpadding="0" cellspacing="0" >
     
      <tr>
                <th>Select Type</th>
                <td>
                    <select name="poincc[po_type]" style="width:300px;"/>
                   	 
                     <option value="Invoice" {{if  $detail.po_type == 'Invoice'}}selected{{/if}}>Invoice</option>
                     <option value="Receipt" {{if  $detail.po_type  == 'Receipt'}}selected{{/if}}>Receipt</option>
                     <option value="Other" {{if $detail.po_type  == 'Other'}}selected{{/if}}>Other</option>
                     <option value="Statement" {{if  $detail.po_type  == 'Statement'}}selected{{/if}}>Statement</option>
                     <option value="Credit" {{if  $detail.po_type  == 'Credit'}}selected{{/if}}>Credit</option>
                    </select>    
                </td>
           <th>My OBID:</th>
            <td> <input type="text" name="poincc[po_myobid]" value="{{$detail.po_myobid}}" style="width:300px;"/></td>
            <!--<th> Linked Purchase Order:</th>
            <td> Yes <input type="radio" name="poincc[po_link_po]" Value="1" {{if $detail.po_link_po eq 1}} checked="checked" {{/if}} > &nbsp; &nbsp; 
                 No  <input type="radio" name="poincc[po_link_po]" Value="0" {{if $detail.po_link_po eq 0}} checked="checked" {{/if}} >
                
           </td>-->
        </tr>
		
        
        <tr>
            <th> P Or NP:</th>
            <td> 	<select name="poincc[po_pornp]" style="width:300px;"/>
                     <option value="Not Determined" {{if  $detail.po_pornp == 'Not Determined'}}selected{{/if}}>Not Determined</option>
                     <option value="Project" {{if  $detail.po_pornp  == 'Project'}}selected{{/if}}>Project</option>
                     <option value="Non-Project" {{if $detail.po_pornp  == 'Non-Project'}}selected{{/if}}>Non-Project</option>
                    </select>    
                
           </td>
            <th>US Invoice Value:</th>
            <td> <input type="text" name="poincc[po_us_invoice_value]" value="{{$detail.po_us_invoice_value}}" style="width:300px;"/></td>
            <!--<th>Upload Purchase Order:</th>
            <td> <input type="file" name="docs_1" /></td>-->
        </tr>
     
        <tr>
            <th> Purchase Order Number:</th>
            <td>
             <datalist id='po'>
           {{foreach from=$podetail key="key3" item="item3"}}
            <option value="{{$item3.po_po_number}}" {{if $detail.po_purchase_order_no eq $item3.po_po_number}} selected="selected" {{/if}}>
            {{$item3.po_po_number}}
            </option>
            {{/foreach}}
  	       </datalist>
             <input type="text" name="poincc[po_purchase_order_no]" list = 'po' value="{{$detail.po_purchase_order_no}}" style="width:300px;"/>
            
            </td>
       
            <th> Value of Purchase Order:</th>
            <td> <input type="text" name="poincc[po_po_value]" value="{{$detail.po_po_value}}" style="width:300px;"/></td>
        </tr>
       
        <tr>
            <th> Project Address:</th>
            <td>
            <datalist id='address'>
           {{foreach from=$busdetail key="key2" item="item2"}}
            <option value="{{$item2.bsn_address}}" {{if $detail.co_company_name eq $item2.bsn_address}} selected="selected" {{/if}}>
            {{$item2.bsn_address}}
            </option>
            {{/foreach}}
  	       </datalist>
            
             <input type="text" name="poincc[po_project_number]" list = 'address' value="{{$detail.po_project_number}}" style="width:300px;"/>
            
            </td>
        
            <th> Email Received Date:</th>
            <td> <input type="text" name="poincc[po_email_date]" value="{{$detail.po_email_date}}" class="w16em dateformat-d-ds-m-ds-Y" id="demo4" maxlength="25" readonly="readonly"/></td>
        </tr>
        
       <tr>
            <th> Invoice Number:</th>
            <td> <input type="text" name="poincc[po_invoice_number]" value="{{$detail.po_invoice_number}}" style="width:300px;"/></td>
        
            <th> Supplier:</th>
            <td> 
            <datalist id='supplier'>
           {{foreach from=$companydetail key="key" item="item"}}
            <option value="{{$item.co_company_name}}" {{if $detail.co_company_name eq $item.co_company_name}} selected="selected" {{/if}}>
            {{$item.co_company_name}}
            </option>
            {{/foreach}}
  	       </datalist>
            
            <input type="text" name="poincc[po_supplier]" list = 'supplier' value="{{$detail.po_supplier}}" style="width:300px;"/>
            
            </td>
        </tr>
      
        <tr>
            <th> Upload Invoice:</th>
            <td> <input type="file" name="docs_2" /></td>
        
            <th> Invoice Date:</th>
            <td> <input type="text" name="poincc[po_invoice_date]" value="{{$detail.po_invoice_date}}" class="w16em dateformat-d-ds-m-ds-Y" id="demo6" maxlength="25" readonly="readonly"/></td>
        </tr>
      
       <tr>
            <th> Invoice Due Date:</th>
            <td> <input type="text" name="poincc[po_invoice_due_date]" value="{{$detail.po_invoice_due_date}}" class="w16em dateformat-d-ds-m-ds-Y" id="datepicker" maxlength="25" /></td>
      
      <script language="javascript">
	  $(document).ready(function() {
  			$('#datepicker').datepicker({
       		onSelect : function (dateText, inst) {
          $('#test').submit(); // <-- SUBMIT
  }});
});
	  </script>
      
       
       
            <th>Invoice Value:</th>
            <td> <input type="text" name="poincc[po_invoice_value]" value="{{$detail.po_invoice_value}}" style="width:300px;"/></td>
        </tr>
     
      <tr>
        <!--    <th>US Invoice Value:</th>
            <td> <input type="text" name="poincc[po_us_invoice_value]" value="{{$detail.po_us_invoice_value}}" style="width:300px;"/></td>-->
              <th>First Q/A</th>
                <td>
                    <select name="poincc[po_first_qa]" style="width:300px;"/>
                   	 <option value="Not Yet Determined" {{if  $detail.po_first_qa == 'Not Yet Determined'}}selected{{/if}}>Not Yet Determined</option>
                     <option value="Approved for MYOB" {{if  $detail.po_first_qa == 'Approved for MYOB'}}selected{{/if}}>Approved for MYOB</option>
                     <option value="Email back wrong details" {{if  $detail.po_first_qa  == 'Email back wrong details'}}selected{{/if}}>Email back wrong details</option>
                     <option value="Rejected" {{if $detail.po_first_qa  == 'Rejected'}}selected{{/if}}>Rejected</option>
                     <option value="Paid directly before approval" {{if $detail.po_first_qa  == 'Paid directly before approval'}}selected{{/if}}>Paid directly before approval</option>
                    </select>    
                </td>
      </tr>
     
     <!--    <tr>
            <th>My OBID:</th>
            <td> <input type="text" name="poincc[po_myobid]" value="{{$detail.po_myobid}}" style="width:300px;"/></td>
        </tr>-->
        
           <tr>
            <th> Entered in MYOB :</th>
            <td>                
              Yes <input type="radio" name="poincc[po_enter_in_myob]" Value="1" {{if $detail.po_enter_in_myob eq 1}} checked="checked" {{/if}} onclick="show3(this.value)" > &nbsp; &nbsp; 
              No  <input type="radio" name="poincc[po_enter_in_myob]" Value="0" {{if $detail.po_enter_in_myob eq 0}} checked="checked" {{/if}} onclick="show3(this.value)" >  
                
           </td> 
        </tr>
        
        <tr>
            <th></th>
            <td>  
            {{if $detail.po_enter_in_myob eq 1 }}
            <div  id="three">  
            {{else}}
            	 <div  id="three" style="display:none;">   
            {{/if}}
                 Date : <input type="text" name="poincc[po_myob_date]"  value="{{$detail.po_myob_date}}" class="w16em dateformat-d-ds-m-ds-Y" id="demo1" maxlength="25" readonly="readonly"/>
                 User : <input type="text" name="poincc[po_myob_user]" value="{{$detail.po_myob_user}}" style="width:200px;"/>
                 </div>
            </td>
        </tr>
        
<!--        <tr>
            <th> Invoiced Approved Payment:</th>
            <td>                
              Yes <input type="radio" name="poincc[po_in_approved_payment]" Value="1" {{if $detail.po_in_approved_payment eq 1}} checked="checked" {{/if}} onclick="show1(this.value)" > &nbsp; &nbsp; 
              No  <input type="radio" name="poincc[po_in_approved_payment]" Value="0" {{if $detail.po_in_approved_payment eq 0}} checked="checked" {{/if}} onclick="show1(this.value)" >  
                
           </td>      
          
           <tr>
            <th></th>
            <td> 
            {{if $detail.po_in_approved_payment eq 1 }}
           		 <div  id="one">  
            {{else}}
            	 <div  id="one" style="display:none;">   
            {{/if}}
              
                 Date : <input type="text" name="poincc[po_appoved_date]"  value="{{$detail.po_appoved_date}}" class="w16em dateformat-d-ds-m-ds-Y" id="demo3" maxlength="25" readonly="readonly"/>
                 User : <input type="text" name="poincc[po_approved_user]" value="{{$detail.po_approved_user}}" style="width:200px;"/>
                 </div>
                 </td>
        </tr>-->
        
<!--       <tr>
            <th> Invoiced Payed:</th>
            <td> Yes <input type="radio" name="poincc[po_invoice_payed]" Value="1" {{if $detail.po_invoice_payed eq 1}} checked="checked" {{/if}} onclick="show2(this.value)" > &nbsp; &nbsp; 
                 No  <input type="radio" name="poincc[po_invoice_payed]" Value="0" {{if $detail.po_invoice_payed eq 0}} checked="checked" {{/if}} onclick="show2(this.value)" >
                 
                 </td>
        </tr>
       
       <tr>
            <th> </th>
            <td> 
            {{if $detail.po_invoice_payed eq 1 }}
           		 <div  id="two">  
            {{else}}
            	 <div  id="two" style="display:none;">   
            {{/if}}
            
                 Date : <input type="text" name="poincc[po_in_payed_date]"  value="{{$detail.po_in_payed_date}}" class="w16em dateformat-d-ds-m-ds-Y" id="demo2" maxlength="25" readonly="readonly"/>
                 User : <input type="text" name="poincc[po_in_payed_user]" value="{{$detail.po_in_payed_user}}" style="width:200px;"/>
                 </div>
                 
                 </td>
        </tr>  -->      
    	
              
        <tr><th colspan="2"><div id="doc_list" style="height:auto; padding-bottom:10px; min-height:40px;"></div></th></tr>
        <tr>    <td colspan="2" style="text-align:center;">
                    <input type="submit" name="subAddDetail" value="Save" class="vsml" />
                    <input type="button" name="btnCancelDetail" value="Cancel" onclick="javascript:parent.$.fancybox.close();" class="vsml" />
                </td>
            </tr>
           
            
		</table>
 

      
     {{else}}
     	<div style="font-size:24px; height:99px; padding-top:150px;">{{$opr}}</div> 
{{/if}}

{{else}}
	<div style="font-size:24px; height:99px; padding-top:150px;">
   <div> Invoice Number <span style="color:#F00;">{{$po_invoice_no}}</span> and Supplier  <span style="color:#F00;">{{$po_supplier}}</span> is Already Exists </div>
    <br />
   <div> You can not add duplicate record </div> 
   <br />
    <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:parent.$.fancybox.close();" class="vsml" />
    </div> 
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