<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />
<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

	<script src="{{$BASE_URL}}ckeditor2/ckeditor.js"></script>
	<script src="{{$BASE_URL}}ckeditor2/samples/js/sample.js"></script>

	<script type="text/javascript">
           CKEDITOR.replace( 'editor1' );
           CKEDITOR.add  
        </script>

{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<script>
	var expanded = false;

	function showCheckboxes() {
	  var checkboxes = document.getElementById("checkboxes");
	  if (!expanded) {
		checkboxes.style.display = "block";
		expanded = true;
	  } else {
		checkboxes.style.display = "none";
		expanded = false;
	  }
	}

</script>



<style>

.multiselect {
  width: 280px;
  display:inline-block;
}

.selectBox {
  position: relative;
  
}

.selectBox select {
  width: 100%;
  font-weight: bold;
}

.overSelect {
  position: absolute;
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
}

#checkboxes {
  display: none;
  border: 1px #dadada solid;
    height: 150px;
  overflow-y:scroll;
}

#checkboxes label {
  display: block;
}

#checkboxes label:hover {
  background-color: #1e90ff;
}

</style>

<div align="center" style="min-height:350px;">
    <h3 class="page-title">{{$title}}</h3>    
   
   
<form name="detail" method="post" action="{{$XFA.detail}}"  enctype="multipart/form-data">
<table id="list-table" width="100%">
    <input type="hidden" name="{{$TABLE}}[{{$ID}}]" value="{{$detail.$ID}}" />
   {{if $error}} <tr><th colspan="2" style="color:#FF0000;">{{$error}}</th></tr>{{/if}}
   
    <tr>
     <th>Project</th>
     <td>
   	<datalist id='project'>
           {{foreach from=$projdetail key="key" item="item"}}
            <option value="{{$item.bsn_name}}" {{if $bsnid eq $item.bsn_id}} selected="selected" {{/if}}>
            {{$item.bsn_name}}
            </option>
            {{/foreach}}
  	 </datalist>
         <input type="text" list = 'project' name="{{$TABLE}}[car_project]" style ="width:700px" value="{{$detail.car_project}}" />
      </td>
    </tr>
   
    <tr>
     <th>Date</th>
     <td><input  type="text" name="{{$TABLE}}[car_date]"  value="{{$detail.car_date}}" id="demo1" class="w16em dateformat-d-ds-m-ds-Y dtpic" /> </td>
    </tr>
   
    <tr>
     <th>Alert</th>
     <td><!--<input  type="text" name="{{$TABLE}}[car_alert]"  value="{{$detail.car_alert}}" style="width:700px;" /> -->
         <textarea  cols="180" rows="5" name="{{$TABLE}}[car_alert]" id="editor1" class="ckeditor" >{{$detail.car_alert}}</textarea>
     
     </td>
    </tr>
  
   
  <tr>
  <th> Upload Photos </th> 
  <td> <input type="file" name="image1" id = "file1" onchange="chng1()"/>
       <input type="file" name="image2" id = "file2" onchange="chng2()"/>
       <input type="file" name="image3" id = "file3" onchange="chng3()"/>
       <input type="file" name="image4" id = "file4" onchange="chng4()"/>
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
  <th>Attachment Preview</th>
  <td>
   {{if $detail.car_image1}}
     <div style="text-align:left;">Photo 1 :  <a href="{{$BASE_URL}}files/uploads/{{$detail.car_image1}}" target="_blank">Preview</a>
     <a href="{{$BASE_URL}}construction_alert_report.docdelete/id/{{$detail.car_id}}/p/1"><img src="{{$BASE_URL}}/css/admin/images/deletecross.png" /></a>
     </div>
   {{/if}}
   
    {{if $detail.car_image2}}
     <div style="text-align:left;">Photo 2 :  <a href="{{$BASE_URL}}files/uploads/{{$detail.car_image2}}" target="_blank">Preview</a>
    <a href="{{$BASE_URL}}construction_alert_report.docdelete/id/{{$detail.car_id}}/p/2"><img src="{{$BASE_URL}}/css/admin/images/deletecross.png" /></a>
</div>
   {{/if}}
   
    {{if $detail.car_image3}}
     <div style="text-align:left;">Photo 3 :  <a href="{{$BASE_URL}}files/uploads/{{$detail.car_image3}}" target="_blank">Preview</a>
    <a href="{{$BASE_URL}}construction_alert_report.docdelete/id/{{$detail.car_id}}/p/3"><img src="{{$BASE_URL}}/css/admin/images/deletecross.png" /></a>
</div>
   {{/if}}
   
    {{if $detail.car_image4}}
     <div style="text-align:left;">Photo 4 :  <a href="{{$BASE_URL}}files/uploads/{{$detail.car_image4}}" target="_blank">Preview</a>
    <a href="{{$BASE_URL}}construction_alert_report.docdelete/id/{{$detail.car_id}}/p/4"><img src="{{$BASE_URL}}/css/admin/images/deletecross.png" /></a>
