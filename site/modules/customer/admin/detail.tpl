
<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
 <link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tabview/tabcontent.css" />

<script type="text/javascript" src="{{$BASE_URL}}js/tabview/tabcontent.js">  </script>
<div align="center">

    <h3 class="page-title">{{$title}}</h3>
    
    <form name="detail" method="post" action="{{$XFA.detail}}">
        <table id="product-table" width="98%" cellpadding="0" cellspacing="0" border="1" height="400">
            <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
            <input type="hidden" name="{{$TABLE}}[bcust_user_id]" value="{{$detail.bcust_user_id}}" />
            <tr>
                <th width="150">First Name:</th>
                <td><input type= "text" name="{{$TABLE}}[bcust_fname]" value="{{$detail.bcust_fname}}" class="lrg" /></td>
                <th width="150">Co./Last Name:</th>
                 <td><input type= "text" name="{{$TABLE}}[bcust_lname]" value="{{$detail.bcust_lname}}" class="lrg" /></td>
            </tr>
            <tr><th colspan="4" ><table id="none-table" width="100%" cellpadding="0" cellspacing="0">
            
              <tr><td width="150">Status:&nbsp;</td><th> 			
		<select name="{{$TABLE}}[bcust_status]" class="lrg" >
        	<option value="0" selected="selected"> -- select --</option>
            {{foreach from=$customers_status key="key" item="item"}}
            <option value="{{$item.cs_id}}" {{if $item.cs_id == $detail.bcust_status}} selected="selected" {{/if}}> {{$item.cs_name}}</option>
            {{/foreach}}
		</select> 
</th>  			<td>Type:</td><th colspan="4">       
       	<select name="{{$TABLE}}[bcust_type]" class="lrg" >
        	<option value="0" selected="selected"> -- select --</option>
            {{foreach from=$customers_type key="key" item="item"}}
            <option value="{{$item.ct_id}}" {{if $item.ct_id == $detail.bcust_type}} selected="selected" {{/if}}> {{$item.ct_name}}</option>
            {{/foreach}}
		</select>
       </th> 
       </tr>
       
        <tr><td >Is Buyer:&nbsp; </td><th><input type="checkbox" name="{{$TABLE}}[bcust_isbuyer]" value="1" {{if $detail.bcust_isbuyer == 1}} checked="checked" {{/if}} />&nbsp;</th> 			<td >Is Seller: </td><th><input type="checkbox" name="{{$TABLE}}[bcust_isseller]" value="1" {{if $detail.bcust_isseller == 1}} checked="checked" {{/if}} />&nbsp;</th> 
       </tr>
     </table></th></tr>       
              
     <tr><th colspan="6" align="center" style="padding-left:10px; padding-top:5px;" > 
     				<ul id="countrytabs" class="shadetabs">
<li><a href="#" rel="country1" class="selected">Misc</a></li>
<li><a href="#" rel="country2">Address</a></li>
<li><a href="#" rel="country3">Notes</a></li>
<li><a href="#" rel="country4">Other Contacts</a></li>
<li><a href="#" rel="country5">Documents</a></li>
</ul>

<div style="border:1px solid gray; width:95%; margin-bottom: 1em; padding: 10px">

<div id="country1" class="tabcontent">
	<table id="none-table" width="100%" cellpadding="0" cellspacing="0" border="1" >
              <tr><td>Email:&nbsp;</td><th> <input type="text" name="{{$TABLE}}[bcust_misc_email1]" value="{{$detail.bcust_misc_email1}}" class="lrg" /></th>
              <td  colspan="2">Secondary Email:&nbsp; </td><th colspan="2"><input type="text" name="{{$TABLE}}[bcust_misc_email2]" value="{{$detail.bcust_misc_email2}}" class="lrg" />&nbsp;</th>
              </tr> 
              
              <tr><td >Send Marketing Emails: </td><th colspan="3"><input type="checkbox" name="{{$TABLE}}[bcust_misc_send_market_email]" value="1" {{if $detail.bcust_misc_send_market_email == 1}} checked="checked" {{/if}} />&nbsp;</th>
              </tr> 
              
              <tr><td>Logged Date:&nbsp;</td><th> <input type="text" name="{{$TABLE}}[bcust_misc_logged_date_date]" value="{{$detail.bcust_misc_logged_date_date}}" class="vsml" />&nbsp; <input type="text" name="{{$TABLE}}[bcust_misc_logged_date_time]" value="{{$detail.bcust_misc_logged_date_time}}" class="vvsml" /></th>
              <td >Logged User:&nbsp;</td><th colspan="3">&nbsp;{{$detail.bcust_misc_logged_user}}</th>
           	</tr> 
         <tr><td >Mobile: </td><th><input type="text" name="{{$TABLE}}[bcust_misc_moble]" value="{{$detail.bcust_misc_moble}}" class="vsml" /></th>
          <td>Business:  </td><th><input type="text" name="{{$TABLE}}[bcust_misc_business]" value="{{$detail.bcust_misc_business}}" class="vsml" /></th> 				          <td>Home:</td><th><input type="text" name="{{$TABLE}}[bcust_misc_home]" value="{{$detail.bcust_misc_home}}" class="vsml" /></th></tr> 
     </table>			
