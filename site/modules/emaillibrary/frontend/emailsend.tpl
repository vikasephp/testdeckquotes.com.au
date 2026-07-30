<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/jquery.min.js"></script>
{{include file=$jdata}}
{{include file=$tiny_basic}}


<script>
		!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>

<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />

<script type="text/javascript" >  
function preview_email()
{
	var viewurl = "{{$BASE_URL}}emaillibrary.prevemail"+ "/random/" + Math.random();	
	alert("Testing");
	
 	$(document).ready(function () {

        $.fancybox({

				'width': '90%',
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

	<script type="text/javascript">
		$(document).ready(function() {
					
			$(".various1").fancybox({
				'width'				: '65%',
				'height'			   : '65%',
				'transitionIn'		 : 'elastic',
				'transitionOut'		: 'elastic',
				'scrolling'		    : 'yes',
				'hideOnOverlayClick'   : 'no',
				'type'				: 'iframe'
			});	
			
			$(".various2").fancybox({
				'width'				: '45%',
				'height'			   : '95%',
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
#emllib th { border:1px solid #CCC !important; border-collapse:collapse; font-size:12px; text-align:left;}
#emllib td { border:1px solid #CCC !important; border-collapse:collapse; font-size:12px;}
</style>

<div>
 <table id="emllib" cellpadding="0" cellspacing="0" style="width:98% !important; border:1px solid #CCC;">
 <tr> 
 <th> Select Project </th> <td colspan="7"> </td>
 </tr>
 <tr><th>Email Code</th><td>{{$emldata.eml_code}}</td><th>Email Type</th><td>{{$emldata.eml_ie_email}}</td>
 <th>Business Stream</th><td>{{$emldata.eml_business_stream}}</td><th>Owner</th><td>{{$emldata.eml_owner}}</td></tr>
 
<tr>
<th> Email Content </th>
<td colspan="7"> <textarea name="emailData[bsn_emcontent]" id="editor"  cols="100" rows="15"> {{$emldata.eml_email_content}}</textarea></td>
</tr>
<tr>
<tr><th>Signature</th>
<td>
            <select name="emailData[eml_signarure_block]" class="lrg">
            {{foreach from=$signature key="key" item="item"}}
            <option value="{{$item.es_name}}">{{$item.es_name}}</option>
            {{/foreach}}
</td>

<th>Owner</th><td>{{$emldata.eml_owner}}</td></tr>
 </table>
  <input type="button" name="preview_email " class="various1" value="Preview" onclick="document.location.href='{{$BASE_URL}}emaillibrary.prevemail'" />
 <a href="{{$BASE_URL}}emaillibrary.prevemail" class="various1" >Tana</a> 
 

 
   </div>
</div>
<script>
	initSample();
</script>