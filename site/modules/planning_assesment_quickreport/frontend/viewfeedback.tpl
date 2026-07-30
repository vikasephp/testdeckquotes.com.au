
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles.css" />
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/style_manoj.css" />

{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);

</script>
{{/if}}

<div align="center">
<h3 class="page-title">View Feedback</h3><br />
<form name="detail" method="post" action="{{$XFA.alert}}" enctype="multipart/form-data" id="test">

 							
   
   {{if !$opr}}
            
<table id="viewdoc-table" width="100%" cellpadding="0" cellspacing="0" style="border:1px solid #999;border-collapse:collapse;"">
 <tr>
   <td style="width:10%;">Date </td>
   <td style="width:10%;">Source </td>
   <td style="width:10%;">Type </td>
   <td style="width:10%;">Person </td>
   <td style="width:70%;">Notes </td>
   
 </tr>  
{{foreach from=$detail key="key" item="item"}}
   <tr>
    <td> {{$item.sf_date}}</td>
    <td> {{$item.sfo_name}}</td>
    <td> {{$item.tfo_name}}</td>
    <td> {{$item.user_name}}</td>
    <td> {{$item.sf_notes}}</td>
   </tr>
 {{/foreach }}
   
       </table>  
  
                    <input type="button" name="btnCancelDetail" value="Close" onclick="javascript:parent.$.fancybox.close();" class="vsml" />
  

      
     {{else}}
     	<div style="font-size:24px; height:99px; padding-top:150px;">{{$opr}}</div> 
{{/if}}


  </form>


<script type="text/javascript" language="javascript" >
function show1(val) 
{
	//alert(val);
	if(val==1)
	 {
		 $('#one').show();
	 } else if(val==0) {
		 $('#one').hide();
	 }
}

function show2(val) 
{
	//alert(val);
	if(val==1)
	 {
		 $('#two').show();
	 } else if(val==0) {
		 $('#two').hide();
	 }
}

function show3(val) 
{
	//alert(val);
	if(val==1)
	 {
		 $('#three').show();
	 } else if(val==0) {
		 $('#three').hide();
	 }
}
</script>


</div>