</div>

<div id="country2" class="tabcontent">
<table id="none-table" width="100%" cellpadding="0" cellspacing="0">
  <tr><td>Address:&nbsp;</td><th  colspan="7"> <textarea  cols="111" id="editor1" name="{{$TABLE}}[bcust_address]" rows="6">{{$detail.bcust_address}}</textarea></th>
           
           	</tr> 
              <tr><td>Suburb:&nbsp;</td><th> <input type="text" name="{{$TABLE}}[bcust_suburb]" value="{{$detail.bcust_suburb}}" class="vsm" /></th>
              <td >Post Code:&nbsp; </td><th><input type="text" name="{{$TABLE}}[bcust_postcode]" value="{{$detail.bcust_postcode}}" class="vvsml" />&nbsp;</th>  <td >State:&nbsp; </td><th><input type="text" name="{{$TABLE}}[bcust_state]" value="{{$detail.bcust_state}}" class="vsml" />&nbsp;</th>
       </tr>  
           	</tr> 
              <tr><td>Country:&nbsp;</td><th> <input type="text" name="{{$TABLE}}[bcust_country]" value="{{$detail.bcust_country}}" class="sml" /></th>
              <td></td><th></th><td></td><th></th>
       </tr>   
       <tr><td><h3 class="postal">Postal Address </h3></td></tr> 
        <tr><td>Address:&nbsp;</td><th  colspan="7"> <textarea  cols="111" id="editor1" name="{{$TABLE}}[bcust_postal_address]" rows="6">{{$detail.bcust_postal_address}}</textarea></th>
           
           	</tr> 
              <tr><td>Suburb:&nbsp;</td><th> <input type="text" name="{{$TABLE}}[bcust_postal_suburb]" value="{{$detail.bcust_postal_suburb}}" class="sml" /></th>
              <td >Post Code:&nbsp; </td><th><input type="text" name="{{$TABLE}}[bcust_postal_postcode]" value="{{$detail.bcust_postal_postcode}}" class="vvsml" />&nbsp;</th>  <td >State:&nbsp; </td><th><input type="text" name="{{$TABLE}}[bcust_postal_state]" value="{{$detail.bcust_postal_state}}" class="vsml" />&nbsp;</th>
       </tr>  
           	</tr> 
              <tr><td>Country:&nbsp;</td><th> <input type="text" name="{{$TABLE}}[bcust_postal_country]" value="{{$detail.bcust_postal_country}}" class="sml" /></th>
              <td></td><th></th><td></td><th></th>
       </tr>            
     </table>
</div>

<div id="country3" class="tabcontent">
<table id="none-table" width="100%" cellpadding="0" cellspacing="0">
              <tr><td>Notes:&nbsp;</td><th  colspan="5"> <textarea  cols="111" id="editor1" name="{{$TABLE}}[bcust_notes]" rows="15">{{$detail.bcust_notes}}</textarea></th>
           
           	</tr>              
     </table>
</div>

<div id="country4" class="tabcontent">
<table id="none-table" width="100%" cellpadding="0" cellspacing="0"> 
  <tr><th valign="top"> <input type="button" name="exis_link" value="Link Existing" class="sml" /></th>
  <th valign="top"> <input type="button" name="exis_link" value="Quick Add Contact" class="sml" /></th> <td width="400"></td></tr> 
  <tr><td colspan="8" valign="top"><hr /></td></tr>
   <tr height="280"><td colspan="3" valign="top" height="200">&nbsp;</td></tr>
   </table>
</div>
<div id="country5" class="tabcontent">
<table id="none-table" width="100%" cellpadding="0" cellspacing="0"> 
  <tr><th valign="top">No Customer Documents found. </th>
  <th valign="top"></th> <td width="400"></td></tr> 
  <tr><td colspan="8" valign="top"><hr /></td></tr>
   <tr height="280"><td colspan="3" valign="top" height="200">&nbsp;</td></tr>
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
                <td style="text-align:center;"><b>Password:</b></td>
                <td  style="text-align:center;"><input type="password" name="{{$TABLE}}[user_password]" /></td>
                <td  style="text-align:center;"><b>Confirm Password:</b></td>
                <td  style="text-align:center;"><input type="password" name="{{$TABLE}}[conf_password]" /></td>
            </tr>
              
            <tr>
                <td colspan="4" style="text-align:center;">
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