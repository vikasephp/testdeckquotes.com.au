<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>

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
   
 
 <input type="hidden" name="rejected[ri_id]" value="{{$detail.$ID}}" id="dh_id"/>
     <table id="viewdoc-table" width="80%" cellpadding="0" cellspacing="0" >
     
      <tr>
                <th>Select Type</th>
                <td>
                    <select name="rejected[ri_type]" style="width:300px;"/>
                   	 
                     <option value="Invoice" {{if  $detail.ri_type  == 'Invoice'}}selected{{/if}}>Invoice</option>
                     <option value="Receipt" {{if  $detail.ri_type  == 'Receipt'}}selected{{/if}}>Receipt</option>
                     <option value="Other"   {{if $detail.ri_type  == 'Other'}}selected{{/if}}>Other</option>
                     <option value="Statement" {{if  $detail.ri_type  == 'Statement'}}selected{{/if}}>Statement</option>
                     <option value="Credit" {{if  $detail.ri_type  == 'Credit'}}selected{{/if}}>Credit</option>
                    </select>    
                </td>
                
        <th>Email Date:</th>
        <td> <input type="text" name="rejected[ri_email_date]" value="{{$detail.ri_email_date}}" class="w16em dateformat-d-ds-m-ds-Y" /></td>
        </tr>
		
          <tr>
            <th> Invoice Number:</th>
            <td> <input type="text" name="rejected[ri_invoice_num]" value="{{$detail.ri_invoice_num}}" style="width:300px;"/></td>
        
            <th> Supplier:</th>
            <td> 
            <datalist id='supplier'>
           {{foreach from=$companydetail key="key" item="item"}}
            <option value="{{$item.co_company_name}}" {{if $detail.co_company_name eq $item.co_company_name}} selected="selected" {{/if}}>
            {{$item.co_company_name}}
            </option>
            {{/foreach}}
  	       </datalist>
            
            <input type="text" name="rejected[ri_supplier]" list = 'supplier' value="{{$detail.ri_supplier}}" style="width:300px;"/>
            
            </td>
        </tr>
        
        <tr>
            <th>Invoice:</th>
            <td> <input type="text" name="rejected[ri_invoice]" value="{{$detail.ri_invoice}}" style="width:300px;"/></td>
            
            <th>Invoice Date:</th>
            <td> <input type="text" name="rejected[ri_invoice_date]" value="{{$detail.ri_invoice_date}}" class="w16em dateformat-d-ds-m-ds-Y"/></td>
            
        </tr>
     
        <tr>
        <th> Invoice Due Date:</th>
        <td>
        <input type="text" name="rejected[ri_invoice_due_date]" value="{{$detail.ri_invoice_due_date}}" class="w16em dateformat-d-ds-m-ds-Y"/>
        </td>
       
            <th> Invoice Value:</th>
            <td> <input type="text" name="rejected[ri_invoice_value]" value="{{$detail.ri_invoice_value}}" style="width:300px;"/></td>
        </tr>
       
       
       <tr>
            <th> US Invoice Value:</th>
            <td><input type="text" name="rejected[ri_us_inv_value]" value="{{$detail.ri_us_inv_value}}" /></td>
       
            <th> AUD Invoice Value:</th>
            <td> <input type="text" name="rejected[ri_aud_inv_value]" value="{{$detail.ri_aud_inv_value}}" style="width:300px;"/></td>
        </tr>
       
       
       <tr>
            <th> Reason for Rejection :</th>
            <td><input type="text" name="rejected[ri_reason_rejection]" value="{{$detail.ri_reason_rejection}}" style="width:400px;" /></td>
       
            <th> Status </th>
            <td> <!--<input type="text" name="rejected[ri_status]" value="{{$detail.ri_status}}" style="width:300px;"/>-->
            
            <select name="rejected[ri_status]"/>
            <option value="">Please Select</option>
            <option value="Emailed"   {{if $detail.ri_status eq 'Emailed'}} selected="selected" {{/if}}>Emailed</option>
            <option value="Resolved"  {{if $detail.ri_status eq 'Resolved'}} selected="selected" {{/if}}>Resolved</option>
            <option value="Under Review" {{if $detail.ri_status eq 'Under Review'}} selected="selected" {{/if}}>Under Review</option>
            <option value="Not Resolved" {{if $detail.ri_status eq 'Not Resolved'}} selected="selected" {{/if}}>Not Resolved</option>
            </select> 
            </td>
        </tr>
       
       
       
        <tr>
            <th> Project Address if Found:</th>
            <td>
            <datalist id='address'>
           {{foreach from=$busdetail key="key2" item="item2"}}
            <option value="{{$item2.bsn_address}}" {{if $detail.co_company_name eq $item2.bsn_address}} selected="selected" {{/if}}>
            {{$item2.bsn_address}}
            </option>
            {{/foreach}}
  	       </datalist>
            
             <input type="text" name="rejected[ri_project_address]" list = 'address' value="{{$detail.ri_project_address}}" style="width:300px;"/>
            
            </td>
        
            <th>PO Number:</th>
            <td> <input type="text" name="rejected[ri_po_number]" value="{{$detail.ri_po_number}}" /></td></tr>
        
     
      
        <tr>
            <th> Value Of PO:</th>
            <td> <input type="text" name="rejected[ri_value_of_po]" value="{{$detail.ri_value_of_po}}" /></td>
        
            <th> Linked Purchase Order :</th>
            <td> <input type="text" name="rejected[ri_linked_po]" value="{{$detail.ri_linked_po}}"  style="width:300px;"/></td>
        </tr>
      	
              
        <tr>
        <th>Notes</th>
         <td> <input type="text" name="rejected[ri_notes]" value="{{$detail.ri_notes}}" style="width:400px;" /></td>
        </tr>
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



</div>
   {{if !$opr}}
<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("detail");
    frmvalidator.EnableMsgsTogether();
    frmvalidator.addValidation("rejected[po_invoice_number]","req", "Please enter invoice number.");
</script>
{{/if}}