<script type="text/javascript" language="javascript" src="{{$BASE_URL}}/js/form_validator/gen_validatorv31.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type='text/javascript' src='{{$BASE_URL}}js/jquery.js'></script>
<script type='text/javascript' src='{{$BASE_URL}}js/jsfunction.js'></script>
{{if $msg == 1}}
<script type="text/javascript">
	parent.requestadvertsDiv(1);	
</script>
<script type="text/javascript">
	parent.add_edit_adverts();	
</script>
{{/if}}
  <form name="detail" method="post" action="">
  <div id="quoteIframe" align="center" style="padding-top:20px;" >
  {{if $showcalcscc}}
  <h2>{{$showcalcscc}}</h2><br /><br />
    <table width="100%" id="advlist-table" style="background-color:#FFFFFF;" >
      <tr>
      	  <th>Material</th>
          <th>Cost per lineal Meter</th>
          <th>Meters used per SQM</th>
          <th>Area SQM</th>
          <th>Total Lineal Meters</th>
          <th>Project Cost</th>
     </tr>
     <tr>
     	<td><strong>90mm x 45mm treated pine</strong></td>
        <td><input type="text" name="" id="M1cplm"  class="Mcplm"/></td>
        <td><input type="text" name="" id="M1mups" class="Mcplm" /></td>
        <td><input type="text" name="" id="M1as" class="Mcplm" /></td>
        <td><input type="text" name="" id="M1tlm" class="Mcplm" /></td>
        <td><input type="text" name="" id="M1pc"  class="Mcplm"/></td>
     </tr> 
       <tr>
      	  <th>Material</th>
          <th>Unit Price</th>
          <th>Units Per SQM</th>
          <th>Area SQM</th>
          <th>Cost per SQM</th>
          <th>Project Cost</th>
     </tr>
     <tr>
     	<td><strong>8mm x 150mm nylon anchors</strong></td>
        <td><input type="text" name="" id="M2cplm"  class="Mcplm"/></td>
        <td><input type="text" name="" id="M2mups" class="Mcplm" /></td>
        <td><input type="text" name="" id="M2as"  class="Mcplm"/></td>
        <td><input type="text" name="" id="M2tlm"  class="Mcplm"/></td>
        <td><input type="text" name="" id="M2pc" class="Mcplm" /></td>
     </tr> 
       <tr>
      	  <th>Material</th>
          <th>Unit Price</th>
          <th>Units Per SQM</th>
          <th>Area SQM</th>
          <th>Cost per SQM</th>
          <th>Project Cost</th>
     </tr>
     <tr>
     	<td><strong>125mm bugle head batten screw</strong></td>
            <td><input type="text" name="" id="M3cplm"  class="Mcplm"/></td>
        <td><input type="text" name="" id="M3mups" class="Mcplm" /></td>
        <td><input type="text" name="" id="M3as" class="Mcplm" /></td>
        <td><input type="text" name="" id="M3tlm"  class="Mcplm"/></td>
        <td><input type="text" name="" id="M3pc" class="Mcplm" /></td>
     </tr>
      <tr>
      	  <th>Material</th>
          <th>Price Per Can</th>
          <th>SQM Per Can</th>
          <th>Area SQM</th>
          <th>Cans Required</th>
          <th>Project Cost</th>
     </tr>
     <tr>
     	<td><strong>Treated Pine Re Sealer</strong></td>
          <td><input type="text" name="" id="M4cplm"  class="Mcplm" /></td>
        <td><input type="text" name="" id="M4mups"  class="Mcplm"/></td>
        <td><input type="text" name="" id="M4as"  class="Mcplm"/></td>
        <td><input type="text" name="" id="M4tlm" class="Mcplm" /></td>
        <td><input type="text" name="" id="M4pc"  class="Mcplm"/></td>
     </tr> 
     <tr>
     	<td colspan="5"><div align="right"><strong>Total&nbsp;</strong></div></td>
        <td><input type="text" name="Totalcal" id="Totalcal"  /></td>
     </tr> 
      <tr>
        <td colspan="8" style="text-align:center;">
            <input type="button" name="Insertquote" id="Insertquote" value="Get Cost" class="vsml"  />
            <input type="button" name="subAddDetail" id="subAddDetail" value="Calculate Total Cost" class="vsml" />
        	<input type="button" name="btnCancelDetail" value="Cancel" onclick="parent.$.fancybox.close();" class="vsml" />
               <input type="button" onclick="javascript:getParentValue()" value="click" />
        </td>
      </tr>
    </table>
    <script type="text/javascript">

	$(document).ready(function() {
    $('input[type="text"]').val("0.00");
	});
	
     $('#subAddDetail').click(function(){
	 $('#M1tlm').val(((parseFloat($('#M1mups').val())? $('#M1mups').val(): 0) * (parseFloat($('#M1as').val())?$('#M1as').val():0)).toFixed(2));
 	 $('#M2tlm').val(((parseFloat($('#M2mups').val())? $('#M2mups').val(): 0) * (parseFloat($('#M2as').val())?$('#M2as').val():0)).toFixed(2));
     $('#M3tlm').val(((parseFloat($('#M3mups').val())? $('#M3mups').val(): 0) * (parseFloat($('#M3as').val())?$('#M3as').val():0)).toFixed(2));
     $('#M4tlm').val(((parseFloat($('#M4mups').val())? $('#M4mups').val(): 0) * (parseFloat($('#M4as').val())?$('#M4as').val():0)).toFixed(2));
	
	
	 $('#M1pc').val(((parseFloat($('#M1tlm').val())? $('#M1tlm').val(): 0) * (parseFloat($('#M1cplm').val())?$('#M1cplm').val():0)).toFixed(2));
 	 $('#M2pc').val(((parseFloat($('#M2tlm').val())? $('#M2tlm').val(): 0) * (parseFloat($('#M2cplm').val())?$('#M2cplm').val():0)).toFixed(2));
     $('#M3pc').val(((parseFloat($('#M3tlm').val())? $('#M3tlm').val(): 0) * (parseFloat($('#M3cplm').val())?$('#M3cplm').val():0)).toFixed(2));
     $('#M4pc').val(((parseFloat($('#M4tlm').val())? $('#M4tlm').val(): 0) * (parseFloat($('#M4cplm').val())?$('#M4cplm').val():0)).toFixed(2));
	 
	 $('#Totalcal').val((eval(($('#M1pc').val())? $('#M1pc').val():0) + eval(($('#M2pc').val())? $('#M2pc').val():0)+ eval(($('#M3pc').val())? $('#M3pc').val():0)+ eval(($('#M4pc').val())? $('#M4pc').val():0)).toFixed(2));
	 
	 
	 	 
	});

 $('#Insertquote').click(function(){
 //window.opener.document.getElementById('tmv').value = $('#Totalcal').val();
 $("#M4tlm").val( $("#Totalcal").val() )
 
});
    </script>
    {{elseif $showcalcsccl}}
 <h2>{{$showcalcsccl}}</h2><br />
    <table width="100%" id="advlist-table" style="background-color:#FFFFFF;" >
      <tr>
      	  <th>Team Leader Output<br /> Per Hour</th>
          <th>Team Member Outpur<br /> Per Hour</th>
          <th>Team Output SQM<br /> per Hour</th>
          <th>Area SQM</th>
          <th>Total Hours Required</th>
          <th>Cost Per Hour Labour</th>
          <th>Porject Cost</th>
     </tr>
     <tr>
     	<td><input type="text" name="" id=""  /></td>
        <td><input type="text" name="" id=""  /></td>
        <td><input type="text" name="" id=""  /></td>
        <td><input type="text" name="" id=""  /></td>
        <td><input type="text" name="" id=""  /></td>
        <td><input type="text" name="" id=""  /></td>
        <td><input type="text" name="" id=""  /></td>
     </tr> 
      <tr>
        <td colspan="8" style="text-align:center;">
        	<input type="button" name="Insert" value="Get Cost" class="vsml"  />
        	<input type="button" name="subAddDetail" value="Calculate Total Cost" class="vsml" />
            <input type="button" name="btnCancelDetail" value="Cancel" onclick="parent.$.fancybox.close();" class="vsml" />
        </td>
      </tr>
    </table>
	 {{elseif $showcalcsccl}}
 <h2>{{$showcalcsccl}}</h2><br />
    <table width="100%" id="advlist-table" style="background-color:#FFFFFF;" >
      <tr>
      	  <th>Team Leader Output<br /> Per Hour</th>
          <th>Team Member Outpur<br /> Per Hour</th>
          <th>Team Output SQM<br /> per Hour</th>
          <th>Area SQM</th>
          <th>Total Hours Required</th>
          <th>Cost Per Hour Labour</th>
          <th>Porject Cost</th>
     </tr>
     <tr>
     	<td><input type="text" name="" id=""  /></td>
        <td><input type="text" name="" id=""  /></td>
        <td><input type="text" name="" id=""  /></td>
        <td><input type="text" name="" id=""  /></td>
        <td><input type="text" name="" id=""  /></td>
        <td><input type="text" name="" id=""  /></td>
        <td><input type="text" name="" id=""  /></td>
     </tr> 
      <tr>
        <td colspan="8" style="text-align:center;">
        	<input type="button" name="Insert" value="Get Cost" class="vsml" />
        	<input type="button" name="subAddDetail" value="Calculate Total Cost" class="vsml" />
            <input type="button" name="btnCancelDetail" value="Cancel" onclick="parent.$.fancybox.close();" class="vsml" />
        </td>
      </tr>
    </table>
    {{else}}
    <h2>Under Construction</h2>
    {{/if}}
 </div>   
  </form>
<script type="text/javascript">
		$(document).ready(function() {
			$('input[type="text"]').keydown(maskInput);
			$('input[type="text"]').blur(maskInput);
			
			 $('input[type="text"]').blur(function(){
			 if(!isNaN(this.value) && this.value.length!=0) {
			 this.value = parseFloat(this.value).toFixed(2);
			 }else{ this.value ='0.00'; }
			 });
			  $('input[type="text"]').click(function(){
			 if(this.value == '0.00') {
			 this.value = '';
			 }
			 }); 
			 $('input[type="text"]').focus(function(){
			 if(this.value == '0.00') {
			 this.value = '';
			 }
			});
		});
</script>
