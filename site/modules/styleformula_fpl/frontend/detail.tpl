<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  

{{if $opr}}

<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<script>

$(document).ready(function () {
  //called when key is pressed in textbox
  $("#cp").keypress(function (e) {
     //if the letter is not digit then display error and don't type anything
     if (e.which != 8 && e.which != 0 && e.which !=46 && (e.which < 48 || e.which > 57)) {
        //alert(e.which);
		//display error message
        $("#errmsg").html("Digits Only").show().fadeOut("slow");
               return false;
    }
   });
});
</script>

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />

	<script src="{{$BASE_URL}}js/ckeditor2/ckeditor.js"></script>
	<script src="{{$BASE_URL}}js/ckeditor2/samples/js/sample.js"></script>

<div align="center" style="min-height:350px;">
    <h3 class="page-title">{{$title}}</h3>    
    {{if $opr}}
	<div align="center" style="min-height:350px; padding-top:200"><h3>Success...!</h3></div>
    {{else}}
      <form name="detail" method="post" action="{{$XFA.detail}}" enctype="multipart/form-data">
        <table width="100%" cellspacing="0" cellpadding="4" style="border:1px solid #CCC;">
            <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
           {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}

            <tr>
                <td width="15%">Title:</td>
                <td><input type= "text" name="{{$TABLE}}[sf_title]" value="{{$detail.sf_title}}" class="xlrg" style="width:480px;" /></td>
            </tr>
 
             <tr>
                <td>Component:</td>
                <td><input type= "text" name="{{$TABLE}}[sf_component]" value="{{$detail.sf_component}}" class="xlrg" style="width:480px;" /></td>
            </tr>       
            <tr>
                <td>Text Body:</td>
                <td>
   
                <textarea cols="100" name="{{$TABLE}}[sf_body]" rows="10" id="editor1" >{{$detail.sf_body|stripslashes}}</textarea>   
                  <script type="text/javascript">
					  CKEDITOR.replace( '{{$TABLE}}[sf_body]' );
					  CKEDITOR.add            
				   </script>
                 
         
                </td>
            </tr>
            
              <tr>
                <td>Formula:</td>
                <td width="100%">
        
                <textarea cols="200" name="{{$TABLE}}[sf_formula_body]" rows="10" id="editor2" >{{$detail.sf_formula_body|stripslashes}}</textarea>   
                 <script type="text/javascript">
					  CKEDITOR.replace( '{{$TABLE}}[sf_formula_body]' );
					  CKEDITOR.add            
				   </script>

                </td>
            </tr>
            
          <tr>
                <td width="100">Cost Price $:</td>
                <td>
               <input type="text" name="{{$TABLE}}[sf_cost_price]" value="{{$detail.sf_cost_price}}" style="width:180px;" id="cp" placeholder="Don't enter doller and comma." />
                &nbsp;<span id="errmsg"></span>
                </td>
            </tr>
            
             <tr>
                <td width="100">Type:</td>
                <td>
                    <select name="{{$TABLE}}[sf_unit_type]"  />
                    <option value="0">-- Select --</option>
                    {{foreach from=$unitvalue key="key" item="item"}}
                    <option value="{{$item.uv_text}}" {{if $item.uv_text == $detail.sf_unit_type}}selected{{/if}}>{{$item.uv_text}}</option>
                    {{/foreach}}
                    </select>    
                </td>
            </tr>
            
            
            <tr>
                <td width="20">Status:</td>
                <td>
                    <select name="{{$TABLE}}[sf_status]" class="input" style="width:180px;" />
                    <option value="Inactive" {{if $detail.sf_status == "Inactive"}} selected {{/if}}>Inactive</option> 
                    <option value="Active" {{if $detail.sf_status == "Active"}} selected {{/if}}>Active</option> 
                    </select>    
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
			
			frmvalidator.addValidation("{{$TABLE}}[sf_title]","req", "Please specify title.");
			frmvalidator.addValidation("{{$TABLE}}[sf_component]","req", "Please specify component.");
			frmvalidator.addValidation("{{$TABLE}}[sf_body]","req", "Please specify formula.");
    </script>
   {{/if}} 
</div>

<script>
	initSample();
</script>