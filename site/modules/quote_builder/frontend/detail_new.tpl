<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<link rel="stylesheet" href="{{$BASE_URL}}js/datalist/styledatalist.css"/>

	<script src="{{$BASE_URL}}ckeditor2/ckeditor.js"></script>
	<script src="{{$BASE_URL}}ckeditor2/samples/js/sample.js"></script>

	<script type="text/javascript">
           CKEDITOR.replace( 'editor1' );
           CKEDITOR.add  
        </script>

<script>
		!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>


{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<div align="center" style="min-height:350px;">
    <h3 class="page-title">{{$title}}</h3>    
   
   
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<table id="list-table" width="90%">
    <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
   <!-- <input type="hidden" name="{{$TABLE}}[qb_supplier_email]" value="{{$detail.qb_supplier_email}}" />-->
    <input type="hidden" name="{{$TABLE}}[show]" value="{{$show}}" />
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
  
     

     <tr>
     <th>Project</th>
     <td>
   	<datalist id='project'>
           {{foreach from=$projdetail key="key3" item="item3"}}
            <option value="{{$item3.bsn_name}}" {{if $bsnid eq $item3.bsn_id}} selected="selected" {{/if}}>
            {{$item3.bsn_name}}
            </option>
            {{/foreach}}
  	 </datalist>
         <input type="text" list = 'project' name="{{$TABLE}}[qb_project]" style ="width:700px" value="{{$detail.qb_project}}" />
         <input type ="submit" name="projsubmit" value="Submit"   />
      </td>
    </tr>

     {{foreach from=$listnew key="key" item="item"}}
    
     <tr>
     <th>{{$item.supplier}}
     <input type="hidden" name="{{$TABLE}}[supplier][{{$item.co_id}}]" value="{{$item.supplier}}"  />
     </th>
     <td>
     <table id="list-table" class="nav-back" width="100%">
        <thead>
            <tr>
          
                   <th class="topmenu" align="center" valign="middle" width="7%">Positions</th>   
            	   <th class="topmenu" align="center" valign="middle" width="7%">First Name</th>   
                   <th class="topmenu" align="center" valign="middle" width="7%">Surname</th> 
                   <th class="topmenu" align="center" valign="middle" width="6%">Mobile</th> 
                   <th class="topmenu" align="center" valign="middle" width="6%">Primary Email</th> 
                   <th class="topmenu" align="center" valign="middle" width="5%">Include</th>  
                     
            </tr>
        </thead>
        {{foreach from=$item.contacts key="key2" item="item2"}}
        <tr>
        <td>{{$item2.cs_position}}</td> 
   	<td>{{$item2.cs_first_name}} </td>
        <td>{{$item2.cs_surname}}</td>
        <td>{{$item2.cs_mobile}}</td>
        <td>{{$item2.cs_primary_email}}</td>
        <td> <input type="checkbox" name="{{$TABLE}}[cont][{{$item2.cs_id}}]" value="{{$item2.cs_primary_email}}|{{$item.co_id}}" {{if strpos($detail.qb_supplier_email,$item.cs_primary_email)!==false}} checked="checked" {{/if}} /> 
        </td>
        </tr>
        {{/foreach}}
        
      </table>  
   
     </td>
     </tr>
     {{/foreach}}
    	
   
   
   
   <tr>
   <th>Component</th>
   <td> 
    <select name="{{$TABLE}}[qb_component]"  Onchange = "show_message(this.value)">
        <option value="-1" {{if $detail.qb_component eq -1}} selected="selected" {{/if}}>Please Select </option>
        {{foreach from = $cdetail key="key2" item="item2"}}
        <option value="{{$item2.qb_id}}" {{if $item2.qb_id eq $detail.qb_component }} selected="selected" {{/if}}>{{$item2.qb_component}}</option>
        {{/foreach}}
    </select>
      <script language="javascript">
	
	function show_message(id)
	{
		
		 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}quote_builder.show_message/qb_id/"+id,
					   success: function(result){
						  
						  // $("#editor11").html(result);
						
						   CKEDITOR.instances['editor1'].setData(result);
						   
					}
				});
			
	}
	
	</script>
   
   </td>
   </tr>
   
  
  
<tr>
<th> {{if !empty($docdata)}} 
        <a href="javascript:appendRowProjDoc()"  value="Add New">Add New Project Document </a>
     {{else}}
     	Select Project Document
     {{/if}}   
