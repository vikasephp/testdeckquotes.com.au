<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tabview/tabcontent.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/tabview/tabcontent.js">  </script>
<!--Ajax Common function-->
<script type="text/javascript">
 
	    var geturl= "{{$BASE_URL}}{{$XFA.doclist}}?dhd_dh_id="; // The server-side script
		var getdelurl= "{{$BASE_URL}}{{$XFA.docdelete}}?btdl_docs_id="; // The server-side script
   		
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
			var docurl = geturl + dochubid+"&random=" + Math.random();	
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
       
        function delete_docfile(id) { 
		if(!confirm('Are you sure want to delete.')) return false;
    		var docurl = getdelurl + id+"&random=" + Math.random();	
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
<div align="center" id="viewcma-table">
  <h3 class="page-title">{{$title}}</h3>
  {{if !$opr}}
  <form name="detail" method="post" action="{{$XFA.detail}}" enctype="multipart/form-data">
    <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" id="dh_id"/>
     <input type="hidden" name="{{$TABLE}}[c_user_id]" value="{{$detail.c_user_id}}" id="dh_id"/>
    <table id="viewcma-table" width="100%" cellpadding="0" cellspacing="0" border="0">
      <tr>
        <th>Business Name:</th>
        <td colspan="6"><input type="text" name="{{$TABLE}}[c_business_name]" value="{{$detail.c_business_name}}" style="width:700px;"/></td>
      </tr>
     <tr>
        <th>Status:</th>
        <td><select name="{{$TABLE}}[c_status]" class="lrg" style="width:150px;">
            	{{foreach from=$status key="key" item="item"}}
            <option value="{{$item.st_id}}" {{if $item.st_id == $detail.c_status}} selected="selected" {{/if}}> {{$item.st_name}}</option>
          		{{/foreach}} 
          </select>
        </td>
        <th>Location:</th>
        <td><select name="{{$TABLE}}[c_location]" class="lrg" style="width:150px;" onchange="submit();">
        	<option value="0">--select--</option>
       		 {{foreach from=$states key="key" item="item"}}
     	    <option value="{{$item.s_id}}" {{if $item.s_id == $detail.c_location}} selected="selected" {{/if}}> {{$item.s_shortcodes}} - {{$item.s_name}}</option>
      		{{/foreach}}
          </select>
          
        </td>
        <th>City:</th>
        <td><select name="{{$TABLE}}[c_city]" class="lrg" style="width:150px;">
        <option value="0">--select--</option>
       		 {{foreach from=$cities key="key" item="item"}}
     	    <option value="{{$item.s_id}}" {{if $item.s_id == $detail.c_city}} selected="selected" {{/if}}>{{$item.s_name}}</option>
      		{{/foreach}}
          </select>
        </td>
      </tr>
      <tr>
        <th>Date Listed:</th>
       <td><input type="text" name="{{$TABLE}}[c_date_listed]" value="{{$detail.c_date_listed}}" size="20" maxlength="25" class="w16em dateformat-d-ds-m-ds-Y" readonly="readonly"/></td>
       <th> Date Exchanged:</th>
       <td><input type="text" name="{{$TABLE}}[c_date_exchanged]" value="{{$detail.c_date_exchanged}}" size="20" maxlength="25" class="w16em dateformat-d-ds-m-ds-Y" readonly="readonly"/></td>
       <th> Date Sold:</th>
       <td><input type="text" name="{{$TABLE}}[c_date_sold]" value="{{$detail.c_date_sold}}" size="20" maxlength="25" class="w16em dateformat-d-ds-m-ds-Y" readonly="readonly"/></td>
      </tr>
      <tr>
        <th>Description:</th>
        <td colspan="6"><textarea rows="8" cols="145" name="{{$TABLE}}[c_long_description]">{{$detail.c_long_description}}</textarea>
        </td>
      </tr>
       <tr>
        <th>Price:</th>
       <td><input type="text" name="{{$TABLE}}[c_price]" value="{{$detail.c_price}}" size="20" maxlength="25" /></td>
       <th>Initial Price:</th>
       <td><input type="text" name="{{$TABLE}}[c_initial_price]" value="{{$detail.c_initial_price}}" size="20" maxlength="25" /></td>
       <th>Sale Price:</th>
       <td><input type="text" name="{{$TABLE}}[c_sale_price]" value="{{$detail.c_sale_price}}" size="20" maxlength="25" /></td>
      </tr>
       <tr>
       <th>Agent:</th>
       <td><input type="text" name="{{$TABLE}}[c_agent]" value="{{$detail.c_agent}}" size="30"  /></td>
       <th>Agency:</th>
       <td><input type="text" name="{{$TABLE}}[c_agency]" value="{{$detail.c_agency}}" size="30" /></td>
       <th>Industry:</th>
        <td><select name="{{$TABLE}}[c_industry]" class="lrg" style="width:150px;">
        <option value="0">--Select--</option>
         {{foreach from=$industries key="key" item="item"}}
     	    <option value="{{$item.ind_id}}" {{if $item.ind_id == $detail.c_industry}} selected="selected" {{/if}}> {{$item.ind_name}}</option>
      		{{/foreach}}
          </select>
        </td>
      </tr>
       <tr>
        <th>Source:</th>
        <td colspan="6"><select name="{{$TABLE}}[c_soe_id]" class="lrg" style="width:250px;">
        <option value="0">--Select--</option>
         {{foreach from=$sources key="key" item="item"}}
     	    <option value="{{$item.soe_id}}" {{if $item.soe_id == $detail.c_soe_id}} selected="selected" {{/if}}> {{$item.soe_name}}</option>
      		{{/foreach}}
          </select></td>
      </tr>
       <tr>
        <th>Data Source:</th>
        <td colspan="6"><input type="text" name="{{$TABLE}}[c_data_source]" value="{{$detail.c_data_source}}" style="width:700px;"/></td>
      </tr>
      <tr>
        <th>Image:</th>
        <td colspan="6"><input type="file" name="docs" /></td>
      </tr>
      <tr>
        <th colspan="8"><div id="doc_list" style="height:auto; padding-bottom:10px; min-height:40px;"></div></th>
      </tr>
      <tr>
        <td colspan="8" style="text-align:center;"><input type="submit" name="subAddDetail" value="Save" class="vsml" />
          <input type="button" name="btnCancelDetail" value="Cancel" onclick="javascript:parent.$.fancybox.close();" class="vsml" />
        </td>
      </tr>
    </table>
  </form>
  {{else}}
  <div style="font-size:24px; height:99px; padding-top:150px;">{{$opr}}</div>
  {{/if}} </div>
{{if !$opr}}
<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("detail");
    frmvalidator.EnableMsgsTogether();
    frmvalidator.addValidation("{{$TABLE}}[c_business_name]","req", "Please specify title.");
</script>
{{/if}}