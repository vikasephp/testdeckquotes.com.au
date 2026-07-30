<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tabview/tabcontent.css" />
  <script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<script type="text/javascript" src="{{$BASE_URL}}js/tabview/tabcontent.js">  </script>
{{if $msg == 1}}
<script type="text/javascript">
	parent.requestadvertsDiv(1);	
</script>
<script type="text/javascript">
	parent.add_edit_adverts();	
</script>
{{/if}}
<!--<body bgcolor="#FFFFFF" onClick = closediv();>-->
<div align="center">
  
 <form name="detail" method="post" action="">
 <input type="hidden" name="seller_listing[sl_id]" value="{{$detail.sl_id}}" id="slid"/>
  <input type="hidden" name="seller_listing[sl_business_id]" value="{{$bsn_id}}" />
     <table width="100%" id="advlist-table" style="background-color:#FFFFFF;" >
     <tr><td colspan="2" height="30">{{if $msg &&  $msg != 1}} {{$msg}} {{/if}}</td></tr>
          <tr>
            <td width="150"> Business Heading:</td>
            <th> <input type="text" name="seller_listing[sl_adv_name]" value="{{$detail.sl_adv_name}}" size="133" /> </th>
        </tr>   
        <tr>
        	<th colspan="2">
            		<table width="82%">
                    	<tr>
                        <td width="150"> Type of listing:</td>
            <th> <select name="seller_listing[sl_listing_type]" class="lrg" style="width:150px;">
        	     <option value="1" {{if $detail.sl_listing_type == 1}} selected="selected" {{/if}}> Disclosed </option>
               	 <option value="0" {{if $detail.sl_listing_type == 0}} selected="selected" {{/if}}> Un disclosed </option>
  				 </select>
            </th>
                         <td> Current Price :</td>
            <th> <input type="text" name="seller_listing[sl_current_price]" value="{{$detail.sl_current_price}}" /> $ </th>	
            
            <td> Current Status :</td>
            <th> <select name="seller_listing[sl_current_status]" class="lrg" style="width:150px;">
        	     <option value="1" {{if $detail.sl_current_status == 1}} selected="selected" {{/if}}> For Sale </option>
               	 <option value="2" {{if $detail.sl_current_status == 2}} selected="selected" {{/if}}> Under Offer </option>
                 <option value="3" {{if $detail.sl_current_status == 3}} selected="selected" {{/if}}> Sold </option>
  				 </select>
            </th>
              </tr>
          </table>
          </th>
         <tr>
           <td> Notes :</th>
            <th><textarea rows="4" cols="135" name="seller_listing[sl_notes]">{{$detail.sl_notes}}</textarea> </th>
        </tr>  
         <tr>
        	<th colspan="2">
            		<table width="80%">
                    	<tr>
                        <td width="150"> Business Listed In :</td>
            <th> <select name="seller_listing[sl_website_id]" class="lrg" style="width:150px;">
            {{foreach from=$source key="key" item="item"}}
            	<option value="{{$item.soe_id}}" {{if $item.soe_id == $detail.sl_website_id}} selected="selected" {{/if}}> {{$item.soe_name}}</option>
            {{/foreach}}
			</select>
            </th>
                          <td> States/Subrub </td>
           	<th>
            <select name="seller_listing[sl_website_type]" class="lrg" style="width:150px;">
            	<option value="0" {{if $detail.sl_website_type == 0}} selected="selected" {{/if}}> -- Select --</option>            	
        	{{foreach from=$states key="key" item="item"}}
            	<option value="{{$item.s_id}}" {{if $item.s_id == $detail.sl_website_type}} selected="selected" {{/if}}> {{$item.s_shortcodes}} - {{$item.s_district}}</option>
            {{/foreach}}
			</select>
             </td>
            <td> Update Date:</td>
            <th> <input type="text" name="seller_listing[sl_update_date]" value="{{$detail.sl_update_date}}" class="w16em dateformat-d-ds-m-ds-Y"/> </th>
                    	</tr>
            		</table>
            </th>    
        </tr>
        <tr>
            <td> Adv Link:</td>
            <th> <input type="text" name="seller_listing[sl_link]" value="{{$detail.sl_link}}" size="133" /> </th>
        </tr>        
        
        <tr><td>Status:</td><td>
        	<table width="100%">
                    	<tr>
            <th> <select name="seller_listing[sl_status]" class="lrg" style="width:150px;">
        	     <option value="1" {{if $detail.sl_status == 1}} selected="selected" {{/if}}> Active </option>
               	 <option value="0" {{if $detail.sl_status == 0}} selected="selected" {{/if}}> InActive </option>
          		 </select> 
            </th>
            <td> Type:</td>
            <th> <select name="seller_listing[sl_enhance_type]" class="lrg" style="width:150px;">
        	     <option value="0" {{if $detail.sl_enhance_type == 0}} selected="selected" {{/if}}> Basic </option>
               	 <option value="1" {{if $detail.sl_enhance_type == 1}} selected="selected" {{/if}}> Enhanced </option>
          		 </select> 
            </th>
            <td>&nbsp;</td>
            </tr>
           </table> 
            </td>
        </tr>
        <tr>
               <td colspan="2" style="text-align:center;">
                    <input type="submit" name="subAddDetail" value="Save" class="vsml" />
                    <input type="button" name="btnCancelDetail" value="Cancel" onclick="parent.add_edit_adverts();" class="vsml" />
                </td>
            </tr>
		</table>
      </form>
</div>
<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("detail");
    frmvalidator.EnableMsgsTogether();
    frmvalidator.addValidation("seller_listing[sl_business_id]","req", "Please specify Valid Business Name.");
    frmvalidator.addValidation("seller_listing[sl_adv_name]","req", "Please specify Business Advertised Name.");
	frmvalidator.addValidation("seller_listing[sl_current_price]","req", "Please specify Current Price.");
	//frmvalidator.addValidation("seller_listing[sl_current_price]","numeric", "Current Price must be Numeric.");
    frmvalidator.addValidation("seller_listing[sl_update_date]","req", "Please specify Update Date.");
	frmvalidator.addValidation("seller_listing[sl_link]","req", "Please specify Advertised Link.");
</script>
</body>