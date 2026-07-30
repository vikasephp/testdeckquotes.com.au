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
<th width="3%">Step Number</th>
<th width="20%">Description </th>
<th width="15%">Report Contact</th>
<th width="10%">Due Date</th>
<th width="10%">Date of Completion</th>
<th width="10%">Image</th>
<th width="10%">Responsible Staff</th>
<th width="8%">Email Report</th> 
<th width="6%">Action</th>
       
{{foreach from=$stdetail key="key" item="item"}}
<tr>
 
<td>{{counter}}</td>
<td>{{$item.apd_step_desc}}</td>
<td>
<datalist id='contact'>
           {{foreach from=$contactdetail key="key2" item="item2"}}
            <option value="{{$item2.cs_first_name}} {{$item2.cs_surname}}" >
           {{$item2.co_company_name}} - {{$item2.cs_first_name}} {{$item2.cs_surname}}
            </option>
            {{/foreach}}
  	 </datalist>
         <input type="text" list = 'contact' name="step[{{$item.apd_id}}][apd_who]" style ="width:300px" value="{{$item.apd_who}}" />

<!--<input type="text" name="step[{{$item.apd_id}}][apd_who]"  value="{{$item.apd_who}}"  style="width:200px;" />-->
   </td>

<td>
<input type="text" name="step[{{$item.apd_id}}][st_comp_date]"  value="{{$item.apd_comp_date}}" style="width:80px;" class="w16em dateformat-d-ds-m-ds-Y dtpic" /> 
</td>

<td><input type="text" name="step[{{$item.apd_id}}][apd_date_of_complete]" style="width:80px;" value="{{$item.apd_date_of_complete}}" class="w16em dateformat-d-ds-m-ds-Y dtpic" /></td>   
<td><input type="file" name="image1[{{$item.apd_id}}]" />
{{if $item.apd_image }} <img src="{{$BASE_URL}}files/cma/{{$item.apd_image}}" style="width:100%;cursor:pointer;" 
    onclick="onClick(this)" class="w3-hover-opacity"  /> {{/if}}
</td>
<td>
<select name="step[{{$item.apd_id}}][apd_res_staff]" >
                <option value="">Please Select </option>
                {{foreach from = $who key="key4" item="item4"}}
                <option value="{{$item4.to_option}}" {{if $item4.to_option eq $item.apd_res_staff}} selected="selected" {{/if}}>{{$item4.to_option}}</option>
                {{/foreach}}
        </select>


</td>
<td> 
        <form name ="recmet" method="post" action="">
     	<input type="hidden" name="email_report[{{$item.apd_id}}]" value="0" />
  	<label class="switch">
        <input class="switch-input" type="checkbox"  name="email_report[{{$item.apd_id}}]" value="1"  onclick="this.form.submit();" {{if $item.apd_email_report eq 1 }} checked="checked" {{/if}} />
        <span class="switch-label" data-on="Yes" data-off="No"></span> 
        <span class="switch-handle"></span> <br />
        </label>
        </form>
</td>


<td>
<a href="{{$BASE_URL}}construction_alert_report.add_steps/apd_id/{{$item.apd_id}}/car_id/{{$car_id}}" class="various" title="Edit"> 
     <img style="height:20px; width:20px;" src="{{$BASE_URL}}css/admin/images/edit.png"/></a>&nbsp;&nbsp;
     
 <a href="{{$BASE_URL}}construction_alert_report.delete_steps/apd_id/{{$item.apd_id}}/car_id/{{$car_id}}" onclick="javascript:if(!confirm('Are you sure want to delete the action step?')) return false;" title="Delete">     <img style="height: 16px;; width:16px" src="{{$BASE_URL}}css/admin/images/deletecross.png"/></a>

 </td>
</tr> 
      {{/foreach}}

</table><br /><br />
<span style="margin-right:10px; background: #09F; color:#FFF !important; padding:6px; margin-bottom:5px;"> 
<a href="{{$BASE_URL}}construction_alert_report.add_steps/car_id/{{$car_id}}" class="various" title="Edit" style="color:#FFF; text-decoration:none; font-size:14px;"> Add New Step </a>
</span>

<input type="submit" name="subAddDetail" value="Save" class="vsml" />
<input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
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