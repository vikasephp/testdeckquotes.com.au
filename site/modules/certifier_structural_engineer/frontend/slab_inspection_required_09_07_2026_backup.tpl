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
    <h3 class="page-title"><br />Slab Inspections - Required Documents</h3>    

<div style="float:left; margin-bottom:10px; font-size:14px;">
<strong>Project Address : {{$proj_name}}</strong>
</div>
  
<form name="detail" method="post" action=""  enctype="multipart/form-data">

<table id="list-table" width="99%">

        
        
        <tr>
        <td>Commencement Notice </td>
        <td {{if  $data235.doc_not_required eq 1}} style="background:#999;"
            {{elseif $data235.doc_file_name}} style="background:#00CC33;"  {{else}} style="background:#F00;" {{/if}} id = "floorf{{$item.bsn_id}}">
            
            {{if $data235.doc_file_name}}
			<a href="/certifier_structural_engineer.download_content?file_name={{$data235.doc_file_name}}&module_name=certifier_structural_engineer.home">Download</a><br />
            {{/if}}  
            
        <select name="slab_insp[cse_comm_notice]" >
        <option value="0" {{if $data235.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $data235.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select> </td>   
        
         <td style="width:40%"> 
        {{ $docIncludeSupplier[235] }} <br />
        <a href="{{$BASE_URL}}certifier_structural_engineer.include_suppliers/car_id/235" class="various kill_others">Include Supplier</a><br><br>
        </td>
        
         
        </tr>
     
       
        <tr>
        <td style="width:40%">Structural Engineer's Pier Inspection</td> 
        <td {{if  $data653.doc_not_required eq 1}} style="background:#999;"
            {{elseif $data653.doc_file_name}} style="background:#00CC33;"  {{else}} style="background:#F00;" {{/if}} id = "floorf{{$item.bsn_id}}">
            
          {{if $data653.doc_file_name}}
			<a href="/certifier_structural_engineer.download_content?file_name={{$data653.doc_file_name}}&module_name=certifier_structural_engineer.home">Download</a><br />
            {{/if}}   
            
        <select name="slab_insp[cse_flo_sepi]" >
        <option value="0" {{if $data653.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $data653.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
        </td>
        
         <td style="width:40%"> 
        {{ $docIncludeSupplier[653] }} <br />
        <a href="{{$BASE_URL}}certifier_structural_engineer.include_suppliers/car_id/653" class="various kill_others">Include Supplier</a><br><br>
        </td>
        
        </tr>
        
        <tr>
        <td style="width:40%">Structural Engineer's Design</td> 
        <td {{if  $data116.doc_not_required eq 1}} style="background:#999;"
            {{elseif $data116.doc_file_name}} style="background:#00CC33;"  {{else}} style="background:#F00;" {{/if}} id = "floorf{{$item.bsn_id}}">
            
         {{if $data116.doc_file_name}}
			<a href="/certifier_structural_engineer.download_content?file_name={{$data116.doc_file_name}}&module_name=certifier_structural_engineer.home">Download</a><br />
            {{/if}}   
            
        <select name="slab_insp[cse_se_design]" >
        <option value="0" {{if $data116.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $data116.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
        </td>
        
        
         <td style="width:40%"> 
        {{ $docIncludeSupplier[116] }} <br />
        <a href="{{$BASE_URL}}certifier_structural_engineer.include_suppliers/car_id/116" class="various kill_others">Include Supplier</a><br><br>
        </td>
        
        
        </tr>
        
        <tr>
        <td style="width:40%">Footing Inspection </td> 
        <td {{if  $data148.doc_not_required eq 1}} style="background:#999;"
            {{elseif $data148.doc_file_name}} style="background:#00CC33;"  {{else}} style="background:#F00;" {{/if}} id = "floorf{{$item.bsn_id}}">
            
            
         {{if $data148.doc_file_name}}
			<a href="/certifier_structural_engineer.download_content?file_name={{$data148.doc_file_name}}&module_name=certifier_structural_engineer.home">Download</a><br />
            {{/if}} 
            
        <select name="slab_insp[cse_slab_fi]" >
        <option value="0" {{if $data148.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $data148.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
        </td>
        
        
        <td style="width:40%"> 
        {{ $docIncludeSupplier[148] }} <br />
        <a href="{{$BASE_URL}}certifier_structural_engineer.include_suppliers/car_id/148" class="various kill_others">Include Supplier</a><br><br>
        </td>
        </tr>
     

</table><br /><br />
 <input type="submit" name="savedrop" value="submit"   />
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