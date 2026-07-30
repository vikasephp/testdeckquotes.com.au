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
        <td style="width:40%">Surveyor Site Set Out</td> 
        <td>
        <select name="cons_cal[cs_cal_ss_out]" >
        <option value="0" {{if $detail.cs_cal_ss_out eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $detail.cs_cal_ss_out eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
        </td>
        </tr>
        
        <tr>
        <td>Site Setup Report</td>
        <td><select name="cons_cal[cs_cal_ss_repo]" >
        <option value="0" {{if $detail.cs_cal_ss_repo eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $detail.cs_cal_ss_repo eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select> </td>    
        </tr>
     
        <tr>
        <td>Footings Inspection</td>
        <td><select name="cons_cal[cs_footing_inspection]" >
        <option value="0" {{if $detail.cs_footing_inspection eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $detail.cs_footing_inspection eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select> </td>    
        </tr>
     
        <tr>
        <td>Pier Inspection</td>
        <td><select name="cons_cal[cs_fs_pierinsp]" >
        <option value="0" {{if $detail.cs_fs_pierinsp eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $detail.cs_fs_pierinsp eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select></td>    
        </tr>
     
        <tr>
        <td>Drainage Report</td>
        <td><select name="cons_cal[cs_fs_drain_report]" >
        <option value="0" {{if $detail.cs_fs_drain_report eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $detail.cs_fs_drain_report eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select></td>    
        </tr>
     
       
     
        <tr>
        <td>Floor Frame Detail Drawings (Ground Floor)</td>
        <td><select name="cons_cal[cs_fs_ff_ground]" >
        <option value="0" {{if $detail.cs_fs_ff_ground eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $detail.cs_fs_ff_ground eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select></td>    
        </tr>
     
        <tr>
        <td>Floor Frame Detail Drawings (First Floor)</td>
        <td><select name="cons_cal[cs_fs_ff_first]" >
        <option value="0" {{if $detail.cs_fs_ff_first eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $detail.cs_fs_ff_first eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select></td>    
        </tr>
     
        <tr>
        <td>Floor Frame Inspection</td>
        <td><select name="cons_cal[cs_fs_ff_insp]" >
        <option value="0" {{if $detail.cs_fs_ff_insp eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $detail.cs_fs_ff_insp eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select></td>    
        </tr>
     
        <tr>
        <td>Termite Protection Penetration</td>
        <td><select name="cons_cal[cs_termite_pro]" >
        <option value="0" {{if $detail.cs_termite_pro eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $detail.cs_termite_pro eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select></td>    
        </tr>
     
        <tr>
        <td>Termite Protection Parameter</td>
        <td><select name="cons_cal[cs_termite_pro_para]" >
        <option value="0" {{if $detail.cs_termite_pro_para eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $detail.cs_termite_pro_para eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select></td>    
        </tr>
     
        <tr>
        <td>Slab Inspection</td>
        <td><select name="cons_cal[cs_slab_insp]" >
        <option value="0" {{if $detail.cs_slab_insp eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $detail.cs_slab_insp eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select></td>    
        </tr>
     
     
        <tr>
        <td>Floor System Quality Assurance Report</td>
        <td><select name="cons_cal[cs_fs_quality_ass]" >
        <option value="0" {{if $detail.cs_fs_quality_ass eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $detail.cs_fs_quality_ass eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select></td>    
        </tr>
     
        <tr>
        <td>Post Slab Clean Report</td>
        <td><select name="cons_cal[cs_fs_postslab]" >
        <option value="0" {{if $detail.cs_fs_postslab eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $detail.cs_fs_postslab eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select></td>    
        </tr>
     
        <tr>
        <td>Survey ID Document</td>
        <td><select name="cons_cal[cs_survey_id]" >
        <option value="0" {{if $detail.cs_survey_id eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $detail.cs_survey_id eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select></td>    
        </tr>
     
        <tr>
        <td>Site Works Complete Report</td>
        <td><select name="cons_cal[cs_site_works]" >
        <option value="0" {{if $detail.cs_site_works eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $detail.cs_site_works eq 1 }} selected="selected" {{/if}}>Not Required</option>
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