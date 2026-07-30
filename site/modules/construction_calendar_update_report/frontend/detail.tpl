<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>

 <script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
 
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />


	<script src="{{$BASE_URL}}ckeditor2/ckeditor.js"></script>
	<script src="{{$BASE_URL}}ckeditor2/samples/js/sample.js"></script>

	<script type="text/javascript">
           CKEDITOR.replace( 'editor1' );
           CKEDITOR.add  
        </script>

{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<div align="center">
<h3 class="page-title">Construction Calendar Update Report</h3><br /><br />
   <form name="detail" method="post" action="{{$XFA.detail}}" enctype="multipart/form-data">							
   
   {{if !$opr}}
   {{if $msg }} <div style="font-weight:bold; font-size:15px; color:#F00;"> {{$msg }}</div> {{/if}}
 
 <input type="hidden" name="{{$TABLE}}[cc_id]" value="{{$detail.cc_id}}" id="dh_id"/>
 
     <table id="list-table" width="100%" cellpadding="0" cellspacing="0">
     
        <tr>
            <th>Project Address:</th>
            <td> 
            
          <datalist id='project'>
           {{foreach from=$projdetail key="key" item="item"}}
            <option value="{{$item.bsn_name}}" {{if $bsnid eq $item.bsn_id}} selected="selected" {{/if}}>
            {{$item3.bsn_name}}
            </option>
            {{/foreach}}
  	 </datalist>
         <input type="text" list = 'project' name="{{$TABLE}}[cc_project_address]" style ="width:700px" value="{{$detail.cc_project_address}}" />
            
            </td>
        </tr>
        
       
     <tr>
        <th width="100">Comments:</th>
          <td width="1100">
           <table  width="1100" id="none-table22"><tr><td>
        <td><textarea cols="120" rows="16" name="{{$TABLE}}[cc_comments]"  id="editor1" class="ckeditor" >{{$detail.cc_comments}}</textarea>
        </td></tr></table>
         </td>
    </tr>  
        
 
        

        
        <tr>
                <td colspan="2" style="text-align:center;">
                    <input type="submit" name="subAddDetail" value="Save" class="vsml" />
                    <input type="button" name="btnCancelDetail" value="Cancel" onclick="javascript:parent.$.fancybox.close();" class="vsml" />
                </td>
        </tr>
           
            
		</table>
     
       
     {{else}}
     	<div style="font-size:24px; height:99px; padding-top:150px;">{{$opr}}</div> 
{{/if}}
</div>
   </form>
<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("detail");
    frmvalidator.EnableMsgsTogether();
    frmvalidator.addValidation("purchse_order[project_name]","req", "Please specify project address.");
    frmvalidator.addValidation("purchse_order[po_component_name]","req", "Please specify component.");
    frmvalidator.addValidation("purchse_order[po_supplier1]","req", "Please specify supplier name.");
    frmvalidator.addValidation("purchse_order[po_value1]","req", "Please specify value.");

</script>


<script>
	initSample();
</script>