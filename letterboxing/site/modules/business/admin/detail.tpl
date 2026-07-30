<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
 <link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tabview/tabcontent.css" />

<script type="text/javascript" src="{{$BASE_URL}}js/tabview/tabcontent.js">  </script>
<div align="center">

    <h3 class="page-title">{{$title}}</h3>
    
    <form name="detail" method="post" action="{{$XFA.detail}}">
        <table id="product-table" width="98%" cellpadding="0" cellspacing="0">
            <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
            <tr>
                <th width="150">Business Name:</th>
                <td colspan="2"><input type= "text" name="{{$TABLE}}[bsn_name]" value="{{$detail.bsn_name}}" class="xxlrg" /></td>
            </tr>
            <tr><th colspan="3" ><table id="none-table" width="100%" cellpadding="0" cellspacing="0">
            
              <tr><td width="150">Status:&nbsp;</td><th> 			
		<select name="{{$TABLE}}[bsn_status]" class="lrg" >
        	<option value="0" selected="selected">-- select --</option>
            {{foreach from=$business_status key="key" item="item"}}
            <option value="{{$item.st_id}}" {{if $item.st_id == $detail.bsn_status}} selected="selected" {{/if}}> {{$item.st_name}}</option>
            {{/foreach}}
		</select> 
</th>  			<td >Status Date:&nbsp; </td><th><input type="text" name="{{$TABLE}}[bsn_status_date]" value="{{$detail.bsn_status_date}}" class="vsml" />&nbsp; <input type="text" name="{{$TABLE}}[bsn_status_time]" value="{{$detail.bsn_status_time}}" class="vvsml" />&nbsp;&nbsp;&nbsp;<b>Days at Status:</b></th> 
       </tr>
        <tr><td>Created User:&nbsp; </td><th> 			
		
</th>  			<td >Created Date:&nbsp; </td><th><input type="text" name="{{$TABLE}}[bsn_status_sys_date]" value="{{$detail.bsn_status_sys_date}}" class="vsml" />&nbsp; <input type="text" name="{{$TABLE}}[bsn_status_sys_time]" value="{{$detail.bsn_status_sys_time}}" class="vvsml" />&nbsp;&nbsp;&nbsp;<b>Days in System:</b></th> 
       </tr>
       <tr><td>Interest:</td><th colspan="3">
       
       	<select name="{{$TABLE}}[bsn_interest]" class="lrg" >
        	<option value="0" selected="selected"> -- select --</option>
            {{foreach from=$business_interest key="key" item="item"}}
            <option value="{{$item.bi_id}}" {{if $item.bi_id == $detail.bsn_interest}} selected="selected" {{/if}}> {{$item.bi_title}}</option>
            {{/foreach}}
		</select>
       </th></tr>
        <tr><td>Date Listed:&nbsp; </td><th> <input type="text" name="{{$TABLE}}[bsn_date_listed_date]" value="{{$detail.bsn_date_listed_date}}" class="vsml" />&nbsp; <input type="text" name="{{$TABLE}}[bsn_date_listed_time]" value="{{$detail.bsn_date_listed_time}}" class="vvsml" />			
		
</th>  			<td >Ready For Sale:&nbsp; </td><th><input type="checkbox" name="{{$TABLE}}[bsn_readyforsale]" value="1" {{if $detail.bsn_readyforsale == 1}} checked="checked" {{/if}} />&nbsp;</th> 
       </tr>
     </table></th></tr>       
          
      	<tr><th> Description:</th> 
			<td>
            		<textarea  cols="100" id="editor1" name="{{$TABLE}}[bsn_description]" rows="6">{{$detail.bsn_description}}</textarea>
            </td> 
       </tr>   
          	<tr><th> Address:</th> 
			<td>
            		<textarea  cols="100" id="editor2" name="{{$TABLE}}[bsn_address]" rows="3">{{$detail.bsn_address}}</textarea>
            </td> 
       </tr>    
           <tr><th colspan="3"><table id="none-table" width="100%" cellpadding="0" cellspacing="0">
            
             
        <tr><td width="150">Suburb:&nbsp; </td><th> <input type="text" name="{{$TABLE}}[bsn_suburb]" value="{{$detail.bsn_suburb}}" class="vsml" /></th>
        	<td>State:&nbsp; </td><th><input type="text" name="{{$TABLE}}[bsn_state]" value="{{$detail.bsn_state}}" class="vsml" /></td> 
            <td>Post Code:&nbsp; </td><th><input type="text" name="{{$TABLE}}[bsn_pcode]" value="{{$detail.bsn_pcode}}" class="vsml" /></td> 
       </tr>
    
     </table></th></tr>    
     <tr><th colspan="5" align="center" style="padding-left:10px; padding-top:5px;"> 
     				<ul id="countrytabs" class="shadetabs">
