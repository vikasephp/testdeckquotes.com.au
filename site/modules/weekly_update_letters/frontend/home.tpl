<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}js/ckeditor2/samples/js/sample.js"></script>
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
<link rel="stylesheet" href="{{$BASE_URL}}js/datalist/styledatalist.css"/>

<script>
		!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>

<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />

	<script type="text/javascript">
		$(document).ready(function() {
					
			$(".various1").fancybox({
				'width'				: '99%',
				'height'			   : '99%',
				'transitionIn'		 : 'elastic',
				'transitionOut'		: 'elastic',
				'scrolling'		    : 'yes',
				'hideOnOverlayClick'   : 'no',
				'type'				: 'iframe'
			});	
			
							
		});		
	</script>


<style>
#emllib {width:98%; padding:10px;  border-collapse:collapse;}
#emllib th { border:1px solid #CCC !important; border-collapse:collapse; font-size:14px;}
#emllib td { border:1px solid #CCC !important; border-collapse:collapse;}
</style>

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />

<h3 class="page-title">Weekly Update Letter</h3>    

<form name="detail" method="post" action="" enctype="multipart/form-data">
         
          
 <table id="emllib" cellpadding="0" cellspacing="0" style="width:98% !important;">
 <tr> 
 <th> Search Project Name </th> 
 <td colspan="7">

<datalist id='project'>
   {{foreach from=$projdetail key="key3" item="item3"}}
    <option value=" {{$item3.bsn_id}} | {{$item3.bsn_name}}" {{if $bsnid eq $item3.bsn_id}} selected="selected" {{/if}}>
    {{$item3.bsn_id}} - {{$item3.bsn_name}}
    </option>
    {{/foreach}}
</datalist>
         <input type="text" list = 'project' name="projname" style ="width:700px" value="{{$p_c_name}}" />
         <input type ="submit" name="prosub" value="Submit"   />
 </td>
 </tr>
        
 </table>
<br />

{{if $msg }}


    <input type = "hidden" name = "uploaddata[bsn_id]" value="{{$bsn_id}}" />
 

 <table id="emllib" cellpadding="0" cellspacing="0" style="width:98% !important; border:1px solid #CCC;">

<tr>
<th>Customer Design Update Letter</th>
<td> <input type="file" name="docs1" /></td>
<tr>

<tr>
<th>Inclusion Progress Update Letter</th>
<td> <input type="file" name="docs2" /></td>
<tr>

<tr>
<th>Planning Approvals Update Letter</th>
<td> <input type="file" name="docs3" /></td>
<tr>

<tr>
<th>Construction Report Update Letter</th>
<td> <input type="file" name="docs4" /></td>
<tr>


<td colspan="8" align="center"> 

<input type ="submit"  name="upload" value="Save"   />

</td>
</tr>
</table>

 
   </div>
</div>

 {{/if}}

 </form>
  
	<script type="text/javascript" language="javascript" >
        var frmvalidator  = new Validator("detail");
		frmvalidator.EnableMsgsTogether();
		//frmvalidator.addValidation("emailData[eml_signarure_block]","req", "Please specify signature.")
		//frmvalidator.addValidation("emailData[to]","req", "Since this is Internal Email so you must specify internal email.");
        </script>

       
</div>