<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>

<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
	google.load("jquery", "1");
</script>

	<script src="{{$BASE_URL}}ckeditor2/ckeditor.js"></script>
	<script src="{{$BASE_URL}}ckeditor2/samples/js/sample.js"></script>

	<script type="text/javascript">
           CKEDITOR.replace( 'editor1' );
           CKEDITOR.add  
        </script>
   

 

<div align="center">
    <h3 class="page-title">{{$title}}</h3>    
    <form name="detail" method="post" action="" enctype="multipart/form-data">
        <table id="list-table" width="90%" >
            <input type="hidden" name="data[bst_id]" value="{{$detail.bst_id}}" />
<!--            <tr>
                <th width="20%">Project Status:</th>
                <td width="80%">
          <select name="data[bst_business_status_id]" class="lrg">
          <option value="">-- Select --</option>
          {{foreach from=$busness_status item=item key=key}}
		  <option value="{{$item.st_id}}" {{if $detail.bst_business_status_id == $item.st_id OR $current_bst_business_status_id == $item.st_id}} selected="selected" {{/if}}>{{$item.st_name}}</option>{{/foreach}}</select>
              </td>
          </tr>-->
          <tr><th width="20%">Assign To Design Types:</th>
              <td width="80%">
                  <div class="bsearch_scroll_div1">                 
                <ul style="margin: 0; padding: 0;">
                {{foreach from=$busness_types item=item key=key}}
                <li>{{$item.pt_name}}
               <div><input type="radio" name="data[bst_business_types][{{$item.pt_id}}]" value="1" {{foreach from=$detail.bst_business_types item="item1" key="key1"}} {{if $key1 == $item.pt_id && $item1 == 1}} checked="checked" {{/if}} {{/foreach}}/>&nbsp;Yes&nbsp;
               &nbsp;<input type="radio" name="data[bst_business_types][{{$item.pt_id}}]" value="0" {{foreach from=$detail.bst_business_types item="item1" key="key1"}} {{if $key1 == $item.pt_id && $item1 == 0}} checked="checked" {{/if}} {{/foreach}}/>&nbsp;No</div>
                </li>
                {{/foreach}}
                </ul>
                </div>
             </td>
          </tr>
          <tr>
                <th>Task Name:</th>
                <td><input type="text" name="data[bst_task_name]" value="{{$detail.bst_task_name}}" class="xxlrg" /></td>
          </tr>
          <tr>
                <th>Instructions:</th>
                <td>
                	<table id="none-table22">
                    	<tr>
                        	<td><textarea cols="106" name="data[bst_instruction]" rows="7" id="editor1" class="ckeditor">{{$detail.bst_instruction|stripslashes}}</textarea></td>
                        </tr>
                    </table>
                </td>
          </tr>


   
            <tr>
            
                <th><a href="javascript:appendRowTaskLink({{$detail.bst_id}})"  value="Add New">Add New Linked Procedure</a>:</th>
                <td>
                
       <div id="lptask">
       {{foreach from = $docdetail  item=itemtp key=keytp}}
       
        <span id="lpt{{$itemtp.btp_id}}">
        <a href="javascript:delete_link_proc_task({{$itemtp.btp_id}})" value="Delete Task Procedure" title="Delete" >
            <img style="margin-top:5px;" src="{{$BASE_URL}}css/admin/images/deletecross.png"/></a>
            {{$itemtp.btp_doc_longtext}} 
              <br />
       </span>
     
 
       {{/foreach}}
      <br />
      
        <datalist id='docstask' >
        {{foreach from=$template_docdetail key="key3" item="item3"}}
        <option value="{{$item3.dhd_name2}} - {{$item3.dh_title}} - Procedure">{{$item3.dhd_name2}} - {{$item3.dh_title}} - Procedure </option>
        {{/foreach}}
        </datalist>
               
        </td>
            
            </tr>   
            <tr>
                <th>Status:</th>
                <td>
                	<select name="data[bst_status]" class="lrg">
                    	<option value="1" {{if $detail.bst_status == '1'}} selected="selected" {{/if}}>Activate</option>
                        <option value="0" {{if $detail.bst_status == '0'}} selected="selected" {{/if}}>Deactivate</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>Task UID:</th>
                <td><input type="text" name="data[bst_task_id]" value="{{if $detail.bst_task_id != 0}}{{$detail.bst_task_id}}{{else}}{{$detail.bst_id}}{{/if}}" class="lrg" readonly="readonly" />
                	<span>{{$bst_tasks_error}}</span>
                </td>
            </tr>
            <tr>
                <th width="20%">Responsible Position:</th>
                <td width="80%">
              <select name="data[bst_posid]" class="lrg">
                	<option value="">-- Select --</option>
            {{foreach from=$positions item=item key=key}}
            <option value="{{$item.p_id}}" {{if $detail.bst_posid == $item.p_id}} selected="selected" {{/if}}>{{$item.p_name}}</option>
            {{/foreach}}</select>
              </td>
          </tr>
         <tr>
         <th>Video Link</th>
         <td><input type="text" name="data[bst_video_link]" value="{{$detail.bst_video_link}}" class="xxlrg" /> </td>
         </tr>
         
         
         <tr> <td colspan="2" align="center" ><h3 class="page-title">Sub Tasks</h3></td> </tr>
         
          <tr> 
          <td colspan="2">  
           
		   <script type="text/javascript">
 
				var x=1
				function appendRow()
				{
					var textarea =  $("<textarea name='data2[subtask"+ x++ +"]'></textarea>");
								
					textarea.css({'width':'600px','height':'30px','box-shadow':'1px 2px 2px 1px #000'});
					$('#div').append(textarea);
				}
				
				var x=1;
				function appendRowLp(bsst_id)
				{
					var nm = "linked_procedure["+bsst_id+"][link"+ x++ +"]";
					var lp = '#lp'+bsst_id;
                   // var input =  $("<input type = 'text' list='docs' name='linked_procedure[link"+ x++ +"]'>");
				    var input =  $("<input type = 'text' list='docs' name="+ nm+">");
					input.css({'width':'750px','margin-left':'50px'});
					$(lp).append(input);
				}
				
				
				var x=1;
				function appendRowTaskLink(bst_id)
				{
					var nm = "data[bst_task_doc_link][link"+ x++ +"]";
				        var input =  $("<input type = 'text' list='docstask' name="+ nm+">");
					input.css({'width':'550px','margin-left':'5px'});
					$('#lptask').append(input);
				}
				
				
				function update_subtask(bsst_id)
				{
					bs = '#st'+bsst_id;
					value = $(bs).val();
					$.ajax({
				    type: "GET",
				 			  
				    url: "{{$BASE_URL}}renovation_task_listAdmin.subtask_save/bsst_id/"+bsst_id+"/value/"+value,
				   // data: "bsn_id =" + id,
				   success: function(result){
					// $("#somewhere").html(result);
				   }
				 });
				}
				
		function delete_link_proc_task(btp_id)
				{
					
					lpt = '#lpt'+btp_id;
					$(lpt).remove();
					
					$.ajax({
				    type: "GET",
				 			  
				    url: "{{$BASE_URL}}/renovation_task_listAdmin.delete_task_procedure/btp_id/"+btp_id,
				   // data: "bsn_id =" + id,
				   success: function(result){
					// $("#somewhere").html(result);
				   }
				 });
			
				}				
				
				
		function delete_link_proc_subtask(bstlp_id)
				{
					lp = '#lpm'+bstlp_id;
					$(lp).remove();
					
					$.ajax({
				    type: "GET",
				 			  
				    url: "{{$BASE_URL}}renovation_task_listAdmin.delete_subtask_lp/bstlp_id/"+bstlp_id,
				   // data: "bsn_id =" + id,
				   success: function(result){
					// $("#somewhere").html(result);
				   }
				 });
			
				}
		
			</script>

			

          <div id="div">
        
    {{if $subtask_detail}}
    
        {{foreach from=$subtask_detail item=item2 key=key2}}
         <a href="{{$BASE_URL}}renovation_task_listAdmin.delete_subtask/bsst_id/{{$item2.bsst_id}}/bst_id/{{$bst_id}}" title="Delete" >
       <img src="{{$BASE_URL}}css/admin/images/deletecross.png"/></a>
        <input type="text" value="{{$item2.bsst_task_name}}" size='100' id="st{{$item2.bsst_id}}" onkeyup="update_subtask({{$item2.bsst_id}});" /> 
                      
        <br />
       
       <div id="lp{{$item2.bsst_id}}">
       
         <div style="background: #FFC; width:78%; padding:5px; border:1px solid #6FF; margin-left:20px;">
        {{foreach from = $subtask_detail_lp  item=itemlp key=keylp name='foo'}}
        {{if $item2.bsst_id eq $itemlp.bstlp_bsst_id}} 
        <span id="lpm{{$itemlp.bstlp_id}}"> 
        <a href="javascript:delete_link_proc_subtask({{$itemlp.bstlp_id}})" value="Delete Procedure" title="Delete" >
        <img style="margin-top:5px;" src="{{$BASE_URL}}css/admin/images/deletecross.png"/></a>
        <a href="{{$BASE_URL}}/files/template_documents_hub/{{$itemlp.bstlp_doc_name}}" style="color:#06C;">{{$itemlp.bstlp_option_text}}</a> &nbsp;
        <br /> 
        </span>
       {{/if}}
     
       {{/foreach}}
       <a href="javascript:appendRowLp({{$item2.bsst_id}})"  value="Add New" title="Add New SubTask">
        <img style="margin-top:5px;" src="{{$BASE_URL}}css/admin/images/addnew.png"/></a>
       <br />
         </div>
       <datalist id='docs' >
       {{foreach from=$template_docdetail key="key3" item="item3"}}
        <option value="{{$item3.dhd_name2}} - {{$item3.dh_title}} - Procedure">{{$item3.dhd_name2}} - {{$item3.dh_title}} - Procedure </option>
        {{/foreach}}
       </datalist>
       <!--<a href="javascript:appendRowLp({{$item2.bsst_id}})"  value="Add New">Add New Linked Procedure</a>-->
        
       </div> <br />
       
       {{/foreach}}
            
       {{/if}}
        
       </div>
  
 		<!--<a href="javascript:addendRow()" onclick ="appendRow()" value="Add New">Add New</a>-->
        <a href="javascript:addendRow()" onclick ="appendRow()" value="Add New">
        <img style="margin-top:5px;" src="{{$BASE_URL}}css/admin/images/addnew.png"/></a>
            
          </td>
          </tr>
          
           <tr> <td colspan="2" align="center" ><h3 class="page-title">Link Email To Proposal Task</h3></td> </tr>
          
          <tr> <td colspan="2">
           <div id="div2"> 
          <script type="text/javascript">
		  var x=1;
				function appendRowEmailTask()
				{
					
					var input = $("<select name='data3[email"+ x++ +"]'>{{foreach from=$email_code key='key4' item='item4'}} <option value='{{$item4.eml_code}}|{{$item4.eml_id}}'>{{$item4.eml_code}}</option>{{/foreach}} "); 
				
			       // var input =  $("<input type = 'text' list='elcode'  name='data3[email"+ x++ +"]'>");
					input.css({'width':'750px','margin-left':'50px'});
					$('#div2').append(input);
				}
				
				
			 function update_emaillink(pel_id)
				{
					bs = '#st'+pel_id;
					value = $(bs).val();
					$.ajax({
				    type: "GET",
				 			  
				    url: "{{$BASE_URL}}renovation_task_listAdmin.emaillink_save/pel_id/"+pel_id+"/value/"+value,
				    success: function(result){
					// $("#somewhere").html(result);
				   }
				 });
				}
				
				
				
		  </script>
          
        {{if $emaillink_detail}}
    
            {{foreach from=$emaillink_detail item=item3 key=key3}}
             <a href="{{$BASE_URL}}renovation_task_listAdmin.delete_emaillink/pel_id/{{$item3.pel_id}}/pel_task_id/{{$bst_id}}" title="Delete" >
                <img src="{{$BASE_URL}}css/admin/images/deletecross.png"/></a>
                <div style="padding-bottom:3px; display:inline-block;">{{$item3.pel_email_linked}}</div>
                <!--<input type="text" value="{{$item3.pel_email_linked}}" size='100' id="st{{$item3.pel_id}}" onkeyup="update_emaillink({{$item3.pel_id}});" /> -->
                <br />
            {{/foreach}}
            
       {{/if}}              
        
       <datalist id='elcode' >
       {{foreach from=$email_code key="key4" item="item4"}}
        <option value="{{$item4.eml_code}}|{{$item4.eml_id}}">{{$item4.eml_code}}</option>
        {{/foreach}}
       </datalist>  
          
                </div> <br />
                  <a href="javascript:addendRow()" onclick ="appendRowEmailTask()" value="Add New">
       				 <img style="margin-top:5px;" src="{{$BASE_URL}}css/admin/images/addnew.png"/></a>
          
          
          </td> </tr>
          
           <tr><td colspan="2" height="20px">&nbsp;</td></tr>
            <tr>
                <td colspan="2" style="text-align:center;">
                    <input type="submit" name="subAddDetail" value="Save" class="vsml" />
                    <input type="button" name="btnCancelDetail" value="Cancel" onclick="document.location.href='{{$BASE_URL}}{{$XFA.list}}'" class="vsml" />
                    {{if $detail.bst_id}}<input type="submit" name="btnassignTasks" value="Assign Tasks" class="lrg" />{{/if}}
                </td>
            </tr>
        </table>
    </form>
</div>

<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("detail");
    frmvalidator.EnableMsgsTogether();
 	frmvalidator.addValidation("data[bst_task_name]","req", "Please specify Task Name");	
</script>