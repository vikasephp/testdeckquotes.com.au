{{include file=$jdata}}
{{include file=$tiny_basic}}		
<h3 class="page-title">{{$title}}</h3>
{{if $msg}} <h3 style="font-size:18px; color:#639; padding-bottom:15px;"> {{$msg}} </h3> {{/if}}

<script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>-->
<script>
$(document).ready(function(){
  $("#myInput2").on("keyup", function() {
    var value = $(this).val().toLowerCase();
	//alert(value);
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>

<style>
/* Popup box BEGIN */
.hover_bkgr_fricc{
    background:rgba(0,0,0,.4);
    cursor:pointer;
    display:none;
    height:100%;
    position:fixed;
    text-align:center;
    top:0;
    width:100%;
    z-index:10000;
}
.hover_bkgr_fricc .helper{
    display:inline-block;
    height:100%;
    vertical-align:middle;
	text-align:left;
}
.hover_bkgr_fricc > div {
    background-color: #fff;
    box-shadow: 10px 10px 60px #555;
    display: inline-block;
    height: auto;
    max-width: 551px;
    min-height: 100px;
    vertical-align: middle;
    width: 60%;
    position: relative;
    border-radius: 8px;
    padding: 15px 5%;
	
}
.popupCloseButton {
    background-color: #fff;
    border: 3px solid #999;
    border-radius: 50px;
    cursor: pointer;
    display: inline-block;
    font-family: arial;
    font-weight: bold;
    position: absolute;
    top: -20px;
    right: -20px;
    font-size: 25px;
    line-height: 30px;
    width: 30px;
    height: 30px;
    text-align: center;
}
.popupCloseButton:hover {
    background-color: #ccc;
}
.trigger_popup_fricc {
    cursor: pointer;
    font-size: 20px;
    margin: 20px;
    display: inline-block;
    font-weight: bold;
}
/* Popup box BEGIN */
</style>


<div id="">
Enter Component To Search : <input id="myInput2" type="text" placeholder="Search component..." style="width:400px;" >
<form name="style" method="post" action="">
<table id="list-table" class="nav-back" width="100%">

 <tbody id="myTable">
 <tr>
 
 {{assign var="ctr" value=1}}
 {{foreach from=$components key="key" item="item"}}
   <script>
   
	$(window).load(function () {
		$("#pop_{{$ctr}}").click(function(){
			  if ($(this).is(':checked')) {
		          $('#popdiv{{$ctr}}').show();
		       }
           
		});
	
		$('.popupCloseButton').click(function(){
			$('#popdiv{{$ctr}}').hide();
		});
		
		$('.close').click(function(){
			$('#popdiv{{$ctr}}').hide();
		});
	});
	
  </script>

   
   <td style="color:#000; text-align:left;"><input type="checkbox" name = "guide[{{$item.sf_id}}][sf_id]"  id="pop_{{$ctr}}"/>
   {{$item.sf_title}}<span style="color:#FFF"> ({{$item.sft_title}})</span> - {{$item.sf_component}} </td>
        
	{{if $ctr % 4 eq 0}}
 </tr>
     <tr>
 	{{/if}}

  <div class="hover_bkgr_fricc" id="popdiv{{$ctr}}">
    <span class="helper"></span>
    <div>
        <div class="popupCloseButton">X</div>
        <div style="text-align:left">
    
        <p><b>Please provide following Details</b> </p><br />
        <p style="height:30px;"> Unit Type : &nbsp; <strong> {{$item.sf_unit_type}}</strong></p>
        <input type="hidden" name="cpv" id="cpv" value="{{$item.sf_cost_price}}" />
        <p><span> Unit Value : &nbsp;  <input type="text" name="guide[{{$item.sf_id}}][unit_value]" id="uv" /></span></p><br />
        <p style="height:30px;"> Cost Price : &nbsp; <strong>${{$item.sf_cost_price}}</strong> </p>
        <p> Percent % : &nbsp;  <input type="text" name="guide[{{$item.sf_id}}][percentage]" id="per" /></p><br />
   		<input type="button" value="Close" class="close" />
        </div>
    </div>
</div>
   {{assign var="ctr" value=$ctr+1}}
   
  
 {{/foreach}}

</tr>
</tbody>
</table>

<input type="submit" name="test" value="Generate Word Document " />
</form>
 </div>