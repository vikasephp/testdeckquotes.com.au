<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tabview/tabcontent.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/tabview/tabcontent.js">  </script>
<!--Ajax Common function-->
<script type="text/javascript">
 
	    var geturl= "{{$BASE_URL}}todolist.doclist?dhd_dh_id="; // The server-side script
		var getdelurl= "{{$BASE_URL}}todolist.docdelete?btdl_docs_id="; // The server-side script
   		
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
<div align="center">
  <h3 class="page-title">{{$title}}</h3>
  {{if !$opr}}
  <form name="detail" method="post" action="{{$XFA.detail}}" enctype="multipart/form-data">
    <input type="hidden" name="bm_listing[{{$ID}}]" value="{{$detail.$ID}}" id="dh_id"/>
     <input type="hidden" name="bm_listing[btdl_creator_id]" value="{{$detail.btdl_creator_id}}" id="dh_id"/>
    <table id="viewtodoc-table" width="100%" cellpadding="0" cellspacing="0">
      <tr>
        <th> Task Name:</th>
        <td colspan="6"><input type="text" name="bm_listing[btdl_title]" value="{{$detail.btdl_title}}" style="width:600px;"/></td>
      </tr>
      <tr>
        <th width="100"> Explain :</th>
        <td colspan="6"><textarea rows="8" cols="115" name="bm_listing[btdl_desc]">{{$detail.btdl_desc}}</textarea>
        </td>
      </tr>
      <tr>
        <th> Responsible:</th>
        <td><select name="bm_listing[btdl_responcible_id]" class="lrg" style="width:120px;">
            
            	{{foreach from=$staff_list key="key" item="item"}}
            	
            <option value="{{$item.user_id}}" {{if $item.user_id == $detail.btdl_responcible_id}} selected="selected" {{/if}}> {{$item.user_name}}</option>
            
          		{{/foreach}}
  				 
          </select>
        </td>
        <th> Urgency:</th>
        <td><select name="bm_listing[btdl_urgency]" class="lrg" style="width:120px;">
            <option value="1" {{if $detail.btdl_urgency == 1}} selected="selected" {{/if}}> Extreme</option>
            <option value="2" {{if $detail.btdl_urgency == 2}} selected="selected" {{/if}}> High</option>
            <option value="3" {{if $detail.btdl_urgency == 3}} selected="selected" {{/if}}> Moderate </option>
            <option value="4" {{if $detail.btdl_urgency == 4}} selected="selected" {{/if}}> Low</option>
          </select>
        </td>
        <th> Status:</th>
        <td><select name="bm_listing[btdl_status]" class="lrg" style="width:120px;">
            <option value="0" {{if $detail.btdl_status == 0}} selected="selected" {{/if}}> In progress</option>
            <option value="1" {{if $detail.btdl_status == 1}} selected="selected" {{/if}}> Completed</option>
          </select>
        </td>
      </tr>
      <tr>
        <th> Date Create:</th>
        <td><input type="text" name="bm_listing[btdl_create_date]" value="{{$detail.btdl_create_date}}" size="20" maxlength="25" class="w16em dateformat-d-ds-m-ds-Y" readonly="readonly"/></td>
        <th>Day count:</th>
        <td>{{$detail.btdl_count_day|default:"0"}} Day(s)</td>
        <th> Date Due:</th>
        <td><input type="text" name="bm_listing[btdl_due_date]" value="{{$detail.btdl_due_date}}" size="20" maxlength="25" class="w16em dateformat-d-ds-m-ds-Y" readonly="readonly"/></td>
      </tr>
      <tr> </tr>
      <tr>
        <th> Notes:</th>
        <td colspan="6"><textarea rows="8" cols="115" name="bm_listing[btdl_notes]">{{$detail.btdl_notes}}</textarea>
        </td>
      </tr>
      <tr>
        <th>Attachment:</th>
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
    frmvalidator.addValidation("bm_listing[btdl_title]","req", "Please specify title.");
</script>
{{/if}}