</div>
   {{/if}}
   
    {{if $detail.car_image5}}
     <div style="text-align:left;">Photo 5 :  <a href="{{$BASE_URL}}files/uploads/{{$detail.car_image5}}" target="_blank">Preview</a>
     <a href="{{$BASE_URL}}construction_alert_report.docdelete/id/{{$detail.car_id}}/p/5"><img src="{{$BASE_URL}}/css/admin/images/deletecross.png" /></a>
</div>
   {{/if}} 
    
        
  </td>
  </tr> 
 
   
    <tr>
     <th>Type </th>
     <td>
<!--        <select name="{{$TABLE}}[car_type]" style="width:300px;"/>
           {{foreach from=$typedetail key="key4" item="item4"}}
          <option value="{{$item4.cp_type}}"  {{if $detail.car_type == $item4.cp_type}}selected{{/if}}>{{$item4.cp_type}}</option>
          {{/foreach}}
        </select>-->
     
     <div class="multiselect" >
     <div class="selectBox" onclick="showCheckboxes()" >
      <select>
        <option>Select Type</option>
      </select>
      <div class="overSelect"></div>
     </div>
     <div id="checkboxes">
    
     {{foreach from=$typedetail key="key4" item="item4"}}
    	<label for="one{{$item.po_id}}">
        <input type="checkbox" id="one_{{$item.car_id}}" name="{{$TABLE}}[car_type][]" value="{{$item4.cp_type}}" />{{$item4.cp_type}}</label>
     {{/foreach}}
     </div>
     </div>
     
      </td>
    </td>
    </tr>  
   
    <tr>
     <th>Urgency </th>
     <td><select name="{{$TABLE}}[car_urgency]" style="width:300px;"/>
          <option value="150"   {{if  $detail.car_urgency == ''}}selected{{/if}}>Please Select</option>
          {{foreach from=$todetail key="key3" item="item3"}}
          <option value="{{$item3.pr_id}}"  {{if $detail.car_urgency == $item3.pr_id}}selected{{/if}}> {{$item3.pr_priority}}</option>
          {{/foreach}}
        </select>  
    </td>
    </tr>  
   
   
    <tr>
     <th>Due Date</th>
     <td><input  type="text" name="{{$TABLE}}[car_new_date]"  value="{{$detail.car_new_date}}" id="demo2" class="w16em dateformat-d-ds-m-ds-Y dtpic" /> </td>
    </tr>
  
<!--  
    
     <tr>
     <th>Responsible Staff</th>
     <td> 
        <select name="{{$TABLE}}[car_resp_staff]" >
                <option value="">Please Select </option>
                {{foreach from = $who key="key4" item="item4"}}
                <option value="{{$item4.to_option}}" {{if $item4.to_option eq $detail.car_resp_staff}} selected="selected" {{/if}}>{{$item4.to_option}}</option>
                {{/foreach}}
        </select>
     
     </td>
    </tr>-->
    
    <tr>
     <th>Status </th>
     <td><select name="{{$TABLE}}[car_status]" style="width:300px;"/>
         <!--        <option value="Open"   {{if  $detail.car_status == 'Open'}}selected{{/if}}>Open</option>
                 <option value="Closed" {{if  $detail.car_status == 'Closed'}}selected{{/if}}>Closed</option>-->
                 
            
                {{foreach from = $statusdata key="key5" item="item5"}}
                <option value="{{$item5.to_option}}" {{if $item5.to_option eq $detail.car_status}} selected="selected" {{/if}}>{{$item5.to_option}}</option>
                {{/foreach}}
        </select>  
    </td>
    </tr> 
    
     <tr>
     <th>Created By </th>
     <td><select name="{{$TABLE}}[car_created_by]" style="width:300px;"/>
          <option value=""   {{if  $detail.car_created_by == ''}}selected{{/if}}>Please Select</option>
          {{foreach from=$cbdata key="key4" item="item4"}}
         <!-- <option value="{{$item4.cs_primary_email}}"  {{if $detail.car_created_by == $item4.cs_primary_email}}selected{{/if}}>{{$item4.cs_position}} - {{$item4.cs_first_name}} {{$item4.surname}} - {{$item4.cs_primary_email}}</option>
       -->    <option value="{{$item4.po_name_eml}}"  {{if $detail.car_created_by == $item4.po_name_eml}}selected{{/if}}>{{$item4.po_name_eml}}</option>
       
          {{/foreach}}
        </select>  
    </td>
    </tr>  
     
    
     <tr>
        <td colspan="2" style="text-align:center;">
          <input type="submit" name="subAddDetail" value="Save" class="vsml" />
          <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
        </td>
    </tr>
</table>
</form>
    
    <script type="text/javascript">
		function closepop()
		{
		setTimeout('parent.close_win();', 500);
		}
	</script>
    
	<script type="text/javascript" language="javascript" >
        var frmvalidator  = new Validator("detail");
			frmvalidator.EnableMsgsTogether();
			frmvalidator.addValidation("{{$TABLE}}[wa_project]","req", "Please specify project.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_company_name]","req", "Please specify company name.");
			//frmvalidator.addValidation("{{$TABLE}}[cl_contact_name]","req", "Please specify contact name.");
    </script>
</div>
