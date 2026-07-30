    
<!--{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

	
<script type="text/javascript" src="http://www.google.com/jsapi"></script>
<script type="text/javascript">
	google.load("jquery", "1");
</script>-->

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<div align="left" style="min-height:300px; padding:15; border:2px solid #09F;">
    <h3 class="page-title">Meeting Details </h3>   <br /> <br />  
	
    {{$detail.rm_detail}}
  
</div>
<br />
<div style="text-align:center;">
<form name="scribedfile" method="post" action="" enctype="multipart/form-data">
<input type="hidden" name="rm_id" value="{{$rm_id}}" />
Upload Scribed File : <input type="file" name="file" /><br /> <br />
<input type="Submit"  name ="upload_file" value="Upload File" /> <br />
{{if $msg }} <strong> {{$msg}} </strong> {{/if}}
<br />
<input type="button" name="btnCancelDetail" value="Close" onclick="javascript:parent.$.fancybox.close();" class="vsml" /> 
</form>
</div>