</th>
<td colspan="7">
	
         {{if empty($detail.qb_id)}}	
         	{{foreach from = $dataDef key = "k0" item = "i0"}}
         	{{$i0.admin_doc_name}}<br />
         	{{/foreach}} 
         {{/if}}
         
         {{foreach from = $docs_added key = "k" item = "i"}}
         {{$i.admin_doc_name}}
          <a href="{{$BASE_URL}}quote_builder.docchkdelete/id/{{$detail.qb_id}}/doc_id/{{$i.admin_doc_id}}"><img src="{{$BASE_URL}}/css/admin/images/deletecross.png" /></a>

         <br />
         {{/foreach}}      
		
        {{if !empty($docdata)}} 
        <div id="pdoc">
      
                <datalist id='projectdocs' >
          
                {{foreach from=$docdata key="key2" item="item2"}}
                <option value="{{$item2.admin_doc_id}}|{{$item2.admin_doc_name}}">{{$item2.admin_doc_name}} </option>
                {{/foreach}}
           
                </datalist>
        
        </div>
        {{else}}
        	<span style="color:#F00;">There are no project documents uploaded for this Project</span>
        {{/if}}

</td>
</tr>
    
  <tr>
  <th> Upload Attachment </th> 
  <td> <b>1.&nbsp;</b><input type="file" name="attach_1" />
        <b>2.&nbsp;</b><input type="file" name="attach_2" />
        <b>3.&nbsp;</b><input type="file" name="attach_3" /><br />
        <b>4.&nbsp;</b><input type="file" name="attach_4" />
        <b>5.&nbsp;</b><input type="file" name="attach_5" />
        <b>6.&nbsp;</b><input type="file" name="attach_6" /><br />
        <b>7.&nbsp;</b><input type="file" name="attach_7" />
        <b>8.&nbsp;</b><input type="file" name="attach_8" />
        <b>9.&nbsp;</b><input type="file" name="attach_9" /><br />
        <b>10.&nbsp;</b><input type="file" name="attach_10" />
  </td>      
  </tr>
  <tr>
  <th>Attachment Preview</th>
  <td>
   {{if $detail.qb_attachment_1}}
     <div style="text-align:left;">
   <!--  Attachment 1 :  <a href="https://deckquote.s3.amazonaws.com/files/uploads_2023/{{$detail.qb_attachment_1}}" target="_blank">Preview</a>-->
     Attachment 1 :  <a href="/quote_builder.download_content?file_name={{$detail.qb_attachment_1}}&module_name=quote_builder.home">Preview</a>
     
     <a href="{{$BASE_URL}}quote_builder.docdelete/id/{{$detail.qb_id}}/p/1"><img src="{{$BASE_URL}}/css/admin/images/deletecross.png" /></a>
     </div>
   {{/if}}
   
    {{if $detail.qb_attachment_2}}
     <div style="text-align:left;">
    <!-- Attachment 2 :  <a href="https://deckquote.s3.amazonaws.com/files/uploads_2023/{{$detail.qb_attachment_2}}" target="_blank">Preview</a>-->
     Attachment 2 :  <a href="/quote_builder.download_content?file_name={{$detail.qb_attachment_2}}&module_name=quote_builder.home">Preview</a>
     
    <a href="{{$BASE_URL}}quote_builder.docdelete/id/{{$detail.qb_id}}/p/2"><img src="{{$BASE_URL}}/css/admin/images/deletecross.png" /></a>
</div>
   {{/if}}
   
    {{if $detail.qb_attachment_3}}
     <div style="text-align:left;">
     <!--Attachment 3 :  <a href="https://deckquote.s3.amazonaws.com/files/uploads_2023/{{$detail.qb_attachment_3}}" target="_blank">Preview</a>-->
     Attachment 3 :  <a href="/quote_builder.download_content?file_name={{$detail.qb_attachment_3}}&module_name=quote_builder.home">Preview</a>
     
    <a href="{{$BASE_URL}}quote_builder.docdelete/id/{{$detail.qb_id}}/p/3"><img src="{{$BASE_URL}}/css/admin/images/deletecross.png" /></a>
</div>
   {{/if}}
   
    {{if $detail.qb_attachment_4}}
     <div style="text-align:left;">
    <!-- Attachment 4 :  <a href="https://deckquote.s3.amazonaws.com/files/uploads_2023/{{$detail.qb_attachment_4}}" target="_blank">Preview</a>-->
     Attachment 4 :  <a href="/quote_builder.download_content?file_name={{$detail.qb_attachment_4}}&module_name=quote_builder.home">Preview</a>
     
    <a href="{{$BASE_URL}}quote_builder.docdelete/id/{{$detail.qb_id}}/p/4"><img src="{{$BASE_URL}}/css/admin/images/deletecross.png" /></a>
