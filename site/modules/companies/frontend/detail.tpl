<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
  <script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
	<script src="{{$BASE_URL}}ckeditor2/ckeditor.js"></script>
	<script src="{{$BASE_URL}}ckeditor2/samples/js/sample.js"></script>

	<script type="text/javascript">
           CKEDITOR.replace( 'editor1' );
           CKEDITOR.add  
        </script>

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<div align="center" style="min-height:350px;">
    <h3 class="page-title">{{$title}}</h3>    
   
   {{if $msg }} <span style="color:#F00;"><strong>{{$msg }}</strong></span>{{/if}}
<form name="detail" method="post" action="{{$XFA.detail}}"  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   <tr>
     <th>Category</th>
     <td>
     <datalist id='catg'>
           {{foreach from=$catgdetail  key="key3" item="item3"}}
            <option value="{{$item3.co_option}}" {{if $detail.co_categry eq $item3.co_option}} selected="selected" {{/if}}>
            {{$item3.co_option}}
            </option>
            {{/foreach}}
  	 </datalist>
         <input type="text" list = 'catg' name="{{$TABLE}}[co_categry]" style ="width:700px" value="{{$detail.co_categry}}" />

    </tr>
    
    <tr>
     <th>Company Name</th>
     <td><input  type="text" name="{{$TABLE}}[co_company_name]"  value="{{$detail.co_company_name}}" style="width:700px;" /> </td>
    </tr>  
    
    <tr>
     <th>Rating</th>
     <td>
     <select name="{{$TABLE}}[co_rating]" >
     <option value="">Please Select</option>
     <option value="0" {{if $detail.co_rating eq '0' }} selected="selected" {{/if}}>0</option>
     <option value="1" {{if $detail.co_rating eq '1' }} selected="selected" {{/if}}>1</option>
     <option value="2" {{if $detail.co_rating eq '2' }} selected="selected" {{/if}}>2</option>
     <option value="3" {{if $detail.co_rating eq '3' }} selected="selected" {{/if}}>3</option>
     <option value="4" {{if $detail.co_rating eq '4' }} selected="selected" {{/if}}>4</option>
     <option value="5" {{if $detail.co_rating eq '5' }} selected="selected" {{/if}}>5</option>
     <option value="Do Not Use" {{if $detail.co_rating eq 'Do Not Use' }} selected="selected" {{/if}}>Do Not Use</option>
     <option value="NA"  {{if $detail.co_rating eq 'NA' }} selected="selected" {{/if}}>N/A</option>
     <option value="New" {{if $detail.co_rating eq 'New' }} selected="selected" {{/if}}>New</option>
     </select>
     </td>
    </tr>  
         
   
    <tr>
     <th>Address</th>
     <td><input  type="text" name="{{$TABLE}}[co_address]"  value="{{$detail.co_address}}" style="width:700px;" /> </td>
    </tr> 
    
   
    <tr>
     <th>Website</th>
     <td> <input type="text" name="{{$TABLE}}[co_website]" value="{{$detail.co_website}}" style="width:700px;"  /> </td>
    </tr>
   
    <tr>
     <th>Responsible Status</th>
     <td>
     <!--<select name="{{$TABLE}}[co_resp_status]" >
     <option value="">Please Select</option>
     {{foreach from=$bsdata key="key" item="item"}}
     <option value="{{$item.st_name}}" {{if $detail.co_resp_status eq $item.st_name }} selected="selected" {{/if}}>{{$item.st_name}}</option>
     {{/foreach}}
     </select>-->
     <select name="{{$TABLE}}[co_resp_status]">
     <option value="">Please Select</option>
     {{foreach from = $rddata key="key" item="item"}}
     <option value="{{$item.to_option}}" {{if $detail.co_resp_status eq $item.to_option }} selected="selected" {{/if}}>{{$item.to_option}}</option>
     {{/foreach}}
    </select>
     </td>
    </tr>  
    
    <tr>
        <th>Notes:</th>
        <td>
        <textarea rows="8" name="{{$TABLE}}[co_notes]" id="editor1" class="ckeditor">{{$detail.co_notes|stripslashes}}</textarea>    
       </td>
    </tr>
  

    <tr>
        <td colspan="2" style="text-align:center;">
            <!--<input type="submit" name="print" value="Print" class="vsml" />-->
            <input type="submit" name="subAddDetail" value="Save" class="vsml" />
           <!-- <input type="button" name="btnCancelDetail" value="Cancel" onclick="javascript:parent.$.fancybox.close();" class="vsml" />-->
            <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
        </td>
    </tr>
</table>
</form>
    
    <script type="text/javascript">
		function closepop()
		{
		setTimeout('parent.close_win();', 500);
		}
	</script>
    
	<script type="text/javascript" language="javascript" >
        var frmvalidator  = new Validator("detail");
			frmvalidator.EnableMsgsTogether();
			frmvalidator.addValidation("{{$TABLE}}[co_categry]","req", "Please specify category.");
			frmvalidator.addValidation("{{$TABLE}}[co_company_name]","req", "Please specify company name.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_contact_name]","req", "Please specify contact name.");
    </script>
</div>

<script>
	initSample();
</script>