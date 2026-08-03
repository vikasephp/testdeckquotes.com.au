<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />

<style>
.chk input[type="checkbox"] {
  display: none;
}

 input[type="checkbox"] + label:before {
  background: #F00 ;	
  border: 1px solid #7f83a2;
  content: "\00a0";
  display: inline-block;
  font: 16px/1em sans-serif;
  height: 16px;
  margin: 0 .25em 0 0;
  padding: 0;
  vertical-align: top;
  width: 16px;
}
 input[type="checkbox"]:checked + label:before {
  background: #FFF ;
  color: #666;
  content: "\2713";
  text-align: center;
  cursor:pointer;
}
</style>

<script src="{{$BASE_URL}}ckeditor2/ckeditor.js"></script>
<script src="{{$BASE_URL}}ckeditor2/samples/js/sample.js"></script>

<script type="text/javascript">
   CKEDITOR.replace( 'editor1' );
   CKEDITOR.add  
</script>

<script type="text/javascript">
   CKEDITOR.replace( 'editor2' );
   CKEDITOR.add  
</script>


{{if $opr}}
<script type="text/javascript">
//setTimeout('parent.close_win();', 500);
setTimeout(function() {
    //window.location.reload(true); 
}, 500); 
</script>
{{/if}}

<div align="center" style="min-height:350px;">
	<br/>
    <h3 class="page-title">{{$title}}</h3>  
	{{if $opr}}<h3 class="page-title" style="color:green;font-weight:bold;"><br/>Record Saved Successfully</h3> {{/if}}
   
      <form name="detail" method="post" action="{{$BASE_URL}}{{$XFA.detail}}{{if $detail.$ID gt 0}}/docqa_id/{{$detail.$ID}}{{/if}}"  enctype="multipart/form-data">
        <table id="list-table" width="100%">
            <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
           {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
		   
			<tr>
				<th>Enter Public Rank:</th>
				<td><input type="number" name="{{$TABLE}}[docqa_public_rank]" value="{{$detail.docqa_public_rank}}" style="width:200px;" />  </td>
			</tr>
			
			<tr>
				<th>Enter Slug:</th>
				<td><input type="text" name="{{$TABLE}}[docqa_slug]" value="{{$detail.docqa_slug}}" style="width:700px;" />  </td>
			</tr>
		  
            <tr>
                <th width="100">Question:</th>
                <td><textarea cols="230" name="{{$TABLE}}[docqa_question]" id="editor1" class="ckeditor" >{{$detail.docqa_question}} </textarea>
				</td>
            </tr>    
            
            <tr>
				<th> Select Active Sheets </th>
            <td> 
            
			 <div class="bsearch_scroll_div" style="width:400px !important;">
				<ul style="margin: 0; padding: 0;">
				{{foreach from=$document_list key="key" item="item"}}
				<li><input type="checkbox" name="{{$TABLE}}[docqa_fact_sheets][]" value="{{$item.doc_id}}" {{foreach from=$detail.docqa_fact_sheets key="key1" item="item1"}}  {{if $item.doc_id eq $item1}} checked="checked"  {{/if}}{{/foreach}}/> {{$item.doc_name}}</li>
				{{/foreach}}
				</ul>  
			</div> 
            </td>
            </tr>
                
            <tr>
                <th>Answer:</th>
                <td width="900">
                <textarea cols="1000" rows="25" name="{{$TABLE}}[docqa_answer]" id="editor2" class="ckeditor" style="height:270px;">{{$detail.docqa_answer|stripslashes}}</textarea>
				<br>
				<button type="button" id="btnAIFormat">
					✨ Format with AI
				</button>
				<script type="text/javascript">

jQuery("#btnAIFormat").click(function () {

    var html = CKEDITOR.instances.editor2.getData();

    console.log("Sending content:", html);

    jQuery.ajax({

        type: "POST",

        url: "{{$BASE_URL}}{{$BASEFOLDER}}.format_text",

        data: {
            content: html
        },

        dataType: "json",

        beforeSend:function(){
            console.log("Request started");
        },

        success:function(result){

            console.log("Response:", result);

            if(result.success){

                CKEDITOR.instances.editor2.setData(result.content);

            }else{

                alert(result.message);

            }

        },

        error:function(xhr, status, error){

            console.log("AJAX Error:");
            console.log(xhr.responseText);
			 console.log("HTTP Status:", xhr.status);
    console.log("Response:", xhr.responseText);
            console.log(status);
            console.log(error);

        },

        complete:function(){

            console.log("Request completed");

        }

    });

});

</script>
                </td>
            </tr>
			
			<tr>
                <th>Short Answer:</th>
                <td>
                <textarea rows="5" name="{{$TABLE}}[docqa_short_answer]" style="width:100%;">{{$detail.docqa_short_answer}}</textarea>
                </td>
            </tr>
			
			<tr>
                <th>Key Points:</th>
                <td>
                <textarea rows="5" name="{{$TABLE}}[docqa_key_points]" style="width:100%;">{{$detail.docqa_key_points}}</textarea>
                </td>
            </tr>
			
			<tr>
                <th>Detail Explanation:</th>
                <td width="900">
                <textarea cols="1000" rows="25" name="{{$TABLE}}[docqa_detail_explanation]" id="editor1" class="ckeditor" style="height:270px;">{{$detail.docqa_detail_explanation|stripslashes}}</textarea>
                </td>
            </tr>
			
			<tr>
				<th>Upload Graphic: </th>
				<td>
					<input type="file" name="graphic" accept=".jpg,.jpeg,.png,.webp,image/jpeg,image/png,image/webp,image/heic,image/heif" />
					{{if $detail.docqa_graphic}}
					<a href="{{$BASE_URL}}{{$BASEFOLDER}}.download_content?file_name={{$detail.docqa_graphic}}&module_name=dual_occupancy_qa.graphic" target="_blank" title="{{$detail.docqa_graphic}}">{{ $detail.docqa_graphic}}</a>
					<a href="{{$BASE_URL}}{{$BASEFOLDER}}.delete_graphic_file/docqa_id/{{$detail.docqa_id}}" onclick="javascript:if(!confirm('Are you sure want to delete?')) return false;" title="Delete"><img src="{{$BASE_URL}}/images/delete_icon.png" width="20" /></a>
					{{/if}}
				</td>
			</tr>
			
         <tr>
         <th> Image Uploaded </th>   
         <td> {{if $detail.docqa_image}} 
                <img src="{{$detail.docqa_image_raw_data}}" height="60">
               {{else}}
               No Image is uploaded
                  
          {{/if}}  </td> 
		  </tr>
          <tr>
           <th>Upload Image: </th>
          <td><input type="file" name="img" /></td>
          </tr>
           
          <tr>
          <td colspan="2">
          <table border="0" width="98%">
          <tr>
           <td width="33%" style="border:0px;">
          
           <input type="checkbox" value="1" id="c1" name="{{$TABLE}}[docqa_on_website]" style="display:none;"   {{if $detail.docqa_on_website eq 1}} checked="checked" {{/if}} />
           On Website : <label for="c1"></label>
          </td>
           <td width="33%" style="border:0px;">
           <input type="checkbox" value="1" id="c2" name="{{$TABLE}}[docqa_qed]" style="display:none;"   {{if $detail.docqa_qed eq 1}} checked="checked" {{/if}} />
           QE'D : <label for="c2"></label>
           
           </td>
           <td width="33%" style="border:0px;">Stream
          
           <select name="{{$TABLE}}[docqa_stream]" class="input" style="width:180px;" />
           
            {{foreach from=$streamdetail key="key" item="item"}}
               <option value="{{$item.qas_stream}}" {{if $item.qas_stream == $detail.docqa_stream}} selected="selected" {{/if}}> {{$item.qas_stream}}</option>  
            {{/foreach}}
                        
           </select>
           </td>
          </tr>
          </table>
          </td>
          </tr>
          
          <tr>
          <th>Created By </th>
          <td> {{$username}}  &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; <strong> Last Updated: </strong> {{$detail.docqa_last_updated}}
          &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; <strong>Updated Last By: </strong> {{$detail.docqa_last_updated_by}}
          </td>
          </tr>
<!--           <tr>
          <th>Last Updated: </th>
          <td>{{$detail.docqa_last_updated}} </td>
          </tr>
          
             
          <tr>
          <th>Updated last by: </th>
          <td>{{$detail.docqa_last_updated_by}}</td>
          </tr>-->
          
          <tr>
          <th>Attachment: </th>
          <td><input type= "file" name="docs" />
          {{if $detail.docqa_attachment}}  {{$detail.docqa_attachment}} {{/if}}  </td>
          </tr>
          <tr>
          <th>QAIDDO</th><td>{{if $detail.docqa_id neq ''}}QAIDDO{{/if}}{{$detail.docqa_id}}</td>
          </tr> 
         
         
           <tr>
          <th>Answer Link: </th>
          <td><input type= "text" name="{{$TABLE}}[docqa_answer_link]" value="{{$detail.docqa_answer_link}}" style="width:700px;" />  </td>
          </tr>
          
          
            <tr>
                <td colspan="2" style="text-align:center;">
                    <input type="submit" name="subAddDetail" value="Save" class="vsml" />
                   <!-- <input type="button" name="btnCancelDetail" value="Cancel" onclick="javascript:parent.$.fancybox.close();" class="vsml" />-->
				   {{if $detail.$ID lt 0}}
                    <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
					{{/if}}
                </td>
            </tr>
        </table>
    </form>
    
    <script type="text/javascript">
		function closepop()
		{
		setTimeout('parent.close_win();', 500);
		}
	</script>
    
	<script type="text/javascript" language="javascript" >
        var frmvalidator  = new Validator("detail");
			frmvalidator.EnableMsgsTogether();
			frmvalidator.addValidation("{{$TABLE}}[question]","req", "Please specify question.");
			frmvalidator.addValidation("{{$TABLE}}[answer]","req", "Please specify answer.");
    </script>
</div>
<script>
	initSample();
</script>