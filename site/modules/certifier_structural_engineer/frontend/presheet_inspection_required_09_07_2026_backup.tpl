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
    <h3 class="page-title"><br />Press Sheet Inspections - Required Documents</h3>    

<div style="float:left; margin-bottom:10px; font-size:14px;">
<strong>Project Address : {{$proj_name}}</strong>
</div>
  
<form name="detail" method="post" action=""  enctype="multipart/form-data">

<table id="list-table" width="99%">

        
        
        <tr>
        <td>Survey ID  </td>
        
        <td {{if  $data261.doc_not_required eq 1}} style="background:#999;"
            {{elseif $data261.doc_file_name}} style="background:#00CC33;"  {{else}} style="background:#F00;" {{/if}} id = "floorf{{$item.bsn_id}}">
            
             {{if $data261.doc_file_name}}
			<a href="/certifier_structural_engineer.download_content?file_name={{$data261.doc_file_name}}&module_name=certifier_structural_engineer.home">Download</a><br />
            {{/if}}
            
        <select name="flooting_insp[cse_comm_notice]" >
        <option value="0" {{if $data261.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $data261.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select> 
        </td>  
        
         <td style="width:40%"> 
        {{ $docIncludeSupplier[261] }} <br />
        <a href="{{$BASE_URL}}certifier_structural_engineer.include_suppliers/car_id/261" class="various kill_others">Include Supplier</a><br><br>
        </td>
        
          
        </tr>
     
       
        <tr>
        <td style="width:40%">Wall and Roof Frame Detail Plans </td> 
        
        <td {{if  $data289.doc_not_required eq 1}} style="background:#999;"
            {{elseif $data289.doc_file_name}} style="background:#00CC33;"  {{else}} style="background:#F00;" {{/if}} id = "floorf{{$item.bsn_id}}">
            
            {{if $data289.doc_file_name}}
			<a href="/certifier_structural_engineer.download_content?file_name={{$data289.doc_file_name}}&module_name=certifier_structural_engineer.home">Download</a><br />
            {{/if}}
            
        <select name="flooting_insp[cse_flo_sepi]" >
        <option value="0" {{if $data289.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $data289.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
        </td>
        
         <td style="width:40%"> 
        {{ $docIncludeSupplier[289] }} <br />
        <a href="{{$BASE_URL}}certifier_structural_engineer.include_suppliers/car_id/289" class="various kill_others">Include Supplier</a><br><br>
        </td>
        
        
        </tr>
        
        <tr>
        <td style="width:40%">Termite Protection Certificate – Penetration </td> 
        
        <td {{if  $data155.doc_not_required eq 1}} style="background:#999;"
            {{elseif $data155.doc_file_name}} style="background:#00CC33;"  {{else}} style="background:#F00;" {{/if}} id = "floorf{{$item.bsn_id}}">
            
            {{if $data155.doc_file_name}}
			<a href="/certifier_structural_engineer.download_content?file_name={{$data155.doc_file_name}}&module_name=certifier_structural_engineer.home">Download</a><br />
            {{/if}}
            
        <select name="flooting_insp[cse_flo_gfff]" >
        <option value="0" {{if $data155.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $data155.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
        </td>
        
         <td style="width:40%"> 
        {{ $docIncludeSupplier[155] }} <br />
        <a href="{{$BASE_URL}}certifier_structural_engineer.include_suppliers/car_id/155" class="various kill_others">Include Supplier</a><br><br>
        </td>
        
        
        
        
        </tr>
        
        <tr>
        <td style="width:40%">Termite Protection Certificate – Perimeter  </td> 
        
        <td {{if  $data295.doc_not_required eq 1}} style="background:#999;"
            {{elseif $data295.doc_file_name}} style="background:#00CC33;"  {{else}} style="background:#F00;" {{/if}} id = "floorf{{$item.bsn_id}}">
            
            {{if $data295.doc_file_name}}
			<a href="/certifier_structural_engineer.download_content?file_name={{$data295.doc_file_name}}&module_name=certifier_structural_engineer.home">Download</a><br />
            {{/if}}
            
        <select name="flooting_insp[cse_se_design]" >
        <option value="0" {{if $data295.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $data295.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
        </td>
        
        <td style="width:40%"> 
        {{ $docIncludeSupplier[295] }} <br />
        <a href="{{$BASE_URL}}certifier_structural_engineer.include_suppliers/car_id/295" class="various kill_others">Include Supplier</a><br><br>
        </td>
        
        </tr>
        
        
        <tr>
        <td style="width:40%">Fire Rated Certificate  </td> 
        
        <td {{if  $data739.doc_not_required eq 1}} style="background:#999;"
            {{elseif $data739.doc_file_name}} style="background:#00CC33;"  {{else}} style="background:#F00;" {{/if}} id = "floorf{{$item.bsn_id}}">
            
            {{if $data739.doc_file_name}}
			<a href="/certifier_structural_engineer.download_content?file_name={{$data739.doc_file_name}}&module_name=certifier_structural_engineer.home">Download</a><br />
            {{/if}}
            
        <select name="flooting_insp[cse_se_design]" >
        <option value="0" {{if $data739.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $data739.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
        </td>
        
         <td style="width:40%"> 
        {{ $docIncludeSupplier[739] }} <br />
        <a href="{{$BASE_URL}}certifier_structural_engineer.include_suppliers/car_id/739" class="various kill_others">Include Supplier</a><br><br>
        </td>
        
        
        
        </tr>
        
         <tr>
        <td style="width:40%">Box Gutter and Rain Head Design  </td> 
        
        <td {{if  $data626.doc_not_required eq 1}} style="background:#999;"
            {{elseif $data626.doc_file_name}} style="background:#00CC33;"  {{else}} style="background:#F00;" {{/if}} id = "floorf{{$item.bsn_id}}">
            
            {{if $data626.doc_file_name}}
			<a href="/certifier_structural_engineer.download_content?file_name={{$data626.doc_file_name}}&module_name=certifier_structural_engineer.home">Download</a><br />
            {{/if}}
            
        <select name="flooting_insp[cse_se_design]" >
        <option value="0" {{if $data626.doc_not_required eq 0 }} selected="selected" {{/if}}>Required</option>
        <option value="1" {{if $data626.doc_not_required eq 1 }} selected="selected" {{/if}}>Not Required</option>
        </select>
        </td>
        
         <td style="width:40%"> 
        {{ $docIncludeSupplier[626] }} <br />
        <a href="{{$BASE_URL}}certifier_structural_engineer.include_suppliers/car_id/626" class="various kill_others">Include Supplier</a><br><br>
        </td>
        
        </tr>
     

</table><br /><br />
<!-- <input type="submit" name="savedrop" value="submit" onclick="if(!this.form.checkbox.checked){alert('Please confirm the QA is complete before saving.');return false}"  />-->
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