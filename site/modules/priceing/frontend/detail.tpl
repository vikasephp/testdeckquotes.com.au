<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<div align="center" style="min-height:650px;">
    <h3 class="page-title">{{$title}}</h3>    
    {{if $opr}}
<div align="center" style="min-height:350px; padding-top:200"><h3>Success...!</h3></div>
    {{else}}
    <form name="detail" method="post" action="" enctype="multipart/form-data">
        <table id="new-table" width="90%">
            <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
               <tr>
                <th width="200">Job Type:</th>
                <td>
                    <select name="{{$TABLE}}[jp_type]" class="lrg" onchange="submit();" />
                    <option value="0" {{if $detail.jbo_parent == 0}} selected {{/if}}>-- Select --</option> 
                    {{foreach from=$parents key="key" item="item"}}
                    <option value="{{$item.jbo_id}}" {{if $item.jbo_id == $detail.jp_type}} selected {{/if}}>{{$item.jbo_title}}</option>
                    {{/foreach}}
                    </select>     
                </td>
            </tr>
             <tr>
                <th >Select Sub Type:</th>
                <td>
                    <select name="{{$TABLE}}[jp_subtype]" class="lrg" onchange="submit();"/>
                    <option value="0" {{if $detail.jbo_subparent == 0}} selected {{/if}}>-- Select --</option> 
 					{{foreach from=$subparents key="key" item="item"}}
                    <option value="{{$item.jbo_id}}" {{if $item.jbo_id == $detail.jp_subtype}} selected {{/if}}>{{$item.jbo_title}}</option>
                    {{/foreach}}
                    </select>    
                </td>
            </tr>
            {{foreach from=$options key="key" item="item"}}
            <tr>
                 <th>{{$item.jbo_title}}:</th>
                <td><input type= "text" name="{{$TABLE}}[jp_data][{{$item.jbo_id}}]" value='{{foreach from=$optionsData item="item1" key="key1"}}{{if $item.jbo_id == $item1.jpd_opt_id}}{{$item1.jpd_opt_data}}  {{/if}} {{/foreach}}' class="vlrg" style="width:300px;"/></td>
            </tr> 
            {{/foreach}}
			<!--<tr>
                <th>Species:</th>
                <td><input type= "text" name="{{$TABLE}}[sp_website]" value="{{$detail.sp_website}}" class="vlrg" style="width:300px;"/></td>
            </tr>
            <tr>
                 <th>Board Width:</th>
                <td><input type= "text" name="{{$TABLE}}[sp_email]" value="{{$detail.sp_email}}" class="vlrg" style="width:300px;"/></td>
            </tr>
            <tr>
                <th>Lineal Meters Per SQM<br /> - Including Wastage:</th>
                <td><input type= "text" name="{{$TABLE}}[sp_phone]" value="{{$detail.sp_phone}}" class="vlrg" style="width:300px;"/></td>
            </tr>
            <tr>
                <th>Price Per Lineal Square Meter :</th>
                <td><input type= "text" name="{{$TABLE}}[sp_fax]" value="{{$detail.sp_fax}}" class="vlrg" style="width:300px;"/></td>
            </tr>
            <tr>
                <th>Price Per SQM Decking Boards:</th>
                <td><input type= "text" name="{{$TABLE}}[sp_abn]" value="{{$detail.sp_abn}}" class="vlrg" style="width:300px;"/></td>
            </tr>
            <tr>
                <th>Project Cost:</th>
                <td><input type= "text" name="{{$TABLE}}[sp_abn]" value="{{$detail.sp_abn}}" class="vlrg" readonly="readonly" style="width:300px;"/></td>
            </tr>-->
            <tr>
                <th>Notes:</th>
                <td><textarea cols="84" id="editor1" name="{{$TABLE}}[jp_notes]" rows="10">{{$detail.sp_notes}}</textarea>    
                </td>
            </tr>
             <tr>
                <th>Status:</th>
                <td>
                    <select name="{{$TABLE}}[jp_status]" class="sml" />
                    <option value="Active" {{if $detail.jp_status == "Active"}} selected {{/if}}>Active</option> 
                    <option value="Inactive" {{if $detail.jp_status == "Inactive"}} selected {{/if}}>Inactive</option> 
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
    frmvalidator.addValidation("{{$TABLE}}[sp_name]","req", "Please specify title.");
	frmvalidator.addValidation("{{$TABLE}}[sp_website]","req", "Please specify website.");
	frmvalidator.addValidation("{{$TABLE}}[sp_email]","req", "Please specify email.");
</script> 
   {{/if}} 
</div>
