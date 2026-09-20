<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>

  <script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
  <script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tabview/tabcontent.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/admin/screen.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/tabview/tabcontent.js">  </script>

<!--Ajax Common function-->
<script type="text/javascript">
 
	    var getcurrenturl= "{{$BASE_URL}}{{$XFA.buslist}}?bsn_name="; // The server-side script
   		
	function setsalevalue(bus_id, bus_name)
		{
		document.getElementById("bname").value = bus_name;
		document.getElementById("sl_id").value = bus_id;
		document.getElementById('listofallbusinesses').style.visibility = 'hidden';
		}
	function closediv()
		{
		document.getElementById('listofallbusinesses').style.visibility = 'hidden';
		}	
	function handleHttpAllBusinessResponse() {   
        if (http.readyState == 4) {
              if(http.status == 200) {
                  var results=http.responseText;    			  
			  if(results !='')
			  	{document.getElementById('listofallbusinesses').style.visibility = 'visible';
				 document.getElementById('listofallbusinesses').innerHTML = results;
				}
            }
          }
        }
       
        function requestAllBusiness() { 
        var bsname = document.getElementById("bname").value;
		var businessurl = getcurrenturl + 'all_businesses&bsn_name=' + bsname+"&random=" + Math.random();	
		
			http.open("GET", businessurl, true);
            http.onreadystatechange = handleHttpAllBusinessResponse;
            http.send(null);
			
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
</script>


<div align="center">
<h3 class="page-title">{{$title}}</h3>
   
 <form name="detail" method="post" action="{{$XFA.detail}}">
 <input type="hidden" name="seller_listing[sl_id]" value="{{$detail.sl_id}}" id="slid"/>
     <table id="listing-table" width="80%" cellpadding="0" cellspacing="0">
     
        <tr>
            <th> Business Name:</th>
            <td> <input type="text" name="seller_listing[sl_business_name]" value="{{$detail.bsn_name}}" size="80" id ="bname" onkeyup="javascript:requestAllBusiness();" autocomplete="off"/> 		<input type="hidden" name="seller_listing[sl_business_id]" value="{{$detail.sl_business_id}}" id = "sl_id" />
            <div id="listofallbusinesses" class="element"></div> </td>
        </tr>
          <tr>
            <th> Business Advertised Name:</th>
            <td> <input type="text" name="seller_listing[sl_adv_name]" value="{{$detail.sl_adv_name}}" size="80" /> </td>
        </tr>
            
        <tr>
            <th> Type of listing:</th>
            <td> <select name="seller_listing[sl_listing_type]" class="lrg" style="width:150px;">
        	     <option value="1" {{if $detail.sl_listing_type == 1}} selected="selected" {{/if}}> Disclosed </option>
               	 <option value="0" {{if $detail.sl_listing_type == 0}} selected="selected" {{/if}}> Un disclosed </option>
  				 </select>
            </td>
        </tr>
        <tr>
            <th> Current Price :</th>
            <td> <input type="text" name="seller_listing[sl_current_price]" value="{{$detail.sl_current_price}}" /> $ </td>
        </tr>
            
        <tr>
            <th> Current Status :</th>
            <td> <select name="seller_listing[sl_current_status]" class="lrg" style="width:150px;">
        	     <option value="1" {{if $detail.sl_current_status == 1}} selected="selected" {{/if}}> For Sale </option>
               	 <option value="2" {{if $detail.sl_current_status == 2}} selected="selected" {{/if}}> Under Offer </option>
                 <option value="3" {{if $detail.sl_current_status == 3}} selected="selected" {{/if}}> Sold </option>
  				 </select>
            </td>
        </tr>
               
         <tr>
            <th> Notes :</th>
            <td> <input type="text" name="seller_listing[sl_notes]" value="{{$detail.sl_notes}}" size="80" /> </td>
        </tr>  
        
        <tr>
            <th> Business Listed In :</th>
         
            <td>
            <select name="seller_listing[sl_website_id]" class="lrg" style="width:150px;">
            {{foreach from=$source key="key" item="item"}}
            	<option value="{{$item.soe_id}}" {{if $item.soe_id == $detail.sl_website_id}} selected="selected" {{/if}}> {{$item.soe_name}}</option>
            {{/foreach}}
			</select>
            </td>
        </tr> 
        
        <tr>
            <th> States/Subrub </th>
           	<td>
            <select name="seller_listing[sl_website_type]" class="lrg" style="width:150px;">
        	{{foreach from=$states key="key" item="item"}}
            	<option value="{{$item.s_id}}" {{if $item.s_id == $detail.sl_website_type}} selected="selected" {{/if}}> {{$item.s_shortcodes}}</option>
            {{/foreach}}
			</select>
             </td>
        </tr> 
        
        <tr>
            <th> Update Date :</th>
            <td> <input type="text" name="seller_listing[sl_update_date]" value="{{$detail.sl_update_date}}" class="w16em dateformat-d-ds-m-ds-Y"/> </td>
        </tr> 
 
         <tr>
            <th> Adv Link :</th>
            <td> <input type="text" name="seller_listing[sl_link]" value="{{$detail.sl_link}}" size="80" /> </td>
        </tr>        
        
        <tr>
            <th> Status :</th>
            <td> <select name="seller_listing[sl_status]" class="lrg" style="width:150px;">
        	     <option value="1" {{if $detail.sl_status == 1}} selected="selected" {{/if}}> Active </option>
               	 <option value="0" {{if $detail.sl_status == 0}} selected="selected" {{/if}}> InActive </option>
          		 </select> </td>
        </tr>
        <tr>
               <td colspan="2" style="text-align:center;">
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
    frmvalidator.addValidation("seller_listing[sl_business_id]","req", "Please specify Valid Business Name.");
    frmvalidator.addValidation("seller_listing[sl_adv_name]","req", "Please specify Business Advertised Name.");
	frmvalidator.addValidation("seller_listing[sl_current_price]","req", "Please specify Current Price.");
	frmvalidator.addValidation("seller_listing[sl_current_price]","numeric", "Current Price must be Numeric.");
    frmvalidator.addValidation("seller_listing[sl_update_date]","req", "Please specify Update Date.");
	frmvalidator.addValidation("seller_listing[sl_link]","req", "Please specify Advertised Link.");
</script>