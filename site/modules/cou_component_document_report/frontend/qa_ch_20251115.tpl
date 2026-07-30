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
        <td style="width:40%">BA stamped plans</td> 
        <td>
       
        <select name="ba_stamp[doc_not_required]" >
        <option value="0" {{if $detail231.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $detail231.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
        </td>
        </tr>
        
        <tr>
        <td>Latest Merged Plans</td>
        <td><select name="lmp[doc_not_required]" >
        <option value="0" {{if $detail491.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $detail491.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select> </td>    
        </tr>
     
        <tr>
        <td>Customer Walkthrough</td>
        <td><select name="cuwal[doc_not_required]" >
        <option value="0" {{if $detail172.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $detail172.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select> </td>    
        </tr>
     
        <tr>
        <td>Final Building Certifier Inspection Record</td>
        <td><select name="fbcir[doc_not_required]" >
        <option value="0" {{if $detail169.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $detail169.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select></td>    
        </tr>
    
  
     
        <tr>
        <td>Building Certifier Pre-Sheet Inspection Record</td>
        <td><select name="bcpsir[doc_not_required]" >
        <option value="0" {{if $detail152.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $detail152.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select></td>    
        </tr>
     
        <tr>
        <td>Survey ID Document</td>
        <td><select name="siddoc[doc_not_required]" >
        <option value="0" {{if $detail261.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $detail261.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
        </td>    
        </tr>
    
      
      
        <tr>
        <td>Termite protection Certificate - Penetrations</td>
        <td><select name="tpc_pene[doc_not_required]" >
        <option value="0" {{if $detail155.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $detail155.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
        </td>    
        </tr>
     
        <tr>
        <td>Termite Protection Certificate - Perimeter </td>
        <td><select name="tpc_peri[doc_not_required]" >
        <option value="0" {{if $detail295.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $detail295.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
        </td>    
        </tr>

     
        <tr>
        <td>Glazing Certificate - Shower Screens</td>
        <td><select name="gc_ss[doc_not_required]" >
        <option value="0" {{if $detail413.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $detail413.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
        </td>    
        </tr>
     
        <tr>
        <td>Glazing Certificate - Windows</td>
        <td><select name="gc_win[doc_not_required]" >
        <option value="0" {{if $detail156.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $detail156.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
        </td>    
        </tr>
        
           
        <tr>
        <td>Wall and Roof Frames Detail Plans</td>
        <td><select name="wwfdp[doc_not_required]" >
        <option value="0" {{if $detail289.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $detail289.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
        </td>    
        </tr>
        
   
        <tr>
        <td>Insulation Certificate</td>
        <td><select name="inccer[doc_not_required]" >
        <option value="0" {{if $detail162.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $detail162.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
        </td>    
        </tr>
               
        <tr>
        <td>Waterproofing Certificate</td>
        <td><select name="watcer[doc_not_required]" >
        <option value="0" {{if $detail163.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $detail163.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
        </td>    
        </tr>
 
        <tr>
        <td>Smoke Alarm Certificate</td>
        <td><select name="sacer[doc_not_required]" >
        <option value="0" {{if $detail296.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $detail296.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
        </td>    
        </tr>
                
                
        <tr>
        <td>Certificate of Electrical Safety Electrician</td>
        <td><select name="coese[doc_not_required]" >
        <option value="0" {{if $detail294.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $detail294.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
        </td>    
        </tr>
        
        <tr>
        <td>Certificate of Electrical Safety Air Conditioning</td>
        <td><select name="coesac[doc_not_required]" >
        <option value="0" {{if $detail167.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $detail167.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
        </td>    
        </tr>
         
        
        <tr>
        <td>Application of certificate of occupancy signed by customer</td>
        <td><select name="aocoosbc[doc_not_required]" >
        <option value="0" {{if $detail274.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $detail274.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
        </td>    
        </tr>
        
        <tr>
        <td>Box Gutter Certificate</td>
        <td><select name="boxgutter[doc_not_required]" >
        <option value="0" {{if $detail626.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $detail626.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
        </td>    
        </tr>
        
     	<tr>
        <td>Final Plumbing Certificate</td>
        <td><select name="plumbing[doc_not_required]" >
        <option value="0" {{if $detail749.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $detail749.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
        </td>    
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