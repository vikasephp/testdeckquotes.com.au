
{{if !empty($taskmsg)}}{{$taskmsg}}{{/if}}

{{ if empty($action_name)  }}
<div style="font-style:bold; text-align:left; padding:5px;">
    &nbsp;
</div>


 {{foreach from=$project_checklist_list item=item_c key=key}}
 <br><br>
     <!-- <h1>CheckList Unique Number : {{ $item_c.dpn_unique_id }}</h1>  -->
        <table cellpadding="5" border="1" cellspacing="0" width="100%">
          <tr>
            <th width="15%">Action</th>
            <th width="15%">Utilities</th>
          <!--  <th width="15%">Checklist</th>  -->
            <th width="14%">Status</th>
            <th width="15%">Date we Applied</th>
            <th width="18%">Assessment Doc</th>
            <th width="18%">Conditions Imposed Snapshot</th>
          </tr>
           <form name="nr" method="post" action="">
          {{foreach from=$item_c.checklist_entities_referral item=item key=key}}
         
            <tr {{if $item.pc_required eq 10}} style="background:#F00;" {{/if}} id="req_color{{$item.pc_id}}" >
                
           <td style="text-align:center;">
                    <a href="javascript:requestchecklistEntitiesList('ppchecklist_entites_edit','{{$business_id}}','{{ $item.checklist_entities_referral.id }}','{{ $item.er_document }}','{{ $item.er_id }}','{{ $item_c.dpn_unique_id }}');">
                       <img style="height: 20px;; width:20px" src="{{$BASE_URL}}css/admin/images/edit.png">
                    </a>
           </td>
          <td style="text-align:center;">
              
             {{ $item.er_document }}
            </td>
            
          <!--  <td style="text-align:center;">
              {{ $item_c.dpn_unique_id }}
                  
            </td>  -->
            
            <td style="text-align:center;">
                {{ $item.checklist_entities_referral.status }}
            </td>
            
            <td style="text-align:center;">
                {{if !empty($item.document_check_list.doc_file_name) }}
                  {{ $item.document_check_list.doc_date_uploaded }}
                {{/if}}

                {{if empty($item.document_check_list.doc_file_name) }}
                  {{ $item.checklist_entities_referral.date_applied }}
                {{/if}}
            </td>
            
            <td style="text-align:center;">
              {{if !empty($item.document_check_list.doc_file_name) }}
                <a href="/business.download_content?file_name={{ $item.document_check_list.doc_file_name }}&module_name=business.detail" target="_blank">Download</a>
              {{/if}}

              {{if !empty($item.checklist_entities_referral.assessment_doc) && empty($item.checklist_entities_referral.assessment_doc) }}
                <a href="/business.download_content?file_name={{ $item.checklist_entities_referral.assessment_doc }}&module_name=business.detail" target="_blank">Download</a>
              {{/if}}
            </td>
            
            <td>
                 {{if !empty($item.checklist_entities_referral.condition_snapshot) }}
                <a href="/business.download_content?file_name={{ $item.checklist_entities_referral.condition_snapshot }}&module_name=business.detail" target="_blank">Download</a>
                {{/if}}
            </td>
        
          </tr>
          {{/foreach}}
        
         
         <!-- <td> <input type="submit" name="add_doc_mini" value="Add New Document" /></td>-->
          </tr>
          </form>
        </table>
  {{/foreach}}
{{/if}}
{{$ppchecklist_entites}}
{{if !empty($iframe_msg)}}
<script>
	parent.hideiFrame('ppcheckListIframe','');
	parent.requestPPCheckList();
</script>
{{/if}}

{{if !empty($action_name) and $action_name == 'ppchecklist_entites_edit' }}
<!--------------- Begin iframe_data ------->
<link rel="stylesheet" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script
  src="https://code.jquery.com/jquery-2.2.4.min.js"
  integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
  crossorigin="anonymous"></script>
<div style="border:1px #CCCCCC solid; padding:5px;" id="checkListIframe"  >
  <script>
function remove_img()
	{
		document.getElementById('doc_file_name_temp').value = '';
		document.getElementById('label_doc_file_name_temp').style.visibility = 'hidden';
		document.getElementById('crossimg').style.visibility = 'hidden';
	}