<li><a href="#" rel="country1" class="selected">Common Details</a></li>
<li><a href="#" rel="country2">Sellers</a></li>
<li><a href="#" rel="country3">Marketing/Other Agency</a></li>
<li><a href="#" rel="country4">Advert</a></li>
<li><a href="#" rel="country5">Notes/Extra info</a></li>
<li><a href="#" rel="country6">Other Contacts</a></li>
<li><a href="#" rel="country7">Tasks </a></li>
</ul>

<div style="border:1px solid gray; width:95%; margin-bottom: 1em; padding: 10px">

<div id="country1" class="tabcontent">
	<table id="none-table" width="100%" cellpadding="0" cellspacing="0">
              <tr><td>Contact:&nbsp;</td><th> <input type="text" name="{{$TABLE}}[bsn_cd_contact]" value="{{$detail.bsn_cd_contact}}" class="lrg" /></th>
              <td >Phone:&nbsp; </td><th><input type="text" name="{{$TABLE}}[bsn_cd_phone]" value="{{$detail.bsn_cd_phone}}" class="sml" />&nbsp;</th>
              <td>Fax:&nbsp; </td><th><input type="text" name="{{$TABLE}}[bsn_cd_fax]" value="{{$detail.bsn_cd_fax}}" class="vsml" /></th></tr> 
              
              <tr><td>Email:&nbsp;</td><th> <input type="text" name="{{$TABLE}}[bsn_cd_email]" value="{{$detail.bsn_cd_email}}" class="lrg" /></th>
              <td > </td><th>Send Marketing Emails&nbsp;&nbsp;<input type="checkbox" name="{{$TABLE}}[bsn_send_marketing_emails]" value="1" {{if $detail.bsn_send_marketing_emails == 1}} checked="checked" {{/if}} />&nbsp;</th>
              <td></td><th></th></tr> 
              
              <tr><td>Date Appraised:&nbsp;</td><th> <input type="text" name="{{$TABLE}}[bsn_cd_date_appraised_date]" value="{{$detail.bsn_cd_date_appraised_date}}" class="vsml" />&nbsp; <input type="text" name="{{$TABLE}}[bsn_cd_date_appraised_time]" value="{{$detail.bsn_cd_date_appraised_time}}" class="vvsml" /></th>
              <td >Appraised By:&nbsp;</td><th colspan="3"><input type="text" name="{{$TABLE}}[bsn_cd_appraised_by]" value="{{$detail.bsn_cd_appraised_by}}" class="lrg" />&nbsp;</th>
           	</tr> 
              <tr><td>Planing To Sell:&nbsp;</td><th> <input type="text" name="{{$TABLE}}[bsn_cd_planing_sell_date]" value="{{$detail.bsn_cd_planing_sell_date}}" class="vsml" />&nbsp; <input type="text" name="{{$TABLE}}[bsn_cd_planing_sell_time]" value="{{$detail.bsn_cd_planing_sell_time}}" class="vvsml" /></th>
              <td >Note:&nbsp;</td><th colspan="3"><input type="text" name="{{$TABLE}}[bsn_cd_note]" value="{{$detail.bsn_cd_note}}" class="lrg" />&nbsp;</th>
           	</tr> 
            	</tr> 
              <tr><td>Enquiry Source::&nbsp;</td><th colspan="5"><select name="{{$TABLE}}[bsn_cd_enquiry_source]" class="lrg" >
        	<option value="0" selected="selected"> -- select --</option>
            {{foreach from=$enq_source key="key" item="item"}}
            <option value="{{$item.bi_id}}" {{if $item.bi_id == $detail.bsn_interest}} selected="selected" {{/if}}> {{$item.bi_title}}</option>
            {{/foreach}}
		</select></th>
           	</tr> 
            	</tr> 
              <tr><td width="150">Original Asking Price:&nbsp;</td><th> <input type="text" name="{{$TABLE}}[bsn_cd_org_ask_price]" value="{{$detail.bsn_cd_org_ask_price}}" class="sml" /></th>
              <td width="150">Current Asking Price:&nbsp;</td><th colspan="3"><input type="text" name="{{$TABLE}}[bsn_cd_current_ask_price]" value="{{$detail.bsn_cd_current_ask_price}}" class="lrg" />&nbsp;</th>
           	</tr> 
            	</tr> 
              <tr><td>Price From:&nbsp;</td><th> <input type="text" name="{{$TABLE}}[bsn_cd_ask_price_from]" value="{{if $detail.bsn_cd_ask_price_from}} {{$detail.bsn_cd_ask_price_from}} {{else}} $0{{/if}}" class="sml"  style="text-align:right" /></th>
              <td >Price To:&nbsp;</td><th colspan="3"><input type="text" name="{{$TABLE}}[bsn_cd_ask_price_to]" value="{{if $detail.bsn_cd_ask_price_to}} {{$detail.bsn_cd_ask_price_to}} {{else}} $0{{/if}}" class="sml" style="text-align:right" />&nbsp;</th>
           	</tr> 
            </tr> 
              <tr><td>Cashflow:&nbsp;</td><th> <input type="text" name="{{$TABLE}}[bsn_cd_cashflow]" value="{{$detail.bsn_cd_cashflow}}" class="sml"/></th>
              <td >Turnover:&nbsp;</td><th colspan="3"><input type="text" name="{{$TABLE}}[bsn_cd_turnover]" value="{{$detail.bsn_cd_turnover}}" class="sml"/>&nbsp;</th>
           	</tr> 
            </tr> 
              <tr><td>Website:&nbsp;</td><th> <input type="text" name="{{$TABLE}}[bsn_cd_website]" value="{{$detail.bsn_cd_website}}" class="lrg"/></th>
              <td >Image URL:&nbsp;</td><th colspan="3"><input type="text" name="{{$TABLE}}[bsn_cd_image_url]" value="{{$detail.bsn_cd_image_url}}" class="lrg"/>&nbsp;</th>
           	</tr> 
              </tr> 
              <tr><td>Seller Summary:&nbsp;</td><th  colspan="5"> <textarea  cols="100"  name="{{$TABLE}}[bsn_cd_seller_summery]" rows="6">{{$detail.bsn_cd_seller_summery}}</textarea></th>
           
           	</tr> 
     </table>			
