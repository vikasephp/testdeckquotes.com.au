<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/tabview/tabcontent.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/tabview/tabcontent.js">  </script>

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/rangeslider/rangeSlider.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/rangeslider/rangeSlider.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>

	<script src="{{$BASE_URL}}ckeditor/ckeditor.js"></script>
	<script src="{{$BASE_URL}}ckeditor/samples/js/sample.js"></script>
	<link rel="stylesheet" href="{{$BASE_URL}}ckeditor/samples/css/samples.css">
	<link rel="stylesheet" href="{{$BASE_URL}}ckeditor/samples/toolbarconfigurator/lib/codemirror/neo.css">
    


{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<style>
#fancybox-wrap {z-index:99999;}
</style>


<div align="center" >
<h3 class="page-title">{{$title}}</h3><br />
<form name="detail" method="post" action="" enctype="multipart/form-data" id="test">

 							
   
   {{if !$opr}}
            
<table id="viewdoc-table" width="100%" cellpadding="0" cellspacing="0" style="border:1px solid #999;">
   <tr>
   <td colspan="2">
    <textarea name="td_reason" rows="15" cols="70" id="editor">
    {{$detail.td_reason}}
    </textarea>
    </td>
    </tr>
     
     <tr>    <td colspan="2" style="text-align:center;">
                    <input type="submit" name="alertsave" value="Save" class="vsml" />
                    <input type="button" name="btnCancelDetail" value="Cancel" onclick="javascript:parent.$.fancybox.close();" class="vsml" />
                </td>
      </tr>
    
    </table>  
      
     {{else}}
     	<div style="font-size:24px; height:99px; padding-top:150px;">{{$opr}}</div> 
{{/if}}


  </form>


</div>
   {{if !$opr}}
<script type="text/javascript" language="javascript" >
    var frmvalidator  = new Validator("detail");
    frmvalidator.EnableMsgsTogether();
    frmvalidator.addValidation("poincc[po_invoice_number]","req", "Please enter invoice number.");
</script>
{{/if}}

<script>
	initSample();
</script>