<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<h3 class="page-title">{{$title}}</h3>


<form name="detail" method="post" action=""> 
<table id="form-table" align="center" width="500"> 
       <tr> 
                  <th>Category Name</th><input type= "hidden" name="authors[cat_id]" value="{{$detail.cat_id}}" class="lrg" /> 
                             <td><input type= "text" name="authors[cat_name]" value="{{$detail.cat_name}}" class="lrg" /></td>        </tr>
        
<tr>
	<th>Category Status</th><td>
    			<select name="authors[cat_status]">
                	<option value="0" {{if $detail.cat_status == 0}} selected="selected" {{/if}}>Inactive</option>
                    <option value="1" {{if $detail.cat_status == 1}} selected="selected" {{/if}}>Active</option>
                </select>
    </td>
</tr>                                  
   <tr>
   <td colspan="2" style="text-align:center;">
          <input type="submit" name="subAddDetail" value="Submit" class="vsml button" />
                         <input type="button" name="btnCancelDetail" value="Cancel" onclick="window.location='{{$BASE_URL}}author.list';" class="vsml button"/> 
                                    </td>
</tr>
</table>
</form>
<script type="text/javascript" language="javascript" >    
    
    
    
    	var frmvalidator  = new Validator("detail");    
    	  	
    	frmvalidator.EnableMsgsTogether();
		frmvalidator.addValidation("authors[cat_name]","req", "Please specify Category Name");

</script>