</div>

<div id="country2" class="tabcontent">
Sellers content Goes here<br />
</div>

<div id="country3" class="tabcontent">
<table id="none-table" width="100%" cellpadding="0" cellspacing="0">
              <tr><td>Agency Marketing:&nbsp;</td><th> <input type="text" name="{{$TABLE}}[bsn_agency_marketing]" value="{{$detail.bsn_agency_marketing}}" class="lrg" /></th>
              <td >Agent Marketing:&nbsp; </td><th><input type="text" name="{{$TABLE}}[bsn_agent_marketing]" value="{{$detail.bsn_agent_marketing}}" class="lrg" />&nbsp;</th>
             </tr> 
               <tr><td>Agent Status:&nbsp;</td><th><select name="{{$TABLE}}[bsn_agent_status]" class="lrg" >
        	<option value="0" selected="selected"> -- select --</option>
            {{foreach from=$agent_status key="key" item="item"}}
            <option value="{{$item.bi_id}}" {{if $item.bi_id == $detail.bsn_agent_status}} selected="selected" {{/if}}> {{$item.bi_title}}</option>
            {{/foreach}}
		</select></th>
              <td ></td><th></th>
             </tr>
              <tr><td>Marketing Date:&nbsp;</td><th> <input type="text" name="{{$TABLE}}[bsn_marketing_date]" value="{{$detail.bsn_marketing_date}}" class="vsml" />&nbsp; <input type="text" name="{{$TABLE}}[bsn_marketing_time]" value="{{$detail.bsn_marketing_time}}" class="vvsml" /></th>
              <td ></td><th></th>
             </tr> 
              <tr><td>Disclosed Marketing:&nbsp;</td><th> <input type="checkbox" name="{{$TABLE}}[bsn_disclosed_marketing]" value="1" {{if $detail.bsn_disclosed_marketing == 1}} checked="checked" {{/if}} /></th>
              <td >Undisclosed Name:&nbsp;</td><th><input type="text" name="{{$TABLE}}[bsn_undisclosed_name]" value="{{$detail.bsn_undisclosed_name}}" class="lrg" /></th>
             </tr> 
                  <tr><td>Franchise:&nbsp;</td><th> <input type="checkbox" name="{{$TABLE}}[bsn_franchise]" value="1" {{if $detail.bsn_franchise == 1}} checked="checked" {{/if}} /></th>
              <td >Franchise Name:&nbsp;</td><th><input type="text" name="{{$TABLE}}[bsn_franchise_name]" value="{{$detail.bsn_franchise_name}}" class="lrg" /></th>
             </tr>
                  <tr><td>Marketing Price:&nbsp;</td><th><input type="text" name="{{$TABLE}}[bsn_marketing_price]" value="{{$detail.bsn_marketing_price}}" class="sml" /></th>
              <td >Stock At Value:</td><th><input type="text" name="{{$TABLE}}[bsn_stock_at_value]" value="{{$detail.bsn_stock_at_value}}" class="sml" /></th>
             </tr>
                 <tr><td>Marketing Headline:&nbsp;</td><th colspan="4"> <input type="text" name="{{$TABLE}}[bsn_marketing_headline]" value="{{$detail.bsn_marketing_headline}}" class="xxlrg" /></th></tr> 
              <tr><td>Marketing Note:&nbsp;</td><th  colspan="5"> <textarea  cols="100" id="editor1" name="{{$TABLE}}[bsn_marketing_note]" rows="6">{{$detail.bsn_marketing_note}}</textarea></th>
           
           	</tr>              
     </table>
