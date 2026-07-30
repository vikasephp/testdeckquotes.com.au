<script src="{{$BASE_URL}}/js/nicedit/nicEdit.js" type="text/javascript"></script>
<script type="text/javascript">
bkLib.onDomLoaded(function() {
	new nicEditor({iconsPath : '{{$BASE_URL}}/js/nicedit/nicEditorIcons.gif', maxHeight : 500}).panelInstance('area5');
});

<!-- Begin Delete attachment -->
	function responselist_attachment()
		{
			if(http.readyState == 4)
			{
				if(http.status == 200)
				{
					var result  = http.responseText;
					if(result){	document.getElementById('rightcolumn').innerHTML = result;}
				}
			}
		}
	
	
	function list_attachment()
	{	
		var et_id = document.getElementById('et_id').value;
		if(et_id>0)
		{
			var ListUrl = "{{$BASE_URL}}{{$XFA.getdelete}}?a_req=" + 'list' + '&et_id=' + et_id + "&random=" + Math.random();
			http.open('GET',ListUrl,true);
			http.onreadystatechange = responselist_attachment;
			http.send(null);
		}
		
	}
<!-- End Delete attachment -->	


<!-- Begin Delete attachment -->
	function responsedelete_attachment()
		{
			if(http.readyState == 4)
			{
				if(http.status == 200)
				{
					var result  = http.responseText;
						if(result){list_attachment();}
				}
			}
		}
	
	
	function delete_attachment(key_id)
			{	
				
					
				var r=confirm("Are U sure want to delete?");
						if (r==true)
						  {
							
								var et_id = document.getElementById('et_id').value;
								if(et_id>0)
								{
									var DelUrl = "{{$BASE_URL}}{{$XFA.getdelete}}?a_req=" + 'delatt' + '&et_id=' + et_id +  '&id=' + key_id + "&random=" + Math.random();
									http.open('GET',DelUrl,true);
									http.onreadystatechange = responsedelete_attachment;
									http.send(null);
								}
						  }	
			}
<!-- End Delete attachment -->	
	
<!-- Begin Ajax comman XMLHttpRequest -->				
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
		var http = getHTTPObject(); //We create the HTTP Object
<!-- End Ajax comman XMLHttpRequest -->	

