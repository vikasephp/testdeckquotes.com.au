<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>


<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>

<script>
	!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />


{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}



<h3 class="page-title"><br />View Text</h3>  
<div align="center" style="min-height:350px; z-index:9999999; padding-top:50px;">
    
    
   <textarea id = "myInput" readonly="readonly" rows="5" cols="150"> {{$data.ic_icon_text}} </textarea> <br /> <br /> <br />
   <input type="button" onclick="myFunction()" value="Copy Text" /> &nbsp;
   <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
 </div>  

    <script type="text/javascript">
		function closepop()
		{
		setTimeout('parent.close_win();', 500);
		}
	</script>
    

<script>
	initSample();
</script>

 <script type="application/javascript">
     
     function myFunction() {
  /* Get the text field */
	  var copyText = document.getElementById("myInput");
	
	  /* Select the text field */
	  copyText.select();
	  copyText.setSelectionRange(0, 99999); /* For mobile devices */
	
	   /* Copy the text inside the text field */
	  navigator.clipboard.writeText(copyText.value);
	
	  /* Alert the copied text */
	  alert("Icon Text has been copied. Now you paste it any where");
    }
     </script>