</div>

<div id="country4" class="tabcontent">
<table id="none-table" width="100%" cellpadding="0" cellspacing="0"> 
  <tr><td>AdvertLink:&nbsp;</td><th colspan="4"> <input type="text" name="{{$TABLE}}[bsn_advertLink]" value="{{$detail.bsn_advertLink}}" class="xxlrg" /></th></tr> 
   <tr><td>Advert Text:&nbsp;</td><th  colspan="5"> <textarea  cols="100"  name="{{$TABLE}}[bsn_advert_text]" rows="6">{{$detail.bsn_advert_text}}</textarea></th></tr>
   </table>
</div>
<div id="country5" class="tabcontent">
<table id="none-table" width="100%" cellpadding="0" cellspacing="0">
   <tr><td>Notes:&nbsp;</td><th  colspan="5"> <textarea  cols="100"  name="{{$TABLE}}[bsn_notes]" rows="6">{{$detail.bsn_notes}}</textarea></th></tr>
    <tr><td>Last Update Letter:&nbsp;</td><th colspan="4"> <input type="text" name="{{$TABLE}}[bsn_last_update_letter_date]" value="{{$detail.bsn_last_update_letter_date}}" class="vsml" />&nbsp; <input type="text" name="{{$TABLE}}[bsn_last_update_letter_time]" value="{{$detail.bsn_last_update_letter_time}}" class="vvsml" /></th></tr> 
   </table>	
</div>
<div id="country6" class="tabcontent">
Tab content 6 Goes here<br />
</div>
<div id="country7" class="tabcontent">
Tab content 7 Goes here<br />
</div>


</div>

<script type="text/javascript">

var countries=new ddtabcontent("countrytabs")
countries.setpersist(true)
countries.setselectedClassTarget("link") //"link" or "linkparent"
countries.init()

</script>
     
     </th> 
			
       </tr> 
     
              
            <tr>
                <td colspan="3" style="text-align:center;">
                    <input type="submit" name="subAddDetail" value="Save" class="vsml" />
                    <input type="button" name="btnCancelDetail" value="Cancel" onclick="document.location.href='{{$BASE_URL}}{{$XFA.list}}'" class="vsml" />
                </td>
            </tr>
        </table>
    </form>

</div>

<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("detail");
    frmvalidator.EnableMsgsTogether();
    frmvalidator.addValidation("{{$TABLE}}[bsn_name]","req", "Please specify Business Name.");
</script>