<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<div align="center" style="min-height:550px; margin-top:20px;">
    <h3 class="page-title">{{$title}}</h3> <br /><br />   
    {{if $opr}}
<div align="center" style="min-height:350px; padding-top:200"><h3>Success...!</h3></div>
    {{else}}
    <form name="detail" method="post" action="" enctype="multipart/form-data">
        <table id="new-table" width="90%">
            <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
            <tr>
                <th width="120">Industry:</th>
                <td>
                <select name="{{$TABLE}}[sp_industry]" class="input" />
                  {{foreach from=$inddata key="key" item="item"}}	
                 	 <option value="{{$item.si_industry}}" {{if $detail.sp_industry eq $item.si_industry}} selected="selected"{{/if}} >
                         {{$item.si_industry}}
                         </option> 
                  {{/foreach}}
               
                 </select>
                </td>
            </tr>
             <tr>
            <th width="100">Business Name:</th>
                <td><input type= "text" name="{{$TABLE}}[sp_business_name]" value="{{$detail.sp_business_name}}" class="xlrg" /></td>
            </tr>
            
	    <tr>
                <th>Supplier Website:</th>
                <td><input type= "text" name="{{$TABLE}}[sp_website]" value="{{$detail.sp_website}}" class="xlrg" /></td>
            </tr>
            
             <tr>
                <th>Address:</th>
                <td><input type= "text" name="{{$TABLE}}[sp_address]" value="{{$detail.sp_address}}" class="xlrg" /></td>
            </tr>
             <tr>
                <th>State:</th>
                <td><input type= "text" name="{{$TABLE}}[sp_state]" value="{{$detail.sp_state}}" class="xlrg" /></td>
            </tr>
             <tr>
                <th>Phone:</th>
                <td><input type= "text" name="{{$TABLE}}[sp_phone]" value="{{$detail.sp_phone}}" class="xlrg" /></td>
            </tr>
            
            <tr>
                <th>Email:</th>
                <td><input type= "text" name="{{$TABLE}}[sp_email]" value="{{$detail.sp_email}}" class="xlrg" /></td>
            </tr>
           
            <tr>
                <th>Upload Excel Sheet:</th>
                <td>  <input type="file" name="excel" /></td>
            </tr>
           
           <!-- <tr>
                <th>Notes:</th>
                <td><textarea cols="84" id="editor1" name="{{$TABLE}}[sp_notes]" rows="10">{{$detail.sp_notes}}</textarea>    
                </td>
            </tr>-->
             
             <!--<tr>
                <th width="20">Status:</th>
                <td>
                    <select name="{{$TABLE}}[sp_status]" class="input" />
                    <option value="Inactive" {{if $detail.sp_status == "Inactive"}} selected {{/if}}>Inactive</option> 
                    <option value="Active" {{if $detail.sp_status == "Active"}} selected {{/if}}>Active</option> 
                    </select>    
                </td>
            </tr>-->
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
    frmvalidator.addValidation("{{$TABLE}}[sp_industry]","req", "Please specify title.");
	frmvalidator.addValidation("{{$TABLE}}[sp_business_name]","req", "Please specify business name.");
	//frmvalidator.addValidation("{{$TABLE}}[sp_email]","req", "Please specify email.");
</script> 
   {{/if}} 
</div>