</div>
   {{/if}}
   
    {{if $detail.qb_attachment_5}}
     <div style="text-align:left;">
    <!-- Attachment 5 :  <a href="https://deckquote.s3.amazonaws.com/files/uploads_2023/{{$detail.qb_attachment_5}}" target="_blank">Preview</a>-->
     Attachment 5 :  <a href="/quote_builder.download_content?file_name={{$detail.qb_attachment_5}}&module_name=quote_builder.home">Preview</a>
     
     <a href="{{$BASE_URL}}quote_builder.docdelete/id/{{$detail.qb_id}}/p/5"><img src="{{$BASE_URL}}/css/admin/images/deletecross.png" /></a>
    </div>
   {{/if}} 
    
    
    {{if $detail.qb_attachment_6}}
     <div style="text-align:left;">
     <!--Attachment 6 :  <a href="https://deckquote.s3.amazonaws.com/files/uploads_2023/{{$detail.qb_attachment_6}}" target="_blank">Preview</a>-->
     Attachment 6 :  <a href="/quote_builder.download_content?file_name={{$detail.qb_attachment_6}}&module_name=quote_builder.home">Preview</a>
     
     <a href="{{$BASE_URL}}quote_builder.docdelete/id/{{$detail.qb_id}}/p/5"><img src="{{$BASE_URL}}/css/admin/images/deletecross.png" /></a>
    </div>
   {{/if}} 
   
   {{if $detail.qb_attachment_7}}
     <div style="text-align:left;">
     <!--Attachment 7 :  <a href="https://deckquote.s3.amazonaws.com/files/uploads_2023/{{$detail.qb_attachment_7}}" target="_blank">Preview</a>-->
     Attachment 7 :  <a href="/quote_builder.download_content?file_name={{$detail.qb_attachment_7}}&module_name=quote_builder.home">Preview</a>
     
     <a href="{{$BASE_URL}}quote_builder.docdelete/id/{{$detail.qb_id}}/p/5"><img src="{{$BASE_URL}}/css/admin/images/deletecross.png" /></a>
    </div>
   {{/if}} 
   
   {{if $detail.qb_attachment_8}}
     <div style="text-align:left;">
    <!-- Attachment 8 :  <a href="https://deckquote.s3.amazonaws.com/files/uploads_2023/{{$detail.qb_attachment_8}}" target="_blank">Preview</a>-->
     Attachment 8 :  <a href="/quote_builder.download_content?file_name={{$detail.qb_attachment_8}}&module_name=quote_builder.home">Preview</a>
     
     <a href="{{$BASE_URL}}quote_builder.docdelete/id/{{$detail.qb_id}}/p/5"><img src="{{$BASE_URL}}/css/admin/images/deletecross.png" /></a>
    </div>
   {{/if}} 
   
   {{if $detail.qb_attachment_9}}
     <div style="text-align:left;">
     <!--Attachment 9 :  <a href="https://deckquote.s3.amazonaws.com/files/uploads_2023/{{$detail.qb_attachment_9}}" target="_blank">Preview</a>-->
     Attachment 9 :  <a href="/quote_builder.download_content?file_name={{$detail.qb_attachment_9}}&module_name=quote_builder.home">Preview</a>
     
     <a href="{{$BASE_URL}}quote_builder.docdelete/id/{{$detail.qb_id}}/p/5"><img src="{{$BASE_URL}}/css/admin/images/deletecross.png" /></a>
    </div>
   {{/if}} 
   
   {{if $detail.qb_attachment_10}}
     <div style="text-align:left;">
  <!--   Attachment 10 :  <a href="https://deckquote.s3.amazonaws.com/files/uploads_2023/{{$detail.qb_attachment_10}}" target="_blank">Preview</a>-->
     Attachment 10 :  <a href="/quote_builder.download_content?file_name={{$detail.qb_attachment_10}}&module_name=quote_builder.home">Preview</a>
     <a href="{{$BASE_URL}}quote_builder.docdelete/id/{{$detail.qb_id}}/p/5"><img src="{{$BASE_URL}}/css/admin/images/deletecross.png" /></a>
    </div>
   {{/if}} 
        
  </td>
  </tr> 

   
   <tr>
   <th>Message</th>
   <td> 
     <textarea rows="5" cols="100" name="{{$TABLE}}[qb_message]" id="editor1"  class="ckeditor">{{$detail.qb_message}}</textarea>
   </td>
   </tr>
  
    <tr>
        <td colspan="2" style="text-align:center;">
          <input type="submit" name="subAddDetail" value="Save" class="vsml" />
          <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
        </td>
    </tr>
</table>
</form>
  
   <script type="text/javascript">
 				
				var y=1;
				function appendRowProjDoc()
				{
					
					var nm = "{{$TABLE}}[bsn_document]["+ y++ +"]";
				        
				        var input =  $("<input type = 'text' list='projectdocs' name="+ nm+"><br>");
					input.css({'width':'550px','margin-left':'5px'});
					$('#pdoc').append(input);
				}
				
 </script>
    
    <script type="text/javascript">
		function closepop()
		{
		setTimeout('parent.close_win();', 500);
		}
	</script>
    
	<script type="text/javascript" language="javascript" >
        var frmvalidator  = new Validator("detail");
			frmvalidator.EnableMsgsTogether();
			frmvalidator.addValidation("{{$TABLE}}[wa_project]","req", "Please specify project.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_company_name]","req", "Please specify company name.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_contact_name]","req", "Please specify contact name.");
    </script>
</div>

<script>
	initSample();
</script>

<script type="text/javascript" src="{{$BASE_URL}}js/datalist/datalist.polyfill.min.js"></script>