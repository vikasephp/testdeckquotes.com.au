<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
  <script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>

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

<style>
#product-table {
    margin:10px 0px 10px 0px;
    border:1px solid BLACK;    
    border-collapse:collapse;
  
}

#product-table th {
    border:1px solid #C1DAD7;    
    border-collapse:collapse;
    text-align:right;
	font-weight: bold; 
	height:42px;
	font-family: "Calibri";
	
}

#product-table td {
    border:1px solid #C1DAD7;
    border-collapse:collapse;
    text-align:left;
    padding:5px;
	font-family: 13px "Trebuchet MS", Verdana, Arial, Helvetica,;
	
}

input[type="text"], input[type="select"], textarea, input[type="submit"], input[type="button"], select, input[type="password"] {
    padding: 5px 8px;
    font: 1em/1.2em Arial, Helvetica, sans-serif;
    color: #5C5C5C;
    border-top: 1px solid #5C5C5C;
    border-left: 1px solid #5C5C5C;
    border-bottom: 1px solid rgba(0, 0, 0, 0.1);
    border-right: 1px solid rgba(0, 0, 0, 0.1);
    background: #f0f0f0;
    border-radius: 4px;
    -moz-border-radius: 4px;
    -khtml-border-radius: 4px;
    -webkit-border-radius: 4px;
    margin-bottom: 5px;
}

.page-title {font-family:Calibri; }

input[type="submit"], input[type="button"] {

    cursor: pointer;
   
}

</style>

{{if $opr}}

<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}
<!--<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />-->
<div align="center" style="min-height:350px;">
    <h3 class="page-title">{{$title}}</h3>    
    {{if $opr}}
	<div align="center" style="min-height:350px; padding-top:200"><h3>Success...!</h3></div>
    {{else}}
      <form name="detail" method="post" action="{{$XFA.detail}}" enctype="multipart/form-data">
        <table id="product-table" width="100%">
            <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
           {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
            <tr>
                <th width="100">Type:</th>
                <td>
                    <select name="{{$TABLE}}[sftype_id]" class="xlrg" />
                    <option value="0">-- Select --</option>
                    {{foreach from=$formulatypes key="key" item="item"}}
                    <option value="{{$item.sft_id}}" {{if $item.sft_id == $detail.sftype_id}}selected{{/if}}>{{$item.sft_title}}</option>
                    {{/foreach}}
                    </select>    
                </td>
            </tr>
            <tr>
                <th width="100">Title:</th>
                <td><input type= "text" name="{{$TABLE}}[sf_title]" value="{{$detail.sf_title}}" class="xlrg" style="width:480px;" /></td>
            </tr>
 
             <tr>
                <th width="100">Component:</th>
                <td><input type= "text" name="{{$TABLE}}[sf_component]" value="{{$detail.sf_component}}" class="xlrg" style="width:480px;" /></td>
            </tr>       
            <tr>
                <th>Text Body:</th>
                <td width="500px">
               
                <textarea cols="100"  name="{{$TABLE}}[sf_body]" rows="10" id="editor1" class="ckeditor">{{$detail.sf_body|stripslashes}}</textarea>    
             
                </td>
            </tr>
            
              <tr>
                <th>Formula:</th>
                <td width="500px">
               
                <textarea cols="100" name="{{$TABLE}}[sf_formula_body]" id="editor2" class="ckeditor">{{$detail.sf_formula_body|stripslashes}}</textarea>    
              
                </td>
            </tr>
            
            
            <tr>
                <th width="20">Status:</th>
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
			frmvalidator.addValidation("{{$TABLE}}[sftype_id]","dontselect=0", "Please select type.");
			frmvalidator.addValidation("{{$TABLE}}[sf_title]","req", "Please specify title.");
			frmvalidator.addValidation("{{$TABLE}}[sf_body]","req", "Please specify formula.");
    </script>
   {{/if}} 
</div>

<script>
	initSample();
</script>