</script>
  <form action="" id="checklist_entities_referral" method="POST" enctype="multipart/form-data" name="checklist_entities_referral45">
    <input type="hidden" id="bsn_id" name="bsn_id" value="{{$business_id}}" />
    <input type="hidden" id="er_id_doc12" name="er_id" value="{{$er_id}}" />
    <input type="hidden" id="er_id_doc12" name="checklist_id" value="{{$checklist_id}}" />
    
    
    
    <input type="hidden" id="entities_referral_id" name="entities_referral_id" value="{{$checklist_entities_referral_id}}" />
     <input type="hidden" id="checklist_entities_referralForm" name="action" value="checklist_entities_referralForm" />
    <table cellpadding="0" cellspacing="0" class="table" id="upload_file_business_11"  >
      <tr>
        <td><strong>Utilities:</strong></td>
        <td style="background-color:#E0E6FF;padding:5px; font-size:12px; font-weight:bold;">{{$er_document}}</td>
      </tr>
      <tr>
        <td><strong>Checklist:</strong></td>
        <td>{{ $checklist_id }}</td>
      </tr>
      
     <tr>
        <td><strong>Status:</strong></td>
        <td> 
             <select name="status" >
                 <option {{if !empty($checklist_entities_referral) and $checklist_entities_referral.status == "" }} selected  {{/if}} value="">Please Select</option>
                  <option {{if !empty($checklist_entities_referral) and $checklist_entities_referral.status == "Not Required" }} selected  {{/if}}  value="Not Required">Not Required</option>
                  <option {{if !empty($checklist_entities_referral) and $checklist_entities_referral.status == "Not Requested" }} selected  {{/if}}  value="Not Requested">Not Requested</option>
                  <option {{if !empty($checklist_entities_referral) and $checklist_entities_referral.status == "Requested and Waiting For Entity" }} selected  {{/if}}  value="Requested and Waiting For Entity">Requested and Waiting For Entity</option>
                  <option {{if !empty($checklist_entities_referral) and $checklist_entities_referral.status == "Passed With Conditions" }} selected  {{/if}}  value="Passed With Conditions" >Passed With Conditions</option>
                 <option {{if !empty($checklist_entities_referral) and  $checklist_entities_referral.status == "Fails" }} selected  {{/if}}  value="Fails">Fails</option>
            </select>
         </td>
      </tr>
      
       <tr>
        <td><strong>Date we applied:</strong></td>
        <td><input type="date" name="date_applied" value="{{if !empty($checklist_entities_referral) }}{{ $checklist_entities_referral.date_applied }}{{/if}}"  style="width:270px;"/></td>
      </tr>
      
      
      <tr>
        <td><strong>Assessment Doc:</strong></td>
         <td><input type="file" name="assessment_doc"   style="width:700px;"/>
         <span>{{if !empty($checklist_entities_referral) }} {{ $checklist_entities_referral.assessment_doc }}  {{/if}}</span>
         </td>
      </tr>
      
       <tr>
        <td><strong>Conditions Imposed Snapshot:</strong></td>
        <td><input type="file" name="condition_snapshot"   style="width:700px;"/>
          <span>{{if !empty($checklist_entities_referral) }} {{ $checklist_entities_referral.condition_snapshot }}  {{/if}}</span>
        </td>
      </tr>
        
         <tr>
        <td> <!-- <button onclick="submit_checklist_entities_referral_form();" id="checklist_entities_referral_btn" type="button">Submit</button> -->
        <button id="checklist_entities_referral_btn" type="submit">Save</button>
        <button id="checklist_entities_referral_btn_cancel" type="button">Cancel</button>
        </td>
        <td></td>
      </tr> 
      <tr>
          <td colspan="2">
                  <!-- Progress bar -->
    <div class="progress">
        <div class="progress-bar"></div>
    </div>
    
    <!-- Display upload status -->
    <div id="uploadStatus"></div>
              
          </td>
      </tr>
    
    </table>
  </form>
</div>
<script> 

$("#checklist_entities_referral_btn_cancel").click(function(){  
    var iframeElementInParent = parent.document.getElementById('entitesListChecklist1');
    if (iframeElementInParent) {
        parent.hideiFrame('entitesListChecklist1'); 
    } else {
        window.parent.location.reload();
    }
})
        $("#checklist_entities_referral").submit( function(e){
            e.preventDefault();
            $.ajax({
                xhr: function() {
                    var xhr = new window.XMLHttpRequest();
                    xhr.upload.addEventListener("progress", function(evt) {
                        if (evt.lengthComputable) {
                            var percentComplete = ((evt.loaded / evt.total) * 100);
                            $(".progress-bar").width(percentComplete + '%');
                            $(".progress-bar").html(percentComplete+'%');
                        }
                    }, false);
                    return xhr;
                },
                type: 'POST',
                url: '{{$BASE_URL}}business.entites_controller',
                data: new FormData(this),
                contentType: false,
                cache: false,
                processData:false,
                beforeSend: function(resp){
                    $(".progress-bar").width('0%');
                    $('#uploadStatus').html('<img src="images/loading.gif"/>');
                },
                error:function(resp){
                      console.log('under error');
                    $('#uploadStatus').html('<p style="color:#EA4335;">File upload failed, please try again.</p>');
                     if(resp.status == 'false' || resp.status == false){
                        //$('#uploadForm')[0].reset();
                          console.log('if under error');
                        $('#uploadStatus').html('<p style="color:#28A74B;">Something went wrong. Please try again!</p>');
                    }
                },
                success: function(resp){
                    console.log('under success :: '+resp.status);
                    if(resp.status == 'true' || resp.status == true){
                        //$('#uploadForm')[0].reset();
                         console.log('if under success');
                        $('#uploadStatus').html('<p style="color:#28A74B;text-align: center;padding-top: 12px;font-size: 20px;">File has uploaded successfully!</p>');
                      
                        var iframeElementInParent = parent.document.getElementById('entitesListChecklist1');
                        if (iframeElementInParent) {
                            setTimeout(function(){  parent.requestEntitiesList('add'); parent.hideiFrame('entitesListChecklist1');   },2000); 
                        } else {
                            setTimeout(function(){ window.parent.location.reload(); },2000);
                        }
                    }else if(resp == 'err'){
                        $('#uploadStatus').html('<p style="color:#EA4335;">Please select a valid file to upload.</p>');
                    }
                }
            });
        });
	
</script>
{{/if}}
