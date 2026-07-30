<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
{{include file=$jdata}}
{{include file=$tiny_basic}}
{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />

<style>
input[type="checkbox"] {
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


<div align="center" style="min-height:350px;">
    <h3 class="page-title">{{$title}}</h3>    
    {{if $opr}}
	<div align="center" style="min-height:350px; padding-top:200"><h3>Success...!</h3></div>
    {{else}}
      <form name="detail" method="post" action="{{$XFA.detail}}"  enctype="multipart/form-data">
        <table id="list-table" width="100%">
            <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
           {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
            <tr>
                <th width="100">Question:</th>
                  <td width="500">
                   <table  width="500" id="none-table22"><tr><td>
                <td><textarea cols="120" name="{{$TABLE}}[iqa_question]" >{{$detail.iqa_question}} </textarea>
                </td></tr></table>
                 </td>
            </tr>        
            <tr>
                <th>Answer:</th>
                <td width="500">
                <table  width="500" id="none-table22"><tr><td>
                <textarea cols="120" rows="2"name="{{$TABLE}}[iqa_answer]" class="tinymce" style="height:10px;">{{$detail.iqa_answer|stripslashes}}</textarea>    
                </td></tr></table>
                </td>
            </tr>
            
          
          <tr>
          <td colspan="2">
          <table border="0" width="98%">
          <tr>
           <td width="33%" style="border:0px;">
          
           <input type="checkbox" value="1" id="c1" name="{{$TABLE}}[iqa_on_wesite]"  {{if $detail.iqa_on_wesite eq 1}} checked="checked" {{/if}} />
           On Website : <label for="c1"></label>
          </td>
           <td width="33%" style="border:0px;">
           <input type="checkbox" value="1" id="c2" name="{{$TABLE}}[iqa_qed]" {{if $detail.iqa_qed eq 1}} checked="checked" {{/if}} />
           QE'D : <label for="c2"></label>
           
           </td>
           <td width="33%" style="border:0px;">Stream
          
           <select name="{{$TABLE}}[iqa_stream]" class="input" style="width:180px;" />
           
            {{foreach from=$streamdetail key="key" item="item"}}
               <option value="{{$item.qas_stream}}" {{if $item.qas_stream == $detail.iqa_stream}} selected="selected" {{/if}}> {{$item.qas_stream}}</option>  
            {{/foreach}}
           
                        <!--<option value="Stream-1" {{if $detail.iqa_stream == "Stream-1" }} selected {{/if}}>Stream-1</option> 
                        <option value="Stream-2" {{if $detail.iqa_stream == "Stream-2" }} selected {{/if}}>Stream-2</option> -->
           </select>
           </td>
          </tr>
          </table>
          </td>
          </tr>
          
          <tr>
          <th>Created By </th>
          <td> {{$username}} </td>
          </tr>
           <tr>
          <th>Last Updated: </th>
          <td>{{$detail.iqa_last_updated}} </td>
          </tr>
          
             
          <tr>
          <th>Updated last by: </th>
          <td>{{$detail.iqa_last_updated_by}}</td>
          </tr>
            <tr>
          <th>Attachment: </th>
          <td><input type= "file" name="docs" />{{if $detail.iqa_attachment}} {{$detail.iqa_attachment}} {{/if}}  </td>
          </tr>
          
            <tr>
                <td colspan="2" style="text-align:center;">
                    <input type="submit" name="print" value="Print" class="vsml" />
                    <input type="submit" name="subAddDetail" value="Save" class="vsml" />
                    <input type="button" name="btnCancelDetail" value="Cancel" onclick="javascript:parent.$.fancybox.close();" class="vsml" />
                </td>
            </tr>
        </table>
    </form>
	<script type="text/javascript" language="javascript" >
        var frmvalidator  = new Validator("detail");
			frmvalidator.EnableMsgsTogether();
			frmvalidator.addValidation("{{$TABLE}}[question]","req", "Please specify question.");
			frmvalidator.addValidation("{{$TABLE}}[answer]","req", "Please specify answer.");
    </script>
   {{/if}} 
</div>