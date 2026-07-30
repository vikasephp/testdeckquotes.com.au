<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<div align="center" style="min-height:350px;">
    <h3 class="page-title">{{$title}}</h3>    
   
   
<form name="detail" method="post" action="{{$XFA.detail}}"  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
    
     <input type="hidden" name="{{$TABLE}}[wa_image_1]" value="{{$detail.wa_image_1}}" />
     <input type="hidden" name="{{$TABLE}}[wa_image_2]" value="{{$detail.wa_image_2}}" />
     <input type="hidden" name="{{$TABLE}}[wa_image_3]" value="{{$detail.wa_image_3}}" />
     <input type="hidden" name="{{$TABLE}}[wa_image_4]" value="{{$detail.wa_image_4}}" />
     <input type="hidden" name="{{$TABLE}}[wa_image_5]" value="{{$detail.wa_image_5}}" />
    
    
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
    <tr>
     <th>Project</th>
     <td>
   	<datalist id='project'>
           {{foreach from=$projdetail key="key3" item="item3"}}
            <option value="{{$item3.bsn_name}}" {{if $bsnid eq $item3.bsn_id}} selected="selected" {{/if}}>
            {{$item3.bsn_name}}
            </option>
            {{/foreach}}
  	 </datalist>
         <input type="text" list = 'project' name="{{$TABLE}}[wa_project]" style ="width:700px" value="{{$detail.wa_project}}" />
      </td>
    </tr>


     <tr>
        <th>Problem:</th>
        <td><textarea rows="5" cols="125" name="{{$TABLE}}[wa_problem]" >{{$detail.wa_problem|stripslashes}}</textarea></td>
     </tr>
  <tr>
  <th> Upload Image </th> 
  <td> <input type="file" name="image1" />
       <input type="file" name="image2" />
       <input type="file" name="image3" />
       <input type="file" name="image4" />
       <input type="file" name="image5" />
  </td>      
  </tr>
  
  <tr>
  <th> Upload Video </th> 
  <td> <input type="file" name="video_file" /> </td>      
  </tr>
  
   <tr>
        <th>Notes:</th>
        <td><textarea rows="5" cols="125" name="{{$TABLE}}[wa_notes]" >{{$detail.wa_notes|stripslashes}}</textarea></td>
     </tr>

    
    <tr>
     <th>Date Inspected On site </th>
     <td><input  type="text" name="{{$TABLE}}[wa_date_inspected]"  value="{{$detail.wa_date_inspected}}" class="w16em dateformat-d-ds-m-ds-Y dtpic" /> </td>
    </tr>
  
    <tr>
     <th>Last Spoken </th>
     <td><input  type="text" name="{{$TABLE}}[wa_last_spoken]"  value="{{$detail.wa_last_spoken}}" class="w16em dateformat-d-ds-m-ds-Y dtpic" /> </td>
    </tr>
    
    <tr>
     <th>CGFB Person</th>
     <td><input  type="text" name="{{$TABLE}}[wa_cgfb_person]"  value="{{$detail.wa_cgfb_person}}" style="width:700px;" /> </td>
    </tr>
    
    <tr>
     <th>Who</th>
     <td><input  type="text" name="{{$TABLE}}[wa_who]"  value="{{$detail.wa_who}}" style="width:700px;" /> </td>
    </tr>
    
     <tr>
     <th>Trade</th>
     <td>
      <form name ="recmet2" method="post" action="">
      
     
        
        <a href ="{{$BASE_URL}}trade_responsibility.include_suppliers/wa_id/{{$detail.wa_id}}" class="various">Include Trade</a> &nbsp; &nbsp;
       {{$detail.wa_include_supplier}} 
     
     </td>
    </tr>
    
    
   <!--  <tr>
     <th>Supplier or Contact</th>
     <td>
     <datalist id='sup'>
           {{foreach from=$compdetail  key="key2" item="item2"}}
            <option value="{{$item2.co_company_name}}" {{if $detail.wa_supplier eq $item2.co_company_name}} selected="selected" {{/if}}>
            {{$item2.co_company_name}}
            </option>
            {{/foreach}}
     </datalist>
         <input type="text" list = 'sup' name="{{$TABLE}}[wa_supplier]" style ="width:700px" value="{{$detail.wa_supplier}}" />
    </td>
    </tr>-->
    
    <tr>
     <th>Status </th>
     <td><select name="{{$TABLE}}[wa_status]" style="width:300px;"/>
                 <option value="Open"   {{if  $detail.wa_status == 'Open'}}selected{{/if}}>Open</option>
                 <option value="Closed" {{if  $detail.wa_status == 'Closed'}}selected{{/if}}>Closed</option>
        </select>  
    </td>
    </tr> 
  
  <tr>
  <th> Credit Note </th> 
  <td> <input type="file" name="credit_note" /> </td>      
  </tr>
  
  
  
    <tr>
        <td colspan="2" style="text-align:center;">
          <input type="submit" name="subAddDetail" value="Save" class="vsml" />
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
			frmvalidator.addValidation("{{$TABLE}}[wa_project]","req", "Please specify project.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_company_name]","req", "Please specify company name.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_contact_name]","req", "Please specify contact name.");
    </script>
</div>

