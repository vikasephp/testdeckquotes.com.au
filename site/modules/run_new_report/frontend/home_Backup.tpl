
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

{{if empty($pid)}}

<form name="detail" method="post" action="" enctype="multipart/form-data">
<datalist id='project'>
   {{foreach from=$projdetail2 key="key3" item="item3"}}
    <option value="{{$item3.bsn_id}} | {{$item3.bsn_name}} | {{$item3.bcust_fname}} {{$item3.bcust_lname}}" {{if $bsnid eq $item3.bsn_id}} selected="selected" {{/if}}>
    {{$item3.bsn_id}} - {{$item3.bsn_name}} | {{$item3.bcust_fname}} {{$item3.bcust_lname}}
    </option>
    {{/foreach}}
</datalist>
         <input type="text" list = 'project' name="projname1" style ="width:700px" value="{{$p_c_name}}" />
         <input type ="submit" name="psub" value="Submit"   />

</form>
{{/if}}
{{if $pid}}

<div id="">
<div style="padding-top:5px; margin-bottom:15px;font-size:15px; font-weight:bold;"> Project Name : {{$project}} </div>

Enter Component To Search : <input id="myInput" type="text" placeholder="Search component..." style="width:400px;" >
<form name="style" method="post" action="">

 <table id="list-table" class="nav-back" width="100%">

<tbody id="myTable">
 <tr>
 
 {{assign var="ctr" value=1}}
 {{foreach from=$docdata key="key" item="item"}}
 
	<td style="color:#000; text-align:left;"><input type="checkbox" name = "doc[{{$item.doc_id}}][]" /><span style="color:#FFF">(dcl) {{$item.admin_doc_name}}</span></td>
        
	{{if $ctr % 4 eq 0}}
 	 </tr>
     <tr>
 	{{/if}}
   {{assign var="ctr" value=$ctr+1}}
 {{/foreach}}
<!--<tr><td colspan="4"> Proposal </td></tr>-->


 {{foreach from=$docdata_p key="key" item="item"}}
 
	<td style="color:#000; text-align:left;"><input type="checkbox" name = "doc2[{{$item.doc_id}}][]" /><span style="color:#FFF">(pro) {{$item.admin_doc_name}}</span></td>
        
	{{if $ctr % 4 eq 0}}
 	 </tr>
     <tr>
 	{{/if}}
   {{assign var="ctr" value=$ctr+1}}
 {{/foreach}}


 {{foreach from=$docdata_f key="key" item="item"}}
 
	<td style="color:#000; text-align:left;"><input type="checkbox" name = "doc3[{{$item.bd_id}}][]" /><span style="color:#FFF">(fin) {{$item.bd_type}}</span></td>
        
	{{if $ctr % 4 eq 0}}
 	 </tr>
     <tr>
 	{{/if}}
   {{assign var="ctr" value=$ctr+1}}
 {{/foreach}}

 {{foreach from=$docdata_c key="key" item="item"}}
 
	<td style="color:#000; text-align:left;"><input type="checkbox" name = "doc3[{{$item.bd_id}}][]" /><span style="color:#FFF">(Document Dcustom) {{$item.bd_type}}</span></td>
        
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

 {{foreach from=$docdetail key="key" item="item"}}
  <p>{{$item.admin_doc_name}}</p>
 {{/foreach}}
 
 
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

<body><div id="jquery-script-menu123">
<div class="jquery-script-center">

<!--<div class="jquery-script-clear"></div>-->
</div>
</div>
<h1 style="margin-top:150px;">Accessible, Touch-Friendly and Drag &amp; Drop Html List Demo</h1>
<form name="doclist"  method="post" action="">
<div id = "sort-it">
  <ol>
   {{foreach from=$docdetail key="key" item="item"}}
    <li>{{$item.admin_doc_name}} | {{$item.doc_file_name}} | {{$key}}
    <input type="hidden" name="docs[{{$key}}][{{$item.type}}]" value="{{$key}}" />
     
<!--  <label for="custom-number-{{counter}}">New order:</label>
      <input id="custom-number-{{counter}}" name="custom-number-{{counter}}" type="number" min="1">-->
    </li>
   
   {{/foreach}} 
  </ol>
<!--  <input type="submit" id="manual-sort" name="manual-sort" value="Update">-->
  <input type="submit" name="submitdoc" value="Submit">

 </div> 
</form>
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