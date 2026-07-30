<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
	<script src="{{$BASE_URL}}ckeditor/ckeditor.js"></script>
	<script src="{{$BASE_URL}}ckeditor/samples/js/sample.js"></script>
	<link rel="stylesheet" href="{{$BASE_URL}}ckeditor/samples/css/samples.css">
	<link rel="stylesheet" href="{{$BASE_URL}}ckeditor/samples/toolbarconfigurator/lib/codemirror/neo.css">
    
{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

	<!-- Load jQuery -->
<script type="text/javascript" src="http://www.google.com/jsapi"></script>
<script type="text/javascript">
	google.load("jquery", "1");
</script>

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<div style="min-height:350px;">
    <h3 class="page-title">{{$title}} </h3>    
	<form name="drform" method="post" action="">
    <input type="hidden" name="draft[ed_id]" value="{{$detail.ed_id}}" />
    <input type="hidden" name="draft[fromname]" value="{{$detail.ed_fromname}}" />
    <input type="hidden" name="draft[fromemail]" value="{{$detail.ed_from}}" />
    <input type="hidden" name="draft[attachment]" value="{{$detail.ed_attachmentsend}}" />
    
    <table style="width:98% !important; border:1px solid #CCC;">
    <tr>
    <td>To Name : </td>
    <td><input type="text" name="draft[toname]" value="{{$detail.ed_toname}}" style="width:300px" /></td>
    <td>To Email</td><td><input type="text" name="draft[toemail]" value="{{$detail.ed_to}}" style="width:300px" /> </td>
    </tr>
    <tr>
    <td>Subject: </td> <td colspan="3"> <input type="text" name="draft[subject]" value="{{$detail.ed_subject}}" style="width:300px" /></td>
    
    <tr>
    <td colspan="4"> 
    <textarea rows="15" cols="70" id="editor" name="draft[emailbody]">{{$detail.ed_email_body}}</textarea>
    </td>
	</tr>
    <tr><td> Project Docs </td> 
    <td colspan="3"> <input type="text" name="draft[pdocs]" value="{{$detail.ed_proj_docs}}" style="width:960px" readonly="readonly" /></td> </tr>
    <tr><td> Template Docs </td> 
    <td colspan="3"> <input type="text" name="draft[tdocs]" value="{{$detail.ed_template_docs}}" style="width:960px" readonly="readonly" /></td> </tr>
    
    </tr>
    </table>
    <input type ="submit" name="send" value="Send Email"  />
    </form>
</div>

<script>
	initSample();
</script>