function update_view_part(doc_id)
{
   var url = "/business.common?a_req=checklist&doc_id="+doc_id+"&random=0.0006512952720320042";
   console.log("i am also fired :: "+url);
   $.ajax({
       url:url,
       type:'GET',
       success: function(data){
           var dataHtml = $(data).find('#uploadForm').html();
           $('#uploadForm').html(dataHtml);
       }
    });
}

$(document).ready(function(){
    // File upload via Ajax
    $("#uploadForm").on('submit', function(e){
        
         $('#uploadForm #uploadForm_submit_iframe').val("Please wait...");
         $('#uploadForm #uploadForm_submit_iframe').attr("style","pointer-events: none;opacity: 0.7;");
        var doc_id = $(this).find("#uploadForm_doc_id").val();

        var url = "/business.update_doc_checklist?a_req=checklist&doc_id="+doc_id+"action=updateDocCustomCheckListData";
        
       // var url = "/uploadBigFileController.php";
        
        e.preventDefault();
        $.ajax({
            xhr: function() {
                var xhr = new window.XMLHttpRequest();
                xhr.upload.addEventListener("progress", function(evt) {
                    if (evt.lengthComputable) {
                        var percentComplete = Math.trunc( ((evt.loaded / evt.total) * 100) );
                        $(".progress-bar").width(percentComplete + '%');
                        $(".progress-bar").html(percentComplete+'%');
                    }
                }, false);
                return xhr;
            },
            type: 'POST',
            url: url,
            data: new FormData(this),
            contentType: false,
            cache: false,
            processData:false,
            beforeSend: function(){
                $(".progress-bar").width('0%');
             //   $('#uploadStatus').html('<img src="images/loading.gif"/>');
            },
            error:function(){
                 $('#uploadForm #uploadForm_submit_iframe').val("Save");
                 $('#uploadForm #uploadForm_submit_iframe').attr("style","");
                $('#uploadStatus').html('<p style="color:#EA4335;">File upload failed, please try again.</p>');
            },
            success: function(resp){
                
                
           
                if(resp == 'ok'){
                    $('#uploadForm #uploadForm_submit_iframe').val("Save");
                    $('#uploadForm #uploadForm_submit_iframe').attr("style","");
                    $('#uploadForm')[0].reset();
                    $('#uploadStatus').html('<p style="color:#28A74B;">Record has been updated successfully!</p>');
                    //update_view_part(doc_id);
					
					parent.requestDocumentCheckList('add');
					parent.hideiFrame('checkListIframe');
					

                }else if(resp == 'err'){
                    $('#uploadStatus').html('<p style="color:#EA4335;">Please select a valid file to upload.</p>');
                    $('.progress .progress-bar').attr('style',"width:0%");
                    $('#uploadForm #uploadForm_submit_iframe').val("Save");
                    $('#uploadForm #uploadForm_submit_iframe').attr("style","");
                }
            }
        });
    });
    
        // Add new File upload via Ajax
    $("#uploadForm11").on('submit', function(e){
        
         $('#uploadForm11 #newRecordUploadForm11').val("Please wait...");
         $('#uploadForm11 #newRecordUploadForm11').attr("style","pointer-events: none;opacity: 0.7;");
        var bus_id = $(this).find("#business_id").val();

        var url = "/business.update_doc_checklist?a_req=documents&bus_id="+bus_id+"&divid=divbusinessdocInfoToReturn&tableid=&random=0.13348472512232&action=updateDocCustomCheckListData";
        
        e.preventDefault();
        $.ajax({
            xhr: function() {
                var xhr = new window.XMLHttpRequest();
                xhr.upload.addEventListener("progress", function(evt) {
                    if (evt.lengthComputable) {
                        var percentComplete = Math.trunc( ((evt.loaded / evt.total) * 100) );
                        $(".progress-bar").width(percentComplete + '%');
                        $(".progress-bar").html(percentComplete+'%');
                    }
                }, false);
                return xhr;
            },
            type: 'POST',
            url: url,
            data: new FormData(this),
            contentType: false,
            cache: false,
            processData:false,
            beforeSend: function(){
                $(".progress-bar").width('0%');
             //   $('#uploadStatus').html('<img src="images/loading.gif"/>');
            },
            error:function(){
                 $('#uploadForm11 #newRecordUploadForm11').val("Save");
                 $('#uploadForm11 #newRecordUploadForm11').attr("style","");
                 $('#uploadStatus').html('<p style="color:#EA4335;">File upload failed, please try again.</p>');
            },
            success: function(resp){
                if(resp == 'ok'){
                    $('#uploadForm11 #newRecordUploadForm11').val("Save");
                    $('#uploadForm11 #newRecordUploadForm11').attr("style","");
                    $('#uploadForm11')[0].reset();
                    $('#uploadStatus').html('<p style="color:#28A74B;">Record has been updated successfully!</p>');
                    setTimeout(function(){
                        parent.iframeRequest(1,'');
					    parent.hideiFrame('adddocumentsIframe');
                    },3000);
                    

                }else if(resp == 'err'){
                    $('#uploadStatus').html('<p style="color:#EA4335;">Please select a valid file to upload.</p>');
                    $('.progress .progress-bar').attr('style',"width:0%");
                    $('#uploadForm11 #newRecordUploadForm11').val("Save");
                    $('#uploadForm11 #newRecordUploadForm11').attr("style","");
                }
                
            }
        });
    });
    
      // Add new File upload in proposal checklist via Ajax
      
    $("#mini_cdc_doc_name_11").on('submit', function(e){
        
         $('#mini_cdc_doc_name_11 #newRecordUploadForm11').val("Please wait...");
         $('#mini_cdc_doc_name_11 #newRecordUploadForm11').attr("style","pointer-events: none;opacity: 0.7;");
        var bus_id = $(this).find('input[name="mini[bsn_id]"]').val(); 
        var chkid = $(this).find('input[name="mini[doc_chk_list_chknm]"]').val(); //
        //console.log("bus_id :: "+bus_id); return false;
        
        var doc_id = $(this).find('#chk_list_document_id').val();
     
        var url = "/business.update_doc_checklist?a_req=adddoc_checklistmini&doc_id="+doc_id+"&chknm="+chkid+"&bus_id="+bus_id+"&random=0.28573202587268287&action=miniCdcDocName";
      // console.log("url :: "+url); return false;
         e.preventDefault();
        $.ajax({
            xhr: function() {
                var xhr = new window.XMLHttpRequest();
                xhr.upload.addEventListener("progress", function(evt) {
                    if (evt.lengthComputable) {
                        var percentComplete = Math.trunc( ((evt.loaded / evt.total) * 100) );
                        $(".progress-bar").width(percentComplete + '%');
                        $(".progress-bar").html(percentComplete+'%');
                    }
                }, false);
                return xhr;
            },
            type: 'POST',
            url: url,
            data: new FormData(this),
            contentType: false,
            cache: false,
            processData:false,
            beforeSend: function(){
                $(".progress-bar").width('0%');
             //   $('#uploadStatus').html('<img src="images/loading.gif"/>');
            },
            error:function(){
                 $('#mini_cdc_doc_name_11 #newRecordUploadForm11').val("Save");
                 $('#mini_cdc_doc_name_11 #newRecordUploadForm11').attr("style","");
                 $('#uploadStatus').html('<p style="color:#EA4335;">File upload failed, please try again.</p>');
            },
            success: function(resp){
                if(resp == 'ok'){
                    $('#mini_cdc_doc_name_11 #newRecordUploadForm11').val("Save");
                    $('#mini_cdc_doc_name_11 #newRecordUploadForm11').attr("style","");
                    $('#mini_cdc_doc_name_11')[0].reset();
                    $('#uploadStatus').html('<p style="color:#28A74B;">Record has been updated successfully!</p>');
                    parent.requestDocumentCheckListMini('show');
                    setTimeout(function(){
                        parent.hideiFrame('adddoc_checkListIframeMini');
                        
                    },3000);
                    

                }else if(resp == 'err'){
                    $('#uploadStatus').html('<p style="color:#EA4335;">Please select a valid file to upload.</p>');
                    $('.progress .progress-bar').attr('style',"width:0%");
                    $('#mini_cdc_doc_name_11 #newRecordUploadForm11').val("Save");
                    $('#mini_cdc_doc_name_11 #newRecordUploadForm11').attr("style","");
                }
                
            }
        });
    });
    
          // Add new File upload in Renovation checklist via Ajax
      
    $("#renovation_cdc_doc_form").on('submit', function(e){
        
         $('#renovation_cdc_doc_form #newRecordUploadForm11').val("Please wait...");
         $('#renovation_cdc_doc_form #newRecordUploadForm11').attr("style","pointer-events: none;opacity: 0.7;");
        var bus_id = $(this).find('input[name="renovation_bus_id"]').val(); 
        var chkid = $(this).find('input[name="renovation_chknm_id"]').val(); //
        //console.log("bus_id :: "+bus_id); return false;
        
        var doc_id = $(this).find('input[name="renovation_doc_id"]').val();
     
        var url = "/business.update_doc_checklist?a_req=adddoc_checklistrenovation&doc_id="+doc_id+"&chknm="+chkid+"&bus_id="+bus_id+"&action=adddoc_checklistrenovation";
      // console.log("url :: "+url); return false;
         e.preventDefault();
        $.ajax({
            xhr: function() {
                var xhr = new window.XMLHttpRequest();
                xhr.upload.addEventListener("progress", function(evt) {
                    if (evt.lengthComputable) {
                        var percentComplete = Math.trunc( ((evt.loaded / evt.total) * 100) );
                        $(".progress-bar").width(percentComplete + '%');
                        $(".progress-bar").html(percentComplete+'%');
                    }
                }, false);
                return xhr;
            },
            type: 'POST',
            url: url,
            data: new FormData(this),
            contentType: false,
            cache: false,
            processData:false,
            beforeSend: function(){
                $(".progress-bar").width('0%');
             //   $('#uploadStatus').html('<img src="images/loading.gif"/>');
            },
            error:function(){
                 $('#renovation_cdc_doc_form #newRecordUploadForm11').val("Save");
                 $('#renovation_cdc_doc_form #newRecordUploadForm11').attr("style","");
                 $('#uploadStatus').html('<p style="color:#EA4335;">File upload failed, please try again.</p>');
            },
            success: function(resp){
                if(resp == 'ok'){
                    $('#renovation_cdc_doc_form #newRecordUploadForm11').val("Save");
                    $('#renovation_cdc_doc_form #newRecordUploadForm11').attr("style","");
                    $('#renovation_cdc_doc_form')[0].reset();
                    $('#uploadStatus').html('<p style="color:#28A74B;">Record has been updated successfully!</p>');
                    parent.requestDocumentCheckListRenovation('show');
                    setTimeout(function(){
                        parent.hideiFrame('adddoc_checkListIframeRenovation');
                        
                    },3000);
                    

                }else if(resp == 'err'){
                    $('#uploadStatus').html('<p style="color:#EA4335;">Please select a valid file to upload.</p>');
                    $('.progress .progress-bar').attr('style',"width:0%");
                    $('#renovation_cdc_doc_form #newRecordUploadForm11').val("Save");
                    $('#renovation_cdc_doc_form #newRecordUploadForm11').attr("style","");
                }
                
            }
        });
    });
    
});