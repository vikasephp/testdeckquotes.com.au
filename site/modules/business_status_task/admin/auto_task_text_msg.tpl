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
    <h3 class="page-title">Auto Task Text Message</h3>    
    <form name="detail" method="post" action="" enctype="multipart/form-data">
        <table id="list-table" width="95%" >
            <input type="hidden" name="data[au_id]" value="{{$au_id}}" />


           <tr>
           <th width="10%">Select Task Id:</th>
           <td width="90%">
             <select name="data[au_task_uid]" class="lrg">
             <option value="">-- Select --</option>
            {{foreach from=$tasklist item=item key=key}}
                  <option value="{{$item.bst_task_id}}" {{if $detail.au_task_uid  == $item.bst_task_id}} selected="selected" {{/if}}>
                   {{$item.bst_task_id}}
                   </option>
             {{/foreach}}
           </select>
              </td>
          </tr>
          
      
	<tr>
        <th>SMS Text:</th>
        <td><textarea cols="100" name="data[au_text_msg]" rows="10" >{{$detail.au_text_msg|stripslashes}}</textarea>
        </td>
        </tr>

        
           <tr><td colspan="2" height="20px">&nbsp;</td></tr>
            <tr>
                <td colspan="2" style="text-align:center;">
                    <input type="submit" name="subAddDetail" value="Save" class="vsml" />
                    <input type="button" name="btnCancelDetail" value="Cancel" onclick="document.location.href='{{$BASE_URL}}business_status_taskAdmin.auto_text_list'" class="vsml" />
                   
                   
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