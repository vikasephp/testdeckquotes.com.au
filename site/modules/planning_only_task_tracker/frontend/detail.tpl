<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />

{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<div align="center" style="min-height:350px;">
    <h3 class="page-title">Edit Planning Project Document</h3>    
   
  <form action="" id="uploadForm" method="post" enctype="multipart/form-data" name="iframe-form">
    <input type="hidden" id="uploadForm_doc_id" name="doc[pc_id]" value="{{$doc_data.pc_id}}" />
    <input type="hidden"  name="doc[pc_doc_id]" value="{{$doc_data.pc_doc_id}}" />
    <table cellpadding="0" cellspacing="0" class="table" id="list-table"  >
      <tr>
        <td><strong>Document/Plan:</strong></td>
        <td style="background-color:#E0E6FF;padding:5px; font-size:12px; font-weight:bold;">{{$doc_data.pc_document}}</td>
      </tr>
      <tr>
        <td><strong>Type:</strong></td>
        <td>{{$doc_data.pc_type}}</td>
      </tr>
      
     <tr>
        <td><strong>Link:</strong></td>
        <td>{{$doc_data.pc_link}}</td>
      </tr>
      
       <tr>
        <td><strong>Planning Plans:</strong></td>
        <td><input type="text" name="doc[pc_live_link]" value="{{$doc_data.pc_live_link}}"  style="width:700px;"/></td>
      </tr>
      
        <tr>
        <td><strong>Design Plans:</strong></td>
        <td><input type="text" name="doc[pc_design_plan]" value="{{$doc_data.pc_design_plan}}"  style="width:700px;"/></td>
       </tr>
      
<!--        <tr>
        <td><strong>Document Checklist Link:</strong></td>
        <td><input type="text" name="doc[pc_document_checklist]" value="{{$doc_data.pc_document_checklist}}"  style="width:700px;"/></td>
       </tr>-->
      
     <!--  <tr>
        <td><strong>Rules:</strong></td>
        <td><input type="text" name="doc[pc_rules]" value="{{$doc_data.pc_rules}}"  style="width:700px;"/></td>
      </tr>-->
      
      <tr>
        <td colspan="2" style="text-align:center;">
            <input type="submit"  value="Save" name="subAddDetail" id="uploadForm_submit_iframe" style="cursor:pointer;" />
          <input type="button"  value="Cancel" onclick="parent.$.fancybox.close();" style="cursor:pointer;" />
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
    
<!--	<script type="text/javascript" language="javascript" >
        	var frmvalidator  = new Validator("detail");
		frmvalidator.EnableMsgsTogether();
		frmvalidator.addValidation("{{$TABLE}}[wa_project]","req", "Please specify project.");

        </script>-->


<script>
	initSample();
</script>