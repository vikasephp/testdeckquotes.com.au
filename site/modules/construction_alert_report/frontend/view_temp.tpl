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


<div align="center" >
<h3 class="page-title">{{$title}}</h3><br />
<form name="detail" method="post" action="" enctype="multipart/form-data" id="test">
   
            
<table id="viewdoc-table" width="100%" cellpadding="0" cellspacing="0" style="border:1px solid #999;">
   <tr>
   <td colspan="2">
    <textarea name="alert_text" rows="15" cols="70" id="editor">
    {{$detail.et_content}}
    </textarea>
    </td>
    <tr>
      
     <tr>    <td colspan="2" style="text-align:center;">
                
                    <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:parent.$.fancybox.close();" class="vsml" />
                </td>
      </tr>
    
    </table>  
 
  </form>

</div>
   
<script>
	initSample();
</script>