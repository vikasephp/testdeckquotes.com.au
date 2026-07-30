<script type="text/javascript" language="javascript" src="{{$BASE_URL}}js/form_validator/gen_validatorv31.js"></script>  
<script type="text/javascript" src="{{$BASE_URL}}css/default/load.js"></script>
<link rel="stylesheet" type="text/css" href="{{$BASE_URL}}css/default/cis-styles2.css" />


<script type="text/javascript" src="{{$BASE_URL}}js/calendar/datepicker.js"></script>
<link type="text/css" rel="stylesheet" href="{{$BASE_URL}}js/calendar/datepicker.css">

<style>
.tabl {font-size:12px;}
.tbl td {font-size:12px;}
/*input[type="submit"], input[type="button"], input[type="reset"] {*/
 .butt {
   
    height: 100px;
    
    width: 100px;
    background: url(images/green.png) top repeat-x;
  
    color: #0C0;
    line-height: 25px;
    text-decoration: none;
    text-transform: uppercase;
    padding: 0 10px;
    behavior: url(images/PIE.htc);
    position: relative;
    cursor: pointer;
  
}
</style>


{{if $opr}}
<script type="text/javascript">
setTimeout('parent.close_win();', 500);
</script>
{{/if}}

<div align="center" style="min-height:350px;"><br />
    <h3 class="page-title">Traffic Light</h3>    
<br />
   <h3>To select the color - Click on the color box</h3><br /><br />
<form name="detail" method="post" action=""  enctype="multipart/form-data">
<table id="list-table" cellpadding="5" >
    <input type="hidden" name="dpn_unique_id" value="{{$dpn_unique_id}}" />
 
     <tr>
      <th><input type="submit" name="green" value=" " style="background: url({{$BASE_URL}}images/green.png); height:100px; width:100px;"></th>
      <th><input type="submit" name="orange" value=" " style="background: url({{$BASE_URL}}images/orange.png); height:100px; width:100px;"></th>
      <th><input type="submit" name="red" value=" " style="background: url({{$BASE_URL}}images/red.png); height:100px; width:100px;"></th>
    
    </tr> 
  
</table>
<br />
<input type="button" name="btnCancelDetail" value="Close" onclick="javascript:closepop();" class="vsml" />
</form>
    
    <script type="text/javascript">
		function closepop()
		{
		setTimeout('parent.close_win();', 500);
		}
	</script>
    
	
</div>

<script>
	initSample();
</script>