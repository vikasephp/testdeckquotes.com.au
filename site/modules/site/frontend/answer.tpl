<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>

 <script type="text/javascript" src="{{$BASE_URL}}js/ckeditor2/ckeditor.js"></script>
 <script type="text/javascript" src="{{$BASE_URL}}js/ckeditor2/samples/js/sample.js"></script>



<style>
#emllib {width:98%; padding:10px;  border-collapse:collapse;}

#emllib th { border:1px solid #CCC !important; border-collapse:collapse; font-size:14px; text-align:left;}
#emllib td { border:1px solid #CCC !important; border-collapse:collapse;}
</style>


<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<div align="center" style="min-height:250px; margin-top:30px;">
    <h3 class="page-title" style="margin-bottom:30px;">Update Answer</h3>    
    {{if $opr}}
	<div align="center" style="font-size:18px; color:#093" >Your answer has been saved</div><br />
    {{/if}}

<form name="detail" method="post" action="" enctype="multipart/form-data">
<input type="hidden" name="business_qa[bqa_id]" value="{{$detail.bqa_id}}" id="bqa_id"/>


	<div style="font-size:18px; color:#606"> Project Name : {{$bsn_name}}</div> <br />
    <table id="emllib" cellpadding="0" cellspacing="0" style="width:98% !important; border:1px solid #CCC;">

        <tr>
            <th>Question :</th>
            <td>{{$detail.bqa_que}}</td>
        </tr>  
           
            
	  <tr>
            <th>Answer:</th>
            <td colspan="3"><textarea cols="140" id="editor"  name="business_qa[bqa_ans]" rows="20"  >{{$detail.bqa_ans}}</textarea></td>
      </tr>
 
 		  <tr>
            <th>Position Appointed:</th>
            <td colspan="3">
                   <select name="business_qa[bqa_who]" class="lrg" style="width:220px;">
                    {{foreach from = $pos key="key" item="item" }}
                         <option value="{{$item.p_id}}" {{if  $item.p_id eq $detail.bqa_who}} selected="selected" {{/if}}>{{$item.p_name}}</option>
        		   {{/foreach}}    
      		    </select> &nbsp;
            {{$emlData.p_email}}
            </td>
      </tr>
 
        <tr> 
        <td colspan="2" style="text-align:center;">
         <input type="submit" name="subAddDetail" value="Save" class="vsml" />
     <input type="button" name="btnCancelDetail" value="Cancel" onclick="javascript:parent.$.fancybox.close();" class="vsml" />

        </td>
        </tr>
 		</table>

      </form>
      
      
	<script type="text/javascript" language="javascript" >
        var frmvalidator  = new Validator("detail");
			frmvalidator.EnableMsgsTogether();
			frmvalidator.addValidation("{{$TABLE}}[sftype_id]","dontselect=0", "Please select type.");
			frmvalidator.addValidation("{{$TABLE}}[sf_title]","req", "Please specify title.");
			frmvalidator.addValidation("{{$TABLE}}[sf_body]","req", "Please specify formula.");
    </script>
    
</div>
<script>
	initSample();
</script>