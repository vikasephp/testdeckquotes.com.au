<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>

 <script type="text/javascript" src="{{$BASE_URL}}js/ckeditor2/ckeditor.js"></script>
 <script type="text/javascript" src="{{$BASE_URL}}js/ckeditor2/samples/js/sample.js"></script>
 <script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
 
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<!--<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tabview/tabcontent.css" />-->
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/tabview/tabcontent.js">  </script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

<!--Ajax Common function-->
<script type="text/javascript">
 
	 
// We create the HTTP Object
{{if $detail.$ID}}
setTimeout('show_doclist();', 500);
{{/if}}
</script>

{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);

</script>
{{/if}}

<div align="center">
<h3 class="page-title">{{$title}}</h3><br /><br />
   							
   
   {{if !$opr}}
   
 <form name="detail" method="post" action="{{$XFA.detail}}" enctype="multipart/form-data">
 <input type="hidden" name="street_sign[ss_id]" value="{{$detail.$ID}}" id="dh_id"/>
 
     <table id="list-table" width="100%" cellpadding="0" cellspacing="0">
     
        <tr>
            <th colspan="1">Propoerty Address:</th>
            <td colspan="3"> <!--<input type="text" name="street_sign[ss_address]" value="{{$detail.ss_address}}" style="width:500px;"/>-->
            
            <datalist id='project'>
           {{foreach from=$projdetail key="key" item="item"}}
            <option value="{{$item.bsn_name}}" {{if $detail.ss_address eq $item.ss_address}} selected="selected" {{/if}}>
            {{$item.bsn_name}}
            </option>
            {{/foreach}}
  	 </datalist>
         <input type="text" list = 'project' name="street_sign[ss_address]" style ="width:700px" value="{{$detail.ss_address}}" />
            
            </td>
        </tr>
        
        <tr>
        <th>Have Sign:</th>
        <td><select name="street_sign[ss_have_sign]" >
             <option value="No"  {{if $detail.ss_have_sign == 'No'}} selected="selected" {{/if}}>No</option>
            <option value="Yes" {{if $detail.ss_have_sign == 'Yes'}} selected="selected" {{/if}}>Yes</option>
             </select>

        <th>Have Banner:</th>
        <td><select name="street_sign[ss_have_banner]" >
            <option value="No"  {{if $detail.ss_have_banner == 'No'}}  selected="selected" {{/if}}>No</option>
            <option value="Yes" {{if $detail.ss_have_banner == 'Yes'}} selected="selected" {{/if}}>Yes</option>
            </select>
        </tr>  
 
        <tr>
            <th>Date Sign Up :</th>
            <td> <input type="text" name="street_sign[ss_date_signup]" value="{{$detail.ss_date_signup}}" class="w16em dateformat-d-ds-m-ds-Y" id="demo1" maxlength="25" /></td>
 
            <th>Date Sign Down :</th>
            <td> <input type="text" name="street_sign[ss_date_signdown]" value="{{$detail.ss_date_signdown}}" class="w16em dateformat-d-ds-m-ds-Y" id="demo2" maxlength="25" /></td>
        </tr>
       
       
        <tr>
            <th>Date Banner Up :</th>
            <td> <input type="text" name="street_sign[ss_date_bannerup]" value="{{$detail.ss_date_bannerup}}" class="w16em dateformat-d-ds-m-ds-Y" id="demo3" maxlength="25" /></td>
  
            <th>Date Banner Down :</th>
            <td> <input type="text" name="street_sign[ss_date_bannerdown]" value="{{$detail.ss_date_bannerdown}}" class="w16em dateformat-d-ds-m-ds-Y" id="demo4" maxlength="25" /></td>
        </tr> 
        
       <tr>
            <th>Sign Number:</th>
            <td> <input type="text" name="street_sign[ss_sign_number]" value="{{$detail.ss_sign_number}}" style="width:200px;"/></td>
        </tr>
        
         <tr>
                <th>Notes:</th>
                <td width="970px" colspan="3" >
                <textarea cols="200" id="editor"  name="street_sign[ss_notes]" rows="40">{{$detail.ss_notes}}</textarea>    
                </td>
         </tr>
        
          <tr>
                <th>Street Sign Image:</th>
                <td><input type="file" name = "sign"  /></td>
         </tr>
         
          <tr>
                <th>ACTMapi Aerial Block Image:</th>
                <td><input type="file" name = "actmapi"  /></td>
         </tr>
         
           <tr>
                <th>Banner Image:</th>
                <td><input type="file" name = "banner"  /></td>
         </tr>
        
        
        <tr>
                <td colspan="4" style="text-align:center;">
                    <input type="submit" name="subAddDetail" value="Save" class="vsml" /> &nbsp; &nbsp;
                    <input type="button" name="btnCancelDetail" value="Cancel" onclick="javascript:parent.$.fancybox.close();" class="vsml" />
                </td>
        </tr>
           
            
		</table>
      </form>
       
     {{else}}
     	<div style="font-size:24px; height:99px; padding-top:150px;">{{$opr}}</div> 
{{/if}}
</div>
   {{if !$opr}}
<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("detail");
    frmvalidator.EnableMsgsTogether();
    frmvalidator.addValidation("street_sign[ss_address]","req", "Please specify address.");
</script>
{{/if}}

<script>
	initSample();
</script>