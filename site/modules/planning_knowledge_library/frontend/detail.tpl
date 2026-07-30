<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />

<style>
.chk input[type="checkbox"] {
  display: none;
}

 input[type="checkbox"] + label:before {
  background: #F00 ;	
  border: 1px solid #7f83a2;
  content: "\00a0";
  display: inline-block;
  font: 16px/1em sans-serif;
  height: 16px;
  margin: 0 .25em 0 0;
  padding: 0;
  vertical-align: top;
  width: 16px;
}
 input[type="checkbox"]:checked + label:before {
  background: #FFF ;
  color: #666;
  content: "\2713";
  text-align: center;
  cursor:pointer;
}
</style>

<script src="{{$BASE_URL}}ckeditor2/ckeditor.js"></script>
<script src="{{$BASE_URL}}ckeditor2/samples/js/sample.js"></script>

<script type="text/javascript">
   CKEDITOR.replace( 'editor1' );
   CKEDITOR.add  
</script>

<script type="text/javascript">
   CKEDITOR.replace( 'editor2' );
   CKEDITOR.add  
</script>

{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<div align="center" style="min-height:350px;">
<br/><br/>
<h3 class="page-title">{{$title}}</h3>    

<form name="detail" method="post" action="{{$XFA.detail}}"  enctype="multipart/form-data">
	<table id="list-table" width="100%">
		<input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
		{{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
		
		<tr>
			<th width="150">Document Name:</th>
			<td>
				<input type="text" name="planning_knowledge_library[pkl_name]" value="{{$detail.pkl_name}}" style="width: 90%;"/>
			</td>
		</tr>
		
		<tr>
			<th width="150">Document File:</th>
			<td>
				<input type="file" name="planning_knowledge_library[pkl_doc]" />
				{{ if $detail.pkl_doc }}
				<a href="{{$BASE_URL}}{{$BASEFOLDER}}.download_content?file_name={{$detail.pkl_doc}}&module_name={{$BASEFOLDER}}.home" target="_blank">View/Download</a>
				{{/if}}
			</td>
		</tr>
		
		<tr>
			<th width="150">Document Link:</th>
			<td>
				<input type="text" name="planning_knowledge_library[pkl_link]" value="{{$detail.pkl_link}}" style="width: 90%;" />
			</td>
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
		frmvalidator.addValidation("{{$TABLE}}[question]","req", "Please specify question.");
</script>
</div>
<script>
	initSample();
</script>