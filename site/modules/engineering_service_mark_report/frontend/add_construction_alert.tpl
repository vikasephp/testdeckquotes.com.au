<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

{{if $opr}}
<script type="text/javascript">
window.location.href = "{{$BASE_URL}}cou_component_document_report.view_construction_alert/bsn_id/{{$bsn_id}}";
</script>
{{/if}}

<div align="center" style="min-height:350px; margin-top:50px; z-index:999999 !important;">
    <h3 class="page-title">Add/Edit New Alert</h3>    
    
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="car[bsn_id]" value="{{$bsn_id}}" />
   
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
    <tr>
     <th>Add Alert</th>
     <td>
     <textarea name="car[car_alert]" rows='7' cols='180'></textarea>
     </td>
    </tr>
   
     <tr>
     <th>Photos</th>
     <td>
  	   <input type="file" name="image1" id = "file1" onchange="chng1()"/> <br />
       <input type="file" name="image2" id = "file2" onchange="chng2()"/> <br />
       <input type="file" name="image3" id = "file3" onchange="chng3()"/> <br />
       <input type="file" name="image4" id = "file4" onchange="chng4()"/> <br />
       <input type="file" name="image5" id = "file5" onchange="chng5()"/>
       <script>

    function chng1()
    {
   		 var type1=document.getElementById("file1").value;
		 var res1 = type1.match(".jp");
		 var res2 = type1.match(/png/gi);

        if(res1 || res2)
        {
           // alert("sucess");
        }
        else
        {
            alert("Sorry only jpeg or png images are accepted");
            document.getElementById("file1").value=""; 
        }
    }
    
   
    function chng2()
    {
   	    var type1=document.getElementById("file2").value;
		var res1 = type1.match(".jp");
		var res2 = type1.match(/png/gi);

        if(res1 || res2)
        {
           // alert("sucess");
        }
        else
        {
            alert("Sorry only jpeg or png images are accepted");
            document.getElementById("file2").value=""; 
        }
    }
    
    function chng3()
    {
        var type1=document.getElementById("file3").value;
		var res1 = type1.match(".jp");
		var res2 = type1.match(/png/gi);

        if(res1 || res2)
        {
           // alert("sucess");
        }
        else
        {
            alert("Sorry only jpeg or png images are accepted");
            document.getElementById("file3").value=""; 
        }
    }
    function chng4()
    {
        var type1=document.getElementById("file4").value;
		var res1 = type1.match(".jp");
		var res2 = type1.match(/png/gi);

        if(res1 || res2)
        {
           // alert("sucess");
        }
        else
        {
            alert("Sorry only jpeg or png images are accepted");
            document.getElementById("file4").value=""; 
        }
    }

 function chng5()
    {
        var type1=document.getElementById("file5").value;
		var res1 = type1.match(".jp");
		var res2 = type1.match(/png/gi);

        if(res1 || res2)
        {
           // alert("sucess");
        }
        else
        {
            alert("Sorry only jpeg or png images are accepted");
            document.getElementById("file5").value=""; 
        }
    }
</script>
   
   
     </td>
    </tr>
 
 
    <tr>
        <td colspan="2" style="text-align:center;">
          <input type="submit" name="subAddDetail" value="Save" class="vsml" />
          <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:parent.$.fancybox.close();" class="vsml" />
        </td>
    </tr>
</table>
</form>
    
        <script type="text/javascript">
		function closepop()
		{
			window.location.href = "{{$BASE_URL}}cou_component_document_report.view_notes/os_id/{{$os_id}}";
		}
	</script>
    
	<script type="text/javascript" language="javascript" >
      	 	var frmvalidator  = new Validator("detail");
		frmvalidator.EnableMsgsTogether();
		frmvalidator.addValidation("type[wt_type_option]","req", "Please specify type.");
	</script>
</div>