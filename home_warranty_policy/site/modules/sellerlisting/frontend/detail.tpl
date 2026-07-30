<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tabview/tabcontent.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/tabview/tabcontent.js">  </script>

<!--Ajax Common function-->
<script type="text/javascript">
 
	    var getcurrenturl= "{{$BASE_URL}}sellerlisting.buslist?bsn_name="; // The server-side script
   		
	function setsalevalue(bus_id, bus_name)
		{
		document.getElementById("bname").value = bus_name;
		document.getElementById("mlbs_id").value = bus_id;
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

{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<div align="center">
<h3 class="page-title">{{$title}}</h3>
   							
   
   {{if !$opr}}
   
 <form name="detail" method="post" action="{{$XFA.detail}}">
 <input type="hidden" name="seller_listing[mlbs_id]" value="{{$detail.$ID}}"/>
     <table id="viewcust-table" width="90%" cellpadding="0" cellspacing="0">
     
        <tr>
            <th> Business Name:</th>
            <td> <input type="text" name="seller_listing[mlbs_business_name]" value="{{$detail.bsn_name}}" size="80" id ="bname" onkeyup="javascript:requestAllBusiness();" autocomplete="off"/>
            <input type="hidden" name="seller_listing[mlbs_business_id]" value="{{$detail.mlbs_business_id}}" id = "mlbs_id" />
            <div id="listofallbusinesses" class="element"></div> </td>
        </tr>
        
        <tr>
            <th width="300"> Current Status :</th>
            <td> <select name="seller_listing[mlbs_current_status]" class="lrg" style="width:250px;">
            	
           {{foreach from=$status key="key" item="item"}}
            	<option value="{{$item.st_id}}" {{if $item.st_id == $detail.bsn_status}} selected="selected" {{/if}}> {{$item.st_name}}</option>
            {{/foreach}}
        	    
  				 </select>
            </td>
        </tr>
        <tr>
            <th> Last buyer feedback :</th>
            <td><textarea rows="10" cols="85" name="seller_listing[mlbs_last_buyer_feedback]">{{$detail.mlbs_last_buyer_feedback}}</textarea> </td>
        </tr>        
         
        <tr>
            <th> Last buyer feedback Date:</th>
            <td> <input type="text" name="seller_listing[mlbs_update_date]" value="{{$detail.mlbs_update_date}}" class="w16em dateformat-d-ds-m-ds-Y"/ readonly="readonly"> </td>
        </tr> 
        
   
  <tr>
            <th> Notes :</th>
            <td>
            <input type="hidden" name="seller_listing[mbsl_id]" value="{{$notesdata.mbsl_id}}"/>
            <textarea rows="10" cols="85" name="seller_listing[mlbs_notes]">{{$notesdata.mbsl_notes}}</textarea> </td>
        </tr> 
              
                <tr>
            <th>Completed By:</th>
            <td> <input type="text" name="seller_listing[mlbs_completedby]" value="{{$detail.mlbs_completedby}}"/> </td>
        </tr> 
        <tr>
               <td colspan="2" style="text-align:center;">
                    <input type="submit" name="subAddDetail" value="Save" class="vsml" />
                    <input type="button" name="btnCancelDetail" value="Cancel" onclick="javascript:parent.close_win();" class="vsml" />
                </td>
            </tr>
            {{if $blnotes}}
            <tr><td colspan="2"><div style="clear:both;">
            				<table  width="100%" border="1">
            						<tr><td width="30"><strong>No.</strong></td><td width="350"><strong>Notes</strong></td>
                                    <td width="100"><strong>Date</strong></td><td width="60"><strong>Action</strong></td></tr>
                                    {{foreach from=$blnotes key="key" item="item"}}
                                    <tr><td>{{counter}}</td><td>{{$item.mbsl_notes}}</td><td>{{$item.mbsl_date|date_format}}</td><td> 
     <a href="{{$BASE_URL}}{{$XFA.detail}}/{{$ID}}/{{$detail.$ID}}/mbsl_id/{{$item.mbsl_id}}" class="various" title="Edit">
                <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>
     <a href="{{$BASE_URL}}{{$XFA.notesdelete}}/{{$ID}}/{{$detail.$ID}}/mbsl_id/{{$item.mbsl_id}}" onclick="javascript:if(!confirm('Are you sure want to delete the notes?')) return false;" title="Delete"><img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/delete.png"/></a></td></tr>	
                                    	
                                    {{/foreach}}
            				</table>
                            </div>
            </td></tr>
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
    frmvalidator.addValidation("seller_listing[mlbs_business_id]","req", "Please specify Valid Business Name.");
	    frmvalidator.addValidation("seller_listing[mlbs_update_date]","req", "Please specify Last buyer feedback Date.");
</script>
{{/if}}