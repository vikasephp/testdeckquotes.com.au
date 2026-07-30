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
<h3 class="page-title">Position Matrix Content</h3>
   							
   
   {{if !$opr}}
   
 <form name="detail" method="post" action="{{$XFA.detail}}" enctype="multipart/form-data">
 <input type="hidden" name="pm[pm_id]" value="{{$detail.$ID}}" id="dh_id"/>
     <table id="viewdoc-table" width="100%" cellpadding="0" cellspacing="0" height="500" style="border:1px solid #CCC;">
     
        <tr>
            <th> Position:</th>
            <td> <select name="pm[pm_position]">
            	    {{foreach from=$positions key="key" item="item"}}
                    <option value="{{$item.p_id}}" {{if $detail.pm_position == $item.p_id}} selected="selected" {{/if}}>{{$item.p_name}}</option>
              	     {{/foreach}}
            </select>
            
            </td>
        </tr>
        
        <tr>
            <th> Award:</th>
            <td colspan="3"> <input type="url" name="pm[pm_award]" value="{{$detail.pm_award}}" style="width:800px;" placeholder="Enter url with http"/>
            </td>
        </tr>
       
        <tr>
            <th> Rectuitment Text:</th>
            <td> <!--<input type="file" name="docs_1" />-->
            <input type="text" name="pm[pm_recruitment_text_link]" value="{{$detail.pm_recruitment_text_link}}" style="width:400px;" />
            </td>
       
            <th> Key Result Statement:</th>
            <td> <!--<input type="file" name="docs_2" />-->
				<table border="1">
					<tr>
						<td> Master Document Link:<br/>
							<input type="text" name="pm[pm_key_result_stm_link]" value="{{$detail.pm_key_result_stm_link}}" style="width:400px;" />
						</td>
					</tr>
					<tr>
						<td> Public Document:<br/>
							<input type="text" name="pm[pm_key_result_stm_link_public]" value="{{$detail.pm_key_result_stm_link_public}}" style="width:400px;" />
						</td>
					</tr>
				</table>
            </td>
        </tr>
        
       <tr>
            <th> Position Agreement:</th>
            <td> <!--<input type="file" name="docs_3" />-->
             <input type="text" name="pm[pm_pos_agreement_link]" value="{{$detail.pm_pos_agreement_link}}" style="width:400px;" />
            </td>
        
            <th> Letter Of Offer:</th>
            <td> <!--<input type="file" name="docs_4" /> -->
				<table border="1">
					<tr>
						<td> Master Document Link:<br/>
							<input type="text" name="pm[pm_letter_of_offer_link]" value="{{$detail.pm_letter_of_offer_link}}" style="width:400px;" />
						</td>
					</tr>
					<tr>
						<td> Public Document:<br/>
							<input type="text" name="pm[pm_letter_of_offer_link_public]" value="{{$detail.pm_letter_of_offer_link_public}}" style="width:400px;" />
						</td>
					</tr>
				</table>
            </td>
        </tr>
        
		<tr>
            <th> Training Plan:</th>
            <td colspan="3"> <!--<input type="file" name="docs_5" />-->
				<table border="1">
					<tr>
						<td> Master Document Link:<br/>
							<input type="text" name="pm[pm_training_plan_link]" value="{{$detail.pm_training_plan_link}}" style="width:400px;" />
						</td>
					</tr>
					<tr>
						<td> Public Document:<br/>
							<input type="text" name="pm[pm_training_plan_link_public]" value="{{$detail.pm_training_plan_link_public}}" style="width:400px;" />
						</td>
					</tr>
				</table>
            </td>
        </tr>
        
        <tr>
            <th> Open Process Street Recruitment List Link: </th>
            <td colspan="3"> <input type="text" name="pm[pm_recrument_link]" value="{{$detail.pm_recrument_link}}" style="width:800px;" /></td>
        </tr>
        
        <tr>
            <th>Open Process Street Onboarding :</th>
            <td colspan="3"><input type="text" name="pm[pm_onboarding_link]" value="{{$detail.pm_onboarding_link}}" style="width:800px;" /></td>
        </tr>
        
        <tr>
            <th>Current Position Open:</th>
            <td colspan="3"><input type="radio" name="pm[pm_open_position]" value="0" {{if $detail.pm_open_position eq 0 }} checked="checked" {{/if}}/> No &nbsp; &nbsp;
              <input type="radio" name="pm[pm_open_position]" value="1" {{if $detail.pm_open_position eq 1 }} checked="checked" {{/if}}/> Yes
            </td>
        </tr>
       
	   <tr>
			<th>Position Manual :</th>
            <td colspan="3">
				<table border="1">
					<tr>
						<td> Master Document Link:<br/>
							<input type="text" name="pm[pm_position_manual]" value="{{$detail.pm_position_manual}}" style="width:800px;" />
						</td>
					</tr>
					<tr>
						<td> Public Document:<br/>
							<input type="text" name="pm[pm_position_manual_public]" value="{{$detail.pm_position_manual_public}}" style="width:800px;" />
						</td>
					</tr>
				</table>
			</td>
        </tr> 
		
		<tr>
            <th>Story of the Business :</th>
            <td colspan="3">
				<table border="1">
					<tr>
						<td> Master Document Link:<br/>
							<input type="text" name="pm[pm_story_business_link]" value="{{$detail.pm_story_business_link}}" style="width:800px;" />
						</td>
					</tr>
					<tr>
						<td> Public Document:<br/>
							<input type="text" name="pm[pm_story_business_link_public]" value="{{$detail.pm_story_business_link_public}}" style="width:800px;" />
						</td>
					</tr>
				</table>
			</td>
        </tr>
		
		<tr>
            <th>Custom Document :</th>
            <td colspan="3">
				<table border="1">
					<tr>
						<td> Master Document Link:<br/>
							<input type="text" name="pm[pm_custom_development_link]" value="{{$detail.pm_custom_development_link}}" style="width:800px;" />
						</td>
					</tr>
					<tr>
						<td> Public Document:<br/>
							<input type="text" name="pm[pm_custom_development_link_public]" value="{{$detail.pm_custom_development_link_public}}" style="width:800px;" />
						</td>
					</tr>
				</table>
			</td>
        </tr> 
		
		<tr>
            <th>Survey Link :</th>
            <td colspan="3">
				<table border="1">
					<tr>
						<td> General Availability Link:<br/>
							<input type="text" name="pm[pm_survey_link]" value="{{$detail.pm_survey_link}}" style="width:800px;" />
						</td>
					</tr>
					<tr>
						<td> Position Specific Link:<br/>
							<input type="text" name="pm[pm_survey_link_public]" value="{{$detail.pm_survey_link_public}}" style="width:800px;" />
						</td>
					</tr>
				</table>
			</td>
        </tr>
       
         <th width="20%"> Upload Extra Doc:</th> 
          <td colspan="3"> 
          <input type="file" name="extra1" />
          <input type="file" name="extra2" />
          <input type="file" name="extra3" />
          <input type="file" name="extra4" />
          <input type="file" name="extra5" />
          <input type="file" name="extra6" />
          <input type="file" name="extra7" />
          <input type="file" name="extra8" />
          <input type="file" name="extra9" />
          <input type="file" name="extra10" />
          </td>      
  </tr>
  
  <tr>
  <th> Link : </th>  
  <td colspan="3"> <input type="text" name="pm[pm_link1]" value="{{$detail.pm_link1}}" style="width:800px;" />  </td>
  </tr>
  
  <tr>
    <th> Link : </th>
    <td colspan="3"> <input type="text" name="pm[pm_link2]" value="{{$detail.pm_link2}}" style="width:800px;"/></td>
  </tr>  
  <tr>
    <th> Link : </th> 
    <td colspan="3"> <input type="text" name="pm[pm_link3]" value="{{$detail.pm_link3}}" style="width:800px;" /> </td>  
   </tr> 
   
  <tr>
  <th> Link : </th>  
  <td colspan="3"> <input type="text" name="pm[pm_link4]" value="{{$detail.pm_link4}}" style="width:800px;" />  </td>
  </tr>
  
  <tr>
    <th> Link : </th>
    <td colspan="3"> <input type="text" name="pm[pm_link5]" value="{{$detail.pm_link5}}" style="width:800px;"/></td>
  </tr>  
  <tr>
    <th> Link : </th> 
    <td colspan="3"> <input type="text" name="pm[pm_link6]" value="{{$detail.pm_link6}}" style="width:800px;" /> </td>  
   </tr>  
    
               
        <tr><th colspan="2"><div id="doc_list" style="height:auto; padding-bottom:10px; min-height:40px;"></div></th></tr>
        <tr>    <td colspan="2" style="text-align:center;">
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
       // frmvalidator.addValidation("pm[pm_award]","req", "Please specify link.");
    </script>
{{/if}}