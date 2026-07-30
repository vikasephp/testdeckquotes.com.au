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

<div align="center" style="min-height:350px;">
    <h3 class="page-title">{{$title}}</h3>    
   
      <form name="detail" method="post" action="{{$XFA.detail}}"  enctype="multipart/form-data">
        <table id="list-table" width="100%">
            <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
           {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
            <tr>
                <th width="100">Question:</th>
                <td><textarea cols="230" name="{{$TABLE}}[qa_question]" id="editor1" class="ckeditor" >{{$detail.qa_question}} </textarea></td>
            </tr>    
            
            <tr>
            <th> Select Active Sheets </th>
            <td> 
            
         <div class="bsearch_scroll_div" style="width:400px !important;">
            <ul style="margin: 0; padding: 0;">
           
           {{foreach from=$document_list key="key" item="item"}}
 <li><input type="checkbox" name="{{$TABLE}}[qa_fact_sheets][]" value="{{$item.doc_id}}" {{foreach from=$detail.qa_fact_sheets key="key1" item="item1"}}  {{if $item.doc_id eq $item1}} checked="checked"  {{/if}}{{/foreach}}/> {{$item.doc_name}}</li>
            {{/foreach}}
            </ul>  
        </div> 
            
            </td>
            </tr>
                
            <tr>
                <th>Answer:</th>
                <td width="900">
                <textarea cols="1000" rows="25" name="{{$TABLE}}[qa_answer]" id="editor1" class="ckeditor" style="height:270px;">{{$detail.qa_answer|stripslashes}}</textarea>    
                 </td>
            </tr>
         <tr>
         <th> Image Uploaded </th>   
         <td> {{if $detail.qa_image}} 
         <!--	<img src ="https://deckquote.s3.amazonaws.com/files/question_answer_doc/{{$detail.qa_image}}" height="60"> -->
                <img src ="{{$detail.qa_image_raw_data}}" height="60">
               {{else}}
               No Image is uploaded
                  
          {{/if}}  </td>   
          <tr>
           <th>Upload Image: </th>
          <td><input type= "file" name="img" /></td>
          </tr>
           
          <tr>
          <td colspan="2">
          <table border="0" width="98%">
          <tr>
           <td width="33%" style="border:0px;">
          
           <input type="checkbox" value="1" id="c1" name="{{$TABLE}}[qa_on_wesite]" style="display:none;"   {{if $detail.qa_on_wesite eq 1}} checked="checked" {{/if}} />
           On Website : <label for="c1"></label>
          </td>
           <td width="33%" style="border:0px;">
           <input type="checkbox" value="1" id="c2" name="{{$TABLE}}[qa_qed]" style="display:none;"   {{if $detail.qa_qed eq 1}} checked="checked" {{/if}} />
           QE'D : <label for="c2"></label>
           
           </td>
           <td width="33%" style="border:0px;">Stream
          
           <select name="{{$TABLE}}[qa_stream]" class="input" style="width:180px;" />
           
            {{foreach from=$streamdetail key="key" item="item"}}
               <option value="{{$item.qas_stream}}" {{if $item.qas_stream == $detail.qa_stream}} selected="selected" {{/if}}> {{$item.qas_stream}}</option>  
            {{/foreach}}
                        
           </select>
           </td>
          </tr>
          </table>
          </td>
          </tr>
          
          <tr>
          <th>Created By </th>
          <td> {{$username}}  &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; <strong> Last Updated: </strong> {{$detail.qa_last_updated}}
          &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; <strong>Updated Last By: </strong> {{$detail.qa_last_updated_by}}
          </td>
          </tr>
<!--           <tr>
          <th>Last Updated: </th>
          <td>{{$detail.qa_last_updated}} </td>
          </tr>
          
             
          <tr>
          <th>Updated last by: </th>
          <td>{{$detail.qa_last_updated_by}}</td>
          </tr>-->
          
          <tr>
          <th>Attachment: </th>
          <td><input type= "file" name="docs" />
          {{if $detail.qa_attachment}}  {{$detail.qa_attachment}} {{/if}}  </td>
          </tr>
          <tr>
          <th>QAID</th><td>{{$detail.qa_id}}</td>
          </tr> 
         
         
           <tr>
          <th>Answer Link: </th>
          <td><input type= "text" name="{{$TABLE}}[qa_answer_link]" value="{{$detail.qa_answer_link}}" style="width:700px;" />  </td>
          </tr>
          
          
            <tr>
                <td colspan="2" style="text-align:center;">
                    <input type="submit" name="print" value="Print" class="vsml" />
                    <input type="submit" name="subAddDetail" value="Save" class="vsml" />
                   <!-- <input type="button" name="btnCancelDetail" value="Cancel" onclick="javascript:parent.$.fancybox.close();" class="vsml" />-->
                    <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
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