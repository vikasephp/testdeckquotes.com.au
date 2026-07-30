
{{include file=$jdata}}
{{include file=$tiny_basic}}		
<h3 class="page-title">{{$title}}</h3>
{{if $msg}} <h3 style="font-size:18px; color:#639; padding-bottom:15px;"> {{$msg}} </h3> {{/if}}

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
	    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>

<script>
var isChecked = true;
function checkAll(cls) {
	

	var checkboxes = document.getElementsByClassName(cls);
     if (isChecked) {
         for (var i = 0; i < checkboxes.length; i++) {
             if (checkboxes[i].type == 'checkbox') {
                 checkboxes[i].checked = true;
             }
         }
     } else {
         for (var i = 0; i < checkboxes.length; i++) {
             console.log(i)
             if (checkboxes[i].type == 'checkbox') {
                 checkboxes[i].checked = false;
             }
         }
     }
  isChecked = !isChecked;
 }
 
 
 
function add_procedure()
{
	var viewurl = "{{$BASE_URL}}mergereport.view_procedure"+ "/random/" + Math.random();	

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

<style>
.checkall { padding:7px; 
cursor:pointer;
background:#60C;
color:#FF0;
margin:5px;
}
#fancybox-wrap {z-index:9999999;}
</style>

<div style="float:left;">
<form name="proc">
&nbsp;<input type="button" name="proc_panel" value="Procedure Panel" onclick="javascript:add_procedure();" /> <br>
</form>
</div>
{{if empty($pid) && $download eq 'false'}}

<form name="detail" method="post" action="" enctype="multipart/form-data">
<datalist id='project'>
   {{foreach from=$projdetail2 key="key3" item="item3"}}
    <option value="{{$item3.bsn_id}} | {{$item3.bsn_name}} | {{$item3.bcust_fname}} {{$item3.bcust_lname}}" {{if $bsnid eq $item3.bsn_id}} selected="selected" {{/if}}>
    {{$item3.bsn_id}} - {{$item3.bsn_name}} | {{$item3.bcust_fname}} {{$item3.bcust_lname}}
    </option>
    {{/foreach}}
</datalist>
         <input type="text" list = 'project' name="projname1" style ="width:700px" value="{{$p_c_name}}" placeholder="Enter Project Name Or Project ID" />
         <input type ="submit" name="psub" value="Submit"   />

</form>
{{/if}}
{{if $pid && $pbox eq 'true'}}

<div id="">
<div style="padding-top:5px; margin-bottom:15px;font-size:15px; font-weight:bold;"> Project Name : {{$project}} </div>

Enter Component To Search : <input id="myInput" type="text" placeholder="Search component..." style="width:400px;" >
<form name="style" method="post" action="">
<input type = "hidden"  name="id" value="{{$pid}}" />
<input type="hidden" name="proj" value="{{$project}}" >

<br>
<!--<input type="submit" name="quickselect" value="Current Project Inclusions">-->

<!--<button type="button" class="checkall" onClick="checkAll('selectthis')">select/deselect</button>-->

 {{foreach from=$buttons key="keyb" item="itemb"}}
<button type="button" class="checkall" onClick="checkAll('selectthis_{{$itemb.mr_id}}')">{{$itemb.mr_button_name}}</button>
{{/foreach}}
<table id="list-table" class="nav-back" width="100%">
<tbody id="myTable">

<tr style="background:#63F;"><td colspan="4" style="padding:5px; text-align:center;"><span style="font-size:16px; color: #FF6; padding:5px;"> Document Checklist</span> </td></tr>
 <tr>
 
 {{assign var="ctr" value=1}}
 {{foreach from=$docdata key="key" item="item"}}
 
    
	<td style="color:#000; text-align:left;">
    {{if $item.admin_button_1 eq 1 }}
    <input type="checkbox" name = "doc[{{$item.doc_id}}][]" class="selectthis_1" />
    {{elseif $item.admin_button_2 eq 1 }}
    <input type="checkbox" name = "doc[{{$item.doc_id}}][]" class="selectthis_2" />
    {{elseif $item.admin_button_3 eq 1 }}
    <input type="checkbox" name = "doc[{{$item.doc_id}}][]" class="selectthis_3" />
    {{elseif $item.admin_button_4 eq 1 }}
    <input type="checkbox" name = "doc[{{$item.doc_id}}][]" class="selectthis_4" />
    {{elseif $item.admin_button_5 eq 1 }}
    <input type="checkbox" name = "doc[{{$item.doc_id}}][]" class="selectthis_5" />
    {{elseif $item.admin_button_6 eq 1 }}
    <input type="checkbox" name = "doc[{{$item.doc_id}}][]" class="selectthis_6" />
    {{elseif $item.admin_button_7 eq 1 }}
    <input type="checkbox" name = "doc[{{$item.doc_id}}][]" class="selectthis_7" />
    {{elseif $item.admin_button_8 eq 1 }}
    <input type="checkbox" name = "doc[{{$item.doc_id}}][]" class="selectthis_8" />
    {{elseif $item.admin_button_9 eq 1 }}
    <input type="checkbox" name = "doc[{{$item.doc_id}}][]" class="selectthis_9" />
    {{elseif $item.admin_button_10 eq 1 }}
    <input type="checkbox" name = "doc[{{$item.doc_id}}][]" class="selectthis_10" />
    {{elseif $item.admin_button_11 eq 1 }}
    <input type="checkbox" name = "doc[{{$item.doc_id}}][]" class="selectthis_11" />
    {{elseif $item.admin_button_12 eq 1 }}
    <input type="checkbox" name = "doc[{{$item.doc_id}}][]" class="selectthis_12" />
    
    {{else}}
    <input type="checkbox" name = "doc[{{$item.doc_id}}][]"  />
    {{/if}}
    {{$item.admin_doc_name}}
    
    </td>
        
	{{if $ctr % 4 eq 0}}
 	 </tr>
     <tr>
 	{{/if}}
   {{assign var="ctr" value=$ctr+1}}
 {{/foreach}}
<tr style="background:#63F;"><td colspan="4" style="padding:5px; text-align:center;"><span style="font-size:16px; color: #FF6; padding:5px;"> Proposal Document Checklist</span> </td></tr>
{{assign var="ctr" value=1}}
{{foreach from=$docdata_p key="key" item="item"}}
 
	<td style="color:#000; text-align:left;"><input type="checkbox" name = "doc2[{{$item.doc_id}}][]" />
    {{$item.admin_doc_name}}<span style="color:#FFF"> (Checklist Number - {{$item.dpn_unique_id}}) </span></td>
        
	{{if $ctr % 4 eq 0}}
 	 </tr>
     <tr>
 	{{/if}}
   {{assign var="ctr" value=$ctr+1}}
 {{/foreach}}

<tr style="background:#63F;"><td colspan="4" style="padding:5px; text-align:center;"><span style="font-size:16px; color: #FF6; padding:5px;">Financial Document</span> </td></tr>
{{assign var="ctr" value=1}}
 {{foreach from=$docdata_f key="key" item="item"}}
 
<td style="color:#000; text-align:left;"><input type="checkbox" name = "doc3[{{$item.bd_id}}][]" />
{{$item.bd_type}} <br> <span style="color:#FFF">(Date Uploaded - {{$item.bd_uploaded_date}}) </span></td>
        
	{{if $ctr % 4 eq 0}}
 	 </tr>
     <tr>
 	{{/if}}
   {{assign var="ctr" value=$ctr+1}}
 {{/foreach}}

<tr style="background:#63F;"><td colspan="4" style="padding:5px; text-align:center;"><span style="font-size:16px; color: #FF6; padding:5px;">Document Checklist Custom Document</span> </td></tr>
{{assign var="ctr" value=1}}
 {{foreach from=$docdata_c key="key" item="item"}}
 
	<td style="color:#000; text-align:left;"><input type="checkbox" name = "doc4[{{$item.bd_id}}][]" />{{$item.bd_type}}</td>
        
	{{if $ctr % 4 eq 0}}
 	 </tr>
     <tr>
 	{{/if}}
   {{assign var="ctr" value=$ctr+1}}
 {{/foreach}}


</tr>
</tbody>
</table>
<input type="submit" name="test" value="Submit" />
</form>
 </div>
 {{/if}}
 
 {{if $docdetail }} 


 <style class="cp-pen-styles">
body { font-family: sans-serif; }

#sort-it input { font-size: 1em; } /* prevent zoom in mobile */

#sort-it ol {
  /* list style is faked with number inputs */
  list-style: none;
  padding: 0;
}

