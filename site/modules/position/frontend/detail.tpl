<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>
<div align="center">
  <h3 class="page-title">{{$title}}</h3>
  <form name="detail" method="post" action="{{$XFA.detail}}" enctype="multipart/form-data">
    <table id="list-table" width="90%">
      <input type="hidden" name="position[p_id]" value="{{$detail.p_id}}" />
      <tr>
        <th>Title:</th>
        <td><input type= "text" name="position[p_name]" value="{{$detail.p_name}}" class="xlrg" /></td>
      </tr>
      <tr>
        <th>Report To:</th>
        <td><select name="position[p_report]" >
            <option value="0" selected="selected" >--Select--</option>
            {{foreach from=$positions key="key" item="item"}}
            <option value="{{$item.p_id}}" {{if $detail.p_report == $item.p_id}} selected="selected" {{/if}}>{{$item.p_name}}</option>
            {{/foreach}}
          </select>
        </td>
      </tr>
      <tr>
        <th>Email:</th>
        <td><input type="text" name="position[p_email]" value="{{$detail.p_email}}" class="xlrg"/></td>
      </tr>
      <tr>
        <th>Description:</th>
        <td><textarea cols="100" rows="4" name="position[p_description]" class="xlrg">{{$detail.p_description}}</textarea></td>
      </tr>
      <tr>
     <tr>
        <th>Upload Position Agreement Doc:</th>
        <td><input type="file" name="pdoc"/>{{if $detail.p_document}} {{$detail.p_document}} 
         <span style="padding-left:15px;">
          <a href="{{$BASE_URL}}position.delete_doc/p_id/{{$detail.p_id}}/field/p_document" onclick="javascript:if(!confirm('Are you sure you want to delete the Status?')) return false;"><img style="height: 12px;; width:12px" src="{{$BASE_URL}}/images/delete-icon.png"/></a>
          </span>
          {{/if}}
        </td>
      </tr>
      <tr>
      
      <tr>
        <th>Upload Relevant Award Doc:</th>
        <td><input type="file" name="pdoc2"/>{{if $detail.p_relevant_award}} {{$detail.p_relevant_award}} 
         <span style="padding-left:15px;">
          <a href="{{$BASE_URL}}position.delete_doc/p_id/{{$detail.p_id}}/field/p_relevant_award" onclick="javascript:if(!confirm('Are you sure you want to delete the Status?')) return false;"><img style="height: 12px;; width:12px" src="{{$BASE_URL}}/images/delete-icon.png"/></a>
          </span>
        
        {{/if}}</td>
      </tr>
      <tr>
      
      <tr>
        <th>Upload Position Budgeting Tool Doc:</th>
        <td><input type="file" name="pdoc3"/>{{if $detail.p_position_budget_tool}} {{$detail.p_position_budget_tool}}
         <span style="padding-left:15px;">
          <a href="{{$BASE_URL}}position.delete_doc/p_id/{{$detail.p_id}}/field/p_position_budget_tool" onclick="javascript:if(!confirm('Are you sure you want to delete the Status?')) return false;"><img style="height: 12px;; width:12px" src="{{$BASE_URL}}/images/delete-icon.png"/></a>
          </span>
        
         {{/if}}</td>
      </tr>
      <tr>
      
      <tr>
        <th>Upload Advertising Text Doc:</th>
        <td><input type="file" name="pdoc4"/>{{if $detail.p_advertising_text}} {{$detail.p_advertising_text}}
           <span style="padding-left:15px;">
          <a href="{{$BASE_URL}}position.delete_doc/p_id/{{$detail.p_id}}/field/p_advertising_text" onclick="javascript:if(!confirm('Are you sure you want to delete the Status?')) return false;"><img style="height: 12px;; width:12px" src="{{$BASE_URL}}/images/delete-icon.png"/></a>
          </span>
        
         {{/if}}</td>
      </tr>
      <tr>
      
       <tr>
        <th>Upload Letter of Offer Doc:</th>
        <td><input type="file" name="pdoc5"/>{{if $detail.p_letter_of_offer}} {{$detail.p_letter_of_offer}} 
          <span style="padding-left:15px;">
          <a href="{{$BASE_URL}}position.delete_doc/p_id/{{$detail.p_id}}/field/p_letter_of_offer" onclick="javascript:if(!confirm('Are you sure you want to delete the Status?')) return false;"><img style="height: 12px;; width:12px" src="{{$BASE_URL}}/images/delete-icon.png"/></a>
          </span>
        
        {{/if}}</td>
      </tr>
      <tr>
      
       <tr>
        <th>Upload Learning and Development Doc:</th>
        <td><input type="file" name="pdoc6"/>{{if $detail.p_learning_development}} {{$detail.p_learning_development}}
        <span style="padding-left:15px;">
          <a href="{{$BASE_URL}}position.delete_doc/p_id/{{$detail.p_id}}/field/p_learning_development" onclick="javascript:if(!confirm('Are you sure you want to delete the Status?')) return false;"><img style="height: 12px;; width:12px" src="{{$BASE_URL}}/images/delete-icon.png"/></a>
          </span>
        
         {{/if}}</td>
      </tr>
      <tr>
      
        <tr>
        <th>Payrate Link:</th>
        <td><input type= "text" name="position[p_payrate_link]" value="{{$detail.p_payrate_link}}" style="width:600px;"  /></td>
      </tr>
      <tr>
      
        <tr>
        <th>Adward Link:</th>
        <td><input type= "text" name="position[p_adward_link]" value="{{$detail.p_adward_link}}" style="width:600px;" /></td>
      </tr>
      <tr>
      
        <th>Status:</th>
        <td><select name="position[p_status]" >
            <option value="0" {{if $detail.p_status == 1}} selected="selected" {{/if}}>Inactive</option>
            <option value="1" {{if $detail.p_status == 1}} selected="selected" {{/if}}>Active</option>
          </select>
      </tr>
      <tr>
        <td colspan="2" height="20px">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="2" style="text-align:center;"><input type="submit" name="subAddDetail" value="Save" class="vsml" />
          <input type="button" name="btnCancelDetail" value="Cancel" onclick="document.location.href='{{$BASE_URL}}{{$XFA.list}}'" class="vsml" />
        </td>
      </tr>
    </table>
  </form>
</div>
<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("detail");
    frmvalidator.EnableMsgsTogether();
    frmvalidator.addValidation("{{$TABLE}}[p_name]","req", "Please specify title.");
	frmvalidator.addValidation("{{$TABLE}}[p_email]","req", "Please specify email.");
	frmvalidator.addValidation("{{$TABLE}}[p_email]","email", "Please specify valid email.");
</script>