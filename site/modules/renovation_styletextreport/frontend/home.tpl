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

<div id="">
Enter Component To Search : <input id="myInput" type="text" placeholder="Search component..." style="width:400px;" >
<form name="style" method="post" action="">
    <table id="list-table" class="nav-back" width="100%">

<tbody id="myTable">
 <tr>
 
 {{assign var="ctr" value=1}}
 {{foreach from=$components key="key" item="item"}}
 
<!-- 	{{if $ctr % 4 eq 0 }}
 	 <tr bgcolor="#D3E8D6">
 	{{/if}}-->
    
     <td style="color:#000; text-align:left;"><input type="checkbox" name = "guide[{{$item.sf_id}}][]" />{{$item.sf_title}}<span style="color:#FFF"> ({{$item.sft_title}})</span> - {{$item.sf_component}} </td>
    
        
	{{if $ctr % 4 eq 0}}
 	 </tr>
     <tr>
 	{{/if}}
   {{assign var="ctr" value=$ctr+1}}
 {{/foreach}}

</tr>
</tbody>
</table>
<input type="submit" name="test" value="Generate Word Document " />
</form>
 </div>
 
