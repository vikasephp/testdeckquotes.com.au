<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/w3.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />
<script>
	!window.jQuery && document.write('<script src="{{$BASE_URL}}js/fancybox/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript" src="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />

<style>
input {
    width: 68px;
    overflow:hidden;
}
</style>


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
    <h3 class="page-title"><br />Action Plan Step</h3>    
   
   
<form name="detail" method="post" action=""  enctype="multipart/form-data">

<table id="list-table" width="99%">
<tr> 
<th width="5%">SrNo</th>
<th width="60%">Task Name </th>
<th width="60%">Date Uploaded </th>
</tr>
  
<tr> 
<td>{{counter}}</td>
<td>Render Request Sent</td>
<td>{{$data2}}</td>
</tr> 

<tr> 
<td>{{counter}}</td>
<td>Render Due Date</td>
<td><input type="text" name="rdd8" class="w16em dateformat-d-ds-m-ds-Y" value="{{$dpn_render_due_dt8}}" onfocus ="update_rdd_8({{$dpn_unique_id|ltrim:'0'}}, this.value);" />

<script>
	   
		function update_rdd_8(id,value)
		{
			 
			 $.ajax({
				   type: "GET",
				   url: "{{$BASE_URL}}proposal_report.update_rdd_8/dpn_unique_id/"+id+"/value/"+value,
					   success: function(result){
					}
				});
		}
</script>		

</td>
</tr>

<tr> 
<td>{{counter}}</td>
<td>Brochure Uploaded</td>
<td>{{$data8}}</td>
</tr>
    
</table>
<br />
<input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />

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

    
    <div id="modal01" class="w3-modal" onclick="this.style.display='none'">
  <span class="w3-button w3-hover-red w3-xlarge w3-display-topright">&times;</span>
  <div class="w3-modal-content w3-animate-zoom">
    <img id="img01" style="width:100%;">
  </div>
</div>

<script>
function onClick(element) {
  document.getElementById("img01").src = element.src;
  document.getElementById("modal01").style.display = "block";
}
</script>