#sort-it li {
  position: relative;
  min-height: 1em;
  cursor: move;
  padding: .5em .5em .5em 2.5em;
  background: #eee;
  border: 1px solid #ccc;
  margin: .25em 0;
  border-radius: .25em;
  max-width: 60em;
  text-align:left;
  font-size:14px;
}

#sort-it li input {
  /* Move these to visually fake the ol numbers */
  position: absolute;
  width: 2.75em;
  left: .25em;
  top: .25em;
  border: 0;
  text-align: right;
  background: transparent
}

#sort-it li label {
  /* visually hidden offscreen so it still benefits screen readers */
  position: absolute;
  left: -9999px;
}

/* sortable plugin styles when dragged */

#sort-it .dragged {
  position: absolute;
  opacity: 0.5;
  z-index: 2000;
}

#sort-it li.placeholder {
  position: relative;
  background: purple;
}
</style>
<link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">

<body>
<div id="jquery-script-menu123">
</div>
<div style="padding-top:5px; margin-bottom:15px;font-size:15px; font-weight:bold;"> Project Name : {{$project}} </div>
<h2 style="margin-top:15px; font-size:16px;">Click and Drag to order the list</h2>
<form name="doclist"  method="post" action="">
<div id = "sort-it">
  <ol>
   {{foreach from=$docdetail key="key" item="item"}}
   <!-- <li>{{$item.admin_doc_name}} | {{$item.doc_file_name}}-->
   <li>{{$item.admin_doc_name}} 
    <input type="hidden" name="docs[{{$key}}][{{$item.type}}]" value="{{$key}}" />
    </li>
   
   {{/foreach}} 
  </ol>

  <input type="submit" name="submitdoc" value="Submit" id ="submitBtn">

 </div> 
