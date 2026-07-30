<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<div align="center">
  <h3 class="page-title">Calculator Stairs</h3>
  <form name="detail" method="post" action="{{$XFA.detail_stairs}}">
    <input type="hidden" name="{{$TABLEST}}[{{$IDST}}]" value="{{$detail.$IDST}}" id="slid"/>
    
    <table id="list-table" width="100%" cellpadding="0" cellspacing="0">
		<tr> <th class="back" colspan="10">Materials: Traditional Hardwood Stairs with Striner and Tread  </th></tr>
        <tr>
        <th width="15%">Height MM :</th>
        <td><input type="text" name="{{$TABLEST}}[cst_height_thss]" value="{{$detail.cst_height_thss}}" size="5" /></td>
        <th width="14%">Multipler :</th>
        <td><input type="text" name="{{$TABLEST}}[cst_multipler_thss]" value="{{$detail.cst_multipler_thss}}" size="5" /></td>
        <th width="15%">Width mm :</th>
        <td><input type="text" name="{{$TABLEST}}[cst_width_thss]" value="{{$detail.cst_width_thss}}" size="5" /></td>
        <th width="14%">Divider :</th>
        <td><input type="text" name="{{$TABLEST}}[cst_divider_thss]" value="{{$detail.cst_divider_thss}}" size="5" /></td>
        <th width="44%">Rate Per SQM - INC GST :</th>
        <td><input type="text" name="{{$TABLEST}}[cst_rate_per_sqm_thss]" value="{{$detail.cst_rate_per_sqm_thss}}" size="5" /></td>
        </tr>
        <tr> <th class="back" colspan="10">Labour:  Traditional Hardwood Stairs with Striner and Tread</th></tr>
        <th width="25%" colspan="3">Total :</th>
        <td colspan="2"><input type="text" name="{{$TABLEST}}[cst_total_thss]" value="{{$detail.cst_total_thss}}" size="5" /></td>
        <th width="25%" colspan="3">Cost Per Hour :</th>
        <td colspan="2"><input type="text" name="{{$TABLEST}}[cst_cost_per_hour_thss]" value="{{$detail.cst_cost_per_hour_thss}}" size="5" /></td>
        </tr>
        <tr><th class="back" colspan="10">Materials: Cascading covered or overlaid stairs open - not enclosed side open - (decking boards to face and treads with treated pine frame): </th></tr>
        <tr>
        <th>Height MM :</th>
        <td><input type="text" name="{{$TABLEST}}[cst_height_ccso]" value="{{$detail.cst_height_ccso}}" size="5" /></td>
        <th >Multipler :</th>
        <td><input type="text" name="{{$TABLEST}}[cst_multipler_ccso]" value="{{$detail.cst_multipler_ccso}}" size="5" /></td>
        <th >Width mm :</th>
        <td><input type="text" name="{{$TABLEST}}[cst_width_ccso]" value="{{$detail.cst_width_ccso}}" size="5" /></td>
        <th >Divider :</th>
        <td><input type="text" name="{{$TABLEST}}[cst_divider_ccso]" value="{{$detail.cst_divider_ccso}}" size="5" /></td>
        <th>Rate Per SQM - INC GST :</th>
        <td><input type="text" name="{{$TABLEST}}[cst_rate_per_sqm_ccso]" value="{{$detail.cst_rate_per_sqm_ccso}}" size="5" /></td>
        </tr>
        <tr> <th class="back" colspan="10">Labour: Cascading covered or overlaid stairs open - not enclosed side open - (decking boards to face and treads with treated pine frame):
</th></tr>

		<tr>
        <th width="25%" colspan="3">Total :</th>
        <td colspan="2"><input type="text" name="{{$TABLEST}}[cst_total_ccso]" value="{{$detail.cst_total_ccso}}" size="5" /></td>
        <th width="25%" colspan="3">Cost Per Hour :</th>
        <td colspan="2"><input type="text" name="{{$TABLEST}}[cst_cost_per_hour_ccso]" value="{{$detail.cst_cost_per_hour_ccso}}" size="5" /></td>
        </tr>
        <tr> <th class="back" colspan="10">Material: Floating treads (Central steel spine with 300mm wide x 50mm thick hardwood treads): </th></tr>
        <tr>
        <th >Height MM :</th>
        <td><input type="text" name="{{$TABLEST}}[cst_height_ft]" value="{{$detail.cst_height_ft}}" size="5" /></td>
        <th >Multipler :</th>
        <td><input type="text" name="{{$TABLEST}}[cst_multipler_ft]" value="{{$detail.cst_multipler_ft}}" size="5" /></td>
        <th >Width mm :</th>
        <td><input type="text" name="{{$TABLEST}}[cst_width_ft]" value="{{$detail.cst_width_ft}}" size="5" /></td>
        <th>Divider :</th>
        <td><input type="text" name="{{$TABLEST}}[cst_divider_ft]" value="{{$detail.cst_divider_ft}}" size="5" /></td>
        <th >Rate Per SQM - INC GST :</th>
        <td><input type="text" name="{{$TABLEST}}[cst_rate_per_sqm_ft]" value="{{$detail.cst_rate_per_sqm_ft}}" size="5" /></td>
        </tr>
        <tr> <th class="back" colspan="10">Floating treads (Central steel spine with 300mm wide x 50mm thick hardwood treads): </th></tr>
        <tr>
        <th width="25%" colspan="3">Total :</th>
        <td colspan="2"><input type="text" name="{{$TABLEST}}[cst_total_ft]" value="{{$detail.cst_total_ft}}" size="5" /></td>
        <th width="25%" colspan="3">Cost Per Hour :</th>
        <td colspan="2"><input type="text" name="{{$TABLEST}}[cst_cost_per_hour_ft]" value="{{$detail.cst_cost_per_hour_ft}}" size="5" /></td>
        </tr>
       
      </table>
      <br />
         
      <table id="list-table" width="100%" cellpadding="0" cellspacing="0"> 
	     
      <tr>
        <th> Status:</th>
        <td><select name="{{$TABLEST}}[cst_status]" class="lrg" style="width:150px;">
            <option value="1" {{if $detail.cst_status == 1}} selected="selected" {{/if}}> Active </option>
            <option value="0" {{if $detail.cst_status == 0}} selected="selected" {{/if}}> InActive </option>
          </select>
        </td>
      </tr>
      
      <tr>
        <td colspan="2" style="text-align:center;"><input type="submit" name="subAddDetail" value="Save" class="vsml" />
          <input type="button" name="btnCancelDetail" value="Cancel" onclick="document.location.href='{{$BASE_URL}}{{$XFA.list_stairs}}'" class="vsml" />
        </td>
      </tr>
    </table>
  </form>
</div>
<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("detail");
    frmvalidator.EnableMsgsTogether();
    //frmvalidator.addValidation("seller_listing[sl_business_id]","req", "Please specify Valid Business Name.");
</script>