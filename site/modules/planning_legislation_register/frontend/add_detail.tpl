<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

{{if $opr}}
<script type="text/javascript">
//window.location.href = "{{$BASE_URL}}{{$BASEFOLDER}}.home";
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
<h3 class="page-title">{{$title}} Detail</h3>    
    
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="{{$TABLE}}[plr_id]" value="{{$detail.plr_id}}" />
	
            <tr>
                <th>Document Name</th>
                <td><input type="text" name="{{$TABLE}}[plr_doc_name]" style="width:700px" value="{{$detail.plr_doc_name}}" /></td>
            </tr>
	
     		
    		<tr>
				<th>Document Type</th>
				<td>
					<select name="{{$TABLE}}[plr_doc_type]" />
					<option value="0" {{if $detail.plr_doc_type eq 0 }} selected="selected" {{/if}}>Please Select </option>
					{{foreach from = $typedata key="key2" item="item2"}}
					<option value="{{$item2.pd_id}}|{{$item2.pd_hierarchy}}" {{if $item2.pd_id eq $detail.plr_doc_type }} selected="selected"
						{{/if}}>{{$item2.pd_doc_type}}</option>
					{{/foreach}}
					</select>
				</td>
			</tr>
            
            <tr>
				<th>Original Format</th>
				<td>
					<select name="{{$TABLE}}[plr_original_format]" />
					<option value="0" {{if  $detail.plr_original_format eq 0 }} selected="selected" {{/if}}>Please Select </option>
					<option value="1" {{if  $detail.plr_original_format eq 1 }} selected="selected" {{/if}}>HTML</option>
					<option value="2" {{if  $detail.plr_original_format eq 2 }} selected="selected" {{/if}}>PDF</option>
                    <option value="3" {{if  $detail.plr_original_format eq 3 }} selected="selected" {{/if}}>HTML + PDF</option>
					</select>
				</td>
			</tr>
            
            
            <tr>
                <th>Original Source URL</th>
                <td>
                <input type="hidden" name="{{$TABLE}}[source]" style="width:700px" value="{{$detail.plr_original_source}}" />
                <input type="text"   name="{{$TABLE}}[plr_original_source]" style="width:700px" value="{{$detail.plr_original_source}}" />
                </td>
            </tr>
    
    
     		<tr>
                <th>Original PDF URL</th>
                <td>
                 <input type="hidden" name="{{$TABLE}}[pdf]" style="width:700px" value="{{$detail.plr_original_source}}" />
                 <input type="text" name="{{$TABLE}}[plr_original_pdf]" style="width:700px" value="{{$detail.plr_original_pdf}}" />
                </td>
            </tr>
            
            
            <tr>
                <th>Public HTML URL</th>
                <td>
                 <!--<input type="hidden" name="{{$TABLE}}[internalhtml]"     style="width:700px" value="{{$detail.plr_int_html_url}}" />
                 <input type="text"   name="{{$TABLE}}[plr_int_html_url]" style="width:700px" value="{{$detail.plr_int_html_url}}" />-->
				 <input type="file" name="{{$TABLE}}[plr_int_html_url]" />
				{{ if $detail.plr_int_html_url }}
				<a href="{{$BASE_URL}}{{$BASEFOLDER}}.download_content?file_name={{$detail.plr_int_html_url}}&module_name={{$BASEFOLDER}}.home" target="_blank">Link</a>
				{{/if}}
                </td>
            </tr>
            
            
             <tr>
				<th>Public HTML Status</th>
				<td>
					<select name="{{$TABLE}}[plr_int_html_status]" />
					<option value="0" {{if  $detail.plr_int_html_status eq 0 }} selected="selected" {{/if}}>Please Select </option>
					<option value="1" {{if  $detail.plr_int_html_status eq 1 }} selected="selected" {{/if}}>Not Started</option>
					<option value="2" {{if  $detail.plr_int_html_status eq 2 }} selected="selected" {{/if}}>In Progress</option>
                    <option value="3" {{if  $detail.plr_int_html_status eq 3 }} selected="selected" {{/if}}>Complete</option>
					</select>
				</td>
			</tr>
    
    		<tr>
                <th>Code / Instrument</th>
                <td><input type="text" name="{{$TABLE}}[plr_code]" style="width:700px" value="{{$detail.plr_code}}" /></td>
            </tr>


	
            <tr>
                 <th>Effective Date</th>
                 <td><input type="text" name="{{$TABLE}}[plr_edate]" value="{{$detail.plr_edate}}" id="demo" class="w16em dateformat-d-ds-m-ds-Y dtpic"/> </td>
            </tr>
            
            
            <tr>
                <th>Subject</th>
                <td><input type="text" name="{{$TABLE}}[plr_subject]" style="width:700px" value="{{$detail.plr_subject}}" /></td>
            </tr>

	
	
	
	
	
   
    <tr>
        <td colspan="2" style="text-align:center;">
          <input type="submit" name="subAddDetail" value="Save" class="vsml" />
          <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:parent.$.fancybox.close();" class="vsml" />
        </td>
    </tr>
</table>
</form>
    
<script type="text/javascript">
function closepop()
{
	window.location.href = "{{$BASE_URL}}{{$BASEFOLDER}}.home";
}
</script>

<script type="text/javascript" language="javascript" >
	var frmvalidator  = new Validator("detail");
	frmvalidator.EnableMsgsTogether();
	frmvalidator.addValidation("type[bac_address]","req", "Please specify Address.");
</script>
</div>