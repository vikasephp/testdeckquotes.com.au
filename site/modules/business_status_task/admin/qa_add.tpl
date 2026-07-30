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
    <h3 class="page-title">Project Status Task Question Answer</h3>    
    <form name="detail" method="post" action="" enctype="multipart/form-data">
        <table id="list-table" width="90%" >
            <input type="hidden" name="data[ps_id]" value="{{$ps_id}}" />


		    <tr>
                <th width="20%">Select Task Id:</th>
                <td width="80%">
             <select name="data[ps_task_id]" class="lrg">
             <option value="">-- Select --</option>
            {{foreach from=$tasklist item=item key=key}}
            <option value="{{$item.bst_task_id}}" {{if $detail.ps_task_id  == $item.bst_task_id}} selected="selected" {{/if}}>{{$item.bst_task_id}}</option>
            {{/foreach}}
            </select>
              </td>
          </tr>

          <tr>
                <th>Question:</th>
                <td><input type="text" name="data[ps_question]" value="{{$detail.ps_question}}" class="xxlrg" /></td>
          </tr>
          <tr>
                <th>Answer:</th>
               	<td><textarea cols="50" name="data[ps_answer]" rows="15" id="editor1" class="ckeditor">{{$detail.ps_answer|stripslashes}}</textarea></td>
		  </tr>

        
           <tr><td colspan="2" height="20px">&nbsp;</td></tr>
            <tr>
                <td colspan="2" style="text-align:center;">
                    <input type="submit" name="subAddDetail" value="Save" class="vsml" />
                    <input type="button" name="btnCancelDetail" value="Cancel" onclick="document.location.href='{{$BASE_URL}}{{$XFA.qa_list}}'" class="vsml" />
                    {{if $detail.bst_id}}<input type="submit" name="btnassignTasks" value="Assign Tasks" class="lrg" />{{/if}}
                </td>
            </tr>
        </table>
    </form>
</div>


<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("detail");
    frmvalidator.EnableMsgsTogether();
 	frmvalidator.addValidation("data[ps_question]","req", "Please specify Question");	
</script>