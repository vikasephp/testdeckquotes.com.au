<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
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


<div align="center" style="min-height:350px;">
    <h3 class="page-title">{{$title}} </h3>    
	<form>
    <textarea rows="50" cols="90" id="editor">
   {{$emailData.elog_email_body}}
    </textarea>
    </form>
</div>

<script>
	initSample();
</script>

<!--<h2 class="subtitle">Subject : {{$emailData.et_subject}} </h2>
<h2 class="subtitle">Date    : {{$emailData.et_date|date_format:"%d/%m/%Y"}} </h2>
<br />-->

<!--{{if $attachment }}

<h2 class="subtitle"> Attachment : </h2>
 {{foreach from=$attachment key="key" item="item"}}
 	{{$item}} <br /> 
  {{/foreach}}
{{/if}}

<br />-->