</form>

<div id="show" style="display:none; text-align:center;"><img src="{{$BASE_URL}}images/loading.gif" /> </div>

<!--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script> -->
<script type="text/javascript" src="{{$BASE_URL}}js/jquery-sortable-min.js"></script>
<script>
$(function(){
    // uses http://johnny.github.io/jquery-sortable/js/jquery-sortable-min.js
		$('#sort-it ol').sortable({
			onDrop: function(item) {
				$(item).removeClass("dragged").removeAttr("style");
				$("body").removeClass("dragging");

				getInitialOrder('#sort-it li');
			}
		});
        
		getInitialOrder('#sort-it li');
     
    //bind stuff to number inputs
		$('#sort-it ol input[type="number"]').focus(function(){
			$(this).select();	
		}).change(function(){
			updateAllNumbers($(this), '#sort-it input');
		}).keyup(function(){
			updateAllNumbers($(this), '#sort-it input');
		});
  
    //bind to form submission
    $('#sort-it').submit(function(e){
      reorderItems('#sort-it li', '#sort-it ol');
      e.preventDefault();
    })
    
}); // end doc ready
	
function getInitialOrder(obj){
		var num = 1;
		$(obj).each(function(){
       //set object initial order data based on order in DOM
			$(this).find('input[type="number"]').val(num).attr('data-initial-value', num); 
			num++;
		});
      $(obj).find('input[type="number"]').attr('max', $(obj).length); //give it an html5 max attr based on num of objects
}
	
function updateAllNumbers(currObj, targets){
        var delta = currObj.val() - currObj.attr('data-initial-value'), //if positive, the object went down in order. If negative, it went up.
                c = parseInt(currObj.val(), 10), //value just entered by user
                cI = parseInt(currObj.attr('data-initial-value'), 10), //original object val before change
                top = $(targets).length;
        
        //if the user enters a number too high or low, cap it
        if(c > top){
            currObj.val(top);
        }else if(c < 1){
            currObj.val(1);
        }
        
		$(targets).not($(currObj)).each(function(){ //change all the other objects
			var v = parseInt($(this).val(), 10); //value of object changed		
				
			if (v >= c && v < cI && delta < 0){ //object going up in order pushes same-numbered and in-between objects down
				$(this).val(v + 1);
			} else if (v <= c && v > cI && delta > 0){ //object going down in order pushes same-numbered and in-between objects up
				$(this).val(v - 1);
			}
		}).promise().done(function(){
			//after all the fields update based on new val, set their data element so further changes can be tracked 
			//(but ignore if no value given yet)
			$(targets).each(function(){
				if($(this).val() !== ""){
					$(this).attr('data-initial-value', $(this).val());
				}
			});
		});
}

function reorderItems(things, parent){
  for(var i = 1; i <= $(things).length; i++){
    $(things).each(function(){
      var x = parseInt($(this).find('input').val(), 10);
      if(x === i){
        $(this).appendTo(parent);
      }
    });
  }
}
</script>
 
 {{/if}}
 
 {{if $download eq 'true' }}
 <div style="margin-top:40px;"> <a href = "{{$BASE_URL}}files/merged/{{$fn}}" target="_blank" > 
 <span style=" background:#039; color:#FFF; padding:5px; font-weight:bold; border-radius:5px;"> Click here to download merged report </a> </span></div>
 <br><br>
 <div style="margin-top:40px;"> <a href = "{{$BASE_URL}}mergereport.home" > 
 <span style=" background:#039; color:#FFF; padding:5px; font-weight:bold; border-radius:5px;"> Click here to create another merge report </a> </span></div>
 {{/if}}
 
 <script type="text/javascript" language="javascript">

$(document).ready(function(){

    $("#submitBtn").click(function(){        
		
			 $('#show').css('display', 'block');
		
    });

});

</script>
 