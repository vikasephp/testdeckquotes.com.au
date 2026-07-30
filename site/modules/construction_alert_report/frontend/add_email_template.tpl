<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tabview/tabcontent.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>

	<script src="{{$BASE_URL}}ckeditor/ckeditor.js"></script>
	<script src="{{$BASE_URL}}ckeditor/samples/js/sample.js"></script>
	<link rel="stylesheet" href="{{$BASE_URL}}ckeditor/samples/css/samples.css">
	<link rel="stylesheet" href="{{$BASE_URL}}ckeditor/samples/toolbarconfigurator/lib/codemirror/neo.css">

<style>
#fancybox-wrap {z-index:99999;}
</style>
       

{{if $opr}}
<script type="text/javascript">
//setTimeout('parent.close_win();', 500);
window.location.href = "{{$BASE_URL}}construction_alert_report.view_email_templates";
</script>
{{/if}}

	

<div align="center" style="min-height:350px; padding-top:10px;">
    <h3 class="page-title">Add/Edit Email Template</h3>    
   
   
<form name="detail" method="post" action="{{$XFA.add_task}}"  enctype="multipart/form-data">
<table id="viewdoc-table" width="100%" cellpadding="5">
    <input type="hidden" name="email[et_id]" value="{{$detail.et_id}}" />
    <!--<input type="hidden" name="email[tdt_dt_id]" value="{{$dt_id}}" />-->
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
     <tr>
     <th>Email Type </th>
     <td><select name="email[et_type]" style="width:300px;"/>
                <option value="Suppliers"   {{if  $detail.et_type == 'Suppliers'}}selected{{/if}}>Suppliers</option>
                 <option value="Customers"   {{if  $detail.et_type == 'Customers'}}selected{{/if}}>Customers</option>
                 <option value="Staff"       {{if  $detail.et_type == 'Staff'}}selected{{/if}}>Staff</option>
        </select>  
    </td>
    </tr>  
    
    
    <tr>
     <th>Email Subject</th>
     <td>
          <input type="text"  name="email[et_subject]" style ="width:700px" value="{{$detail.et_subject}}" />
      </td>
    </tr>
     
   <tr>
     <th>Email Content</th>
     <td><textarea name="email[et_content]" cols="100" rows="10" id="editor"/>{{$detail.et_content}} </textarea></td>
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
		//setTimeout('parent.close_win();', 500);
		window.location.href = "{{$BASE_URL}}construction_alert_report.view_email_templates";
		}
	</script>
    
	<script type="text/javascript" language="javascript" >
        var frmvalidator  = new Validator("detail");
			frmvalidator.EnableMsgsTogether();
			frmvalidator.addValidation("email[et_subject]","req", "Please specify Subject.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_company_name]","req", "Please specify company name.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_contact_name]","req", "Please specify contact name.");
    </script>
</div>

<script>
	initSample();
</script>