</script>
<style type="text/css">
#leftcolumn { width: 150px; border: 0px solid red; float: left}
#rightcolumn { width: 540px; border: 1px solid #c1dad7; padding: 10px; float: right; height:175px; overflow:scroll;}
.widthlrg{ width:300px;}
.widthxlrg{ width:800px;}
</style>  
<div class="newdiv">
<h3 class="page-title">{{$title}}</h3>
<br />
<form name="template" method="post" action="" enctype="multipart/form-data">
	<input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" id="et_id" />
	<table id="product-table" align="center" width="98%">
  	<tr><th class="labelhead" width="150">Section:</th>
    		<td><select name="{{$TABLE}}[et_section]" onchange="submit();" class="widthlrg">
    							<option value=""> -- Select section --</option>
                                {{foreach from=$types key="key" item="item"}}
   								 <option value="{{$item.emt_id}}" {{if $section == $item.emt_id}} selected="selected" {{/if}}>{{$item.emt_name}}</option>
                                {{/foreach}}
   								 </select></td></tr>
                                 
                              {{if $B_STATUS}}  
                              	<tr><th class="labelhead">Project Status:</th><td>
                              <select name="{{$TABLE}}[et_task_status]" onchange="submit();" class="widthlrg"> 
                              <option value="0">-- Select--</option>
                                {{foreach from=$B_STATUS key="key" item="item"}}
   								 <option value="{{$item.st_id}}" {{if $item.st_id == $B_STATUS_ID}} selected="selected" {{/if}}>{{$item.st_name}}</option>
                                {{/foreach}}
                                </select>
                              </td></tr>  
                               {{/if}} 
                               
                                     
                              {{if $B_TYPES}}  
                              	<tr><th class="labelhead">Project Type:</th><td>
                              <select name="{{$TABLE}}[et_task_types]" onchange="submit();" class="widthlrg"> 
                              <option value="0">-- Select--</option>
                                {{foreach from=$B_TYPES key="key" item="item"}}
   								 <option value="{{$item.pt_id}}" {{if $item.pt_id == $B_TYPES_ID}} selected="selected" {{/if}}>{{$item.pt_name}}</option>
                                {{/foreach}}
                                </select>
                              </td></tr>  
                               {{/if}} 
                               
                               
                                 
                                 {{if $B_TASKS}}  
                              	<tr><th class="labelhead">Task:</th><td>
                              <select name="{{$TABLE}}[et_task]" class="widthxlrg"> 
                                {{foreach from=$B_TASKS key="key" item="item"}}
   								 <option value="{{$item.bst_id}}" {{if $B_TASKS_ID	 == $item.bst_id}} selected="selected" {{/if}}>{{$item.bst_task_name}}</option>
                                {{/foreach}}
                                </select>
                              </td></tr>  
                               {{/if}}           
                               
                               
                               {{if $B_TYPE_TASKS}}  
                              	<tr><th class="labelhead">Task:</th><td>
                              <select name="{{$TABLE}}[et_type_tasks]" class="widthxlrg"> 
                                {{foreach from=$B_TYPE_TASKS key="key" item="item"}}
   								 <option value="{{$item.bst_id}}" {{if $B_TYPES_ID	 == $item.bst_id}} selected="selected" {{/if}}>{{$item.bst_task_name}}</option>
                                {{/foreach}}
                                </select>
                              </td></tr>  
                               {{/if}}           
                               
                               {{if $name == 'show'}}
     <tr>   <th class="labelhead" >Name:</th>
			<td><input type="text" name="{{$TABLE}}[et_name]" value="{{$detail.et_name}}" class="widthxlrg" /></td>
     </tr>
        {{/if}}  
    <tr>    
			<th class="labelhead">Subject:</th>
			<td><input type="text" name="{{$TABLE}}[et_subject]" value="{{$detail.et_subject}}" class="widthxlrg" /></td>
	</tr>

        <tr>    
			<th class="labelhead" >Template Variables:</th>
			<td><table width="100%">   <tr>
            			{{counter assign="count"}}
            			{{foreach from=$email_temp_vars item="item" key="key"}}
                     
            			<td width="33%"><b>{{$key}}</b> => <span style="color: #009900;">{{$item}}</span></td>
                        {{if $count % 3 == 0}}                      
                        </tr>
                             <tr>
                        {{/if}}
            		{{counter  assign="count"}}
           				 {{/foreach}}
                         </tr>
            </table></td>
	</tr>

    <tr> <th class="labelhead">Body:</th>
    <td>  <table id="none-table22"><tr><td> {{tinymce InstanceName="$TABLE[et_body]" class="et_body" Value=$detail.et_body Cols="140"}}</td>        </tr></table> </td>
    </tr>
   
     {{if $attachment == 'show'}}
    <tr><th class="labelhead">Attachment:<br /></th><td>
    	
 <div id="leftcolumn"><ul style="line-height:40px;">
        <li><input type="file" name="attachment[]" /></li>
        <li><input type="file" name="attachment[]" /></li>
        <li><input type="file" name="attachment[]" /></li>
        <li><input type="file" name="attachment[]" /></li>
        <li><input type="file" name="attachment[]" /></li>
            </ul></div>
<div id="rightcolumn">
{{if $et_attachments}}
			<ul>
		{{foreach from=$et_attachments key="key" item="item"}}
	<li style="border:1px solid #c1dad7; padding:5px;">{{$item|truncate:70}}<div style="float:right;">
    <a href="javascript:delete_attachment('{{$key}}');" title="Delete"><img src="{{$BASE_URL}}css/admin/images/delete.png" /></a></div></li>

	{{/foreach}}
    </ul>
    {{else}}
    <div>No Attachment Found.</div>
    {{/if}}
</div>

        
         </td></tr>
		
    {{/if}}
     <tr>   <th class="labelhead">Status:</th>
			<td> <input type="radio" name="{{$TABLE}}[et_status]" value="0" checked="checked" />:&nbsp;<b>Inactive </b><br /><br />
            	 <input type="radio" name="{{$TABLE}}[et_status]" {{if $detail.et_status == 1}} checked="checked" {{/if}} value="1" />:&nbsp;<b>Active</b>
           </td>
     </tr>
		<tr>
			<td colspan="2" style="text-align:center">
            <input class="addButtons" type="submit" value="{{$button}}" name="subAddDetail">
				&nbsp;
				<input class="addButtons" type="button" value="Cancel" onclick="document.location.href='{{$BASE_URL}}{{$XFA.list}}';">
			</td>
		</tr>
    </table>
</form>
</div>
<script type="text/javascript" language="javascript">
    var frmvalidator  = new Validator("template");
    frmvalidator.EnableMsgsTogether();
    frmvalidator.addValidation("{{$TABLE}}[et_name]",   "req", "Please specify Template Name.");
	frmvalidator.addValidation("{{$TABLE}}[et_subject]","req", "Please specify Template Subject.");
	frmvalidator.addValidation("{{$TABLE}}[et_body]",   "req", "Please specify Template Body.");
	
</script>
