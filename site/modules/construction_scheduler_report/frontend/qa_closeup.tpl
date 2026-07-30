<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

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

<script type="application/javascript">


function add_new(url)
 {
 //var viewurl = "{{$BASE_URL}}designer_tracker.detail"+ "/random/" + Math.random();	
 var viewurl = url;
 $(document).ready(function () {
        $.fancybox({
				'width': '99%',
				'height': '99%',
				'autoScale': false,
				 'transitionIn' : 'elastic',
				 'transitionOut' : 'elastic',
				 'speedIn' : 300,
				 'speedOut' : 300,
				 'overlayShow' : true,
				 'overlayColor' : '#000',
				 'hideOnOverlayClick':false,
				 'hideOnContentClick':false,
				 'type': 'iframe',
				 'href': viewurl,
				 'scrolling': 'yes' 
			
        });
});
}


</script>


<div align="center" style="min-height:350px; z-index:9999999;">
    <h3 class="page-title"><br />Q/A</h3>    

<div style="float:left; margin-bottom:10px; font-size:14px;">
<strong>Project Address : {{$proj_name}}</strong>
</div>
  
<form name="detail" method="post" action=""  enctype="multipart/form-data">

<table id="list-table" width="99%">

        <tr>
        <td style="width:40%">Pre-sheet Clean Report</td> 
        <td>
        <select name="cons_cal[cs_cu_pre_sheet_clean]" >
        <option value="0" {{if $detail.cs_cu_pre_sheet_clean eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $detail.cs_cu_pre_sheet_clean eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
        </td>
        </tr>
        
        <tr>
        <td>Wall and Roof Frame Detail Drawings</td>
        <td><select name="cons_cal[cs_cu_wall_roof]" >
        <option value="0" {{if $detail.cs_cu_wall_roof eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $detail.cs_cu_wall_roof eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select> </td>    
        </tr>
     
        <tr>
        <td>Pre-sheet Inspection</td>
        <td><select name="cons_cal[cs_su_pre_sheet]" >
        <option value="0" {{if $detail.cs_su_pre_sheet eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $detail.cs_su_pre_sheet eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select> </td>    
        </tr>
     
        <tr>
        <td>Pre-sheet Quality Assurance Report</td>
        <td><select name="cons_cal[cs_cu_ps_qa]" >
        <option value="0" {{if $detail.cs_cu_ps_qa eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $detail.cs_cu_ps_qa eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select></td>    
        </tr>
     
      
     
        <tr>
        <td>Close Up Quality Assurance Report</td>
        <td><select name="cons_cal[cs_cu_cuqa]" >
        <option value="0" {{if $detail.cs_cu_cuqa eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $detail.cs_cu_cuqa eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select></td>    
        </tr>
     
        <tr>
        <td>Fixings Quality Assurance Report</td>
        <td><select name="cons_cal[cs_cu_fixing]" >
        <option value="0" {{if $detail.cs_cu_fixing eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $detail.cs_cu_fixing eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select></td>    
        </tr>
     
        <tr>
        <td>Painting Quality Assurance Report</td>
        <td><select name="cons_cal[cs_cu_painting]" >
        <option value="0" {{if $detail.cs_cu_painting eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $detail.cs_cu_painting eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select></td>    
        </tr>
     
        <tr>
        <td>Box Gutter Certificate</td>
        <td><select name="cons_cal[cs_box_gutter]" >
        <option value="0" {{if $detail.cs_box_gutter eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $detail.cs_box_gutter eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select></td>    
        </tr>
		
		<tr>
        <td>Driveway/Verge Crossing Formwork Inspection Report</td>
        <td><select name="cons_cal[cs_box_gutter]" >
        <option value="0" {{if $detail.cs_driveway_verge eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $detail.cs_driveway_verge eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select></td>    
        </tr>
     
        <tr>
        <td><input type="checkbox" name="checkbox" value="check"  /> : I confirm the QA for all the fields has been completed </td>
        <td> </td>
        </tr>
     

</table><br /><br />
 <input type="submit" name="savedrop" value="submit" onclick="if(!this.form.checkbox.checked){alert('Please confirm the QA is complete before saving.');return false}"  />
 <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
</form>
    
<!--    <form method="POST" action="http://www.cs.tut.fi/cgi-bin/run/~jkorpela/echo.cgi">
 <input type="checkbox" name="checkbox" value="check"  />
 <input type="submit" name="email_submit" value="submit" onclick="if(!this.form.checkbox.checked){alert('You must agree to the terms first.');return false}"  />
</form>-->
    
    
    <script type="text/javascript">
		
		
		function closepop()
		{
	     setTimeout('parent.close_win();', 500);
		}
		
		
		
	</script>
    
	<script type="text/javascript" language="javascript" >
        	var frmvalidator  = new Validator("detail");
			frmvalidator.EnableMsgsTogether();
			frmvalidator.addValidation("{{$TABLE}}[al_item]","req", "Please specify item.");
			
    </script>
</div>

<script>
	initSample();
</script>